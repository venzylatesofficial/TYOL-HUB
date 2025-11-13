local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "TYOUL HUB",
   LoadingTitle = "Free Script",
   LoadingSubtitle = "by TYOUL",
   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Example Hub"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },
   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Key | Youtube Hub",
      Subtitle = "Key System",
      Note = "Key In Discord Server",
      FileName = "YoutubeHubKey1", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = false, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = true, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"https://pastebin.com/raw/AtgzSPWK"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local MainTab = Window:CreateTab("Home", nil) -- Title, Image
local MainSection = MainTab:CreateSection("Main")

Rayfield:Notify({
   Title = "Jangan Lupa Follow Tiktok Kami",
   Content = "TyoulHUB",
   Duration = 5,
   Image = 13047715178,
   Actions = { -- Notification Buttons
      Ignore = {
         Name = "Okay!",
         Callback = function()
         print("The user tapped Okay!")
      end
   },
},
})



local Button = MainTab:CreateButton({
   Name = "Infinite Jump Toggle",
   Callback = function()
       --Toggles the infinite jump between on or off on every script run
_G.infinjump = not _G.infinjump

if _G.infinJumpStarted == nil then
	--Ensures this only runs once to save resources
	_G.infinJumpStarted = true
	
	--Notifies readiness
	game.StarterGui:SetCore("SendNotification", {Title="Youtube Hub"; Text="Infinite Jump Activated!"; Duration=5;})

	--The actual infinite jump
	local plr = game:GetService('Players').LocalPlayer
	local m = plr:GetMouse()
	m.KeyDown:connect(function(k)
		if _G.infinjump then
			if k:byte() == 32 then
			humanoid = game:GetService'Players'.LocalPlayer.Character:FindFirstChildOfClass('Humanoid')
			humanoid:ChangeState('Jumping')
			wait()
			humanoid:ChangeState('Seated')
			end
		end
	end)
end
   end,
})

local Slider = MainTab:CreateSlider({
   Name = "WalkSpeed Slider",
   Range = {1, 350},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 16,
   Flag = "sliderws", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (Value)
   end,
})

local Slider = MainTab:CreateSlider({
   Name = "JumpPower Slider",
   Range = {1, 350},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 16,
   Flag = "sliderjp", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = (Value)
   end,
})


local Input = MainTab:CreateInput({
   Name = "Walkspeed",
   PlaceholderText = "1-500",
   RemoveTextAfterFocusLost = true,
   Callback = function(Text)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (Text)
   end,
})


local TPTab = Window:CreateTab("TP MT YNTKTS", nil) -- Title, Image
local Maintp = TPTab:CreateSection("Teleport to Checkpoints")


local Button1 = TPTab:CreateButton({
   Name = "cp1",
   Callback = function(Text)
      local player = game.Players.LocalPlayer
      local targetPart = game:GetService("Workspace").Checkpoints.cp1
      
      if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
         player.Character.HumanoidRootPart.CFrame = targetPart.CFrame + Vector3.new(0, 5, 0)
         -- ditambah Vector3.new(0,5,0) supaya tidak nempel persis di dalam part
      end
   end,
})


local Button2 = TPTab:CreateButton({
   Name = "cp2",
   Callback = function(Text)
      local player = game.Players.LocalPlayer
      local targetPart = game:GetService("Workspace").Checkpoints.cp2
      
      if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
         player.Character.HumanoidRootPart.CFrame = targetPart.CFrame + Vector3.new(0, 5, 0)
         -- ditambah Vector3.new(0,5,0) supaya tidak nempel persis di dalam part
      end
   end,
})

local Button3 = TPTab:CreateButton({
   Name = "cp3",
   Callback = function(Text)
      local player = game.Players.LocalPlayer
      local targetPart = game:GetService("Workspace").Checkpoints.cp3
      
      if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
         player.Character.HumanoidRootPart.CFrame = targetPart.CFrame + Vector3.new(0, 5, 0)
         -- ditambah Vector3.new(0,5,0) supaya tidak nempel persis di dalam part
      end
   end,
})

local Button4 = TPTab:CreateButton({
   Name = "cp4",
   Callback = function(Text)
      local player = game.Players.LocalPlayer
      local targetPart = game:GetService("Workspace").Checkpoints.cp4
      
      if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
         player.Character.HumanoidRootPart.CFrame = targetPart.CFrame + Vector3.new(0, 5, 0)
         -- ditambah Vector3.new(0,5,0) supaya tidak nempel persis di dalam part
      end
   end,
})

local Button5 = TPTab:CreateButton({
   Name = "cp5",
   Callback = function(Text)
      local player = game.Players.LocalPlayer
      local targetPart = game:GetService("Workspace").Checkpoints.cp5
      
      if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
         player.Character.HumanoidRootPart.CFrame = targetPart.CFrame + Vector3.new(0, 5, 0)
         -- ditambah Vector3.new(0,5,0) supaya tidak nempel persis di dalam part
      end
   end,
})

local Button6 = TPTab:CreateButton({
   Name = "cp6",
   Callback = function(Text)
      local player = game.Players.LocalPlayer
      local targetPart = game:GetService("Workspace").Checkpoints.cp6
      
      if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
         player.Character.HumanoidRootPart.CFrame = targetPart.CFrame + Vector3.new(0, 5, 0)
         -- ditambah Vector3.new(0,5,0) supaya tidak nempel persis di dalam part
      end
   end,
})

