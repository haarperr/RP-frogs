
RegisterServerEvent("drp-ud:particleserver")
AddEventHandler("drp-ud:particleserver", function(vec3)
    TriggerClientEvent("drp-ud:particleclient", -1, vec3)
end)

local s = {}
s["ongoingHeist"] = false
s["defenderSpawned"] = false
s["defender2Spawned"] = false
s["totalThermite"] = 0
s["isElevatorBurned"] = false
s["isThermite1Burned"] = false
s["isThermite2Burned"] = false
s["isThermite3Burned"] = false
s["isThermite4Burned"] = false



RegisterServerEvent("drp-ud:requestVariables")
AddEventHandler("drp-ud:requestVariables", function()
    Citizen.Trace("Requesting variables: " .. tostring(s["ongoingHeist"]) .. " " .. tostring(s["defenderSpawned"]) .. " " .. tostring(s["defender2Spawned"]) .. " " .. tostring(s["totalThermite"]) .. " " .. tostring(s["isElevatorBurned"]) .. " " .. tostring(s["isThermite1Burned"]) .. " " .. tostring(s["isThermite2Burned"]) .. " " .. tostring(s["isThermite3Burned"]) .. " " .. tostring(s["isThermite4Burned"]) .. "\n")
    TriggerClientEvent("drp-ud:getVariables", -1, s)
end) 

RegisterServerEvent("drp-ud:setVariable")
AddEventHandler("drp-ud:setVariable", function(variable, bool)
    defenderSpawned = bool
    Citizen.Trace("Requesting variables: " .. tostring(s["ongoingHeist"]) .. " " .. tostring(s["defenderSpawned"]) .. " " .. tostring(s["defender2Spawned"]) .. " " .. tostring(s["totalThermite"]) .. " " .. tostring(s["isElevatorBurned"]) .. " " .. tostring(s["isThermite1Burned"]) .. " " .. tostring(s["isThermite2Burned"]) .. " " .. tostring(s["isThermite3Burned"]) .. " " .. tostring(s["isThermite4Burned"]) .. "\n")
    TriggerClientEvent("drp-ud:getVariables", -1, s)
end)

RegisterServerEvent("drp-ud:addThermite")
AddEventHandler("drp-ud:addThermite", function()
    s.totalThermite = s.totalThermite + 1
    Citizen.Trace("Requesting variables: " .. tostring(s["ongoingHeist"]) .. " " .. tostring(s["defenderSpawned"]) .. " " .. tostring(s["defender2Spawned"]) .. " " .. tostring(s["totalThermite"]) .. " " .. tostring(s["isElevatorBurned"]) .. " " .. tostring(s["isThermite1Burned"]) .. " " .. tostring(s["isThermite2Burned"]) .. " " .. tostring(s["isThermite3Burned"]) .. " " .. tostring(s["isThermite4Burned"]) .. "\n")
    TriggerClientEvent("drp-ud:getVariables", -1, s)
end)