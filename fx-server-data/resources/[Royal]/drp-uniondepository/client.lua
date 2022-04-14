local ongoingHeist = false
local defenderSpawned = false
local defender2Spawned = false

RegisterNetEvent("drp-ud:elevatorcheck")
AddEventHandler("drp-ud:elevatorcheck", function()
    local player = PlayerPedId()
    local coords = GetEntityCoords(player)
    local elevator = vector3(9.9859, -667.3959, 33.4492)
    TriggerServerEvent("drp-ud:requestVariables")
    local distance = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, elevator.x, elevator.y, elevator.z, true)
    if distance < 3 and ongoingHeist == false then
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
            exports["blz-memory"]:thermiteminigame(1, 3, 3, 8,
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

                TriggerServerEvent("drp-ud:setOngoingHeist", true)
                TriggerServerEvent("drp-ud:requestVariables")
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

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)        
        
        local enterLocation = vector3(10.2297, -668.2030, 33.4493)
        local exitLocation = vector3(0.6342, -703.1225, 16.1310)
        local playerCoords = GetEntityCoords(PlayerPedId())
        if ongoingHeist then
            if GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z, enterLocation.x, enterLocation.y, enterLocation.z, true) < 1.5 then
                Draw3DText(enterLocation.x, enterLocation.y, enterLocation.z, "Press [E] to enter")
                if IsControlJustPressed(0, 38) then
                    local finished = exports['drp-taskbar']:taskBar(15000, 'Using the Elevator')
                    if finished == 100 then
                        -- teleport player to downstairs
                        local downstairs = vector3(-0.3971, -706.9908, 16.1311)
                        
                        local hash = GetHashKey("s_m_y_swat_01")
                        RequestModel(hash)
                        while not HasModelLoaded(hash) do
                            Wait(1)
                        end

                        SetEntityCoords(PlayerPedId(), downstairs.x, downstairs.y, downstairs.z)
                        
                        TriggerServerEvent("drp-ud:requestVariables")
                        Citizen.Trace("Defender Spawned: " .. tostring(defenderSpawned) .. "\n")
                        if defenderSpawned == false then
                            spawnWave1()
                            Wait(500)
                            spawnWave2()
                            Wait(500)
                            TriggerServerEvent("drp-ud:requestVariables")
                        end
                    end
                end
            end
        end
        if GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z, exitLocation.x, exitLocation.y, exitLocation.z, true) < 1.5 then
            Draw3DText(exitLocation.x, exitLocation.y, exitLocation.z, "Press [E] to exit")
            if IsControlJustPressed(0, 38) then
                local finished = exports['drp-taskbar']:taskBar(15000, 'Using the Elevator')
                if finished == 100 then
                    -- teleport player to upstairs
                    local upstairs = vector3(10.8864, -672.2345, 33.4495)
                    SetEntityCoords(PlayerPedId(), upstairs.x, upstairs.y, upstairs.z)
                end
            end
        end
    end
end)

RegisterNetEvent("drp-ud:getVariables")
AddEventHandler("drp-ud:getVariables", function(defender, defender2, ongoing)
    defenderSpawned = defender
    defender2Spawned = defender2
    ongoingHeist = ongoing    
end)

