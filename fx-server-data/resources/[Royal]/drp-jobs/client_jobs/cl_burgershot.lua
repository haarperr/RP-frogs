RegisterNetEvent("drp-burgershot:pay")
AddEventHandler("drp-burgershot:pay", function(amount)
    TriggerServerEvent("server:GroupPayment", "burger_shot", amount)
end)

RegisterNetEvent("drp-burgershot:startjob")
AddEventHandler("drp-burgershot:startjob", function()
    local rank = exports["isPed"]:GroupRank("burger_shot")
    local vehicle = GetHashKey('panto')
    if rank >= 1 then
        RequestModel(vehicle)

        while not HasModelLoaded(vehicle) do Wait(1) end

        local plate = "BURGER" .. math.random(1, 100)
        local spawned_car = CreateVehicle(vehicle, -1168.9582519531,
                                          -895.20001220703, 13.9296875,
                                          34.015747070312, true, false)
        SetVehicleEngineTorqueMultiplier(spawned_car, 0.2)
        SetVehicleOnGroundProperly(spawned_car)
        SetVehicleNumberPlateText(spawned_car, plate)
        SetPedIntoVehicle(GetPlayerPed(-1), spawned_car, -1)
        SetModelAsNoLongerNeeded(vehicle)
        TriggerEvent("keys:addNew", spawned_car, plate)
        Citizen.InvokeNative(0xB736A491E64A32CF,
                             Citizen.PointerValueIntInitialized(spawned_car))
    else
        TriggerEvent('DoLongHudText', 'You dont work here', 2)
    end
end)

--- Burger >> Beef

RegisterNetEvent("drp-burgershot:startprocess")
AddEventHandler("drp-burgershot:startprocess", function()
    local finished = exports['drp-taskbar']:taskBar(5000, 'Grabbing Cow')
    local rank = exports["isPed"]:GroupRank("burger_shot")
    if rank >= 1 then
        if (finished == 100) then
            TriggerEvent('player:receiveItem', 'cow', 1)
            FreezeEntityPosition(GetPlayerPed(-1), false)
            ClearPedTasks(GetPlayerPed(-1))
            Citizen.Wait(1000)
            TriggerEvent("animation:PlayAnimation", "layspike")
            Citizen.Wait(1000)
        end
    else
        TriggerEvent('DoLongHudText', 'You dont work here', 2)
    end
end)

RegisterNetEvent("drp-burgershot:startprocess2")
AddEventHandler("drp-burgershot:startprocess2", function()
    local rank = exports["isPed"]:GroupRank("burger_shot")
    if rank >= 1 then
        if exports["drp-inventory"]:hasEnoughOfItem("cow", 1) then
            local dict = 'anim@amb@business@coc@coc_unpack_cut_left@'
            LoadDict(dict)
            FreezeEntityPosition(GetPlayerPed(-1), true)
            TaskPlayAnim(GetPlayerPed(-1), dict, "coke_cut_v1_coccutter", 3.0,
                         -8, -1, 63, 0, 0, 0, 0)
            SetEntityHeading(GetPlayerPed(-1), 82.204727172852)
            local finished = exports['drp-taskbar']:taskBar(5000,
                                                            'Cutting Up Cow')
            if (finished == 100) then
                TriggerEvent("inventory:removeItem", "cow", 1)
                TriggerEvent('player:receiveItem', 'beef', math.random(10, 20))
                FreezeEntityPosition(GetPlayerPed(-1), false)
                ClearPedTasks(GetPlayerPed(-1))
                Citizen.Wait(1000)
                TriggerEvent("animation:PlayAnimation", "layspike")
            end
        else
            TriggerEvent('DoLongHudText',
                         'You need more cow to process! (Required Amount: 1)', 2)
        end
    else
        TriggerEvent('DoLongHudText', 'You dont work here', 2)
    end
end)

