local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Quantum"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.BackgroundColor3 = Color3.new(0, 0, 0)
MainFrame.BackgroundTransparency = 0.2
MainFrame.Position = UDim2.new(0.819, 0, 0.015, 0)
MainFrame.Size = UDim2.new(0, 234, 0, 33)
MainFrame.Parent = ScreenGui

local UICorner1 = Instance.new("UICorner")
UICorner1.CornerRadius = UDim.new(0, 6)
UICorner1.Parent = MainFrame

local UIStroke1 = Instance.new("UIStroke")
UIStroke1.Color = Color3.new(0, 0, 0)
UIStroke1.Thickness = 2.7
UIStroke1.Transparency = 0.44
UIStroke1.Parent = MainFrame

local FrameGui = Instance.new("Frame")
FrameGui.Name = "FrameGui"
FrameGui.BackgroundColor3 = Color3.new(1, 1, 1)
FrameGui.BackgroundTransparency = 0.2
FrameGui.Position = UDim2.new(-3.888, 0, 3.583, 0)
FrameGui.Size = UDim2.new(0, 899, 0, 609)
FrameGui.Visible = false
FrameGui.Parent = ScreenGui

local FrameGuiUIGradient = Instance.new("UIGradient")
FrameGuiUIGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
    ColorSequenceKeypoint.new(0.505, Color3.fromRGB(255, 255, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(76, 76, 76))
}
FrameGuiUIGradient.Rotation = 43
FrameGuiUIGradient.Parent = FrameGui

local FrameGuiUICorner = Instance.new("UICorner")
FrameGuiUICorner.CornerRadius = UDim.new(0, 6)
FrameGuiUICorner.Parent = FrameGui

local FrameGuiUIStroke = Instance.new("UIStroke")
FrameGuiUIStroke.Color = Color3.new(0, 0, 0)
FrameGuiUIStroke.Thickness = 2.7
FrameGuiUIStroke.Transparency = 0.44
FrameGuiUIStroke.Parent = FrameGui

local ImageButton = Instance.new("ImageButton")
ImageButton.Name = "ImageButton"
ImageButton.BackgroundColor3 = Color3.new(1, 1, 1)
ImageButton.BackgroundTransparency = 1
ImageButton.Image = "rbxassetid://71134772354376"
ImageButton.Size = UDim2.new(0, 33, 0, 33)
ImageButton.Position = UDim2.new(-0.185, 0, 0, 0)
ImageButton.Parent = MainFrame

local UICorner2 = Instance.new("UICorner")
UICorner2.CornerRadius = UDim.new(0, 6)
UICorner2.Parent = ImageButton

local UIStroke2 = Instance.new("UIStroke")
UIStroke2.Color = Color3.new(0, 0, 0)
UIStroke2.Thickness = 2.7
UIStroke2.Transparency = 0.44
UIStroke2.Parent = ImageButton

local ImageLabel = Instance.new("ImageLabel")
ImageLabel.Name = "ImageLabel"
ImageLabel.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel.BackgroundTransparency = 1
ImageLabel.Image = "rbxassetid://6846329320"
ImageLabel.Position = UDim2.new(0.6, 0, 0.122, 0)
ImageLabel.Size = UDim2.new(0, 23, 0, 23)
ImageLabel.Parent = ImageButton

local UICorner3 = Instance.new("UICorner")
UICorner3.CornerRadius = UDim.new(1, 0)
UICorner3.Parent = ImageLabel

local UIGradient1 = Instance.new("UIGradient")
UIGradient1.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
    ColorSequenceKeypoint.new(0.505, Color3.fromRGB(255, 255, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(76, 76, 76))
}
UIGradient1.Rotation = 62
UIGradient1.Parent = ImageLabel

local TimeLabel = Instance.new("TextLabel")
TimeLabel.Name = "TimeLabel"
TimeLabel.BackgroundColor3 = Color3.new(0, 0, 0)
TimeLabel.BackgroundTransparency = 1
TimeLabel.Position = UDim2.new(0.743, 0, 0.061, 0)
TimeLabel.Size = UDim2.new(0, 45, 0, 28)
TimeLabel.Text = "00:00:00"
TimeLabel.TextColor3 = Color3.new(1, 1, 1)
TimeLabel.TextSize = 21
TimeLabel.Font = Enum.Font.SourceSans
TimeLabel.Parent = MainFrame

local UIGradient2 = Instance.new("UIGradient")
UIGradient2.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
    ColorSequenceKeypoint.new(0.505, Color3.fromRGB(255, 255, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(76, 76, 76))
}
UIGradient2.Rotation = 62
UIGradient2.Parent = TimeLabel

local QuantumLabel = Instance.new("TextLabel")
QuantumLabel.Name = "QuantumLabel"
QuantumLabel.BackgroundColor3 = Color3.new(0, 0, 0)
QuantumLabel.BackgroundTransparency = 1
QuantumLabel.Position = UDim2.new(0.179, 0, 0.061, 0)
QuantumLabel.Size = UDim2.new(0, 45, 0, 28)
QuantumLabel.Text = "QuantumDIRS"
QuantumLabel.TextColor3 = Color3.new(1, 1, 1)
QuantumLabel.TextSize = 21
QuantumLabel.Font = Enum.Font.SourceSans
QuantumLabel.Parent = MainFrame

local UIGradient3 = Instance.new("UIGradient")
UIGradient3.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
    ColorSequenceKeypoint.new(0.505, Color3.fromRGB(255, 255, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(76, 76, 76))
}
UIGradient3.Rotation = 62
UIGradient3.Parent = QuantumLabel

local dragging = false
local dragInput, dragStart, startPos

local function update(input)
    local delta = input.Position - dragStart
    MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

MainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

local frameDragging = false
local frameDragInput, frameDragStart, frameStartPos

local function updateFrame(input)
    local delta = input.Position - frameDragStart
    FrameGui.Position = UDim2.new(frameStartPos.X.Scale, frameStartPos.X.Offset + delta.X, frameStartPos.Y.Scale, frameStartPos.Y.Offset + delta.Y)
end

FrameGui.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        frameDragging = true
        frameDragStart = input.Position
        frameStartPos = FrameGui.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                frameDragging = false
            end
        end)
    end
end)

FrameGui.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        frameDragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == frameDragInput and frameDragging then
        updateFrame(input)
    end
end)

local speed = 1.5
local waveCount = 3

local function updateStrokeColor()
    local time = tick() * speed
    local waveValue = 0
    for i = 1, waveCount do
        waveValue = waveValue + math.sin(time + i * math.pi/waveCount)
    end
    waveValue = waveValue / waveCount
    local normalizedValue = (waveValue + 1) / 2
    FrameGuiUIStroke.Color = Color3.new(normalizedValue, normalizedValue, normalizedValue)
end

RunService.Heartbeat:Connect(function()
    updateStrokeColor()
end)

ImageButton.MouseButton1Click:Connect(function()
    FrameGui.Visible = not FrameGui.Visible
end)

local function formatTime(hours, minutes, seconds)
    return string.format("%02d:%02d:%02d", hours, minutes, seconds)
end

local function updateTime()
    local timeInfo = os.date("*t", os.time())
    TimeLabel.Text = formatTime(timeInfo.hour, timeInfo.min, timeInfo.sec)
end

updateTime()
while true do
    wait(1)
    updateTime()
end