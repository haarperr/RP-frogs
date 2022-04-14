RegisterServerEvent("drp-ud:particleserver")
AddEventHandler("drp-ud:particleserver", function(method)
    TriggerClientEvent("drp-ud:particleclient", -1, method)
end)

local defenderSpawned = false
local ongoingHeist = false


RegisterServerEvent("drp-ud:requestVariables")
AddEventHandler("drp-ud:requestVariables", function()
    Citizen.Trace("Requesting variables")
    TriggerClientEvent("drp-ud:getVariables", -1, defenderSpawned, ongoingHeist)
end)
    

RegisterServerEvent("drp-ud:setDefenderSpawned")
AddEventHandler("drp-ud:setDefenderSpawned", function(bool)
    defenderSpawned = bool
    TriggerClientEvent("drp-ud:getVariables", -1, defenderSpawned, ongoingHeist)
end)

RegisterServerEvent("drp-ud:setOngoingHeist")
AddEventHandler("drp-ud:setOngoingHeist", function(bool)
    ongoingHeist = bool
    TriggerClientEvent("drp-ud:getVariables", -1, defenderSpawned, ongoingHeist)
end)