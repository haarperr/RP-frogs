RegisterNetEvent("drp-burgershot:pay")
AddEventHandler("drp-burgershot:pay", function(amount)
    TriggerServerEvent("server:GroupPayment","burger_shot", amount)
end)

RegisterNetEvent("drp-burgershot:startjob")
AddEventHandler("drp-burgershot:startjob", function()
    local rank = exports["isPed"]:GroupRank("burger_shot")
    local vehicle = GetHashKey('panto')
    if rank >= 1 then     
        RequestModel(vehicle)
    
        while not HasModelLoaded(vehicle) do
            Wait(1)
        end
    
        local plate = "BURGER" .. math.random(1, 100)
        local spawned_car = CreateVehicle(vehicle, -1168.9582519531, -895.20001220703, 13.9296875, 34.015747070312, true, false)
        SetVehicleEngineTorqueMultiplier(spawned_car, 0.2)
        SetVehicleOnGroundProperly(spawned_car)
        SetVehicleNumberPlateText(spawned_car, plate)
        SetPedIntoVehicle(GetPlayerPed(-1), spawned_car, - 1)
        SetModelAsNoLongerNeeded(vehicle)
        TriggerEvent("keys:addNew",spawned_car,plate)
        Citizen.InvokeNative(0xB736A491E64A32CF, Citizen.PointerValueIntInitialized(spawned_car))
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
            FreezeEntityPosition(GetPlayerPed(-1),false)
            ClearPedTasks(GetPlayerPed(-1))
            Citizen.Wait(1000)
            TriggerEvent("animation:PlayAnimation","layspike")
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
            FreezeEntityPosition(GetPlayerPed(-1),true)
            TaskPlayAnim(GetPlayerPed(-1), dict, "coke_cut_v1_coccutter", 3.0, -8, -1, 63, 0, 0, 0, 0 )
            SetEntityHeading(GetPlayerPed(-1), 82.204727172852)
            local finished = exports['drp-taskbar']:taskBar(5000, 'Cutting Up Cow')
            if (finished == 100) then
                TriggerEvent("inventory:removeItem", "cow", 1)
                TriggerEvent('player:receiveItem', 'beef', math.random(10, 20))
                FreezeEntityPosition(GetPlayerPed(-1),false)
                ClearPedTasks(GetPlayerPed(-1))
                Citizen.Wait(1000)
                TriggerEvent("animation:PlayAnimation","layspike")
            end
        else
            TriggerEvent('DoLongHudText', 'You need more cow to process! (Required Amount: 1)', 2)
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
            local finished = exports['drp-taskbar']:taskBar(5000, 'Processing Beef')
            if (finished == 100) then
                TriggerEvent("inventory:removeItem", "beef", 5)
                TriggerEvent('player:receiveItem', 'groundbeef', math.random(3, 4))
                FreezeEntityPosition(GetPlayerPed(-1),false)
                ClearPedTasks(GetPlayerPed(-1))
                Citizen.Wait(1000)
                TriggerEvent("animation:PlayAnimation","layspike")
                Citizen.Wait(1000)
            end
        else
            TriggerEvent('DoLongHudText', 'You need more beef to process! (Required Amount: 5)', 2)
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
            FreezeEntityPosition(GetPlayerPed(-1),true)
            TaskPlayAnim(GetPlayerPed(-1), dict, "coke_cut_v1_coccutter", 3.0, -8, -1, 63, 0, 0, 0, 0 )
            SetEntityHeading(GetPlayerPed(-1), 124.72439575195)
            local finished = exports['drp-taskbar']:taskBar(10000, 'Dropping Fries')
            if (finished == 100) then
                TriggerEvent('player:receiveItem', 'fries', 1)
                TriggerEvent('inventory:removeItem', 'potato', 1)
                FreezeEntityPosition(GetPlayerPed(-1),false)
                ClearPedTasks(GetPlayerPed(-1))
                Citizen.Wait(1000)
            end
        else
            TriggerEvent('DoLongHudText', "You need more patato's (Required Amount: x1)", 2)
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
        TriggerEvent("animation:PlayAnimation","browse")
        FreezeEntityPosition(GetPlayerPed(-1),true)
        local finished = exports['drp-taskbar']:taskBar(10000, 'Making Shake')
        if (finished == 100) then
            TriggerEvent('inventory:removeItem', 'milk', 1)
            TriggerEvent('player:receiveItem', 'mshake', 1)
            FreezeEntityPosition(GetPlayerPed(-1),false)
            ClearPedTasks(GetPlayerPed(-1))
            Citizen.Wait(1000)
            TriggerEvent("animation:PlayAnimation","layspike")
            Citizen.Wait(1000)
        else
            FreezeEntityPosition(GetPlayerPed(-1),false)
        end
    else
        TriggerEvent('DoLongHudText',"You need milk (Required Amount: x1)",2)
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
        TriggerEvent("animation:PlayAnimation","browse")
        FreezeEntityPosition(GetPlayerPed(-1),true)
        local finished = exports['drp-taskbar']:taskBar(10000, 'Making Soft Drink')
        if (finished == 100) then
            TriggerEvent('player:receiveItem', 'softdrink', 1)
            TriggerEvent('inventory:removeItem', 'lqsugar', 1)
            FreezeEntityPosition(GetPlayerPed(-1),false)
            ClearPedTasks(GetPlayerPed(-1))
            Citizen.Wait(1000)
        else
            FreezeEntityPosition(GetPlayerPed(-1),false)
        end
    else
        TriggerEvent('DoLongHudText',"Required Ingridients: 1x Sugar ",2)
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
        TriggerEvent("animation:PlayAnimation","browse")
        FreezeEntityPosition(GetPlayerPed(-1),true)
        local finished = exports['drp-taskbar']:taskBar(10000, 'Pouring Cola')
        if (finished == 100) then
            TriggerEvent('player:receiveItem', 'cola', 1)
            TriggerEvent('inventory:removeItem', 'lqsugar', 1)
            FreezeEntityPosition(GetPlayerPed(-1),false)
            ClearPedTasks(GetPlayerPed(-1))
            Citizen.Wait(1000)
            TriggerEvent("animation:PlayAnimation","layspike")
            Citizen.Wait(1000)
        else
            FreezeEntityPosition(GetPlayerPed(-1),false)
        end
    else
        TriggerEvent('DoLongHudText',"You need more sugar (Required Amount: x1)",2)
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
        TriggerEvent('DoLongHudText',"Nothing to trade in.",2)
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
        TriggerEvent("animation:PlayAnimation","browse")
        FreezeEntityPosition(GetPlayerPed(-1),true)
        local finished = exports['drp-taskbar']:taskBar(10000, 'Pouring Water')
        if (finished == 100) then
            TriggerEvent('player:receiveItem', 'water', 1)
            FreezeEntityPosition(GetPlayerPed(-1),false)
            ClearPedTasks(GetPlayerPed(-1))
        else
            FreezeEntityPosition(GetPlayerPed(-1),false)
        end
    end
end)

