local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Quantum"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 206, 0, 35)
MainFrame.Position = UDim2.new(0.848, 0, 0, 0)
MainFrame.BackgroundColor3 = Color3.new(1, 1, 1)
MainFrame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 6)
UICorner.Parent = MainFrame

local UIGradient = Instance.new("UIGradient")
UIGradient.Rotation = -173
UIGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromHex("#000000")),
    ColorSequenceKeypoint.new(1, Color3.fromHex("#029aff"))
}
UIGradient.Parent = MainFrame

local UIStroke = Instance.new("UIStroke")
UIStroke.Thickness = 2
UIStroke.Parent = MainFrame

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Name = "TitleLabel"
TitleLabel.Size = UDim2.new(0, 120, 0, 20)
TitleLabel.Position = UDim2.new(0.05, 0, 0.2, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "QuantumDIRS | VIP"
TitleLabel.TextColor3 = Color3.new(1, 1, 1)
TitleLabel.TextScaled = true
TitleLabel.Font = Enum.Font.SciFi
TitleLabel.Parent = MainFrame

local TitleUIGradient = Instance.new("UIGradient")
TitleUIGradient.Rotation = 93
TitleUIGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromHex("#000000")),
    ColorSequenceKeypoint.new(1, Color3.fromHex("#ffffff"))
}
TitleUIGradient.Parent = TitleLabel

local ToggleButton = Instance.new("TextButton")
ToggleButton.Name = "ToggleButton"
ToggleButton.Size = UDim2.new(0, 20, 0, 20)
ToggleButton.Position = UDim2.new(0.85, 0, 0.2, 0)
ToggleButton.BackgroundColor3 = Color3.new(0, 0, 0)
ToggleButton.TextColor3 = Color3.new(1, 1, 1)
ToggleButton.Text = "↓"
ToggleButton.TextScaled = true
ToggleButton.Parent = MainFrame

local ButtonUICorner = Instance.new("UICorner")
ButtonUICorner.CornerRadius = UDim.new(1, 0)
ButtonUICorner.Parent = ToggleButton

local TimeFrame = Instance.new("Frame")
TimeFrame.Name = "TimeFrame"
TimeFrame.Size = UDim2.new(0, 67, 0, 13)
TimeFrame.Position = UDim2.new(0.67, 0, 1.171, 0)
TimeFrame.BackgroundColor3 = Color3.new(1, 1, 1)
TimeFrame.Parent = MainFrame

local TimeFrameUICorner = Instance.new("UICorner")
TimeFrameUICorner.CornerRadius = UDim.new(1, 0)
TimeFrameUICorner.Parent = TimeFrame

local TimeFrameUIGradient = Instance.new("UIGradient")
TimeFrameUIGradient.Rotation = -173
TimeFrameUIGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromHex("#000000")),
    ColorSequenceKeypoint.new(1, Color3.fromHex("#029aff"))
}
TimeFrameUIGradient.Parent = TimeFrame

local TimeFrameUIStroke = Instance.new("UIStroke")
TimeFrameUIStroke.Transparency = 0.54
TimeFrameUIStroke.Parent = TimeFrame

local TextTime = Instance.new("TextLabel")
TextTime.Name = "TextTime"
TextTime.Size = UDim2.new(0, 57, 0, 16)
TextTime.Position = UDim2.new(0.073, 0, -0.163, 0)
TextTime.BackgroundTransparency = 1
TextTime.Text = "00:00:00"
TextTime.TextColor3 = Color3.new(1, 1, 1)
TextTime.TextScaled = true
TextTime.Parent = TimeFrame

local TextUIGradient = Instance.new("UIGradient")
TextUIGradient.Rotation = 93
TextUIGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromHex("#000000")),
    ColorSequenceKeypoint.new(1, Color3.fromHex("#ffffff"))
}
TextUIGradient.Parent = TextTime

local DragScript = Instance.new("LocalScript")
DragScript.Name = "DragScript"
DragScript.Parent = MainFrame

DragScript.Source = [[
local UserInputService = game:GetService("UserInputService")

local Frame = script.Parent
local dragging = false
local dragInput, dragInput, startPos

-- Функция для начала перетаскивания
local function onInputBegan(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = Frame.Position

        -- Захватываем input для предотвращения потери фокуса
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end

-- Функция для обновления позиции
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

-- Подписываемся на события
Frame.InputBegan:Connect(onInputBegan)
Frame.InputChanged:Connect(onInputChanged)

UserInputService.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)
]]


