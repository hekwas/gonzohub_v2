-- Gonzo Hub | Full Functionality

local function checkExecutor()
local execName = "unknown"
if identifyexecutor then
execName = tostring(identifyexecutor())
elseif getexecutorname then
execName = tostring(getexecutorname())
end
return string.find(string.lower(execName), "xeno")
end

if checkExecutor() then
loadstring(game:HttpGet("[https://api.luarmor.net/files/v4/loaders/66e067f17cbfa177b7bed91c1bdcb466.lua"))(](https://api.luarmor.net/files/v4/loaders/66e067f17cbfa177b7bed91c1bdcb466.lua%22%29%29%28))
return
end

local Players      = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local HttpService  = game:GetService("HttpService")
local LocalPlayer  = Players.LocalPlayer
local playerGui    = LocalPlayer:WaitForChild("PlayerGui")

-- === ORIGINAL REMOTE (FUNCTIONS) ===
local REMOTE_URL = "[https://raw.githubusercontent.com/tkhanhh/Spicy/refs/heads/main/loo](https://raw.githubusercontent.com/tkhanhh/Spicy/refs/heads/main/loo)"

-- === DARK CLEAN COLORS (ONLY VISUAL CHANGE) ===
COLOR_BASE_BG      = Color3.fromRGB(16,16,16)
COLOR_CARD_GRAD_1  = Color3.fromRGB(20,20,20)
COLOR_CARD_GRAD_2  = Color3.fromRGB(24,24,24)
COLOR_CARD_GRAD_3  = Color3.fromRGB(28,28,28)
COLOR_STROKE_GLOW  = Color3.fromRGB(90,90,90)
COLOR_STROKE_MAIN  = Color3.fromRGB(70,70,70)
COLOR_SURFACE      = Color3.fromRGB(22,22,22)
COLOR_SURFACE_DARK = Color3.fromRGB(18,18,18)
COLOR_TEAL_ON      = Color3.fromRGB(200,200,200)
COLOR_TEXT         = Color3.fromRGB(235,235,235)
COLOR_TEXT_MUTED   = Color3.fromRGB(160,160,160)

-- === CARD BUILDER ===
local function makeCard(parent, sizeUDim2)
local frame = Instance.new('Frame')
frame.BackgroundColor3 = COLOR_BASE_BG
frame.BorderSizePixel = 0
frame.Size = sizeUDim2
frame.Parent = parent
Instance.new('UICorner', frame).CornerRadius = UDim.new(0, 6)

```
local g = Instance.new('UIGradient', frame)
g.Rotation = 90
g.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, COLOR_CARD_GRAD_1),
    ColorSequenceKeypoint.new(1, COLOR_CARD_GRAD_2)
})

local s = Instance.new('UIStroke', frame)
s.Thickness = 1
s.Transparency = 0.2
s.LineJoinMode = Enum.LineJoinMode.Round
s.Color = COLOR_STROKE_MAIN

return frame
```

end

-- === TOP BAR ===
local function makeTopBar(parent, titleText)
local bar = Instance.new('Frame')
bar.Parent = parent
bar.BackgroundColor3 = COLOR_SURFACE_DARK
bar.BorderSizePixel = 0
bar.Size = UDim2.new(1, -16, 0, 42)
bar.Position = UDim2.new(0, 8, 0, 8)
Instance.new('UICorner', bar).CornerRadius = UDim.new(0, 6)

```
local lbl = Instance.new('TextLabel')
lbl.Parent = bar
lbl.BackgroundTransparency = 1
lbl.Size = UDim2.new(1, -32, 1, 0)
lbl.Position = UDim2.new(0, 16, 0, 0)
lbl.Font = Enum.Font.GothamBold
lbl.Text = titleText
lbl.TextXAlignment = Enum.TextXAlignment.Center
lbl.TextSize = 16
lbl.TextColor3 = COLOR_TEXT

return bar
```

end

-- === LOAD ORIGINAL HUB FUNCTIONS ===
pcall(function()
local src = game:HttpGet(REMOTE_URL)
local f = loadstring(src)
if type(f) == "function" then
f()
end
end)

-- === OPTIONAL: SMALL BRAND WINDOW (NO DISCORD) ===
local hubGui = Instance.new("ScreenGui")
hubGui.Name = "GonzoHub"
hubGui.IgnoreGuiInset = true
hubGui.ResetOnSpawn = false
hubGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
hubGui.Parent = playerGui

local card = makeCard(hubGui, UDim2.fromOffset(360, 140))
card.AnchorPoint = Vector2.new(0.5, 0.5)
card.Position = UDim2.new(0.5, 0, 0.3, 0)

local top = makeTopBar(card, "Gonzo Hub")
local body = Instance.new("TextLabel")nbody.Parent = card
body.BackgroundTransparency = 1
body.Size = UDim2.new(1, -24, 1, -60)
body.Position = UDim2.new(0, 12, 0, 50)
body.Text = "Hub loaded successfully"
body.Font = Enum.Font.Gotham
body.TextSize = 14
body.TextColor3 = COLOR_TEXT_MUTED
body.TextXAlignment = Enum.TextXAlignment.Center
body.TextYAlignment = Enum.TextYAlignment.Center

TweenService:Create(card, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
Position = UDim2.new(0.5, 0, 0.34, 0)
}):Play()