local Button7 = TPTab:CreateButton({
   Name = "cp7",
   Callback = function(Text)
      local player = game.Players.LocalPlayer
      local targetPart = game:GetService("Workspace").Checkpoints.cp7
      
      if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
         player.Character.HumanoidRootPart.CFrame = targetPart.CFrame + Vector3.new(0, 5, 0)
         -- ditambah Vector3.new(0,5,0) supaya tidak nempel persis di dalam part
      end
   end,
})

local Button8 = TPTab:CreateButton({
   Name = "cp8",
   Callback = function(Text)
      local player = game.Players.LocalPlayer
      local targetPart = game:GetService("Workspace").Checkpoints.cp8
      
      if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
         player.Character.HumanoidRootPart.CFrame = targetPart.CFrame + Vector3.new(0, 5, 0)
         -- ditambah Vector3.new(0,5,0) supaya tidak nempel persis di dalam part
      end
   end,
})

local Button9 = TPTab:CreateButton({
   Name = "cp9",
   Callback = function(Text)
      local player = game.Players.LocalPlayer
      local targetPart = game:GetService("Workspace").Checkpoints.cp9
      
      if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
         player.Character.HumanoidRootPart.CFrame = targetPart.CFrame + Vector3.new(0, 5, 0)
         -- ditambah Vector3.new(0,5,0) supaya tidak nempel persis di dalam part
      end
   end,
})

local Button10 = TPTab:CreateButton({
   Name = "cp10",
   Callback = function(Text)
      local player = game.Players.LocalPlayer
      local targetPart = game:GetService("Workspace").Checkpoints.cp10
      
      if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
         player.Character.HumanoidRootPart.CFrame = targetPart.CFrame + Vector3.new(0, 5, 0)
         -- ditambah Vector3.new(0,5,0) supaya tidak nempel persis di dalam part
      end
   end,
})

local Button11 = TPTab:CreateButton({
   Name = "cp11",
   Callback = function(Text)
      local player = game.Players.LocalPlayer
      local targetPart = game:GetService("Workspace").Checkpoints.cp11
      
      if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
         player.Character.HumanoidRootPart.CFrame = targetPart.CFrame + Vector3.new(0, 5, 0)
         -- ditambah Vector3.new(0,5,0) supaya tidak nempel persis di dalam part
      end
   end,
})

local Button12 = TPTab:CreateButton({
   Name = "cp12",
   Callback = function(Text)
      local player = game.Players.LocalPlayer
      local targetPart = game:GetService("Workspace").Checkpoints.cp12
      
      if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
         player.Character.HumanoidRootPart.CFrame = targetPart.CFrame + Vector3.new(0, 5, 0)
         -- ditambah Vector3.new(0,5,0) supaya tidak nempel persis di dalam part
      end
   end,
})


local Button13 = TPTab:CreateButton({
   Name = "cp13",
   Callback = function(Text)
      local player = game.Players.LocalPlayer
      local targetPart = game:GetService("Workspace").Checkpoints.cp13
      
      if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
         player.Character.HumanoidRootPart.CFrame = targetPart.CFrame + Vector3.new(0, 5, 0)
         -- ditambah Vector3.new(0,5,0) supaya tidak nempel persis di dalam part
      end
   end,
})

local Button14 = TPTab:CreateButton({
   Name = "cp14",
   Callback = function(Text)
      local player = game.Players.LocalPlayer
      local targetPart = game:GetService("Workspace").Checkpoints.cp14
      
      if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
         player.Character.HumanoidRootPart.CFrame = targetPart.CFrame + Vector3.new(0, 5, 0)
         -- ditambah Vector3.new(0,5,0) supaya tidak nempel persis di dalam part
      end
   end,
})

local Button15 = TPTab:CreateButton({
   Name = "cp15",
   Callback = function(Text)
      local player = game.Players.LocalPlayer
      local targetPart = game:GetService("Workspace").Checkpoints.cp15
      
      if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
         player.Character.HumanoidRootPart.CFrame = targetPart.CFrame + Vector3.new(0, 5, 0)
         -- ditambah Vector3.new(0,5,0) supaya tidak nempel persis di dalam part
      end
   end,
})

local button16 = TPTab:CreateButton({
   Name = "cp16",
   Callback = function(Text)
      local player = game.Players.LocalPlayer
      local targetPart = game:GetService("Workspace").Checkpoints.cp16
      
      if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
         player.Character.HumanoidRootPart.CFrame = targetPart.CFrame + Vector3.new(0, 5, 0)
         -- ditambah Vector3.new(0,5,0) supaya tidak nempel persis di dalam part
      end
   end,
})

local button17 = TPTab:CreateButton({
   Name = "cp17",
   Callback = function(Text)
      local player = game.Players.LocalPlayer
      local targetPart = game:GetService("Workspace").Checkpoints.cp17
      
      if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
         player.Character.HumanoidRootPart.CFrame = targetPart.CFrame + Vector3.new(0, 5, 0)
         -- ditambah Vector3.new(0,5,0) supaya tidak nempel persis di dalam part
      end
   end,
})

local button18 = TPTab:CreateButton({
   Name = "cp18",
   Callback = function(Text)
      local player = game.Players.LocalPlayer
      local targetPart = game:GetService("Workspace").Checkpoints.cp18
      
      if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
         player.Character.HumanoidRootPart.CFrame = targetPart.CFrame + Vector3.new(0, 5, 0)
         -- ditambah Vector3.new(0,5,0) supaya tidak nempel persis di dalam part
      end
   end,
})
