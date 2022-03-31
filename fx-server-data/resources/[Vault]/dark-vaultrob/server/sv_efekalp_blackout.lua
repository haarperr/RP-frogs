local blackoutaktifmi = false

AddEventHandler("explosionEvent", function(sender, ev)
    TriggerClientEvent('efe:explotiontype', sender)
    print("31")
end)

RegisterNetEvent('efe:server:elektrikkes')
AddEventHandler('efe:server:elektrikkes', function(durum)
    if durum then
        TriggerClientEvent('efe:client:elektrikkes', -1, true)
    elseif not durum then
        TriggerClientEvent('efe:client:elektrikkes', -1, false)
    end
end)


RegisterNetEvent('efe:chatmessage')
AddEventHandler('efe:chatmessage', function(drum)
    TriggerClientEvent("chatMessage", -1, "[LS Water & Power]: ", {255, 0, 0}, "City power is currently out, we're working on restoring it!")
end)