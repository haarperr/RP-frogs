RegisterNetEvent("drp-drone:spawnDrone")
AddEventHandler("drp-drone:spawnDrone", function()
    
    if exports['drp-inventory']:hasEnoughOfItem('drone_lspd', 1) then
        local currentPed = GetPlayerPed(-1)

        -- get ped clothes
        local pedClothes = {}
        for i = 0, 11 do
            pedClothes[i] = GetPedDrawableVariation(currentPed, i)
        end
        for i = 0, 7 do
            pedClothes[i + 11] = GetPedTextureVariation(currentPed, i)
        end
        for i = 0, 1 do
            pedClothes[i + 18] = GetPedPaletteVariation(currentPed, i)
        end

        -- spawn player clone with same clothes
        local playerClone = CreatePed(4, GetHashKey("s_m_y_cop_01"), GetEntityCoords(currentPed), GetEntityHeading(currentPed), true, true)
        ClonePedToTarget(currentPed, playerClone)
        
        -- load drone
        RequestModel(GetHashKey("drone_lspd"))
        while not HasModelLoaded(GetHashKey("drone_lspd")) do
            Wait(1)
        end

        -- spawn drone

        local drone = CreateVehicle(GetHashKey("drone_lspd"), 481.6537, -982.0282, 41.0068, 182.5093, true, true)
        
        SetVehicleOnGroundProperly(drone)
        SetPedIntoVehicle(playerClone, drone, -1)
        
        TriggerEvent("DoLongHudText","Have fun in your Drone!", 1)        
    else
        TriggerEvent("DoLongHudText","You dont have a PD Drone.", 2)
    end
end)