RPC.register("drp-storageunits:get", function()
    return storage_units
end)


RegisterServerEvent("drp-storageunits:purchase", function(args)
    local src = source
    local user = exports["drp-base"]:getModule("Player"):GetUser(src)
    local purchase_price = tonumber(70000)

    local table = {
        purchase_price = purchase_price,
        storage_owner = user:getCurrentCharacter().id
    }

    if user:getBalance() >= purchase_price then
        user:removeBank(purchase_price)
        exports.ghmattimysql:execute("INSERT INTO storage_units (id, data) VALUES (@id, @data)", {
            ['@id'] = args.storage_unit_id,
            ['@data'] = json.encode(table)
        })

        TriggerClientEvent("DoLongHudText", src, 'Congraduations, you now own storage unit ' ..args.storage_unit_id)
    else
        TriggerClientEvent("DoLongHudText", src, 'Purchase failed, you dont have enough money for this.', 2)
    end
end)

RPC.register("drp-storageunits:occupied", function(storage_unit_id)
    local src = source
    local user = exports["drp-base"]:getModule("Player"):GetUser(src)
    local char_id = user:getCurrentCharacter().id
    exports.ghmattimysql:execute("SELECT * FROM storage_units WHERE id = @id", {['id'] = storage_unit_id}, function(result)
        if result[1] ~= nil then
            local keys = json.decode(result[1].given_access)
            local storage_data = json.decode(result[1].data)
            local storage_owner = storage_data.storage_owner
            local menu_data = {
                {
                    id = 0,
                    header = "Storage Unit: " ..storage_unit_id,
                    txt = ""
                },
                {
                    id = 1,
                    header = "Open Storage",
                    txt = "Opens the storage unit inventory",
                    params = {
                        event = "drp-storageunits:attempt:inventory",
                        args = {
                            id = storage_unit_id,
                        }
                    }
                },   
            
                {
                    id = 3,
                    header = "Manage Access",
                    txt = "Manage who has access and who does not.",
                    params = {
                        event = "drp-storageunits:attempt:access",
                        args = {
                            id = storage_unit_id,
                            isOwner = get_storage_owner(src, storage_unit_id)
                        }
                    }
                },   
            }

            if tonumber(storage_owner) == char_id then
                TriggerClientEvent('drp-context:sendMenu', src, menu_data)  
            else
                for i=1, #keys do
                    if (tonumber(keys[i]) == char_id) then
                        TriggerClientEvent('drp-context:sendMenu', src, menu_data)  
                    end
                end
            end
                
        else
            
            local menu_data = {
                {
                    id = 0,
                    header = "Storage Unit: " ..storage_unit_id,
                    txt = ""
                },
                {
                    id = 1,
                    header = "Attempt Purchase",
                    txt = "Looking for a place to store things?",
                    params = {
                        event = "drp-storageunits:attempt:purchase",
                        args = {
                            id = storage_unit_id,
                            price = 70000
                        }
                    }
                },            
            }
    
    
            TriggerClientEvent('drp-context:sendMenu', src, menu_data)  
            return
        end
    end)
end)    

RPC.register("drp-storageunits:give:access", function(storage_unit_id, given_cid)
    local src = source
    exports.ghmattimysql:execute("SELECT `given_access` FROM storage_units WHERE id = @id", {['id'] = storage_unit_id}, function(result)
        local update_keys = json.decode(result[1].given_access)
        if update_keys ~= "{}" then
            for i=1, #update_keys do
                if (update_keys[i] == given_cid) then
                    TriggerClientEvent("DoLongHudText", src, "They already have access to this unit!", 2)
                    return
                end
            end


            table.insert(update_keys, given_cid)
            exports.ghmattimysql:execute("UPDATE storage_units SET `given_access` = @given_access WHERE `id` = @id", {
                ['@given_access'] = json.encode(update_keys),
                ['@id'] = storage_unit_id
            })
            TriggerClientEvent("DoLongHudText", src, "You have successfully given them keys to your storage unit!", 1)
        else
            local update_keys = json.decode(result[1].given_access)
            table.insert(update_keys, given_cid)
            exports.ghmattimysql:execute("UPDATE storage_units SET `given_access` = @given_access WHERE `id` = @id", {
                ['@given_access'] = json.encode(update_keys),
                ['@id'] = storage_unit_id
            })

            TriggerClientEvent("DoLongHudText", src, "You have successfully given them keys to your storage unit!", 1)
        end
    end)
end)