function LoadDict(dict)
    RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
	  	Citizen.Wait(10)
    end
end

--// Stash

RegisterNetEvent('drp-burgershot:stash')
AddEventHandler('drp-burgershot:stash', function()
    local job = exports["isPed"]:GroupRank('burger_shot')
    if job >= 1 then
		TriggerEvent("server-inventory-open", "1", "storage-burger_shot")
		Wait(1000)
    else
        TriggerEvent('DoLongHudText', 'You do not work here !',2)
        end
    end)

    --// Food Warmer

RegisterNetEvent('drp-jobs:burgershot-warmer')
AddEventHandler('drp-jobs:burgershot-warmer', function()
    local job = exports["isPed"]:GroupRank('burger_shot')
    if job >= 1 then
		TriggerEvent("server-inventory-open", "1", "storage-burger_warmer")
		Wait(1000)
    else
        TriggerEvent('DoLongHudText', 'You do not work here !',2)
        end
    end)


--// Counter

RegisterNetEvent('drp-burgershot:counter')
AddEventHandler('drp-burgershot:counter', function()
    local job = exports["isPed"]:GroupRank('burger_shot')
    if job >= 1 then
		TriggerEvent("server-inventory-open", "1", "counter-burger_shot")
		Wait(1000)
else
    TriggerEvent('DoLongHudText', 'You do not work here !',2)
    end
end)

