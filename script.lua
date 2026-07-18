-- KARA BULLUK V3 - MM2 MOBILE HUB ;


local Players = game:GetService("Players") ;
local RunService = game:GetService("RunService") ;
local LocalPlayer = Players.LocalPlayer ;


local TargetSpeed = 45 ;
local TargetJump = 100 ;


-- ANA UI OLUŞTURMA ;
local ScreenGui = Instance.new("ScreenGui") ;
ScreenGui.Name = "KaraBullukV3" ;
ScreenGui.ResetOnSpawn = false ;
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui") ;


-- MOBİL AÇMA KAPAMA BUTONU ;
local ToggleButton = Instance.new("TextButton") ;
ToggleButton.Size = UDim2.new(0, 120, 0, 35) ;
ToggleButton.Position = UDim2.new(0, 10, 0, 80) ;
ToggleButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30) ;
ToggleButton.Text = "KARA BÜLLÜK V3" ;
ToggleButton.TextColor3 = Color3.fromRGB(255, 50, 50) ;
ToggleButton.Font = Enum.Font.SourceSansBold ;
ToggleButton.TextSize = 14 ;
ToggleButton.Parent = ScreenGui ;


local MainFrame = Instance.new("Frame") ;
MainFrame.Size = UDim2.new(0, 450, 0, 280) ;
MainFrame.Position = UDim2.new(0.5, -225, 0.5, -140) ;
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20) ;
MainFrame.Active = true ;
MainFrame.Draggable = true ;
MainFrame.Parent = ScreenGui ;


ToggleButton.MouseButton1Click:Connect(function() 
    MainFrame.Visible = not MainFrame.Visible ;
end) ;


-- YAN MENÜ ;
local SideBar = Instance.new("Frame") ;
SideBar.Size = UDim2.new(0, 130, 1, 0) ;
SideBar.BackgroundColor3 = Color3.fromRGB(15, 15, 15) ;
SideBar.Parent = MainFrame ;


local MainContent = Instance.new("Frame") ;
MainContent.Position = UDim2.new(0, 140, 0, 10) ;
MainContent.Size = UDim2.new(1, -150, 1, -20) ;
MainContent.BackgroundTransparency = 1 ;
MainContent.Parent = MainFrame ;


local TabPlayer = Instance.new("Frame") ;
TabPlayer.Size = UDim2.new(1, 0, 1, 0) ;
TabPlayer.BackgroundTransparency = 1 ;
TabPlayer.Visible = true ;
TabPlayer.Parent = MainContent ;


local TabCombat = Instance.new("Frame") ;
TabCombat.Size = UDim2.new(1, 0, 1, 0) ;
TabCombat.BackgroundTransparency = 1 ;
TabCombat.Visible = false ;
TabCombat.Parent = MainContent ;


-- SEKME BUTONLARI ;
local BtnPlayer = Instance.new("TextButton") ;
BtnPlayer.Size = UDim2.new(0.9, 0, 0, 35) ;
BtnPlayer.Position = UDim2.new(0.05, 0, 0, 10) ;
BtnPlayer.BackgroundColor3 = Color3.fromRGB(40, 40, 40) ;
BtnPlayer.Text = "Karakter" ;
BtnPlayer.TextColor3 = Color3.fromRGB(255, 255, 255) ;
BtnPlayer.Parent = SideBar ;


local BtnCombat = Instance.new("TextButton") ;
BtnCombat.Size = UDim2.new(0.9, 0, 0, 35) ;
BtnCombat.Position = UDim2.new(0.05, 0, 0, 55) ;
BtnCombat.BackgroundColor3 = Color3.fromRGB(40, 40, 40) ;
BtnCombat.Text = "Hileler" ;
BtnCombat.TextColor3 = Color3.fromRGB(255, 255, 255) ;
BtnCombat.Parent = SideBar ;


BtnPlayer.MouseButton1Click:Connect(function() 
    TabPlayer.Visible = true ;
    TabCombat.Visible = false ;
end) ;


BtnCombat.MouseButton1Click:Connect(function() 
    TabPlayer.Visible = false ;
    TabCombat.Visible = true ;
end) ;


