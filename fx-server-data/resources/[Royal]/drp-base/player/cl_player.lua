DRP.Player = DRP.Player or {}
DRP.LocalPlayer = DRP.LocalPlayer or {}

local function GetUser()
    return DRP.LocalPlayer
end

function DRP.LocalPlayer.setVar(self, var, data)
    GetUser()[var] = data
end

function DRP.LocalPlayer.getVar(self, var)
    return GetUser()[var]
end

function DRP.LocalPlayer.setCurrentCharacter(self, data)
    if not data then return end
    GetUser():setVar("character", data)
end

function DRP.LocalPlayer.getCurrentCharacter(self)
    return GetUser():getVar("character")
end

RegisterNetEvent("drp-base:networkVar")
AddEventHandler("drp-base:networkVar", function(var, val)
    DRP.LocalPlayer:setVar(var, val)
end)

