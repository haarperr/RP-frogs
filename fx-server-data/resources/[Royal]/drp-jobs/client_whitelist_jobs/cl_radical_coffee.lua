

RegisterNetEvent("radical_coffee:register")
AddEventHandler("radical_coffee:register", function(registerID)
    local rank = exports["isPed"]:GroupRank("radical_coffee")
    if rank > 1 then 
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
            TriggerServerEvent("radical_coffee:OrderComplete", registerID, order[1].input, order[2].input)
        end
    else
        TriggerEvent("DoLongHudText", "You cant use this", 2)
    end
end)

RegisterNetEvent("radical_coffee:get:receipt")
AddEventHandler("radical_coffee:get:receipt", function(registerid)
    TriggerServerEvent('radical_coffee:retreive:receipt', registerid)
end)

-- Trade In Receipts --

RoyalRadicalCoffee = false

Citizen.CreateThread(function()
    exports["drp-polyzone"]:AddBoxZone("royal_radical_coffee_shit", vector3(-596.28, -1052.77, 22.34), 3, 3, {
        name="royal_radical_coffee_shit",
        heading=0,
        --debugPoly=true,
        minZ=19.94,
        maxZ=23.94
    })
end)

RegisterNetEvent('drp-polyzone:enter')
AddEventHandler('drp-polyzone:enter', function(name)
    if name == "royal_radical_coffee_shit" then
        RoyalRadicalCoffee = true     
            local rank = exports["isPed"]:GroupRank("radical_coffee")
            if rank > 1 then 
            RadicalCoffeeReceipts()
            exports['drp-textui']:showInteraction("[E] Trade In Receipts")
        end
    end
end)

RegisterNetEvent('drp-polyzone:exit')
AddEventHandler('drp-polyzone:exit', function(name)
    if name == "royal_radical_coffee_shit" then
        RoyalRadicalCoffee = false
        exports['drp-textui']:hideInteraction()
    end
end)

function RadicalCoffeeReceipts()
	Citizen.CreateThread(function()
        while RoyalRadicalCoffee do
            Citizen.Wait(5)
			if IsControlJustReleased(0, 38) then
                    local rank = exports["isPed"]:GroupRank("radical_coffee")
                    if rank > 1 then 
                    TriggerEvent('radical_coffee:cash:in')
                end
			end
		end
	end)
end

RegisterNetEvent('radical_coffee:cash:in')
AddEventHandler('radical_coffee:cash:in', function()
    local cid = exports["isPed"]:isPed("cid")
    TriggerServerEvent("radical_coffee:update:pay", cid)
end)

-- Main Meals / Sides --

-- Coffee Machine

RegisterNetEvent('drp-jobs:make_coffee')
AddEventHandler('drp-jobs:make_coffee', function()
    local rank = exports['isPed']:GroupRank('radical_coffee')
    if rank > 1 then
        if exports['drp-inventory']:hasEnoughOfItem('coffeebeans', 1) then
            FreezeEntityPosition(GetPlayerPed(-1), true)
            TriggerEvent('animation:PlayAnimation', 'browse')
            local finished = exports['drp-taskbar']:taskBar(5000, 'Making Coffee')
            if finished == 100 then
                if exports['drp-inventory']:hasEnoughOfItem('coffeebeans', 1) then
                    FreezeEntityPosition(GetPlayerPed(-1), false)
                    TriggerEvent('inventory:removeItem', 'coffeebeans', 1)
                    TriggerEvent('player:receiveItem', 'coffee', 1)
                else
                    FreezeEntityPosition(GetPlayerPed(-1), false)
                end
            else
                FreezeEntityPosition(GetPlayerPed(-1), false)
            end
        else
            TriggerEvent('DoLongHudText', 'Required: 1x Coffee Beans')
        end
    end
end)

-- Deserts --

