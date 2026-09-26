--[[
    KEN HUB || BLOX FRUITS
    Independent UI rebuild
    Black / White theme + K logo
    Discord: discord.gg/DSpzwrbhs2

    This is an original implementation. It does not load the original
    Speed Hub X library or reproduce its protected/anti-detection code.

    Supported:
      * Full draggable/minimizable UI
      * Home / Main / Automatically / Sea Event / Teleport / Shop / Misc / Settings
      * Local player information
      * Safe movement/teleport helpers to common island coordinates
      * WalkSpeed / JumpPower controls
      * ESP-style local highlighting for nearby player characters
      * Server hop / rejoin helpers
      * UI configuration persistence when the executor provides file APIs
      * Keybind: RightShift
]]

repeat task.wait() until game:IsLoaded()

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")

local LocalPlayer = Players.LocalPlayer
if not LocalPlayer then return end

local GUI_NAME = "KenHub_BloxFruits"
local CONFIG_FILE = "KenHub/BloxFruits.json"

local Theme = {
    Background = Color3.fromRGB(8, 8, 8),
    Panel = Color3.fromRGB(15, 15, 15),
    Panel2 = Color3.fromRGB(22, 22, 22),
    Stroke = Color3.fromRGB(55, 55, 55),
    White = Color3.fromRGB(245, 245, 245),
    Muted = Color3.fromRGB(160, 160, 160),
    Black = Color3.fromRGB(0, 0, 0),
}

local State = {
    Open = true,
    WalkSpeed = 16,
    JumpPower = 50,
    ESP = false,
    Fullbright = false,
    AntiAFK = false,
    AutoReconnect = false,
}

local old = LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild(GUI_NAME)
if old then old:Destroy() end

local function safeFileCall(name, ...)
    local f = getgenv and getgenv()[name] or _G[name]
    if type(f) == "function" then
        return pcall(f, ...)
    end
    return false
end

local function saveConfig()
    local data = HttpService:JSONEncode(State)
    if isfolder and makefolder and writefile then
        pcall(function()
            if not isfolder("KenHub") then makefolder("KenHub") end
            writefile(CONFIG_FILE, data)
        end)
    end
end

local function loadConfig()
    if isfile and readfile then
        pcall(function()
            if isfile(CONFIG_FILE) then
                local ok, data = pcall(function()
                    return HttpService:JSONDecode(readfile(CONFIG_FILE))
                end)
                if ok and type(data) == "table" then
                    for k, v in pairs(data) do
                        if State[k] ~= nil then State[k] = v end
                    end
                end
            end
        end)
    end
end
loadConfig()

local function getCharacter()
    return LocalPlayer.Character
end

local function getRoot()
    local c = getCharacter()
    return c and c:FindFirstChild("HumanoidRootPart")
end

local function getHumanoid()
    local c = getCharacter()
    return c and c:FindFirstChildOfClass("Humanoid")
end

local function notify(title, message)
    pcall(function()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = title,
            Text = message,
            Duration = 4
        })
    end)
end

-- Common Blox Fruits destinations. These are navigation helpers only.
local Locations = {
    ["Middle Town"] = CFrame.new(-655, 7, 1436),
    ["Jungle"] = CFrame.new(-1612, 37, 149),
    ["Pirate Starter"] = CFrame.new(-1057, 15, 1547),
    ["Marine Starter"] = CFrame.new(-2566, 7, 2045),
    ["Frozen Village"] = CFrame.new(1142, 8, -1164),
    ["Colosseum"] = CFrame.new(-1427, 7, -2792),
    ["Prison"] = CFrame.new(487, 5, 733),
    ["Magma Village"] = CFrame.new(-5231, 9, 846),
    ["Dressrosa"] = CFrame.new(-386, 73, 297),
    ["Cafe"] = CFrame.new(-385, 73, 300),
    ["Green Zone"] = CFrame.new(-2448, 73, -3219),
    ["Kingdom of Rose"] = CFrame.new(-429, 73, 1836),
    ["Hot and Cold"] = CFrame.new(-6027, 15, -5070),
    ["Forgotten Island"] = CFrame.new(-3054, 236, -10160),
    ["Snow Mountain"] = CFrame.new(561, 401, -5297),
    ["Port Town"] = CFrame.new(-290, 44, 5456),
    ["Castle on Sea"] = CFrame.new(-5075, 315, -3150),
    ["Hydra Island"] = CFrame.new(5742, 611, -254),
    ["Great Tree"] = CFrame.new(2276, 108, -7001),
    ["Floating Turtle"] = CFrame.new(-12465, 375, -7566),
    ["Haunted Castle"] = CFrame.new(-9515, 142, 5535),
    ["Sea Castle"] = CFrame.new(-5478, 313, -2830),
    ["Tiki Outpost"] = CFrame.new(-16270, 12, 438),
}

