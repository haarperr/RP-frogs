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
                                local finished8 = exports["drp-bar"]:taskBar(5000,math.random(4,8))
                                if finished8 == 100 then
                                    local finished9 = exports["drp-bar"]:taskBar(5000,math.random(4,8))
                                    if finished9 == 100 then
                                        local finished10 = exports["drp-bar"]:taskBar(5000,math.random(4,8))
                                        if finished10 == 100 then
                                            if math.random(1,100) == 1 then
                                                TriggerEvent('player:receiveItem', "cbcoupongolden", math.random(1))	
                                            else
                                                TriggerEvent('player:receiveItem', "cbcoupon", math.random(1,3))	
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end   
end)






    