RegisterNetEvent('radical-coffee:strawberry:shortcake')
AddEventHandler('radical-coffee:strawberry:shortcake', function()
    local rank = exports["isPed"]:GroupRank("radical_coffee")
    if rank > 1 then 
        if exports['drp-inventory']:hasEnoughOfItem('flour', 1) and exports['drp-inventory']:hasEnoughOfItem('sugar', 1) and exports['drp-inventory']:hasEnoughOfItem('butter', 1) and exports['drp-inventory']:hasEnoughOfItem('milk', 1) then
            FreezeEntityPosition(GetPlayerPed(-1),true)
            TriggerEvent("animation:PlayAnimation","cokecut")
            SetEntityHeading(GetPlayerPed(-1), 272.1259765625)
            local finished = exports['drp-taskbar']:taskBar(5000, 'Preparing Shortcake')
            if (finished == 100) then
                FreezeEntityPosition(GetPlayerPed(-1),false)
                TriggerEvent('inventory:removeItem', 'flour', 1)
                TriggerEvent('inventory:removeItem', 'sugar', 1)
                TriggerEvent('inventory:removeItem', 'butter', 1)
                TriggerEvent('inventory:removeItem', 'milk', 1)
                Citizen.Wait(4000)
                TriggerEvent('player:receiveItem', 'shortcake')
            end
        else
            TriggerEvent('DoLongHudText', 'Aint got the right shit', 2)
        end
    else
        TriggerEvent('DoLongHudText', 'Get a job', 2)
    end
end)

RegisterNetEvent('drp-radical-coffee:chocolate-cake')
AddEventHandler('drp-radical-coffee:chocolate-cake', function()
    local rank = exports["isPed"]:GroupRank("radical_coffee")
    if rank > 1 then 
        if exports['drp-inventory']:hasEnoughOfItem('butter', 1) and exports['drp-inventory']:hasEnoughOfItem('flour', 1) and exports['drp-inventory']:hasEnoughOfItem('chocolate_chips', 1) and exports['drp-inventory']:hasEnoughOfItem('milk', 1) then
            FreezeEntityPosition(GetPlayerPed(-1),true)
            TriggerEvent("animation:PlayAnimation","cokecut")
            SetEntityHeading(GetPlayerPed(-1), 272.1259765625)
            local finished = exports['drp-taskbar']:taskBar(5000, 'Preparing Cake')
            if (finished == 100) then
                FreezeEntityPosition(GetPlayerPed(-1),false)
                TriggerEvent('inventory:removeItem', 'butter', 1)
                TriggerEvent('inventory:removeItem', 'flour', 1)
                 TriggerEvent('inventory:removeItem', 'milk', 1)
                 TriggerEvent('inventory:removeItem', 'chocolate_chips', 1)
                Citizen.Wait(4000)
                TriggerEvent('player:receiveItem', 'chocolate_cake')
            end
        else
            TriggerEvent('DoLongHudText', 'Aint got the right shit', 2)
        end
    else
        TriggerEvent('DoLongHudText', 'Get a job', 2)
    end
end)

RegisterNetEvent('drp-jobs:prepare_donut_radical_coffee')
AddEventHandler('drp-jobs:prepare_donut_radical_coffee', function()
    local rank = exports['isPed']:GroupRank('radical_coffee')
    if rank > 1 then
        if exports['drp-inventory']:hasEnoughOfItem('flour', 1) and exports['drp-inventory']:hasEnoughOfItem('milk', 1) and exports['drp-inventory']:hasEnoughOfItem('sugar', 1) then 
            FreezeEntityPosition(GetPlayerPed(-1),true)
            TriggerEvent("animation:PlayAnimation","cokecut")
            SetEntityHeading(GetPlayerPed(-1), 272.1259765625)
            local finished = exports['drp-taskbar']:taskBar(5000, 'Preparing Donut')
            if (finished == 100) then
                TriggerEvent('inventory:removeItem', 'flour', 1)
                TriggerEvent('inventory:removeItem', 'milk', 1)
                TriggerEvent('inventory:removeItem', 'sugar', 1)
                TriggerEvent('player:receiveItem', 'donut', 1)
                FreezeEntityPosition(GetPlayerPed(-1),false)
            else
                FreezeEntityPosition(GetPlayerPed(-1),false)
            end
        else
            TriggerEvent('DoLongHudText', 'Required Ingridients: 1x Flour | 1x Milk | 1x Sugar', 2)
        end
    else
        TriggerEvent('DoLongHudText', 'You dont work here', 2)
    end
end)

RegisterNetEvent('drp-radical_coffee-make:cola')
AddEventHandler('drp-radical_coffee-make:cola', function()
    if exports['drp-inventory']:hasEnoughOfIteim('empty_cup', 1) and exports['drp-inventory']:hasEnoughOfItem('sugar', 1) and exports['drp-inventory']:hasEnoughOfItem('water') then
        local finished = exports['drp-taskbar']:taskBar(4000, 'Pouring Cola')
        if (finished == 100) then
            TriggerEvent('inventory:removeItem', 'empty_cup', 1)
            TriggerEvent('inventory:removeItem', 'sugar', 1)
            TriggerEvent('inventory:removeItem', 'water', 1)
            TriggerEvent('player:receiveItem', 'cola', 1)
        end
    else
        TriggerEvent('DoLongHudText', 'Required Ingridients: 1x Empty Cup | 1x Sugar | 1x Water', 2)
    end
end)

