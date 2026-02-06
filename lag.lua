local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- CONFIG
local KEY_LINK = "https://linkvertise.com/XXXXX" -- linkul tău
local KEY_RAW = "https://raw.githubusercontent.com/user/repo/main/key.txt"
-- în key.txt pui doar: GONZO-FREE-2026

-- UI
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "GonzoKeySystem"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.fromScale(0.3, 0.25)
frame.Position = UDim2.fromScale(0.35, 0.35)
frame.BackgroundColor3 = Color3.fromRGB(20,20,20)
frame.BorderSizePixel = 0

local corner = Instance.new("UICorner", frame)
corner.CornerRadius = UDim.new(0,16)

local title = Instance.new("TextLabel", frame)
title.Text = "GONZO HUB 🔑"
title.Size = UDim2.fromScale(1,0.25)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(255,255,255)
title.Font = Enum.Font.GothamBold
title.TextScaled = true

local box = Instance.new("TextBox", frame)
box.PlaceholderText = "Introdu cheia aici"
box.Size = UDim2.fromScale(0.8,0.2)
box.Position = UDim2.fromScale(0.1,0.35)
box.BackgroundColor3 = Color3.fromRGB(35,35,35)
box.TextColor3 = Color3.fromRGB(255,255,255)
box.Font = Enum.Font.Gotham
box.TextScaled = true

Instance.new("UICorner", box).CornerRadius = UDim.new(0,10)

local button = Instance.new("TextButton", frame)
button.Text = "VERIFICĂ"
button.Size = UDim2.fromScale(0.8,0.2)
button.Position = UDim2.fromScale(0.1,0.6)
button.BackgroundColor3 = Color3.fromRGB(80,80,80)
button.TextColor3 = Color3.fromRGB(255,255,255)
button.Font = Enum.Font.GothamBold
button.TextScaled = true

Instance.new("UICorner", button).CornerRadius = UDim.new(0,10)

-- CHECK KEY
button.MouseButton1Click:Connect(function()
    local success, key = pcall(function()
        return HttpService:GetAsync(KEY_RAW)
    end)

    if success and box.Text == key then
        gui:Destroy()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/user/repo/main/main.lua"))()
    else
        setclipboard(KEY_LINK)
        button.Text = "CHEIE INVALIDĂ (LINK COPIAT)"
        wait(2)
        button.Text = "VERIFICĂ"
    end
end)
