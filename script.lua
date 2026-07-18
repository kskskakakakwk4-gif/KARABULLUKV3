-- KARA BÜLLÜK V3 - MM2 Premium Mobile Hub

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

-- Varsayılan Başlangıç Değerleri
local TargetSpeed = 45
local TargetJump = 100

-- UI ANA ÇERCEVE OLUŞTURMA
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "KaraBullukV3"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

-- MOBİL İÇİN KÜÇÜK AÇMA / KAPATMA BUTONU (Ekranın Sol Üstünde Durur)
local ToggleButton = Instance.new("TextButton")
ToggleButton.Name = "ToggleButton"
ToggleButton.Size = UDim2.new(0, 110, 0, 30)
ToggleButton.Position = UDim2.new(0, 10, 0, 50) -- Sol üst köşe, sohbetin altı
ToggleButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
ToggleButton.BackgroundTransparency = 0.2
ToggleButton.Text = "KARA BÜLLÜK V3"
ToggleButton.TextColor3 = Color3.fromRGB(255, 60, 60)
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.TextSize = 11
ToggleButton.Parent = ScreenGui
Instance.new("UICorner", ToggleButton).CornerRadius = UDim.new(0, 6)

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 500, 0, 350)
MainFrame.Position = UDim2.new(0.5, -250, 0.5, -175)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

-- MOBİL BUTON TIKLAMA FONKSİYONU
ToggleButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

-- UI Köşe Yuvarlama
local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 8)
MainCorner.Parent = MainFrame

-- Yan Menü (Bölümler/Sekmeler için)
local SideBar = Instance.new("Frame")
SideBar.Name = "SideBar"
SideBar.Size = UDim2.new(0, 140, 1, 0)
SideBar.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
SideBar.BorderSizePixel = 0
SideBar.Parent = MainFrame

local SideCorner = Instance.new("UICorner")
SideCorner.CornerRadius = UDim.new(0, 8)
SideCorner.Parent = SideBar

-- Başlık (KARA BÜLLÜK V3)
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 45)
Title.BackgroundTransparency = 1
Title.Text = "KARA BÜLLÜK V3"
Title.TextColor3 = Color3.fromRGB(255, 60, 60)
Title.TextSize = 14
Title.Font = Enum.Font.GothamBold
Title.Parent = SideBar

-- İÇERİK ALANLARI (SEKMELER)
local MainContent = Instance.new("Frame")
MainContent.Position = UDim2.new(0, 150, 0, 10)
MainContent.Size = UDim2.new(1, -160, 1, -20)
MainContent.BackgroundTransparency = 1
MainContent.Parent = MainFrame

local TabPlayer = Instance.new("Frame")
TabPlayer.Size = UDim2.new(1, 0, 1, 0)
TabPlayer.BackgroundTransparency = 1
TabPlayer.Visible = true
TabPlayer.Parent = MainContent

local TabCombat = Instance.new("Frame")
TabCombat.Size = UDim2.new(1, 0, 1, 0)
TabCombat.BackgroundTransparency = 1
TabCombat.Visible = false
TabCombat.Parent = MainContent

-- SEKME DEĞİŞTİRME FONKSİYONU
local BtnPlayer = Instance.new("TextButton")
BtnPlayer.Size = UDim2.new(0.9, 0, 0, 35)
BtnPlayer.Position = UDim2.new(0.05, 0, 0, 55)
BtnPlayer.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
BtnPlayer.Text = "Karakter Ayarları"
BtnPlayer.TextColor3 = Color3.fromRGB(200, 200, 200)
BtnPlayer.Font = Enum.Font.Gotham
BtnPlayer.TextSize = 12
BtnPlayer.Parent = SideBar
Instance.new("UICorner", BtnPlayer).CornerRadius = UDim.new(0, 6)

