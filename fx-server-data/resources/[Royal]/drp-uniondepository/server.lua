
RegisterServerEvent("drp-ud:particleserver")
AddEventHandler("drp-ud:particleserver", function(method, vec3)
    TriggerClientEvent("drp-ud:particleclient", -1, method, vec3)
end)

local whatIsThis = {
    "ongoingHeist" = false,
    "defenderSpawned" = false,
    "defender2Spawned" = false,
    "totalThermite" = 0,
    "isElevatorBurned" = false,
    "isThermite1Burned" = false,
    "isThermite2Burned" = false,
    "isThermite3Burned" = false,
    "isThermite4Burned" = false
}



RegisterServerEvent("drp-ud:requestVariables")
AddEventHandler("drp-ud:requestVariables", function()
    Citizen.Trace("Requesting variables: " .. tostring(whatIsThis) .. "\n")
    TriggerClientEvent("drp-ud:getVariables", -1, whatIsThis)
end) 

RegisterServerEvent("drp-ud:setVariable")
AddEventHandler("drp-ud:setVariable", function(variable, bool)
    defenderSpawned = bool
    Citizen.Trace("Requesting variables: " .. tostring(whatIsThis) .. "\n")
    TriggerClientEvent("drp-ud:getVariables", -1, whatIsThis)
end)

RegisterServerEvent("drp-ud:addThermite")
AddEventHandler("drp-ud:addThermite", function()
    whatIsThis.totalThermite = whatIsThis.totalThermite + 1
    Citizen.Trace("Requesting variables: " .. tostring(whatIsThis) .. "\n")
    TriggerClientEvent("drp-ud:getVariables", -1, whatIsThis)
end)