local function teleportTo(cf)
    local root = getRoot()
    if not root then
        notify("Ken Hub", "Character not ready.")
        return
    end
    root.CFrame = cf
end

local function applyMovement()
    local hum = getHumanoid()
    if hum then
        hum.WalkSpeed = tonumber(State.WalkSpeed) or 16
        hum.UseJumpPower = true
        hum.JumpPower = tonumber(State.JumpPower) or 50
    end
end

local espFolder = Instance.new("Folder")
espFolder.Name = "KenHubESP"
espFolder.Parent = game:GetService("CoreGui")

local function clearESP()
    for _, v in ipairs(espFolder:GetChildren()) do v:Destroy() end
end

local function updateESP()
    clearESP()
    if not State.ESP then return end

    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character then
            local h = Instance.new("Highlight")
            h.Name = "Player_" .. p.Name
            h.FillColor = Color3.fromRGB(255, 255, 255)
            h.FillTransparency = 0.75
            h.OutlineColor = Color3.fromRGB(255, 255, 255)
            h.OutlineTransparency = 0
            h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            h.Adornee = p.Character
            h.Parent = espFolder
        end
    end
end

local function setFullbright(enabled)
    State.Fullbright = enabled
    if enabled then
        Lighting.Brightness = 2
        Lighting.ClockTime = 14
        Lighting.FogEnd = 100000
        Lighting.GlobalShadows = false
    else
        Lighting.GlobalShadows = true
    end
end

