RegisterServerEvent('rrp:infinity:player:ready')
AddEventHandler('rrp:infinity:player:ready', function()
    local sexinthetube = GetEntityCoords(GetPlayerPed(source))
    
    TriggerClientEvent('rrp:infinity:player:coords', -1, sexinthetube)
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(30000)
        local sexinthetube = GetEntityCoords(source)

        TriggerClientEvent('rrp:infinity:player:coords', -1, sexinthetube)
        TriggerEvent("drp-base:updatecoords", sexinthetube.x, sexinthetube.y, sexinthetube.z)
        print("[^2drp-infinity^0]^3 Sync Successful.^0")
    end
end)