local TimeScript = Instance.new("LocalScript")
TimeScript.Name = "TimeScript"
TimeScript.Parent = TextTime

TimeScript.Source = [[
local TextLabel = script.Parent

-- Функция для форматирования времени (добавляет ведущий ноль)
local function formatTime(number)
    if number < 10 then
        return "0" .. tostring(number)
    else
        return tostring(number)
    end
end

-- Функция для обновления времени
local function updateTime()
    -- Получаем текущее время
    local currentTime = os.date("*t")
    
    -- Форматируем время
    local hours = formatTime(currentTime.hour)
    local minutes = formatTime(currentTime.min)
    local seconds = formatTime(currentTime.sec)
    
    -- Обновляем текст в TextLabel
    TextLabel.Text = hours .. ":" .. minutes .. ":" .. seconds
end

-- Обновляем время сразу при запуске
updateTime()

-- Создаем цикл для постоянного обновления времени
while true do
    wait(1) -- Обновляем каждую секунду
    updateTime()
end
]]

local ButtonAnimationScript = Instance.new("LocalScript")
ButtonAnimationScript.Name = "ButtonAnimationScript"
ButtonAnimationScript.Parent = ToggleButton

ButtonAnimationScript.Source = [[
local TextButton = script.Parent
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

-- Настройки эффекта
local speed = 2
local intensity = 0.7
local transitionSpeed = 0.1

-- Переменные состояния
local isEnabled = false
local animationRunning = false
local currentWaveValue = 0
local targetWaveValue = 0
local timeOffset = 0

-- Функция для плавной интерполяции
local function lerp(a, b, t)
    return a + (b - a) * math.min(t, 1)
end

-- Основная функция анимации
local function updateAnimation()
    if not animationRunning then return end

    local time = tick() * speed + timeOffset

    if isEnabled then
        -- Анимация включена - создаем волну
        targetWaveValue = (math.sin(time) + 1) / 2
    else
        -- Анимация выключена - плавно возвращаемся к исходному состоянию
        targetWaveValue = 0
    end

    -- Плавная интерполяция
    currentWaveValue = lerp(currentWaveValue, targetWaveValue, transitionSpeed)

    -- Применяем цвета
    local textColorValue = 1 - (currentWaveValue * intensity)
    local bgColorValue = currentWaveValue * intensity

    TextButton.TextColor3 = Color3.new(textColorValue, textColorValue, textColorValue)
    TextButton.BackgroundColor3 = Color3.new(bgColorValue, bgColorValue, bgColorValue)

    -- Если выключено и достигли целевого значения, останавливаем анимацию
    if not isEnabled and math.abs(currentWaveValue - targetWaveValue) < 0.01 then
        animationRunning = false
    end
end

-- Функция переключения
local function toggleButton()
    isEnabled = not isEnabled
    animationRunning = true
    timeOffset = tick() -- Сбрасываем время для плавного перехода

    if isEnabled then
        TextButton.Text = "↑"
    else
        TextButton.Text = "↓"
    end
end

-- Запускаем основной цикл анимации
RunService.Heartbeat:Connect(updateAnimation)

-- Обработчик клика
TextButton.MouseButton1Click:Connect(toggleButton)

-- Начальная настройка
TextButton.Text = "↓"
TextButton.TextColor3 = Color3.new(1, 1, 1)
TextButton.BackgroundColor3 = Color3.new(0, 0, 0)

-- Дополнительно: меняем курсор при наведении
TextButton.MouseEnter:Connect(function()
    TextButton.Cursor = "PointingHand"
end)

TextButton.MouseLeave:Connect(function()
    TextButton.Cursor = "Arrow"
end)
]]

local ButtonFunctionScript = Instance.new("LocalScript")
ButtonFunctionScript.Name = "ButtonFunctionScript"
ButtonFunctionScript.Parent = ToggleButton

ButtonFunctionScript.Source = [[
script.Parent.MouseButton1Click:Connect(function()
    script.Parent.Parent.MainFrame.Visible = not script.Parent.Parent.MainFrame.Visible
end)
]]