--// Store

RegisterNetEvent('drp-burgershot:store')
AddEventHandler('drp-burgershot:store', function()
    local job = exports["isPed"]:GroupRank('burger_shot')
    if job >= 1 then
        TriggerEvent("server-inventory-open", "54", "Shop")
		Wait(1000)
    else
        TriggerEvent('DoLongHudText', 'You do not work here !',2)
        end
    end)

--// Make Burgers

RegisterNetEvent('drp-civjobs:burgershot-heartstopper')
AddEventHandler('drp-civjobs:burgershot-heartstopper', function()
    local ped = PlayerPedId()
    local job = exports["isPed"]:GroupRank('burger_shot')
    if job >= 1 then
        if exports['drp-inventory']:hasEnoughOfItem('hamburgerpatty', 2) and exports['drp-inventory']:hasEnoughOfItem('lettuce', 1) and exports['drp-inventory']:hasEnoughOfItem('hamburgerbuns', 1) and exports['drp-inventory']:hasEnoughOfItem('tomato', 1) and exports['drp-inventory']:hasEnoughOfItem('cheese', 1) then
            FreezeEntityPosition(ped, true)
            ExecuteCommand('e cokecut')
            local heartstopper = exports['drp-taskbar']:taskBar(5000, 'Cooking Heartstopper')
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
            TriggerEvent('DoLongHudText', 'You dont have the right ingredients', 2)
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
        if exports['drp-inventory']:hasEnoughOfItem('hamburgerbuns', 1) and exports['drp-inventory']:hasEnoughOfItem('hamburgerpatty', 1) and exports['drp-inventory']:hasEnoughOfItem('lettuce', 1) and exports['drp-inventory']:hasEnoughOfItem('tomato', 1) and exports['drp-inventory']:hasEnoughOfItem('cheese', 1) then
            FreezeEntityPosition(ped, true)
            ExecuteCommand('e cokecut')
            local moneyshot = exports['drp-taskbar']:taskBar(5000, 'Cooking Moneyshot')
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
            TriggerEvent('DoLongHudText', 'You dont have the right ingredients', 2)
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
        if exports['drp-inventory']:hasEnoughOfItem('lettuce', 1) and exports['drp-inventory']:hasEnoughOfItem('hamburgerbuns', 1) then
            FreezeEntityPosition(ped, true)
            ExecuteCommand('e cokecut')
            local meatfree = exports['drp-taskbar']:taskBar(5000, 'Cooking Meat Free')
            if (meatfree == 100) then
                FreezeEntityPosition(ped, false)
                TriggerEvent('inventory:removeItem', 'lettuce', 1)
                TriggerEvent('inventory:removeItem', 'hamburgerbuns', 1)
                TriggerEvent('player:receiveItem', 'meatfree', 1)
            else
                FreezeEntityPosition(ped, false)
            end
        else
            TriggerEvent('DoLongHudText', 'You dont have the right ingredients', 2)
        end
    else
        TriggerEvent('DoLongHudText', 'You dont work here', 2)
    end
end)  


RegisterCommand('bsmusic', function()
    local job = exports["isPed"]:GroupRank('burger_shot')
    if job >= 1 then
    TriggerEvent("burgershot:request:song")
    end
     end)

     RegisterCommand('bsmusicv', function()
        local job = exports["isPed"]:GroupRank('burger_shot')
        if job >= 1 then
        TriggerEvent("burgershot:change:volume")
        end
         end)
    