local BtnCombat = Instance.new("TextButton")
BtnCombat.Size = UDim2.new(0.9, 0, 0, 35)
BtnCombat.Position = UDim2.new(0.05, 0, 0, 100)
BtnCombat.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
BtnCombat.Text = "ESP & Godmode"
BtnCombat.TextColor3 = Color3.fromRGB(200, 200, 200)
BtnCombat.Font = Enum.Font.Gotham
BtnCombat.TextSize = 12
BtnCombat.Parent = SideBar
Instance.new("UICorner", BtnCombat).CornerRadius = UDim.new(0, 6)

BtnPlayer.MouseButton1Click:Connect(function()
    TabPlayer.Visible = true
    TabCombat.Visible = false
end)

BtnCombat.MouseButton1Click:Connect(function()
    TabPlayer.Visible = false
    TabCombat.Visible = true
end)

---------------------------------------------------------
-- TAB 1: PLAYER (SPEED & JUMP SEVİYE GİRİŞLİ)
---------------------------------------------------------
local SpeedActive = false
local BtnSpeed = Instance.new("TextButton")
BtnSpeed.Size = UDim2.new(0.6, -5, 0, 40)
BtnSpeed.Position = UDim2.new(0, 0, 0, 10)
BtnSpeed.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
BtnSpeed.Text = "Speed: KAPALI"
BtnSpeed.TextColor3 = Color3.fromRGB(255, 255, 255)
BtnSpeed.Font = Enum.Font.GothamBold
BtnSpeed.Parent = TabPlayer
Instance.new("UICorner", BtnSpeed)

local BoxSpeed = Instance.new("TextBox")
BoxSpeed.Size = UDim2.new(0.4, -5, 0, 40)
BoxSpeed.Position = UDim2.new(0.6, 5, 0, 10)
BoxSpeed.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
BoxSpeed.Text = tostring(TargetSpeed)
BoxSpeed.TextColor3 = Color3.fromRGB(255, 255, 255)
BoxSpeed.Font = Enum.Font.Gotham
BoxSpeed.TextSize = 14
BoxSpeed.PlaceholderText = "Hız Yaz..."
BoxSpeed.Parent = TabPlayer
Instance.new("UICorner", BoxSpeed)

BoxSpeed.FocusLost:Connect(function()
    local val = tonumber(BoxSpeed.Text)
    if val then TargetSpeed = val else BoxSpeed.Text = tostring(TargetSpeed) end
end)

BtnSpeed.MouseButton1Click:Connect(function()
    SpeedActive = not SpeedActive
    if SpeedActive then
        BtnSpeed.Text = "Speed: AÇIK"
        BtnSpeed.BackgroundColor3 = Color3.fromRGB(50, 180, 50)
    else
        BtnSpeed.Text = "Speed: KAPALI"
        BtnSpeed.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.WalkSpeed = 16
        end
    end
end)

local JumpActive = false
local BtnJump = Instance.new("TextButton")
BtnJump.Size = UDim2.new(0.6, -5, 0, 40)
BtnJump.Position = UDim2.new(0, 0, 0, 60)
BtnJump.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
BtnJump.Text = "Jump: KAPALI"
BtnJump.TextColor3 = Color3.fromRGB(255, 255, 255)
BtnJump.Font = Enum.Font.GothamBold
BtnJump.Parent = TabPlayer
Instance.new("UICorner", BtnJump)

local BoxJump = Instance.new("TextBox")
BoxJump.Size = UDim2.new(0.4, -5, 0, 40)
BoxJump.Position = UDim2.new(0.6, 5, 0, 60)
BoxJump.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
BoxJump.Text = tostring(TargetJump)
BoxJump.TextColor3 = Color3.fromRGB(255, 255, 255)
BoxJump.Font = Enum.Font.Gotham
BoxJump.TextSize = 14
BoxJump.PlaceholderText = "Zıplama..."
BoxJump.Parent = TabPlayer
Instance.new("UICorner", BoxJump)

BoxJump.FocusLost:Connect(function()
    local val = tonumber(BoxJump.Text)
    if val then TargetJump = val else BoxJump.Text = tostring(TargetJump) end
end)

