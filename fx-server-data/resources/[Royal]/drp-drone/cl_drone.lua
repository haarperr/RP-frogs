local isInDrone = false
local drone = 0
local enterCoords = nil

RegisterNetEvent("drp-drone:spawnDrone")
AddEventHandler("drp-drone:spawnDrone", function()
    if exports['drp-inventory']:hasEnoughOfItem('drone_lspd', 1) then
        local currentPed = GetPlayerPed(-1)
        enterCoords = GetEntityCoords(currentPed)

        -- load drone
        RequestModel(GetHashKey("rcmavic"))
        while not HasModelLoaded(GetHashKey("rcmavic")) do
            Wait(1)
        end
        -- spawn drone
        local drone = CreateVehicle("rcmavic", 481.6537, -982.0282, 41.0068, 182.5093, true, true)
        SetPedIntoVehicle(currentPed, drone, -1)
		TriggerEvent("keys:addNew",drone, GetVehicleNumberPlateText(drone))
        isInDrone = true
        drone = drone
        TriggerEvent("DoLongHudText","Have fun in your Drone!", 1)        
    else
        TriggerEvent("DoLongHudText","You dont have a PD Drone.", 2)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        if isInDrone then
            -- if player is not in drone
            if not IsPedInAnyVehicle(GetPlayerPed(-1), false) then
                -- remove drone
                SetEntityAsMissionEntity(drone, true, true)
                DeleteEntity(drone)
                isInDrone = false
                drone = 0
                -- teleport ped back to where he entered
                SetEntityCoords(GetPlayerPed(-1), enterCoords.x, enterCoords.y, enterCoords.z)
                -- Message to player
                TriggerEvent("DoLongHudText","You left the Drone.", 1)
            end
        end
    end
end)