local function serverHop()
    local ok, data = pcall(function()
        return game:HttpGet(
            "https://games.roblox.com/v1/games/" ..
            tostring(game.PlaceId) ..
            "/servers/Public?sortOrder=Asc&limit=100"
        )
    end)
    if not ok then
        notify("Ken Hub", "Server list request failed.")
        return
    end

    local decoded = HttpService:JSONDecode(data)
    local candidates = {}
    for _, server in ipairs(decoded.data or {}) do
        if server.id ~= game.JobId and server.playing < server.maxPlayers then
            table.insert(candidates, server.id)
        end
    end

    if #candidates == 0 then
        notify("Ken Hub", "No available server found.")
        return
    end

    TeleportService:TeleportToPlaceInstance(game.PlaceId, candidates[math.random(1, #candidates)], LocalPlayer)
end

local function rejoin()
    TeleportService:Teleport(game.PlaceId, LocalPlayer)
end


-- Automation layer
-- These routines are independent implementations. They use ordinary
-- character/NPC interactions rather than the old hub's protected modules.

State.AutoFarmLevel = false
State.AutoFarmNearest = false
State.AutoFarmMastery = false
State.AutoCollectChest = false
State.AutoCollectBerry = false
State.AutoFarmMaterial = false
State.AutoFarmBones = false
State.AutoAttackBoss = false
State.AutoAttackAllBoss = false
State.AutoEliteHunter = false
State.AutoCakePrince = false
State.AutoDoughKing = false
State.AutoFindFruit = false
State.AutoCollectFruit = false
State.AutoSea = false
State.AutoRaid = false
State.SelectedBoss = "Any Boss"

local function isAlive(model)
    local hum = model and model:FindFirstChildOfClass("Humanoid")
    local root = model and model:FindFirstChild("HumanoidRootPart")
    return hum and root and hum.Health > 0
end

local function nearestEnemy(filter)
    local root = getRoot()
    if not root then return nil end

    local best, bestDistance
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("Model") and obj ~= LocalPlayer.Character and isAlive(obj) then
            local hum = obj:FindFirstChildOfClass("Humanoid")
            local name = obj.Name
            local display = hum.DisplayName
            local ok = true

            if filter then
                ok = filter(obj, name, display)
            end

            if ok then
                local d = (obj.HumanoidRootPart.Position - root.Position).Magnitude
                if not bestDistance or d < bestDistance then
                    best = obj
                    bestDistance = d
                end
            end
        end
    end
    return best
end

local function nearestPlayer()
    local root = getRoot()
    if not root then return nil end
    local best, distance
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character and isAlive(p.Character) then
            local d = (p.Character.HumanoidRootPart.Position - root.Position).Magnitude
            if not distance or d < distance then
                best, distance = p.Character, d
            end
        end
    end
    return best
end

local function equipCombatTool()
    local character = getCharacter()
    if not character then return nil end

    local hum = getHumanoid()
    if not hum then return nil end

    for _, tool in ipairs(LocalPlayer.Backpack:GetChildren()) do
        if tool:IsA("Tool") then
            local tip = tool.ToolTip
            if tip == "Melee" or tip == "Blox Fruit" or tip == "Sword" or tip == "Gun" then
                pcall(function() hum:EquipTool(tool) end)
                return tool
            end
        end
    end

    for _, tool in ipairs(character:GetChildren()) do
        if tool:IsA("Tool") then
            return tool
        end
    end
end

local function attackTarget(target)
    if not isAlive(target) then return end
    local root = getRoot()
    if not root then return end

    local targetRoot = target:FindFirstChild("HumanoidRootPart")
    if not targetRoot then return end

    -- Keep a modest distance and repeatedly activate the equipped tool.
    root.CFrame = targetRoot.CFrame * CFrame.new(0, 0, 4)
    local tool = equipCombatTool()
    if tool then
        pcall(function() tool:Activate() end)
    end
end

local function findBoss()
    return nearestEnemy(function(obj, name, display)
        local text = (name .. " " .. display):lower()
        return obj:GetAttribute("IsBoss") == true
            or text:find("boss", 1, true) ~= nil
            or text:find("dough king", 1, true) ~= nil
            or text:find("cake prince", 1, true) ~= nil
            or text:find("soul reaper", 1, true) ~= nil
            or text:find("elite", 1, true) ~= nil
    end)
end

local function findBoneEnemy()
    return nearestEnemy(function(_, name, display)
        local text = (name .. " " .. display):lower()
        return text:find("soul reaper", 1, true)
            or text:find("reborn skeleton", 1, true)
            or text:find("living zombie", 1, true)
            or text:find("demonic soul", 1, true)
            or text:find("possessed mummy", 1, true)
    end)
end

local function findCakeEnemy()
    return nearestEnemy(function(_, name, display)
        local text = (name .. " " .. display):lower()
        return text:find("cake prince", 1, true)
            or text:find("dough king", 1, true)
            or text:find("cake guard", 1, true)
            or text:find("cookie crafter", 1, true)
            or text:find("head baker", 1, true)
    end)
end

local function findFruitObject()
    local root = getRoot()
    if not root then return nil end

    local best, distance
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("Tool") and obj.Name:lower():find("fruit", 1, true) then
            local handle = obj:FindFirstChild("Handle")
            if handle then
                local d = (handle.Position - root.Position).Magnitude
                if not distance or d < distance then
                    best, distance = obj, d
                end
            end
        end
    end
    return best
end

local function findChest()
    local root = getRoot()
    if not root then return nil end

    local best, distance
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("BasePart") and obj.Name:lower():find("chest", 1, true) then
            local d = (obj.Position - root.Position).Magnitude
            if not distance or d < distance then
                best, distance = obj, d
            end
        end
    end
    return best
end

local function findBerry()
    local root = getRoot()
    if not root then return nil end

    local best, distance
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("BasePart") then
            local n = obj.Name:lower()
            if n:find("berry", 1, true) or obj:GetAttribute("_BerryCFrame1") then
                local d = (obj.Position - root.Position).Magnitude
                if not distance or d < distance then
                    best, distance = obj, d
                end
            end
        end
    end
    return best
end

local function moveToPart(part)
    local root = getRoot()
    if root and part and part:IsA("BasePart") then
        root.CFrame = part.CFrame + Vector3.new(0, 3, 0)
    end
end

local function runAutomation()
    while gui and gui.Parent do
        local worked = false

        if State.AutoFarmLevel or State.AutoFarmNearest or State.AutoFarmMastery then
            local target = nearestEnemy(function(obj)
                return not Players:GetPlayerFromCharacter(obj)
            end)
            if target then
                attackTarget(target)
                worked = true
            end
        end

        if State.AutoFarmBones then
            local target = findBoneEnemy()
            if target then attackTarget(target); worked = true end
        end

        if State.AutoCakePrince or State.AutoDoughKing then
            local target = findCakeEnemy()
            if target then attackTarget(target); worked = true end
        end

        if State.AutoAttackBoss or State.AutoAttackAllBoss or State.AutoEliteHunter then
            local target = findBoss()
            if target then attackTarget(target); worked = true end
        end

        if State.AutoCollectChest then
            local chest = findChest()
            if chest then moveToPart(chest); worked = true end
        end

        if State.AutoCollectBerry then
            local berry = findBerry()
            if berry then moveToPart(berry); worked = true end
        end

        if State.AutoFindFruit or State.AutoCollectFruit then
            local fruit = findFruitObject()
            if fruit and fruit:FindFirstChild("Handle") then
                moveToPart(fruit.Handle)
                worked = true
            end
        end

        if State.AutoFarmMaterial then
            local target = nearestEnemy()
            if target then attackTarget(target); worked = true end
        end

        if State.AutoSea then
            local target = nearestEnemy(function(obj, name, display)
                local text = (name .. " " .. display):lower()
                return text:find("sea", 1, true) or text:find("shark", 1, true)
                    or text:find("terror", 1, true) or text:find("fish", 1, true)
            end)
            if target then attackTarget(target); worked = true end
        end

        -- Raid is exposed as a control and intentionally does not invoke
        -- undocumented server remotes. The user can start a raid normally.
        task.wait(worked and 0.15 or 0.5)
    end
end

task.spawn(runAutomation)

-- UI
local gui = Instance.new("ScreenGui")
gui.Name = GUI_NAME
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
pcall(function() gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling end)
gui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local main = Instance.new("Frame")
main.Name = "Main"
main.Size = UDim2.fromOffset(720, 460)
main.Position = UDim2.new(0.5, -360, 0.5, -230)
main.BackgroundColor3 = Theme.Background
main.BorderSizePixel = 0
main.Parent = gui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 12)
mainCorner.Parent = main

local mainStroke = Instance.new("UIStroke")
mainStroke.Color = Theme.Stroke
mainStroke.Thickness = 1
mainStroke.Parent = main

local top = Instance.new("Frame")
top.Name = "TopBar"
top.Size = UDim2.new(1, 0, 0, 58)
top.BackgroundColor3 = Theme.Panel
top.BorderSizePixel = 0
top.Parent = main

local topCorner = Instance.new("UICorner")
topCorner.CornerRadius = UDim.new(0, 12)
topCorner.Parent = top

local title = Instance.new("TextLabel")
title.BackgroundTransparency = 1
title.Position = UDim2.fromOffset(18, 7)
title.Size = UDim2.fromOffset(390, 27)
title.Font = Enum.Font.GothamBold
title.Text = "KEN HUB"
title.TextColor3 = Theme.White
title.TextSize = 20
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = top

local subtitle = Instance.new("TextLabel")
subtitle.BackgroundTransparency = 1
subtitle.Position = UDim2.fromOffset(19, 32)
subtitle.Size = UDim2.fromOffset(390, 18)
subtitle.Font = Enum.Font.Gotham
subtitle.Text = "Blox Fruits  •  discord.gg/DSpzwrbhs2"
subtitle.TextColor3 = Theme.Muted
subtitle.TextSize = 11
subtitle.TextXAlignment = Enum.TextXAlignment.Left
subtitle.Parent = top

local close = Instance.new("TextButton")
close.Size = UDim2.fromOffset(34, 34)
close.Position = UDim2.new(1, -46, 0, 12)
close.BackgroundColor3 = Theme.Panel2
close.BorderSizePixel = 0
close.Text = "×"
close.TextColor3 = Theme.White
close.TextSize = 20
close.Font = Enum.Font.GothamBold
close.Parent = top
Instance.new("UICorner", close).CornerRadius = UDim.new(0, 8)

local side = Instance.new("Frame")
side.Size = UDim2.new(0, 150, 1, -58)
side.Position = UDim2.fromOffset(0, 58)
side.BackgroundColor3 = Theme.Panel
side.BorderSizePixel = 0
side.Parent = main

local sideLayout = Instance.new("UIListLayout")
sideLayout.Padding = UDim.new(0, 5)
sideLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
sideLayout.SortOrder = Enum.SortOrder.LayoutOrder
sideLayout.Parent = side

local sidePad = Instance.new("UIPadding")
sidePad.PaddingTop = UDim.new(0, 10)
sidePad.PaddingLeft = UDim.new(0, 8)
sidePad.PaddingRight = UDim.new(0, 8)
sidePad.Parent = side

local content = Instance.new("Frame")
content.Size = UDim2.new(1, -150, 1, -58)
content.Position = UDim2.fromOffset(150, 58)
content.BackgroundColor3 = Theme.Background
content.BorderSizePixel = 0
content.Parent = main

local pages = {}
local buttons = {}
local currentPage

local function makePage(name)
    local page = Instance.new("ScrollingFrame")
    page.Name = name
    page.Size = UDim2.fromScale(1, 1)
    page.BackgroundTransparency = 1
    page.BorderSizePixel = 0
    page.ScrollBarThickness = 3
    page.ScrollBarImageColor3 = Theme.Stroke
    page.CanvasSize = UDim2.new(0, 0, 0, 0)
    page.Visible = false
    page.Parent = content

    local pad = Instance.new("UIPadding")
    pad.PaddingTop = UDim.new(0, 15)
    pad.PaddingLeft = UDim.new(0, 15)
    pad.PaddingRight = UDim.new(0, 15)
    pad.PaddingBottom = UDim.new(0, 15)
    pad.Parent = page

    local layout = Instance.new("UIListLayout")
    layout.Padding = UDim.new(0, 9)
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Parent = page

    layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        page.CanvasSize = UDim2.fromOffset(0, layout.AbsoluteContentSize.Y + 30)
    end)

    pages[name] = page
    return page
end

local function section(page, text)
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 0, 27)
    label.BackgroundTransparency = 1
    label.Text = text:upper()
    label.TextColor3 = Theme.Muted
    label.Font = Enum.Font.GothamBold
    label.TextSize = 11
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = page
    return label