RegisterNetEvent('drp-civjobs:burgershot-bleeder')
AddEventHandler('drp-civjobs:burgershot-bleeder', function()
    local ped = PlayerPedId()
    local job = exports["isPed"]:GroupRank('burger_shot')
    if job >= 1 then
        if exports['drp-inventory']:hasEnoughOfItem('hamburgerbuns', 1) and exports['drp-inventory']:hasEnoughOfItem('lettuce', 1) and exports['drp-inventory']:hasEnoughOfItem('hamburgerpatty', 1) and exports['drp-inventory']:hasEnoughOfItem('cheese', 1) and exports['drp-inventory']:hasEnoughOfItem('tomato', 1) then
            FreezeEntityPosition(ped, true)
            ExecuteCommand('e cokecut')
            local meatfree = exports['drp-taskbar']:taskBar(5000, 'Cooking Bleeder Burger')
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
            TriggerEvent('DoLongHudText', 'You dont have the right ingredients', 2)
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
            {
                id = 1,
                header = "Burger Shot Drinks",
                txt = ""
            },
            {
                id = 2,
                header = "Pour Cola",
                txt = "Pour a nice refreshing Cola",
                params = {
                    event = "drp-burgershot:getcola"
                }
            },
            {
                id = 3,
                header = "Pour Milkshake",
                txt = "Pour a Ice Cold Milkshake",
                params = {
                    event = "drp-burgershot:makeshake"
                }
            },
            {
                id = 4,
                header = "Pour Soft Drink",
                txt = "Pour a monsterous sweet Soft Drink",
                params = {
                    event = "drp-burgershot:soft-drink"
                }
            },
            {
                id = 5,
                header = "Pour A Cup Of Water",
                txt = "Pour a Cup Of Water",
                params = {
                    event = "drp-burgershot:get_water"
                }
            },
            {
                id = 6,
                header = "Close",
                txt = "",
                params = {
                    event = ""
                }
            },
        })
    else
        TriggerEvent('DoLongHudText', 'You do not work here !',2)
    end
end)


RegisterNetEvent('drp-civjobs:burgershot-make-burgers')
AddEventHandler('drp-civjobs:burgershot-make-burgers', function()
    local job = exports["isPed"]:GroupRank('burger_shot')
    if job >= 1 then
        TriggerEvent('drp-context:sendMenu', {
            {
                id = 1,
                header = "Burger Shot Burgers",
                txt = ""
            },
            {
                id = 2,
                header = "Cook Heartstopper",
                txt = "Requires: 1x Burger Buns | 1x Cooked Burger Pattys | 1x Lettuce | 1x Tomato | 1x Cheese",
                params = {
                    event = "drp-civjobs:burgershot-heartstopper"
                }
            },
            {
                id = 3,
                header = "Cook Moneyshot",
                txt = "Requires: 1x Burger Buns | 1x Cooked Burger Patty | 1x Cheese | 1x Lettuce | 1x Tomato",
                params = {
                    event = "drp-civjobs:burgershot-moneyshot"
                }
            },
            {
                id = 4,
                header = "Cook Meat Free",
                txt = "Requires: 1x Burger Buns | 1x Lettuce | 1x Cooked Meat Free Patty",
                params = {
                    event = "drp-civjobs:burgershot-meatfree"
                }
            },
            {
                id = 5,
                header = "Cook Bleeder Burger",
                txt = "Requires: 1x Lettuce | 1x Patty | 1x Burger Buns",
                params = {
                    event = "drp-civjobs:burgershot-bleeder"
                }
            },
        })
    else
        TriggerEvent('DoLongHudText', 'You do not work here !',2)
    end
end)

--// Meat No Meat?

