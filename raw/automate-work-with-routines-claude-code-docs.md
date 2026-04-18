---
source-url: https://code.claude.com/docs/en/routines
title: "Automate work with routines — Claude Code Docs"
fetched: 2026-04-18
---

# Automate work with routines

> Put Claude Code on autopilot. Define routines that run on a schedule, trigger on API calls, or react to GitHub events from Anthropic-managed cloud infrastructure.

A routine is a saved Claude Code configuration: a prompt, one or more repositories, and a set of connectors, packaged once and run automatically. Routines execute on Anthropic-managed cloud infrastructure, so they keep working when your laptop is closed.

Each routine can have one or more triggers attached to it:

* **Scheduled**: run on a recurring cadence like hourly, nightly, or weekly
* **API**: trigger on demand by sending an HTTP POST to a per-routine endpoint with a bearer token
* **GitHub**: run automatically in response to repository events such as pull requests or releases

A single routine can combine triggers. For example, a PR review routine can run nightly, trigger from a deploy script, and also react to every new PR.

Routines are available on Pro, Max, Team, and Enterprise plans with Claude Code on the web enabled. Create and manage them at claude.ai/code/routines, or from the CLI with `/schedule`.

Note: Routines are in research preview. Behavior, limits, and the API surface may change.

## Example use cases

**Backlog maintenance.** Schedule runs every weeknight against your issue tracker via a connector. Routine reads issues opened since last run, applies labels, assigns owners based on code area, posts summary to Slack.

**Alert triage.** Monitoring tool calls the routine's API endpoint when an error threshold is crossed. Routine pulls stack trace, correlates with recent commits, opens a draft pull request with proposed fix.

**Bespoke code review.** GitHub trigger runs on `pull_request.opened`. Routine applies team's review checklist, leaves inline comments for security/performance/style, adds summary comment.

**Deploy verification.** CD pipeline calls routine's API endpoint after production deploy. Routine runs smoke checks, scans error logs for regressions, posts go/no-go to release channel.

**Docs drift.** Schedule runs weekly. Routine scans merged PRs since last run, flags documentation referencing changed APIs, opens update PRs.

**Library port.** GitHub trigger runs on `pull_request.closed` filtered to merged PRs in SDK repo A. Routine ports the change to parallel SDK in language B, opens matching PR.

## Create a routine

Create a routine from the web, the Desktop app, or the CLI. All three surfaces write to the same cloud account. In the Desktop app, click **New task** and choose **New remote task** (choosing **New local task** creates a local Desktop scheduled task, not a routine).

The creation form sets up: prompt, repositories, environment, connectors, and triggers.

Routines run autonomously as full Claude Code cloud sessions: **no permission-mode picker and no approval prompts during a run**. The session can run shell commands, use skills committed to the cloned repository, and call any connectors you include. What a routine can reach is determined by: repositories selected + their branch-push setting, environment network access + variables, connectors included.

Routines belong to your individual claude.ai account. Not shared with teammates. Count against your daily run allowance. Anything the routine does through your connected GitHub identity or connectors appears as you.

### Create from the web

1. Visit claude.ai/code/routines, click **New routine**
2. Name + write prompt (most important — routine runs autonomously, prompt must be self-contained and explicit about success criteria). Model selector included.
3. Select repositories — each cloned at start of run from default branch. Claude creates `claude/`-prefixed branches. "Allow unrestricted branch pushes" setting removes prefix restriction.
4. Select environment — controls network access, env vars, setup script. Default environment provided.
5. Select trigger (one or more types)
6. Review connectors — all MCP connectors included by default, remove what routine doesn't need
7. Click Create

### Create from CLI

`/schedule` in any session to create conversationally. Or pass description: `/schedule daily PR review at 9am`. CLI creates **scheduled routines only** — to add API or GitHub triggers, edit routine on web.

CLI management: `/schedule list`, `/schedule update`, `/schedule run`.

### Create from Desktop

Open **Schedule** page, click **New task**, choose **New remote task**.

