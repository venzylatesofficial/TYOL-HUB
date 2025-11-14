-- Load Rayfield Library
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Buat Window
local Window = Rayfield:CreateWindow({
   Name = "VENZLA SCRIPT",
   LoadingTitle = "UNIVERSAL SCRIPT BY VENZLA",
   LoadingSubtitle = "CREATED BY VENZLA",
   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil,
      FileName = "VENZLA SCRIPT"
   },
   Discord = {
      Enabled = true,
      Invite = "FUW2kEkUZ",
      RememberJoins = true
   },
   KeySystem = false,
})

-- Tab Home
local MainTab = Window:CreateTab("Home", nil)
MainTab:CreateSection("Main")

Rayfield:Notify({
   Title = "FOLLOW TIKTOK @pdk.vl25",
   Content = "@pdk.vl25",
   Duration = 5,
   Image = 13047715178,
   Actions = {
      Ignore = {
         Name = "Okay!",
         Callback = function() print("The user tapped Okay!") end
      }
   }
})

---------------------------------------------------
-- Services & player
local uis = game:GetService("UserInputService")
local player = game.Players.LocalPlayer

---------------------------------------------------
-- Fly system 
local flyEnabled = false
local flySpeed = 50
local bv, bg

local function cleanFlyFor(hrp)
    if hrp:FindFirstChild("FlyVelocity") then hrp.FlyVelocity:Destroy() end
    if hrp:FindFirstChild("FlyGyro") then hrp.FlyGyro:Destroy() end
end

local function setFly(state)
    local character = player.Character or player.CharacterAdded:Wait()
    local hrp = character:WaitForChild("HumanoidRootPart")

    if state then
        bv = Instance.new("BodyVelocity")
        bv.Name = "FlyVelocity"
        bv.MaxForce = Vector3.new(1e5, 1e5, 1e5)
        bv.Velocity = Vector3.new(0,0,0)
        bv.Parent = hrp

        bg = Instance.new("BodyGyro")
        bg.Name = "FlyGyro"
        bg.MaxTorque = Vector3.new(1e5, 1e5, 1e5)
        bg.CFrame = hrp.CFrame
        bg.Parent = hrp

        task.spawn(function()
            while flyEnabled and hrp and bv and bg do
                local cam = workspace.CurrentCamera
                local move = Vector3.new()

                if uis:IsKeyDown(Enum.KeyCode.W) then move = move + cam.CFrame.LookVector end
                if uis:IsKeyDown(Enum.KeyCode.S) then move = move - cam.CFrame.LookVector end
                if uis:IsKeyDown(Enum.KeyCode.A) then move = move - cam.CFrame.RightVector end
                if uis:IsKeyDown(Enum.KeyCode.D) then move = move + cam.CFrame.RightVector end
                if uis:IsKeyDown(Enum.KeyCode.Space) then move = move + Vector3.new(0,1,0) end

                if move.Magnitude > 0 then
                    bv.Velocity = move.Unit * flySpeed
                else
                    bv.Velocity = Vector3.new(0,0,0)
                end

                bg.CFrame = cam.CFrame
                task.wait()
            end
        end)
    else
        cleanFlyFor(hrp)
        if bv then bv = nil end
        if bg then bg = nil end
    end
end

MainTab:CreateToggle({
   Name = "Fly Toggle",
   CurrentValue = false,
   Flag = "FlyToggle",
   Callback = function(Value)
      flyEnabled = Value
      setFly(flyEnabled)
   end,
})

MainTab:CreateSlider({
   Name = "Fly Speed",
   Range = {10, 200},
   Increment = 5,
   Suffix = "Speed",
   CurrentValue = flySpeed,
   Flag = "FlySpeedSlider",
   Callback = function(Value) flySpeed = Value end,
})

---------------------------------------------------
-- No Clip Toggle
local noclipEnabled = false
local originalCollide = {} -- cache part yang awalnya collidable

local function applyNoClip(char)
    table.clear(originalCollide)
    for _, part in ipairs(char:GetDescendants()) do
        if part:IsA("BasePart") and part.CanCollide == true then
            originalCollide[part] = true
            part.CanCollide = false
        end
    end
end

local function restoreCollide(char)
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if hrp then
        hrp.AssemblyLinearVelocity = Vector3.new(0,0,0)
        hrp.AssemblyAngularVelocity = Vector3.new(0,0,0)
        hrp.CFrame = hrp.CFrame + Vector3.new(0, 2, 0)
    end
    for part, _ in pairs(originalCollide) do
        if part and part.Parent then
            part.CanCollide = true
        end
    end
    table.clear(originalCollide)
end

MainTab:CreateToggle({
   Name = "No Clip Toggle",
   CurrentValue = false,
   Flag = "NoClipToggle",
   Callback = function(Value)
      noclipEnabled = Value
      local char = player.Character or player.CharacterAdded:Wait()
      if noclipEnabled then
          applyNoClip(char)
      else
          restoreCollide(char)
      end
   end,
})

