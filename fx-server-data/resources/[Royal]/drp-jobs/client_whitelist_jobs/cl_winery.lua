local nearPicking = false

Citizen.CreateThread(function()
    exports["drp-polyzone"]:AddBoxZone("winery_picking", vector3(-1887.05, 2108.06, 139.52), 18.8, 46.6,  {
		name="winery_picking",
		heading=177,
    }) 
    exports["drp-polyzone"]:AddBoxZone("potatoslol", vector3(-1840.65234375, 2113.3491210938, 133.95695495605), 18.8, 46.6,  {
		name="potatoslol",
		heading=177,
    }) 
end)

RegisterNetEvent('drp-polyzone:enter')
AddEventHandler('drp-polyzone:enter', function(name)
    if name == "winery_picking" then
        local rank = exports["isPed"]:GroupRank("winery")
		if rank > 0 then 
            nearPicking = true
            AtPoliceBuy()
			exports['drp-textui']:showInteraction(("[E] %s"):format("Pick Grapes"))
        end
    end
    if name == "potato" then
        local rank = exports["isPed"]:GroupRank("winery")
		if rank > 0 then 
            nearPicking = true
            PickTaters()
			exports['drp-textui']:showInteraction(("[E] %s"):format("Harvest Potatos"))
        end
    end
end)




RegisterNetEvent('drp-polyzone:exit')
AddEventHandler('drp-polyzone:exit', function(name)
    if name == "winery_picking" then
        nearPicking = false
    end
    exports['drp-textui']:hideInteraction()
end)

function AtPoliceBuy()
	Citizen.CreateThread(function()
        while nearPicking do
            Citizen.Wait(5)
            local plate = GetVehicleNumberPlateText(vehicle)
            local rank = exports["isPed"]:GroupRank("winery")
            if rank > 0 then 
                if IsControlJustReleased(0, 38) then
                    local ped = PlayerPedId()
                    local rank = exports["isPed"]:GroupRank("winery")
                    if rank > 0 then 
                        LoadAnim('mp_common_heist')
                        FreezeEntityPosition(ped,true)
                        Citizen.Wait(500)
                        ClearPedTasksImmediately(ped)
                        TaskPlayAnim(ped, "mp_common_heist", 'use_terminal_loop', 2.0, 2.0, -1, 1, 0, true, true, true)
                        local finished = exports['drp-taskbar']:taskBar(math.random(5000, 10000), 'Picking Grapes')
                        if (finished == 100) then
                            local chance = math.random(0, 1)
                            FreezeEntityPosition(ped,false)
                            if chance == 0 then
                                TriggerEvent('player:receiveItem', 'grapes')
                            elseif chance == 1 then 
                                TriggerEvent('player:receiveItem', 'grapes', math.random(2,4))
                            end
                        else
                            FreezeEntityPosition(ped,false)
                        end
                    else
                        TriggerEvent('DoLongHudText', 'You cant do that', 2)
                    end
                end
            end
        end
    end)
end

function PickTaters()
	Citizen.CreateThread(function()
        while nearPicking do
            Citizen.Wait(5)
            local plate = GetVehicleNumberPlateText(vehicle)
            local rank = exports["isPed"]:GroupRank("winery")
            if rank > 0 then 
                if IsControlJustReleased(0, 38) then
                    local ped = PlayerPedId()
                    local rank = exports["isPed"]:GroupRank("winery")
                    if rank > 0 then 
                        LoadAnim('mp_common_heist')
                        FreezeEntityPosition(ped,true)
                        Citizen.Wait(500)
                        ClearPedTasksImmediately(ped)
                        --TaskPlayAnim( player, "pickup_object", "pickup_low", 8.0, 1.0, -1, 16, 0, 0, 0, 0 )
                        TaskPlayAnim(ped, "pickup_object", "pickup_low", 2.0, 2.0, -1, 1, 0, true, true, true)
                        local finished = exports['drp-taskbar']:taskBar(math.random(5000, 10000), 'Harvesting Potatos')
                        if (finished == 100) then
                            local chance = math.random(0, 1)
                            FreezeEntityPosition(ped,false)
                            if chance == 0 then
                                TriggerEvent('player:receiveItem', 'potato')
                            elseif chance == 1 then 
                                TriggerEvent('player:receiveItem', 'potato', math.random(2,4))
                            end
                        else
                            FreezeEntityPosition(ped,false)
                        end
                    else
                        TriggerEvent('DoLongHudText', 'You cant do that', 2)
                    end
                end
            end
        end
    end)
end

function LoadAnim(animDict)
	RequestAnimDict(animDict)
	while not HasAnimDictLoaded(animDict) do
		Citizen.Wait(10)
	end
end


