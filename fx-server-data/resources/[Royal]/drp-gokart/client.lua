RegisterNetEvent("drp-gokart:getkart")
AddEventHandler("drp-gokart:getkart", function()
    local player = GetPlayerPed(-1)

    -- pay 500$
    TriggerServerEvent("drp-gokart:pay")
end)

RegisterNetEvent("drp-gokart:recievekart")
AddEventHandler("drp-gokart:recievekart", function()
    local hash = GetHashKey("veto2")

    local cartSpawn = vector4(5472.5215, 254.6226, 19.0711, 359.8210)
    
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
                SetEntityCoords(GetPlayerPed(-1), 5472.5215, 254.6226, 19.0711)
            end
        end
    end)
end