-- Fridge --

RegisterNetEvent('drp-radical-coffee:fridge')
AddEventHandler('drp-radical-coffee:fridge', function()
    local rank = exports["isPed"]:GroupRank("radical_coffee")
    if rank > 1 then 
        TriggerEvent("server-inventory-open", "54", "Shop")
    end
end)

-- Context Menus --

RegisterNetEvent('drp-radical-coffee:deserts')
AddEventHandler('drp-radical-coffee:deserts', function()
    local rank = exports["isPed"]:GroupRank("radical_coffee")
    if rank > 1 then 
        TriggerEvent('drp-context:sendMenu', {
            {
                id = 1,
                header = "Radical Coffee Deserts",
                txt = ""
            },
            {
                id = 2,
                header = "Prepare Strawberry Shortcake",
                txt = "Required: 1x Flour | 1x Sugar | 1x Butter | 1x Milk",
                params = {
                    event = "radical-coffee:strawberry:shortcake"
                }
            },
            {
                id = 3,
                header = "Prepare Chocolate Cake",
                txt = "Required: 1x Chocolate Chips | 1x Flour | 1x Butter | 1x Milk",
                params = {
                    event = "drp-radical-coffee:chocolate-cake"
                }
            },
            {
                id = 4,
                header = "Prepare Donut",
                txt = "Required: 1x Flour | 1x Sugar | 1x Milk",
                params = {
                    event = "drp-jobs:prepare_donut_radical_coffee"
                }
            },
            {
                id = 5,
                header = "Close",
                txt = "",
                params = {
                    event = ""
                }
            },
        })
    end
end)

RegisterNetEvent('drp-jobs:radical_coffee:coffee_machine')
AddEventHandler('drp-jobs:radical_coffee:coffee_machine', function()
    local rank = exports['isPed']:GroupRank('radical_coffee')
    if rank > 1 then
        TriggerEvent('drp-context:sendMenu', {
            {
                id = 1,
                header = "Radical Coffee Coffee Machine",
                txt = ""
            },
            {
                id = 2,
                header = "Make Coffee",
                txt = "Required: 1x Coffee Beans",
                params = {
                    event = "drp-jobs:make_coffee"
                }
            },
            {
                id = 3,
                header = "Close",
                txt = "",
                params = {
                    event = ""
                }
            },
        })
    end
end)

-- Stash

RoyalRadicalCoffeeStash = false

Citizen.CreateThread(function()
    exports["drp-polyzone"]:AddBoxZone("radical_coffee_stash", vector3(-585.13, -1055.78, 22.34), 1, 2.5, {
        name="radical_coffee_stash",
        heading=0,
        --debugPoly=true,
        minZ=19.34,
        maxZ=23.34
    })
end)

RegisterNetEvent('drp-polyzone:enter')
AddEventHandler('drp-polyzone:enter', function(name)
    if name == "radical_coffee_stash" then
        RoyalRadicalCoffeeStash = true     
        local rank = exports["isPed"]:GroupRank("radical_coffee")
        if rank > 1 then 
            RadicalCoffeeStash()
            exports['drp-textui']:showInteraction("[E] Stash")
        end
    end
end)

RegisterNetEvent('drp-polyzone:exit')
AddEventHandler('drp-polyzone:exit', function(name)
    if name == "radical_coffee_stash" then
        RoyalRadicalCoffeeStash = false
        exports['drp-textui']:hideInteraction()
    end
end)

function RadicalCoffeeStash()
	Citizen.CreateThread(function()
        while RoyalRadicalCoffeeStash do
            Citizen.Wait(5)
			if IsControlJustReleased(0, 38) then
                local rank = exports["isPed"]:GroupRank("radical_coffee")
                if rank > 1 then 
                    TriggerEvent('server-inventory-open', '1', 'radical_coffee-stash')
                end
			end
		end
	end)
end

-- Radical Coffee Seats | Table On Right

RegisterNetEvent('drp-radical-coffeeSeats_front_1_middle')
AddEventHandler('drp-radical-coffeeSeats_front_1_middle', function()
    SetEntityHeading(GetPlayerPed(-1), 175.74803161621)
    SetEntityCoords(PlayerPedId(), -573.80988769531,-1063.0153808594,21.478393554688)
    TriggerEvent('animation:Chair2')
end)

