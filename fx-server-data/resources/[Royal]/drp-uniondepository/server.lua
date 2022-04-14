RegisterServerEvent("drp-ud:particleserver")
AddEventHandler("drp-ud:particleserver", function(method)
    TriggerClientEvent("drp-ud:particleclient", -1, method)
end)