function spawnWave1()
    local defender1Pos = vector3(-0.7767, -689.3953, 16.1307)
    local defender2Pos = vector3(9.1506, -708.4230, 16.1310)
    local defender3Pos = vector3(4.9398, -707.7214, 16.1310)
    local defender4Pos = vector3(6.8620, -702.1044, 16.1310)
    local defender5Pos = vector3(-13.3691, -695.4658, 16.1410)
    local defender6Pos = vector3(-0.0939, -688.5615, 16.1308)
    local defender7Pos = vector3(-4.9599, -697.6608, 16.1310)


    local defender1 = CreatePed(4, hash, defender1Pos.x, defender1Pos.y, defender1Pos.z, 0.0, true, true)
    local defender2 = CreatePed(4, hash, defender2Pos.x, defender2Pos.y, defender2Pos.z, 0.0, true, true)
    local defender3 = CreatePed(4, hash, defender3Pos.x, defender3Pos.y, defender3Pos.z, 0.0, true, true)
    local defender4 = CreatePed(4, hash, defender4Pos.x, defender4Pos.y, defender4Pos.z, 0.0, true, true)
    local defender5 = CreatePed(4, hash, defender5Pos.x, defender5Pos.y, defender5Pos.z, 0.0, true, true)
    local defender6 = CreatePed(4, hash, defender6Pos.x, defender6Pos.y, defender6Pos.z, 0.0, true, true)
    local defender7 = CreatePed(4, hash, defender7Pos.x, defender7Pos.y, defender7Pos.z, 0.0, true, true)
                        
    SetEntityAsMissionEntity(defender1, true, true)
    SetEntityAsMissionEntity(defender2, true, true)
    SetEntityAsMissionEntity(defender3, true, true)
    SetEntityAsMissionEntity(defender4, true, true)
    SetEntityAsMissionEntity(defender5, true, true)
    SetEntityAsMissionEntity(defender6, true, true)
    SetEntityAsMissionEntity(defender7, true, true)

    SetPedAsEnemy(defender1, true)
    SetPedAsEnemy(defender2, true)
    SetPedAsEnemy(defender3, true)
    SetPedAsEnemy(defender4, true)
    SetPedAsEnemy(defender5, true)
    SetPedAsEnemy(defender6, true)
    SetPedAsEnemy(defender7, true)

    SetPedCombatAttributes(defender1, 46, true)
    SetPedCombatAttributes(defender2, 46, true)
    SetPedCombatAttributes(defender3, 46, true)
    SetPedCombatAttributes(defender4, 46, true)
    SetPedCombatAttributes(defender5, 46, true)
    SetPedCombatAttributes(defender6, 46, true)
    SetPedCombatAttributes(defender7, 46, true)

    GiveWeaponToPed(defender1, GetHashKey("weapon_pistol"), 1000, false, true)
    GiveWeaponToPed(defender2, GetHashKey("weapon_appistol"), 1000, false, true)
    GiveWeaponToPed(defender3, GetHashKey("weapon_pistol_mk2"), 1000, false, true)
    GiveWeaponToPed(defender4, GetHashKey("weapon_vintagepistol"), 1000, false, true)
    GiveWeaponToPed(defender5, GetHashKey("weapon_pistol50"), 1000, false, true)
    GiveWeaponToPed(defender6, GetHashKey("weapon_smg"), 1000, false, true)
    GiveWeaponToPed(defender7, GetHashKey("weapon_combatpdw"), 1000, false, true)

    SetPedArmour(defender1, 200)
    SetPedArmour(defender2, 200)
    SetPedArmour(defender3, 200)
    SetPedArmour(defender4, 200)
    SetPedArmour(defender5, 200)
    SetPedArmour(defender6, 200)
    SetPedArmour(defender7, 200)
    
    TriggerServerEvent("drp-ud:setDefenderSpawned", true)
    TriggerServerEvent("drp-ud:requestVariables")
end