RegisterNetEvent("drp-burgershot:startprocess3")
AddEventHandler("drp-burgershot:startprocess3", function()
    local rank = exports["isPed"]:GroupRank("burger_shot")
    if rank >= 1 then
        if exports["drp-inventory"]:hasEnoughOfItem("beef", 5) then
            local finished = exports['drp-taskbar']:taskBar(5000,
                                                            'Processing Beef')
            if (finished == 100) then
                TriggerEvent("inventory:removeItem", "beef", 5)
                TriggerEvent('player:receiveItem', 'groundbeef',
                             math.random(3, 4))
                FreezeEntityPosition(GetPlayerPed(-1), false)
                ClearPedTasks(GetPlayerPed(-1))
                Citizen.Wait(1000)
                TriggerEvent("animation:PlayAnimation", "layspike")
                Citizen.Wait(1000)
            end
        else
            TriggerEvent('DoLongHudText',
                         'You need more beef to process! (Required Amount: 5)',
                         2)
        end
    else
        TriggerEvent('DoLongHudText', 'You dont work here', 2)
    end
end)

RegisterNetEvent("drp-burgershot:startfryer")
AddEventHandler("drp-burgershot:startfryer", function()
    local rank = exports["isPed"]:GroupRank("burger_shot")
    if rank >= 1 then
        if exports['drp-inventory']:hasEnoughOfItem('potato', 1) then
            local dict = 'anim@amb@business@coc@coc_unpack_cut_left@'
            LoadDict(dict)
            FreezeEntityPosition(GetPlayerPed(-1), true)
            TaskPlayAnim(GetPlayerPed(-1), dict, "coke_cut_v1_coccutter", 3.0,
                         -8, -1, 63, 0, 0, 0, 0)
            SetEntityHeading(GetPlayerPed(-1), 124.72439575195)
            local finished = exports['drp-taskbar']:taskBar(10000,
                                                            'Dropping Fries')
            if (finished == 100) then
                TriggerEvent('player:receiveItem', 'fries', 1)
                TriggerEvent('inventory:removeItem', 'potato', 1)
                FreezeEntityPosition(GetPlayerPed(-1), false)
                ClearPedTasks(GetPlayerPed(-1))
                Citizen.Wait(1000)
            end
        else
            TriggerEvent('DoLongHudText',
                         "You need more patato's (Required Amount: x1)", 2)
        end
    else
        TriggerEvent('DoLongHudText', 'You dont work here', 2)
    end
end)

RegisterNetEvent("drp-burgershot:makeshake")
AddEventHandler("drp-burgershot:makeshake", function()
    local rank = exports["isPed"]:GroupRank("burger_shot")
    if rank >= 1 then
        if exports['drp-inventory']:hasEnoughOfItem('milk', 1) then
            SetEntityHeading(GetPlayerPed(-1), 121.88976287842)
            TriggerEvent("animation:PlayAnimation", "browse")
            FreezeEntityPosition(GetPlayerPed(-1), true)
            local finished = exports['drp-taskbar']:taskBar(10000,
                                                            'Making Shake')
            if (finished == 100) then
                TriggerEvent('inventory:removeItem', 'milk', 1)
                TriggerEvent('player:receiveItem', 'mshake', 1)
                FreezeEntityPosition(GetPlayerPed(-1), false)
                ClearPedTasks(GetPlayerPed(-1))
                Citizen.Wait(1000)
                TriggerEvent("animation:PlayAnimation", "layspike")
                Citizen.Wait(1000)
            else
                FreezeEntityPosition(GetPlayerPed(-1), false)
            end
        else
            TriggerEvent('DoLongHudText', "You need milk (Required Amount: x1)",
                         2)
        end
    else
        TriggerEvent('DoLongHudText', 'You dont work here', 2)
    end
end)