## Configure triggers

### Schedule trigger

Presets: hourly, daily, weekdays, weekly. Local timezone entered, converted automatically. Runs may start a few minutes after scheduled time due to stagger. For custom cron (like every 2 hours), pick closest preset then `/schedule update` to set cron expression. **Minimum interval: 1 hour**.

### API trigger

HTTP endpoint with bearer token per routine. POST to endpoint starts new session, returns session URL. Wire Claude Code into alerting systems, deploy pipelines, internal tools.

API triggers added from web only. CLI cannot create/revoke tokens.

Steps: Edit routine → Add trigger → API → Copy URL + Generate token (shown once, cannot retrieve later).

Call format:

```bash
curl -X POST https://api.anthropic.com/v1/claude_code/routines/trig_01ABCDEFGHJKLMNOPQRSTUVW/fire \
  -H "Authorization: Bearer sk-ant-oat01-xxxxx" \
  -H "anthropic-beta: experimental-cc-routine-2026-04-01" \
  -H "anthropic-version: 2023-06-01" \
  -H "Content-Type: application/json" \
  -d '{"text": "Sentry alert SEN-4521 fired in prod. Stack trace attached."}'
```

Response:
```json
{
  "type": "routine_fire",
  "claude_code_session_id": "session_01HJKLMNOPQRSTUVWXYZ",
  "claude_code_session_url": "https://claude.ai/code/session_01HJKLMNOPQRSTUVWXYZ"
}
```

`text` field is optional freeform string (not parsed). If you send JSON, routine receives it as literal string.

Beta header `experimental-cc-routine-2026-04-01` — breaking changes ship behind new dated header versions, two most recent previous versions continue to work.

### GitHub trigger

Starts new session automatically on matching repository event. Each matching event = own session. **Per-routine and per-account hourly caps during research preview** — events beyond limit are dropped.

Setup: Edit routine → Add trigger → GitHub event → Install Claude GitHub App (required; `/web-setup` grants repo cloning access but does NOT install the app).

**Supported event categories**:
- **Pull request**: opened, closed, assigned, labeled, synchronized, etc.
- **Release**: created, published, edited, deleted

**Filter fields** for pull requests: Author, Title, Body, Base branch, Head branch, Labels, Is draft, Is merged. Operators: equals, contains, starts with, is one of, is not one of, **matches regex** (tests entire field value — use `.*hotfix.*` for substring).

Example filter combinations:
- Auth module review: base=main, head contains `auth-provider`
- Ready-for-review only: is draft = false
- Label-gated backport: labels include `needs-backport`

## Manage routines

Detail page shows: repositories, connectors, prompt, schedule, API tokens, GitHub triggers, past runs.

Click any run → full session UI → review changes, create PR, continue conversation.

Controls:
- **Run now** — start run immediately
- **Pause/resume** — toggle in Repeats section
- **Edit** pencil icon — change name/prompt/repos/environment/connectors/triggers
- **Delete** — past sessions remain in list

**Branch permissions**: Claude can only push to `claude/`-prefixed branches by default. Toggle **Allow unrestricted branch pushes** per repository to remove restriction.

**Connectors**: all connected MCP connectors included by default on routine creation. Remove unneeded ones to limit Claude's access.

**Environments**: each routine runs in a cloud environment. Pre-configure for API keys, setup scripts, network scope.

## Usage and limits

Routines draw down subscription usage same as interactive sessions. Plus routines have **daily cap on runs per account**. View at claude.ai/code/routines or claude.ai/settings/usage.

When hit daily cap or subscription limit: orgs with extra usage enabled can continue on metered overage. Without extra usage, additional runs rejected until window resets. Enable extra usage from **Settings > Billing**.

## Related resources

* `/loop` and in-session scheduling — local tasks within open CLI session
* Desktop scheduled tasks — run on your machine with access to local files
* Cloud environment — configure runtime for cloud sessions
* MCP connectors — Slack, Linear, Google Drive
* GitHub Actions — run Claude in CI pipeline on repo events
