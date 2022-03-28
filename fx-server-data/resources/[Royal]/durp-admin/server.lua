players = {}


RegisterNetEvent('getallplayers')
AddEventHandler('getallplayers', function(source)
   if GetCurrentResourceName() == "durp-admin" then
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

RegisterServerEvent('durp-adminmenu:sendAnnoucement')
AddEventHandler("durp-adminmenu:sendAnnoucement", function(msg)
    TriggerClientEvent('chatMessage', -1, 'Admin', 1, msg)
end)

RegisterServerEvent("durp-adminmenu:CheckInventory")
AddEventHandler("durp-adminmenu:CheckInventory", function(target)
    local src = source
    if target ~= "" then
        local user = exports["durp-base"]:getModule("Player"):GetUser(tonumber(target))
        local char = user:getCurrentCharacter()
        TriggerClientEvent('durp-adminmenu:CloseMouse', src)
        Wait(1)
        TriggerClientEvent("server-inventory-open", src, "1", "ply-"..char.id)
    else
        TriggerClientEvent('durp-adminmenu:CloseMouse', src)
        TriggerClientEvent('DoLongHudText', src, 'You need to select someone to search!', 2)
    end
end)

RegisterServerEvent('admin:bringPlayer')
AddEventHandler('admin:bringPlayer', function(pSrc, target)
    local pTarget = tonumber(target)
    local coords = GetEntityCoords(GetPlayerPed(tonumber(pSrc)))
    TriggerClientEvent('durp-admin:bringPlayer', pTarget, coords)
    TriggerClientEvent('DoLongHudText', tonumber(pSrc), 'Player Brought!')
end)

RegisterServerEvent('admin:teleportToPlayer')
AddEventHandler('admin:teleportToPlayer', function(target)
    local src = source
    local coords = GetEntityCoords(GetPlayerPed(target))
    TriggerClientEvent('durp-admin:bringPlayer', src, coords)
    TriggerClientEvent('DoLongHudText', src, 'You teleported to this player.')
end)

RegisterCommand("menu", function(source, args)
    local src = source
    local steamIdentifier = GetPlayerIdentifiers(src)[1]

    exports.ghmattimysql:execute('SELECT rank FROM users WHERE `hex_id`= ?', {steamIdentifier}, function(data)
        if data[1].rank == "dev" or data[1].rank == "admin" or data[1].rank == "mod" then
            TriggerClientEvent('durp:openmodmenu', src) 
        end
    end)
end)

RegisterServerEvent('durp:fixplayercar')
AddEventHandler('durp:fixplayercar', function(t)
	TriggerClientEvent('durp:fixcar', t)
end) 

RegisterServerEvent('raid_clothes:openClothing2')
AddEventHandler('raid_clothes:openClothing2', function(t)
	TriggerClientEvent('durp:fixclothes', t)
end) 

RegisterServerEvent('durp-admin:update:vehicle')
AddEventHandler('durp-admin:update:vehicle', function(data, licensePlate, garagename)
    local src = source
    local plate = licensePlate
    local garage = garagename
	exports.ghmattimysql:execute("UPDATE characters_cars SET vehicle_state = @state, current_garage = @garage WHERE license_plate = @plate",
	{['state'] = 'In', ['garage'] = garage, ['plate'] = plate})
end) 
