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

RegisterNetEvent("drp-cluckinbell:getwater")
AddEventHandler("drp-cluckinbell:getwater", function()
    local job = exports["isPed"]:GroupRank('cluckin_bell')
    if job >= 1 then
        -- freeze player 
        local player = GetPlayerPed(-1)
        FreezeEntityPosition(player, true)
        -- animation
        local finished = exports['drp-taskbar']:taskBar(math.random(4000, 7500), "Filling up water...")
        if finished == 100 then
            TriggerEvent("player:receiveItem", "water", 1)
            FreezeEntityPosition(player, false)
        else
            FreezeEntityPosition(player, false)
        end
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


local cooldown = false

RegisterNetEvent("cluckinbell:get:receipt")
AddEventHandler("cluckinbell:get:receipt", function(registerid)
    if not cooldown then 
        cooldown = true
        TriggerServerEvent('cluckinbell:retreive:receipt', registerid)
        Citizen.Wait(240000)
        cooldown = false
    else
        TriggerEvent('DoLongHudText', 'You have to wait a few seconds before you can pay another meal.', 2)
    end
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
    if job >= 1 then
        TriggerEvent("cluckinbell:request:song")
    end
end)

RegisterCommand('cbmusicv', function()
    local job = exports["isPed"]:GroupRank('cluckin_bell')
    if job >= 1 then
        TriggerEvent("cluckinbell:change:volume")
    end
end)

RegisterNetEvent('drp-cluckinbell:cash:in')
AddEventHandler('drp-cluckinbell:cash:in', function()
    local cid = exports["isPed"]:isPed("cid")
    local amountOfReciepes = exports["drp-inventory"]:getAmountOfItem("burgerReceipt")
    local job = exports["isPed"]:GroupRank('cluckin_bell')
    if job >= 1 then
        TriggerEvent('inventory:removeItem', 'burgerReceipt', amountOfReciepes)
        TriggerServerEvent("cluckinbell:update:pay", cid, amountOfReciepes)
        Wait(1000)
    else
        TriggerEvent('DoLongHudText', 'You do not work here !', 2)
    end
    
end)




dHouses = {
    {x = 31.492990493774, y = 6596.619140625, z = 32.81018447876},
    {x = 11.572845458984, y = 6578.3662109375, z = 33.060623168945},
    {x = -15.09232711792, y = 6557.7416992188, z = 33.240436553955},
    {x = -41.538372039795, y = 6637.4028320312, z = 31.08752822876},
    {x = -9.6467323303223, y = 6654.1987304688, z = 31.712518692017},
    {x = 1.7621871232986, y = 6612.5390625, z = 32.109931945801},
    {x = -26.635080337524, y = 6597.27734375, z = 31.860597610474},
    {x = 35.366596221924, y = 6662.84765625, z = 32.190341949463},
    {x = -356.76190185547, y = 6207.3330078125, z = 31.91400718689},
    {x = -374.45736694336, y = 6191.0849609375, z = 31.72954750061},
    {x = -245.86965942383, y = 6414.3569335938, z = 31.460599899292},
    {x = 495.17916870117, y = -1823.2989501953, z = 28.869707107544},
    {x = 489.60406494141, y = -1714.0977783203, z = 29.706550598145},
    {x = 500.58831787109, y = -1697.1359863281, z = 29.787733078003},
    {x = 419.07574462891, y = -1735.4970703125, z = 29.607694625854},
    {x = 431.14743041992, y = -1725.3588867188, z = 29.601457595825},
    {x = 443.34533691406, y = -1707.3347167969, z = 29.70036315918},
    {x = 368.80645751953, y = -1895.8767089844, z = 25.178525924683},
    {x = 385.10110473633, y = -1881.580078125, z = 26.031482696533},
    {x = 399.43417358398, y = -1865.1263427734, z = 26.715923309326},
    {x = 412.32699584961, y = -1856.2395019531, z = 27.323152542114},
    {x = 427.44403076172, y = -1842.3278808594, z = 28.462642669678},
    {x = 312.01104736328, y = -1956.1602783203, z = 24.625070571899},
    {x = 324.36328125, y = -1937.5997314453, z = 25.018976211548},
    {x = 295.92004394531, y = -1971.8889160156, z = 22.80372428894},
    {x = 291.58758544922, y = -1980.515625, z = 21.600521087646},
    {x = 279.71060180664, y = -1993.9146728516, z = 20.805452346802},
    {x = 256.4538269043, y = -2023.3701171875, z = 19.266801834106},
    {x = 236.01176452637, y = -2046.3182373047, z = 18.379932403564},
    {x = 148.76959228516, y = -1904.4891357422, z = 23.517498016357},
    {x = 128.07450866699, y = -1897.0458984375, z = 23.674228668213},
    {x = 115.33438110352, y = -1887.7604980469, z = 23.927993774414},
    {x = 103.993019104, y = -1885.2415771484, z = 24.304039001465},
    {x = 216.33517456055, y = 620.27862548828, z = 187.75686645508},
    {x = -912.25305175781, y = 777.16571044922, z = 187.01055908203},
    {x = -762.17169189453, y = 430.80480957031, z = 100.17984771729},
    {x = -679.01800537109, y = 512.04656982422, z = 113.52597808838},
    {x = -640.71325683594, y = 520.20758056641, z = 110.06629943848},
    {x = -595.52197265625, y = 530.25726318359, z = 108.06629943848},
    {x = -526.93499755859, y = 517.22058105469, z = 113.1662979126},
    {x = -459.220703125, y = 536.86401367188, z = 121.36630249023},
    {x = -417.94924926758, y = 569.06427001953, z = 125.1662979126},
    {x = -311.78060913086, y = 474.95440673828, z = 111.96630096436},
    {x = -304.98672485352, y = 431.05224609375, z = 110.6662979126},
    {x = -72.793998718262, y = 428.53192138672, z = 113.36630249023},
    {x = -66.838043212891, y = 490.05136108398, z = 144.86483764648},
    {x = -110.07062530518, y = 501.92742919922, z = 143.45491027832},
    {x = -174.52659606934, y = 502.4521484375, z = 137.42042541504},
    {x = -230.21437072754, y = 487.83517456055, z = 128.76806640625},
    {x = -907.65112304688, y = 544.91998291016, z = 100.36024475098},
    {x = -904.60345458984, y = 588.14251708984, z = 101.12745666504},
    {x = -974.55877685547, y = 581.84942626953, z = 103.14652252197},
    {x = -1022.719909668, y = 586.90777587891, z = 103.4294052124},
    {x = -1107.4542236328, y = 594.22204589844, z = 104.45043945312},
    {x = -1125.4201660156, y = 548.62109375, z = 102.56945037842},
    {x = -1146.5546875, y = 545.87408447266, z = 101.89562988281},
    {x = -595.67047119141, y = 393.24130249023, z = 101.88217926025},
    {x = 84.95435333252, y = 561.70123291016, z = 182.73361206055},
    {x = 232.20700073242, y = 672.14221191406, z = 189.97434997559}
}

function Houses()
    local ubicacion = math.random(1, #dHouses)
    local c = dHouses[ubicacion]
    return c
end

local menuList = {
    {"cbballs"},
    {"water"},
    {"cbbowl"},
    {"cbcontroller"},
    {"cbcoupon"},
    {"cbsmoothie"},
    {"cbzinger"},
    {"cbjr"},
    {"cbbucket"},
    {"cbclucker"}, 
    {"cbdrink"}, 
    {"cbfarmers"},
    {"cbfowl"},
    {"cbfries"},
    {"cbfries"},
    {"cbrings"},
    {"cbveggy"},
    {"cbdrink"},
    {"cbsmoothie"},
    {"cbdrink"},
}

local hasJob = false
local currentHouse = nil
local currentMenu = nil
local deliveryVehicle = nil
local onCooldown = false

RegisterNetEvent("drp-cluckin:getdelivery")
AddEventHandler("drp-cluckin:getdelivery", function()
    local rank = exports["isPed"]:GroupRank("cluckin_bell")
    if rank >= 1 then
        if not onCooldown then
            if hasJob == true then
                TriggerEvent("DoLongHudText", "You already have a job!", 2)
            else
                TriggerEvent("cbdelivery:getTheJob")
                onCooldown = true
                -- wait 11 minutes
                Citizen.Wait(600000)
                onCooldown = false
                TriggerEvent('phone:robberynotif', 'Cluckin Bell - Coordinator', "New Delivery Jobs are available!")
            end
        else
            TriggerEvent("DoLongHudText", "We dont have any orders right now!", 2)
        end
    else
        TriggerEvent("DoLongHudText", "You dont work here", 2)
    end
end)

RegisterNetEvent("cbdelivery:getTheJob")
AddEventHandler("cbdelivery:getTheJob", function()
    local amountOfProducts = math.random(2, 6)

    if math.random(1,18) <= 17 then
        if math.random(1, 3) == 1 then
            local amountOfProducts = math.random(3, 10)
        else
            local amountOfProducts = math.random(5, 20) -- Big Delivery Jobs
        end
    end

    -- get random products by amount of products
    local products = {}
    for i = 1, amountOfProducts do
        local product = math.random(1, #menuList)
        table.insert(products, product)
    end

    local productString = ""
    for i = 1, #products do
        -- make a fancy string
        if i == #products then
            productString = productString .. menuList[products[i]][1]
        else
            productString = productString .. menuList[products[i]][1] .. ", "
        end
    end   

    PlaySoundFrontend(-1, "Menu_Accept", "Phone_SoundSet_Default", true)
    TriggerEvent('phone:robberynotif', 'Cluckin Bell - Coordinator',
                 "A customer just called me and want these products:\n" .. productString .. ".")

    currentMenu = products
    hasJob = true
    enterCoords = Houses()
    currentHouse = enterCoords

    Citizen.Wait(45000)

    FoodDeliveryLocation = AddBlipForCoord(enterCoords.x, enterCoords.y,
                                            enterCoords.z)
    SetBlipSprite(FoodDeliveryLocation, 40)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Food Delivery")
    EndTextCommandSetBlipName(FoodDeliveryLocation)
    SetBlipRoute(FoodDeliveryLocation, true)
    SetBlipRouteColour(FoodDeliveryLocation, 29)

    PlaySoundFrontend(-1, "Menu_Accept", "Phone_SoundSet_Default", true)
    TriggerEvent('phone:robberynotif', 'Cluckin Bell - Coordinator',
                    "Ive updated the location of the delivery house on your GPS.")
    SetBlipAsShortRange(FoodDeliveryLocation, false)

    -- remove blip after 10 Minutes
    Citizen.Wait(600000)
    SetBlipRoute(FoodDeliveryLocation, false)
    SetBlipSprite(FoodDeliveryLocation, 0)
    SetBlipAsShortRange(FoodDeliveryLocation, false)

    exports['drp-textui']:hideInteraction() -- Just in case

    if hasJob == true then
        PlaySoundFrontend(-1, "Menu_Accept", "Phone_SoundSet_Default", true)
        TriggerEvent('phone:robberynotif', 'Cluckin Bell - Coordinator',
                        "You took too long, the customer canceled the order.")
        Citizen.Wait()
        hasJob = false
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if hasJob == true and currentHouse ~= nil then
            -- if player is near the delivery location
            if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), currentHouse.x, currentHouse.y, currentHouse.z, true) < 2 then            
			    exports['drp-textui']:showInteraction('[E] Give Food') 
                if IsControlJustReleased(0, 38) then
                    hasJob = false
                    exports['drp-textui']:hideInteraction() -- Just in case
                    TriggerEvent('drp-cluckinbell:giveFoodToCustomer')
                end
            else
	            exports['drp-textui']:hideInteraction()              
            end
        end
    end
end)

RegisterNetEvent("drp-cluckinbell:giveFoodToCustomer")
AddEventHandler("drp-cluckinbell:giveFoodToCustomer", function()
    local finished = exports['drp-taskbar']:taskBar(22500, 'Giving food to customer...')
    if finished == 100 then
        -- try to remove everything from the inventory which is in the currentMenu
        local count = 0
        local maxCount = #currentMenu
        for i = 1, #currentMenu do
            local item = menuList[currentMenu[i]][1]
            Citizen.Trace(item)
            -- has enough item
            if exports["drp-inventory"]:hasEnoughOfItem(item, 1) then
                -- remove item from inventory
                TriggerEvent('inventory:removeItem', item, 1)
                count = count + 1
            end
        end
        TriggerEvent("DoLongHudText", "You delivered the food!", 2)
        SetBlipRoute(FoodDeliveryLocation, false)
        SetBlipSprite(FoodDeliveryLocation, 0)
        SetBlipAsShortRange(FoodDeliveryLocation, false)

        -- count / 3 , rounded up to int
        local reciepesAmount = math.ceil(count / math.random(2.00, 3.00))
        TriggerEvent("player:receiveItem", "burgerReceipt", reciepesAmount)

        -- if 80% of the items are removed
        if count >= maxCount * 0.75 then
            if math.random(1, 111) == 69 then
                TriggerEvent("DoLongHudText", "I dont need this, maybe you find it useful?", 1)
                TriggerEvent("player:receiveItem", "heistusb4")
            end
            if math.random(1, 75) == 69 then
                TriggerEvent("player:receiveItem", "safecrackingkit")
                TriggerEvent("DoLongHudText", "I dont need this, maybe you find it useful?", 1)
            end
            if math.random(1, 75) == 69 then
                TriggerEvent("player:receiveItem", "rollcash", math.random(7,17))
                TriggerEvent("DoLongHudText", "Here is an extra Tip of $" .. information["Price"] .. "!", 1)
            end
            if math.random(1, 3) == 1 then
                TriggerEvent("player:receiveItem", "rollcash", math.random(1,3))
                TriggerEvent("DoLongHudText", "Here is an extra Tip of $" .. information["Price"] .. "!", 1)
            end
        end
    else
        TriggerEvent('phone:robberynotif', 'Cluckin Bell - Coordinator',
                        "You canceled the order.")
    end
end)