RegisterNetEvent("drp-burgershot:soft-drink")
AddEventHandler("drp-burgershot:soft-drink", function()
    local rank = exports["isPed"]:GroupRank("burger_shot")
    if rank >= 1 then
        if exports['drp-inventory']:hasEnoughOfItem('lqsugar', 1) then
            SetEntityHeading(GetPlayerPed(-1), 121.88976287842)
            TriggerEvent("animation:PlayAnimation", "browse")
            FreezeEntityPosition(GetPlayerPed(-1), true)
            local finished = exports['drp-taskbar']:taskBar(10000,
                                                            'Making Soft Drink')
            if (finished == 100) then
                TriggerEvent('player:receiveItem', 'softdrink', 1)
                TriggerEvent('inventory:removeItem', 'lqsugar', 1)
                FreezeEntityPosition(GetPlayerPed(-1), false)
                ClearPedTasks(GetPlayerPed(-1))
                Citizen.Wait(1000)
            else
                FreezeEntityPosition(GetPlayerPed(-1), false)
            end
        else
            TriggerEvent('DoLongHudText', "Required Ingridients: 1x Sugar ", 2)
        end
    else
        TriggerEvent('DoLongHudText', 'You dont work here', 2)
    end
end)

RegisterNetEvent("drp-burgershot:getcola")
AddEventHandler("drp-burgershot:getcola", function()
    local rank = exports["isPed"]:GroupRank("burger_shot")
    if rank >= 1 then
        if exports['drp-inventory']:hasEnoughOfItem('lqsugar', 1) then
            SetEntityHeading(GetPlayerPed(-1), 121.88976287842)
            TriggerEvent("animation:PlayAnimation", "browse")
            FreezeEntityPosition(GetPlayerPed(-1), true)
            local finished = exports['drp-taskbar']:taskBar(10000,
                                                            'Pouring Cola')
            if (finished == 100) then
                TriggerEvent('player:receiveItem', 'cola', 1)
                TriggerEvent('inventory:removeItem', 'lqsugar', 1)
                FreezeEntityPosition(GetPlayerPed(-1), false)
                ClearPedTasks(GetPlayerPed(-1))
                Citizen.Wait(1000)
                TriggerEvent("animation:PlayAnimation", "layspike")
                Citizen.Wait(1000)
            else
                FreezeEntityPosition(GetPlayerPed(-1), false)
            end
        else
            TriggerEvent('DoLongHudText',
                         "You need more sugar (Required Amount: x1)", 2)
        end
    else
        TriggerEvent('DoLongHudText', 'You dont work here', 2)
    end
end)

RegisterNetEvent("drp-burgershot:tradein")
AddEventHandler("drp-burgershot:tradein", function()
    local rank = exports["isPed"]:GroupRank("burger_shot")
    if rank >= 1 then
        if exports['drp-inventory']:hasEnoughOfItem('burgerReceipt', 1) then

            TriggerServerEvent('burgershot:receipt:payment')
            TriggerEvent('inventory:removeItem', 'burgerReceipt', 1)

        else
            TriggerEvent('DoLongHudText', "Nothing to trade in.", 2)
        end
    else
        TriggerEvent('DoLongHudText', 'You dont work here', 2)
    end
end)

RegisterNetEvent('drp-burgershot:get_water')
AddEventHandler('drp-burgershot:get_water', function()
    local rank = exports["isPed"]:GroupRank("burger_shot")
    if rank >= 1 then
        SetEntityHeading(GetPlayerPed(-1), 121.88976287842)
        TriggerEvent("animation:PlayAnimation", "browse")
        FreezeEntityPosition(GetPlayerPed(-1), true)
        local finished = exports['drp-taskbar']:taskBar(10000, 'Pouring Water')
        if (finished == 100) then
            TriggerEvent('player:receiveItem', 'water', 1)
            FreezeEntityPosition(GetPlayerPed(-1), false)
            ClearPedTasks(GetPlayerPed(-1))
        else
            FreezeEntityPosition(GetPlayerPed(-1), false)
        end
    end
end)

function LoadDict(dict)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do Citizen.Wait(10) end
end

-- // Stash

