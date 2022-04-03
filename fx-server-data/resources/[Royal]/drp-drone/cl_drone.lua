RegisterNetEvent("drp-drone:spawnDrone")
AddEventHandler("drp-drone:spawnDrone", function()
    if exports['drp-inventory']:hasEnoughOfItem('drone_lspd', 1) then
        local currentPed = GetPlayerPed(-1)
        
        TriggerEvent("DoLongHudText","Loading", 2)   
        -- load drone
        RequestModel(GetHashKey("rcmavic"))
        while not HasModelLoaded(GetHashKey("rcmavic")) do
            Wait(1)
        end
        TriggerEvent("DoLongHudText","Loaded", 2)   
        -- spawn drone
        local drone = CreateVehicle("rcmavic", 481.6537, -982.0282, 41.0068, 182.5093, true, true)
        TriggerEvent("DoLongHudText","Spawned", 2)   
        SetPedIntoVehicle(currentPed, drone, -1)
        
        TriggerEvent("DoLongHudText","Have fun in your Drone!", 1)        
    else
        TriggerEvent("DoLongHudText","You dont have a PD Drone.", 2)
    end
end)