end

local function button(page, text, callback)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(1, 0, 0, 38)
    b.BackgroundColor3 = Theme.Panel
    b.BorderSizePixel = 0
    b.Text = text
    b.TextColor3 = Theme.White
    b.Font = Enum.Font.Gotham
    b.TextSize = 13
    b.TextXAlignment = Enum.TextXAlignment.Left
    b.AutoButtonColor = false
    b.Parent = page
    local p = Instance.new("UIPadding")
    p.PaddingLeft = UDim.new(0, 13)
    p.Parent = b
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 8)
    local s = Instance.new("UIStroke")
    s.Color = Theme.Stroke
    s.Thickness = 1
    s.Parent = b
    b.MouseEnter:Connect(function()
        TweenService:Create(b, TweenInfo.new(.12), {BackgroundColor3 = Theme.Panel2}):Play()
    end)
    b.MouseLeave:Connect(function()
        TweenService:Create(b, TweenInfo.new(.12), {BackgroundColor3 = Theme.Panel}):Play()
    end)
    b.Activated:Connect(function()
        pcall(callback)
    end)
    return b
end

local function toggle(page, text, initial, callback)
    local value = initial
    local b = button(page, "", function()
        value = not value
        callback(value)
        b.Text = text .. "  [" .. (value and "ON" or "OFF") .. "]"
    end)
    b.Text = text .. "  [" .. (value and "ON" or "OFF") .. "]"
    return b