RegisterNetEvent('drp-civjobs:burgershot-make-pattys')
AddEventHandler('drp-civjobs:burgershot-make-pattys', function()
    local job = exports["isPed"]:GroupRank('burger_shot')
    if job >= 1 then
        TriggerEvent('drp-context:sendMenu', {
            {
                id = 1,
                header = "Burger Shot Pattys",
                txt = ""
            },
            {
                id = 2,
                header = "Cook Patty ",
                txt = "Requires: 1x Raw Patty ",
                params = {
                    event = "drp-burgershot:contains-meat"
                }
            },
        })
    else
        TriggerEvent('DoLongHudText', 'You do not work here !',2)
    end
end)

RegisterNetEvent("drp-burgershot:contains-meat")
AddEventHandler("drp-burgershot:contains-meat", function()
    local rank = exports["isPed"]:GroupRank("burger_shot")
    if rank >= 1 then    
        if exports["drp-inventory"]:hasEnoughOfItem("questionablemeat", 1) then 
            local dict = 'anim@amb@business@coc@coc_unpack_cut_left@'
            LoadDict(dict)
            FreezeEntityPosition(GetPlayerPed(-1),true)
            TaskPlayAnim(GetPlayerPed(-1), dict, "coke_cut_v1_coccutter", 3.0, -8, -1, 63, 0, 0, 0, 0 )
            SetEntityHeading(GetPlayerPed(-1), 124.72439575195)
            local finished = exports['drp-taskbar']:taskBar(7500, 'Cooking Patty')
            if (finished == 100) then
                TriggerEvent("inventory:removeItem", "questionablemeat", 1)
                TriggerEvent('player:receiveItem', 'hamburgerpatty', 1)
                FreezeEntityPosition(GetPlayerPed(-1),false)
                ClearPedTasks(GetPlayerPed(-1))
                Citizen.Wait(1000)
            end
        else
            TriggerEvent('DoLongHudText', 'You need more Raw Pattys to cook! (Required Amount: 1)', 2)
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
            FreezeEntityPosition(GetPlayerPed(-1),true)
            TaskPlayAnim(GetPlayerPed(-1), dict, "coke_cut_v1_coccutter", 3.0, -8, -1, 63, 0, 0, 0, 0 )
            SetEntityHeading(GetPlayerPed(-1), 124.72439575195)
            local finished = exports['drp-taskbar']:taskBar(7500, 'Cooking Patty')
            if (finished == 100) then
                TriggerEvent("inventory:removeItem", "questionablemeat", 1)
                TriggerEvent('player:receiveItem', 'hamburgerpatty2', 1)
                FreezeEntityPosition(GetPlayerPed(-1),false)
                ClearPedTasks(GetPlayerPed(-1))
                Citizen.Wait(1000)
            end
        else
            TriggerEvent('DoLongHudText', 'You need more Raw Pattys to cook! (Required Amount: 1)', 2)
        end
    else
        TriggerEvent('DoLongHudText', 'You dont work here', 2)
    end
end)

--// Registers

RegisterNetEvent("burgershot:register")
AddEventHandler("burgershot:register", function(registerID)
    local rank = exports["isPed"]:GroupRank("burger_shot")
    if rank >= 1 then 
        local order = exports["drp-applications"]:KeyboardInput({
            header = "Create Receipt",
            rows = {
                {
                    id = 0,
                    txt = "Amount"
                },
                {
                    id = 1,
                    txt = "Comment"
                }
            }
        })
        if order then
            TriggerServerEvent("burger_shot:OrderComplete", registerID, order[1].input, order[2].input)
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

--// Trade In Recipt

RoyalBurgershotTradeInreceipt = false

Citizen.CreateThread(function()
    exports["drp-polyzone"]:AddBoxZone("royal_burgershot_receipt", vector3(-1187.76, -904.62, 13.98), 1.5, 1.6, {
        name="royal_burgershot_receipt",
        heading=305,
        debugPoly=false,
        minZ=10.78,
        maxZ=14.78
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



RegisterNetEvent("bsdelivery:getJob")
AddEventHandler("bsdelivery:getJob", function()
    local rank = exports["isPed"]:GroupRank("burger_shot")
    TriggerEvent('DoLongHudText', rank, 2)
end)