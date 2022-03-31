local drivingStyle = 1074528293
local stopRange = 10.0
local speed = 20.5
local spawnDistance = 500

local currentEmsVehicle = 0
local currentEmsDriver = 0

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
    vehicle = CreateVehicle("emsnspeedo", sX, sY, sZ, heading, true, true)

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

    -- Flags
    SetEntityAsMissionEntity(ped, true, true)
    SetPedAsEnemy(ped, false)
    SetPedCanPlayAmbientAnims(ped, false)
    SetPedCanPlayAmbientBaseAnims(ped, false)
    SetPedCanPlayGestureAnims(ped, false)
    SetPedCanPlayVisemeAnims(ped, false)
    SetPedCanRagdoll(ped, false)
    SetPedCanSwitchWeapon(ped, false)
    SetPedCanBeTargetted(ped, false)
    SetPedCanBeShotInVehicle(ped, false)
    SetPedCanBeDraggedOut(ped, false)
    SetDriverAbility(ped, 1.0)        
    SetDriverAggressiveness(ped, 0.05)
    SetEntityInvincible(ped, true)

    PlaceObjectOnGroundProperly(vehicle)
    SetDriveTaskDrivingStyle(ped, drivingStyle)
    TaskVehicleDriveToCoordLongrange(ped, vehicle, cords.x, cords.y, cords.z, speed, 0, drivingStyle, stopRange)

    currentEmsVehicle = vehicle
    currentEmsDriver = ped

    timeout = 60000
    
    while GetDistanceBetweenCoords(coords.x, coords.y, coords.z, GetEntityCoords(vehicle).x, GetEntityCoords(vehicle).y, GetEntityCoords(vehicle).z, true) >= stopRange or timeout >= 1 and DoesEntityExist(vehicle) and DoesEntityExist(ped) do
        timeout = timeout - 1
        TaskVehicleDriveToCoordLongrange(ped, vehicle, cords.x, cords.y, cords.z, speed, 0, drivingStyle, stopRange)
        Citizen.Wait(1)
    end

    

    Citizen.Trace("Local arrived or timeout reached")
end)

