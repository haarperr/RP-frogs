RegisterCommand('localems', function(source)
    local car = GetHashKey("emsnspeedo")
    RequestModel(car)
    while not HasModelLoaded(car) do
        Citizen.Wait(0)
    end

    local ped = GetPlayerPed(-1)
    local coords = GetEntityCoords(ped)

    coords.x = coords.x + 150
    coords.y = coords.y + 150
    coords.z = coords.z + 150
    local vehicle = CreateVehicle(car, , 0.0, true, false)
    PlaceObjectOnGroundProperly(vehicle)
    SetEntityAsMissionEntity(vehicle, true, true)
    SetVehicleHasBeenOwnedByPlayer(vehicle, true)
    local id = NetworkGetNetworkIdFromEntity(vehicle)
    SetNetworkIdCanMigrate(id, true)
    
    

end)