RegisterNetEvent('drp-burgershot:stash')
AddEventHandler('drp-burgershot:stash', function()
    local job = exports["isPed"]:GroupRank('burger_shot')
    if job >= 1 then
        TriggerEvent("server-inventory-open", "1", "storage-burger_shot")
        Wait(1000)
    else
        TriggerEvent('DoLongHudText', 'You do not work here !', 2)
    end
end)

-- // Food Warmer

RegisterNetEvent('drp-jobs:burgershot-warmer')
AddEventHandler('drp-jobs:burgershot-warmer', function()
    local job = exports["isPed"]:GroupRank('burger_shot')
    if job >= 1 then
        TriggerEvent("server-inventory-open", "1", "storage-burger_warmer")
        Wait(1000)
    else
        TriggerEvent('DoLongHudText', 'You do not work here !', 2)
    end
end)

-- // Counter

RegisterNetEvent('drp-burgershot:counter')
AddEventHandler('drp-burgershot:counter', function()
    local job = exports["isPed"]:GroupRank('burger_shot')
    if job >= 1 then
        TriggerEvent("server-inventory-open", "1", "counter-burger_shot")
        Wait(1000)
    else
        TriggerEvent('DoLongHudText', 'You do not work here !', 2)
    end
end)

-- // Store

RegisterNetEvent('drp-burgershot:store')
AddEventHandler('drp-burgershot:store', function()
    local job = exports["isPed"]:GroupRank('burger_shot')
    if job >= 1 then
        TriggerEvent("server-inventory-open", "54", "Shop")
        Wait(1000)
    else
        TriggerEvent('DoLongHudText', 'You do not work here !', 2)
    end
end)

-- // Make Burgers

RegisterNetEvent('drp-civjobs:burgershot-heartstopper')
AddEventHandler('drp-civjobs:burgershot-heartstopper', function()
    local ped = PlayerPedId()
    local job = exports["isPed"]:GroupRank('burger_shot')
    if job >= 1 then
        if exports['drp-inventory']:hasEnoughOfItem('hamburgerpatty', 2) and
            exports['drp-inventory']:hasEnoughOfItem('lettuce', 1) and
            exports['drp-inventory']:hasEnoughOfItem('hamburgerbuns', 1) and
            exports['drp-inventory']:hasEnoughOfItem('tomato', 1) and
            exports['drp-inventory']:hasEnoughOfItem('cheese', 1) then
            FreezeEntityPosition(ped, true)
            ExecuteCommand('e cokecut')
            local heartstopper = exports['drp-taskbar']:taskBar(5000,
                                                                'Cooking Heartstopper')
            if (heartstopper == 100) then
                FreezeEntityPosition(ped, false)
                TriggerEvent('inventory:removeItem', 'hamburgerbuns', 1)
                TriggerEvent('inventory:removeItem', 'hamburgerpatty', 2)
                TriggerEvent('inventory:removeItem', 'lettuce', 1)
                TriggerEvent('inventory:removeItem', 'tomato', 1)
                TriggerEvent('inventory:removeItem', 'cheese', 1)
                TriggerEvent('player:receiveItem', 'heartstopper', 1)
                TriggerEvent('DoLongHudText', 'Cooked Heartstopper', 1)
            else
                FreezeEntityPosition(ped, false)
            end
        else
            TriggerEvent('DoLongHudText', 'You dont have the right ingredients',
                         2)
        end
    else
        TriggerEvent('DoLongHudText', 'You dont work here', 2)
    end
end)

