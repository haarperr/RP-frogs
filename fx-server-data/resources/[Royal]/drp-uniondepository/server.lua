RegisterServerEvent("drp-ud:particleserver")
AddEventHandler("drp-ud:particleserver", function(method)
    TriggerClientEvent("drp-ud:particleclient", -1, method)
end)

RegisterServerEvent("drp-ud:particleserver2")
AddEventHandler("drp-ud:particleserver2", function(method, vec3)
    TriggerClientEvent("drp-ud:particleclient", -1, method, vec3)
end)


local defenderSpawned = false
local defender2Spawned = false
local ongoingHeist = false
local totalThermite = 0 

RegisterServerEvent("drp-ud:requestVariables")
AddEventHandler("drp-ud:requestVariables", function()
    Citizen.Trace("Requesting variables: " .. tostring(defenderSpawned) .. " " .. tostring(defender2Spawned) .. " " .. tostring(ongoingHeist) .. " " .. tostring(totalThermite) .. "\n")
    TriggerClientEvent("drp-ud:getVariables", -1, defenderSpawned, defender2Spawned, ongoingHeist)
end) 

RegisterServerEvent("drp-ud:setDefenderSpawned")
AddEventHandler("drp-ud:setDefenderSpawned", function(bool)
    defenderSpawned = bool
    TriggerClientEvent("drp-ud:getVariables", -1, defenderSpawned, defender2Spawned, ongoingHeist, totalThermite)
end)

RegisterServerEvent("drp-ud:setDefender2Spawned")
AddEventHandler("drp-ud:setDefender2Spawned", function(bool)
    defender2Spawned = bool
    TriggerClientEvent("drp-ud:getVariables", -1, defenderSpawned, defender2Spawned, ongoingHeist, totalThermite)
end)

RegisterServerEvent("drp-ud:setOngoingHeist")
AddEventHandler("drp-ud:setOngoingHeist", function(bool)
    ongoingHeist = bool
    TriggerClientEvent("drp-ud:getVariables", -1, defenderSpawned, defender2Spawned, ongoingHeist, totalThermite)
end)

RegisterServerEvent("drp-ud:addThermite")
AddEventHandler("drp-ud:addThermite", function()
    totalThermite = totalThermite + 1
    TriggerClientEvent("drp-ud:getVariables", -1, defenderSpawned, defender2Spawned, ongoingHeist, totalThermite)
end)

