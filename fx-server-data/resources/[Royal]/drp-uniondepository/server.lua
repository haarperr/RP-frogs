RegisterServerEvent("drp-ud:particleserver")
AddEventHandler("drp-ud:particleserver", function(method)
    TriggerClientEvent("drp-ud:particleclient", -1, method)
end)

local defenderSpawned = false
local defender2Spawned = false
local ongoingHeist = false


RegisterServerEvent("drp-ud:requestVariables")
AddEventHandler("drp-ud:requestVariables", function()
    Citizen.Trace("Requesting variables" .. tostring(defenderSpawned) .. " " .. tostring(defender2Spawned) .. " " .. tostring(ongoingHeist) .. "\n")
    TriggerClientEvent("drp-ud:getVariables", -1, defenderSpawned, defender2Spawned, ongoingHeist)
end)
    

RegisterServerEvent("drp-ud:setDefenderSpawned")
AddEventHandler("drp-ud:setDefenderSpawned", function(bool)
    defenderSpawned = bool
    TriggerClientEvent("drp-ud:getVariables", -1, defenderSpawned, defender2Spawned, ongoingHeist)
end)

RegisterServerEvent("drp-ud:setDefender2Spawned")
AddEventHandler("drp-ud:setDefender2Spawned", function(bool)
    defender2Spawned = bool
    TriggerClientEvent("drp-ud:getVariables", -1, defenderSpawned, defender2Spawned, ongoingHeist)
end)

RegisterServerEvent("drp-ud:setOngoingHeist")
AddEventHandler("drp-ud:setOngoingHeist", function(bool)
    ongoingHeist = bool
    TriggerClientEvent("drp-ud:getVariables", -1, defenderSpawned, defender2Spawned, ongoingHeist)
end)