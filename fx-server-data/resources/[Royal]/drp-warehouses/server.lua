RegisterNetEvent("houses:confirmwarehouse")
AddEventHandler("houses:confirmwarehouse", function(warehouses)
    src = source
    local user = exports["drp-base"]:getModule("Player"):GetUser(src)
    local characterId = user:getCurrentCharacter().id
    for i, warehouse in pairs(warehouses) do  
        exports.ghmattimysql:execute("SELECT * FROM `houses2` WHERE Id = ?", {i}, function(data)
            if not data[1] then
                exports.ghmattimysql:execute('INSERT INTO `houses2` (cid, keyname, Name) VALUES (@cid, @keyname, @Name)',{
                    ['@cid'] = characterId,
                    ['@keyname'] = warehouse["keyName"],
                    ['@Name'] = warehouse["name"],
                })
            end
        end)
    end
end)