RegisterNetEvent('drp-civjobs:burgershot-moneyshot')
AddEventHandler('drp-civjobs:burgershot-moneyshot', function()
    local ped = PlayerPedId()
    local job = exports["isPed"]:GroupRank('burger_shot')
    if job >= 1 then
        if exports['drp-inventory']:hasEnoughOfItem('hamburgerbuns', 1) and
            exports['drp-inventory']:hasEnoughOfItem('hamburgerpatty', 1) and
            exports['drp-inventory']:hasEnoughOfItem('lettuce', 1) and
            exports['drp-inventory']:hasEnoughOfItem('tomato', 1) and
            exports['drp-inventory']:hasEnoughOfItem('cheese', 1) then
            FreezeEntityPosition(ped, true)
            ExecuteCommand('e cokecut')
            local moneyshot = exports['drp-taskbar']:taskBar(5000,
                                                             'Cooking Moneyshot')
            if (moneyshot == 100) then
                FreezeEntityPosition(ped, false)
                TriggerEvent('inventory:removeItem', 'hamburgerbuns', 1)
                TriggerEvent('inventory:removeItem', 'hamburgerpatty', 1)
                TriggerEvent('inventory:removeItem', 'lettuce', 1)
                TriggerEvent('inventory:removeItem', 'tomato', 1)
                TriggerEvent('inventory:removeItem', 'cheese', 1)
                TriggerEvent('player:receiveItem', 'moneyshot', 1)
                TriggerEvent('DoLongHudText', 'Cooked Moneyshot', 1)
            else
                FreezeEntityPosition(ped, false)
            end
        else
            TriggerEvent('DoLongHudText', 'You dont have the right ingredients',
                         2)
        end
    else
        TriggerEvent('DoLongHudText', 'You dont work here', 2)
    end
end)

RegisterNetEvent('drp-civjobs:burgershot-meatfree')
AddEventHandler('drp-civjobs:burgershot-meatfree', function()
    local ped = PlayerPedId()
    local job = exports["isPed"]:GroupRank('burger_shot')
    if job >= 1 then
        if exports['drp-inventory']:hasEnoughOfItem('lettuce', 1) and
            exports['drp-inventory']:hasEnoughOfItem('hamburgerbuns', 1) then
            FreezeEntityPosition(ped, true)
            ExecuteCommand('e cokecut')
            local meatfree = exports['drp-taskbar']:taskBar(5000,
                                                            'Cooking Meat Free')
            if (meatfree == 100) then
                FreezeEntityPosition(ped, false)
                TriggerEvent('inventory:removeItem', 'lettuce', 1)
                TriggerEvent('inventory:removeItem', 'hamburgerbuns', 1)
                TriggerEvent('player:receiveItem', 'meatfree', 1)
            else
                FreezeEntityPosition(ped, false)
            end
        else
            TriggerEvent('DoLongHudText', 'You dont have the right ingredients',
                         2)
        end
    else
        TriggerEvent('DoLongHudText', 'You dont work here', 2)
    end
end)

RegisterCommand('bsmusic', function()
    local job = exports["isPed"]:GroupRank('burger_shot')
    if job >= 1 then TriggerEvent("burgershot:request:song") end
end)

RegisterCommand('bsmusicv', function()
    local job = exports["isPed"]:GroupRank('burger_shot')
    if job >= 1 then TriggerEvent("burgershot:change:volume") end
end)

RegisterNetEvent('drp-civjobs:burgershot-bleeder')
AddEventHandler('drp-civjobs:burgershot-bleeder', function()
    local ped = PlayerPedId()
    local job = exports["isPed"]:GroupRank('burger_shot')
    if job >= 1 then
        if exports['drp-inventory']:hasEnoughOfItem('hamburgerbuns', 1) and
            exports['drp-inventory']:hasEnoughOfItem('lettuce', 1) and
            exports['drp-inventory']:hasEnoughOfItem('hamburgerpatty', 1) and
            exports['drp-inventory']:hasEnoughOfItem('cheese', 1) and
            exports['drp-inventory']:hasEnoughOfItem('tomato', 1) then
            FreezeEntityPosition(ped, true)
            ExecuteCommand('e cokecut')
            local meatfree = exports['drp-taskbar']:taskBar(5000,
                                                            'Cooking Bleeder Burger')
            if (meatfree == 100) then
                FreezeEntityPosition(ped, false)
                TriggerEvent('inventory:removeItem', 'lettuce', 1)
                TriggerEvent('inventory:removeItem', 'hamburgerbuns', 1)
                TriggerEvent('inventory:removeItem', 'hamburgerpatty', 1)
                TriggerEvent('inventory:removeItem', 'tomato', 1)
                TriggerEvent('inventory:removeItem', 'cheese', 1)
                TriggerEvent('player:receiveItem', 'bleederburger', 1)
            else
                FreezeEntityPosition(ped, false)
            end
        else
            TriggerEvent('DoLongHudText', 'You dont have the right ingredients',
                         2)
        end
    else
        TriggerEvent('DoLongHudText', 'You dont work here', 2)
    end
end)

