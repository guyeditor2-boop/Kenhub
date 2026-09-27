-- generated using SL | Source Leak
-- https://discord.gg/x7YbZeezpm

repeat
	task.wait()
until game:IsLoaded()

while true do
	task.wait()
	if not (game:GetService("Players") and game:GetService("Players").LocalPlayer) then
		continue
	end
	break
end

local obj = setmetatable({}, { __index = function(param1, serviceName)
	return game:GetService(serviceName)
end })

local players = obj.Players
local replicatedStorage = obj.ReplicatedStorage
local workspace = obj.Workspace
local runService = obj.RunService
local httpService = obj.HttpService
local virtualInputManager = obj.VirtualInputManager
local starterGui = obj.StarterGui
local lighting = obj.Lighting
local localPlayer = players.LocalPlayer
local playerGui = localPlayer:WaitForChild("PlayerGui")
local currentCamera = workspace.CurrentCamera
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Workspace = game:GetService("Workspace")
local localPlayer2 = Players.LocalPlayer

if not localPlayer2 then
	Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
	localPlayer2 = Players.LocalPlayer
end

local genv = type(getgenv) == "function" and getgenv() or _G

local function func1()
	local autoBountyConfig = type(genv.AutoBountyConfig) == "table" and genv.AutoBountyConfig or {}
	return type(autoBountyConfig.Status) == "table" and autoBountyConfig.Status or {}
end

local tbl1 = {}
local colorIslandGui = nil

local tbl2 = {
	SleepWidth = 56,
	SleepDelay = 16,
	DormantWidth = 148,
	CompactWidth = 544,
	ExpandedWidth = 544,
	BarHeight = 56,
	BarHeightDetail = 76,
	TitleRow = 26,
	DetailRow = 19,
	TrackInset = 8,
	CardBlock = 232,
	TopOffset = 16,
	MinimumScale = 0.4,
	MaximumScale = 0.62,
	HoldDuration = 1.8,
	SuccessHold = 2.6,
	ErrorHold = 3,
	CardHold = 9,
	LogLimit = 60,
	QueueLimit = 12,
	ReaderMinWidth = 280,
	ReaderMaxWidth = 860,
	ReaderMinHeight = 240,
	ReaderMaxHeight = 560,
	ReaderWidthRatio = 0.92,
	ReaderHeightRatio = 0.8,
	ReaderNarrowUnder = 520,
	ReaderRowHeight = 34,
	ReaderRowHeightNarrow = 38,
}

local tbl3 = {
	Shell = Color3.fromRGB(0, 0, 0),
	ShellTop = Color3.fromRGB(26, 26, 30),
	ShellBottom = Color3.fromRGB(4, 4, 6),
	Title = Color3.fromRGB(244, 244, 248),
	Body = Color3.fromRGB(206, 206, 214),
	Muted = Color3.fromRGB(132, 132, 142),
	Hairline = Color3.fromRGB(255, 255, 255),
	White = Color3.fromRGB(255, 255, 255),
	Black = Color3.fromRGB(0, 0, 0),
}

local tbl4 = {
	Info = { Color = Color3.fromRGB(94, 200, 255), Glyph = "Dot", Live = "Pulse", Priority = 2 },
	Debug = { Color = Color3.fromRGB(142, 142, 152), Glyph = "Dot", Live = "Pulse", Priority = 1 },
	Working = { Color = Color3.fromRGB(48, 209, 122), Glyph = "Spinner", Live = "Equalizer", Priority = 1 },
	Travel = { Color = Color3.fromRGB(58, 140, 255), Glyph = "Spinner", Live = "Stream", Priority = 1 },
	Trial = { Color = Color3.fromRGB(186, 104, 255), Glyph = "Spinner", Live = "Equalizer", Priority = 1 },
	Combat = { Color = Color3.fromRGB(255, 148, 48), Glyph = "Spinner", Live = "Equalizer", Priority = 1 },
	Waiting = { Color = Color3.fromRGB(255, 206, 42), Glyph = "Breath", Live = "Pulse", Priority = 2 },
	Warning = { Color = Color3.fromRGB(255, 206, 42), Glyph = "Bang", Live = "Pulse", Priority = 3 },
	Success = { Color = Color3.fromRGB(48, 209, 122), Glyph = "Check", Live = "Pulse", Priority = 4 },
	Error = { Color = Color3.fromRGB(255, 82, 74), Glyph = "Cross", Live = "Pulse", Priority = 5 },
}

local function func2(param2, param3, param4)
	return { Value = param2, Target = param2, Velocity = 0, Stiffness = param3, Damping = param4 }
end

local function func3(num1, param5)
	local n = math.min(param5, 0.1)

	while n > 0 do
		local n2 = math.min(0.0041666666666666666, n)
		num1.Velocity = num1.Velocity + ((num1.Target - num1.Value) * num1.Stiffness + -num1.Velocity * num1.Damping) * n2
		num1.Value = num1.Value + num1.Velocity * n2
		n -= n2
	end
end

local function createUICorner(parent, cornerRadius)
	local uiCorner = Instance.new("UICorner")
	uiCorner.CornerRadius = cornerRadius
	uiCorner.Parent = parent
	return uiCorner
end

local function createFrame(parent, name, zIndex)
	local frame = Instance.new("Frame")
	frame.Name = name
	frame.BackgroundColor3 = tbl3.White
	frame.BorderSizePixel = 0
	frame.ZIndex = zIndex or 2
	frame.Parent = parent
	return frame
end

local function createTextLabel(parent, name, font, textSize, textColor3, textXAlignment, zIndex)
	local textLabel = Instance.new("TextLabel")
	textLabel.Name = name
	textLabel.AutoLocalize = false
	textLabel.BackgroundTransparency = 1
	textLabel.Font = font
	textLabel.Text = ""
	textLabel.TextSize = textSize
	textLabel.TextColor3 = textColor3
	textLabel.TextXAlignment = textXAlignment
	textLabel.TextYAlignment = Enum.TextYAlignment.Center
	textLabel.TextTruncate = Enum.TextTruncate.AtEnd
	textLabel.ZIndex = zIndex or 4
	textLabel.Parent = parent
	return textLabel
end

local function func4(obj1, param6, param7)
	return obj1:Lerp(param6, param7)
end

local function func5(param8)
	local n = math.max(math.floor(param8), 0)
	local n2 = math.floor(n / 3600)
	local n3 = math.floor(n % 3600 / 60)
	local n4 = n % 60
	if n2 > 0 then
		return string.format("%d:%02d:%02d", n2, n3, n4)
	end
	return string.format("%02d:%02d", n3, n4)
end

local function func6(flag1, flag2, param9)
	return string.format("%d %s", flag1, flag1 == 1 and flag2 or param9)
end

local function func7()
	local ok, result = pcall(function()
		return DateTime.now():FormatLocalTime("HH:mm:ss", "en-us")
	end)

	if ok and typeof(result) == "string" then
		return result
	end
	return "--:--:--"
end

