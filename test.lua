local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Quantum"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

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

local LocalScript = Instance.new("LocalScript")
LocalScript.Parent = MainFrame

local FrameGui = Instance.new("Frame")
FrameGui.Name = "FrameGui"
FrameGui.BackgroundColor3 = Color3.new(1, 1, 1)
FrameGui.BackgroundTransparency = 0.2
FrameGui.Position = UDim2.new(-3.888, 0, 3.583, 0)
FrameGui.Size = UDim2.new(0, 899, 0, 609)
FrameGui.Parent = ScreenGui

local ImageButton = Instance.new("ImageButton")
ImageButton.BackgroundColor3 = Color3.new(1, 1, 1)
ImageButton.BackgroundTransparency = 1
ImageButton.Image = "rbxassetid://71134772354376"
ImageButton.Size = UDim2.new(0, 33, 0, 33)
ImageButton.Position = UDim2.new(-0.185, 0, 0, 0)
ImageButton.Parent = FrameGui

local UICorner2 = Instance.new("UICorner")
UICorner2.CornerRadius = UDim.new(0, 6)
UICorner2.Parent = ImageButton

local UIStroke2 = Instance.new("UIStroke")
UIStroke2.Color = Color3.new(0, 0, 0)
UIStroke2.Thickness = 2.7
UIStroke2.Transparency = 0.44
UIStroke2.Parent = ImageButton

local LocalScript2 = Instance.new("LocalScript")
LocalScript2.Parent = ImageButton

local ImageLabel = Instance.new("ImageLabel")
ImageLabel.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel.BackgroundTransparency = 1
ImageLabel.Image = "rbxassetid://6846329320"
ImageLabel.Position = UDim2.new(0.6, 0, 0.122, 0)
ImageLabel.Size = UDim2.new(0, 23, 0, 23)
ImageLabel.Parent = ImageButton

local UICorner3 = Instance.new("UICorner")
UICorner3.CornerRadius = UDim.new(1, 0)
UICorner3.Parent = ImageLabel

local UIGradient = Instance.new("UIGradient")
UIGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
    ColorSequenceKeypoint.new(0.505, Color3.fromRGB(255, 255, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(76, 76, 76))
}
UIGradient.Rotation = 62
UIGradient.Parent = ImageLabel

-- Код для LocalScript (перетаскивание)
local draggingScript = [[
local UserInputService = game:GetService("UserInputService")

local Frame = script.Parent
local dragging = false
local dragInput, dragStart, startPos

local function onInputBegan(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = Frame.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end

local function onInputChanged(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        Frame.Position = UDim2.new(
            startPos.X.Scale, 
            startPos.X.Offset + delta.X,
            startPos.Y.Scale, 
            startPos.Y.Offset + delta.Y
        )
    end
end

Frame.InputBegan:Connect(onInputBegan)
Frame.InputChanged:Connect(onInputChanged)

UserInputService.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)
]]

LocalScript.Source = draggingScript

-- Код для LocalScript2 (переключение видимости)
local toggleScript = [[
script.Parent.MouseButton1Click:Connect(function()
    script.Parent.Parent.MainFrame.Visible = not script.Parent.Parent.MainFrame.Visible
end)
]]

LocalScript2.Source = toggleScript