RegisterNetEvent('drp-jobs:burgershot-drinks')
AddEventHandler('drp-jobs:burgershot-drinks', function()
    local job = exports["isPed"]:GroupRank('burger_shot')
    if job >= 1 then
        TriggerEvent('drp-context:sendMenu', {
            {id = 1, header = "Burger Shot Drinks", txt = ""}, {
                id = 2,
                header = "Pour Cola",
                txt = "Pour a nice refreshing Cola",
                params = {event = "drp-burgershot:getcola"}
            }, {
                id = 3,
                header = "Pour Milkshake",
                txt = "Pour a Ice Cold Milkshake",
                params = {event = "drp-burgershot:makeshake"}
            }, {
                id = 4,
                header = "Pour Soft Drink",
                txt = "Pour a monsterous sweet Soft Drink",
                params = {event = "drp-burgershot:soft-drink"}
            }, {
                id = 5,
                header = "Pour A Cup Of Water",
                txt = "Pour a Cup Of Water",
                params = {event = "drp-burgershot:get_water"}
            }, {id = 6, header = "Close", txt = "", params = {event = ""}}
        })
    else
        TriggerEvent('DoLongHudText', 'You do not work here !', 2)
    end
end)

RegisterNetEvent('drp-civjobs:burgershot-make-burgers')
AddEventHandler('drp-civjobs:burgershot-make-burgers', function()
    local job = exports["isPed"]:GroupRank('burger_shot')
    if job >= 1 then
        TriggerEvent('drp-context:sendMenu', {
            {id = 1, header = "Burger Shot Burgers", txt = ""}, {
                id = 2,
                header = "Cook Heartstopper",
                txt = "Requires: 1x Burger Buns | 1x Cooked Burger Pattys | 1x Lettuce | 1x Tomato | 1x Cheese",
                params = {event = "drp-civjobs:burgershot-heartstopper"}
            }, {
                id = 3,
                header = "Cook Moneyshot",
                txt = "Requires: 1x Burger Buns | 1x Cooked Burger Patty | 1x Cheese | 1x Lettuce | 1x Tomato",
                params = {event = "drp-civjobs:burgershot-moneyshot"}
            }, {
                id = 4,
                header = "Cook Meat Free",
                txt = "Requires: 1x Burger Buns | 1x Lettuce | 1x Cooked Meat Free Patty",
                params = {event = "drp-civjobs:burgershot-meatfree"}
            }, {
                id = 5,
                header = "Cook Bleeder Burger",
                txt = "Requires: 1x Lettuce | 1x Patty | 1x Burger Buns",
                params = {event = "drp-civjobs:burgershot-bleeder"}
            }
        })
    else
        TriggerEvent('DoLongHudText', 'You do not work here !', 2)
    end
end)

-- // Meat No Meat?

RegisterNetEvent('drp-civjobs:burgershot-make-pattys')
AddEventHandler('drp-civjobs:burgershot-make-pattys', function()
    local job = exports["isPed"]:GroupRank('burger_shot')
    if job >= 1 then
        TriggerEvent('drp-context:sendMenu', {
            {id = 1, header = "Burger Shot Pattys", txt = ""}, {
                id = 2,
                header = "Cook Patty ",
                txt = "Requires: 1x Raw Patty ",
                params = {event = "drp-burgershot:contains-meat"}
            }
        })
    else
        TriggerEvent('DoLongHudText', 'You do not work here !', 2)
    end
end)