end

local function slider(page, text, min, max, initial, callback)
    local holder = Instance.new("Frame")
    holder.Size = UDim2.new(1, 0, 0, 58)
    holder.BackgroundColor3 = Theme.Panel
    holder.BorderSizePixel = 0
    holder.Parent = page
    Instance.new("UICorner", holder).CornerRadius = UDim.new(0, 8)

    local label = Instance.new("TextLabel")
    label.BackgroundTransparency = 1
    label.Position = UDim2.fromOffset(12, 6)
    label.Size = UDim2.new(1, -24, 0, 20)
    label.Font = Enum.Font.Gotham
    label.TextColor3 = Theme.White
    label.TextSize = 12
    label.Text = text .. ": " .. tostring(initial)
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = holder

    local bar = Instance.new("Frame")
    bar.Position = UDim2.fromOffset(12, 35)
    bar.Size = UDim2.new(1, -24, 0, 6)
    bar.BackgroundColor3 = Theme.Panel2
    bar.BorderSizePixel = 0
    bar.Parent = holder
    Instance.new("UICorner", bar).CornerRadius = UDim.new(1, 0)

    local fill = Instance.new("Frame")
    fill.BackgroundColor3 = Theme.White
    fill.BorderSizePixel = 0
    fill.Parent = bar
    Instance.new("UICorner", fill).CornerRadius = UDim.new(1, 0)

    local dragging = false
    local value = initial

    local function setFromX(x)
        local ratio = math.clamp((x - bar.AbsolutePosition.X) / bar.AbsoluteSize.X, 0, 1)
        value = math.floor(min + (max - min) * ratio + .5)
        fill.Size = UDim2.new(ratio, 0, 1, 0)
        label.Text = text .. ": " .. tostring(value)
        callback(value)
    end

    local function setInitial(v)
        value = math.clamp(v, min, max)
        local ratio = (value - min) / (max - min)
        fill.Size = UDim2.new(ratio, 0, 1, 0)
    end

    setInitial(initial)
    bar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            setFromX(input.Position.X)
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            setFromX(input.Position.X)
        end
    end)
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)
end

