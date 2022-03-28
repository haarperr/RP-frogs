RegisterNetEvent("houses:confirmwarehouse")
AddEventHandler("houses:confirmwarehouse", function(warehouses)
    src = source
    local user = exports["drp-base"]:getModule("Player"):GetUser(src)
    local characterId = user:getCurrentCharacter().id
    if exports["isPed"]:isPed("mycash") >= 200000 then
        for i, warehouse in pairs(warehouses) do  
            exports.ghmattimysql:execute("SELECT * FROM `houses2` WHERE Id = ?", {i}, function(data)
                if not data[1] then
                    TriggerServerEvent('drp-banking:removeMoney', 200000)
                    exports.ghmattimysql:execute('INSERT INTO `houses2` (cid, keyname, Name) VALUES (@cid, @keyname, @Name)',{
                        ['@cid'] = characterId,
                        ['@keyname'] = warehouse["keyName"],
                        ['@Name'] = warehouse["name"]
                        ['@keyname'] = vehicle,
                        ['@Name'] = json.encode(personalvehicle),
                    })
                end
            end)
        end)
    else
        TriggerEvent('DoLongHudText', "You do not have enough money!", 2)
    end
end)