RegisterNetEvent("drp-burgershot:contains-meat")
AddEventHandler("drp-burgershot:contains-meat", function()
    local rank = exports["isPed"]:GroupRank("burger_shot")
    if rank >= 1 then
        if exports["drp-inventory"]:hasEnoughOfItem("questionablemeat", 1) then
            local dict = 'anim@amb@business@coc@coc_unpack_cut_left@'
            LoadDict(dict)
            FreezeEntityPosition(GetPlayerPed(-1), true)
            TaskPlayAnim(GetPlayerPed(-1), dict, "coke_cut_v1_coccutter", 3.0,
                         -8, -1, 63, 0, 0, 0, 0)
            SetEntityHeading(GetPlayerPed(-1), 124.72439575195)
            local finished = exports['drp-taskbar']:taskBar(7500,
                                                            'Cooking Patty')
            if (finished == 100) then
                TriggerEvent("inventory:removeItem", "questionablemeat", 1)
                TriggerEvent('player:receiveItem', 'hamburgerpatty', 1)
                FreezeEntityPosition(GetPlayerPed(-1), false)
                ClearPedTasks(GetPlayerPed(-1))
                Citizen.Wait(1000)
            end
        else
            TriggerEvent('DoLongHudText',
                         'You need more Raw Pattys to cook! (Required Amount: 1)',
                         2)
        end
    else
        TriggerEvent('DoLongHudText', 'You dont work here', 2)
    end
end)

RegisterNetEvent("drp-burgershot:doesnt-contains-meat")
AddEventHandler("drp-burgershot:doesnt-contains-meat", function()
    local rank = exports["isPed"]:GroupRank("burger_shot")
    if rank >= 1 then
        if exports["drp-inventory"]:hasEnoughOfItem("questionablemeat", 1) then
            local dict = 'anim@amb@business@coc@coc_unpack_cut_left@'
            LoadDict(dict)
            FreezeEntityPosition(GetPlayerPed(-1), true)
            TaskPlayAnim(GetPlayerPed(-1), dict, "coke_cut_v1_coccutter", 3.0,
                         -8, -1, 63, 0, 0, 0, 0)
            SetEntityHeading(GetPlayerPed(-1), 124.72439575195)
            local finished = exports['drp-taskbar']:taskBar(7500,
                                                            'Cooking Patty')
            if (finished == 100) then
                TriggerEvent("inventory:removeItem", "questionablemeat", 1)
                TriggerEvent('player:receiveItem', 'hamburgerpatty2', 1)
                FreezeEntityPosition(GetPlayerPed(-1), false)
                ClearPedTasks(GetPlayerPed(-1))
                Citizen.Wait(1000)
            end
        else
            TriggerEvent('DoLongHudText',
                         'You need more Raw Pattys to cook! (Required Amount: 1)',
                         2)
        end
    else
        TriggerEvent('DoLongHudText', 'You dont work here', 2)
    end
end)

-- // Registers

RegisterNetEvent("burgershot:register")
AddEventHandler("burgershot:register", function(registerID)
    local rank = exports["isPed"]:GroupRank("burger_shot")
    if rank >= 1 then
        local order = exports["drp-applications"]:KeyboardInput({
            header = "Create Receipt",
            rows = {{id = 0, txt = "Amount"}, {id = 1, txt = "Comment"}}
        })
        if order then
            TriggerServerEvent("burger_shot:OrderComplete", registerID,
                               order[1].input, order[2].input)
        end
    else
        TriggerEvent("DoLongHudText", "You cant use this", 2)
    end
end)

RegisterNetEvent("burgershot:get:receipt")
AddEventHandler("burgershot:get:receipt", function(registerid)
    TriggerServerEvent('burgershot:retreive:receipt', registerid)
end)

RegisterNetEvent('burgershot:cash:in')
AddEventHandler('burgershot:cash:in', function()
    local cid = exports["isPed"]:isPed("cid")
    TriggerServerEvent("burgershot:update:pay", cid)
end)