RPC.register("drp-storageunits:remove:access", function(storage_unit_id, given_cid, given_name)
    local src = source
    local to_remove = tostring(given_cid)
    exports.ghmattimysql:execute("SELECT `given_access` FROM storage_units WHERE id = @id", {['id'] = storage_unit_id}, function(result)
        local update_keys = json.decode(result[1].given_access)
        local index = {}
        for k,v in pairs(update_keys) do
            index[v]=k
        end


        if index[to_remove] == nil then
            TriggerClientEvent("DoLongHudText", src, "CID: " .. to_remove .. " does not have access", 2)
            return 
        end

        table.remove(update_keys, index[to_remove])
        exports.ghmattimysql:execute("UPDATE storage_units SET `given_access` = @given_access WHERE `id` = @id", {
            ['@given_access'] = json.encode(update_keys),
            ['@id'] = storage_unit_id
        })

        TriggerClientEvent("DoLongHudText", src, "You have removed " ..given_name.. "\'s access", 1)
    end)
end)


RegisterServerEvent("drp-storageunit:view", function(storage_unit_id)
    local src = source
    local user = exports["drp-base"]:getModule("Player"):GetUser(src)
    exports.ghmattimysql:execute("SELECT `given_access` FROM storage_units WHERE id = @id", {['id'] = storage_unit_id}, function(result)
        if result[1].given_access ~= nil then
            local current_keys = json.decode(result[1].given_access)
            for i=1, #current_keys do  
                exports.ghmattimysql:execute("SELECT `first_name`, `last_name`, `id` FROM characters WHERE id = @id", {['id'] = current_keys[i]}, function(result)
                    if result[1] ~= nil then
                        for i=1, #result do
                            TriggerClientEvent('drp-context:sendMenu', src, {
                                {
                                    id = result[i].id,
                                    header = "Name: " ..result[i].first_name .. " " .. result[i].last_name,
                                    txt = "CID: " ..result[i].id,
                                    params = {
                                        event = "drp-storageunit:attempt:remove",
                                        args = {
                                            id = storage_unit_id,
                                            character_name = result[i].first_name .. " " .. result[i].last_name,
                                            player_cid = tonumber(result[i].id),
                                        }   
                                    }
                                }, 
                            })  
                        end
                    end
                end)
            end
        end
    end)
end)


function get_storage_owner(src, storage_unit_id)
    local user = exports["drp-base"]:getModule("Player"):GetUser(src)
    local char_id = user:getCurrentCharacter().id
    exports.ghmattimysql:execute("SELECT `data` FROM storage_units WHERE id = @id", {['id'] = storage_unit_id}, function(result)
        if result[1] ~= nil then
            local storage_data = json.decode(result[1].data)
            if (char_id == tonumber(storage_data.storage_owner)) then
                p_state = true
            else
                p_state = false
            end
        end
    end)


    Citizen.Wait(100)
    return p_state
end

RPC.register("drp-storageunits:attenpt:transfer", function(storage_unit_id, transfer_cid)
    local src = source
    local user = exports["drp-base"]:getModule("Player"):GetUser(src)
    local char_id = user:getCurrentCharacter().id
    local isOwner = get_storage_owner(src, storage_unit_id)
    if not isOwner then
        return
    end

    exports.ghmattimysql:execute("SELECT `data` FROM storage_units WHERE id = @id", {['id'] = storage_unit_id}, function(result)
        if result[1] ~= nil then
            local storage_data = json.decode(result[1].data)
            local storage_price = storage_data.purchase_price

            local re_table = {
                purchase_price = storage_price,
                storage_owner = transfer_cid
            }
        
            exports.ghmattimysql:execute("UPDATE storage_units SET `data` = @data WHERE `id` = @id", {
                ['@data'] = json.encode(re_table),
                ['@id'] = storage_unit_id
            })

            TriggerClientEvent("DoLongHudText", src, "You have successfully transfered ownership!", 1)
        end
    end)
end)