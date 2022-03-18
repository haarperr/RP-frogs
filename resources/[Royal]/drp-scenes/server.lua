local scenes = {}

RegisterNetEvent('drp-scenes:fetch', function()
    local src = source
    TriggerClientEvent('drp-scenes:send', src, scenes)
end)

RegisterNetEvent('drp-scenes:add', function(coords, message, color, distance)
    table.insert(scenes, {
        message = message,
        color = color,
        distance = distance,
        coords = coords
    })
    TriggerClientEvent('drp-scenes:send', -1, scenes)
    TriggerEvent('drp-scenes:log', source, message, coords)
end)

RegisterNetEvent('drp-scenes:delete', function(key)
    table.remove(scenes, key)
    TriggerClientEvent('drp-scenes:send', -1, scenes)
end)


RegisterNetEvent('drp-scenes:log', function(id, text, coords)
    local f, err = io.open('sceneLogging.txt', 'a')
    if not f then return print(err) end
    f:write('Player: ['..id..'] Placed Scene: ['..text..'] At Coords = '..coords..'\n')
    f:close()
end)