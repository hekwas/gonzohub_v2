-- Gonzo Lagger UI v5 (draggable + fade in/out)

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer

-- ScreenGui
local gui = Instance.new("ScreenGui")
gui.Name = "GonzoLaggerUI"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- Function to make any GuiObject draggable
local function makeDraggable(guiObject)
	local dragging, dragInput, dragStart, startPos

	guiObject.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = true
			dragStart = input.Position
			startPos = guiObject.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)

	guiObject.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement then
			dragInput = input
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			local delta = input.Position - dragStart
			guiObject.Position = UDim2.new(
				startPos.X.Scale,
				startPos.X.Offset + delta.X,
				startPos.Y.Scale,
				startPos.Y.Offset + delta.Y
			)
		end
	end)
end

-- Main Panel
local frame = Instance.new("Frame")
frame.Size = UDim2.fromOffset(300, 200)
frame.Position = UDim2.fromScale(0.5, 0.5)
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
frame.BorderSizePixel = 0
frame.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 18)
corner.Parent = frame

-- Make panel draggable
makeDraggable(frame)

-- Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -20, 0, 60)
title.Position = UDim2.fromOffset(10, 15)
title.BackgroundTransparency = 1
title.Text = "Gonzo lagger"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBlack
title.TextSize = 32
title.TextWrapped = true
title.Parent = frame

-- Lag Button
local button = Instance.new("TextButton")
button.Size = UDim2.fromOffset(140, 45)
button.Position = UDim2.new(0.5, 0, 1, -60)
button.AnchorPoint = Vector2.new(0.5, 1)
button.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
button.Text = "lag"
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.Font = Enum.Font.GothamBold
button.TextSize = 20
button.BorderSizePixel = 0
button.Parent = frame

local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0, 14)
buttonCorner.Parent = button

button.MouseButton1Click:Connect(function()
	print("Lag button pressed")
end)

-- Close / minimize button
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.fromOffset(30, 30)
closeButton.Position = UDim2.fromOffset(frame.Size.X.Offset - 35, 5)
closeButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.Font = Enum.Font.GothamBold
closeButton.TextSize = 18
closeButton.BorderSizePixel = 0
closeButton.Parent = frame

-- Gonzo button (after minimization)
local gonzoButton = Instance.new("TextButton")
gonzoButton.Size = UDim2.fromOffset(100, 40)
gonzoButton.Position = UDim2.fromScale(0.5, 0.5)
gonzoButton.AnchorPoint = Vector2.new(0.5, 0.5)
gonzoButton.BackgroundColor3 = Color3.fromRGB(0,0,0)
gonzoButton.Text = "Gonzo"
gonzoButton.TextColor3 = Color3.fromRGB(255,255,255)
gonzoButton.Font = Enum.Font.GothamBold
gonzoButton.TextSize = 20
gonzoButton.BorderSizePixel = 0
gonzoButton.Visible = false
gonzoButton.Parent = gui

local gonzoCorner = Instance.new("UICorner")
gonzoCorner.CornerRadius = UDim.new(0, 12)
gonzoCorner.Parent = gonzoButton

-- Make Gonzo button draggable
makeDraggable(gonzoButton)

-- Fade function
local function fadeIn(guiObject, time)
	guiObject.Visible = true
	guiObject.BackgroundTransparency = 1
	local step = 0.05
	local current = 1
	while current > 0 do
		current = current - step
		if current < 0 then current = 0 end
		guiObject.BackgroundTransparency = current
		wait(time * step)
	end
	guiObject.BackgroundTransparency = 0
end

local function fadeOut(guiObject, time)
	local step = 0.05
	local current = 0
	while current < 1 do
		current = current + step
		if current > 1 then current = 1 end
		guiObject.BackgroundTransparency = current
		wait(time * step)
	end
	guiObject.Visible = false
	guiObject.BackgroundTransparency = 0
end

-- Close / minimize panel
closeButton.MouseButton1Click:Connect(function()
	fadeOut(frame, 0.3)
	fadeIn(gonzoButton, 0.3)
end)

-- Restore panel
gonzoButton.MouseButton1Click:Connect(function()
	fadeOut(gonzoButton, 0.3)
	fadeIn(frame, 0.3)
end)