function spawnWave2()
    local defender1Pos = vector3(4.0459, -684.6859, 16.1306)
    local defender2Pos = vector3(-8.2854, -680.3914, 16.1306)
    local defender3Pos = vector3(-0.7415, -675.3206, 16.1306)
    local defender4Pos = vector3(2.1087, -676.3000, 16.1306)
    local defender5Pos = vector3(0.1721, -666.0191, 16.1306)
    local defender6Pos = vector3(10.2273, -668.7737, 16.1306)
    local defender7Pos = vector3(8.3386, -671.1352, 16.1306)
    local defender8Pos = vector3(6.0369, -675.4369, 16.1352)
    local defender9Pos = vector3(0.4780, -660.4468, 16.1312)
    local defender10Pos = vector3(4.1543, -660.3689, 16.1312)
    local defender11Pos = vector3(10.9999, -664.5197, 16.1201)


    local defender1 = CreatePed(4, hash, defender1Pos.x, defender1Pos.y, defender1Pos.z, 0.0, true, true)
    local defender2 = CreatePed(4, hash, defender2Pos.x, defender2Pos.y, defender2Pos.z, 0.0, true, true)
    local defender3 = CreatePed(4, hash, defender3Pos.x, defender3Pos.y, defender3Pos.z, 0.0, true, true)
    local defender4 = CreatePed(4, hash, defender4Pos.x, defender4Pos.y, defender4Pos.z, 0.0, true, true)
    local defender5 = CreatePed(4, hash, defender5Pos.x, defender5Pos.y, defender5Pos.z, 0.0, true, true)
    local defender6 = CreatePed(4, hash, defender6Pos.x, defender6Pos.y, defender6Pos.z, 0.0, true, true)
    local defender7 = CreatePed(4, hash, defender7Pos.x, defender7Pos.y, defender7Pos.z, 0.0, true, true)
    local defender8 = CreatePed(4, hash, defender8Pos.x, defender8Pos.y, defender8Pos.z, 0.0, true, true)
    local defender9 = CreatePed(4, hash, defender9Pos.x, defender9Pos.y, defender9Pos.z, 0.0, true, true)
    local defender10 = CreatePed(4, hash, defender10Pos.x, defender10Pos.y, defender10Pos.z, 0.0, true, true)
    local defender11 = CreatePed(4, hash, defender11Pos.x, defender11Pos.y, defender11Pos.z, 0.0, true, true)
                
    SetEntityAsMissionEntity(defender1, true, true)
    SetEntityAsMissionEntity(defender2, true, true)
    SetEntityAsMissionEntity(defender3, true, true)
    SetEntityAsMissionEntity(defender4, true, true)
    SetEntityAsMissionEntity(defender5, true, true)
    SetEntityAsMissionEntity(defender6, true, true)
    SetEntityAsMissionEntity(defender7, true, true)
    SetEntityAsMissionEntity(defender8, true, true)
    SetEntityAsMissionEntity(defender9, true, true)
    SetEntityAsMissionEntity(defender10, true, true)
    SetEntityAsMissionEntity(defender11, true, true)

    SetPedAsEnemy(defender1, true)
    SetPedAsEnemy(defender2, true)
    SetPedAsEnemy(defender3, true)
    SetPedAsEnemy(defender4, true)
    SetPedAsEnemy(defender5, true)
    SetPedAsEnemy(defender6, true)
    SetPedAsEnemy(defender7, true)
    SetPedAsEnemy(defender8, true)
    SetPedAsEnemy(defender9, true)
    SetPedAsEnemy(defender10, true)
    SetPedAsEnemy(defender11, true)

    SetPedCombatAttributes(defender1, 46, true)
    SetPedCombatAttributes(defender2, 46, true)
    SetPedCombatAttributes(defender3, 46, true)
    SetPedCombatAttributes(defender4, 46, true)
    SetPedCombatAttributes(defender5, 46, true)
    SetPedCombatAttributes(defender6, 46, true)
    SetPedCombatAttributes(defender7, 46, true)
    SetPedCombatAttributes(defender8, 46, true)
    SetPedCombatAttributes(defender9, 46, true)
    SetPedCombatAttributes(defender10, 46, true)
    SetPedCombatAttributes(defender11, 46, true)

    GiveWeaponToPed(defender1, GetHashKey("weapon_pistol"), 1000, false, true)
    GiveWeaponToPed(defender2, GetHashKey("weapon_appistol"), 1000, false, true)
    GiveWeaponToPed(defender3, GetHashKey("weapon_pistol_mk2"), 1000, false, true)
    GiveWeaponToPed(defender4, GetHashKey("weapon_vintagepistol"), 1000, false, true)
    GiveWeaponToPed(defender5, GetHashKey("weapon_pistol50"), 1000, false, true)
    GiveWeaponToPed(defender6, GetHashKey("weapon_smg"), 1000, false, true)
    GiveWeaponToPed(defender7, GetHashKey("weapon_combatpdw"), 1000, false, true)
    GiveWeaponToPed(defender8, GetHashKey("weapon_microsmg"), 1000, false, true)
    GiveWeaponToPed(defender9, GetHashKey("weapon_smg_mk2"), 1000, false, true)
    GiveWeaponToPed(defender10, GetHashKey("weapon_assaultrifle"), 1000, false, true)
    GiveWeaponToPed(defender11, GetHashKey("weapon_assaultrifle_mk2"), 1000, false, true)

    SetPedArmour(defender1, 350)
    SetPedArmour(defender2, 350)
    SetPedArmour(defender3, 350)
    SetPedArmour(defender4, 350)
    SetPedArmour(defender5, 350)
    SetPedArmour(defender6, 350)
    SetPedArmour(defender7, 350)
    SetPedArmour(defender8, 350)
    SetPedArmour(defender9, 350)
    SetPedArmour(defender10, 400)
    SetPedArmour(defender11, 400)
    
    TriggerServerEvent("drp-ud:setDefenderSpawned", true)
    TriggerServerEvent("drp-ud:requestVariables")
end