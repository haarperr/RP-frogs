players = {}


RegisterNetEvent('getallplayers')
AddEventHandler('getallplayers', function(source)
   if GetCurrentResourceName() == "drp-admin" then
        for k in pairs (players) do
            players [k] = nil
        end
        
        for _, playerId in ipairs(GetPlayers()) do
            local name = GetPlayerName(playerId)
            table.insert(players, {name, playerId})
        end

        TriggerClientEvent('RecieveActivePlayers', -1, players)
        Citizen.Wait(10000)
    end
end)

RegisterServerEvent('drp-adminmenu:sendAnnoucement')
AddEventHandler("drp-adminmenu:sendAnnoucement", function(msg)
    TriggerClientEvent('chatMessage', -1, 'Admin', 1, msg)
end)

RegisterServerEvent("drp-adminmenu:CheckInventory")
AddEventHandler("drp-adminmenu:CheckInventory", function(target)
    local src = source
    if target ~= "" then
        local user = exports["drp-base"]:getModule("Player"):GetUser(tonumber(target))
        local char = user:getCurrentCharacter()
        TriggerClientEvent('drp-adminmenu:CloseMouse', src)
        Wait(1)
        TriggerClientEvent("server-inventory-open", src, "1", "ply-"..char.id)
    else
        TriggerClientEvent('drp-adminmenu:CloseMouse', src)
        TriggerClientEvent('DoLongHudText', src, 'You need to select someone to search!', 2)
    end
end)

RegisterServerEvent('admin:bringPlayer')
AddEventHandler('admin:bringPlayer', function(pSrc, target)
    local pTarget = tonumber(target)
    local coords = GetEntityCoords(GetPlayerPed(tonumber(pSrc)))
    TriggerClientEvent('drp-admin:bringPlayer', pTarget, coords)
    TriggerClientEvent('DoLongHudText', tonumber(pSrc), 'Player Brought!')
end)

RegisterServerEvent('admin:teleportToPlayer')
AddEventHandler('admin:teleportToPlayer', function(target)
    local src = source
    local coords = GetEntityCoords(GetPlayerPed(target))
    TriggerClientEvent('drp-admin:bringPlayer', src, coords)
    TriggerClientEvent('DoLongHudText', src, 'You teleported to this player.')
end)

RegisterCommand("menu", function(source, args)
    local src = source
    local steamIdentifier = GetPlayerIdentifiers(src)[1]

    exports.ghmattimysql:execute('SELECT rank FROM users WHERE `hex_id`= ?', {steamIdentifier}, function(data)
        if data[1].rank == "owner" or data[1].rank == "dev" then
            TriggerClientEvent('drp-admin:openmodmenu', src) 
        end
    end)
end)

RegisterServerEvent('drp-admin:fixplayercar')
AddEventHandler('drp-admin:fixplayercar', function(t)
	TriggerClientEvent('drp-admin:fixcar', t)
end) 

RegisterServerEvent('raid_clothes:openClothing2')
AddEventHandler('raid_clothes:openClothing2', function(t)
	TriggerClientEvent('drp-admin:fixclothes', t)
end) 

RegisterServerEvent('drp-admin:update:vehicle')
AddEventHandler('drp-admin:update:vehicle', function(data, licensePlate, garagename)
    local src = source
    local plate = licensePlate
    local garage = garagename
	exports.ghmattimysql:execute("UPDATE characters_cars SET vehicle_state = @state, current_garage = @garage WHERE license_plate = @plate",
	{['state'] = 'In', ['garage'] = garage, ['plate'] = plate})
end) 


RegisterServerEvent("drp-admin:changeForPed")
AddEventHandler("drp-admin:changeForPed", function(input, src2)
    TriggerClientEvent('raid_clothes:AdminSetModel', src2, input)
    TriggerClientEvent('drp-admin:raid_clothes:model', src2,  input)
    Citizen.Trace(input .. "\n")
    Citizen.Trace(src2 .. "\n")
end)