-- // Trade In Recipt

RoyalBurgershotTradeInreceipt = false

Citizen.CreateThread(function()
    exports["drp-polyzone"]:AddBoxZone("royal_burgershot_receipt",
                                       vector3(-1187.76, -904.62, 13.98), 1.5,
                                       1.6, {
        name = "royal_burgershot_receipt",
        heading = 305,
        debugPoly = false,
        minZ = 10.78,
        maxZ = 14.78
    })
end)

RegisterNetEvent('drp-polyzone:enter')
AddEventHandler('drp-polyzone:enter', function(name)
    if name == "royal_burgershot_receipt" then
        RoyalBurgershotTradeInreceipt = true
        BurgerShotReceipts()
        local rank = exports["isPed"]:GroupRank("burger_shot")
        if rank >= 1 then
            exports['drp-textui']:showInteraction("[E] Trade In Receipts")
        end
    end
end)

RegisterNetEvent('drp-polyzone:exit')
AddEventHandler('drp-polyzone:exit', function(name)
    if name == "royal_burgershot_receipt" then
        RoyalBurgershotTradeInreceipt = false
        exports['drp-textui']:hideInteraction()
    end
end)

function BurgerShotReceipts()
    Citizen.CreateThread(function()
        while RoyalBurgershotTradeInreceipt do
            Citizen.Wait(5)
            if IsControlJustReleased(0, 38) then
                local rank = exports["isPed"]:GroupRank("burger_shot")
                if rank >= 1 then
                    TriggerEvent('burgershot:cash:in')
                end
            end
        end
    end)
end

dHouses = { -- Houses entry and model
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
    {"bleederburger"}, {"water"}, {"softdrink"}, {"bscoffee"}, {"mshake"},
    {"heartstopper"}, {"applepie"}, {"murdermeal"}, {"moneyshot"}, {"fries"},
    {"fries"}, {"torpedo"}, {"meatfree"}
}

local hasJob = false
local currentHouse = nil
local currentMenu = nil

RegisterNetEvent("bsdelivery:getJob")
AddEventHandler("bsdelivery:getJob", function()
    local rank = exports["isPed"]:GroupRank("burger_shot")
    if rank <= 1 then
        if hasJob == true then
            TriggerEvent("DoLongHudText", "You already have a job!", 2)
        else
            TriggerEvent("bsdelivery:getTheJob")
        end
    else
        TriggerEvent("DoLongHudText", "You dont work here", 2)
    end
end)

RegisterNetEvent("bsdelivery:getTheJob")
AddEventHandler("bsdelivery:getTheJob", function()
    hasJob = true

    local totalCount = math.random(2,5)
    if math.random(1, 10) == 1 then 
        totalCount = math.random(2,10)
    end

    -- get totalCount amount of menuList
    local menu = {}
    for i = 1, totalCount do
        local random = math.random(1, #menuList)
        table.insert(menu, menuList[random])
    end

    -- get every item name
    local items = {}
    



    TriggerEvent('phone:robberynotif', 'Burgershot - Marty Shanks',
                 "One new Order\n\n")
    Citizen.Wait(math.random(1) * 60 * 1000)
    PlaySoundFrontend(-1, "Menu_Accept", "Phone_SoundSet_Default", true)
    enterCoords = Houses()
    HouseRobberyLocation = AddBlipForCoord(enterCoords.x, enterCoords.y,
                                           enterCoords.z)
    SetBlipSprite(HouseRobberyLocation, 40)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("House Robbery")
    EndTextCommandSetBlipName(HouseRobberyLocation)
    SetBlipRoute(HouseRobberyLocation, true)
    SetBlipRouteColour(HouseRobberyLocation, 29)
    TriggerEvent('phone:robberynotif', 'Burgershot - Marty Shanks',
                 "Ive updated the location of the delivery house on your GPS.")

end)
