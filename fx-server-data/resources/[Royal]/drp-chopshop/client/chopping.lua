local ActiveChopping = {}

local VehicleChopBones = {
    {name = "wheel_lf", index = 0, type = "tyre"},
    {name = "wheel_rf", index = 1, type = "tyre"},
    {name = "wheel_lm", index = 2, type = "tyre"},
    {name = "wheel_rm", index = 3, type = "tyre"},
    {name = "wheel_lr", index = 4, type = "tyre"},
    {name = "wheel_rr", index = 5, type = "tyre"},
    {name = "wheel_lm1", index = 2, type = "tyre"},
    {name = "wheel_rm1", index = 3, type = "tyre"},
    {name = "door_dside_f", index = 0, type = "door"},
    {name = "door_pside_f", index = 1, type = "door"},
    {name = "door_dside_r", index = 2, type = "door"},
    {name = "door_pside_r", index = 3, type = "door"},
    {name = "bonnet", index = 4, type = "door"},
    {name = "boot", index = 5, type = "door"},
}

function AnimationTask(entity, coordsType, coordsOrigin, coordsDist, animationType, animDict, animName, animFlag)
    local self = {}

    self.active = true

    Citizen.CreateThread(function()
        local playerPed = PlayerPedId()
        local playerCoords, coords = GetEntityCoords(playerPed)

        if animationType == "scenario" then
            TaskStartScenarioInPlace(playerPed, animDict, 0, true)
        elseif animationType == "normal" then
            LoadAnimationDic(animDict)
        end

        while self.active do
            Citizen.Wait(0)
            local idle = 100

            playerCoords = GetEntityCoords(playerPed)

            if coordsType == "bone" then
                coords = GetWorldPositionOfEntityBone(entity, coordsOrigin)
            else
                coords = GetEntityCoords(entity)
            end

            if animationType == "normal" and not IsEntityPlayingAnim(playerPed, animDict, animName, 3) then
                TaskPlayAnim(playerPed, animDict, animName, -8.0, -8.0, -1, animFlag, 0, 0, 0, 0)
            end

            if #(coords - playerCoords) > coordsDist then
                self.abort()
            end

            Citizen.Wait(idle)
        end

        if animationType == "scenario" then
            ClearPedTasks(playerPed)
        else
            StopAnimTask(playerPed, animDict, animName, 1.5)
        end
    end)

    self.abort = function()
        self.active = false
    end

    return self
end

