local DepoLocation = {x = -424.33847045898, y = -2789.8154296875, z = 6.5157470703125}

local ElectricalLocation = {
    [1] = {name = "Capital Boulevard",x = 1219.8198242188, y = -1462.9187011719 , z = 34.84033203125},
    [2] = {name = "Capital Boulevard",x = 976.49670410156, y = -1388.8879394531 , z = 31.537719726562},
    [3] = {name = "Popular Street",x = 817.9912109375, y = -493.1340637207 , z = 30.526733398438},
    [4] = {name = "Bridge Street",x = 1114.6812744141, y = -335.36703491211 , z = 67.0908203125},
    [5] = {name = "Panorarma Drive - Sandy Shores",x = 1692.9890136719, y = 3459.666015625 , z = 36.946533203125},
    [6] = {name = "Alta Street",x = 86.742858886719, y = -236.63735961914 , z = -236.63735961914},
    [7] = {name = "Portola Drive",x = -765.89013671875, y = -218.03076171875 , z = 37.283569335938},
    [8] = {name = "Cougar Avenue",x = -1563.5999755859, y = -233.6967010498 , z = 49.465942382812},
    [9] = {name = "West Eclipse Boulevard",x = -2064.5275878906, y = -312.89669799805, z = 13.272583007812},
    [10] = {name = "Bay City Ave",x = -1817.7098388672, y = -342.51428222656, z = 49.12890625},
}

local isCurrentlyWorkingOnElectrical = false
local ElectricalPoint = 0
local isOnTheWayToWaterNPowerJob = false
local isOnWaterNPowerJob = false
local NeedsToReturnTruck = false

local px = 0
local py = 0
local pz = 0

--// Shit

function EvanCoolHaha(ElectricalLocation,ElectricalPoint)
    JobBlip = AddBlipForCoord(ElectricalLocation[ElectricalPoint].x,ElectricalLocation[ElectricalPoint].y, ElectricalLocation[ElectricalPoint].z)
    SetBlipSprite(JobBlip, 1)
    SetNewWaypoint(ElectricalLocation[ElectricalPoint].x,ElectricalLocation[ElectricalPoint].y)
end

RegisterNetEvent('drp-civjobs:waternpower:givejob')
AddEventHandler('drp-civjobs:waternpower:givejob', function()
    isCurrentlyWorkingOnElectrical = true
    isOnTheWayToWaterNPowerJob = true
    ElectricalPoint = math.random(10)
    px = ElectricalLocation[ElectricalPoint].x
    py = ElectricalLocation[ElectricalPoint].y
    pz = ElectricalLocation[ElectricalPoint].z
    distance = round(GetDistanceBetweenCoords(DepoLocation.x, DepoLocation.y, DepoLocation.z, px,py,pz))
    EvanCoolHaha(ElectricalLocation,ElectricalPoint)
    print(ElectricalPoint)
    TriggerEvent("phone:addnotification", "EMAIL ", "Job Available: I updated your GPS")
end)

local CanClockOut = false
local CanSpawnWorkVeh = false

RegisterNetEvent('drp-civjobs:wandp:clockin')
AddEventHandler('drp-civjobs:wandp:clockin', function()
    if not CanClockOut then
        CanClockOut = true
        CanSpawnWorkVeh = true
        TriggerEvent('DoLongHudText', 'Clocked into Los Santos Water And Power - F1 over by the container to get a vehicle', 1)
    else
        TriggerEvent('DoLongHudText', 'Your already clocked in !', 2)
    end
end)

RegisterNetEvent('drp-civjobs:wandp:clockout')
AddEventHandler('drp-civjobs:wandp:clockout', function()
    if NeedsToReturnTruck then
        TriggerEvent('DoLongHudText', 'You need to return your truck', 2)
    else
        if CanClockOut then
            TriggerEvent('DoLongHudText', 'Clocked Out !', 2)
            RemoveBlip(JobBlip)
            CanClockOut = false
        else
            print('was never clocked in bozo')
        end
    end
end)

