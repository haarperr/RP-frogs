local drivingStyle = 787260
local stopRange = 8.0
local speed = 45.0

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

    RequestModel("s_m_m_doctor_01")
    while not HasModelLoaded("s_m_m_doctor_01") do
        Citizen.Wait(0)
    end

    local ped = CreatePedInsideVehicle(vehicle, 26, "s_m_m_doctor_01", -1, true, false)
    SetPedIntoVehicle(ped, vehicle, -1)
    SetPedAsEnemy(ped, false)

    SetDriverAbility(ped, 1.0)        
    SetDriverAggressiveness(ped, 0.5)

    SetDriveTaskDrivingStyle(ped, drivingStyle)
    TaskVehicleDriveToCoordLongrange(ped, vehicle, coords.x, coords.y, coords.z, speed, 0, vehicle, drivingStyle, 1.0)




end)