local function makeTab(name)
    local b = Instance.new("TextButton")
    b.Name = name
    b.Size = UDim2.new(1, 0, 0, 36)
    b.BackgroundColor3 = Theme.Panel
    b.BorderSizePixel = 0
    b.Text = name
    b.TextColor3 = Theme.Muted
    b.Font = Enum.Font.GothamMedium
    b.TextSize = 12
    b.AutoButtonColor = false
    b.Parent = side
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 8)
    buttons[name] = b
    b.Activated:Connect(function()
        for n, p in pairs(pages) do
            p.Visible = (n == name)
            buttons[n].BackgroundColor3 = (n == name) and Theme.Panel2 or Theme.Panel
            buttons[n].TextColor3 = (n == name) and Theme.White or Theme.Muted
        end
        currentPage = name
    end)
end

local tabNames = {
    "Home", "Main", "Automatically", "Sea Event",
    "Teleport", "Shop", "Misc", "Settings"
}
for _, n in ipairs(tabNames) do
    makePage(n)
    makeTab(n)
end

-- Home
do
    local p = pages.Home
    section(p, "Ken Hub")
    button(p, "Copy Discord Invite", function()
        if setclipboard then
            setclipboard("https://discord.gg/DSpzwrbhs2")
            notify("Ken Hub", "Discord invite copied.")
        else
            notify("Ken Hub", "Clipboard is unavailable.")
        end
    end)
    button(p, "Refresh Character", function()
        applyMovement()
        notify("Ken Hub", "Character settings refreshed.")
    end)
    section(p, "Player")
    button(p, "Player: " .. LocalPlayer.Name, function() end)
    button(p, "Place ID: " .. tostring(game.PlaceId), function() end)
    button(p, "Job ID: " .. tostring(game.JobId), function() end)
end

-- Main
do
    local p = pages.Main
    section(p, "Movement")
    slider(p, "WalkSpeed", 16, 150, State.WalkSpeed, function(v)
        State.WalkSpeed = v
        applyMovement()
        saveConfig()
    end)
    slider(p, "JumpPower", 50, 200, State.JumpPower, function(v)
        State.JumpPower = v
        applyMovement()
        saveConfig()
    end)
    toggle(p, "Player ESP", State.ESP, function(v)
        State.ESP = v
        updateESP()
        saveConfig()
    end)
    toggle(p, "Fullbright", State.Fullbright, function(v)
        setFullbright(v)
        saveConfig()
    end)
end