BtnJump.MouseButton1Click:Connect(function()
    JumpActive = not JumpActive
    if JumpActive then
        BtnJump.Text = "Jump: AÇIK"
        BtnJump.BackgroundColor3 = Color3.fromRGB(50, 180, 50)
    else
        BtnJump.Text = "Jump: KAPALI"
        BtnJump.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.JumpPower = 50
        end
    end
end)

RunService.Heartbeat:Connect(function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        if SpeedActive then
            LocalPlayer.Character.Humanoid.WalkSpeed = TargetSpeed
        end
        if JumpActive then
            LocalPlayer.Character.Humanoid.JumpPower = TargetJump
        end
    end
end)

---------------------------------------------------------
-- TAB 2: VISUALS & COMBAT (ESP / GODMODE)
---------------------------------------------------------
local EspActive = false
local BtnEsp = Instance.new("TextButton")
BtnEsp.Size = UDim2.new(1, 0, 0, 40)
BtnEsp.Position = UDim2.new(0, 0, 0, 10)
BtnEsp.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
BtnEsp.Text = "ESP: KAPALI"
BtnEsp.TextColor3 = Color3.fromRGB(255, 255, 255)
BtnEsp.Font = Enum.Font.GothamBold
BtnEsp.Parent = TabCombat
Instance.new("UICorner", BtnEsp)

local function CreateESP(player)
    if player == LocalPlayer then return end
    local function apply()
        if not EspActive then return end
        local char = player.Character
        if char and char:FindFirstChild("HumanoidRootPart") and not char:FindFirstChild("Highlight") then
            local Highlight = Instance.new("Highlight")
            Highlight.Name = "Highlight"
            Highlight.Parent = char
            Highlight.FillTransparency = 0.5
            Highlight.OutlineTransparency = 0
            if player.Backpack:FindFirstChild("Knife") or char:FindFirstChild("Knife") then
                Highlight.FillColor = Color3.fromRGB(255, 0, 0)
            elseif player.Backpack:FindFirstChild("Gun") or char:FindFirstChild("Gun") then
                Highlight.FillColor = Color3.fromRGB(0, 0, 255)
            else
                Highlight.FillColor = Color3.fromRGB(0, 255, 0)
            end
        end
    end
    player.CharacterAdded:Connect(function() task.wait(0.5) apply() end)
    apply()
end

BtnEsp.MouseButton1Click:Connect(function()
    getfenv().EspActive = not EspActive
    EspActive = getfenv().EspActive
    if EspActive then
        BtnEsp.Text = "ESP: AÇIK"
        BtnEsp.BackgroundColor3 = Color3.fromRGB(50, 180, 50)
        for _, p in pairs(Players:GetPlayers()) do CreateESP(p) end
    else
        BtnEsp.Text = "ESP: KAPALI"
        BtnEsp.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
        for _, p in pairs(Players:GetPlayers()) do
            if p.Character and p.Character:FindFirstChild("Highlight") then
                p.Character.Highlight:Destroy()
            end
        end
    end
end)

Players.PlayerAdded:Connect(CreateESP)

local GodActive = false
local BtnGod = Instance.new("TextButton")
BtnGod.BackgroundColor3 = Color3.fromRGB(180, 50, 50) ;


BtnGod.Text = "Godmode: KAPALI" ;


BtnGod.TextColor3 = Color3.fromRGB(255, 255, 255) ;


BtnGod.Font = Enum.Font.GothamBold ;


BtnGod.Parent = TabCombat ;


Instance.new("UICorner", BtnGod) ;


BtnGod.MouseButton1Click:Connect(function() 
    GodActive = not GodActive ;
    if GodActive then 
        BtnGod.Text = "Godmode: AÇIK (Ölümsüz)" ;
        BtnGod.BackgroundColor3 = Color3.fromRGB(50, 180, 50) ;
    else 
        BtnGod.Text = "Godmode: KAPALI" ;
        BtnGod.BackgroundColor3 = Color3.fromRGB(180, 50, 50) ;
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