-- maintenance loop untuk menjaga noclip saat karakter respawn/part baru
task.spawn(function()
    while true do
        if noclipEnabled then
            local char = player.Character
            if char then
                for _, part in ipairs(char:GetDescendants()) do
                    if part:IsA("BasePart") and originalCollide[part] ~= nil then
                        part.CanCollide = false
                    end
                end
            end
        end
        task.wait(0.2)
    end
end)

---------------------------------------------------
local Toggle = MainTab:CreateToggle({
   Name = "Infinite Jump Toggle",
   CurrentValue = false,
   Flag = "InfJumpToggle",
   Callback = function(Value)
       --Toggles the infinite jump between on or off on every script run
       _G.infinjump = Value

       if _G.infinJumpStarted == nil then
           --Ensures this only runs once to save resources
           _G.infinJumpStarted = true

           --Notifies readiness
           game.StarterGui:SetCore("SendNotification", {Title="Youtube Hub"; Text="Infinite Jump Activated!"; Duration=5;})

           --The actual infinite jump
           local plr = game:GetService('Players').LocalPlayer
           local m = plr:GetMouse()
           m.KeyDown:Connect(function(k)
               if _G.infinjump then
                   if k:byte() == 32 then
                       local humanoid = game:GetService('Players').LocalPlayer.Character:FindFirstChildOfClass('Humanoid')
                       humanoid:ChangeState('Jumping')
                       wait()
                       humanoid:ChangeState('Seated')
                   end
               end
           end)
       end
   end,
})


---------------------------------------------------
-- Sliders WalkSpeed & JumpPower
MainTab:CreateSlider({
   Name = "WalkSpeed Slider",
   Range = {1, 350},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 16,
   Flag = "sliderws",
   Callback = function(Value)
        local char = player.Character or player.CharacterAdded:Wait()
        local hum = char:FindFirstChildOfClass('Humanoid')
        if hum then hum.WalkSpeed = Value end
   end,
})

MainTab:CreateSlider({
   Name = "JumpPower Slider",
   Range = {1, 350},
   Increment = 1,
   Suffix = "Power",
   CurrentValue = 50,
   Flag = "sliderjp",
   Callback = function(Value)
        local char = player.Character or player.CharacterAdded:Wait()
        local hum = char:FindFirstChildOfClass('Humanoid')
        if hum then hum.JumpPower = Value end
   end,
})

MainTab:CreateInput({
   Name = "Walkspeed",
   PlaceholderText = "1-500",
   RemoveTextAfterFocusLost = true,
   Callback = function(Text)
        local n = tonumber(Text)
        if not n then return end
        local char = player.Character or player.CharacterAdded:Wait()
        local hum = char:FindFirstChildOfClass('Humanoid')
        if hum then hum.WalkSpeed = n end
   end,
})

---------------------------------------------------
-- Tab Teleport
local TPTab = Window:CreateTab("TP MT YNTKTS", nil)
TPTab:CreateSection("Teleport to Checkpoints")

local function safeTeleport(part)
    local playerLocal = game.Players.LocalPlayer
    local character = playerLocal.Character or playerLocal.CharacterAdded:Wait()
    local hrp = character:WaitForChild("HumanoidRootPart", 5)
    if hrp and part and part:IsA("BasePart") then
        hrp.CFrame = part.CFrame + Vector3.new(0, 5, 0)
    end
end

local checkpoints = {
    "cp1","cp2","cp3","cp4","cp5","cp6","cp7","cp8","cp9",
    "cp10","cp11","cp12","cp13","cp14","cp15","cp16","cp17","cp18"
}

for _, cpName in ipairs(checkpoints) do
    TPTab:CreateButton({
        Name = cpName,
        Callback = function()
            local targetPart = workspace.Checkpoints:FindFirstChild(cpName)
            if targetPart then
                safeTeleport(targetPart)
            else
                warn("Checkpoint " .. cpName .. " tidak ditemukan.")
            end
        end,
    })
end

-- Auto Teleport
TPTab:CreateSection("Auto Teleport to Checkpoints")

local autoTeleport = false
local currentIndex = 1

task.spawn(function()
    while true do
        if autoTeleport then
            local cpName = checkpoints[currentIndex]
            local targetPart = workspace.Checkpoints:FindFirstChild(cpName)
            if targetPart then
                safeTeleport(targetPart)
            end
            currentIndex = currentIndex + 1
            if currentIndex > #checkpoints then currentIndex = 1 end
            for i=1,30 do
                if not autoTeleport then break end
                task.wait(0.1)
            end
        else
            task.wait(0.1)
        end
    end
end)

TPTab:CreateToggle({
    Name = "Auto Teleport",
    CurrentValue = false,
    Flag = "AutoTeleportFlag",
    Callback = function(Value) autoTeleport = Value end,
})
