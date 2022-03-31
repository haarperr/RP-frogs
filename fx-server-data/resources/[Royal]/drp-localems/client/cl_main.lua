local drivingStyle = 2883621
local stopRange = 10.0
local speed = 20.5

RegisterCommand('localems', function()
    local ped = GetPlayerPed(-1)
    local coords = GetEntityCoords(ped)


    local car = GetHashKey("emsnspeedo")
    RequestModel(car)
    while not HasModelLoaded(car) do
        Citizen.Wait(0)
    end


    
    local vehicle = CreateVehicle(car, coords.x+150, coords.y+150, coords.z, 0.0, true, true)
    PlaceObjectOnGroundProperly(vehicle)
    SetEntityInvincible(vehicle, true)
    
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
    
    -- set emergency lights
    SetVehicleIndicatorLights(vehicle, 0, true)

    SetVehicleSiren(vehicle, true)

    local currentCords = GetEntityCoords(vehicle)
    Citizen.Trace(currentCords.x .. " " .. currentCords.y .. " " .. currentCords.z)

    RequestModel("s_m_m_doctor_01")
    while not HasModelLoaded("s_m_m_doctor_01") do
        Citizen.Wait(0)
    end

    local ped = CreatePedInsideVehicle(vehicle, 26, "s_m_m_doctor_01", -1, true, true)
    SetPedIntoVehicle(ped, vehicle, -1)
    SetPedAsEnemy(ped, false)

    SetDriverAbility(ped, 1.0)        
    SetDriverAggressiveness(ped, 0.15)

    PlaceObjectOnGroundProperly(vehicle)
    SetDriveTaskDrivingStyle(ped, drivingStyle)
    TaskVehicleDriveToCoordLongrange(ped, vehicle, coords.x, coords.y, coords.z, speed, 0, vehicle, drivingStyle, stopRange)

    Citizen.Wait(5000)
    SetEntityInvincible(vehicle, false)



end)