RegisterNetEvent('drp-radical-coffeeSeats_back_1_middle')
AddEventHandler('drp-radical-coffeeSeats_back_1_middle', function()
    SetEntityHeading(GetPlayerPed(-1), 175.74803161621)
    SetEntityCoords(PlayerPedId(), -573.05932617188,-1063.0153808594,21.478393554688)
    TriggerEvent('animation:Chair2')
end)


RegisterNetEvent('drp-radical-coffeeSeats_front_2_middle')
AddEventHandler('drp-radical-coffeeSeats_front_2_middle', function()
    SetEntityHeading(GetPlayerPed(-1), 0.0)
    SetEntityCoords(PlayerPedId(), -573.80988769531,-1063.6614990234,21.512084960938)
    TriggerEvent('animation:Chair2')
end)

RegisterNetEvent('drp-radical-coffeeSeats_back_2_middle')
AddEventHandler('drp-radical-coffeeSeats_back_2_middle', function()
    SetEntityHeading(GetPlayerPed(-1), 0.0)
    SetEntityCoords(PlayerPedId(), -573.00659179688,-1063.6614990234,21.512084960938)
    TriggerEvent('animation:Chair2')
end)

-- Radical Coffee Seats | Table On Left

RegisterNetEvent('drp-radical-coffeeSeats_front_1_left_table')
AddEventHandler('drp-radical-coffeeSeats_front_1_left_table', function()
    SetEntityHeading(GetPlayerPed(-1), 0.0)
    SetEntityCoords(PlayerPedId(), -573.87689208984,-1060.0016845703,21.455776367188)
    TriggerEvent('animation:Chair2')
end)

RegisterNetEvent('drp-radical-coffeeSeats_front_2_left_table')
AddEventHandler('drp-radical-coffeeSeats_front_2_left_table', function()
    SetEntityHeading(GetPlayerPed(-1), 175.74803161621)
    SetEntityCoords(PlayerPedId(), -573.89013671875,-1059.3231201172,21.454359179688)
    TriggerEvent('animation:Chair2')
end)


RegisterNetEvent('drp-radical-coffeeSeats_front_3_left_table')
AddEventHandler('drp-radical-coffeeSeats_front_3_left_table', function()
    SetEntityHeading(GetPlayerPed(-1), 175.74803161621)
    SetEntityCoords(PlayerPedId(), -572.96704101562,-1059.4549560547,21.495239257812)
    TriggerEvent('animation:Chair2')
end)

RegisterNetEvent('drp-radical-coffeeSeats_back_4_left_table')
AddEventHandler('drp-radical-coffeeSeats_back_4_left_table', function()
    SetEntityHeading(GetPlayerPed(-1), 0.0)
    SetEntityCoords(PlayerPedId(), -573.05932617188,-1060.0747070312,21.5444776367188)
    TriggerEvent('animation:Chair2')
end)

-- Radical Coffee Seats | Table On right

RegisterNetEvent('drp-radical-coffeeSeats_front_1_right_table') -- Front Right
AddEventHandler('drp-radical-coffeeSeats_front_1_right_table', function()
    SetEntityHeading(GetPlayerPed(-1), 0.0)
    SetEntityCoords(PlayerPedId(), -573.85052490234,-1067.4066162109,21.513159179688)
    TriggerEvent('animation:Chair2')
end)

RegisterNetEvent('drp-radical-coffeeSeats_front_3_right_table') -- Front Left
AddEventHandler('drp-radical-coffeeSeats_front_3_right_table', function()
    SetEntityHeading(GetPlayerPed(-1), 175.74803161621)
    SetEntityCoords(PlayerPedId(), -573.89013671875,-1066.8395996094,21.525850585938)
    TriggerEvent('animation:Chair2')
end)

RegisterNetEvent('drp-radical-coffeeSeats_back_2_right_table') -- Back Left
AddEventHandler('drp-radical-coffeeSeats_back_2_right_table', function()
    SetEntityHeading(GetPlayerPed(-1), 175.74803161621)
    SetEntityCoords(PlayerPedId(), -572.96704101562,-1066.8395996094,21.504313476562)
    TriggerEvent('animation:Chair2')
end)

RegisterNetEvent('drp-radical-coffeeSeats_back_4_right_table') -- Back Right
AddEventHandler('drp-radical-coffeeSeats_back_4_right_table', function()
    SetEntityHeading(GetPlayerPed(-1), 0.0)
    SetEntityCoords(PlayerPedId(), -573.11206054688,-1067.5120849609,21.452622070312)
    TriggerEvent('animation:Chair2')
end)