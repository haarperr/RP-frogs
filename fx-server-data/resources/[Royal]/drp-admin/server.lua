RegisterCommand("menu", function(source, args)
    local src = source
    local steamIdentifier = GetPlayerIdentifiers(src)[1]

    exports.ghmattimysql:execute('SELECT rank FROM users WHERE `hex_id`= ?', {steamIdentifier}, function(data)
        TriggerClientEvent('DoLongHudText', source, data[1], 1)
        if data[1].rank == "dev" or data[1].rank == "admin" or data[1].rank == "mod" then
            TriggerClientEvent('brp:openmodmenu', src) 
        end
    end)
end)

RegisterServerEvent('drp-admin:sendAnnoucement')
AddEventHandler("drp-admin:sendAnnoucement", function(msg)
    TriggerClientEvent('chatMessage', -1, 'Admin', 1, msg)
end)

RegisterServerEvent('drp-admin:update:vehicle')
AddEventHandler("drp-admin:update:vehicle", function(plate)
    TriggerClientEvent('DoLongHudText', source, 'The vehicle with the plate: '.. plate .. ' has been placed back in the garage!', 1)
    exports.ghmattimysql:execute("UPDATE characters_cars SET `vehicle_state` = @vehicle_state WHERE license_plate = @license_plate", {['vehicle_state'] = 'In', ['license_plate'] = plate})
end)

RegisterServerEvent('drp-admin:addCharacterPass')
AddEventHandler("drp-admin:addCharacterPass", function(cid, pass, rank, info)
    if info == 'add' then 
        exports.ghmattimysql:execute("INSERT INTO character_passes (cid, rank, pass_type, business_name) VALUES (@cid, @rank, @pass_type, @business_name)", {['@cid'] = cid, ['@rank'] = rank, ['@pass_type'] = pass, ['@business_name'] = pass})
    elseif info == 'remove' then
        exports.ghmattimysql:execute("DELETE FROM character_passes WHERE `cid` = @cid AND `rank` = @rank AND `pass_type` = @pass_type", {['@cid'] = cid, ['@rank'] = rank, ['@pass_type'] = pass})
    end
end)