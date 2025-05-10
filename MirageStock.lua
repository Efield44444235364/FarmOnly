setfpscap(120)






local Controller = require(game:GetService("Players").LocalPlayer.PlayerGui.Main.FruitShopAndDealer.Controller)
local mt = getmetatable(Controller)
mt.Open(Controller, "AdvancedFruitDealer") --mt.Open(Controller)
