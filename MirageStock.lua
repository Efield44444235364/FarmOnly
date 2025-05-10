local placeId = game.PlaceId
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local Notification = require(ReplicatedStorage:WaitForChild("Notification"))

-- ดึงชื่อ Executer
local executorName = identifyexecutor and identifyexecutor() or "Unknown"

-- สีที่ใช้ได้กรณีสุ่ม
local availableColors = { "Orange", "Blue", "Yellow", "Black", "Green", "White", "Purple", "Cyan" }

-- สีตาม Executer ที่กำหนดไว้
local executorColors = {
    ["Cryptic"] = "White",
    ["Krnl"] = "Purple",
    ["Wave"] = "Cyan",
    ["Arceus X"] = function()
        return math.random(1, 2) == 1 and "Blue" or "Cyan"
    end,
    ["CodeX"] = "Red"
}

-- ฟังก์ชันเลือกสี
local function getExecutorColor(name)
    local color = executorColors[name]
    if type(color) == "function" then
        return color()
    elseif color then
        return color
    else
        return availableColors[math.random(1, #availableColors)]
    end
end

-- ฟังก์ชันเช็ค ping
local function getPing()
    local stats = Players.LocalPlayer:FindFirstChild("PlayerScripts"):FindFirstChild("NetworkClient")
    if stats then
        local pingStat = stats:FindFirstChild("Ping")
        if pingStat then
            return pingStat.Value
        end
    end
    return 0
end

-- MAIN EXECUTION
if placeId == 7449423635 then
    if executorName == "Delta" then
        Notification.new("This Executer Hasn't Supported"):Display()
        return
    end

    local color = getExecutorColor(executorName)
    Notification.new("(<Color=" .. color .. ">" .. executorName .. "<Color=/>) Executer License"):Display()
    wait(0.8)

    local ping = getPing()
    if ping > 5000 then
        Notification.new("Your ping is very high pls wait"):Display()
        wait(2)
    end

    local injectWait = (ping > 1000) and math.random(6, 17) or 1

    Notification.new("<Color=White> inject backdoor<Color=/>"):Display()
    wait(injectWait)

    Notification.new("<Color=White> Loading Ui<Color=Green> Advance <Color=/>Stock<Color=/>"):Display()
    Notification.new("Script by <Color=Yellow>E<Color=/><Color=Orange>n<Color=/><Color=Blue>a<Color=/><Color=Green>n<Color=/><Color=White>g<Color=/>"):Display()
    wait(0.8)

    local Controller = require(Players.LocalPlayer.PlayerGui.Main.FruitShopAndDealer.Controller)
    local mt = getmetatable(Controller)
    mt.Open(Controller, "AdvancedFruitDealer")

elseif placeId == 4442272183 or placeId == 2753915549 then
    Notification.new("<Color=Red> <Color=/>"):Display()
    Notification.new("Bitch Thrid sea Only "):Display()
    wait(0.2)
    Notification.new("Travel to <Color=Blue> Thrid sea  <Color=/> pls wait"):Display()
    ReplicatedStorage.Remotes.CommF_:InvokeServer("TravelZou")

else
    print("Blox fruit Only")
end