RegisterNetEvent('drp-jobs:return-car')
AddEventHandler('drp-jobs:return-car', function()
    if not CanSpawnWorkVeh then
        if IsVehicleModel(GetVehiclePedIsIn(GetPlayerPed(-1), true), GetHashKey("BOXVILLE")) then
            local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), true)
            deleteCar( vehicle )
            print(vehicle)
            RemoveBlip(JobBlip)
            CanClockOut = false
            NeedsToReturnTruck = false
            TriggerEvent('DoLongHudText', 'Returned Vehicle and Clocked Out', 1)
        else
            TriggerEvent('DoLongHudText', 'Hm, try getting in and out of the vehicle and trying again', 2)
        end
    else
        TriggerEvent('DoLongHudText', 'Hm, looks like you havent got a vehicle out!', 2)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if isOnTheWayToWaterNPowerJob == true then
            destinol = ElectricalLocation[ElectricalPoint].name
            if GetDistanceBetweenCoords(px,py,pz, GetEntityCoords(GetPlayerPed(-1),true)) < 2 then
               if IsVehicleModel(GetVehiclePedIsIn(GetPlayerPed(-1), true), GetHashKey("BOXVILLE")) and not IsPedInAnyVehicle(PlayerPedId()) then
                    exports['drp-textui']:showInteraction('[E] Fix Electricals')
                    if IsControlJustPressed(1,38) then
                        exports['drp-textui']:hideInteraction()
                        FreezeEntityPosition(GetPlayerPed(-1), true)
                        TriggerEvent("animation:PlayAnimation","welding")
                        local canwork = exports['drp-taskbar']:taskBar(15000, 'Fixing Electricals')
                        if (canwork == 100) then
                            FreezeEntityPosition(GetPlayerPed(-1), false)
                            exports['drp-textui']:hideInteraction()
                            isOnTheWayToWaterNPowerJob = false
                            isOnWaterNPowerJob = true
                            RemoveBlip(JobBlip)
                            TriggerEvent('DoLongHudText', 'Good Work ! Keep it up or return to depo and clock out !', 2)
                            TriggerServerEvent('drp-civjobs:water-power-payme')
                            Citizen.Wait(math.random(30000, 80000))
                            TriggerEvent('drp-civjobs:waternpower:givejob')
                        else
                            FreezeEntityPosition(GetPlayerPed(-1), false)
                            TriggerEvent('DoLongHudText', 'Something went wrong try again...', 2)
                        end
                    end
                end
            else
                exports['drp-textui']:hideInteraction()
            end
        end
            if IsEntityDead(GetPlayerPed(-1)) then
                isCurrentlyWorkingOnElectrical = false
                ElectricalPoint = 0
                isOnTheWayToWaterNPowerJob = false
                isOnWaterNPowerJob = false
                px = 0
                py = 0
                pz = 0
                RemoveBlip(JobBlip)
            end
        end
    end)
    
--// Spawn vehicle


function findClosestSpawnWaterNPower(pCurrentPosition)
	local coords = vector3(453.982421875, -1968.2769775391, 22.84326171875)
	local closestDistance = -1
	local closestCoord = pCurrentPosition
	local distance = #(coords - pCurrentPosition)
	if closestDistance == -1 or closestDistance > distance then
	  closestDistance = distance
	  closestCoord = coords
	end
	return closestCoord
end

RegisterNetEvent("drp-civjobs:waternpowercar")
AddEventHandler("drp-civjobs:waternpowercar", function()
	Citizen.CreateThread(function()
        if CanSpawnWorkVeh then
            local hash = GetHashKey("BOXVILLE")

            if not IsModelAVehicle(hash) then return end
            if not IsModelInCdimage(hash) or not IsModelValid(hash) then return end
            
            RequestModel(hash)

            while not HasModelLoaded(hash) do
                Citizen.Wait(0)
            end

            local spawnLocation = findClosestSpawnWaterNPower(GetEntityCoords(PlayerPedId()))
            local getVehicleInArea = GetClosestVehicle(spawnLocation, 3.000, 0, 70)
            if DoesEntityExist(getVehicleInArea) then
            TriggerEvent("DoLongHudText", "The area is crowded", 2)
            return
            end

            local vehicle = CreateVehicle(hash, 453.982421875, -1968.2769775391, 22.84326171875, 184.25196838379, true, false)

            local plate = GetVehicleNumberPlateText(vehicle)
            TriggerEvent("keys:addNew",vehicle,plate)
            TriggerEvent('drp-civjobs:waternpower:givejob')
            CanSpawnWorkVeh = false
            NeedsToReturnTruck = true
            SetModelAsNoLongerNeeded(hash)
            SetVehicleDirtLevel(vehicle, 0)
            SetVehicleWindowTint(vehicle, 0)
        else
            TriggerEvent('DoLongHudText', 'You need to clock in first', 2)
        end
    end)
end)