RegisterNetEvent('drp-jobs:break-grapes-purple:winery')
AddEventHandler('drp-jobs:break-grapes-purple:winery', function()
    local rank = exports["isPed"]:GroupRank("winery")
    if rank > 0 then 
        if exports['drp-inventory']:hasEnoughOfItem('grapes', 10) then
            FreezeEntityPosition(GetPlayerPed(-1),true)
            TriggerEvent("animation:PlayAnimation","cokecut")
            SetEntityHeading(GetPlayerPed(-1), 3.5432)
            local cooking = exports['drp-taskbar']:taskBar(5000, 'Chopping Grapes')
            if (cooking == 100) then
                TriggerEvent("inventory:removeItem","grapes", 10)
                Wait(1000)
                FreezeEntityPosition(GetPlayerPed(-1),false)
                TriggerEvent('player:receiveItem', 'grapesp', 3)
            else
                FreezeEntityPosition(GetPlayerPed(-1),false)
                TriggerEvent('DoLongHudText', 'You burnt yourself scream for help', 2)
            end
        else
            TriggerEvent('DoLongHudText', 'Required: 10x Grapes')
        end
    else
        TriggerEvent('DoLongHudText', 'You cant do that', 2)
    end
end)


RegisterNetEvent('drp-jobs:cook-grapes-purple:winery')
AddEventHandler('drp-jobs:cook-grapes-purple:winery', function()
    local rank = exports["isPed"]:GroupRank("winery")
    if rank > 0 then 
        if exports['drp-inventory']:hasEnoughOfItem('grapesp', 3) then
            FreezeEntityPosition(GetPlayerPed(-1),true)
            TriggerEvent("animation:PlayAnimation","cokecut")
            SetEntityHeading(GetPlayerPed(-1), 274.96063232422)
            local cooking = exports['drp-taskbar']:taskBar(5000, 'Cooking Down Grapes')
            if (cooking == 100) then
                TriggerEvent("inventory:removeItem","grapesp", 3)
                Wait(1000)
                FreezeEntityPosition(GetPlayerPed(-1),false)
                TriggerEvent('player:receiveItem', 'kennyred', 1)
            else
                FreezeEntityPosition(GetPlayerPed(-1),false)
                TriggerEvent('DoLongHudText', 'You burnt yourself scream for help', 2)
            end
        else
            TriggerEvent('DoLongHudText', 'Required: 3x Processed Grapes')
        end
    else
        TriggerEvent('DoLongHudText', 'You cant do that', 2)
    end
end)


RegisterNetEvent('drp-jobs:cook-grapes-green:winery')
AddEventHandler('drp-jobs:cook-grapes-green:winery', function()
    local rank = exports["isPed"]:GroupRank("winery")
    if rank > 0 then 
        if exports['drp-inventory']:hasEnoughOfItem('grapesp', 3) then
            FreezeEntityPosition(GetPlayerPed(-1),true)
            TriggerEvent("animation:PlayAnimation","cokecut")
            SetEntityHeading(GetPlayerPed(-1), 274.96063232422)
            local cooking = exports['drp-taskbar']:taskBar(5000, 'Cooking Down Grapes')
            if (cooking == 100) then
                TriggerEvent("inventory:removeItem","grapesp", 3)
                Wait(1000)
                FreezeEntityPosition(GetPlayerPed(-1),false)
                TriggerEvent('player:receiveItem', 'kennywhite', 1)
            else
                FreezeEntityPosition(GetPlayerPed(-1),false)
                TriggerEvent('DoLongHudText', 'You burnt yourself scream for help', 2)
            end
        else
            TriggerEvent('DoLongHudText', 'Required: 3x Processed Grapes')
        end
    else
        TriggerEvent('DoLongHudText', 'You cant do that', 2)
    end
end)

RegisterNetEvent('drp-jobs:winery-stash')
AddEventHandler('drp-jobs:winery-stash', function()
    local job = exports["isPed"]:GroupRank('winery')
    if job >= 1 then
		TriggerEvent("server-inventory-open", "1", "winery_fridge")
		Wait(1000)
	end
end)

RegisterNetEvent('drp-jobs:grabGlass')
AddEventHandler('drp-jobs:grabGlass', function()
    local job = exports["isPed"]:GroupRank('winery')
    if job >= 1 then
        TriggerEvent("player:receiveItem","wineglass", 1)
		Wait(1000)
	end
end)


