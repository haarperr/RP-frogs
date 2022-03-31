local drivingStyle = 1074528293
local stopRange = 10.0
local speed = 20.5
local spawnDistance = 500

RegisterCommand('localems', function()
    local ped = GetPlayerPed(-1)
    local coords = GetEntityCoords(ped)


    local car = GetHashKey("emsnspeedo")
    RequestModel(car)
    while not HasModelLoaded(car) do
        Citizen.Wait(0)
    end


    local heading, vector = GetNthClosestVehicleNode(coords.x, coords.y, coords.z, spawnDistance, 0, 0, 0)
    local sX, sY, sZ = table.unpack(vector)

    Citizen.Trace(sX .. " " .. sY .. " " .. sZ)
    PlaceObjectOnGroundProperly(vehicle)
    SetEntityInvincible(vehicle, true)
    
    cords = GetEntityCoords(vehicle)

    SetVehicleDoorsLocked(vehicle, 4)
    SetVehicleForwardSpeed(vehicle, 120.0)
    SetVehicleEngineOn(vehicle, true, true)
    SetVehicleLights(vehicle, 2)
    SetEntityAsMissionEntity(vehicle, true, true)
    SetVehicleHasBeenOwnedByPlayer(vehicle, true)

    local id = NetworkGetNetworkIdFromEntity(vehicle)
    SetNetworkIdCanMigrate(id, true)
    
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
    SetDriverAggressiveness(ped, 0.05)
    SetPedCanBeKnockedOffVehicle(ped, false)

    PlaceObjectOnGroundProperly(vehicle)
    SetDriveTaskDrivingStyle(ped, drivingStyle)
    TaskVehicleDriveToCoordLongrange(ped, vehicle, coords.x, coords.y, coords.z, speed, 0, vehicle, drivingStyle, stopRange)

    Citizen.Wait(5000)
    



end)