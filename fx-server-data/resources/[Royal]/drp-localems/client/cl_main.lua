local drivingStyle = 1074528293
local stopRange = 15.0
local speed = 20.5
local spawnDistance = 500
local defaultTimeout = 90000
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


    local x, x2 = GetNthClosestVehicleNode(coords.x+math.random(150, 250), coords.y+math.random(-250, -150), coords.z, spawnDistance, 0, 0, 0)
    local sX, sY, sZ = table.unpack(x2)


    local heading, vector = GetNthClosestVehicleNode(sX, sY, sZ, spawnDistance, 0, 0, 0)
    vehicle = CreateVehicle("emsnspeedo", sX, sY, sZ, heading, true, true)
    SetVehicleOnGroundProperly(vehicle)  
    
    Citizen.Trace(sX .. " " .. sY .. " " .. sZ)
    SetEntityInvincible(vehicle, true)
    
    cords = GetEntityCoords(vehicle)

    SetVehicleHasBeenDrivenFlag(vehicle, true)
    SetVehicleDoorsLockedForAllPlayers(vehicle, true)
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
    SetDriverAggressiveness(ped, 0.03)
    SetEntityInvincible(ped, true)
    PlaceObjectOnGroundProperly(vehicle)
    SetDriveTaskDrivingStyle(ped, drivingStyle)

    TaskVehicleDriveWander(ped, vehicle, speed, drivingStyle)

    currentEmsVehicle = vehicle
    currentEmsDriver = ped

    timeout = defaultTimeout
    
    SetVehicleOnGroundProperly(vehicle)   -- Set the vehicle on ground properly

    Citizen.Wait(5000)

    SetVehicleOnGroundProperly(vehicle)  -- just to double check

    Citizen.Wait(5000) -- Then start to drive to player


    while GetDistanceBetweenCoords(coords.x, coords.y, coords.z, GetEntityCoords(vehicle).x, GetEntityCoords(vehicle).y, GetEntityCoords(vehicle).z, true) >= stopRange or timeout >= 1 do
        
        timeout = timeout - 1
        Citizen.Wait(1)

        if timeout >= defaultTimeout - 15000 then -- Check if EMS car moved out of spawn to prevent weird spawnings
            if GetDistanceBetweenCoords(GetEntityCoords(vehicle).x, GetEntityCoords(vehicle).y, GetEntityCoords(vehicle).z, sX, sY, sZ, true) >= 3.5 then
                Citizen.Trace("EMS car stuck in spawn")
                TriggerEvent("drp-death:revive") -- Local EMS
                SetVehicleSiren(vehicle, false)
                SetPedAsNoLongerNeeded(ped)
                SetEntityAsMissionEntity(ped, false, false)
                SetVehicleAsNoLongerNeeded(vehicle)
                SetEntityAsMissionEntity(vehicle, false, false)
                SetEntityInvincible(vehicle, false)
                SetEntityInvincible(ped, false)
                return
            end
        else
            if DoesEntityExist(vehicle) and DoesEntityExist(ped) then
                -- lol
            else 
                break
            end
        end
    end

    SetVehicleSiren(vehicle, false)
    playerCoords = GetEntityCoords(-1)
    if GetDistanceBetweenCoords(GetEntityCoords(vehicle).x, GetEntityCoords(vehicle).y, GetEntityCoords(vehicle).z, coords.x, coords.y, coords.z, true) <= stopRange+5 then
        Citizen.Trace("Timeout reached")
        SetPedAsNoLongerNeeded(ped)
        SetEntityAsMissionEntity(ped, false, false)
        SetVehicleAsNoLongerNeeded(vehicle)
        SetEntityAsMissionEntity(vehicle, false, false)
        SetEntityInvincible(vehicle, false)
        SetEntityInvincible(ped, false)
        TriggerEvent("drp-death:revive") -- Local EMS
        return
    else
        if GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z, coords.x, coords.y, coords.z, true) <= 15 then
            Citizen.Trace("Player gone")
            SetPedAsNoLongerNeeded(ped)
            SetEntityAsMissionEntity(ped, false, false)
            SetVehicleAsNoLongerNeeded(vehicle)
            SetEntityAsMissionEntity(vehicle, false, false)
            SetEntityInvincible(vehicle, false)
            SetEntityInvincible(ped, false)
            -- TriggerEvent("drp-death:revive") -- Local EMS No revive needed I guess cuz Picked up?
            return
        end

        Citizen.Trace("Local arrived")
        TaskPedSlideToCoord(ped, playerCoords.x, playerCoords.y, playerCoords.z, 1.0, 1.0)
        Citizen.Wait(3000)
        Citizen.Trace("NOW WHAT?")
    end
end)

