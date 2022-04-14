RegisterNetEvent("drp-ud:elevatorcheck")
AddEventHandler("drp-ud:elevatorcheck", function()
    local player = PlayerPedId()
    local coords = GetEntityCoords(player)
    local elevator = vector3(9.9859, -667.3959, 33.4492)
    local distance = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, elevator.x, elevator.y, elevator.z, true)
    if distance < 3 then
        if exports["drp-duty"]:LawAmount() >= -1 then -- testing
            -- heist starts
            RequestAnimDict("anim@heists@ornate_bank@thermal_charge")
            RequestModel("hei_p_m_bag_var22_arm_s")
            RequestNamedPtfxAsset("scr_ornate_heist")
            while not HasAnimDictLoaded("anim@heists@ornate_bank@thermal_charge") and not HasModelLoaded("hei_p_m_bag_var22_arm_s") and not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
            Citizen.Wait(50)
            end
            if not HasNamedPtfxAssetLoaded("scr_ornate_heist") then
                RequestNamedPtfxAsset("scr_ornate_heist")
                while not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
                    Wait(1)
                end
            end
            TaskGoStraightToCoord(PlayerPedId(), 8.4783, -667.8687, 33.4497, 1.0, -1, 177.2868, 0.0)
            Citizen.Wait(4000)
            TriggerEvent('inventory:removeItem', 'elevatorhackingdevice', 1)
            exports["blz-memory"]:thermiteminigame(10, 3, 3, 10,
            function()
                local rotx, roty, rotz = table.unpack(vec3(GetEntityRotation(PlayerPedId())))
                local bagscene = NetworkCreateSynchronisedScene(8.4783, -667.8687, 33.4497, rotx, roty, rotz + 1.1, 2, false, false, 1065353216, 0, 1.3)
                local bag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), 8.4783, -667.8687, 33.4497,  true,  true, false)

                SetEntityCollision(bag, false, true)
                NetworkAddPedToSynchronisedScene(ped, bagscene, "anim@heists@ornate_bank@thermal_charge", "thermal_charge", 1.2, -4.0, 1, 16, 1148846080, 0)
                NetworkAddEntityToSynchronisedScene(bag, bagscene, "anim@heists@ornate_bank@thermal_charge", "bag_thermal_charge", 4.0, -8.0, 1)
                SetPedComponentVariation(ped, 5, 0, 0, 0)
                NetworkStartSynchronisedScene(bagscene)
                Citizen.Wait(1500)
                local x, y, z = table.unpack(GetEntityCoords(ped))
                local bomba = CreateObject(GetHashKey("hei_prop_heist_thermite"), x, y, z + 0.3,  true,  true, true)

                SetEntityCollision(bomba, false, true)
                AttachEntityToEntity(bomba, ped, GetPedBoneIndex(ped, 28422), 0, 0, 0, 0, 0, 200.0, true, true, false, true, 1, true)
                Citizen.Wait(2000)
                DeleteObject(bag)
                SetPedComponentVariation(ped, 5, 45, 0, 0)
                DetachEntity(bomba, 1, 1)
                FreezeEntityPosition(bomba, true)
                TriggerServerEvent("drp-ud:particleserver", method)
                SetPtfxAssetNextCall("scr_ornate_heist")
                local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", 8.4783, -667.8687, 33.4497, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
                
                NetworkStopSynchronisedScene(bagscene)
                TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_intro", 8.0, 8.0, 1000, 36, 1, 0, 0, 0)
                TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_loop", 8.0, 8.0, 3000, 49, 1, 0, 0, 0)
                Citizen.Wait(10000)
                ClearPedTasks(ped)
                DeleteObject(bomba)
                DeleteObject(bag)
                StopParticleFxLooped(effect, 0)
                Citizen.Wait(2000)

                -- create random ped and spawn him
                local hash = GetHashKey("cs_barry")
                RequestModel(hash)
                while not HasModelLoaded(hash) do
                    Wait(1)
                end
                
                TriggerServerEvent('drp-doors:change-lock-state', 542, false, true)
                TriggerServerEvent('drp-doors:change-lock-state', 541, false, true)

                local pedSpawn = vector3(10.2033, -669.5919, 33.4495)
                local ped = CreatePed(4, hash, pedSpawn.x, pedSpawn.y, pedSpawn.z, 0.0, true, false)
                SetEntityAsMissionEntity(ped, true, true)
                TaskSmartFleePed(ped, PlayerPedId(), 100.0, -1, false, false)

                
            end,
            function()

            end)
        else
            TriggerEvent('DoLongHudText', 'Not enough police on duty.', 2)
        end
    end
end)




RegisterNetEvent("drp-ud:particleclient")
AddEventHandler("drp-ud:particleclient", function(method)
    local ptfx

    RequestNamedPtfxAsset("scr_ornate_heist")
    while not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
        Citizen.Wait(1)
    end
        ptfx = vector3(8.4105, -667.1199, 33.4497)
    SetPtfxAssetNextCall("scr_ornate_heist")
    local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", ptfx, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
    Citizen.Wait(4000)
    
    StopParticleFxLooped(effect, 0)
end)


function Draw3DText(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y) 
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
end 