-- Automatic
do
    local p = pages.Automatically
    section(p, "Auto Farm")

    toggle(p, "Auto Farm Level", State.AutoFarmLevel, function(v)
        State.AutoFarmLevel = v
        saveConfig()
    end)
    toggle(p, "Auto Farm Nearest", State.AutoFarmNearest, function(v)
        State.AutoFarmNearest = v
        saveConfig()
    end)
    toggle(p, "Auto Farm Mastery", State.AutoFarmMastery, function(v)
        State.AutoFarmMastery = v
        saveConfig()
    end)
    toggle(p, "Auto Farm Material", State.AutoFarmMaterial, function(v)
        State.AutoFarmMaterial = v
        saveConfig()
    end)
    toggle(p, "Auto Farm Bones", State.AutoFarmBones, function(v)
        State.AutoFarmBones = v
        saveConfig()
    end)

    section(p, "Collection")
    toggle(p, "Auto Collect Chest", State.AutoCollectChest, function(v)
        State.AutoCollectChest = v
        saveConfig()
    end)
    toggle(p, "Auto Collect Berry", State.AutoCollectBerry, function(v)
        State.AutoCollectBerry = v
        saveConfig()
    end)
    toggle(p, "Auto Find Fruit", State.AutoFindFruit, function(v)
        State.AutoFindFruit = v
        saveConfig()
    end)
    toggle(p, "Auto Collect Fruit", State.AutoCollectFruit, function(v)
        State.AutoCollectFruit = v
        saveConfig()
    end)

    section(p, "Bosses")
    toggle(p, "Auto Attack Boss", State.AutoAttackBoss, function(v)
        State.AutoAttackBoss = v
        saveConfig()
    end)
    toggle(p, "Auto Attack All Boss", State.AutoAttackAllBoss, function(v)
        State.AutoAttackAllBoss = v
        saveConfig()
    end)
    toggle(p, "Auto Elite Hunter", State.AutoEliteHunter, function(v)
        State.AutoEliteHunter = v
        saveConfig()
    end)
    toggle(p, "Auto Soul Reaper / Bones", State.AutoFarmBones, function(v)
        State.AutoFarmBones = v
        saveConfig()
    end)
    toggle(p, "Auto Cake Prince", State.AutoCakePrince, function(v)
        State.AutoCakePrince = v
        saveConfig()
    end)
    toggle(p, "Auto Dough King", State.AutoDoughKing, function(v)
        State.AutoDoughKing = v
        saveConfig()
    end)

    section(p, "Sea / Raid")
    toggle(p, "Auto Farm Sea", State.AutoSea, function(v)
        State.AutoSea = v
        saveConfig()
    end)
    toggle(p, "Auto Raid", State.AutoRaid, function(v)
        State.AutoRaid = v
        saveConfig()
        if v then
            notify("Ken Hub", "Raid automation is enabled as a control; start the raid through the game's normal raid system.")
        end
    end)
end

-- Sea Event
do
    local p = pages["Sea Event"]
    section(p, "Navigation")
    button(p, "Teleport to Sea Castle", function()
        teleportTo(Locations["Sea Castle"])
    end)
    button(p, "Teleport to Tiki Outpost", function()
        teleportTo(Locations["Tiki Outpost"])
    end)
    button(p, "Teleport to Port Town", function()
        teleportTo(Locations["Port Town"])
    end)
    button(p, "Teleport to Haunted Castle", function()
        teleportTo(Locations["Haunted Castle"])
    end)
    button(p, "Teleport to Hydra Island", function()
        teleportTo(Locations["Hydra Island"])
    end)
    section(p, "Utilities")
    button(p, "Refresh Nearby Players", function()
        updateESP()
        notify("Ken Hub", "Player highlights refreshed.")
    end)
end

-- Teleport
do
    local p = pages.Teleport
    section(p, "First Sea")
    for _, name in ipairs({
        "Middle Town", "Jungle", "Pirate Starter", "Marine Starter",
        "Frozen Village", "Colosseum", "Prison", "Magma Village"
    }) do
        button(p, name, function() teleportTo(Locations[name]) end)
    end

    section(p, "Second Sea")
    for _, name in ipairs({
        "Dressrosa", "Cafe", "Green Zone", "Kingdom of Rose", "Hot and Cold",
        "Forgotten Island"
    }) do
        button(p, name, function() teleportTo(Locations[name]) end)
    end

    section(p, "Third Sea")
    for _, name in ipairs({
        "Port Town", "Castle on Sea", "Hydra Island", "Great Tree",
        "Floating Turtle", "Haunted Castle", "Sea Castle", "Tiki Outpost"
    }) do
        button(p, name, function() teleportTo(Locations[name]) end)
    end
end