tbl1.Build = function()
	local tbl5 = {
		AccentColor = Color3.fromRGB(58, 140, 255),
		AnimationSpeed = 1,
		ReduceMotion = false,
		Transparency = 0,
	}

	for k, value1 in pairs(func1()) do
		tbl5[k] = value1
	end

	local reduceMotion = tbl5.ReduceMotion == true
	local n = 1

	if typeof(tbl5.AnimationSpeed) == "number" then
		n = math.clamp(tbl5.AnimationSpeed, 0.25, 3)
	end

	local backgroundTransparency = 0

	if typeof(tbl5.Transparency) == "number" then
		backgroundTransparency = math.clamp(tbl5.Transparency, 0, 0.5)
	end

	local accentColor = typeof(tbl5.AccentColor) == "Color3" and tbl5.AccentColor or Color3.fromRGB(58, 140, 255)
	local playerGui2 = localPlayer2:WaitForChild("PlayerGui")
	local colorIslandGui2 = playerGui2:FindFirstChild("ColorIslandGui")

	if colorIslandGui2 then
		colorIslandGui2:Destroy()
	end

	local tbl6 = {}

	local tbl7 = {
		Tier = "Dormant",
		Accent = accentColor,
		Glyph = "Dot",
		Live = "Pulse",
		Destroyed = false,
		HoldToken = 0,
		CardToken = 0,
		Pinned = false,
		Clock = 0,
		SessionStart = os.clock(),
		SessionEnd = nil,
		Complete = false,
		Title = "Idle",
		Detail = "",
		Retries = 0,
		Events = 0,
		Issues = 0,
		Progress = nil,
		CurrentPriority = -1,
		ReaderOpen = false,
		ReaderWidth = tbl2.ReaderMaxWidth,
		ReaderHeight = tbl2.ReaderMaxHeight,
		ReaderRowHeight = tbl2.ReaderRowHeight,
		ReaderNarrow = false,
		ReaderOriginX = 0,
		ReaderOriginY = 0,
		ReaderOriginWidth = 80,
		ReaderTargetX = 0,
		ReaderTargetY = 0,
	}

	local tbl8 = {
		Width = func2(tbl2.DormantWidth, 200, 26),
		Height = func2(tbl2.BarHeight, 200, 26),
		Radius = func2(tbl2.BarHeight / 2, 220, 30),
		TitleAlpha = func2(0, 260, 30),
		CardAlpha = func2(0, 240, 30),
		Press = func2(1, 420, 26),
		Bloom = func2(0, 160, 26),
		Progress = func2(0, 180, 28),
		Reader = func2(0, 240, 24),
		Bar = func2(tbl2.BarHeight, 200, 26),
	}

	local list1 = {}
	local tbl9 = {}
	local tbl10 = {}
	local flag3 = false

	local function func8(param10)
		table.insert(tbl10, param10)
		return param10
	end

	local screenGui = Instance.new("ScreenGui")
	screenGui.Name = "ColorIslandGui"
	screenGui.DisplayOrder = 999
	screenGui.IgnoreGuiInset = true
	screenGui.AutoLocalize = false
	screenGui.ResetOnSpawn = false
	screenGui.ScreenInsets = Enum.ScreenInsets.None
	screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	local frame = Instance.new("Frame")
	frame.Name = "Anchor"
	frame.AnchorPoint = Vector2.new(0.5, 0)
	frame.Position = UDim2.new(0.5, 0, 0, tbl2.TopOffset)
	frame.Size = UDim2.fromOffset(tbl2.CompactWidth, tbl2.BarHeight)
	frame.BackgroundTransparency = 1
	frame.BorderSizePixel = 0
	frame.ZIndex = 1
	frame.Parent = screenGui
	tbl6.Scale = Instance.new("UIScale")
	tbl6.Scale.Name = "ResponsiveScale"
	tbl6.Scale.Scale = tbl2.MaximumScale
	tbl6.Scale.Parent = frame
	tbl6.Bloom = {}
	tbl6.BloomCorners = {}

	for i = 1, 5 do
		local frame3 = createFrame(frame, "Bloom" .. i, 1)
		frame3.AnchorPoint = Vector2.new(0.5, 0.5)
		frame3.Position = UDim2.new(0.5, 0, 0, tbl2.BarHeight / 2)
		frame3.BackgroundTransparency = 1
		tbl6.BloomCorners[i] = createUICorner(frame3, UDim.new(0, 30))
		tbl6.Bloom[i] = frame3
	end

	tbl6.Shell = createFrame(frame, "Shell", 2)
	tbl6.Shell.AnchorPoint = Vector2.new(0.5, 0)
	tbl6.Shell.Position = UDim2.fromScale(0.5, 0)
	tbl6.Shell.BackgroundColor3 = tbl3.Shell
	tbl6.Shell.BackgroundTransparency = backgroundTransparency
	tbl6.Shell.ClipsDescendants = true
	tbl6.ShellCorner = createUICorner(tbl6.Shell, UDim.new(1, 0))
	local uiGradient = Instance.new("UIGradient")
	uiGradient.Name = "Depth"
	local colorSequence = ColorSequence.new
	local value2 = ColorSequenceKeypoint.new(0, tbl3.ShellTop)
	local value3 = ColorSequenceKeypoint.new(0.5, tbl3.ShellBottom)
	local new = ColorSequenceKeypoint.new
	local shell = tbl3.Shell
	local tbl11 = { value2, value3 }
	-- join us: https://discord.gg/x7YbZeezpm

	do
		local values = table.pack(new(1, shell))
		table.move(values, 1, values.n, 3, tbl11)
	end

	uiGradient.Color = colorSequence(tbl11)
	uiGradient.Rotation = 90
	uiGradient.Parent = tbl6.Shell
	tbl6.Stroke = Instance.new("UIStroke")
	tbl6.Stroke.Name = "Edge"
	tbl6.Stroke.Color = tbl3.White
	tbl6.Stroke.Transparency = 0.88
	tbl6.Stroke.Thickness = 1
	tbl6.Stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	tbl6.Stroke.Parent = tbl6.Shell
	tbl6.Wash = createFrame(tbl6.Shell, "Wash", 3)
	tbl6.Wash.Size = UDim2.fromScale(1, 1)
	tbl6.Wash.BackgroundTransparency = 1
	tbl6.WashCorner = createUICorner(tbl6.Wash, UDim.new(0, 28))
	tbl6.Hairline = createFrame(tbl6.Shell, "Hairline", 4)
	tbl6.Hairline.AnchorPoint = Vector2.new(0.5, 0)
	tbl6.Hairline.Position = UDim2.new(0.5, 0, 0, 2)
	tbl6.Hairline.Size = UDim2.new(0.62, 0, 0, 1)
	tbl6.Hairline.BackgroundTransparency = 0.55
	local uiGradient2 = Instance.new("UIGradient")
	uiGradient2.Name = "Fade"
	local numberSequence = NumberSequence.new
	local value4 = NumberSequenceKeypoint.new(0, 1)
	local value5 = NumberSequenceKeypoint.new(0.5, 0)
	local new2 = NumberSequenceKeypoint.new
	local tbl12 = { value4, value5 }

	do
		local values = table.pack(new2(1, 1))
		table.move(values, 1, values.n, 3, tbl12)
	end

	uiGradient2.Transparency = numberSequence(tbl12)
	uiGradient2.Parent = tbl6.Hairline
	tbl6.Content = Instance.new("Frame")
	tbl6.Content.Name = "Content"
	tbl6.Content.Size = UDim2.fromScale(1, 1)
	tbl6.Content.BackgroundTransparency = 1
	tbl6.Content.BorderSizePixel = 0
	tbl6.Content.ZIndex = 5
	tbl6.Content.Parent = tbl6.Shell
	tbl6.Header = Instance.new("Frame")
	tbl6.Header.Name = "Header"
	tbl6.Header.Size = UDim2.new(1, 0, 0, tbl2.BarHeight)
	tbl6.Header.BackgroundTransparency = 1
	tbl6.Header.BorderSizePixel = 0
	tbl6.Header.ZIndex = 5
	tbl6.Header.Parent = tbl6.Content
	tbl6.Slot = Instance.new("Frame")
	tbl6.Slot.Name = "IconSlot"
	tbl6.Slot.AnchorPoint = Vector2.new(0.5, 0.5)
	tbl6.Slot.Position = UDim2.fromOffset(32, tbl2.BarHeight / 2)
	tbl6.Slot.Size = UDim2.fromOffset(30, 30)
	tbl6.Slot.BackgroundTransparency = 1
	tbl6.Slot.BorderSizePixel = 0
	tbl6.Slot.ZIndex = 6
	tbl6.Slot.Parent = tbl6.Header
	tbl6.Halo = createFrame(tbl6.Slot, "Halo", 6)
	tbl6.Halo.AnchorPoint = Vector2.new(0.5, 0.5)
	tbl6.Halo.Position = UDim2.fromScale(0.5, 0.5)
	tbl6.Halo.Size = UDim2.fromOffset(30, 30)
	tbl6.Halo.BackgroundTransparency = 0.78
	createUICorner(tbl6.Halo, UDim.new(1, 0))
	tbl6.GlyphDot = createFrame(tbl6.Slot, "GlyphDot", 7)
	tbl6.GlyphDot.AnchorPoint = Vector2.new(0.5, 0.5)
	tbl6.GlyphDot.Position = UDim2.fromScale(0.5, 0.5)
	tbl6.GlyphDot.Size = UDim2.fromOffset(12, 12)
	createUICorner(tbl6.GlyphDot, UDim.new(1, 0))
	tbl6.GlyphSpin = Instance.new("Frame")
	tbl6.GlyphSpin.Name = "GlyphSpin"
	tbl6.GlyphSpin.AnchorPoint = Vector2.new(0.5, 0.5)
	tbl6.GlyphSpin.Position = UDim2.fromScale(0.5, 0.5)
	tbl6.GlyphSpin.Size = UDim2.fromOffset(20, 20)
	tbl6.GlyphSpin.BackgroundTransparency = 1
	tbl6.GlyphSpin.BorderSizePixel = 0
	tbl6.GlyphSpin.ZIndex = 7
	tbl6.GlyphSpin.Parent = tbl6.Slot
	tbl6.SpinRing = createFrame(tbl6.GlyphSpin, "Ring", 7)
	tbl6.SpinRing.Size = UDim2.fromScale(1, 1)
	tbl6.SpinRing.BackgroundTransparency = 1
	createUICorner(tbl6.SpinRing, UDim.new(1, 0))
	local uiStroke = Instance.new("UIStroke")
	uiStroke.Name = "RingStroke"
	uiStroke.Thickness = 2
	uiStroke.Transparency = 0.72
	uiStroke.Parent = tbl6.SpinRing
	tbl6.SpinStroke = uiStroke
	tbl6.SpinHead = createFrame(tbl6.GlyphSpin, "Head", 8)
	tbl6.SpinHead.AnchorPoint = Vector2.new(0.5, 0.5)
	tbl6.SpinHead.Position = UDim2.fromScale(0.5, 0)
	tbl6.SpinHead.Size = UDim2.fromOffset(6, 6)
	createUICorner(tbl6.SpinHead, UDim.new(1, 0))
	tbl6.GlyphCheck = Instance.new("Frame")
	tbl6.GlyphCheck.Name = "GlyphCheck"
	tbl6.GlyphCheck.AnchorPoint = Vector2.new(0.5, 0.5)
	tbl6.GlyphCheck.Position = UDim2.fromScale(0.5, 0.5)
	tbl6.GlyphCheck.Size = UDim2.fromOffset(20, 20)
	tbl6.GlyphCheck.BackgroundTransparency = 1
	tbl6.GlyphCheck.BorderSizePixel = 0
	tbl6.GlyphCheck.ZIndex = 7
	tbl6.GlyphCheck.Parent = tbl6.Slot
	tbl6.CheckShort = createFrame(tbl6.GlyphCheck, "Short", 8)
	tbl6.CheckShort.AnchorPoint = Vector2.new(0.5, 0.5)
	tbl6.CheckShort.Position = UDim2.fromOffset(6, 12)
	tbl6.CheckShort.Size = UDim2.fromOffset(8, 2.5)
	tbl6.CheckShort.Rotation = 45
	createUICorner(tbl6.CheckShort, UDim.new(1, 0))
	tbl6.CheckLong = createFrame(tbl6.GlyphCheck, "Long", 8)
	tbl6.CheckLong.AnchorPoint = Vector2.new(0.5, 0.5)
	tbl6.CheckLong.Position = UDim2.fromOffset(12, 9)
	tbl6.CheckLong.Size = UDim2.fromOffset(15, 2.5)
	tbl6.CheckLong.Rotation = -45
	createUICorner(tbl6.CheckLong, UDim.new(1, 0))
	tbl6.GlyphCross = Instance.new("Frame")
	tbl6.GlyphCross.Name = "GlyphCross"
	tbl6.GlyphCross.AnchorPoint = Vector2.new(0.5, 0.5)
	tbl6.GlyphCross.Position = UDim2.fromScale(0.5, 0.5)
	tbl6.GlyphCross.Size = UDim2.fromOffset(20, 20)
	tbl6.GlyphCross.BackgroundTransparency = 1
	tbl6.GlyphCross.BorderSizePixel = 0
	tbl6.GlyphCross.ZIndex = 7
	tbl6.GlyphCross.Parent = tbl6.Slot

	for i = 1, 2 do
		local glyphCross = createFrame(tbl6.GlyphCross, "Stroke" .. i, 8)
		glyphCross.AnchorPoint = Vector2.new(0.5, 0.5)
		glyphCross.Position = UDim2.fromScale(0.5, 0.5)
		glyphCross.Size = UDim2.fromOffset(15, 2.5)
		glyphCross.Rotation = i == 1 and 45 or -45
		createUICorner(glyphCross, UDim.new(1, 0))
	end

	tbl6.GlyphBang = Instance.new("Frame")
	tbl6.GlyphBang.Name = "GlyphBang"
	tbl6.GlyphBang.AnchorPoint = Vector2.new(0.5, 0.5)
	tbl6.GlyphBang.Position = UDim2.fromScale(0.5, 0.5)
	tbl6.GlyphBang.Size = UDim2.fromOffset(20, 20)
	tbl6.GlyphBang.BackgroundTransparency = 1
	tbl6.GlyphBang.BorderSizePixel = 0
	tbl6.GlyphBang.ZIndex = 7
	tbl6.GlyphBang.Parent = tbl6.Slot
	tbl6.BangStem = createFrame(tbl6.GlyphBang, "Stem", 8)
	tbl6.BangStem.AnchorPoint = Vector2.new(0.5, 0)
	tbl6.BangStem.Position = UDim2.fromOffset(10, 3)
	tbl6.BangStem.Size = UDim2.fromOffset(2.5, 9)
	createUICorner(tbl6.BangStem, UDim.new(1, 0))
	tbl6.BangDot = createFrame(tbl6.GlyphBang, "Tip", 8)
	tbl6.BangDot.AnchorPoint = Vector2.new(0.5, 0.5)
	tbl6.BangDot.Position = UDim2.fromOffset(10, 16)
	tbl6.BangDot.Size = UDim2.fromOffset(2.5, 2.5)
	createUICorner(tbl6.BangDot, UDim.new(1, 0))

	tbl6.Glyphs = {
		Dot = tbl6.GlyphDot,
		Breath = tbl6.GlyphDot,
		Spinner = tbl6.GlyphSpin,
		Check = tbl6.GlyphCheck,
		Cross = tbl6.GlyphCross,
		Bang = tbl6.GlyphBang,
	}

	tbl6.TitleClip = Instance.new("CanvasGroup")
	tbl6.TitleClip.Name = "TitleClip"
	tbl6.TitleClip.Position = UDim2.fromOffset(58, 9)
	tbl6.TitleClip.Size = UDim2.new(1, -150, 0, 26)
	tbl6.TitleClip.BackgroundTransparency = 1
	tbl6.TitleClip.GroupTransparency = 1
	tbl6.TitleClip.BorderSizePixel = 0
	tbl6.TitleClip.ClipsDescendants = true
	tbl6.TitleClip.ZIndex = 6
	tbl6.TitleClip.Parent = tbl6.Header
	tbl6.TitleA = createTextLabel(tbl6.TitleClip, "TitleA", Enum.Font.GothamBold, 20, tbl3.Title, Enum.TextXAlignment.Left, 6)
	tbl6.TitleA.Size = UDim2.fromScale(1, 1)
	tbl6.TitleB = createTextLabel(tbl6.TitleClip, "TitleB", Enum.Font.GothamBold, 20, tbl3.Title, Enum.TextXAlignment.Left, 6)
	tbl6.TitleB.Size = UDim2.fromScale(1, 1)
	tbl6.TitleB.TextTransparency = 1
	tbl6.ActiveTitle = tbl6.TitleA
	tbl6.Detail = createTextLabel(tbl6.Header, "Detail", Enum.Font.GothamMedium, 16, tbl3.Muted, Enum.TextXAlignment.Left, 6)
	tbl6.Detail.Position = UDim2.fromOffset(58, 36)
	tbl6.Detail.Size = UDim2.new(1, -150, 0, 19)
	tbl6.Trail = Instance.new("Frame")
	tbl6.Trail.Name = "Trail"
	tbl6.Trail.AnchorPoint = Vector2.new(1, 0.5)
	tbl6.Trail.Position = UDim2.new(1, -22, 0, tbl2.BarHeight / 2)
	tbl6.Trail.Size = UDim2.fromOffset(58, 30)
	tbl6.Trail.BackgroundTransparency = 1
	tbl6.Trail.BorderSizePixel = 0
	tbl6.Trail.ZIndex = 6
	tbl6.Trail.Parent = tbl6.Header
	tbl6.Bars = {}

	for i = 1, 4 do
		local trail = createFrame(tbl6.Trail, "Bar" .. i, 7)
		trail.AnchorPoint = Vector2.new(0.5, 0.5)
		trail.Position = UDim2.new(1, -6 - (4 - i) * 9, 0.5, 0)
		trail.Size = UDim2.fromOffset(3.5, 10)
		createUICorner(trail, UDim.new(1, 0))
		tbl6.Bars[i] = trail
	end

	tbl6.Pulse = createFrame(tbl6.Trail, "Pulse", 7)
	tbl6.Pulse.AnchorPoint = Vector2.new(1, 0.5)
	tbl6.Pulse.Position = UDim2.new(1, 0, 0.5, 0)
	tbl6.Pulse.Size = UDim2.fromOffset(8, 8)
	tbl6.Pulse.BackgroundTransparency = 1
	createUICorner(tbl6.Pulse, UDim.new(1, 0))
	tbl6.Pips = {}

	for i = 1, 3 do
		local header = createFrame(tbl6.Header, "Pip" .. i, 7)
		header.AnchorPoint = Vector2.new(0.5, 0.5)
		header.Position = UDim2.new(1, -22 - (3 - i) * 7, 0, 12)
		header.Size = UDim2.fromOffset(3.5, 3.5)
		header.BackgroundTransparency = 1
		createUICorner(header, UDim.new(1, 0))
		tbl6.Pips[i] = header
	end

	tbl6.Track = createFrame(tbl6.Header, "Track", 6)
	tbl6.Track.Position = UDim2.fromOffset(58, 57)
	tbl6.Track.Size = UDim2.new(1, -80, 0, 2)
	tbl6.Track.BackgroundColor3 = Color3.fromRGB(52, 52, 58)
	tbl6.Track.BackgroundTransparency = 1
	tbl6.Track.ClipsDescendants = true
	createUICorner(tbl6.Track, UDim.new(1, 0))
	tbl6.Fill = createFrame(tbl6.Track, "Fill", 7)
	tbl6.Fill.Position = UDim2.fromScale(0, 0)
	tbl6.Fill.Size = UDim2.fromScale(0, 1)
	tbl6.Fill.BackgroundTransparency = 1
	createUICorner(tbl6.Fill, UDim.new(1, 0))
	tbl6.Comet = createFrame(tbl6.Track, "Comet", 7)
	tbl6.Comet.Position = UDim2.fromScale(-0.35, 0)
	tbl6.Comet.Size = UDim2.fromScale(0.35, 1)
	tbl6.Comet.BackgroundTransparency = 1
	createUICorner(tbl6.Comet, UDim.new(1, 0))
	local uiGradient3 = Instance.new("UIGradient")
	uiGradient3.Name = "Fade"
	local numberSequence2 = NumberSequence.new
	local value6 = NumberSequenceKeypoint.new(0, 1)
	local value7 = NumberSequenceKeypoint.new(0.5, 0)
	local new3 = NumberSequenceKeypoint.new
	local tbl13 = { value6, value7 }

	do
		local values = table.pack(new3(1, 1))
		table.move(values, 1, values.n, 3, tbl13)
	end

	uiGradient3.Transparency = numberSequence2(tbl13)
	uiGradient3.Parent = tbl6.Comet
	tbl6.Card = Instance.new("CanvasGroup")
	tbl6.Card.Name = "Card"
	tbl6.Card.Position = UDim2.fromOffset(26, tbl2.BarHeight + 8)
	tbl6.Card.Size = UDim2.new(1, -52, 0, tbl2.CardBlock - 24)
	tbl6.Card.BackgroundTransparency = 1
	tbl6.Card.GroupTransparency = 1
	tbl6.Card.BorderSizePixel = 0
	tbl6.Card.Visible = false
	tbl6.Card.ZIndex = 6
	tbl6.Card.Parent = tbl6.Content
	local rule = createFrame(tbl6.Card, "Rule", 6)
	rule.Size = UDim2.new(1, 0, 0, 1)
	rule.BackgroundTransparency = 0.9
	tbl6.Rows = {}

	for i = 1, 3 do
		local frame2 = Instance.new("Frame")
		frame2.Name = "Row" .. i
		frame2.Position = UDim2.fromOffset(0, 12 + (i - 1) * 36)
		frame2.Size = UDim2.new(1, 0, 0, 32)
		frame2.BackgroundTransparency = 1
		frame2.BorderSizePixel = 0
		frame2.Visible = false
		frame2.ZIndex = 6
		frame2.Parent = tbl6.Card
		local marker = createFrame(frame2, "Marker", 7)
		marker.AnchorPoint = Vector2.new(0.5, 0.5)
		marker.Position = UDim2.fromOffset(4, 16)
		marker.Size = UDim2.fromOffset(6, 6)
		createUICorner(marker, UDim.new(1, 0))
		local message = createTextLabel(frame2, "Message", Enum.Font.GothamMedium, 17, tbl3.Body, Enum.TextXAlignment.Left, 7)
		message.Position = UDim2.fromOffset(20, 0)
		message.Size = UDim2.new(1, -110, 1, 0)
		local stamp = createTextLabel(frame2, "Stamp", Enum.Font.Gotham, 15, tbl3.Muted, Enum.TextXAlignment.Right, 7)
		stamp.Position = UDim2.new(1, -86, 0, 0)
		stamp.Size = UDim2.fromOffset(86, 32)
		tbl6.Rows[i] = { Frame = frame2, Marker = marker, Message = message, Stamp = stamp }
	end

	tbl6.Empty = createTextLabel(tbl6.Card, "Empty", Enum.Font.GothamMedium, 17, tbl3.Muted, Enum.TextXAlignment.Center, 7)
	tbl6.Empty.Position = UDim2.fromOffset(0, 34)
	tbl6.Empty.Size = UDim2.new(1, 0, 0, 32)
	tbl6.Empty.Text = "No activity yet"
	tbl6.Stats = createTextLabel(tbl6.Card, "Stats", Enum.Font.Gotham, 15, tbl3.Muted, Enum.TextXAlignment.Left, 7)
	tbl6.Stats.Position = UDim2.fromOffset(2, 126)
	tbl6.Stats.Size = UDim2.new(1, -4, 0, 19)

	local function createTextButton(name, anchorPoint, position, text)
		local textButton = Instance.new("TextButton")
		textButton.Name = name
		textButton.AutoLocalize = false
		textButton.AnchorPoint = anchorPoint
		textButton.Position = position
		textButton.Size = UDim2.fromOffset(162, 34)
		textButton.BackgroundColor3 = tbl3.White
		textButton.BackgroundTransparency = 0.9
		textButton.AutoButtonColor = false
		textButton.Font = Enum.Font.GothamMedium
		textButton.Text = text
		textButton.TextSize = 16
		textButton.TextColor3 = tbl3.Body
		textButton.BorderSizePixel = 0
		textButton.ZIndex = 8
		textButton.Parent = tbl6.Card
		createUICorner(textButton, UDim.new(1, 0))
		return textButton
	end

	tbl6.Pin = createTextButton("Pin", Vector2.new(0, 1), UDim2.new(0, 0, 1, 0), "Keep open")
	tbl6.Open = createTextButton("Open", Vector2.new(0.5, 1), UDim2.new(0.5, 0, 1, 0), "Read full log")
	tbl6.Clear = createTextButton("Clear", Vector2.new(1, 1), UDim2.new(1, 0, 1, 0), "Clear")
	tbl6.ReaderRoot = Instance.new("Frame")
	tbl6.ReaderRoot.Name = "ReaderRoot"
	tbl6.ReaderRoot.Size = UDim2.fromScale(1, 1)
	tbl6.ReaderRoot.BackgroundTransparency = 1
	tbl6.ReaderRoot.BorderSizePixel = 0
	tbl6.ReaderRoot.Visible = false
	tbl6.ReaderRoot.ZIndex = 50
	tbl6.ReaderRoot.Parent = screenGui
	tbl6.ReaderDim = Instance.new("TextButton")
	tbl6.ReaderDim.Name = "Dim"
	tbl6.ReaderDim.AutoLocalize = false
	tbl6.ReaderDim.Size = UDim2.fromScale(1, 1)
	tbl6.ReaderDim.BackgroundColor3 = tbl3.Black
	tbl6.ReaderDim.BackgroundTransparency = 1
	tbl6.ReaderDim.AutoButtonColor = false
	tbl6.ReaderDim.Text = ""
	tbl6.ReaderDim.BorderSizePixel = 0
	tbl6.ReaderDim.ZIndex = 50
	tbl6.ReaderDim.Parent = tbl6.ReaderRoot
	tbl6.Reader = Instance.new("CanvasGroup")
	tbl6.Reader.Name = "Reader"
	tbl6.Reader.AnchorPoint = Vector2.new(0.5, 0.5)
	tbl6.Reader.Position = UDim2.fromScale(0.5, 0.5)
	tbl6.Reader.Size = UDim2.fromOffset(tbl7.ReaderWidth, tbl7.ReaderHeight)
	tbl6.Reader.BackgroundColor3 = Color3.fromRGB(11, 11, 13)
	tbl6.Reader.GroupTransparency = 1
	tbl6.Reader.BorderSizePixel = 0
	tbl6.Reader.ZIndex = 51
	tbl6.Reader.Parent = tbl6.ReaderRoot
	createUICorner(tbl6.Reader, UDim.new(0, 26))
	tbl6.ReaderScale = Instance.new("UIScale")
	tbl6.ReaderScale.Name = "ReaderScale"
	tbl6.ReaderScale.Scale = 1
	tbl6.ReaderScale.Parent = tbl6.Reader
	local uiStroke2 = Instance.new("UIStroke")
	uiStroke2.Color = tbl3.White
	uiStroke2.Transparency = 0.9
	uiStroke2.Thickness = 1
	uiStroke2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	uiStroke2.Parent = tbl6.Reader
	tbl6.ReaderTitle = createTextLabel(tbl6.Reader, "Title", Enum.Font.GothamBold, 23, tbl3.Title, Enum.TextXAlignment.Left, 52)
	tbl6.ReaderTitle.Position = UDim2.fromOffset(28, 22)
	tbl6.ReaderTitle.Size = UDim2.new(1, -140, 0, 30)
	tbl6.ReaderTitle.Text = "Log"
	tbl6.ReaderCount = createTextLabel(tbl6.Reader, "Count", Enum.Font.GothamMedium, 16, tbl3.Muted, Enum.TextXAlignment.Left, 52)
	tbl6.ReaderCount.Position = UDim2.fromOffset(28, 48)
	tbl6.ReaderCount.Size = UDim2.new(1, -140, 0, 21)
	tbl6.ReaderClose = Instance.new("TextButton")
	tbl6.ReaderClose.Name = "Close"
	tbl6.ReaderClose.AutoLocalize = false
	tbl6.ReaderClose.AnchorPoint = Vector2.new(1, 0)
	tbl6.ReaderClose.Position = UDim2.new(1, -24, 0, 24)
	tbl6.ReaderClose.Size = UDim2.fromOffset(96, 36)
	tbl6.ReaderClose.BackgroundColor3 = tbl3.White
	tbl6.ReaderClose.BackgroundTransparency = 0.9
	tbl6.ReaderClose.AutoButtonColor = false
	tbl6.ReaderClose.Font = Enum.Font.GothamMedium
	tbl6.ReaderClose.Text = "Close"
	tbl6.ReaderClose.TextSize = 16
	tbl6.ReaderClose.TextColor3 = tbl3.Body
	tbl6.ReaderClose.BorderSizePixel = 0
	tbl6.ReaderClose.ZIndex = 53
	tbl6.ReaderClose.Parent = tbl6.Reader
	createUICorner(tbl6.ReaderClose, UDim.new(1, 0))
	tbl6.ReaderRule = createFrame(tbl6.Reader, "Rule", 52)
	tbl6.ReaderRule.Position = UDim2.fromOffset(28, 76)
	tbl6.ReaderRule.Size = UDim2.new(1, -56, 0, 1)
	tbl6.ReaderRule.BackgroundTransparency = 0.9
	tbl6.ReaderList = Instance.new("ScrollingFrame")
	tbl6.ReaderList.Name = "List"
	tbl6.ReaderList.Position = UDim2.fromOffset(24, 88)
	tbl6.ReaderList.Size = UDim2.new(1, -48, 1, -128)
	tbl6.ReaderList.BackgroundTransparency = 1
	tbl6.ReaderList.BorderSizePixel = 0
	tbl6.ReaderList.ScrollBarThickness = 3
	tbl6.ReaderList.ScrollBarImageColor3 = tbl3.White
	tbl6.ReaderList.ScrollBarImageTransparency = 0.7
	tbl6.ReaderList.CanvasSize = UDim2.new()
	tbl6.ReaderList.ZIndex = 52
	tbl6.ReaderList.Parent = tbl6.Reader
	local uiListLayout = Instance.new("UIListLayout")
	uiListLayout.FillDirection = Enum.FillDirection.Vertical
	uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	uiListLayout.Padding = UDim.new(0, 2)
	uiListLayout.Parent = tbl6.ReaderList
	tbl6.ReaderFoot = createTextLabel(tbl6.Reader, "Foot", Enum.Font.Gotham, 15, tbl3.Muted, Enum.TextXAlignment.Left, 52)
	tbl6.ReaderFoot.AnchorPoint = Vector2.new(0, 1)
	tbl6.ReaderFoot.Position = UDim2.new(0, 28, 1, -16)
	tbl6.ReaderFoot.Size = UDim2.new(1, -56, 0, 19)
	tbl6.ReaderEmpty = createTextLabel(tbl6.Reader, "Empty", Enum.Font.GothamMedium, 18, tbl3.Muted, Enum.TextXAlignment.Center, 52)
	tbl6.ReaderEmpty.AnchorPoint = Vector2.new(0.5, 0.5)
	tbl6.ReaderEmpty.Position = UDim2.fromScale(0.5, 0.5)
	tbl6.ReaderEmpty.Size = UDim2.new(1, 0, 0, 28)
	tbl6.ReaderEmpty.Text = "No activity yet"
	tbl6.ReaderRows = {}
	tbl6.Tap = Instance.new("TextButton")
	tbl6.Tap.Name = "Tap"
	tbl6.Tap.AutoLocalize = false
	tbl6.Tap.Size = UDim2.new(1, 0, 0, tbl2.BarHeight)
	tbl6.Tap.BackgroundTransparency = 1
	tbl6.Tap.Text = ""
	tbl6.Tap.AutoButtonColor = false
	tbl6.Tap.ZIndex = 9
	tbl6.Tap.Parent = tbl6.Shell
	local tbl14 = {}

	for _, item in ipairs({
		"UpdateStatus",
		"AddLog",
		"UpdateCurrentStep",
		"UpdateRetry",
		"UpdateRecovery",
		"CompleteSession",
		"ResetSession",
		"UpdateTheme",
		"UpdateProgress",
		"DestroyUI",
	}) do
		local bindableEvent = Instance.new("BindableEvent")
		bindableEvent.Name = item
		bindableEvent.Parent = screenGui
		tbl14[item] = bindableEvent
	end

	screenGui.Parent = playerGui2

	local function func9(param11)
		if typeof(param11) == "string" and tbl4[param11] then
			return param11
		end
		return "Working"
	end

	local function func10(flag4)
		if (flag4 == "Compact" or flag4 == "Expanded") and tbl7.Detail ~= "" then
			return tbl2.BarHeightDetail
		end
		return tbl2.BarHeight
	end

	local function func11(flag5)
		local num2 = func10(flag5)
		if flag5 == "Sleep" then
			return tbl2.SleepWidth, num2, num2 / 2, 0, 0
		end

		if flag5 == "Dormant" then
			return tbl2.DormantWidth, num2, num2 / 2, 0, 0
		end

		if flag5 == "Compact" then
			return tbl2.CompactWidth, num2, num2 / 2, 1, 0
		end
		return tbl2.ExpandedWidth, num2 + tbl2.CardBlock, 28, 1, 1
	end

	local function func12(flag6)
		local damping = flag6 and 24 or 34
		tbl8.Width.Damping = damping
		tbl8.Height.Damping = damping
	end

	local function func13(tier, flag7)
		if tbl7.Destroyed then
			return
		end
		local flag8, flag9, value8, value9, flag10 = func11(tier)
		tbl7.Tier = tier
		func12(flag8 > tbl8.Width.Value or flag9 > tbl8.Height.Value)
		tbl8.Width.Target = flag8
		tbl8.Height.Target = flag9
		tbl8.Radius.Target = value8
		tbl8.TitleAlpha.Target = value9
		tbl8.CardAlpha.Target = flag10

		if flag10 > 0 then
			tbl6.Card.Visible = true
		end

		if flag7 or reduceMotion then
			for _, value10 in pairs(tbl8) do
				value10.Value = value10.Target
				value10.Velocity = 0
			end
		end
	end

	local function func14(delay2)
		tbl7.HoldToken = tbl7.HoldToken + 1
		local holdToken = tbl7.HoldToken

		local function func15()
			return not tbl7.Destroyed and holdToken == tbl7.HoldToken and tbl7.Tier ~= "Expanded" and not tbl7.Pinned
		end

		task.delay(delay2 / n, function()
			if not func15() then
				return
			end
			func13("Dormant")

			task.delay(tbl2.SleepDelay / n, function()
				if func15() then
					func13("Sleep")
				end
			end)
		end)
	end

	local function func16()
		tbl7.CardToken = tbl7.CardToken + 1
		local cardToken = tbl7.CardToken

		task.delay(tbl2.CardHold / n, function()
			if tbl7.Destroyed or cardToken ~= tbl7.CardToken or tbl7.Tier ~= "Expanded" or tbl7.Pinned then
				return
			end
			func13("Dormant")
		end)
	end

	local function func17()
		tbl7.CardToken = tbl7.CardToken + 1
	end

	local function func18(accent)
		tbl7.Accent = accent
		tbl6.Halo.BackgroundColor3 = accent
		tbl6.GlyphDot.BackgroundColor3 = accent
		tbl6.SpinStroke.Color = accent
		tbl6.SpinHead.BackgroundColor3 = func4(accent, tbl3.White, 0.5)
		tbl6.CheckShort.BackgroundColor3 = accent
		tbl6.CheckLong.BackgroundColor3 = accent
		tbl6.BangStem.BackgroundColor3 = accent
		tbl6.BangDot.BackgroundColor3 = accent
		tbl6.Wash.BackgroundColor3 = accent
		tbl6.Pulse.BackgroundColor3 = accent
		tbl6.Fill.BackgroundColor3 = func4(accent, tbl3.White, 0.2)
		tbl6.Comet.BackgroundColor3 = func4(accent, tbl3.White, 0.35)
		tbl6.Pin.TextColor3 = func4(accent, tbl3.White, 0.5)

		for _, child in ipairs(tbl6.GlyphCross:GetChildren()) do
			if child:IsA("Frame") then
				child.BackgroundColor3 = accent
			end
		end

		for _, bar in ipairs(tbl6.Bars) do
			bar.BackgroundColor3 = accent
		end

		for _, item2 in ipairs(tbl6.Bloom) do
			item2.BackgroundColor3 = accent
		end
	end

	local function func19(glyph)
		tbl7.Glyph = glyph

		for _, glyph2 in pairs(tbl6.Glyphs) do
			glyph2.Visible = false
		end
		;(tbl6.Glyphs[glyph] or tbl6.GlyphDot).Visible = true
	end

	local function func20(text)
		local activeTitle = tbl6.ActiveTitle
		local titleB = activeTitle == tbl6.TitleA and tbl6.TitleB or tbl6.TitleA
		titleB.Text = text
		tbl6.ActiveTitle = titleB

		if reduceMotion then
			titleB.Position = UDim2.fromOffset(0, 0)
			titleB.TextTransparency = 0
			activeTitle.TextTransparency = 1
			return
		end

		titleB.Position = UDim2.fromOffset(0, 16)
		titleB.TextTransparency = 1
		TweenService:Create(titleB, TweenInfo.new(0.26 / n, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { Position = UDim2.fromOffset(0, 0), TextTransparency = 0 }):Play()
		local value11
		TweenService:Create(activeTitle, value11, { Position = UDim2.fromOffset(0, -16), TextTransparency = 1 }):Play()
	end

	local function func21()
		local n2 = math.min(#tbl9, 3)

		for i, pip in ipairs(tbl6.Pips) do
			pip.BackgroundColor3 = tbl7.Accent
			pip.BackgroundTransparency = i <= n2 and 0.25 or 1
		end
	end

	local function func22()
		local n2 = #list1

		for i, row in ipairs(tbl6.Rows) do
			local entry1 = list1[n2 - i + 1]

			if entry1 then
				local message = entry1.Message

				if entry1.Count > 1 then
					message ..= "  (" .. tostring(entry1.Count) .. ")"
				end

				row.Marker.BackgroundColor3 = entry1.Colour
				row.Message.Text = message
				row.Stamp.Text = entry1.Stamp
				row.Frame.Visible = true
			else
				row.Frame.Visible = false
			end
		end

		tbl6.Empty.Visible = n2 == 0
		local sessionEnd = tbl7.SessionEnd or os.clock()
		local retries = tbl7.Retries
		tbl6.Stats.Text = string.format("Elapsed %s   |   %s   |   %s   |   %s", func5(sessionEnd - tbl7.SessionStart), func6(tbl7.Events, "event", "events"), func6(tbl7.Issues, "issue", "issues"), func6(retries, "retry", "retries"))
	end

	local function func23(param12)
		local readerNarrow = tbl7.ReaderNarrow
		local readerRowHeight = tbl7.ReaderRowHeight
		param12.Frame.Size = UDim2.new(1, -8, 0, readerRowHeight)
		param12.Marker.Position = UDim2.fromOffset(readerNarrow and 14 or 16, readerRowHeight / 2)
		param12.Stamp.Position = UDim2.fromOffset(readerNarrow and 26 or 32, 0)
		param12.Stamp.Size = UDim2.fromOffset(readerNarrow and 72 or 86, readerRowHeight)
		param12.Stamp.TextSize = readerNarrow and 15 or 16
		param12.Kind.Visible = not readerNarrow
		param12.Kind.Position = UDim2.fromOffset(122, 0)
		param12.Kind.Size = UDim2.fromOffset(84, readerRowHeight)
		param12.Message.Position = UDim2.fromOffset(readerNarrow and 106 or 214, 0)
		param12.Message.Size = UDim2.new(1, readerNarrow and -116 or -230, 0, readerRowHeight)
		param12.Message.TextSize = readerNarrow and 16 or 17
	end

	local function func24()
		local readerNarrow = tbl7.ReaderNarrow
		tbl6.ReaderTitle.Position = UDim2.fromOffset(readerNarrow and 18 or 28, readerNarrow and 15 or 22)
		tbl6.ReaderTitle.Size = UDim2.new(1, readerNarrow and -110 or -140, 0, 30)
		tbl6.ReaderTitle.TextSize = readerNarrow and 20 or 23
		tbl6.ReaderCount.Position = UDim2.fromOffset(readerNarrow and 18 or 28, readerNarrow and 43 or 53)
		tbl6.ReaderCount.Size = UDim2.new(1, readerNarrow and -110 or -140, 0, 21)
		tbl6.ReaderClose.Position = UDim2.new(1, readerNarrow and -16 or -24, 0, readerNarrow and 16 or 24)
		tbl6.ReaderClose.Size = UDim2.fromOffset(readerNarrow and 78 or 96, readerNarrow and 32 or 36)
		tbl6.ReaderRule.Position = UDim2.fromOffset(readerNarrow and 18 or 28, readerNarrow and 68 or 82)
		tbl6.ReaderRule.Size = UDim2.new(1, readerNarrow and -36 or -56, 0, 1)
		tbl6.ReaderList.Position = UDim2.fromOffset(readerNarrow and 14 or 24, readerNarrow and 78 or 94)
		tbl6.ReaderList.Size = UDim2.new(1, readerNarrow and -28 or -48, 1, readerNarrow and -112 or -136)
		tbl6.ReaderFoot.Position = UDim2.new(0, readerNarrow and 18 or 28, 1, readerNarrow and -12 or -16)
		tbl6.ReaderFoot.Size = UDim2.new(1, readerNarrow and -36 or -56, 0, 19)
		tbl6.ReaderFoot.TextSize = readerNarrow and 14 or 15

		for _, readerRow in ipairs(tbl6.ReaderRows) do
			func23(readerRow)
		end
	end

	local function func25(layoutOrder)
		local value12 = tbl6.ReaderRows[layoutOrder]
		if value12 then
			return value12
		end
		local frame2 = Instance.new("Frame")
		frame2.Name = "Entry" .. layoutOrder
		frame2.BackgroundColor3 = tbl3.White
		frame2.BackgroundTransparency = 0.97
		frame2.BorderSizePixel = 0
		frame2.LayoutOrder = layoutOrder
		frame2.ZIndex = 52
		frame2.Parent = tbl6.ReaderList
		createUICorner(frame2, UDim.new(0, 8))
		local marker = createFrame(frame2, "Marker", 53)
		marker.AnchorPoint = Vector2.new(0.5, 0.5)
		marker.Position = UDim2.fromOffset(16, tbl2.ReaderRowHeight / 2)
		marker.Size = UDim2.fromOffset(7, 7)
		createUICorner(marker, UDim.new(1, 0))
		local stamp = createTextLabel(frame2, "Stamp", Enum.Font.Gotham, 16, tbl3.Muted, Enum.TextXAlignment.Left, 53)
		stamp.Position = UDim2.fromOffset(32, 0)
		stamp.Size = UDim2.fromOffset(86, tbl2.ReaderRowHeight)
		local kind = createTextLabel(frame2, "Kind", Enum.Font.GothamMedium, 16, tbl3.Muted, Enum.TextXAlignment.Left, 53)
		kind.Position = UDim2.fromOffset(122, 0)
		kind.Size = UDim2.fromOffset(84, tbl2.ReaderRowHeight)
		local message = createTextLabel(frame2, "Message", Enum.Font.GothamMedium, 17, tbl3.Body, Enum.TextXAlignment.Left, 53)
		message.Position = UDim2.fromOffset(214, 0)
		message.Size = UDim2.new(1, -230, 0, tbl2.ReaderRowHeight)
		local tbl15 = { Frame = frame2, Marker = marker, Stamp = stamp, Kind = kind, Message = message }
		tbl6.ReaderRows[layoutOrder] = tbl15
		func23(tbl15)
		return tbl15
	end

	local function func26()
		local n2 = #list1

		for i = 1, n2 do
			local entry2 = list1[n2 - i + 1]
			local value13 = func25(i)
			local message = entry2.Message

			if entry2.Count > 1 then
				message ..= "  (" .. tostring(entry2.Count) .. ")"
			end

			value13.Marker.BackgroundColor3 = entry2.Colour
			value13.Stamp.Text = entry2.Stamp
			value13.Kind.Text = entry2.Kind
			value13.Kind.TextColor3 = entry2.Colour
			value13.Message.Text = message
			value13.Frame.Visible = true
		end

		for i = n2 + 1, #tbl6.ReaderRows do
			tbl6.ReaderRows[i].Frame.Visible = false
		end

		tbl6.ReaderList.CanvasSize = UDim2.fromOffset(0, n2 * (tbl7.ReaderRowHeight + 2))
		tbl6.ReaderEmpty.Visible = n2 == 0
		tbl6.ReaderCount.Text = func6(n2, "entry", "entries")
		local sessionEnd = tbl7.SessionEnd or os.clock()
		local retries = tbl7.Retries
		tbl6.ReaderFoot.Text = string.format("Elapsed %s   |   %s   |   %s   |   %s", func5(sessionEnd - tbl7.SessionStart), func6(tbl7.Events, "event", "events"), func6(tbl7.Issues, "issue", "issues"), func6(retries, "retry", "retries"))
	end

	local function func27(readerOpen)
		if tbl7.Destroyed or tbl7.ReaderOpen == readerOpen then
			return
		end
		tbl7.ReaderOpen = readerOpen

		if readerOpen then
			local absolutePosition = tbl6.Open.AbsolutePosition
			local absoluteSize = tbl6.Open.AbsoluteSize
			tbl7.ReaderOriginX = absolutePosition.X + absoluteSize.X / 2
			tbl7.ReaderOriginY = absolutePosition.Y + absoluteSize.Y / 2
			tbl7.ReaderOriginWidth = math.max(absoluteSize.X, 8)
			func26()
			tbl6.ReaderRoot.Visible = true
			tbl6.ReaderList.CanvasPosition = Vector2.new(0, 0)
			tbl8.Reader.Target = 1
			tbl7.Pinned = false
			tbl6.Pin.Text = "Keep open"
			func17()
			func13("Sleep")
		else
			tbl8.Reader.Target = 0
			func14(0.25)
		end
	end

	local function func28(flag11)
		if reduceMotion then
			return
		end
		tbl6.Wash.BackgroundTransparency = (flag11 == "Error" or flag11 == "Success") and 0.82 or 0.92
		TweenService:Create(tbl6.Wash, TweenInfo.new(0.5 / n, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundTransparency = 1 }):Play()
		tbl8.Bloom.Value = 1
		tbl8.Bloom.Velocity = 0
		tbl8.Bloom.Target = 0
	end

	local function func29(param13)
		local working = tbl4[param13.Kind] or tbl4.Working
		func18(working.Color)
		func19(working.Glyph)
		tbl7.Live = working.Live
		tbl7.Title = param13.Message

		if typeof(param13.Detail) == "string" then
			tbl7.Detail = param13.Detail
		end

		func20(param13.Message)
		tbl6.Detail.Text = tbl7.Detail
		func28(param13.Kind)
		func21()
		-- Ｓｏｕｒｃｅ Ｌｅａｋ // discord.gg/x7YbZeezpm

		if tbl7.Tier == "Expanded" then
			func22()
			func16()
		else
			func13("Compact")
			local holdDuration = tbl2.HoldDuration

			if param13.Kind == "Success" then
				holdDuration = tbl2.SuccessHold
			elseif param13.Kind == "Error" then
				holdDuration = tbl2.ErrorHold
			end

			func14(holdDuration)
		end
	end

	local function func30()
		if flag3 or tbl7.Destroyed then
			return
		end
		flag3 = true

		task.spawn(function()
			while not tbl7.Destroyed and #tbl9 > 0 do
				local n2 = -1
				local n3 = 1

				for i, item3 in ipairs(tbl9) do
					if item3.Priority > n2 then
						n2 = item3.Priority
						n3 = i
					end
				end

				local value14 = table.remove(tbl9, n3)
				tbl7.CurrentPriority = value14.Priority
				func29(value14)
				local n4 = 0.45 / n
				local n5 = os.clock() + n4

				while true do
					if os.clock() < n5 and not tbl7.Destroyed then
						local flag12 = false

						for _, item4 in ipairs(tbl9) do
							if value14.Priority < item4.Priority then
								flag12 = true
								break
							else
								flag12 = false
							end
						end

						if not flag12 then
							task.wait(0.05)
							continue
						end
					end

					break
				end
			end

			tbl7.CurrentPriority = -1
			flag3 = false
			func21()
		end)
	end

	local function func31(param14, param15, param16)
		table.insert(tbl9, { Message = param14, Kind = param15, Detail = param16, Priority = (tbl4[param15] or tbl4.Working).Priority })

		while tbl2.QueueLimit < #tbl9 do
			local huge = math.huge
			local n2 = 1

			for i, item5 in ipairs(tbl9) do
				if item5.Priority < huge then
					huge = item5.Priority
					n2 = i
				end
			end

			table.remove(tbl9, n2)
		end

		func21()
		func30()
	end

	local function func32(flag13, param17, param18)
		if tbl7.Destroyed or typeof(flag13) ~= "string" or flag13 == "" then
			return
		end
		local flag14 = func9(param17)
		local color = tbl4[flag14].Color
		local entry3 = list1[#list1]

		if entry3 and entry3.Message == flag13 and entry3.Kind == flag14 then
			entry3.Count = entry3.Count + 1
			entry3.Stamp = func7()
		else
			table.insert(list1, { Message = flag13, Kind = flag14, Colour = color, Stamp = func7(), Count = 1 })
		end

		tbl7.Events = tbl7.Events + 1

		if flag14 == "Error" or flag14 == "Warning" then
			tbl7.Issues = tbl7.Issues + 1
		end

		while #list1 > tbl2.LogLimit do
			table.remove(list1, 1)
		end

		if tbl7.Tier == "Expanded" then
			func22()
		end

		if tbl7.ReaderOpen then
			func26()
		end

		func31(flag13, flag14, param18)
	end

	local function func33(deltaTime)
		if tbl7.Destroyed then
			return
		end
		tbl7.Clock = tbl7.Clock + deltaTime * n
		local tier2 = func10(tbl7.Tier)
		local tier3 = tbl7.Tier == "Expanded"
		tbl8.Bar.Target = tier2
		tbl8.Height.Target = tier3 and tier2 + tbl2.CardBlock or tier2
		tbl8.Radius.Target = tier3 and 28 or tier2 / 2

		for _, value15 in pairs(tbl8) do
			func3(value15, deltaTime)
		end

		local value16 = tbl8.Width.Value
		local value17 = tbl8.Height.Value
		local n2 = math.max(tbl8.Bar.Value, 1)
		local n3 = math.max(tbl8.Radius.Value, 1)
		local max = math.max
		tbl6.Shell.Size = UDim2.fromOffset(math.max(value16, 1), max(value17, 1))
		tbl6.ShellCorner.CornerRadius = UDim.new(0, n3)
		tbl6.WashCorner.CornerRadius = UDim.new(0, n3)
		tbl6.Scale.Scale = (tbl7.ResponsiveScale or tbl2.MaximumScale) * tbl8.Press.Value
		local titleRow = tbl2.TitleRow
		tbl6.TitleClip.Size = UDim2.fromOffset(math.max(value16 - 150, 0), titleRow)
		local detailRow = tbl2.DetailRow
		tbl6.Detail.Size = UDim2.fromOffset(math.max(value16 - 150, 0), detailRow)
		tbl6.Track.Size = UDim2.fromOffset(math.max(value16 - 80, 0), 2)
		local n4 = math.clamp(tbl8.TitleAlpha.Value, 0, 1)
		local visible = tbl7.Detail ~= "" and n4 > 0.02
		local n5 = n2 - tbl2.TrackInset
		local titleRow2 = tbl2.TitleRow

		if visible then
			titleRow2 = titleRow2 + 2 + tbl2.DetailRow
		end

		local n6 = ((visible and n5 - 2 or n2) - titleRow2) / 2
		tbl6.Header.Size = UDim2.new(1, 0, 0, n2)
		tbl6.Tap.Size = UDim2.new(1, 0, 0, n2)
		tbl6.Trail.Position = UDim2.new(1, -22, 0, n2 / 2)
		tbl6.Card.Position = UDim2.fromOffset(26, n2 + 8)
		tbl6.TitleClip.Position = UDim2.fromOffset(58, n6)
		tbl6.Detail.Position = UDim2.fromOffset(58, n6 + tbl2.TitleRow + 2)
		tbl6.Track.Position = UDim2.fromOffset(58, n5)
		tbl6.TitleClip.Visible = n4 > 0.02
		tbl6.TitleClip.GroupTransparency = 1 - n4
		tbl6.Detail.TextTransparency = 1 - n4
		tbl6.Detail.Visible = visible
		tbl6.Track.BackgroundTransparency = 1 - n4 * 0.65
		local n7 = math.clamp(tbl8.CardAlpha.Value, 0, 1)
		tbl6.Card.GroupTransparency = 1 - n7
		tbl6.Card.Visible = n7 > 0.02
		local n8 = math.clamp(tbl8.Reader.Value, 0, 1)
		tbl6.ReaderRoot.Visible = n8 > 0.01
		tbl6.Reader.GroupTransparency = 1 - n8
		tbl6.ReaderDim.BackgroundTransparency = 1 - n8 * 0.55
		tbl6.Reader.Size = UDim2.fromOffset(tbl7.ReaderWidth, tbl7.ReaderHeight)
		local n9 = n8 * n8 * (3 - 2 * n8)
		local n10 = math.clamp(tbl7.ReaderOriginWidth / math.max(tbl7.ReaderWidth, 1), 0.05, 0.6)
		tbl6.ReaderScale.Scale = n10 + (1 - n10) * n9
		tbl6.Reader.Position = UDim2.fromOffset(tbl7.ReaderOriginX + (tbl7.ReaderTargetX - tbl7.ReaderOriginX) * n9, tbl7.ReaderOriginY + (tbl7.ReaderTargetY - tbl7.ReaderOriginY) * n9)
		local n11 = 0.5 + 0.5 * math.sin(tbl7.Clock * 1.6)
		local n12 = math.clamp(tbl8.Bloom.Value, 0, 1)

		for i, item6 in ipairs(tbl6.Bloom) do
			local n13 = i * 5
			item6.Position = UDim2.new(0.5, 0, 0, value17 / 2)
			item6.Size = UDim2.fromOffset(value16 + n13, value17 + n13)
			item6.BackgroundTransparency = math.clamp(0.965 - i * 0.004 - n12 * 0.05 - n11 * 0.006, 0, 1)
			tbl6.BloomCorners[i].CornerRadius = UDim.new(0, n3 + n13 / 2)
		end

		if tbl7.Glyph == "Spinner" then
			tbl6.GlyphSpin.Rotation = tbl7.Clock * 220 % 360
		elseif tbl7.Glyph == "Breath" or tbl7.Glyph == "Dot" then
			local n13 = 11 + n11 * 3
			tbl6.GlyphDot.Size = UDim2.fromOffset(n13, n13)
		end

		tbl6.Halo.BackgroundTransparency = 0.82 - n11 * 0.08
		local live = tbl7.Live == "Equalizer" or tbl7.Live == "Stream"

		for i, bar in ipairs(tbl6.Bars) do
			local flag15 = live and n4 > 0.02
			bar.BackgroundTransparency = flag15 and 0 or 1

			if flag15 then
				if tbl7.Live == "Stream" then
					bar.Size = UDim2.fromOffset(3.5, 6 + 10 * math.abs(math.sin((tbl7.Clock * 2.2 + i * 0.25) % 1 * 3.1415926535897931)))
				else
					bar.Size = UDim2.fromOffset(3.5, 7 + 9 * (0.5 + 0.5 * math.sin(tbl7.Clock * 5.5 + i * 1.1)))
				end
			end
		end

		tbl6.Slot.Position = UDim2.fromOffset(32 + (value16 / 2 - 32) * math.clamp((tbl2.DormantWidth - value16) / (tbl2.DormantWidth - tbl2.SleepWidth), 0, 1), n2 / 2)

		if n4 < 0.98 and value16 > 108 then
			local n13 = 7 + n11 * 3
			tbl6.Pulse.Size = UDim2.fromOffset(n13, n13)
			tbl6.Pulse.BackgroundTransparency = math.clamp(n4 + 0.12 + n11 * 0.28, 0, 1)
		else
			tbl6.Pulse.BackgroundTransparency = 1
		end
		-- https://discord.gg/x7YbZeezpm | 𝐒𝐋

		if tbl7.Progress then
			tbl6.Fill.Size = UDim2.fromScale(math.clamp(tbl8.Progress.Value, 0, 1), 1)
			tbl6.Fill.BackgroundTransparency = 1 - n4 * 0.9
			tbl6.Comet.BackgroundTransparency = 1
		else
			tbl6.Fill.BackgroundTransparency = 1

			if n4 > 0.02 and not reduceMotion then
				tbl6.Comet.Position = UDim2.fromScale(tbl7.Clock * 0.55 % 1.35 - 0.35, 0)
				tbl6.Comet.BackgroundTransparency = 0.1
			else
				tbl6.Comet.BackgroundTransparency = 1
			end
		end
	end

	local function func34()
		local currentCamera2 = Workspace.CurrentCamera
		if not currentCamera2 then
			tbl7.ResponsiveScale = tbl2.MaximumScale
			return
		end
		local compactWidth = tbl2.CompactWidth
		local minimumScale = tbl2.MinimumScale
		local maximumScale = tbl2.MaximumScale
		tbl7.ResponsiveScale = math.clamp(math.max(currentCamera2.ViewportSize.X - 28, 1) / compactWidth, minimumScale, maximumScale)
		local readerMinWidth = tbl2.ReaderMinWidth
		local readerMaxWidth = tbl2.ReaderMaxWidth
		tbl7.ReaderWidth = math.clamp(math.floor(currentCamera2.ViewportSize.X * tbl2.ReaderWidthRatio), readerMinWidth, readerMaxWidth)
		local readerMinHeight = tbl2.ReaderMinHeight
		local readerMaxHeight = tbl2.ReaderMaxHeight
		tbl7.ReaderHeight = math.clamp(math.floor(currentCamera2.ViewportSize.Y * tbl2.ReaderHeightRatio), readerMinHeight, readerMaxHeight)
		tbl7.ReaderTargetX = currentCamera2.ViewportSize.X / 2
		tbl7.ReaderTargetY = currentCamera2.ViewportSize.Y / 2
		local readerNarrow = tbl7.ReaderWidth < tbl2.ReaderNarrowUnder

		if readerNarrow ~= tbl7.ReaderNarrow then
			tbl7.ReaderNarrow = readerNarrow
			tbl7.ReaderRowHeight = readerNarrow and tbl2.ReaderRowHeightNarrow or tbl2.ReaderRowHeight
			func24()

			if tbl7.ReaderOpen then
				func26()
			end
		end
	end

	local function func35()
		if reduceMotion then
			return
		end
		tbl8.Press.Value = 0.955
		tbl8.Press.Velocity = 0
		tbl8.Press.Target = 1
	end

	func8(tbl6.Tap.Activated:Connect(function()
		func35()

		if tbl7.Tier == "Expanded" then
			tbl7.Pinned = false
			tbl6.Pin.Text = "Keep open"
			func17()
			func13("Dormant")
			return
		end

		func22()
		func13("Expanded")
		func16()
	end))

	func8(tbl6.Pin.Activated:Connect(function()
		func35()
		tbl7.Pinned = not tbl7.Pinned
		tbl6.Pin.Text = tbl7.Pinned and "Pinned" or "Keep open"

		if tbl7.Pinned then
			func17()
		else
			func16()
		end
	end))

	func8(tbl6.Open.Activated:Connect(function()
		func35()
		func27(true)
	end))

	func8(tbl6.ReaderClose.Activated:Connect(function()
		func27(false)
	end))

	func8(tbl6.ReaderDim.Activated:Connect(function()
		func27(false)
	end))

	func8(tbl6.Clear.Activated:Connect(function()
		func35()
		func16()
		list1 = {}
		tbl7.Events = 0
		tbl7.Issues = 0
		func22()

		if tbl7.ReaderOpen then
			func26()
		end
	end))

	func8(tbl14.AddLog.Event:Connect(function(param19, param20, param21)
		func32(tostring(param19), param20, param21)
	end))

	func8(tbl14.UpdateStatus.Event:Connect(function(param22, param23, param24)
		func32(tostring(param22), param23, param24)
	end))

	func8(tbl14.UpdateCurrentStep.Event:Connect(function(detail)
		if typeof(detail) == "string" then
			tbl7.Detail = detail
			tbl6.Detail.Text = detail
		end
	end))

	func8(tbl14.UpdateRetry.Event:Connect(function(param25, param26)
		local n2 = tonumber(param25) or 0
		tbl7.Retries = math.max(tbl7.Retries, n2)
		local formatted = string.format("Retry %d", n2)

		if tonumber(param26) then
			formatted = string.format("Retry %d in %ds", n2, tonumber(param26))
		end

		func32(formatted, "Warning")
	end))

	func8(tbl14.UpdateRecovery.Event:Connect(function(param27, str1)
		local str2 = tostring(param27)

		if typeof(str1) == "string" and str1 ~= "" then
			str2 ..= " -> " .. str1
		end

		func32(str2, "Warning")
	end))

	func8(tbl14.CompleteSession.Event:Connect(function()
		if tbl7.Complete then
			return
		end
		tbl7.Complete = true
		tbl7.SessionEnd = os.clock()
		func32("Session complete", "Success")
	end))

	func8(tbl14.ResetSession.Event:Connect(function()
		list1 = {}
		tbl9 = {}
		tbl7.Events = 0
		tbl7.Issues = 0
		tbl7.Retries = 0
		tbl7.Complete = false
		tbl7.SessionStart = os.clock()
		tbl7.SessionEnd = nil
		tbl7.Pinned = false
		tbl6.Pin.Text = "Keep open"
		func27(false)
		func22()
		func13("Dormant")
		func32("New session", "Info")
	end))

	func8(tbl14.UpdateProgress.Event:Connect(function(param28)
		if typeof(param28) ~= "number" then
			tbl7.Progress = nil
			return
		end
		local value18 = math.clamp(param28, 0, 1)

		if not tbl7.Progress then
			tbl8.Progress.Value = value18
			tbl8.Progress.Velocity = 0
		end

		tbl7.Progress = value18
		tbl8.Progress.Target = value18
	end))

	func8(tbl14.UpdateTheme.Event:Connect(function(param29)
		if typeof(param29) == "Color3" then
			accentColor = param29
			func18(param29)
		end
	end))

	local function func36()
		if tbl7.Destroyed then
			return
		end
		tbl7.Destroyed = true
		tbl7.HoldToken = tbl7.HoldToken + 1

		for _, item7 in ipairs(tbl10) do
			pcall(function()
				item7:Disconnect()
			end)
		end

		tbl10 = {}
	end

	func8(tbl14.DestroyUI.Event:Connect(function()
		func36()
		screenGui:Destroy()
	end))

	func8(screenGui.Destroying:Connect(func36))
	func8(RunService.RenderStepped:Connect(func33))
	func8(Workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(func34))
	func34()
	func24()
	func18(accentColor)
	func19("Dot")
	func22()
	func21()
	func13("Dormant", true)
	tbl6.TitleA.Text = "Idle"
	tbl6.TitleA.TextTransparency = 1
	local currentCamera2 = Workspace.CurrentCamera

	if currentCamera2 then
		func8(currentCamera2:GetPropertyChangedSignal("ViewportSize"):Connect(func34))
	end
end

tbl1.Start = function()
	if colorIslandGui and colorIslandGui.Parent then
		return true, nil
	end
	local ok, result = pcall(tbl1.Build)
	if not ok then
		return false, "ColorIsland failed to load: " .. tostring(result)
	end
	local playerGui2 = localPlayer2:FindFirstChild("PlayerGui")
	colorIslandGui = playerGui2 and playerGui2:FindFirstChild("ColorIslandGui")
	if not colorIslandGui then
		return false, "ColorIsland was not created"
	end
	return true, nil
end

tbl1.Fire = function(childName, ...)
	if not colorIslandGui or not colorIslandGui.Parent then
		return false
	end
	local obj2 = colorIslandGui:FindFirstChild(childName)
	if not obj2 or not obj2:IsA("BindableEvent") then
		return false
	end
	return pcall(obj2.Fire, obj2, ...)
end

tbl1.Log = function(param30, param31, param32)
	return tbl1.Fire("AddLog", tostring(param30), param31, param32)
end

tbl1.Step = function(flag16)
	return tbl1.Fire("UpdateCurrentStep", tostring(flag16 or ""))
end

tbl1.Progress = function(param33)
	return tbl1.Fire("UpdateProgress", param33)
end

tbl1.Retry = function(param34, param35)
	return tbl1.Fire("UpdateRetry", param34, param35)
end

tbl1.Recovery = function(param36, param37)
	return tbl1.Fire("UpdateRecovery", tostring(param36), param37)
end

tbl1.Theme = function(param38)
	return tbl1.Fire("UpdateTheme", param38)
end

tbl1.Reset = function()
	return tbl1.Fire("ResetSession")
end

tbl1.Complete = function()
	return tbl1.Fire("CompleteSession")
end

tbl1.Destroy = function()
	return tbl1.Fire("DestroyUI")
end
--[=[ SL ]=] -- discord.gg/x7YbZeezpm

local value19 = tbl1

local function func37(...)
	local packed1 = table.pack(...)

	for i = 1, packed1.n do
		packed1[i] = tostring(packed1[i])
	end

	return table.concat(packed1, " ", 1, packed1.n)
end

local function func38(param39, ...)
	local value20 = func37(...)
	print("[AutoBounty]", value20)
	value19.Log(value20, param39)
	return value20
end

local function func39(...)
	local value21 = func37(...)
	print("[AutoBounty]", value21)
	value19.Step(value21)
	return value21
end

local function func40(...)
	local packed2 = table.pack(...)
	return func38("Info", table.unpack(packed2, 1, packed2.n))
end

local flag17, value22 = value19.Start()

if not flag17 then
	warn("[AutoBounty] status ui failed:", value22)
end

local function func41()
	local autoBountyConfig = (type(getgenv) == "function" and getgenv() or _G).AutoBountyConfig
	local str3 = "Pirates"

	if type(autoBountyConfig) == "table" and type(autoBountyConfig.Team) == "string" and autoBountyConfig.Team ~= "" then
		str3 = autoBountyConfig.Team
	end

	if localPlayer.Team then
		func40("team already", tostring(localPlayer.Team))
		return true
	end
	local remotes = replicatedStorage:WaitForChild("Remotes", 30)
	remotes = remotes and remotes:WaitForChild("CommF_", 30)
	if not remotes then
		func38("Error", "join team failed, no CommF_")
		return false
	end

	for i = 1, 100 do
		pcall(function()
			local main = playerGui:FindFirstChild("Main")
			main = main and main:FindFirstChild("ChooseTeam")
			main = main and main:FindFirstChild("Container")
			main = main and main:FindFirstChild(str3)
			main = main and main:FindFirstChild("Frame")
			main = main and main:FindFirstChild("TextButton")

			if main and type(getconnections) == "function" then
				for _, getconnection in pairs(getconnections(main.Activated)) do
					getconnection.Function()
				end
			end

			remotes:InvokeServer("SetTeam", str3)
		end)

		task.wait(0.3)
		if localPlayer.Team then
			func38("Success", "team joined", tostring(localPlayer.Team), i)
			return true
		end
	end

	func38("Warning", "join team timed out, wanted", str3)
	return false
end

func41()
local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

localPlayer.CharacterAdded:Connect(function(character2)
	character = character2
	humanoid = character2:WaitForChild("Humanoid")
	humanoidRootPart = character2:WaitForChild("HumanoidRootPart")
end)

local list2 = {}

local function func42(obj3, childName2, flag18)
	if not obj3 then
		list2[#list2 + 1] = tostring(childName2)
		return nil
	end
	local flag19 = obj3:WaitForChild(childName2, flag18 or 10)

	if not flag19 then
		list2[#list2 + 1] = obj3:GetFullName() .. "." .. childName2
	end

	return flag19
end

local data = func42(localPlayer, "Data")
func42(data, "Level")
local flag20 = func42(func42(localPlayer, "leaderstats"), "Bounty/Honor")
local remotes = func42(replicatedStorage, "Remotes")
local commF = func42(remotes, "CommF_")
local commE = func42(remotes, "CommE")
local modules = func42(replicatedStorage, "Modules")
func42(modules, "Net")
func42(workspace, "Map")
func42(workspace, "NPCs")
func42(workspace, "Characters")
local worldOrigin = func42(workspace, "_WorldOrigin")
local safeZones = func42(worldOrigin, "SafeZones")
local attribute = workspace:GetAttribute("MAP")
local jobId = game.JobId

if #list2 > 0 then
	func38("Warning", "missing instances:", table.concat(list2, ", "))
end

func40("stage 1 - instances resolved")
local genv2 = type(getgenv) == "function" and getgenv() or _G

local tbl16 = {
	Enabled = false,
	Team = "Pirates",
	Debug = false,
	Settings = {
		SpectateTarget = false,
		ESPTarget = true,
		CameraLock = true,
		BigHitbox = true,
		NoCooldown = true,
		Aimbot = true,
		BypassTeleport = true,
		SkipV4Player = true,
		SkipFruit = {
			"Portal-Portal",
			"Buddha-Buddha",
			"Kitsune-Kitsune",
			"Dragon-Dragon",
			"Pain-Pain",
			"Ice-Ice",
			"Dough-Dough",
			"T-Rex-T-Rex",
			"Yeti-Yeti",
		},
		LevelBand = 0.75,
		LowHealth = { Min = 4000, Max = 6000 },
		Others = { AutoAwakeningV4 = true, AutoTurnRaceV3 = true, AutoKen = true },
	},
	Weapon = {
		Melee = {
			Enabled = true,
			Delay = 0.1,
			Skills = {
				Z = { Enabled = true, Hold = 0 },
				X = { Enabled = true, Hold = 0 },
				C = { Enabled = true, Hold = 0 },
			},
		},
		Sword = {
			Enabled = true,
			Delay = 0.1,
			Skills = { Z = { Enabled = true, Hold = 0 }, X = { Enabled = true, Hold = 0 } },
		},
		Gun = {
			Enabled = true,
			Delay = 0.1,
			Skills = { Z = { Enabled = true, Hold = 0 }, X = { Enabled = true, Hold = 0 } },
		},
		["Blox Fruit"] = {
			Enabled = true,
			Delay = 0.1,
			Skills = {
				Z = { Enabled = true, Hold = 0 },
				X = { Enabled = true, Hold = 0 },
				C = { Enabled = true, Hold = 0 },
				V = { Enabled = false, Hold = 0 },
				F = { Enabled = true, Hold = 0 },
			},
		},
	},
	Server = { StopAtBounty = 0, HopDelay = 5, HopCooldown = 15 },
	Webhook = { Enabled = false, Url = "" },
	Status = {
		AccentColor = Color3.fromRGB(58, 140, 255),
		AnimationSpeed = 1,
		ReduceMotion = false,
		Transparency = 0,
	},
}

local value23 = nil

value23 = function(tbl17, list3)
	for k, value24 in pairs(list3) do
		if type(value24) == "table" and #value24 == 0 then
			if type(tbl17[k]) ~= "table" then
				tbl17[k] = {}
			end

			value23(tbl17[k], value24)
		elseif tbl17[k] == nil then
			tbl17[k] = value24
		end
	end

	return tbl17
end

local autoBountyConfig = type(genv2.AutoBountyConfig) == "table" and genv2.AutoBountyConfig or {}
value23(autoBountyConfig, tbl16)
genv2.AutoBountyConfig = autoBountyConfig
func40("stage 2 - config ready, team:", tostring(autoBountyConfig.Team))
local autoBounty = {}

local autoBountyRuntime = {
	Active = false,
	Connection = nil,
	Job = nil,
	WatcherConnections = {},
	Target = nil,
	TargetClock = 0,
	NextScanClock = 0,
	NextAttackClock = 0,
	NextHopClock = 0,
	StartBounty = 0,
	Kills = 0,
	Targets = {},
	Blacklisted = {},
	Deaths = {},
	Motion = setmetatable({}, { __mode = "k" }),
	NoClipParts = {},
	BypassCount = 0,
	Rejects = {},
	LastReject = nil,
	LastThreat = nil,
	CombatLabel = nil,
	LastTargetHealth = 0,
	LastOwnHealth = 0,
	SafeZoneParts = {},
	SafeZoneCount = -1,
	Areas = {},
	AreaCount = -1,
	SkipFruits = {},
	SkipFruitSource = nil,
	SkipFruitCount = -1,
	Tweening = false,
	TweenNumber = 0,
	LastCFrame = nil,
	NoTargetClock = 0,
	NextRaceClock = 0,
	NextPvpClock = 0,
	NextBusoClock = 0,
	NextKenClock = 0,
	NextHeartbeat = 0,
	NextHitboxClock = 0,
	NextCombatLog = 0,
	IdleGoalY = 0,
	LastGlide = 0,
	DiveUntil = 0,
	NextDive = 0,
	Panic = false,
	Hooked = false,
	AimHits = 0,
	Hits = 0,
	MeleePatched = false,
	CooldownPatched = false,
	Global = nil,
	AttackMelee = nil,
	Controller = nil,
	AntiAfk = nil,
	Bypassing = false,
	Hopping = false,
	NotifyConnection = nil,
	ESP = nil,
	ESPConnection = nil,
	EffectConnection = nil,
	CameraConnection = nil,
	NextEntranceClock = 0,
}

local autoBountyRuntime2 = genv2.AutoBountyRuntime

if type(autoBountyRuntime2) == "table" then
	autoBountyRuntime2.Active = false

	for _, item8 in ipairs({ "NotifyConnection", "ESPConnection", "EffectConnection", "CameraConnection", "AntiAfk" }) do
		pcall(function()
			autoBountyRuntime2[item8]:Disconnect()
		end)
	end

	if type(autoBountyRuntime2.ESP) == "table" then
		for _, value25 in pairs(autoBountyRuntime2.ESP) do
			pcall(function()
				value25:Remove()
			end)
		end
	end

	func40("stopped previous instance")
end

genv2.AutoBountyRuntime = autoBountyRuntime

local function func43(...)
	if autoBountyConfig.Debug then
		print("[AutoBounty]", ...)
	end
end

local tbl18 = { "Z", "X", "C", "V", "F" }
local tbl19 = { "Melee", "Sword", "Gun", "Blox Fruit" }
local tbl20 = { Melee = true, Sword = true, ["Demon Fruit"] = true }
local tbl21 = { Fishman = true }
local tbl22 = { ["prehistoric island"] = true, ["kitsune island"] = true }
local tbl23 = { Marines = true }
local tbl24 = { RemoteEvent = true, LeftClickRemote = true }
local tbl25 = { underwater = true, toohigh = true }

local tbl26 = {
	BodyVelocity = true,
	BodyGyro = true,
	BodyPosition = true,
	AlignPosition = true,
	AlignOrientation = true,
	LinearVelocity = true,
	VectorForce = true,
}

local tbl27 = {
	ParticleEmitter = true,
	Trail = true,
	Beam = true,
	Smoke = true,
	Fire = true,
	Sparkles = true,
	ForceField = true,
	Explosion = true,
	Highlight = true,
	PointLight = true,
	SpotLight = true,
	SurfaceLight = true,
}

local n = 0.25
local n2 = 70
local n3 = 0.35
local n4 = 4
local color = Color3.fromRGB(255, 255, 255)
local n5 = 5
local n6 = 50
local n7 = 25
local n8 = 3500
local n9 = 2000
local n10 = 10000
local n11 = 5
local n12 = 1000
local str4 = "RE/RegisterAttack"
local n13 = 0.8
local tbl28 = { "Fist of Darkness", "God's Chalice", "Sweet Chalice" }

local flag21 = ({
	Sea1 = {
		["Sky Arena 1"] = Vector3.new(-4654, 872, -1759),
		["Sky Arena 2"] = Vector3.new(-7894, 5547, -380),
		["UnderWater City 1"] = Vector3.new(3876, 35, -1939),
		["UnderWater City 2"] = Vector3.new(61163, 11, 1819),
	},
	Sea2 = {
		Mansion = Vector3.new(-288, 305, 613),
		["Swan Room"] = Vector3.new(2284, 15, 897),
		["Out Ship"] = Vector3.new(-6518, 83, -145),
		["In Ship"] = Vector3.new(923, 125, 32883),
	},
	Sea3 = {
		Mansion = Vector3.new(-12550, 337, -7476),
		["Castle On The Sea"] = Vector3.new(-5073, 314, -3152),
		["Hydra Island"] = Vector3.new(5681, 1013, -313),
		["Temple Of Time"] = Vector3.new(28294, 14896, 103),
	},
})[attribute]

func40("sea:", tostring(attribute), "portals:", flag21 ~= nil)
local cframe = CFrame.new(0, 25, 0)
local cframe2 = CFrame.new(0, 2, 2)
local cframe3 = CFrame.new(0, 50, 0)
local n27 = 0.45
local huge = math.huge
local n35 = 3636
local color2 = Color3.fromRGB(255, 255, 255)
local vector = Vector3.new(0, 3, 0)
local vector2 = Vector3.new(0, 3.5, 0)

autoBounty.ToCFrame = function(obj)
	local kind = typeof(obj)
	if kind == "CFrame" then
		return obj
	end

	if kind == "Vector3" then
		return CFrame.new(obj)
	end

	if kind == "Instance" then
		if obj:IsA("BasePart") then
			return obj.CFrame
		end

		if obj:IsA("Model") then
			return obj:GetPivot()
		end
	end

	return nil
end
--[=[ 𝐒𝐋 ]=] -- discord.gg/x7YbZeezpm

autoBounty.GetAliveParts = function(obj)
	if not obj or not obj.Parent then
		return nil
	end
	local humanoid2 = obj:FindFirstChildOfClass("Humanoid")
	if not humanoid2 or humanoid2.Health <= 0 then
		return nil
	end
	local humanoidRootPart2 = obj:FindFirstChild("HumanoidRootPart")
	if not humanoidRootPart2 then
		return nil
	end
	return humanoid2, humanoidRootPart2
end

autoBounty.IsAlive = function(param40)
	return autoBounty.GetAliveParts(param40) ~= nil
end

autoBounty.GetBounty = function()
	return flag20 and flag20.Value or 0
end

autoBounty.GetLevel = function(instance, flag22)
	local data2 = flag22 or instance and instance:FindFirstChild("Data")
	data2 = data2 and data2:FindFirstChild("Level")
	if not data2 then
		return 0
	end
	return tonumber(data2.Value) or 0
end

autoBounty.InLevelBand = function(param41)
	local levelBand = autoBountyConfig.Settings.LevelBand
	if type(levelBand) ~= "number" or levelBand <= 0 or levelBand >= 1 then
		return true
	end
	local num3 = autoBounty.GetLevel(localPlayer, data)
	if num3 <= 0 or param41 <= 0 then
		return true
	end
	return param41 >= num3 * levelBand and param41 <= num3 / levelBand
end

autoBounty.GetSafeZoneParts = function()
	local safeZoneParts = autoBountyRuntime.SafeZoneParts
	if not safeZones then
		return safeZoneParts
	end
	local children = safeZones:GetChildren()

	if #children ~= autoBountyRuntime.SafeZoneCount then
		table.clear(safeZoneParts)

		for i = 1, #children do
			local entry4 = children[i]

			if entry4:IsA("BasePart") then
				safeZoneParts[#safeZoneParts + 1] = entry4
			elseif entry4:IsA("Model") then
				local primaryPart = entry4.PrimaryPart or entry4:FindFirstChildWhichIsA("BasePart")

				if primaryPart then
					safeZoneParts[#safeZoneParts + 1] = primaryPart
				end
			end
		end

		autoBountyRuntime.SafeZoneCount = #children
		func40("safe zones:", #safeZoneParts)
	end

	return safeZoneParts
end

autoBounty.InSafeZone = function(param42)
	local list4 = autoBounty.GetSafeZoneParts()

	for i = 1, #list4 do
		local entry5 = list4[i]

		if entry5.Parent then
			local value26 = entry5.CFrame:PointToObjectSpace(param42)
			local size2 = entry5.Size
			local n46 = size2.X * 0.5 + n6
			local flag23 = math.abs(value26.X) <= n46

			if flag23 then
				local n47 = size2.Z * 0.5 + n6
				flag23 = math.abs(value26.Z) <= n47
			end

			if flag23 then
				local n47 = size2.Y * 0.5 + n6
				flag23 = math.abs(value26.Y) <= n47
			end

			if flag23 then
				return true
			end
		end
	end

	return false
end

autoBounty.GetAreas = function()
	local areas = autoBountyRuntime.Areas
	local locations = worldOrigin and worldOrigin:FindFirstChild("Locations")
	if not locations then
		return areas
	end
	local children = locations:GetChildren()

	if #children ~= autoBountyRuntime.AreaCount then
		table.clear(areas)

		for i = 1, #children do
			local entry6 = children[i]
			local mesh = entry6:FindFirstChild("Mesh")

			if mesh and entry6:IsA("BasePart") then
				local x = mesh.Scale.X
				areas[#areas + 1] = { Name = entry6.Name, Position = entry6.Position, RadiusSquared = x * x }
			end
		end

		autoBountyRuntime.AreaCount = #children
		func40("areas:", #areas)
	end

	return areas
end

autoBounty.InArea = function(num4)
	local list5 = autoBounty.GetAreas()

	for i = 1, #list5 do
		local entry7 = list5[i]
		local n46 = entry7.Position - num4
		if n46.X * n46.X + n46.Y * n46.Y + n46.Z * n46.Z <= entry7.RadiusSquared then
			return entry7.Name
		end
	end

	return nil
end

autoBounty.IsBlockedArea = function(flag24)
	if not flag24 then
		return false
	end
	local lowered = string.lower(flag24)
	return tbl22[lowered] == true or string.find(lowered, "trial") ~= nil
end

autoBounty.GetSkipFruits = function()
	local skipFruit = autoBountyConfig.Settings.SkipFruit
	if type(skipFruit) ~= "table" then
		return nil
	end

	if autoBountyRuntime.SkipFruitSource ~= skipFruit or #skipFruit ~= autoBountyRuntime.SkipFruitCount then
		table.clear(autoBountyRuntime.SkipFruits)

		for i = 1, #skipFruit do
			autoBountyRuntime.SkipFruits[skipFruit[i]] = true
		end

		autoBountyRuntime.SkipFruitSource = skipFruit
		autoBountyRuntime.SkipFruitCount = #skipFruit
	end

	return autoBountyRuntime.SkipFruits
end

autoBounty.GetFruitName = function(instance2, instance3, flag25)
	local data2 = flag25 or instance2:FindFirstChild("Data")
	data2 = data2 and data2:FindFirstChild("DevilFruit")
	if data2 and data2.Value ~= "" then
		return data2.Value
	end
	local children = instance3:GetChildren()

	for i = 1, #children do
		local entry8 = children[i]
		if entry8:IsA("Tool") and entry8.ToolTip == "Blox Fruit" then
			return entry8.Name
		end
	end

	return nil
end

autoBounty.HasThreatNearby = function(num5, param43)
	local tbl29 = autoBounty.GetSkipFruits()
	if not tbl29 then
		return false
	end
	local players2 = players:GetPlayers()

	for i = 1, #players2 do
		local entry9 = players2[i]

		if entry9 ~= localPlayer and entry9 ~= param43 then
			local character2 = entry9.Character
			local value27, value28 = autoBounty.GetAliveParts(character2)

			if value27 then
				local n46 = value28.Position - num5
				if not (n46.X * n46.X + n46.Y * n46.Y + n46.Z * n46.Z <= 90000) then
					continue
				end
				local flag26 = autoBounty.GetFruitName(entry9, character2)
				if flag26 and tbl29[flag26] then
					return true, entry9.Name, flag26
				end
			end
		end
	end

	return false
end

autoBounty.HasBodyMover = function(instance4)
	local humanoidRootPart2 = instance4:FindFirstChild("HumanoidRootPart")
	local head = instance4:FindFirstChild("Head")
	local torso = instance4:FindFirstChild("Torso") or instance4:FindFirstChild("UpperTorso")
	local tbl30 = { humanoidRootPart2, head, torso }

	for i = 1, #tbl30 do
		local entry10 = tbl30[i]

		if entry10 then
			local children = entry10:GetChildren()

			for i2 = 1, #children do
				local entry11 = children[i2]
				if tbl26[entry11.ClassName] then
					return true, entry11.ClassName
				end
			end
		end
	end

	return false
end

autoBounty.TrackMotion = function(param44, part2)
	local num6 = autoBountyRuntime.Motion[param44]
	local now = os.clock()

	if not num6 then
		local tbl31 = { Position = part2.Position, Clock = now, Score = 0 }
		autoBountyRuntime.Motion[param44] = tbl31
		return tbl31
	end

	local n46 = now - num6.Clock
	if n46 < n then
		return num6
	end
	local n47 = (part2.Position - num6.Position).Magnitude / n46

	if n47 >= n2 and (part2.AssemblyLinearVelocity or part2.Velocity).Magnitude <= n47 * n3 then
		num6.Score = math.min(num6.Score + 1, 8)
	else
		num6.Score = math.max(num6.Score - 1, 0)
	end

	num6.Position = part2.Position
	num6.Clock = now
	return num6
end

autoBounty.IsLikelyBot = function(param45, param46, param47)
	local value29, value30 = autoBounty.HasBodyMover(param46)
	if value29 then
		return true, value30
	end

	if n4 <= autoBounty.TrackMotion(param45, param47).Score then
		return true, "teleporting"
	end
	return false
end

autoBounty.GetTeamName = function()
	if localPlayer.Team then
		return localPlayer.Team.Name
	end
	return autoBountyConfig.Team
end

autoBounty.HasItem = function(childName3)
	local backpack = localPlayer:FindFirstChild("Backpack")
	if backpack and backpack:FindFirstChild(childName3) then
		return true
	end
	return character ~= nil and character:FindFirstChild(childName3) ~= nil
end

autoBounty.GetSpawnFolder = function()
	local playerSpawns = worldOrigin and worldOrigin:FindFirstChild("PlayerSpawns")
	if not playerSpawns then
		return nil
	end
	local flag27 = autoBounty.GetTeamName()
	return flag27 and playerSpawns:FindFirstChild(flag27) or playerSpawns:FindFirstChild("Pirates")
end

autoBounty.GetBypassCFrame = function(num7)
	local obj4 = autoBounty.GetSpawnFolder()
	if not obj4 then
		return nil
	end
	local value31, flag28 = autoBounty.GetAliveParts(character)
	if not flag28 then
		return nil
	end
	local position = flag28.Position
	local children = obj4:GetChildren()
	local magnitude = (num7 - position).Magnitude
	local huge2 = math.huge
	local cFrame = nil
	local name = nil

	for i = 1, #children do
		local part = children[i]:FindFirstChild("Part")

		if part then
			local magnitude2 = (part.Position - num7).Magnitude
			local magnitude3 = Vector3.new(part.Position.X - position.X, 0, part.Position.Z - position.Z).Magnitude

			if magnitude2 <= huge2 and magnitude2 + n12 <= magnitude and magnitude3 <= n10 and magnitude3 >= n9 then
				cFrame = part.CFrame
				name = children[i].Name
				huge2 = magnitude2
			end
		end
	end

	return cFrame, name
end

autoBounty.CanBypass = function()
	if not autoBountyConfig.Settings.BypassTeleport then
		return false
	end

	if autoBountyRuntime.BypassCount >= n11 then
		return false
	end

	if autoBounty.InCombat() then
		return false
	end

	for i = 1, #tbl28 do
		if autoBounty.HasItem(tbl28[i]) then
			return false
		end
	end

	return true
end

autoBounty.GetPortal = function(num8)
	if not flag21 then
		return nil
	end

	if attribute == "Sea3" and not autoBounty.HasItem("Valkyrie Helm") then
		return nil
	end
	local value32, num9 = autoBounty.GetAliveParts(character)
	if not num9 then
		return nil
	end
	local huge2 = math.huge
	local value33 = nil

	for _, value34 in pairs(flag21) do
		local magnitude = (value34 - num8).Magnitude

		if magnitude <= huge2 then
			huge2 = magnitude
			value33 = value34
		end
	end

	if value33 and huge2 + 250 <= (num8 - num9.Position).Magnitude then
		return value33
	end
	return nil
end

autoBounty.GetCombatLabel = function()
	local combatLabel = autoBountyRuntime.CombatLabel
	if combatLabel and combatLabel.Parent then
		return combatLabel
	end
	local main = playerGui:FindFirstChild("Main")
	if not main then
		return nil
	end
	local bottomHUDList = main:FindFirstChild("BottomHUDList")
	bottomHUDList = bottomHUDList and bottomHUDList:FindFirstChild("InCombat") or main:FindFirstChild("InCombat") or main:FindFirstChild("InCombat", true)
	autoBountyRuntime.CombatLabel = bottomHUDList

	if bottomHUDList then
		func40("combat label:", bottomHUDList:GetFullName())
	end

	return bottomHUDList
end

autoBounty.IsFighting = function()
	local flag29 = autoBounty.GetCombatLabel()
	return flag29 ~= nil and flag29.Visible and flag29.Text:lower():find("risk!")
end
-- Source Leak (SL) | https://discord.gg/x7YbZeezpm

autoBounty.InCombat = function()
	return autoBounty.IsFighting()
end

autoBounty.RequestEntrance = function(obj)
	local flag30 = not commF

	if not flag30 then
		local nextEntranceClock = autoBountyRuntime.NextEntranceClock
		flag30 = os.clock() - nextEntranceClock < 1
	end

	if flag30 then
		return false
	end

	if autoBounty.InCombat() then
		return false
	end
	autoBountyRuntime.NextEntranceClock = os.clock()
	local floor = math.floor
	local z = obj.Z
	func38("Travel", "entrance", math.floor(obj.X), floor(z))

	pcall(function()
		commF:InvokeServer("requestEntrance", obj)
	end)

	return true
end

autoBounty.BlacklistTarget = function(obj, flag31, flag32)
	if not obj then
		return false
	end

	if flag32 == huge then
		autoBountyRuntime.Blacklisted[obj] = huge
	else
		autoBountyRuntime.Blacklisted[obj] = os.clock() + (flag32 or 45)
	end

	autoBountyRuntime.Deaths[obj] = nil

	if autoBountyRuntime.Target == obj then
		autoBountyRuntime.Target = nil
	end

	func38("Warning", "skip", obj.Name, "reason:", flag31 or "unknown")
	return true
end

autoBounty.ClearBlacklist = function()
	local blacklisted = autoBountyRuntime.Blacklisted
	local n46 = 0

	for k, value35 in pairs(blacklisted) do
		if value35 ~= huge then
			blacklisted[k] = nil
			n46 += 1
		end
	end

	return n46
end

autoBounty.Reject = function(lastReject)
	local rejects = autoBountyRuntime.Rejects
	rejects[lastReject] = (rejects[lastReject] or 0) + 1
	autoBountyRuntime.LastReject = lastReject
	return nil
end

autoBounty.FormatRejects = function()
	local list6 = {}

	for k, reject in pairs(autoBountyRuntime.Rejects) do
		list6[#list6 + 1] = k .. "=" .. reject
	end

	if #list6 == 0 then
		return "none"
	end
	table.sort(list6)
	return table.concat(list6, " ")
end

autoBounty.IsValidTarget = function(obj, num10, flag33, flag34)
	if obj == localPlayer or not obj.Parent then
		return nil
	end
	local value36 = autoBountyRuntime.Blacklisted[obj]

	if value36 then
		if os.clock() < value36 then
			return autoBounty.Reject("blacklist")
		end
		autoBountyRuntime.Blacklisted[obj] = nil
	end

	if obj:GetAttribute("PvpDisabled") then
		return autoBounty.Reject("pvpdisabled")
	end

	if obj:GetAttribute("IslandRaiding") then
		return autoBounty.Reject("raiding")
	end

	if flag34 and tbl23[flag34] and obj.Team and obj.Team.Name == flag34 then
		return autoBounty.Reject("sameteam")
	end
	local character2 = obj.Character
	local flag35, value37 = autoBounty.GetAliveParts(character2)
	if not flag35 then
		return autoBounty.Reject("dead")
	end

	if flag35.Sit then
		return autoBounty.Reject("sitting")
	end

	if value37.Position.Y <= -500 then
		autoBounty.BlacklistTarget(obj, "underwater")
		return autoBounty.Reject("underwater")
	end

	if value37.Position.Y >= 13000 then
		autoBounty.BlacklistTarget(obj, "too high")
		return autoBounty.Reject("toohigh")
	end
	local n46 = value37.Position - num10
	local n47 = n46.X * n46.X + n46.Y * n46.Y + n46.Z * n46.Z
	if flag33 < n47 then
		return autoBounty.Reject("range")
	end
	local settings = autoBountyConfig.Settings
	local raceTransformed = character2:FindFirstChild("RaceTransformed")
	if settings.SkipV4Player and raceTransformed and raceTransformed.Value then
		return autoBounty.Reject("v4")
	end
	local data2 = obj:FindFirstChild("Data")
	local race = data2 and data2:FindFirstChild("Race")
	if race and tbl21[race.Value] then
		return autoBounty.Reject("race")
	end

	if not autoBounty.InLevelBand(autoBounty.GetLevel(obj, data2)) then
		return autoBounty.Reject("level")
	end
	local tbl32 = autoBounty.GetSkipFruits()

	if tbl32 then
		local flag36 = autoBounty.GetFruitName(obj, character2, data2)
		if flag36 and tbl32[flag36] then
			return autoBounty.Reject("fruit")
		end
	end

	if autoBounty.InSafeZone(value37.Position) then
		return autoBounty.Reject("safezone")
	end
	local value38 = autoBounty.InArea(value37.Position)
	if autoBounty.IsBlockedArea(value38) then
		return autoBounty.Reject("area")
	end
	local value39, str5, str6 = autoBounty.HasThreatNearby(value37.Position, obj)
	if value39 then
		autoBountyRuntime.LastThreat = str5 .. " " .. str6
		return autoBounty.Reject("threat")
	end
	return flag35, value37, n47
end

autoBounty.GetTargets = function(num11)
	local targets = autoBountyRuntime.Targets
	table.clear(targets)
	local value40, flag37 = autoBounty.GetAliveParts(character)
	if not flag37 then
		return targets
	end
	local position = flag37.Position
	num11 = num11 or 15000
	local n46 = num11 * num11
	local value41 = autoBounty.GetTeamName()
	local players2 = players:GetPlayers()

	for i = 1, #players2 do
		local entry12 = players2[i]
		local value42, value43, value44 = autoBounty.IsValidTarget(entry12, position, n46, value41)

		if value42 then
			targets[#targets + 1] = {
				Player = entry12,
				Character = entry12.Character,
				Humanoid = value42,
				Root = value43,
				Distance = math.sqrt(value44),
			}
		end
	end

	table.sort(targets, function(param48, param49)
		return param48.Distance < param49.Distance
	end)

	return targets
end

autoBounty.GetTarget = function(num12)
	local value45, flag38 = autoBounty.GetAliveParts(character)
	if not flag38 then
		autoBountyRuntime.Target = nil
		return nil
	end
	local position = flag38.Position
	num12 = num12 or 15000
	local n46 = num12 * num12
	local value46 = autoBounty.GetTeamName()
	local target = autoBountyRuntime.Target

	if target then
		autoBountyRuntime.LastReject = nil
		local value47, value48 = autoBounty.IsValidTarget(target, position, n46, value46)
		if value47 then
			return target, value48, value47
		end
		local lastReject = autoBountyRuntime.LastReject or "unknown"

		if lastReject == "dead" then
			local n47 = (autoBountyRuntime.Deaths[target] or 0) + 1
			autoBountyRuntime.Deaths[target] = n47

			if 5 <= n47 then
				autoBounty.BlacklistTarget(target, "died " .. n47 .. "x")
			else
				func38("Waiting", "skip", target.Name, "reason: dead", n47 .. "/" .. 5)
			end
		elseif lastReject == "threat" then
			func38("Warning", "skip", target.Name, "reason: threat", autoBountyRuntime.LastThreat or "?")
		elseif not tbl25[lastReject] then
			func38("Warning", "skip", target.Name, "reason:", lastReject)
		end
		-- join us: https://discord.gg/x7YbZeezpm

		autoBountyRuntime.Target = nil
	end

	table.clear(autoBountyRuntime.Rejects)
	local players2 = players:GetPlayers()
	local huge2 = math.huge
	local value49 = nil
	local value50 = nil
	local value51 = nil

	for i = 1, #players2 do
		local entry13 = players2[i]
		local flag39, value52, flag40 = autoBounty.IsValidTarget(entry13, position, n46, value46)

		if flag39 and flag40 < huge2 then
			huge2 = flag40
			value49 = entry13
			value50 = value52
			value51 = flag39
		end
	end

	autoBountyRuntime.Target = value49
	autoBountyRuntime.TargetClock = os.clock()

	if value49 then
		local flag41, str7 = autoBounty.IsLikelyBot(value49, value49.Character, value50)
		autoBountyRuntime.BypassCount = 0
		autoBountyRuntime.LastTargetHealth = value51.Health
		autoBountyRuntime.LastOwnHealth = 0
		func38("Combat", "new target", value49.Name, "lv" .. autoBounty.GetLevel(value49), math.floor(math.sqrt(huge2)) .. " studs", flag41 and "bot? " .. str7 or "")
	end

	return value49, value50, value51
end

autoBounty.NoStun = function()
	local humanoidRootPart2 = character and character:FindFirstChild("HumanoidRootPart")
	if not humanoidRootPart2 then
		return false
	end
	local children = humanoidRootPart2:GetChildren()

	for i = 1, #children do
		local entry14 = children[i]

		if entry14.Name == "BodyGyro" or entry14.Name == "BodyPosition" then
			entry14:Destroy()
		end
	end

	return true
end

autoBounty.UseNoClip = function()
	if not character then
		return false
	end
	local noClipParts = autoBountyRuntime.NoClipParts
	if #noClipParts > 0 then
		return true
	end
	local descendants = character:GetDescendants()

	for i = 1, #descendants do
		local entry15 = descendants[i]

		if entry15:IsA("BasePart") and entry15.CanCollide then
			entry15.CanCollide = false
			noClipParts[#noClipParts + 1] = entry15
		end
	end

	return true
end

autoBounty.AddBodyVelocity = function(param50)
	local flag42, value53 = autoBounty.GetAliveParts(character)
	if not flag42 then
		return false
	end
	local head = character:FindFirstChild("Head") or value53

	if param50 then
		if flag42.Sit then
			flag42.Sit = false
		end

		if not head:FindFirstChild("BodyVelocity") then
			local bodyVelocity = Instance.new("BodyVelocity")
			bodyVelocity.Name = "BodyVelocity"
			bodyVelocity.MaxForce = Vector3.new(40000, 40000, 40000)
			bodyVelocity.Velocity = Vector3.zero
			bodyVelocity.P = 15000
			bodyVelocity.Parent = head
		end

		return true
	end

	local bodyVelocity = head:FindFirstChild("BodyVelocity")

	if bodyVelocity then
		bodyVelocity:Destroy()
	end

	local noClipParts = autoBountyRuntime.NoClipParts

	for i = #noClipParts, 1, -1 do
		local entry16 = noClipParts[i]

		if entry16 and entry16.Parent then
			entry16.CanCollide = true
		end

		noClipParts[i] = nil
	end

	return true
end

autoBounty.PrepareCharacter = function()
	autoBounty.AddBodyVelocity(true)
	autoBounty.UseNoClip()
	return true
end

autoBounty.StopTween = function()
	autoBountyRuntime.Tweening = false
	autoBountyRuntime.TweenNumber = autoBountyRuntime.TweenNumber + 1
	autoBountyRuntime.LastCFrame = nil
end

autoBounty.Tweento = function(param51, flag43)
	local num13 = autoBounty.ToCFrame(param51)
	if not num13 then
		return false
	end
	local flag44, num14 = autoBounty.GetAliveParts(character)
	if not flag44 then
		autoBountyRuntime.Tweening = false
		return false
	end
	local lastCFrame = autoBountyRuntime.LastCFrame
	if autoBountyRuntime.Tweening and lastCFrame and (lastCFrame.Position - num13.Position).Magnitude <= 10 then
		return true
	end
	local magnitude = (num13.Position - num14.Position).Magnitude
	if magnitude <= 0 then
		return true
	end
	autoBounty.NoStun()
	autoBounty.PrepareCharacter()
	autoBountyRuntime.TweenNumber = autoBountyRuntime.TweenNumber + 1
	autoBountyRuntime.LastCFrame = num13
	autoBountyRuntime.Tweening = true
	local tweenNumber = autoBountyRuntime.TweenNumber
	local cFrame = num14.CFrame
	local n46 = flag43 or 300
	local n47 = 0

	task.spawn(function()
		while autoBountyRuntime.Tweening and autoBountyRuntime.TweenNumber == tweenNumber and n47 < magnitude and num14.Parent and flag44.Health > 0 do
			n47 += n46 * task.wait()
			num14.CFrame = cFrame:Lerp(num13, math.clamp(n47 / magnitude, 0, 1))
		end

		if autoBountyRuntime.TweenNumber == tweenNumber then
			autoBountyRuntime.Tweening = false
			autoBountyRuntime.LastCFrame = nil
		end
	end)

	return true
end

autoBounty.BypassTP = function(param52)
	if autoBountyRuntime.Bypassing or not autoBounty.CanBypass() then
		return false
	end
	local flag45, flag46 = autoBounty.GetBypassCFrame(param52)
	if not flag45 or not flag46 then
		return false
	end
	autoBountyRuntime.Bypassing = true
	autoBounty.StopTween()
	func38("Travel", "bypass to", flag46)

	task.spawn(function()
		pcall(function()
			local flag47, flag48 = autoBounty.GetAliveParts(character)
			if not flag47 or not flag48 then
				return
			end
			flag48.Anchored = true

			while true do
				task.wait()
				flag47.Health = 0
				commF:InvokeServer("SetLastSpawnPoint", flag46)
				character:PivotTo(flag45)

				if flag48.Parent then
					flag48.Anchored = false
				end

				task.wait(1)
				if not (flag47.Health <= 0 or not flag47.Parent or not autoBounty.CanBypass()) then
					continue
				end
				break
			end

			autoBountyRuntime.BypassCount = autoBountyRuntime.BypassCount + 1
		end)

		local n46 = os.clock() + 20

		while true do
			task.wait()
			if not (autoBounty.IsAlive(character) or os.clock() > n46) then
				continue
			end
			break
		end

		autoBountyRuntime.Bypassing = false
		autoBountyRuntime.TargetClock = os.clock()
		func38("Travel", "bypass done, count:", autoBountyRuntime.BypassCount)
	end)

	return true
end

autoBounty.Travel = function(param53, param54)
	if autoBountyRuntime.Bypassing then
		return false
	end
	local flag49 = autoBounty.ToCFrame(param53)
	if not flag49 then
		return false
	end
	local value54, num15 = autoBounty.GetAliveParts(character)
	if not num15 then
		return false
	end
	local position = flag49.Position
	local magnitude = (position - num15.Position).Magnitude

	if magnitude <= n7 then
		autoBounty.StopTween()
		autoBountyRuntime.BypassCount = 0
		num15.CFrame = flag49
		return true
	end

	local value55 = autoBounty.GetPortal(position)
	if value55 then
		autoBounty.RequestEntrance(value55)
		return true
	end

	if magnitude >= n8 and autoBounty.CanBypass() and autoBounty.GetBypassCFrame(position) then
		return autoBounty.BypassTP(position)
	end
	return autoBounty.Tweento(flag49, param54)
end

autoBounty.GetWeaponName = function(param55)
	local backpack = localPlayer:FindFirstChild("Backpack")

	if backpack then
		local children = backpack:GetChildren()

		for i = 1, #children do
			local entry17 = children[i]
			if entry17:IsA("Tool") and entry17.ToolTip == param55 then
				return entry17.Name
			end
		end
	end

	if character then
		local tool = character:FindFirstChildOfClass("Tool")
		if tool and tool.ToolTip == param55 then
			return tool.Name
		end
	end

	return nil
end

autoBounty.EquipWeapon = function(param56)
	local flag50 = autoBounty.GetWeaponName(param56)
	if not flag50 then
		return false
	end

	if character and character:FindFirstChild(flag50) then
		return true
	end
	local backpack = localPlayer:FindFirstChild("Backpack")
	backpack = backpack and backpack:FindFirstChild(flag50)
	if backpack and humanoid then
		humanoid:EquipTool(backpack)
		return true
	end
	return false
end

autoBounty.GetSkill = function(param57)
	local flag51 = autoBountyConfig.Weapon[param57]
	if not flag51 or not flag51.Enabled then
		return nil
	end
	local flag52 = autoBounty.GetWeaponName(param57)
	if not flag52 then
		return nil
	end
	local main = playerGui:FindFirstChild("Main")
	main = main and main:FindFirstChild("Skills")
	main = main and main:FindFirstChild(flag52)

	for i = 1, #tbl18 do
		local entry18 = tbl18[i]
		local flag53 = flag51.Skills[entry18]

		if flag53 and flag53.Enabled then
			if not main then
				return entry18, flag53.Hold or 0, false
			end
			local title = main:FindFirstChild(entry18)
			local cooldown = title and title:FindFirstChild("Cooldown")
			title = title and title:FindFirstChild("Title")
			if cooldown and title and cooldown.AbsoluteSize.X <= n5 and title.TextColor3 == color then
				return entry18, flag53.Hold or 0, true
			end
		end
	end

	return nil
end

autoBounty.GetReadyWeapon = function()
	for i = 1, #tbl19 do
		local entry19 = tbl19[i]
		local value56, value57, value58 = autoBounty.GetSkill(entry19)
		if value56 then
			return entry19, value56, value57, value58
		end
	end

	return nil
end
--[=[ 𝗦𝗼𝘂𝗿𝗰𝗲 𝗟𝗲𝗮𝗸 (𝗦𝗟) ]=] -- discord.gg/x7YbZeezpm

autoBounty.SendKey = function(flag54, delay3)
	if not flag54 then
		return false
	end

	if type(set_thread_identity) == "function" then
		pcall(set_thread_identity, 8)
	end

	task.spawn(function()
		virtualInputManager:SendKeyEvent(true, flag54, false, game)

		if delay3 and delay3 > 0 then
			task.wait(delay3)
		else
			task.wait()
		end

		virtualInputManager:SendKeyEvent(false, flag54, false, game)
	end)

	return true
end

autoBounty.Notify = function(param58, param59)
	func43(param58, param59)
	value19.Log(param59, "Info")

	pcall(function()
		starterGui:SetCore("SendNotification", { Title = param58, Text = param59, Duration = 4 })
	end)
end

autoBounty.CheckNotify = function(param60)
	local notifications = playerGui:FindFirstChild("Notifications")
	if not notifications then
		return nil
	end
	local children = notifications:GetChildren()
	local lowered2 = string.lower(param60)

	for i = 1, #children do
		local entry20 = children[i]
		if entry20:IsA("TextLabel") and entry20.Text and string.find(string.lower(entry20.Text), lowered2) then
			return entry20
		end
	end

	return nil
end

autoBounty.FindPlayerByName = function(flag55)
	if not flag55 or flag55 == "" then
		return nil
	end
	local players2 = players:GetPlayers()

	for i = 1, #players2 do
		if players2[i].Name == flag55 then
			return players2[i]
		end
	end

	return nil
end

autoBounty.ReadNotification = function(obj)
	if not obj:IsA("TextLabel") or not obj.Text or obj.Text == "" then
		return false
	end
	local text = obj.Text
	local matched = string.match(text, "from killing%s+([%w_]+)")

	if matched then
		autoBountyRuntime.Kills = autoBountyRuntime.Kills + 1
		func38("Success", "killed", matched, "total:", autoBountyRuntime.Kills)
		autoBounty.UpdateProgress()
		autoBounty.SendWebhook(autoBounty.FindPlayerByName(matched))
		local target = autoBountyRuntime.Target

		if target and target.Name == matched then
			autoBountyRuntime.Target = nil
			autoBounty.StopTween()
		end

		return true
	end

	local matched2 = string.match(text, "from dying to%s+([%w_]+)")

	if matched2 then
		local value59 = autoBounty.FindPlayerByName(matched2)
		func38("Error", "died to", matched2)

		if value59 then
			autoBounty.BlacklistTarget(value59, "killed me", 600)
		end

		autoBounty.StopTween()
		return true
	end

	return false
end

autoBounty.WatchNotifications = function()
	if autoBountyRuntime.NotifyConnection then
		return false
	end
	local notifications = playerGui:FindFirstChild("Notifications")
	if not notifications then
		return false
	end

	autoBountyRuntime.NotifyConnection = notifications.ChildAdded:Connect(function(child)
		task.defer(function()
			pcall(autoBounty.ReadNotification, child)
		end)
	end)

	func40("watching notifications")
	return true
end

autoBounty.IsHudVisible = function(childName4)
	local main = playerGui:FindFirstChild("Main")
	local bottomHUDList = main and main:FindFirstChild("BottomHUDList")
	bottomHUDList = bottomHUDList and bottomHUDList:FindFirstChild(childName4) or main and main:FindFirstChild(childName4)
	return bottomHUDList ~= nil and bottomHUDList.Visible
end

autoBounty.FireRemote = function(...)
	if not commF then
		return false
	end
	local packed3 = table.pack(...)

	task.spawn(function()
		pcall(function()
			commF:InvokeServer(table.unpack(packed3, 1, packed3.n))
		end)
	end)

	return true
end

autoBounty.EnablePvp = function()
	local nextPvpClock = autoBountyRuntime.NextPvpClock
	if os.clock() - nextPvpClock < 3 then
		return false
	end

	if not autoBounty.IsHudVisible("PvpDisabled") then
		return false
	end
	autoBountyRuntime.NextPvpClock = os.clock()
	return autoBounty.FireRemote("EnablePvp")
end

autoBounty.EnableBuso = function()
	local nextBusoClock = autoBountyRuntime.NextBusoClock
	if os.clock() - nextBusoClock < 5 then
		return false
	end

	if not character or character:FindFirstChild("HasBuso") then
		return false
	end
	autoBountyRuntime.NextBusoClock = os.clock()
	return autoBounty.FireRemote("Buso")
end

autoBounty.GetObservation = function()
	local global = autoBountyRuntime.Global

	if not global then
		global = autoBounty.RequireModule(replicatedStorage:FindFirstChild("Global"))
		if type(global) ~= "table" then
			return nil
		end
		autoBountyRuntime.Global = global
	end

	local om = global.OM
	if type(om) ~= "table" then
		return nil
	end
	return om
end

autoBounty.IsKenActive = function()
	local value60 = autoBounty.GetObservation()
	if value60 then
		return value60.active == true
	end
	local events = replicatedStorage:FindFirstChild("Events")
	local isObservationActive = events and events:FindFirstChild("IsObservationActive")
	if not isObservationActive then
		return false
	end

	local ok, result = pcall(function()
		return isObservationActive:Invoke()
	end)

	return ok and result == true
end

autoBounty.ActiveKen = function()
	local others = autoBountyConfig.Settings.Others
	if not others or not others.AutoKen or not commE then
		return false
	end
	local nextKenClock = autoBountyRuntime.NextKenClock
	if os.clock() - nextKenClock < 0.5 then
		return false
	end

	if not character or character:FindFirstChild("KenDisabled") then
		return false
	end

	if not autoBounty.GetAliveParts(character) then
		return false
	end

	local ok, result = pcall(function()
		return character:HasTag("Ken")
	end)

	if ok and not result then
		return false
	end
	-- https://discord.gg/x7YbZeezpm | 𝚂𝚘𝚞𝚛𝚌𝚎 𝙻𝚎𝚊𝚔 (𝚂𝙻)

	if autoBounty.IsKenActive() then
		return false
	end
	local obj5 = autoBounty.GetObservation()
	if not obj5 then
		return false
	end
	autoBountyRuntime.NextKenClock = os.clock()

	pcall(function()
		obj5:setActive(true)
		local visionRadius = localPlayer:FindFirstChild("VisionRadius")

		if visionRadius then
			obj5.radius = visionRadius.Value
		end

		commE:FireServer("Ken", true)
	end)

	return true
end

autoBounty.TurnRace = function()
	local others = autoBountyConfig.Settings.Others
	if not others or not character then
		return false
	end

	if others.AutoAwakeningV4 then
		local raceEnergy = character:FindFirstChild("RaceEnergy")
		local raceTransformed = character:FindFirstChild("RaceTransformed")

		if raceEnergy and raceTransformed and raceEnergy.Value >= 1 and not raceTransformed.Value then
			task.spawn(function()
				pcall(function()
					local backpack = localPlayer:FindFirstChild("Backpack")
					backpack = backpack and backpack:FindFirstChild("Awakening")

					if backpack and backpack:FindFirstChild("RemoteFunction") then
						backpack.RemoteFunction:InvokeServer(true)
					end
				end)
			end)
		end
	end

	local autoTurnRaceV3 = others.AutoTurnRaceV3 and commE

	if autoTurnRaceV3 then
		local nextRaceClock = autoBountyRuntime.NextRaceClock
		autoTurnRaceV3 = os.clock() - nextRaceClock >= 1
	end

	if autoTurnRaceV3 then
		autoBountyRuntime.NextRaceClock = os.clock()

		pcall(function()
			commE:FireServer("ActivateAbility")
		end)
	end

	return true
end

autoBounty.SetTeam = function()
	local team = autoBountyConfig.Team
	if not team or team == "" then
		return true
	end

	if localPlayer.Team and localPlayer.Team.Name == team then
		return true
	end

	for i = 1, 10 do
		pcall(function()
			local main = playerGui:FindFirstChild("Main")
			main = main and main:FindFirstChild("ChooseTeam")
			main = main and main:FindFirstChild("Container")
			main = main and main:FindFirstChild(team)
			main = main and main:FindFirstChild("Frame")
			main = main and main:FindFirstChild("TextButton")

			if main and type(getconnections) == "function" then
				for _, getconnection2 in pairs(getconnections(main.Activated)) do
					getconnection2.Function()
				end
			else
				commF:InvokeServer("SetTeam", team)
			end
		end)

		task.wait(0.3)
		if localPlayer.Team and localPlayer.Team.Name == team then
			func38("Success", "team set", team, i)
			return true
		end
	end

	func38("Warning", "team not set, current:", tostring(localPlayer.Team))
	return false
end

autoBounty.UpdateCamera = function(cameraSubject)
	if not autoBountyConfig.Settings.SpectateTarget then
		if currentCamera.CameraSubject ~= humanoid and humanoid then
			currentCamera.CameraSubject = humanoid
		end

		return false
	end

	if cameraSubject == nil then
		if currentCamera.CameraSubject ~= humanoid and humanoid then
			currentCamera.CameraSubject = humanoid
			return true
		end
	end

	cameraSubject = cameraSubject and cameraSubject:FindFirstChildOfClass("Humanoid")
	if cameraSubject and currentCamera.CameraSubject ~= cameraSubject then
		currentCamera.CameraSubject = cameraSubject
		return true
	end
	return true
end

autoBounty.HandlePanic = function()
	local lowHealth = autoBountyConfig.Settings.LowHealth
	local flag56, value61 = autoBounty.GetAliveParts(character)
	if type(lowHealth) ~= "table" or not flag56 then
		autoBountyRuntime.Panic = false
		return false
	end
	local maxHealth = flag56.MaxHealth
	local health = flag56.Health
	local n46 = math.min(lowHealth.Min or 0, maxHealth * 0.25)
	local n47 = math.min(lowHealth.Max or 0, maxHealth * 0.9)

	if autoBountyRuntime.Panic then
		if health >= n47 then
			autoBountyRuntime.Panic = false
			local floor = math.floor
			func38("Success", "panic off", math.floor(health), "/", floor(n47))
			return false
		end
	else
		if not (health < n46) then
			return false
		end
		autoBountyRuntime.Panic = true
		local floor = math.floor
		func38("Warning", "panic on", math.floor(health), "/", floor(n46))
	end

	autoBounty.StopTween()
	autoBounty.PrepareCharacter()
	local target = autoBountyRuntime.Target
	local value62, position = autoBounty.GetAliveParts(target and target.Character)
	position = position and position.Position or value61.Position
	value61.CFrame = CFrame.new(position.X, position.Y + n35, position.Z)
	return true
end

autoBounty.BigHitbox = function()
	if not autoBountyConfig.Settings.BigHitbox then
		return false
	end
	local nextHitboxClock = autoBountyRuntime.NextHitboxClock
	if os.clock() - nextHitboxClock < 2 then
		return false
	end
	autoBountyRuntime.NextHitboxClock = os.clock()
	return autoBounty.PatchMeleeData()
end

autoBounty.RequireModule = function(instance5)
	if not instance5 or not instance5:IsA("ModuleScript") then
		return nil
	end
	local ok, result = pcall(require, instance5)
	return ok and result or nil
end

autoBounty.PatchMeleeData = function()
	if autoBountyRuntime.MeleePatched then
		return true
	end
	local value63 = autoBounty.RequireModule(modules and modules:FindFirstChild("WeaponData"))
	if type(value63) ~= "table" then
		return false
	end
	local n46 = 0

	for _, value64 in pairs(value63) do
		if type(value64) == "table" and tbl20[value64.WeaponType] then
			pcall(function()
				value64.HitboxMagnitude = 45
				value64.ValidateFrontHits = false
			end)

			n46 += 1
		end
	end

	if n46 == 0 then
		return false
	end
	local value65 = autoBounty.RequireModule(modules and modules:FindFirstChild("CombatUtil"))

	if type(value65) == "table" and type(value65.CanCharacterMeleeAoe) == "function" then
		pcall(function()
			value65.CanCharacterMeleeAoe = function()
				return 100
			end
		end)
	end

	autoBountyRuntime.MeleePatched = true
	func40("melee patched", n46)
	return true
end

autoBounty.ReplaceMethod = function(tbl33, param61, callback1)
	if type(tbl33) ~= "table" or type(tbl33[param61]) ~= "function" then
		return false
	end
	local entry21 = tbl33[param61]

	return pcall(function()
		tbl33[param61] = callback1(entry21)
	end)
end

autoBounty.PatchCooldown = function()
	if autoBountyRuntime.CooldownPatched then
		return true
	end
	local value66 = autoBounty.RequireModule(modules and modules:FindFirstChild("CombatUtil"))
	if type(value66) ~= "table" then
		return false
	end

	autoBounty.ReplaceMethod(value66, "CanAttack", function(callback2)
		return function(param62, flag57, param63)
			if flag57 == character then
				return true
			end
			return callback2(param62, flag57, param63)
		end
	end)

	autoBounty.ReplaceMethod(value66, "GetComboPaddingTime", function()
		return function()
			return 0
		end
	end)

	autoBounty.ReplaceMethod(value66, "GetAttackCancelMultiplier", function()
		return function()
			return 0.01
		end
	end)

	autoBountyRuntime.CooldownPatched = true
	func40("cooldown patched")
	return true
end

autoBounty.ReleaseAttackLock = function()
	local getupvalues_ = getupvalues or debug and debug.getupvalues
	local setupvalue_ = setupvalue or debug and debug.setupvalue
	if type(getupvalues_) ~= "function" or type(setupvalue_) ~= "function" then
		return false
	end
	local flag58 = autoBounty.GetAttackMelee()
	if not flag58 then
		return false
	end
	local ok, result = pcall(getupvalues_, flag58)
	if not ok or type(result) ~= "table" then
		return false
	end
	-- deobfuscated by 𝚂𝚘𝚞𝚛𝚌𝚎 𝙻𝚎𝚊𝚔 (𝚂𝙻) -> https://discord.gg/x7YbZeezpm

	for k, value67 in pairs(result) do
		if value67 == true then
			pcall(setupvalue_, flag58, k, false)
		elseif value67 == n13 then
			pcall(setupvalue_, flag58, k, 0.01)
		end
	end

	return true
end

autoBounty.TapCooldown = function()
	local global = autoBountyRuntime.Global

	if not global then
		global = autoBounty.RequireModule(replicatedStorage:FindFirstChild("Global"))
		if type(global) ~= "table" then
			return false
		end
		autoBountyRuntime.Global = global
	end

	return pcall(function()
		global.tapCooldown = 0
	end)
end

autoBounty.NoCooldown = function()
	if not autoBountyConfig.Settings.NoCooldown then
		return false
	end
	autoBounty.PatchCooldown()
	autoBounty.TapCooldown()
	autoBounty.ReleaseAttackLock()
	return true
end

autoBounty.GetAttackMelee = function()
	if autoBountyRuntime.AttackMelee then
		return autoBountyRuntime.AttackMelee
	end
	local controller = autoBountyRuntime.Controller

	if not controller then
		controller = autoBounty.RequireModule(replicatedStorage:FindFirstChild("CombatController", true))
		if type(controller) ~= "table" or type(controller.Attack) ~= "function" then
			return nil
		end
		autoBountyRuntime.Controller = controller
	end

	if type(getfenv) ~= "function" then
		return nil
	end

	local ok, attackMelee = pcall(function()
		return getfenv(controller.Attack).attackMelee
	end)

	if ok and type(attackMelee) == "function" then
		autoBountyRuntime.AttackMelee = attackMelee
		func40("attackMelee resolved")
		return attackMelee
	end

	return nil
end

autoBounty.Swing = function()
	local value68 = character
	local tool

	if character then
		tool = character:FindFirstChildOfClass("Tool")
	else
		tool = value68
	end

	if not tool then
		return false
	end
	local flag59 = autoBounty.GetAttackMelee()
	if flag59 and pcall(flag59, tool) then
		autoBountyRuntime.Hits = autoBountyRuntime.Hits + 1
		return true
	end
	local controller = autoBountyRuntime.Controller
	if not controller then
		return false
	end

	local ok = pcall(function()
		controller:Attack(tool, { UserInputType = Enum.UserInputType.MouseButton1 })
	end)

	if ok then
		autoBountyRuntime.Hits = autoBountyRuntime.Hits + 1
	end

	return ok
end

autoBounty.AttackM1 = function(obj)
	local tool = character and character:FindFirstChildOfClass("Tool")
	local leftClickRemote = tool and tool:FindFirstChild("LeftClickRemote")
	if not leftClickRemote or not leftClickRemote:IsA("RemoteEvent") then
		return false
	end
	local position = obj and obj.Position or Vector3.new(0, -500, 0)

	task.spawn(function()
		leftClickRemote:FireServer(position, math.random(1, 4), true)
		task.wait(0.01)
		leftClickRemote:FireServer(false)
	end)

	return true
end

autoBounty.WantDive = function()
	local now = os.clock()
	if now < autoBountyRuntime.DiveUntil then
		return true
	end

	if autoBountyRuntime.NextDive <= now then
		autoBountyRuntime.DiveUntil = now + 0.45
		autoBountyRuntime.NextDive = now + 0.45 + 0.6
		return true
	end

	return false
end

autoBounty.GetCombatCFrame = function(obj)
	local assemblyLinearVelocity = obj.AssemblyLinearVelocity or obj.Velocity
	local vector3 = Vector3.new(assemblyLinearVelocity.X, 0, assemblyLinearVelocity.Z)
	local magnitude = vector3.Magnitude
	local vector4 = Vector3.zero

	if 8 <= magnitude then
		vector4 = vector3.Unit * math.clamp(magnitude * n27, 8, 45)
	end

	local n46 = os.clock() * 3.5
	local diveUntil = autoBountyRuntime.DiveUntil
	local startTime = os.clock() < diveUntil
	local n47 = startTime and 3 or 14
	startTime = startTime and 6 or 10
	local n48 = obj.Position + vector4 + Vector3.new(math.cos(n46) * startTime, n47, math.sin(n46) * startTime)
	local n49 = n48 - obj.Position

	if n49.Magnitude > 55 then
		n48 = obj.Position + n49.Unit * 55
	end

	return CFrame.new(n48, obj.Position)
end

autoBounty.Glide = function(param64)
	local flag60, num16 = autoBounty.GetAliveParts(character)
	if not flag60 then
		return false
	end
	local num17 = autoBounty.ToCFrame(param64)
	if not num17 then
		return false
	end
	autoBounty.StopTween()
	autoBounty.PrepareCharacter()
	local now = os.clock()
	local n46 = math.clamp(now - autoBountyRuntime.LastGlide, 0, 0.1)
	autoBountyRuntime.LastGlide = now
	local n47 = num17.Position - num16.Position
	local magnitude = n47.Magnitude
	local n48 = 320 * n46

	if magnitude <= n48 or magnitude <= 0 then
		num16.CFrame = num17
	else
		num16.CFrame = CFrame.new(num16.Position + n47.Unit * n48) * (num17 - num17.Position)
	end

	return true
end

autoBounty.GetInterceptCFrame = function(obj)
	local assemblyLinearVelocity = obj.AssemblyLinearVelocity or obj.Velocity
	local vector3 = Vector3.new(assemblyLinearVelocity.X, 0, assemblyLinearVelocity.Z)
	local magnitude = vector3.Magnitude
	if magnitude < 8 then
		return obj.CFrame * cframe2
	end
	local position = obj.Position
	return CFrame.new(obj.Position + vector3.Unit * math.clamp(magnitude * n27, 8, 45) + Vector3.new(0, cframe2.Y, 0), position)
end

autoBounty.Engage = function(param65, part3, humanoid3)
	local value69, num18 = autoBounty.GetAliveParts(character)
	if not num18 then
		return false
	end
	-- join us: https://discord.gg/x7YbZeezpm

	if 200 <= (part3.Position - num18.Position).Magnitude then
		autoBounty.Travel(part3.CFrame * cframe)
		return true
	end
	local flag61, value70, value71, flag62 = autoBounty.GetReadyWeapon()

	if not flag61 then
		if humanoid3 and humanoid3.Health < 4500 then
			autoBounty.Glide(part3.CFrame * cframe3)
			return true
		end
		local flag63 = autoBounty.WantDive()
		autoBounty.Glide(autoBounty.GetCombatCFrame(part3))
		autoBounty.EquipWeapon("Melee")

		if flag63 and not autoBounty.Swing() then
			autoBounty.AttackM1(part3)
		end

		return true
	end

	autoBounty.TurnRace()
	if not autoBounty.EquipWeapon(flag61) then
		func43("equip failed", flag61)
		return false
	end

	if not flag62 then
		func43("equipped", flag61)
		return true
	end
	local value72 = autoBounty.WantDive()
	autoBounty.Glide(autoBounty.GetCombatCFrame(part3))

	if value72 then
		autoBounty.SendKey(value70, value71)
	end

	return true
end

autoBounty.TrackFight = function(lastTargetHealth, flag64)
	local health = autoBounty.GetAliveParts(character)
	lastTargetHealth = lastTargetHealth and lastTargetHealth.Health or 0
	health = health and health.Health or 0
	flag64 = flag64 and (lastTargetHealth < autoBountyRuntime.LastTargetHealth or health < autoBountyRuntime.LastOwnHealth)
	autoBountyRuntime.LastTargetHealth = lastTargetHealth
	autoBountyRuntime.LastOwnHealth = health
	return flag64 or autoBounty.IsFighting()
end

autoBounty.HandleTargetLoss = function(flag65, part4, param66)
	local humanoidRootPart2 = character and character:FindFirstChild("HumanoidRootPart")
	if not humanoidRootPart2 or not flag65 then
		return false
	end
	local num19 = (part4.Position - humanoidRootPart2.Position).Magnitude <= 100

	if autoBounty.TrackFight(param66, num19) then
		autoBountyRuntime.TargetClock = os.clock()
	end

	if num19 then
		if autoBounty.IsHudVisible("SafeZone") then
			autoBounty.BlacklistTarget(flag65, "safezone hud")
			autoBounty.StopTween()
			return true
		end

		local safe = autoBounty.CheckNotify("safe") or autoBounty.CheckNotify("player")

		if safe then
			safe:Destroy()
			autoBounty.BlacklistTarget(flag65, "escaped")
			autoBounty.StopTween()
			return true
		end
	end

	local targetClock = autoBountyRuntime.TargetClock

	if 30 <= os.clock() - targetClock then
		autoBounty.BlacklistTarget(flag65, "timeout, banned", math.huge)
		autoBounty.StopTween()
		return true
	end

	return false
end

autoBounty.SendWebhook = function(obj)
	local webhook = autoBountyConfig.Webhook
	if not webhook or not webhook.Enabled or not webhook.Url or webhook.Url == "" then
		return false
	end
	local value73 = http_request or request
	local request_

	if value73 then
		request_ = value73
	else
		request_ = syn and syn.request
	end

	if type(request_) ~= "function" then
		return false
	end
	local tbl34 = {}
	local embeds = {}
	local tbl35 = { title = "Auto Bounty" }
	local format = string.format
	obj = obj and obj.Name or "?"
	local func44 = tostring
	local startBounty = autoBountyRuntime.StartBounty
	tbl35.description = format("Target: **%s**\nKills: **%d**\nBounty: **%s**\nEarned: **%s**", obj, autoBountyRuntime.Kills, tostring(autoBounty.GetBounty()), func44(autoBounty.GetBounty() - startBounty))
	tbl35.color = 2895667
	embeds[1] = tbl35
	tbl34.embeds = embeds

	task.spawn(function()
		pcall(request_, {
			Url = webhook.Url,
			Method = "POST",
			Headers = { ["Content-Type"] = "application/json" },
			Body = httpService:JSONEncode(tbl34),
		})
	end)

	return true
end

autoBounty.FlyUp = function(num20)
	local value74, flag66 = autoBounty.GetAliveParts(character)
	if not flag66 then
		return false
	end

	if value74.Sit then
		value74.Sit = false
	end

	if num20 - n7 <= flag66.Position.Y then
		return true
	end
	return autoBounty.Tweento(CFrame.new(flag66.Position.X, num20, flag66.Position.Z), 400)
end

autoBounty.HopServer = function()
	local nextHopClock = autoBountyRuntime.NextHopClock
	if os.clock() - nextHopClock < (autoBountyConfig.Server.HopCooldown or 15) then
		return false
	end

	if autoBounty.InCombat() then
		local nextCombatLog = autoBountyRuntime.NextCombatLog

		if os.clock() - nextCombatLog >= 3 then
			autoBountyRuntime.NextCombatLog = os.clock()
			func38("Waiting", "hop blocked, in combat")
		end

		return false
	end

	autoBountyRuntime.NextHopClock = os.clock()
	autoBountyRuntime.Hopping = true
	autoBounty.StopTween()
	autoBounty.NoStun()
	autoBounty.UpdateCamera(nil)
	autoBounty.Notify("Auto Bounty", "Hop server")
	local value75, flag67 = autoBounty.GetAliveParts(character)
	local n46 = (flag67 and flag67.Position.Y or 0) + math.random(700, 1200)

	task.spawn(function()
		local n47 = os.clock() + 30

		while autoBountyRuntime.Hopping and os.clock() < n47 do
			autoBounty.FlyUp(n46)
			task.wait()
		end

		autoBountyRuntime.Hopping = false
	end)

	task.spawn(function()
		autoBounty.FlyUp(n46)
		task.wait(0.5)
		--[=[ SL | SOURCE LEAK ]=] -- discord.gg/x7YbZeezpm

		if autoBounty.InCombat() then
			func38("Waiting", "hop aborted, in combat")
			autoBountyRuntime.Hopping = false
			return
		end

		local flag68 = false

		pcall(function()
			local serverBrowser = replicatedStorage:WaitForChild("__ServerBrowser")

			for i = 1, 100 do
				local response = serverBrowser:InvokeServer(i)

				if type(response) == "table" then
					for k, value76 in next, response, nil do
						if k ~= jobId and type(value76) == "table" and value76.Count and value76.Count <= 12 then
							func38("Travel", "teleport to", k, value76.Count, "height", n46)
							flag68 = true
							serverBrowser:InvokeServer("teleport", k)
						end
					end

					continue
				end

				break
			end
		end)

		if not flag68 then
			func38("Warning", "hop failed, no server found")
			autoBountyRuntime.Hopping = false
		end
	end)

	return true
end

autoBounty.HandleNoTarget = function()
	if autoBountyRuntime.NoTargetClock == 0 then
		local value77, flag69 = autoBounty.GetAliveParts(character)
		autoBountyRuntime.NoTargetClock = os.clock()
		autoBountyRuntime.IdleGoalY = flag69 and flag69.Position.Y + 900 or 0
		func38("Waiting", "no target, rising to", math.floor(autoBountyRuntime.IdleGoalY))
		return false
	end

	autoBounty.UpdateCamera(nil)
	autoBounty.FlyUp(autoBountyRuntime.IdleGoalY)
	local noTargetClock = autoBountyRuntime.NoTargetClock
	local n46 = os.clock() - noTargetClock
	local rejects = autoBountyRuntime.Rejects
	if (rejects.dead or 0) + (rejects.blacklist or 0) > 0 and n46 < 12 then
		return false
	end
	local flag70 = autoBounty.ClearBlacklist()

	if flag70 > 0 then
		autoBountyRuntime.NoTargetClock = os.clock()
		func40("blacklist cleared", flag70, "retry")
		return false
	end

	if n46 >= (autoBountyConfig.Server.HopDelay or 5) then
		autoBountyRuntime.NoTargetClock = 0
		autoBounty.HopServer()
		return true
	end

	return false
end

autoBounty.Aimbot = function()
	if autoBountyRuntime.Hooked then
		return false
	end

	if type(hookmetamethod) ~= "function" or type(getnamecallmethod) ~= "function" or type(newcclosure) ~= "function" then
		func38("Warning", "aim hook unsupported, missing executor functions")
		return false
	end
	local value78 = nil

	local function func45(param67, ...)
		local packed4 = table.pack(...)

		if getnamecallmethod() == "FireServer" and typeof(param67) == "Instance" then
			local name = param67.Name
			if name == str4 and autoBountyConfig.Settings.NoCooldown then
				return value78(param67, 0)
			end

			if tbl24[name] then
				local target = autoBountyRuntime.Target
				target = target and target.Character

				if target then
					target = target:FindFirstChild("HumanoidRootPart") or target:FindFirstChild("HumanoidRootPart")
				end

				if target then
					local packed5 = table.pack(...)

					if typeof(packed5[1]) == "Vector3" then
						packed5[1] = target.Position
						autoBountyRuntime.AimHits = autoBountyRuntime.AimHits + 1
						return value78(param67, table.unpack(packed5, 1, packed5.n))
					end

					return value78(param67, table.unpack(packed4, 1, packed4.n))
				end
			end
		end

		local packed6 = table.pack(...)
		return value78(param67, table.unpack(packed6, 1, packed6.n))
	end

	value78 = hookmetamethod
	value78 = value78(game, "__namecall", newcclosure(func45))
	autoBountyRuntime.Hooked = true
	return true
end

autoBounty.CreateESP = function()
	if autoBountyRuntime.ESP then
		return true
	end

	if not Drawing or type(Drawing.new) ~= "function" then
		func38("Warning", "esp unavailable, no Drawing api")
		return false
	end
	local line = Drawing.new("Line")
	line.Thickness = 1.5
	line.Color = color2
	line.Transparency = 1
	line.Visible = false
	local square = Drawing.new("Square")
	square.Thickness = 1.5
	square.Color = color2
	square.Filled = false
	square.Transparency = 1
	square.Visible = false
	local text = Drawing.new("Text")
	text.Size = 14
	text.Color = color2
	text.Center = true
	text.Outline = true
	text.Visible = false
	autoBountyRuntime.ESP = { Line = line, Box = square, Label = text }
	return true
end

autoBounty.HideESP = function()
	local esp = autoBountyRuntime.ESP
	if not esp then
		return false
	end
	esp.Line.Visible = false
	esp.Box.Visible = false
	esp.Label.Visible = false
	return false
end

autoBounty.UpdateESP = function()
	local esp = autoBountyRuntime.ESP
	if not esp then
		return false
	end

	if not autoBountyConfig.Settings.ESPTarget then
		return autoBounty.HideESP()
	end
	local target = autoBountyRuntime.Target
	local flag71, value79 = autoBounty.GetAliveParts(target and target.Character)
	if not flag71 then
		return autoBounty.HideESP()
	end
	local value80, flag72 = currentCamera:WorldToViewportPoint(value79.Position + vector)
	local num21 = currentCamera:WorldToViewportPoint(value79.Position - vector2)
	if not flag72 then
		return autoBounty.HideESP()
	end
	local n46 = math.abs(value80.Y - num21.Y)
	local n47 = n46 * 0.55
	local viewportSize = currentCamera.ViewportSize
	esp.Box.Size = Vector2.new(n47, n46)
	esp.Box.Position = Vector2.new(value80.X - n47 * 0.5, value80.Y)
	esp.Box.Visible = true
	esp.Line.From = Vector2.new(viewportSize.X * 0.5, viewportSize.Y)
	esp.Line.To = Vector2.new(value80.X, num21.Y)
	esp.Line.Visible = true
	local value81, num22 = autoBounty.GetAliveParts(character)
	esp.Label.Text = string.format("%s | %d studs | %d hp", target.Name, num22 and (value79.Position - num22.Position).Magnitude or 0, flag71.Health)
	esp.Label.Position = Vector2.new(value80.X, value80.Y - 14 - 2)
	esp.Label.Visible = true
	return true
end

autoBounty.StartESP = function()
	if autoBountyRuntime.ESPConnection then
		return false
	end

	if not autoBounty.CreateESP() then
		return false
	end

	autoBountyRuntime.ESPConnection = runService.RenderStepped:Connect(function()
		pcall(autoBounty.UpdateESP)
	end)

	func40("esp started")
	return true
end

autoBounty.AntiAfk = function()
	if autoBountyRuntime.AntiAfk then
		return false
	end

	autoBountyRuntime.AntiAfk = localPlayer.Idled:Connect(function()
		pcall(function()
			local virtualUser = obj.VirtualUser
			virtualUser:CaptureController()
			virtualUser:ClickButton2(Vector2.new())
		end)
	end)

	return true
end

autoBounty.ShouldStop = function()
	local stopAtBounty = autoBountyConfig.Server.StopAtBounty
	if type(stopAtBounty) == "number" and stopAtBounty > 0 and autoBounty.GetBounty() >= stopAtBounty then
		autoBounty.Notify("Auto Bounty", "Reached " .. tostring(autoBounty.GetBounty()))
		return true
	end
	return false
end

autoBounty.UpdateProgress = function()
	local stopAtBounty = autoBountyConfig.Server.StopAtBounty
	if type(stopAtBounty) ~= "number" or stopAtBounty <= 0 then
		return false
	end
	return value19.Progress(autoBounty.GetBounty() / stopAtBounty)
end

autoBounty.Heartbeat = function(...)
	local nextHeartbeat = autoBountyRuntime.NextHeartbeat
	if os.clock() - nextHeartbeat < 3 then
		return false
	end
	autoBountyRuntime.NextHeartbeat = os.clock()
	autoBounty.UpdateProgress()
	func39(...)
	return true
end

autoBounty.Step = function()
	if autoBountyRuntime.Bypassing or autoBountyRuntime.Hopping then
		return
	end

	if autoBounty.ShouldStop() then
		autoBounty.Stop()
		return
	end

	if not autoBounty.GetAliveParts(character) then
		autoBounty.StopTween()
		autoBountyRuntime.Target = nil
		return
	end

	autoBounty.NoStun()
	autoBounty.BigHitbox()
	autoBounty.NoCooldown()
	autoBounty.EnablePvp()
	autoBounty.EnableBuso()
	autoBounty.ActiveKen()
	if autoBounty.HandlePanic() then
		autoBounty.Heartbeat("panic")
		return
	end
	local flag73, value82, value83 = autoBounty.GetTarget()

	if not flag73 then
		local formatRejects = autoBounty.FormatRejects
		autoBounty.Heartbeat("no target, players:", #players:GetPlayers(), "rejects:", formatRejects())
		autoBounty.UpdateCamera(nil)
		autoBounty.HandleNoTarget()
		autoBounty.HopServer()
		return
	end

	local aimHits = autoBountyRuntime.AimHits
	autoBounty.Heartbeat(flag73.Name, "lv" .. autoBounty.GetLevel(flag73), math.floor((value82.Position - character.HumanoidRootPart.Position).Magnitude) .. " studs", math.floor(value83.Health) .. " hp", "aimhits", aimHits)
	autoBountyRuntime.NoTargetClock = 0
	autoBounty.UpdateCamera(flag73.Character)
	if autoBounty.HandleTargetLoss(flag73, value82, value83) then
		return
	end
	autoBounty.Engage(flag73, value82, value83)
end

autoBounty.WatchEffects = function()
	if autoBountyRuntime.EffectConnection or not worldOrigin then
		return false
	end

	local function func46(descendant)
		if not tbl27[descendant.ClassName] then
			return
		end

		task.defer(function()
			pcall(function()
				descendant:Destroy()
			end)
		end)
	end

	for _, descendant in ipairs(worldOrigin:GetDescendants()) do
		func46(descendant)
	end

	autoBountyRuntime.EffectConnection = worldOrigin.DescendantAdded:Connect(func46)
	func40("effect watcher on", worldOrigin:GetFullName())
	return true
end

autoBounty.FixLag = function()
	pcall(function()
		for _, descendant in pairs(lighting:GetDescendants()) do
			if descendant:IsA("Atmosphere") then
				descendant:Destroy()
			end
		end

		local terrain = workspace:FindFirstChildOfClass("Terrain")

		if terrain then
			terrain.WaterWaveSize = 0
			terrain.WaterWaveSpeed = 0
			terrain.WaterReflectance = 0
			terrain.WaterTransparency = 1
		end

		lighting.GlobalShadows = false
		lighting.FogStart = 9e9
		lighting.FogEnd = 9e9

		for _, descendant in ipairs(lighting:GetDescendants()) do
			if descendant:IsA("PostEffect") then
				descendant.Enabled = false
			end
		end

		if sethiddenproperty then
			sethiddenproperty(Settings, "GraphicsQualityLevel", 1)
		end
	end)

	local function func47(instance6)
		if instance6:IsA("BasePart") then
			instance6.CastShadow = false
			instance6.Material = Enum.Material.Plastic
			instance6.Reflectance = 0
		elseif instance6:IsA("Decal") then
			instance6.Texture = ""
			instance6.Transparency = 1
		elseif instance6:IsA("ParticleEmitter") then
			instance6.Lifetime = NumberRange.new(0)
		elseif instance6:IsA("Trail") then
			instance6.Lifetime = 0
		elseif instance6:IsA("ForceField") or instance6:IsA("Sparkles") or instance6:IsA("Smoke") or instance6:IsA("Fire") or instance6:IsA("Beam") then
			task.defer(function()
				pcall(function()
					instance6:Destroy()
				end)
			end)
		end
	end

	for i, descendant in ipairs(workspace:GetDescendants()) do
		pcall(func47, descendant)

		if i % 5000 == 0 then
			task.wait()
		end
	end

	autoBounty.WatchEffects()
end

autoBounty.LockCamera = function()
	if not autoBountyConfig.Settings.CameraLock then
		return false
	end
	local target = autoBountyRuntime.Target
	local flag74, value84 = autoBounty.GetAliveParts(target and target.Character)
	if not flag74 then
		return false
	end
	currentCamera.CFrame = CFrame.new(currentCamera.CFrame.Position, value84.Position)
	return true
end

autoBounty.StartCameraLock = function()
	if autoBountyRuntime.CameraConnection then
		return false
	end

	autoBountyRuntime.CameraConnection = runService.RenderStepped:Connect(function()
		pcall(autoBounty.LockCamera)
	end)

	func40("camera lock started")
	return true
end

autoBounty.Stop = function()
	autoBountyConfig.Enabled = false
	autoBountyRuntime.Active = false
	autoBountyRuntime.Target = nil
	autoBounty.StopTween()
	autoBounty.UpdateCamera(nil)
	autoBounty.HideESP()
	func38("Success", "stopped, kills", autoBountyRuntime.Kills, "bounty", autoBounty.GetBounty())
	value19.Complete()
end

autoBounty.Start = function()
	if autoBountyRuntime.Active then
		return false
	end
	autoBountyConfig.Enabled = true
	autoBountyRuntime.Active = true
	autoBountyRuntime.StartBounty = autoBounty.GetBounty()
	autoBountyRuntime.NoTargetClock = 0
	autoBountyRuntime.NextHopClock = os.clock()
	value19.Reset()
	autoBounty.UpdateProgress()

	if typeof(autoBountyConfig.Status.AccentColor) == "Color3" then
		value19.Theme(autoBountyConfig.Status.AccentColor)
	end

	autoBounty.AntiAfk()
	autoBounty.WatchNotifications()
	autoBounty.StartESP()
	autoBounty.FixLag()
	autoBounty.StartCameraLock()

	if autoBountyConfig.Settings.Aimbot then
		func40("aim hook", autoBounty.Aimbot())
	else
		func40("aim hook off, config says", tostring(autoBountyConfig.Settings.Aimbot))
	end

	autoBountyRuntime.Job = task.spawn(function()
		autoBounty.SetTeam()
		func38("Success", "stage 4 - loop running")
		autoBounty.Notify("Auto Bounty", "Started as " .. tostring(autoBountyConfig.Team))

		while autoBountyRuntime.Active and autoBountyConfig.Enabled do
			local ok, result = pcall(autoBounty.Step)

			if not ok then
				func38("Error", "step failed:", result)
			end

			task.wait()
		end

		autoBountyRuntime.Active = false
		func40("loop stopped")
	end)

	func40("stage 3 - start done")
	return true
end

genv2.AutoBounty = autoBounty
autoBounty.Start()

-- join us: https://discord.gg/x7YbZeezpm