function GetValidBones(entity, list)
    local bones = {}

    for _, bone in ipairs(list) do
        local boneID = GetEntityBoneIndexByName(entity, bone.name)

        if boneID ~= -1 then
            if bone.type == "door" and not IsVehicleDoorDamaged(entity, bone.index) or bone.type == "tyre" and not IsVehicleTyreBurst(entity, bone.index, 1) then
                bone.id = boneID
                bones[#bones + 1] = bone
            end

        end
    end

    return bones
end

function GetClosestBone(entity, list)
    local playerCoords, bone, coords, distance = GetEntityCoords(PlayerPedId())

    for _, element in pairs(list) do
        local boneCoords = GetWorldPositionOfEntityBone(entity, element.id or element)
        local boneDistance = GetDistanceBetweenCoords(playerCoords, boneCoords, true)

        if not coords then
            bone, coords, distance = element, boneCoords, boneDistance
        elseif distance > boneDistance then
            bone, coords, distance = element, boneCoords, boneDistance
        end
    end

    if not bone then
        bone = {id = GetEntityBoneIndexByName(entity, "bodyshell"), type = "remains", name = "bodyshell"}
        coords = GetWorldPositionOfEntityBone(entity, bone.id)
        distance = #(coords - playerCoords)
    end

    return bone, coords, distance
end

function ChopVehicleTyre(vehicle, boneID, tyreIndex)
    if IsVehicleTyreBurst(vehicle, tyreIndex, 1) then return end

    local task = AnimationTask(vehicle, "bone", boneID, 1.2, "normal", "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 1)

    local finished = exports["drp-taskbar"]:taskBar(10000, "Scrapping Car")

    local success = finished == 100 and task.active == true

    task.abort()

    if success then
        Sync.SetVehicleTyreBurst(vehicle, tyreIndex, true, 1000.0)
    end

    return success
end

function ChopVehicleDoor(vehicle, boneID, doorIndex)
    if IsVehicleDoorDamaged(vehicle, doorIndex) then return end

    Sync.SetVehicleDoorOpen(vehicle, doorIndex, 0, 1)

    local task = AnimationTask(vehicle, "bone", boneID, 1.6, "scenario", "WORLD_HUMAN_WELDING")

    local finished = exports["drp-taskbar"]:taskBar(14000, "Scrapping Car")
    local success = finished == 100 and task.active == true

    task.abort()

    if success then
        Sync.SetVehicleDoorBroken(vehicle, doorIndex, 1)
    end

    return success
end

function ChopVehicleRemains(vehicle, boneID)
    local task = AnimationTask(vehicle, "bone", boneID, 1.8, "normal", "mp_car_bomb", "car_bomb_mechanic", 17)

    local finished = exports["drp-taskbar"]:taskBar(25000, "Scrapping Car")

    local success = finished == 100 and task.active == true

    task.abort()

    if success then
        Sync.DeleteEntity(vehicle)
    end

    return success
end

function ChopVehiclePart(vehicle)
    if not DoesEntityExist(vehicle) then return end

    local vehicleModel = GetEntityModel(vehicle)

    local boneList = GetValidBones(vehicle, VehicleChopBones)

    local bone, coords, distance = GetClosestBone(vehicle, boneList)

    local success = false

    PedFaceCoord(PlayerPedId(), coords)

    if bone.type == "tyre" and distance < 1.2 then
        success = ChopVehicleTyre(vehicle, bone.id, bone.index)
    elseif bone.type == "door" and distance < 1.6 then
        success = ChopVehicleDoor(vehicle, bone.id, bone.index)
    elseif bone.type == "remains" and distance < 1.8 then
        success = ChopVehicleRemains(vehicle)
    end

    return success, bone.type, vehicleModel
end

function InteractiveChopping(vehicle)
    if ActiveChopping[vehicle] then return end

    local state = { active = true }
    local netId = NetworkGetNetworkIdFromEntity(vehicle)

    ActiveChopping[vehicle] = state

    local boneList = GetValidBones(vehicle, VehicleChopBones)

    Citizen.CreateThread(function()
        while state.active do
            boneList = GetValidBones(vehicle, VehicleChopBones)

            Citizen.Wait(100)
        end
    end)

    Citizen.CreateThread(function()
        while state.active do
            local idle = 500

            local bone, coords, distance = GetClosestBone(vehicle, boneList)

            if not IsInsideVehicle and distance and distance <= 10.0 then
                local inDistance, chopText

                if bone.type == "door" and distance <= 1.6 then
                    inDistance, chopText = true, "Press ~w~~g~[E]~w~ to Chop Vehicle Door"
                elseif bone.type == "tyre" and distance <= 1.6 then
                    inDistance, chopText = true, "Press ~w~~g~[E]~w~ to Chop Vehicle Tyre"
                elseif bone.type == "remains" and distance <= 1.8 then
                    inDistance, chopText = true, "Press ~w~~g~[E]~w~ to Chop Vehicle Remains"
                end

                if inDistance then
                    idle = 0
                    Draw3DText(coords.x, coords.y, coords.z, chopText)

                    if IsControlJustReleased(0, 38) then
                        local success, boneType, vehicleModel = ChopVehiclePart(vehicle)

                        if success then
                            TriggerServerEvent("drp-chopshop:vehicle_loot", boneType)

                            if not exports["drp-flags"]:HasVehicleFlag(vehicle, "isScrapVehicle") then
                                exports["drp-flags"]:SetVehicleFlag(vehicle, "isScrapVehicle", true)
                            end
                        end
                    end
                end

            end

            if not distance or distance > 10.0 then
                state.active = false
            end

            Citizen.Wait(idle)
        end

        ActiveChopping[vehicle] = nil
    end)
end


-- RegisterCommand('chop', function ()
--     local vehicle = exports['drp-targetinteract']:GetCurrentEntity()
-- 
--     if not vehicle then return end
-- 
--     InteractiveChopping(vehicle)
-- end, false)





local blipBoostLoc = nil
local blipDropOff = nil
local StartedBoost = false
local SpawnedPed = false
local spawnedVeh = nil
local DispatchDelayTimer = 0
local CallingCops = false
local BoostStarted = false

local vehClass = nil

function DeleteBlip(blip)
	if DoesBlipExist(blip) then
		RemoveBlip(blip)
	end
end

function CreateBlipBoostLoc(x, y, z)
    Citizen.Trace("wow\n")
    blipBoostLoc = AddBlipForRadius(x, y, z, 300.0)
    SetBlipHighDetail(blipBoostLoc, true)
    SetBlipColour(blipBoostLoc, 3)
    SetBlipAlpha (blipBoostLoc, 64)
    SetBlipDisplay(blipBoostLoc, 3)
end

function CreateBlipDropOff(x, y ,z)
    blipDropOff = AddBlipForCoord(x, y, z)
    SetBlipHighDetail(blipDropOff, true)
    SetBlipColour(blipDropOff, 1)
    SetBlipScale(blipDropOff, 0.75)
    SetBlipAlpha(blipDropOff, 250)
    SetBlipDisplay(blipDropOff, 2)
    SetBlipSprite(blipDropOff, 227)
    AddTextEntry("DROP", "Drop Location")
    BeginTextCommandSetBlipName("DROP")
    SetBlipCategory(blipDropOff, 2)
    EndTextCommandSetBlipName(blipDropOff)
end

local carList = {
    {name = "Declasse Asea", model = "asea"},
    {name = "Albany Emperor",  model = "emperor"},
    {name = "Dundreary Regina",  model = "regina"},
    {name = "Chariot Romero Hearse", model = "romero"},
    {name = "Vapid Minivan", model = "minivan"},
    {name = "Bravado Paradise", model = "paradise"},
    {name = "Brute Pony", model = "pony"},
    {name = "Karin Dilettante", model = "dilettante"},
    {name = "Dinka Blista Compact", model = "blista2"},
    {name = "Karin Asterope", model = "asterope"},
    {name = "Vulcar Ingot", model = "ingot"},
    {name = "Albany Primo",model = "primo"},
    {name = "Declasse Tornado",model = "tornado3"}, 
    {name = "Lampadati Komoda", model = "komoda"},
    {name = "Albany VSTR", model = "vstr"},
    {name = "Dinka Blista", model = "blista"},
    {name = "Dinka Sugoi", model = "sugoi"},
    {name = "Obey 9F Cabrio", model = "ninef2"},
    {name = "Obey 8F Drafter", model = "drafter"},
    {name = "Albany Alpha",model = "alpha"},
}

local carSpawns = {
  [1] =  { ['x'] = 227.9091,['y'] = 681.1382,['z'] = 188.9611,['h'] = 105.5603, ["pedSpawn"] =  {
    ["x"] = 219.5656, ["y"] = 642.4722, ["z"] = 189.6874, ["h"] = 26.96800
  }},
  [2] =  { ['x'] = -1084.4571, ['y'] = -1671.9692, ['z'] = 4.0556, ['h'] = 306.1417, ["pedSpawn"] =  {
    ['x'] = -1089.4154, ['y'] = -1683.2175, ['z'] = 4.6453, ['h'] = 311.8110
  }},
  [3] =  { ['x'] = -2030.0834, ['y'] = -355.9516, ['z'] = 43.4674, ['h'] = 53.8582, ["pedSpawn"] =  {
    ['x'] = -1997.6307, ['y'] = -327.6000, ['z'] = 48.0842, ['h'] = 272.1259
  }},
  [4] =  { ['x'] = -2179.0681, ['y'] = -422.0043, ['z'] = 12.5479, ['h'] = 181.4173, ["pedSpawn"] =  {
    ['x'] = -2234.3867, ['y'] = -367.5560, ['z'] = 13.4578, ['h'] = 25.5118
  }},
  [5] =  { ['x'] = -1625.7626, ['y'] = -951.0856, ['z'] = 7.6109, ['h'] = 138.8976, ["pedSpawn"] =  {
    ['x'] = -1621.0549, ['y'] = -958.1274, ['z'] = 13.0029, ['h'] = 223.9370
  }},
  [6] =  { ['x'] = -2785.1604, ['y'] = 1434.1064, ['z'] = 100.2850, ['h'] = 53.8582, ["pedSpawn"] =  {
    ['x'] = -2783.1691, ['y'] = 1436.4000, ['z'] = 100.8916, ['h'] = 187.0866
  }},
  [7] =  { ['x'] = 1391.7098, ['y'] = 1120.0878, ['z'] = 114.1860, ['h'] = 87.8740, ["pedSpawn"] =  {
    ['x'] = 1417.8725, ['y'] = 1105.9912, ['z'] = 114.2872, ['h'] = 303.3070
  }},
  [8] =  { ['x'] = 1274.1494, ['y'] = -367.8725, ['z'] = 68.4051, ['h'] = 240.9448, ["pedSpawn"] =  {
    ['x'] = 1249.2263, ['y'] = -349.7538, ['z'] = 69.1970, ['h'] = 192.7559
  }},
  [9] =  { ['x'] = 1130.4132, ['y'] = -1302.2636, ['z'] = 34.0988, ['h'] = 172.9133, ["pedSpawn"] =  {
    ['x'] = 1156.5230, ['y'] = -1258.5230, ['z'] = 34.6043, ['h'] = 136.0629
  }},
  [10] =  { ['x'] = 1599.1252, ['y'] = -1708.4439, ['z'] = 87.4791, ['h'] = 297.6377, ["pedSpawn"] =  {
    ['x'] = 1570.8659, ['y'] = -1664.9934, ['z'] = 88.2036, ['h'] = 19.8425
  }},
}

local dropPoint = {
  [1] = {["x"] = 1540.1749, ["y"] = 6336.4829, ["z"] = 24.0750, ["h"] = 0.0},
  [2] = {["x"] = 1731.4615, ["y"] = 3310.3389, ["z"] = 41.2236, ["h"] = 0.0},
  [3] = {["x"] = 137.7042, ["y"] = -3089.4636, ["z"] = 5.8963, ["h"] = 0.0},
  [4] = {["x"] = 982.3324, ["y"] = -111.9966, ["z"] = 74.1583, ["h"] = 0.0},
  [5] = {["x"] = 1357.9341, ["y"] = -2094.7803, ["z"] = 51.9985, ["h"] = 0.0},
  [6] = {["x"] = -414.3092, ["y"] = -2182.6360, ["z"] = 10.3182, ["h"] = 0.0},
}

RegisterCommand("chopchop", function(source)
  TriggerEvent("chop:tryStart")
end)

RegisterNetEvent("chop:tryStart")
AddEventHandler("chop:tryStart", function()
    TriggerEvent("chop:startChop", carList[math.random(1, #carList)])
end)


local currentLocation = nil

RegisterNetEvent("chop:startChop")
AddEventHandler("chop:startChop", function(modelName)
    local vehHash = GetHashKey(modelName["model"])

    carSpawnRandom = math.random(1,#carSpawns)
    local x = carSpawns[carSpawnRandom]["x"]
    local y = carSpawns[carSpawnRandom]["y"]
    local z = carSpawns[carSpawnRandom]["z"]
    local h = carSpawns[carSpawnRandom]["h"]

    local pedX = carSpawns[carSpawnRandom]["pedSpawn"]["x"]
    local pedY = carSpawns[carSpawnRandom]["pedSpawn"]["y"]
    local pedZ = carSpawns[carSpawnRandom]["pedSpawn"]["z"]
    local pedH = carSpawns[carSpawnRandom]["pedSpawn"]["h"]
    Citizen.Trace(tostring(vehHash) .. " " .. tostring(x) .. " " .. tostring(y) .. " " .. tostring(z) .. " " .. tostring(h) .. "\n")
    if not IsModelInCdimage(vehHash) then
        TriggerEvent("chop:tryStart")
        return
    end
    RequestModel(vehHash)
    while not HasModelLoaded(vehHash) do
        Citizen.Wait(10)
    end
    StartedBoost = true
    local vehicle = CreateVehicle(vehHash, x, y, z, h, true, true)
    SetVehicleDoorsLocked(vehicle, 2)
    SetVehicleHasBeenOwnedByPlayer(vehicle, true)
    SetVehicleIsStolen(vehicle, true)
    SetVehRadioStation(vehicle, 'OFF')
    IsEntityAMissionEntity(vehicle)
    SetVehicleOnGroundProperly(vehicle)

    spawnedVeh = GetClosestVehicle(x, y, z, 3.5, 0, 70)

    local plate = GetVehicleNumberPlateText(spawnedVeh)

    TriggerEvent('phone:robberynotif', 'DarkNet', "You are looking for a vehicle to steal.\n\n" .. plate .. "\n" .. modelName["name"])

    CreateBlipBoostLoc(x, y, z)

    currentLocation = pedX, pedY, pedZ, pedH

    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(5000)
            -- get distance between player and vehicle
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local carCoords = GetEntityCoords(vehicle, false)
            local dist = GetDistanceBetweenCoords(plyCoords.x, plyCoords.y, plyCoords.z, carCoords.x, carCoords.y, carCoords.z, false)
            if dist < 2.5 then
                TriggerEvent("chop:boostLockPick", vehicle)
            end

            if GetVehiclePedIsIn(PlayerPedId(), false) == spawnedVeh then
                DeleteBlip(blipBoostLoc)
                blipBoostLoc = nil
                return
            end
        end
    end)
end)

RegisterNetEvent("chop:boostLockPick")
AddEventHandler("chop:boostLockPick", function(vehicle)
    local plyPos = GetEntityCoords(PlayerPedId())
    local pedSpawnAmount = nil 
    local weapon = nil
    local guns = {
    "weapon_bat",
    "weapon_switchblade",
    "weapon_crowbar",
    "weapon_combatpistol",
    "weapon_pistol",
    "weapon_switchblade",
    "weapon_combatpistol",
    }

    pedSpawnAmount = math.random(1,2)
    weapon = guns[math.random(1, #guns)]

    Citizen.CreateThread(function()
        if not pedsSpawned then
            for i = pedSpawnAmount, 1, -1 do 
                TriggerEvent("chop:spawnPed", currentLocation, weapon)
                pedsSpawned = true
            end
        end

        while not IsPedInAnyVehicle(PlayerPedId(), false) do
            Citizen.Wait(1000)
        end 

        -- if vehicle ped is in == vehicle then
        if GetVehiclePedIsIn(PlayerPedId(), false) == vehicle then
            TriggerEvent("chop:DropOff", vehicle)
        end
        
        pedsSpawned = false
        
    end)
end)




RegisterNetEvent("chop:spawnPed")
AddEventHandler("chop:spawnPed", function(x, y, z, h, weapon)
  
  local pedModels = {
    "a_m_m_rurmeth_01", 
    "a_m_m_soucent_01", 
    "a_m_y_beach_01", 
    "a_m_y_ktown_02", 
    "cs_old_man2", 
    "cs_siemonyetarian",
    "cs_terry"
  }

  Citizen.CreateThread(function()
    AddRelationshipGroup("gangGang")
    local pedRand1 = GetHashKey(pedModels[math.random(1, #pedModels)])
    if not IsModelInCdimage(pedRand1) then return end
    RequestModel(pedRand1)
    while not HasModelLoaded(pedRand1) do
      Citizen.Wait(10)
    end
    local boostingPed1 = CreatePed(30, pedRand1, x, y, z, h, true, true)
    SetPedArmour(boostingPed1, 100)
    SetPedAsEnemy(boostingPed1, true)
    SetPedRelationshipGroupHash(boostingPed1, 'gangGang')
    GiveWeaponToPed(boostingPed1, GetHashKey(weapon), 250, true, true)
    TaskCombatPed(boostingPed1, GetPlayerPed(-1))
    SetPedAccuracy(boostingPed1, math.random(25,75))
    SetPedDropsWeaponsWhenDead(boostingPed1, false)
  end)

end)

local triggered = false

RegisterNetEvent("chop:DropOff")
AddEventHandler("chop:DropOff", function(vehicle)
    local dropRand = math.random(1, #dropPoint)
    local dropX = dropPoint[dropRand]["x"]
    local dropY = dropPoint[dropRand]["y"]
    local dropZ = dropPoint[dropRand]["z"]

    if not triggered then
        CreateBlipDropOff(dropX, dropY, dropZ)
        SetNewWaypoint(dropX, dropY)
        TriggerEvent('phone:robberynotif', 'DarkNet', "Bring that car to the chop yard.")
    end

    Citizen.CreateThread(function()
        while true do 
            Citizen.Wait(2500)
            plyLoc = GetEntityCoords(PlayerPedId())
            local boostCarLoc = GetEntityCoords(spawnedVeh)
            local dist = Vdist(dropX, dropY, dropZ, boostCarLoc.x, boostCarLoc.y, boostCarLoc.z)
            local plyDistFromDrop = Vdist(dropX, dropY, dropZ, plyLoc.x, plyLoc.y, plyLoc.z)
            local isCarAtDropOff = false
            if dist < 5 and not IsPedInAnyVehicle(PlayerPedId(), false) then
                isCarAtDropOff = true
                triggered = false
                DeleteBlip(blipDropOff)
                TriggerServerEvent("drp-chopshop:registerCar", vehicle)
                return
            end
        end
    end)
end)


RegisterNetEvent("drp-chopchop:markCar")
AddEventHandler("drp-chopchop:markCar", function(vehicle)
    InteractiveChopping(vehicle)
end)