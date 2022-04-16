
local doors = {}
local elevators = {}

local alreadyInSide = {}

RegisterNetEvent("drp-doors:write-entity")
AddEventHandler("drp-doors:write-entity", function(entity)
    file = io.open("doors.txt", "a")
    io.output(file)
    if alreadyInSide[entity] ~= nil then
        return
    end

    alreadyInSide[entity] = true

    local output = [[
        {
            info = "PD Sandy 3",
            active = true,
            id = 550,
            coords = vector3(]] .. tostring(GetEntityCoords(entity)) .. [[),
            model = ]] .. tostring(GetEntityModel(entity)) .. [[,
            lock = true,
            keyFob = true,
            desc = "x",
            access = {
                job = {
                ["PD"] = true,
                },
                cid = {
                },
            }
        },
    ]]
    io.write(tostring(output))
    io.close(file)
end)

RegisterNetEvent('drp-doors:request-lock-state')
AddEventHandler('drp-doors:request-lock-state', function()
    local src = source
    TriggerClientEvent('drp-doors:initial-lock-state', src, doors)
end)

RegisterNetEvent('drp-doors:change-lock-state')
AddEventHandler('drp-doors:change-lock-state', function(pDoorId, pDoorLockState)
    if doors[pDoorId] then
        doors[pDoorId].lock = pDoorLockState
        TriggerClientEvent('drp-doors:change-lock-state', -1, pDoorId, pDoorLockState)
    end
end)

-- CreateThread(function()
--     for _, door in pairs(RRP.Doors) do
--         local doorModelHash = (type(door.model) == "string" and GetHashKey(door.model) or door.model)
--         local generatedDoorId = GetMapObjectId(doorModelHash, door.coords)
--         doors[generatedDoorId] = {
--             id = generatedDoorId,
--             active = door.active,
--             access = door.access,
--             coords = door.coords,
--             automatic = door.automatic,
--             forceUnlocked = door.forceUnlocked,
--             lock = door.lock,
--             info = door.info,
--             model = doorModelHash,
--             hidden = door.hidden,
--             cellNumber = door.cellNumber
--         }
--     end
-- end)

Citizen.CreateThread(function()
    for _,door in ipairs(DOOR_CONFIG) do
        doors[#doors + 1] = door
    end
end)

-- RegisterNetEvent("drp-doors:save-config")
-- AddEventHandler("drp-doors:save-config", function(pDoorData)
--     if pDoorData ~= nil then
--         local fileHandle = io.open("doorCoords.log", "a")
--         if fileHandle then
--             fileHandle:write(json.encode(pDoorData))
--         end
--         fileHandle:close()
--     end
-- end)

-- RPC.register("drp-doors:elevators:fetch", function()
--     return RRP.Elevators or {}
-- end)
