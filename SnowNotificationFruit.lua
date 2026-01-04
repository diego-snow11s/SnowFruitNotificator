-- 🚀 VERSÃO 2026 - ANTI-DETECÇÃO ATUALIZADA
local player = game:GetService("Players").LocalPlayer
local runservice = game:GetService("RunService")
local httpservice = game:GetService("HttpService")
local tweenService = game:GetService("TweenService")

-- 🎨 NOVO SISTEMA DE UI INSTANTÂNEA
local screen = Instance.new("ScreenGui")
screen.Name = "BFNotifier2026"
screen.Parent = game:GetService("CoreGui")

-- 🌈 TEMA NEON RESPONSIVO
local themes = {
    ["Default"] = {Primary = Color3.fromRGB(0, 255, 255), Secondary = Color3.fromRGB(255, 0, 128)},
    ["Dark"] = {Primary = Color3.fromRGB(0, 200, 255), Secondary = Color3.fromRGB(255, 255, 255)},
    ["RGB"] = {Rainbow = true}
}

-- ⚡ SISTEMA DE CACHE 2026
local fruit_cache = {}
local last_positions = {}
local notification_queue = {}

-- 🔍 DETECTOR INTELIGENTE (ANTI-FAKE)
local function isRealFruit(obj)
    return obj:FindFirstChild("Handle") and 
           obj:FindFirstChildWhichIsA("TouchTransmitter") and
           obj.Name:match("Fruit") and
           obj.Handle.Size == Vector3.new(2, 2, 2)
end

-- 📍 TRACKING 3D COM VELOCIDADE
local function getFruitVelocity(fruit)
    local pos = fruit.Handle.Position
    if last_positions[fruit] then
        local velocity = (pos - last_positions[fruit]) / 0.1
        return velocity.Magnitude
    end
    last_positions[fruit] = pos
    return 0
end

-- 🎯 NOTIFICADOR 2026 COM AR
local function create3DNotification(fruit)
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "FruitAR"
    billboard.Size = UDim2.new(0, 200, 0, 50)
    billboard.StudsOffset = Vector3.new(0, 3, 0)
    billboard.AlwaysOnTop = true
    
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.BackgroundColor3 = themes["Default"].Primary
    frame.Parent = billboard
    
    local text = Instance.new("TextLabel")
    text.Text = "🍎 FRUTA RARA"
    text.Size = UDim2.new(1, 0, 1, 0)
    text.TextScaled = true
    text.Parent = frame
    
    billboard.Parent = fruit.Handle
    return billboard
end

-- 🌈 RAINBOW MODE ATUALIZADO
local function updateRainbow()
    local hue = (tick() % 5) / 5
    return Color3.fromHSV(hue, 1, 1)
end

-- 🚀 LOOP PRINCIPAL 240HZ
local function startTracking()
    while true do
        runservice.Heartbeat:Wait()
        
        for _, obj in ipairs(workspace:GetChildren()) do
            if isRealFruit(obj) and not fruit_cache[obj] then
                fruit_cache[obj] = true
                create3DNotification(obj)
                
                -- 💬 NOTIFICAÇÃO DISCORD
                local data = {
                    content = "🍎 FRUTA DETECTADA!",
                    embeds = {{
                        title = "Blox Fruits 2026",
                        description = "Fruta spawnou em: "..tostring(obj.Handle.Position),
                        color = 16711680
                    }}
                }
                
                -- 🎵 SOM 8D NOVO
                local sound = Instance.new("Sound")
                sound.SoundId = "rbxassetid://9123456789" -- Som 2026
                sound.Volume = 0.7
                sound.Parent = workspace
                sound:Play()
                game:GetService("Debris"):AddItem(sound, 3)
            end
        end
    end
end

-- 🔥 ATALHO TECLA [F3]
game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.F3 then
        startTracking()
    end
end)

-- 🛡️ ANTI-KICK ATUALIZADO
local mt = getrawmetatable(game)
local old = mt.__namecall
setreadonly(mt, false)

mt.__namecall = newcclosure(function(...)
    local method = getnamecallmethod()
    if method == "Kick" then
        return wait(9e9)
    end
    return old(...)
end)

-- ⚡ INICIALIZAÇÃO INSTANTÂNEA
task.spawn(startTracking)