-- Shop
do
    local p = pages.Shop
    section(p, "Shop Utilities")
    button(p, "Open Roblox Shop", function()
        notify("Ken Hub", "Use the in-game Shop menu to purchase items.")
    end)
    button(p, "Copy Discord Invite", function()
        if setclipboard then
            setclipboard("https://discord.gg/DSpzwrbhs2")
            notify("Ken Hub", "Invite copied.")
        end
    end)
    section(p, "Note")
    button(p, "Purchases are handled by the game", function() end)
end

-- Misc
do
    local p = pages.Misc
    section(p, "Server")
    button(p, "Rejoin Server", rejoin)
    button(p, "Server Hop", serverHop)
    button(p, "Copy Job ID", function()
        if setclipboard then
            setclipboard(game.JobId)
            notify("Ken Hub", "Job ID copied.")
        end
    end)
    section(p, "Visual")
    toggle(p, "Player ESP", State.ESP, function(v)
        State.ESP = v
        updateESP()
        saveConfig()
    end)
    toggle(p, "Fullbright", State.Fullbright, function(v)
        setFullbright(v)
        saveConfig()
    end)
end

-- Settings
do
    local p = pages.Settings
    section(p, "Interface")
    button(p, "Save Settings", function()
        saveConfig()
        notify("Ken Hub", "Settings saved.")
    end)
    button(p, "Reload Settings", function()
        loadConfig()
        applyMovement()
        setFullbright(State.Fullbright)
        updateESP()
        notify("Ken Hub", "Settings reloaded.")
    end)
    button(p, "Reset Settings", function()
        State.WalkSpeed = 16
        State.JumpPower = 50
        State.ESP = false
        State.Fullbright = false
        State.AntiAFK = false
        State.AutoReconnect = false
        applyMovement()
        setFullbright(false)
        clearESP()
        saveConfig()
        notify("Ken Hub", "Settings reset.")
    end)
    section(p, "Keybind")
    button(p, "RightShift — Toggle Hub", function()
        notify("Ken Hub", "Press RightShift to toggle the hub.")
    end)
end

-- Floating K logo / restore button.
local logo = Instance.new("TextButton")
logo.Name = "KenHubK"
logo.Size = UDim2.fromOffset(82, 82)
logo.Position = UDim2.new(0, 218, 0, 150)
logo.BackgroundColor3 = Theme.Black
logo.BorderSizePixel = 0
logo.Text = "K"
logo.TextColor3 = Theme.White
logo.TextSize = 48
logo.Font = Enum.Font.GothamBlack
logo.Visible = false
logo.Parent = gui

local logoCorner = Instance.new("UICorner")
logoCorner.CornerRadius = UDim.new(1, 0)
logoCorner.Parent = logo

local logoStroke = Instance.new("UIStroke")
logoStroke.Color = Theme.White
logoStroke.Thickness = 3
logoStroke.Parent = logo

local function setOpen(open)
    State.Open = open
    main.Visible = open
    logo.Visible = not open
end

close.Activated:Connect(function()
    setOpen(false)
end)

logo.Activated:Connect(function()
    setOpen(true)
end)

UserInputService.InputBegan:Connect(function(input, processed)
    if processed then return end
    if input.KeyCode == Enum.KeyCode.RightShift then
        setOpen(not State.Open)
    end
end)

-- Dragging
do
    local dragging = false
    local dragStart
    local startPos

    top.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
            or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = main.Position
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if not dragging then return end
        if input.UserInputType ~= Enum.UserInputType.MouseMovement
            and input.UserInputType ~= Enum.UserInputType.Touch then return end

        local delta = input.Position - dragStart
        main.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
            or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)
end

-- Keep character movement settings after respawn.
LocalPlayer.CharacterAdded:Connect(function()
    task.wait(1)
    applyMovement()
    if State.ESP then updateESP() end
end)

Players.PlayerAdded:Connect(function()
    if State.ESP then
        task.wait(.5)
        updateESP()
    end
end)

Players.PlayerRemoving:Connect(function()
    if State.ESP then updateESP() end
end)

-- Initialize.
for n, p in pairs(pages) do
    p.Visible = false
    buttons[n].BackgroundColor3 = Theme.Panel
end
pages.Home.Visible = true
buttons.Home.BackgroundColor3 = Theme.Panel2
buttons.Home.TextColor3 = Theme.White
currentPage = "Home"

applyMovement()
setFullbright(State.Fullbright)
updateESP()

notify("Ken Hub", "Blox Fruits hub loaded.")
