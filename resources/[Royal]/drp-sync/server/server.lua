RegisterServerEvent("royal:sync:player:ready")
AddEventHandler("royal:sync:player:ready",function()
    
end)

RegisterServerEvent("sync:request")
AddEventHandler("sync:request",function(native,pTargetId,NetId, ...)
    TriggerClientEvent("sync:execute", -1, native,NetId, ...)
end)

RegisterServerEvent("drp-sync:executeSyncNative")
AddEventHandler("drp-sync:executeSyncNative",function(name, netEntity, options, args)
    TriggerClientEvent("drp-sync:clientExecuteSyncNative",-1,name, netEntity, options, args)
end)