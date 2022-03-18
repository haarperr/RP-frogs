RegisterServerEvent('drp-keys:attemptLockSV')
AddEventHandler('drp-keys:attemptLockSV', function(targetVehicle, plate)
    TriggerClientEvent('drp-keys:attemptLock', source, targetVehicle, plate)
end)