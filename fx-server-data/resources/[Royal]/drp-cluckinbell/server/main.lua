--// Cluckin Bell

Registers = {
    [1] = {},
    [2] = {},
    [3] = {},
    [4] = {}
}

RegisterServerEvent('cluckinbell:OrderComplete')
AddEventHandler("cluckinbell:OrderComplete", function(regID, price, comment)
    local insert = {
        owner = source, 
        price = price, 
        comment = comment,
        regID = regID
    }
    Registers[regID] = {}
    table.insert(Registers[regID], insert)
end)

RegisterServerEvent("cluckinbell:retreive:receipt")
AddEventHandler("cluckinbell:retreive:receipt", function(regID)
    local src = source
    local user = exports["drp-base"]:getModule("Player"):GetUser(src)
    local char = user:getCurrentCharacter()
    if Registers[regID] then
        for i = 1, #Registers[regID] do
            if Registers[regID][i].regID == regID then
                local amount = Registers[regID][i].price
                if (tonumber(user:getCash()) >= tonumber(amount)) then
                    user:removeMoney(tonumber(amount))
                    local owner = exports["drp-base"]:getModule("Player"):GetUser(Registers[regID][i].owner)
                    local char = owner:getCurrentCharacter()
                    information = {
                        ["Price"] = tonumber(amount+math.random(1, 75)),
                        ["Creator"] = char.first_name .. " " ..char.last_name,
                        ["Comment"] = Registers[regID][i].comment
                    }

                    TriggerClientEvent("player:receiveItem", Registers[regID][i].owner, "burgerReceipt", 1, true, information)
                    TriggerClientEvent("player:receiveItem", src, "receipt", 1, true, {["Comment"] = "Thanks for your order at Cluckin Bell"})
                    TriggerEvent("cluckinbell:update:registers", regID)
                else
                    TriggerClientEvent("DoLongHudText", src, "You cant afford this payment", 2)
                end
            end
        end
    else
        TriggerClientEvent("DoLongHudText", src, "Payment not ready..", 2)
    end
end) 

RegisterServerEvent("cluckinbell:update:registers")
AddEventHandler("cluckinbell:update:registers", function(regID)
    for k, v in pairs(Registers[regID]) do
        table.remove(Registers[regID], k)
    end
end)

RegisterServerEvent("cluckinbell:update:pay")
AddEventHandler("cluckinbell:update:pay", function(cid)
    local src = source
    local user = exports["drp-base"]:getModule("Player"):GetUser(src)
    local characterId = user:getVar("character").id
    local invname = 'ply-'..characterId
    exports.ghmattimysql:execute("SELECT `slot`, `information` FROM user_inventory2 WHERE name = ? AND `item_id` = ? ORDER BY slot DESC", {invname, "burgerReceipt"}, function(data)
        if data[1] then
            local slot = data[1].slot
            local jsonparse = json.decode(data[1].information)
            exports.ghmattimysql:execute("SELECT `paycheck` FROM characters WHERE id = ?", {characterId}, function(old)
                local before = old[1].paycheck
                exports.ghmattimysql:execute("UPDATE characters SET `paycheck` = @paycheck WHERE `id` = @id", {
                    ['@paycheck'] = old[1].paycheck + jsonparse["Price"],
                    ['@id'] = characterId
                })
                TriggerClientEvent('DoLongHudText', src, 'Your paycheck was updated', 1)
                TriggerClientEvent("Yougotpaid", src, characterId)
                exports.ghmattimysql:execute('DELETE FROM user_inventory2 WHERE `name`= ? AND `item_id`= ? AND `slot`= ?', {invname, "burgerReceipt", slot})
            end)
        else
            TriggerClientEvent("DoLongHudText", src, "You dont have any work receipts to cash in")
        end
    end)
end)


RegisterNetEvent("cluckinbell:Tray-1")
AddEventHandler("cluckinbell:Tray-1", function()
    TriggerEvent("server-inventory-open", "1", "cluckinbell_counter_1");
end)

RegisterNetEvent("cluckinbell:Tray-2")
AddEventHandler("cluckinbell:Tray-2", function()
    TriggerEvent("server-inventory-open", "1", "cluckinbell_counter_2");
end)