-- SPEED FONKSİYONU ;
local SpeedActive = false ;
local BtnSpeed = Instance.new("TextButton") ;
BtnSpeed.Size = UDim2.new(0.6, -5, 0, 40) ;
BtnSpeed.Position = UDim2.new(0, 0, 0, 10) ;
BtnSpeed.BackgroundColor3 = Color3.fromRGB(150, 50, 50) ;
BtnSpeed.Text = "Speed: KAPALI" ;
BtnSpeed.TextColor3 = Color3.fromRGB(255, 255, 255) ;
BtnSpeed.Parent = TabPlayer ;


local BoxSpeed = Instance.new("TextBox") ;
BoxSpeed.Size = UDim2.new(0.4, -5, 0, 40) ;
BoxSpeed.Position = UDim2.new(0.6, 5, 0, 10) ;
BoxSpeed.BackgroundColor3 = Color3.fromRGB(50, 50, 50) ;
BoxSpeed.Text = tostring(TargetSpeed) ;
BoxSpeed.TextColor3 = Color3.fromRGB(255, 255, 255) ;
BoxSpeed.Parent = TabPlayer ;


BoxSpeed.FocusLost:Connect(function() 
    local val = tonumber(BoxSpeed.Text) ;
    if val then TargetSpeed = val else BoxSpeed.Text = tostring(TargetSpeed) end ;
end) ;


BtnSpeed.MouseButton1Click:Connect(function() 
    SpeedActive = not SpeedActive ;
    if SpeedActive then 
        BtnSpeed.Text = "Speed: AÇIK" ;
        BtnSpeed.BackgroundColor3 = Color3.fromRGB(50, 150, 50) ;
    else 
        BtnSpeed.Text = "Speed: KAPALI" ;
        BtnSpeed.BackgroundColor3 = Color3.fromRGB(150, 50, 50) ;
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then 
            LocalPlayer.Character.Humanoid.WalkSpeed = 16 ;
        end ;
    end ;
end) ;


-- JUMP FONKSİYONU ;
local JumpActive = false ;
local BtnJump = Instance.new("TextButton") ;
BtnJump.Size = UDim2.new(0.6, -5, 0, 40) ;
BtnJump.Position = UDim2.new(0, 0, 0, 60) ;
BtnJump.BackgroundColor3 = Color3.fromRGB(150, 50, 50) ;
BtnJump.Text = "Jump: KAPALI" ;
BtnJump.TextColor3 = Color3.fromRGB(255, 255, 255) ;
BtnJump.Parent = TabPlayer ;


local BoxJump = Instance.new("TextBox") ;
BoxJump.Size = UDim2.new(0.4, -5, 0, 40) ;
BoxJump.Position = UDim2.new(0.6, 5, 0, 60) ;
BoxJump.BackgroundColor3 = Color3.fromRGB(50, 50, 50) ;
BoxJump.Text = tostring(TargetJump) ;
BoxJump.TextColor3 = Color3.fromRGB(255, 255, 255) ;
BoxJump.Parent = TabPlayer ;


BoxJump.FocusLost:Connect(function() 
    local val = tonumber(BoxJump.Text) ;
    if val then TargetJump = val else BoxJump.Text = tostring(TargetJump) end ;
end) ;


BtnJump.MouseButton1Click:Connect(function() 
    JumpActive = not JumpActive ;
    if JumpActive then 
        BtnJump.Text = "Jump: AÇIK" ;
        BtnJump.BackgroundColor3 = Color3.fromRGB(50, 150, 50) ;
    else 
        BtnJump.Text = "Jump: KAPALI" ;
        BtnJump.BackgroundColor3 = Color3.fromRGB(150, 50, 50) ;
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then 
            LocalPlayer.Character.Humanoid.JumpPower = 50 ;
        end ;
    end ;
end) ;


RunService.Heartbeat:Connect(function() 
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then 
        if SpeedActive then LocalPlayer.Character.Humanoid.WalkSpeed = TargetSpeed ; end ;
        if JumpActive then LocalPlayer.Character.Humanoid.JumpPower = TargetJump ; end ;
    end ;
end) ;


