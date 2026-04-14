---
title: "零基礎用 AI 做遊戲：不花一分錢，從陽春到華麗的全過程"
source: "https://www.youtube.com/watch?v=SeiG9ZrLcBc&t=4s"
author:
  - "[[Debug 土撥鼠]]"
published: 2026-03-08
created: 2026-04-14
description: "不會寫程式、沒做過遊戲，但我想挑戰：能不能靠 AI 做出真的能玩的遊戲？結論是——可以，而且不只一款，我做了五款。從最簡單的 Candy Crush，到規則複雜的台灣麻將，再到有華麗技能的 Vampire Survivors 類遊戲，甚至還挑戰了 3D 的煮過頭、以及一款全新的原創派對遊戲。最後我更進一步：不花一分錢，用免費 AI 工具生成角色圖片、動畫、音樂，做出一款有完整美術的 2."
tags:
  - "clippings"
---
![](https://www.youtube.com/watch?v=SeiG9ZrLcBc)

不會寫程式、沒做過遊戲，但我想挑戰：能不能靠 AI 做出真的能玩的遊戲？  
結論是——可以，而且不只一款，我做了五款。  
  
從最簡單的 Candy Crush，到規則複雜的台灣麻將，再到有華麗技能的 Vampire Survivors 類遊戲，甚至還挑戰了 3D 的煮過頭、以及一款全新的原創派對遊戲。  
  
最後我更進一步：不花一分錢，用免費 AI 工具生成角色圖片、動畫、音樂，做出一款有完整美術的 2.5D 街機遊戲。  
  
📌 這支影片你會看到：  
  
1️⃣ 怎麼選遊戲引擎？（Godot vs Love2D，各適合什麼場景）  
2️⃣ AI 寫遊戲的真實流程：從陽春原型 → 一步步修到能玩  
3️⃣ 不花錢做美術的完整工作流：Gemini 生圖 → Grok 生動畫 → Blender 去背 → Suno 配樂  
  
📌 使用工具  
Claude Code / Godot / Love2D / Gemini（Banana 2）/ Grok / Blender / Suno  
  
📌 相關連結（補上你的連結）  
遊戲試玩：https://pjwang2022.itch.io/cycle-of-the-fallen  
Godot：https://godotengine.org/  
Love2D：https://love2d.org/  
Gemini：https://gemini.google.com/  
Grok：https://grok.com  
Suno：https://suno.com/  
Blender：https://www.blender.org/  
素材提示詞：https://gist.github.com/pjwang2022/6b4d0c43776ea054084c025319968056  
  
0:00 開場：不寫一行程式碼就能做遊戲？  
0:05 遊戲引擎是什麼？為什麼需要它  
0:22 挑選引擎的兩個條件＋Godot 介紹  
0:54 第一款：Candy Crush  
1:06 第二款：台灣麻將  
1:32 第三款：Vampire Survivors 類遊戲  
2:30 迭代流程  
3:23 第四款：原創派對遊戲  
4:24 第五款：3D Overcooked 復刻挑戰  
4:57 終極挑戰：不花一分錢做出有美術的遊戲  
5:00 免費 AI 美術工作流  
6:16 Grok 圖生影片  
6:53 Blender 影片去背教學（完整步驟）  
7:17 Suno 生成遊戲配樂  
7:45 最終成果展示  
7:54 結語  
  
#AI做遊戲 #ClaudeCode #Godot #Love2D #遊戲開發 #零基礎 #免費AI工具 #獨立遊戲 #GameDev #VampireSurvivors #CandyCrush #Overcooked

## Transcript

### Intro: Making games without writing a single line of code?

**0:00** · Without writing a single line of code you can make all these games Today I'll show you how to make your own game Before making a game we first need to choose a game engine A game engine is the ultimate toolkit for making games It makes characters run jump and fight It makes buttons responsive It handles object collisions It keeps the screen updating every second Without it a game is just a bunch of images placed together I had two criteria for choosing a game engine First everything can be generated entirely through code Second the GUI has MCP integration, even better By the way I've never made a game before and I don't know any game programming languages So rest assured you can follow along with my approach My first choice was the Godot game engine Godot is a free and open-source game engine that lets you quickly create 2D and 3D games It mainly uses GDScript, similar to Python syntax Easy to read and learn Plus it's free and lightweight Many popular games were also made with Godot Like the shooter Brotato The mining and defense game Dome Keeper The inventory strategy game Backpack Battles and the Pokémon-style RPG Cassette Beasts For my first attempt, I chose the well-known game Candy Crush The rules of this game are very simple Just give a prompt and you get a basic version And Claude Code codes incredibly fast Done in less than ten minutes Next I tried making a game with more complex rules than Candy Crush a Mahjong game As you can see although it looks basic it understands Pong Chi Kong and other rules It can even calculate the score Overall the rules are correct It's just a bit bare-bones But getting to this point only took less than an hour The first two games might seem too basic to everyone Although AI can make them they're not fun and look ugly So for the third attempt I wanted to make it more realistic and more fun I often see ads for similar games I wanted to recreate one with flashier animations and skills I wanted it to be more satisfying to play Here's a little tip Just ask AI what this type of game is called It saves a lot of back-and-forth For example, AI told me this type of game is similar to Vampire Survivors gameplay So I can directly prompt "make me a similar game" After the first phase was done it was already in a playable state Maybe still ugly but at least you can iterate on a solid foundation without going off track The simplest way to improve is to fix whatever you see For example, the character looks ugly so ask it to change to pixel art style Then after fixing the character, the floor looks ugly so tell it to change the floor style The floor gets fixed too At this stage you can tell with enough time it should be achievable After round after round of adjustments swapping assets adding sound effects fixing layout issues finally It finally became the satisfying game I was hoping for Game link is below Feel free to try it out What if instead of recreating a game we ask AI to make a brand new game from scratch?

### What is a game engine? Why do you need one

### Two criteria for choosing an engine + Godot intro

### Game #1: Candy Crush

### Game #2: Taiwanese Mahjong

### Game #3: Vampire Survivors-style game

### The iteration process

**2:44** · Is it possible?

**2:44** · 2D Party Multiplayer Simple controls I wanted to combine these elements that I love into a game After discussing with AI specifically, it combines a stair-climbing game, party game plus Mario Kart mechanics all fused into a new game The gameplay is four players keep jumping upward to grab the flag Along the way there are items to pick up Items work like Mario Kart There are rockets spring shoes you can even swap positions with first place It started out very basic A simple and fun little game After my constant refinements I even added eight characters eight levels and many more gameplay possibilities I even added online multiplayer to try playing remotely with friends So making a brand new game with AI is totally doable It just takes a lot of time chatting with AI By the way this game was made with the Love2D engine which uses the Lua language More suited for 2D games The recently popular Balatro was also developed in Lua At this point you'll realize the programming language really doesn't matter because AI writes everything AI handles the debug too So beginners can use it with confidence Besides 2D games let's also challenge making 3D games with Godot First we go to this website to download some free 3D model assets Then directly feed the assets to AI and tell it I want to make something like Overcooked Ask it to generate the visuals The process easily produces bug Like characters clipping through walls Or it loves to render things as text Just like the previous games fix issues one by one Let's see the result It's already about 80% there And it's actually playable At this point I wonder if you feel the same way We all know Claude Code is impressive, sure But making a game isn't just about code There's game design music and sound effects and great art is needed Without these just knowing how to code is useless So I wanted to challenge myself without spending a penny on AI tools to make a game that looks good enough Currently, 3D game assets can't be perfectly generated for free yet So I focused on 2.5D games I wanted to make an arcade-style game The hero spawns on the far left and fights all the way to the right With many enemies blocking the way Let's see the result Every visual here was generated by free AI Including these animations I recommend four useful tools Banana 2 Grok for image-to-video Suno for music generation Blender for video background removal Let's start with the Claude Code generated prototype The mechanics and gameplay are smooth No issues Next, what we need to do is One Replace the images Two Create character animations Three Generate sound effects For images, I directly asked Claude Code to give me all the prompts needed for each asset So I could paste them directly into Gemini Banana 2 for image generation Here you can see the backgrounds and floors are generated correctly as I wanted If you want to remove backgrounds crop or resize you can do post-processing yourself For images that aren't full-screen like characters or items I recommend adding at the end of the prompt #00FF00 background meaning a green background making it easier to remove later Images generated by Gemini have a star watermark in the bottom right First cover it with a green block Select any area Copy Paste Drag to the bottom right corner Save We'll need this later For items, Gemini directly generates sprite sheet breakdowns After removing the background you can cut each frame to make animations Click the pen icon at the top Select the second tool from the left Click and select the green area, drag down Now you can see the selected area Press Delete to remove the background All prompts are in the link below Feel free to use them Next we'll use Grok's image-to-video feature to animate our character Click Imagine Upload the image Select make video Enter the action you want For example, punch left and right continuously facing right If you're not satisfied, regenerate Grok has plenty of free credit to use Next we'll use Blender to remove the video background Click Video Edit Import the video Trim to the segment you want About fifteen frame should be enough Select the third option Output Set the last frame position Choose the output folder location Select Image Select RGBA Next we need a filter to remove the green Click on the video, then Click Modifier Add Modifier Compositor New Switch the panel to the left Change the view Switch to Compositor Click the button left of New Select Add first Keying then Keying inside Connect the wires Select the color Use the eyedropper to pick the green from the screen Done Click Render Render Animation It will appear in the folder Next, directly give the folder to Claude Code and tell it to replace the animations You can use the same process and method to generate walking running jumping attack animations and more We've completed the character creation Animation creation Now let's do the music I also asked Claude Code to generate prompt for music that fits this game I pasted the prompt directly into Suno to generate the soundtrack If you don't pay you won't have the rights to the generated music Keep that in mind Finally, give the music file to Claude Code and you're done Let's see the final result That's it for today's video Overall it went pretty smoothly Today I only made one level for each To make a complete game it would take more time Feel free to try it out If you liked it hit like subscribe and turn on notifications See you next time Bye bye