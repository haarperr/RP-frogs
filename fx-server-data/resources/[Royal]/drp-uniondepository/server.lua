RegisterServerEvent("drp-ud:particleserver")
AddEventHandler("drp-ud:particleserver", function(method)
    TriggerClientEvent("drp-ud:particleclient", -1, method)
end)

local defenderSpawned = false
local ongoingHeist = false

RegisterServerEvent("drp-ud:requestVariables")
AddEventHandler("drp-ud:requestVariables", function())
    TriggerClientEvent("drp-ud:getVariables", -1, defenderSpawned, ongoingHeist)
end)
    