-- ESP FONKSİYONU (MOBİL UYUMLU BOX ADET) ;
local EspActive = false ;
local BtnEsp = Instance.new("TextButton") ;
BtnEsp.Size = UDim2.new(1, 0, 0, 40) ;
BtnEsp.Position = UDim2.new(0, 0, 0, 10) ;
BtnEsp.BackgroundColor3 = Color3.fromRGB(150, 50, 50) ;
BtnEsp.Text = "ESP: KAPALI" ;
BtnEsp.TextColor3 = Color3.fromRGB(255, 255, 255) ;
BtnEsp.Parent = TabCombat ;


local function CreateESP(player) 
    if player == LocalPlayer then return end ;
    local function apply() 
        if not EspActive then return end ;
        local char = player.Character ;
        if char and char:FindFirstChild("HumanoidRootPart") and not char:FindFirstChild("BoxHandleAdornment") then 
            local Box = Instance.new("BoxHandleAdornment") ;
            Box.Size = Vector3.new(4, 6, 4) ;
            Box.AlwaysOnTop = true ;
            Box.ZIndex = 5 ;
            Box.Adornee = char.HumanoidRootPart ;
            Box.Transparency = 0.6 ;
            Box.Parent = char.HumanoidRootPart ;
            if player.Backpack:FindFirstChild("Knife") or char:FindFirstChild("Knife") then 
                Box.Color3 = Color3.fromRGB(255, 0, 0) ;
            elseif player.Backpack:FindFirstChild("Gun") or char:FindFirstChild("Gun") then 
                Box.Color3 = Color3.fromRGB(0, 0, 255) ;
            else 
                Box.Color3 = Color3.fromRGB(0, 255, 0) ;
            end ;
        end ;
    end ;
    player.CharacterAdded:Connect(function() task.wait(0.5) ; apply() ; end) ;
    apply() ;
end ;


BtnEsp.MouseButton1Click:Connect(function() 
    EspActive = not EspActive ;
    if EspActive then 
        BtnEsp.Text = "ESP: AÇIK" ;
        BtnEsp.BackgroundColor3 = Color3.fromRGB(50, 150, 50) ;
        for _, p in pairs(Players:GetPlayers()) do CreateESP(p) ; end ;
    else 
        BtnEsp.Text = "ESP: KAPALI" ;
        BtnEsp.BackgroundColor3 = Color3.fromRGB(150, 50, 50) ;
        for _, p in pairs(Players:GetPlayers()) do 
            if p.Character and p.Character:FindFirstChild("HumanoidRootPart") and p.Character.HumanoidRootPart:FindFirstChild("BoxHandleAdornment") then 
                p.Character.HumanoidRootPart.BoxHandleAdornment:Destroy() ;
            end ;
        end ;
    end ;
end) ;


Players.PlayerAdded:Connect(CreateESP) ;


-- GODMODE FONKSİYONU ;
local GodActive = false ;
local BtnGod = Instance.new("TextButton") ;
BtnGod.Size = UDim2.new(1, 0, 0, 40) ;
BtnGod.Position = UDim2.new(0, 0, 0, 60) ;
BtnGod.BackgroundColor3 = Color3.fromRGB(150, 50, 50) ;
BtnGod.Text = "Godmode: KAPALI" ;
BtnGod.TextColor3 = Color3.fromRGB(255, 255, 255) ;
BtnGod.Parent = TabCombat ;


BtnGod.MouseButton1Click:Connect(function() 
    GodActive = not GodActive ;
    if GodActive then 
        BtnGod.Text = "Godmode: AÇIK" ;
        BtnGod.BackgroundColor3 = Color3.fromRGB(50, 150, 50) ;
    else 
        BtnGod.Text = "Godmode: KAPALI" ;
        BtnGod.BackgroundColor3 = Color3.fromRGB(150, 50, 50) ;
    end ;
end) ;


RunService.Stepped:Connect(function() 
    if GodActive and LocalPlayer.Character then 
        for _, v in pairs(LocalPlayer.Character:GetDescendants()) do 
            if v:IsA("BasePart") then v.CanTouch = false ; end ;
        end ;
    elseif not GodActive and LocalPlayer.Character then 
        for _, v in pairs(LocalPlayer.Character:GetDescendants()) do 
            if v:IsA("BasePart") then v.CanTouch = true ; end ;
        end ;
    end ;
end) ;
