RegisterNetEvent("drp-cluckinbell:openwarmer")
AddEventHandler("drp-cluckinbell:openwarmer", function()
    local job = exports["isPed"]:GroupRank('cluckin_bell')
    if job >= 1 then
        TriggerEvent("server-inventory-open", "1", "storage-cluckin_warmer")
        Wait(1000)
    else
        TriggerEvent('DoLongHudText', 'You do not work here !', 2)
    end
end)

RegisterNetEvent("drp-cluckinbell:openstash")
AddEventHandler("drp-cluckinbell:openstash", function()
    local job = exports["isPed"]:GroupRank('cluckin_bell')
    if job >= 3 then
        TriggerEvent("server-inventory-open", "1", "storage-cluckin-stash")
        Wait(1000)
    else
        TriggerEvent('DoLongHudText', 'You dont have the required Rank for that!', 2)
    end
end)

RegisterNetEvent("drp-cluckinbell:openfrier")
AddEventHandler("drp-cluckinbell:openfrier", function()
    local job = exports["isPed"]:GroupRank('cluckin_bell')
    if job >= 1 then
        TriggerEvent("server-inventory-open", "44000", "Craft");
        Wait(1000)
    else
        TriggerEvent('DoLongHudText', 'You do not work here !', 2)
    end
end)

RegisterNetEvent("drp-cluckinbell:openmakeburger")
AddEventHandler("drp-cluckinbell:openmakeburger", function()
    local job = exports["isPed"]:GroupRank('cluckin_bell')
    if job >= 1 then
        TriggerEvent("server-inventory-open", "45000", "Craft");
        Wait(1000)
    else
        TriggerEvent('DoLongHudText', 'You do not work here !', 2)
    end
end)

RegisterNetEvent("drp-cluckinbell:openmakedrink")
AddEventHandler("drp-cluckinbell:openmakedrink", function()
    local job = exports["isPed"]:GroupRank('cluckin_bell')
    if job >= 1 then
        TriggerEvent("server-inventory-open", "46000", "Craft");
        Wait(1000)
    else
        TriggerEvent('DoLongHudText', 'You do not work here !', 2)
    end
end)


RegisterNetEvent("drp-cluckin:tradein")
AddEventHandler("drp-cluckin:tradein", function()
    local job = exports["isPed"]:GroupRank('cluckin_bell')
    if job >= 1 then
        TriggerEvent("server-inventory-open", "47000", "Craft");
        Wait(1000)
    else
        TriggerEvent('DoLongHudText', 'You do not work here !', 2)
    end
end)


RegisterNetEvent("drp-cluckin:getextraingridients")
AddEventHandler("drp-cluckin:getextraingridients", function()
    local job = exports["isPed"]:GroupRank('cluckin_bell')
    if job >= 1 then
        TriggerEvent("server-inventory-open", "47000", "Craft");
        Wait(1000)
    else
        TriggerEvent('DoLongHudText', 'You do not work here !', 2)
    end
end)


-- // Registers

RegisterNetEvent("cluckinbell:register")
AddEventHandler("cluckinbell:register", function(registerID)
    local rank = exports["isPed"]:GroupRank("cluckin_bell")
    if rank >= 1 then
        local order = exports["drp-applications"]:KeyboardInput({
            header = "Create Receipt",
            rows = {{id = 0, txt = "Amount"}, {id = 1, txt = "Comment"}}
        })
        if order then
            TriggerServerEvent("cluckinbell:OrderComplete", registerID,
                               order[1].input, order[2].input)
        end
    else
        TriggerEvent("DoLongHudText", "You cant use this", 2)
    end
end)


RegisterNetEvent("drp-cluckin:startMinigame")
AddEventHandler("drp-cluckin:startMinigame", function()
    if math.random(1, 100) >= 70 then
        TriggerEvent('inventory:removeItem', "cbcontroller", 1)
    end
    local finished1 = exports["drp-bar"]:taskBar(5000,math.random(4,8))
    if finished1 == 100 then 
        local finished2 = exports["drp-bar"]:taskBar(5000,math.random(4,8))
        if finished2 == 100 then
            local finished3 = exports["drp-bar"]:taskBar(5000,math.random(4,8))
            if finished3 == 100 then
                local finished4 = exports["drp-bar"]:taskBar(5000,math.random(4,8))
                if finished4 == 100 then
                    local finished5 = exports["drp-bar"]:taskBar(5000,math.random(4,8))
                    if finished5 == 100 then
                        local finished6 = exports["drp-bar"]:taskBar(5000,math.random(4,8))
                        if finished6 == 100 then
                            local finished7 = exports["drp-bar"]:taskBar(5000,math.random(4,8))
                            if finished7 == 100 then
                                if math.random(1,50) == 1 then
                                    TriggerEvent('player:receiveItem', "cbcoupongolden", math.random(1))	
                                else
                                    TriggerEvent('player:receiveItem', "cbcoupon", math.random(1,2))	
                                end
                            end
                        end
                    end
                end
            end
        end
    end   
end)



RegisterNetEvent("cluckinbell:get:receipt")
AddEventHandler("cluckinbell:get:receipt", function(registerid)
    TriggerServerEvent('cluckinbell:retreive:receipt', registerid)
end)


RegisterNetEvent("cluckinbell:Tray-1")
AddEventHandler("cluckinbell:Tray-1", function()
    TriggerEvent("server-inventory-open", "1", "cluckinbell_counter_1");
end)

RegisterNetEvent("cluckinbell:Tray-2")
AddEventHandler("cluckinbell:Tray-2", function()
    TriggerEvent("server-inventory-open", "1", "cluckinbell_counter_2");
end)

RegisterNetEvent("drp-cluckinbell:goup")
AddEventHandler("drp-cluckinbell:goup", function()
    local job = exports["isPed"]:GroupRank('cluckin_bell')
    if job >= 1 then
        local finished = exports['drp-taskbar']:taskBar(7500, "Unlocking the Door")
        if finished == 100 then
            SetEntityCoords(GetPlayerPed(-1), -510.9648, -695.0436, 44.0345, 87.0089)
        end
    else
        TriggerEvent('DoLongHudText', 'You do not work here !', 2)
    end
end)



RegisterNetEvent("drp-cluckinbell:godown")
AddEventHandler("drp-cluckinbell:godown", function()
    local job = exports["isPed"]:GroupRank('cluckin_bell')
    if job >= 1 then
        local finished = exports['drp-taskbar']:taskBar(300, "Going down")
        if finished == 100 then
            SetEntityCoords(GetPlayerPed(-1), -501.2915, -693.7147, 33.2178)
            end 
        else
        TriggerEvent('DoLongHudText', 'You do not work here !', 2)
    end
end)



RegisterCommand('cbmusic', function()
    local job = exports["isPed"]:GroupRank('cluckin_bell')
    if job >= 1 then TriggerEvent("cluckinbell:request:song") end
end)

RegisterCommand('cbmusicv', function()
    local job = exports["isPed"]:GroupRank('cluckin_bell')
    if job >= 1 then TriggerEvent("cluckinbell:change:volume") end
end)
