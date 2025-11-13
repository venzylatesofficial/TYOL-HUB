local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "VENZLA SCRIPT",
   LoadingTitle = "UNIVERSAL SCRIPT BY VENZLA",
   LoadingSubtitle = "CREATED BY VENZLA",
   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "VENZLA SCRIPT" -- Create a custom file name for your hub/game
   },
   Discord = {
      Enabled = true,
      Invite = "FUW2kEkUZ", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
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
   Title = "FOLLOW TIKTOK @pdk.vl25",
   Content = "@pdk.vl25",
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


local TPTab = Window:CreateTab("TP MT YNTKTS", nil)
local Maintp = TPTab:CreateSection("Teleport to Checkpoints")

-- Fungsi teleport jarak jauh
local function safeTeleport(part)
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local hrp = character:WaitForChild("HumanoidRootPart", 5)

    if hrp and part and part:IsA("BasePart") then
        -- Pastikan part sudah tersedia di client
        if part:IsDescendantOf(workspace) then
            hrp.CFrame = part.CFrame + Vector3.new(0, 5, 0)
        else
            warn("Target part belum tersedia di client.")
        end
    else
        warn("Teleport gagal: HumanoidRootPart atau target tidak valid.")
    end
end

-- Daftar checkpoint
local checkpoints = {
    "cp1", "cp2", "cp3", "cp4", "cp5", "cp6", "cp7", "cp8", "cp9",
    "cp10", "cp11", "cp12", "cp13", "cp14", "cp15", "cp16", "cp17", "cp18"
}

-- Buat tombol otomatis
for _, cpName in ipairs(checkpoints) do
    TPTab:CreateButton({
        Name = cpName,
        Callback = function()
            local targetPart = game:GetService("Workspace").Checkpoints:FindFirstChild(cpName)
            if targetPart then
                safeTeleport(targetPart)
            else
                warn("Checkpoint " .. cpName .. " tidak ditemukan.")
            end
        end,
    })
end

local AutoTp = TPTab:CreateSection("Auto Teleport to Checkpoints")


local checkpoints = {
    "cp1","cp2","cp3","cp4","cp5","cp6","cp7","cp8","cp9",
    "cp10","cp11","cp12","cp13","cp14","cp15","cp16","cp17","cp18"
}

-- fungsi teleport aman
local function safeTeleport(part)
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local hrp = character:WaitForChild("HumanoidRootPart", 5)
    if hrp and part and part:IsA("BasePart") then
        hrp.CFrame = part.CFrame + Vector3.new(0,5,0)
    end
end

-- variabel kontrol
local autoTeleport = false
local currentIndex = 1 -- mulai dari cp1

-- loop auto teleport
task.spawn(function()
    while true do
        if autoTeleport then
            local cpName = checkpoints[currentIndex]
            local targetPart = game:GetService("Workspace").Checkpoints:FindFirstChild(cpName)
            if targetPart then
                safeTeleport(targetPart)
            end

            -- maju ke checkpoint berikutnya
            currentIndex = currentIndex + 1
            if currentIndex > #checkpoints then
                currentIndex = 1 -- balik ke awal kalau sudah habis
            end

            -- tunggu sebelum lanjut
            for i=1,30 do -- 30 * 0.1 = 3 detik
                if not autoTeleport then break end
                task.wait(0.1)
            end
        else
            task.wait(0.1) -- idle saat toggle off
        end
    end
end)

-- toggle di Rayfield
local Toggle = TPTab:CreateToggle({
    Name = "Auto Teleport",
    CurrentValue = false,
    Flag = "AutoTeleportFlag",
    Callback = function(Value)
        autoTeleport = Value
    end,
})
