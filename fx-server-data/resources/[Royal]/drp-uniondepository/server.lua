
RegisterServerEvent("drp-ud:particleserver")
AddEventHandler("drp-ud:particleserver", function(method, vec3)
    TriggerClientEvent("drp-ud:particleclient", -1, method, vec3)
end)

local whatIsThis = {}
whatIsThis["ongoingHeist"] = false
whatIsThis["defenderSpawned"] = false
whatIsThis["defender2Spawned"] = false
whatIsThis["totalThermite"] = 0
whatIsThis["isElevatorBurned"] = false
whatIsThis["isThermite1Burned"] = false
whatIsThis["isThermite2Burned"] = false
whatIsThis["isThermite3Burned"] = false
whatIsThis["isThermite4Burned"] = false



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