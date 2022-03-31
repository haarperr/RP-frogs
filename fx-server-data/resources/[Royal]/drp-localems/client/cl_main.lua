RegisterCommand('localems', function()
    local ped = GetPlayerPed(-1)
    local coords = GetEntityCoords(ped)


    local car = GetHashKey("emsnspeedo")
    RequestModel(car)
    while not HasModelLoaded(car) do
        Citizen.Wait(0)
    end


    
    local vehicle = CreateVehicle(car, coords.x+150, coords.y+150, coords.z, 0.0, true, false)
    PlaceObjectOnGroundProperly(vehicle)
    
    cords = GetEntityCoords(vehicle)

    local heading, vector = GetNthClosestVehicleNode(cords.x, cords.y, cords.z, 1, 0, 0)
    local sX, sY, sZ = table.unpack(vector)

    SetEntityHeading(vehicle, heading)
    SetEntityCoords(vehicle, sX, sY, sZ)
    
    
    SetVehicleDoorsLocked(vehicle, 4)
    SetVehicleForwardSpeed(vehicle, 120.0)
    SetVehicleEngineOn(vehicle, true, true)
    SetVehicleLights(vehicle, 2)
    SetEntityAsMissionEntity(vehicle, true, true)
    SetVehicleHasBeenOwnedByPlayer(vehicle, true)
    local id = NetworkGetNetworkIdFromEntity(vehicle)
    SetNetworkIdCanMigrate(id, true)
     

    local currentCords = GetEntityCoords(vehicle)
    Citizen.Trace(currentCords.x .. " " .. currentCords.y .. " " .. currentCords.z)

end)