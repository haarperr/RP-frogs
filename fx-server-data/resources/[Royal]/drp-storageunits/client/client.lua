RegisterNetEvent("drp-storageunits:attempt:purchase", function(args)
    local menu_data = {
        {
            id = 0,
            header = "Are you sure you want to purchase this?",
            txt = ""
        }, 
        {
            id = 1,
            header = "Purchase",
            txt = "Current Listing Price: "..args.price,
            params = {
                event = "drp-storageunits:purchase",
                args = {
                    storage_unit_id = args.id,
                }
            }
        },            
    }

    TriggerEvent('drp-context:sendMenu', menu_data)
end)

RegisterNetEvent("drp-storageunits:attempt:access", function(args)
    if args.isOwner then
        local menu_data = {
            {
                id = 0,
                header = "< Go Back",
                txt = "Return to main menu.",
                params = {
                    event = "drp-storageunit:return:main"
                }
            }, 
            {
                id = 1,
                header = "Add Access",
                txt = "Gives said CID access to your storage unit",
                params = {
                    event = "drp-storageunits:give:access_cl",
                    args = {
                        storage_unit_id = args.id
                    }
                }
            }, 
            {
                id = 2,
                header = "View Access",
                txt = "See who has access to open your storage unit",
                params = {
                    event = "drp-storageunit:view:access",
                    args = {
                        storage_unit_id = args.id,
                    }
                }
            },     
            {
                id = 3,
                header = "Transfer Ownership",
                txt = "Gives your current ownership to said person.",
                params = {
                    event = "drp-storageunit:transfer:ownership",
                    args = {
                        storage_unit_id = args.id
                    }
                }
            },         
        }

        TriggerEvent('drp-context:sendMenu', menu_data)
    else
        TriggerEvent("DoLongHudText", "You dont have permission to use this!", 2)
    end
end)


RegisterNetEvent("drp-storageunits:purchase", function(args)
    TriggerServerEvent("drp-storageunits:purchase", args)
end)

RegisterNetEvent("drp-storageunits:attempt:inventory", function(args)
    TriggerEvent("server-inventory-open", "1", "storage_unit_"..args.id)
end)

RegisterNetEvent("drp-storageunit:view:access", function(args)
    TriggerServerEvent("drp-storageunit:view", args.storage_unit_id)
end)

RegisterNetEvent("drp-storageunits:give:access_cl", function(args)
    local give_access_id = exports["drp-applications"]:KeyboardInput({
        header = "",
        rows = {
            {
                id = 0,
                txt = "What CID do you want to add?"
            }
        }
    })

    if give_access_id ~= nil and give_access_id[1].input ~= nil then
        RPC.execute('drp-storageunits:give:access', args.storage_unit_id, give_access_id[1].input)
    end
end)

RegisterNetEvent("drp-storageunit:attempt:remove", function(args) 
    local menu_data = {
        {
            id = 0,
            header = "< Go Back",
            txt = "Return to current list of access.",
            params = {
				event = "drp-storageunit:view:access",
                args = {
                    storage_unit_id = args.id,
                }
			}
        }, 
        {
            id = 1,
            header = "Remove " .. args.character_name.. "\'s access",
            txt = "This will remove them from accessing your unit",
            params = {
                event = "drp-storageunit:continue:remove",
                args = {
                    storage_unit_id = args.id,
                    player_cid = args.player_cid,
                    char_name = args.character_name
                }
            }
        },       
    }

    TriggerEvent('drp-context:sendMenu', menu_data)
end)

RegisterNetEvent("drp-storageunit:continue:remove", function(args)
    RPC.execute('drp-storageunits:remove:access', args.storage_unit_id, args.player_cid, args.char_name)
end)

RegisterNetEvent("drp-storageunit:return:main", function()
    RPC.execute("drp-storageunits:occupied", currently_visiting_unit)
end)

RegisterNetEvent("drp-storageunit:transfer:ownership", function(args)
    local transfer_event = exports["drp-applications"]:KeyboardInput({
        header = "",
        rows = {
            {
                id = 0,
                txt = "What CID do you wanna transfer ownership to?"
            }
        }
    })

    if transfer_event ~= nil and transfer_event[1].input ~= nil then
        RPC.execute("drp-storageunits:attenpt:transfer", args.storage_unit_id, transfer_event[1].input)
    end
end)

