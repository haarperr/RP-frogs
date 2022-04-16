RegisterNetEvent("drp-gokart:getkart")
AddEventHandler("drp-gokart:getkart", function()
    local player = GetPlayerPed(-1)

    -- pay 500$
    TriggerServerEvent("drp-gokart:pay", 1)
end)

RegisterNetEvent("drp-gokart:getkart2")
AddEventHandler("drp-gokart:getkart2", function()
    local player = GetPlayerPed(-1)

    -- pay 500$
    TriggerServerEvent("drp-gokart:pay", 2)
end)

RegisterNetEvent("drp-gokart:recievekart")
AddEventHandler("drp-gokart:recievekart", function(where)
    local hash = GetHashKey("veto2")
    Citizen.Trace(tostring(where))
    local cartSpawn = vector4(0,0,0,0)

    if where == 1 then
        cartSpawn = vector4(5472.5215, 254.6226, 19.0711, 359.8210)
    end
    if where == 2 then 
        cartSpawn = vector4(-1145.7225, -2110.7620, 12.5571, 313.3146)
    end
    
    RequestModel(hash)
    while not HasModelLoaded(hash) do
        Wait(1)
    end

    local cart = CreateVehicle("veto2", cartSpawn.x, cartSpawn.y, cartSpawn.z, cartSpawn.w, true, true)
    SetVehicleHasBeenOwnedByPlayer(cart, true)
    SetVehicleNeedsToBeHotwired(cart, false)
    SetVehicleEngineOn(cart, true, true)
    SetVehicleUndriveable(cart, false)

    TriggerEvent("keys:received", GetVehicleNumberPlateText(cart))

    SetPedIntoVehicle(player, cart, -1)
end)

goKartEnter = false
goKartExit = false

Citizen.CreateThread(function()
    exports["drp-polyzone"]:AddBoxZone("gokartexit", vector3(5469.13, 260.61, 20.07), 3, 3, {
        name="gokartexit",
        heading=0,
        --debugPoly=true
    })
end)


RegisterNetEvent('drp-polyzone:enter')
AddEventHandler('drp-polyzone:enter', function(name)
    if name == "gokartexit" then
        goKartExit = true     
        gokartexit()
        exports['drp-textui']:showInteraction("[E] Exit Arena")
        
    end
end)

RegisterNetEvent('drp-polyzone:exit')
AddEventHandler('drp-polyzone:exit', function(name)
    if name == "gokartexit" then
        goKartExit = false
        exports['drp-textui']:hideInteraction()
    end
end)

function gokartexit()
	Citizen.CreateThread(function()
        while goKartExit do
            Citizen.Wait(5)
			if IsControlJustReleased(0, 38) then
                SetEntityCoords(GetPlayerPed(-1), -253.76, -1992.06, 30.15)
			end
		end
	end)
end


Citizen.CreateThread(function()
    exports["drp-polyzone"]:AddBoxZone("gokartenter", vector3(-253.76, -1992.06, 30.15), 3, 3, {
        name="gokartenter",
        heading=75,
        --debugPoly=true
    })
end)


RegisterNetEvent('drp-polyzone:enter')
AddEventHandler('drp-polyzone:enter', function(name)
    if name == "gokartenter" then
        goKartEnter = true     
        gokartenter()
        exports['drp-textui']:showInteraction("[E] Enter GoKart Arena")
    end
end)

RegisterNetEvent('drp-polyzone:exit')
AddEventHandler('drp-polyzone:exit', function(name)
    if name == "gokartenter" then
        goKartEnter = false
        exports['drp-textui']:hideInteraction()
    end
end)

function gokartenter()
    Citizen.CreateThread(function()
        while goKartEnter do
            Citizen.Wait(5)
            if IsControlJustReleased(0, 38) then
                SetEntityCoords(GetPlayerPed(-1), 5468.3887, 260.8097, 20.2208)
                FreezeEntityPosition(GetPlayerPed(-1), true)
                DoScreenFadeOut(250)
                Wait(4000)
                DoScreenFadeIn(250)
                FreezeEntityPosition(GetPlayerPed(-1), false)
                SetEntityCoords(GetPlayerPed(-1), 5468.3887, 260.8097, 20.2208)
            end
        end
    end)
end