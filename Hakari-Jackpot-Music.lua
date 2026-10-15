local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local SoundService = game:GetService("SoundService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local isPinned = false
local isDragging = false
local hasMoved = false
local dragStartPos = nil
local buttonStartPos = nil
local pulseList = {}

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "PulseGui"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = PlayerGui

local MainButton = Instance.new("TextButton")
MainButton.Name = "MainButton"
MainButton.Size = UDim2.fromOffset(70, 70)
MainButton.Position = UDim2.new(0.5, 35, 0.5, -140)
MainButton.BackgroundColor3 = Color3.fromRGB(255, 200, 0)
MainButton.Text = ""
MainButton.AutoButtonColor = false
MainButton.ClipsDescendants = false
MainButton.ZIndex = 10
MainButton.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(1, 0)
UICorner.Parent = MainButton

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(0, 0, 0)
UIStroke.Thickness = 3
UIStroke.Parent = MainButton

local ButtonIcon = Instance.new("ImageLabel")
ButtonIcon.Name = "ButtonIcon"
ButtonIcon.BackgroundTransparency = 1
ButtonIcon.Size = UDim2.fromScale(0.72, 0.72)
ButtonIcon.Position = UDim2.fromScale(0.14, 0.14)
ButtonIcon.Image = "rbxassetid://121350130767104"
ButtonIcon.ScaleType = Enum.ScaleType.Fit
ButtonIcon.ZIndex = 11
ButtonIcon.Parent = MainButton

local PinButton = Instance.new("TextButton")
PinButton.Name = "PinButton"
PinButton.Size = UDim2.fromOffset(30, 30)
PinButton.Position = UDim2.new(1, -4, 0, -4)
PinButton.AnchorPoint = Vector2.new(1, 1)
PinButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
PinButton.BackgroundTransparency = 0.15
PinButton.Text = "🔓"
PinButton.TextSize = 16
PinButton.ZIndex = 20
PinButton.Parent = MainButton

local PinCorner = Instance.new("UICorner")
PinCorner.CornerRadius = UDim.new(1, 0)
PinCorner.Parent = PinButton

local backgroundMusic = Instance.new("Sound")
backgroundMusic.Name = "BackgroundMusic"
backgroundMusic.SoundId = "rbxassetid://1841426381"
backgroundMusic.Volume = 1
backgroundMusic.Looped = true
backgroundMusic.Parent = SoundService
backgroundMusic:Play()

local function getPulseColor()
	return Color3.fromRGB(0, 255, 80)
end

local function createPulse()
	local pulse = Instance.new("Frame")
	pulse.Name = "Pulse"
	pulse.AnchorPoint = Vector2.new(0.5, 0.5)
	pulse.Position = UDim2.fromScale(0.5, 0.5)
	pulse.Size = UDim2.fromScale(1, 1)
	pulse.BackgroundColor3 = getPulseColor()
	pulse.BackgroundTransparency = 0.45
	pulse.BorderSizePixel = 0
	pulse.ZIndex = 9
	pulse.Parent = MainButton

	local pulseCorner = Instance.new("UICorner")
	pulseCorner.CornerRadius = UDim.new(1, 0)
	pulseCorner.Parent = pulse

	table.insert(pulseList, {
		Object = pulse,
		Start = tick()
	})
end

createPulse()

local function playClickSound()
	local sound = Instance.new("Sound")
	sound.SoundId = "rbxassetid://1841426381"
	sound.Volume = 1
	sound.Parent = SoundService
	sound:Play()
	sound.Ended:Connect(function()
		sound:Destroy()
	end)
end

MainButton.InputBegan:Connect(function(input)
	if isPinned then return end

	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		isDragging = true
		hasMoved = false
		dragStartPos = input.Position
		buttonStartPos = MainButton.Position

		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				isDragging = false
			end
		end)
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		if isDragging and not isPinned then
			if (input.Position - dragStartPos).Magnitude > 8 then
				hasMoved = true
			end

			local delta = input.Position - dragStartPos
			MainButton.Position = UDim2.new(
				buttonStartPos.X.Scale,
				buttonStartPos.X.Offset + delta.X,
				buttonStartPos.Y.Scale,
				buttonStartPos.Y.Offset + delta.Y
			)
		end
	end
end)

MainButton.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		isDragging = false
	end
end)

MainButton.Activated:Connect(function()
	if hasMoved then
		hasMoved = false
		return
	end

	playClickSound()
end)

PinButton.Activated:Connect(function()
	isPinned = not isPinned
	if isPinned then
		PinButton.Text = "🔒"
	else
		PinButton.Text = "🔓"
	end
end)

RunService.RenderStepped:Connect(function()
	for i = #pulseList, 1, -1 do
		local data = pulseList[i]
		local object = data.Object

		if not object.Parent then
			table.remove(pulseList, i)
		else
			local progress = (tick() - data.Start) / 0.8
			local scale = 1 + 0.35 * progress

			object.Size = UDim2.fromScale(scale, scale)
			object.BackgroundColor3 = getPulseColor()
			object.BackgroundTransparency = 0.45 + 0.55 * progress

			if progress >= 1 then
				object:Destroy()
				table.remove(pulseList, i)
				createPulse()
			end
		end
	end
end)

script.Destroying:Connect(function()
	if backgroundMusic then
		backgroundMusic:Stop()
		backgroundMusic:Destroy()
	end
end)
