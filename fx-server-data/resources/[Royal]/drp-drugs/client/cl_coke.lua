local CokePlaneSpawnsRoyalRP = {		
	[1] =  { ['x'] = -1648.8000488281, ['y'] = -3144.8703613281, ['z'] = 13.980224609375, ['h'] = 328.81890869141, ['info'] = ' Cocaine Plane Spawn Location 1' },
    [2] =  { ['x'] = -984.75164794922, ['y'] = -3016.1538085938, ['z'] = 14.283569335938, ['h'] = 53.858268737793, ['info'] = ' Cocaine Plane Spawn Location 2' },
    [3] =  { ['x'] = 1732.3121337891, ['y'] = 3311.3669433594, ['z'] = 41.563354492188, ['h'] = 192.75592041016, ['info'] = ' Cocaine Plane Spawn Location 2' },
}

function RoyalCokeCreatingPlane()
	if DoesEntityExist(RoyalCokePlane) then
	    SetVehicleHasBeenOwnedByPlayer(RoyalCokePlane,false)
		SetEntityAsNoLongerNeeded(RoyalCokePlane)
		DeleteEntity(RoyalCokePlane)
	end

    local plane = GetHashKey("duster")
    RequestModel(plane)
    while not HasModelLoaded(plane) do
        Citizen.Wait(0)
    end

    SpawnPlane = math.random(1,#CokePlaneSpawnsRoyalRP)
    local x = CokePlaneSpawnsRoyalRP[SpawnPlane]["x"]
    local y = CokePlaneSpawnsRoyalRP[SpawnPlane]["y"]
    local z = CokePlaneSpawnsRoyalRP[SpawnPlane]["z"]
    local h = CokePlaneSpawnsRoyalRP[SpawnPlane]["h"]
    print(SpawnPlane)
    SetNewWaypoint(x, y)

    RoyalCokePlane = CreateVehicle(plane, x, y, z, h, true, false)

	local pos = GetEntityCoords(RoyalCokePlane, false)
    -- Trigger Dispatch Where Plane is !
    Citizen.CreateThread(function()
        while true do
          Citizen.Wait(5)
          if GetVehiclePedIsIn(PlayerPedId(), false) == RoyalCokePlane then
            RoyalCocaineHeadToDrop()
            return
          end
        end
    end)
end

local RoyalRPCanDropOffPlane = false

function RoyalCocaineHeadToDrop()
    TriggerEvent("chatMessage","EMAIL", 8, "You have come this far, no room for mistakes now ! I will update you soon, for now focus on getting in the air Deliver the plane and ill be in contact !")
    Citizen.Wait(math.random(2500, 5000))
    TriggerEvent("chatMessage","EMAIL", 8, "Your GPS is updated get there in the safest way possible, deliver the plane when the place isnt hot !")
    RoyalRPCanDropOffPlane= true
    SetNewWaypoint(-2235.8901367188, 3273.1647949219)
end

--// Polyzones

RoyalCokePlaneDrop = false

Citizen.CreateThread(function()
    exports["drp-polyzone"]:AddBoxZone("royal_cocaine_plane_drop_off", vector3(-2238.35, 3274.98, 32.81), 20, 21.8, {
        name="royal_cocaine_plane_drop_off",
        heading=330,
        --debugPoly=true,
        minZ=31.61,
        maxZ=35.61
    })
end)

RegisterNetEvent('drp-polyzone:enter')
AddEventHandler('drp-polyzone:enter', function(name)
    if name == "royal_cocaine_plane_drop_off" and RoyalRPCanDropOffPlane and GetVehiclePedIsIn(PlayerPedId(), false) == RoyalCokePlane then
        RoyalCokePlaneDrop = true     
        RoyalCocaineDrop()
		exports['drp-textui']:showInteraction("[E] Drop Off Plane")
    end
end)

RegisterNetEvent('drp-polyzone:exit')
AddEventHandler('drp-polyzone:exit', function(name)
    if name == "royal_cocaine_plane_drop_off" then
        RoyalCokePlaneDrop = false
        exports['drp-textui']:hideInteraction()
    end
end)

function RoyalCocaineDrop()
	Citizen.CreateThread(function()
        while RoyalCokePlaneDrop do
            Citizen.Wait(5)
			if IsControlJustReleased(0, 38) then
                local finishedcoke = exports['drp-taskbar']:taskBar(7500, 'Dropping off plane')
                if (finishedcoke == 100) then
                    exports['drp-textui']:hideInteraction()
                    DeleteEntity(RoyalCokePlane)
                    TriggerEvent("chatMessage","EMAIL", 8, "Drop Off Successful Take this - Anon")
                    TriggerEvent('player:receiveItem', 'cocainebrick', math.random(1, 2))
                    RoyalRPCanDropOffPlane = false
                    RoyalCokePlaneDrop = false
                    Citizen.Wait(3.6e+6)
                    TriggerServerEvent('drp-cocaine:plane:shit')
                end
			end
		end
	end)
end

--// Start Location

RoyalCocaineStart = false

Citizen.CreateThread(function()
    exports["drp-polyzone"]:AddBoxZone("royal_cocaine_plane_start", vector3(1983.0, 3026.3, 47.9), 1, 1.2, {
        name="royal_cocaine_plane_start",
        heading=130,
        --debugPoly=true,
        minZ=49.69,
        maxZ=53.69
    })
end)

RegisterNetEvent('drp-polyzone:enter')
AddEventHandler('drp-polyzone:enter', function(name)
    if name == "royal_cocaine_plane_start" then
        RoyalCocaineStart = true     
        RoyalCocaineStart2()
		exports['drp-textui']:showInteraction("[E] Talk")
    end
end)

RegisterNetEvent('drp-polyzone:exit')
AddEventHandler('drp-polyzone:exit', function(name)
    if name == "royal_cocaine_plane_start" then
        RoyalCocaineStart = false
        exports['drp-textui']:hideInteraction()
    end
end)

function RoyalCocaineStart2()
	Citizen.CreateThread(function()
        while RoyalCocaineStart do
            Citizen.Wait(5)
			if IsControlJustReleased(0, 38) then
                TriggerServerEvent('drp-cocaine:plane:start', 25000)
			end
		end
	end)
end

RegisterNetEvent('drp-cocaine:shitfuckoff')
AddEventHandler('drp-cocaine:shitfuckoff', function()
    TriggerEvent("chatMessage","EMAIL", 8, "Ive updated your GPS Head over there !")
    RoyalCokeCreatingPlane()
end)