RegisterNetEvent('drp-jobs:pourWhiteWine')
AddEventHandler('drp-jobs:pourWhiteWine', function()
    local rank = exports["isPed"]:GroupRank("winery")
    if rank > 0 then 
        if exports['drp-inventory']:hasEnoughOfItem('kennywhitebottle', 1) and exports['drp-inventory']:hasEnoughOfItem('wineglass', 1) then
            FreezeEntityPosition(GetPlayerPed(-1),true)
            TriggerEvent("animation:PlayAnimation","cokecut")
            local cooking = exports['drp-taskbar']:taskBar(5000, 'Pouring A Glass Of Kenny White')
            if (cooking == 100) then
                TriggerEvent("inventory:removeItem","kennywhitebottle", 1)
                TriggerEvent("inventory:removeItem","wineglass", 1)
                Wait(1000)
                FreezeEntityPosition(GetPlayerPed(-1),false)
                TriggerEvent('player:receiveItem', 'kennywhite', math.random(2,4))
            else
                FreezeEntityPosition(GetPlayerPed(-1),false)
                TriggerEvent('DoLongHudText', 'You burnt yourself scream for help!', 2)
            end
        else
            TriggerEvent('DoLongHudText', 'Required: 1x Kenny White Bottle | x1 Empty Wine Glass')
        end
    else
        TriggerEvent('DoLongHudText', 'You cant do that', 2)
    end
end)

RegisterNetEvent('drinkwine')
AddEventHandler('drinkwine', function()
        TriggerEvent("Evidence:StateSet",27,6000) -- Coffee Effect
        SetPlayerMaxArmour(PlayerId(), 100 ) -- Armor
        SetPedArmour( player, 100 )
        TriggerEvent("drp-hud:updateStress",false,300)  -- Stress Relief
        
end)


RegisterNetEvent('drp-jobs:pourRedWine')
AddEventHandler('drp-jobs:pourRedWine', function()
    local rank = exports["isPed"]:GroupRank("winery")
    if rank > 0 then 
        if exports['drp-inventory']:hasEnoughOfItem('kennyredbottle', 1) and exports['drp-inventory']:hasEnoughOfItem('wineglass', 1) then
            FreezeEntityPosition(GetPlayerPed(-1),true)
            TriggerEvent("animation:PlayAnimation","cokecut")
            local cooking = exports['drp-taskbar']:taskBar(5000, 'Pouring A Glass Of Kenny Red')
            if (cooking == 100) then
                TriggerEvent("inventory:removeItem","kennyredbottle", 1)
                TriggerEvent("inventory:removeItem","wineglass", 1)
                Wait(1000)
                FreezeEntityPosition(GetPlayerPed(-1),false)
                TriggerEvent('player:receiveItem', 'kennyred', math.random(2,4))
            else
                FreezeEntityPosition(GetPlayerPed(-1),false)
                TriggerEvent('DoLongHudText', 'You burnt yourself scream for help!', 2)
            end
        else
            TriggerEvent('DoLongHudText', 'Required: 1x Kenny Red Bottle | x1 Empty Wine Glass')
        end
    else
        TriggerEvent('DoLongHudText', 'You cant do that', 2)
    end
end)

function playerAnim()
	loadAnimDict( "mp_safehouselost@" )
    TaskPlayAnim( PlayerPedId(), "mp_safehouselost@", "package_dropoff", 8.0, 1.0, -1, 16, 0, 0, 0, 0 )
end

RegisterNetEvent("drp-jobs:SellRedWine")
AddEventHandler("drp-jobs:SellRedWine", function()
	if exports["drp-inventory"]:getQuantity("kennyred") >= 5 then
		playerAnim()
		local finished = exports["drp-taskbar"]:taskBar(4000,"Selling Red Wine",true,false,playerVeh)
		if finished == 100 then
			if exports["drp-inventory"]:getQuantity("kennyred") >= 5 then
				ClearPedTasksImmediately(PlayerPedId())
				TriggerEvent('inventory:removeItem', 'kennyred', 5)
				TriggerServerEvent('drp-banking:addMoney', 2500)
			else
                TriggerEvent('DoLongHudText', 'Required: 5x Red Wine', 2)
			end
		end
	else
        TriggerEvent('DoLongHudText', 'Required: 5x Red Wine', 2)
	end
end)

RegisterNetEvent("drp-jobs:SellWhiteWine")
AddEventHandler("drp-jobs:SellWhiteWine", function()
	if exports["drp-inventory"]:getQuantity("kennywhite") >= 5 then
		playerAnim()
		local finished = exports["drp-taskbar"]:taskBar(4000,"Selling White Wine",true,false,playerVeh)
		if finished == 100 then
			if exports["drp-inventory"]:getQuantity("kennywhite") >= 5 then
				ClearPedTasksImmediately(PlayerPedId())
				TriggerEvent('inventory:removeItem', 'kennywhite', 5)
				TriggerServerEvent('drp-banking:addMoney', 2500)
			else
                TriggerEvent('DoLongHudText', 'Required: 5x White Wine', 2)
			end
		end
	else
        TriggerEvent('DoLongHudText', 'Required: 5x White Wine', 2)
	end
end)
