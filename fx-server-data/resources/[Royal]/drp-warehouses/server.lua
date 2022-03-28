RegisterNetEvent("houses:confirmwarehouse")
AddEventHandler("houses:confirmwarehouse", function(warehouses)
    src = source
    local user = exports["drp-base"]:getModule("Player"):GetUser(src)
    local characterId = user:getCurrentCharacter().id
    local done = false
    for i, warehouse in pairs(warehouses) do  
        exports.ghmattimysql:execute("SELECT * FROM `houses2` WHERE keyname = ?", {warehouses[i]["keyName"]}, function(data)
            if not data[1] and done == false then
                done = true
                TriggerClientEvent("houses:finishuywarehouse", True, warehouses[i]["keyName"]) 
                exports.ghmattimysql:execute('INSERT INTO `houses2` (cid, keyname, Name) VALUES (@cid, @keyname, @Name)',{
                    ['@cid'] = characterId,
                    ['@keyname'] = warehouses[i]["keyName"],
                    ['@Name'] = warehouses[i]["locationName"],
                })
            end
        end)
    end
    if done == false then
        TriggerClientEvent("houses:finishuywarehouse", False, warehouses[i]["keyName"])
    end
end)