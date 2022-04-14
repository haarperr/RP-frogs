local s = {}
s["ongoingHeist"] = false
s["defenderSpawned"] = false
s["defender2Spawned"] = false
s["totalThermite"] = 0
s["isElevatorBurned"] = false
s["isThermite1Burned"] = false
s["isThermite2Burned"] = false
s["isThermite3Burned"] = false
s["isThermite4Burned"] = false

-- config
local copCount = -1 -- if not testing then -> 3
local elevatorTime = 1000 -- if not testing then -> 15000

RegisterNetEvent("drp-ud:elevatorcheck")
AddEventHandler("drp-ud:elevatorcheck", function()
    local player = PlayerPedId()
    local coords = GetEntityCoords(player)
    local elevator = vector3(9.9859, -667.3959, 33.4492)
    TriggerServerEvent("drp-ud:requestVariables")
    local distance = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, elevator.x, elevator.y, elevator.z, true)
    if distance < 3 then
        if s["ongoingHeist"] == false then
            if exports["drp-duty"]:LawAmount() >= copCount then
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
                    local bomba = CreateObject(GetHashKey("hei_prop_heist_thermite"), x, y, z + 0.3, true, true, true)

                    SetEntityCollision(bomba, false, true)
                    AttachEntityToEntity(bomba, ped, GetPedBoneIndex(ped, 28422), 0, 0, 0, 0, 0, 200.0, true, true, false, true, 1, true)
                    Citizen.Wait(2000)
                    DeleteObject(bag)
                    SetPedComponentVariation(ped, 5, 45, 0, 0)
                    DetachEntity(bomba, 1, 1)
                    FreezeEntityPosition(bomba, true)
                    TriggerServerEvent("drp-ud:particleserver", method, vector3(x, y, z + 0.3))
                    SetPtfxAssetNextCall("scr_ornate_heist")
                    local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", x, y, z + 0.3, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
                    
                    NetworkStopSynchronisedScene(bagscene)
                    TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_intro", 8.0, 8.0, 1000, 36, 1, 0, 0, 0)
                    TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_loop", 8.0, 8.0, 3000, 49, 1, 0, 0, 0)
                    Citizen.Wait(8500)
                    ClearPedTasks(ped)
                    DeleteObject(bomba)
                    DeleteObject(bag)
                    StopParticleFxLooped(effect, 0)
                    Citizen.Wait(2000)
                    
                    TriggerServerEvent("drp-ud:setVariable", "ongoingHeist", true)
                end,
                function()

                end)
            else
                TriggerEvent('DoLongHudText', 'Not enough police on duty.', 2)
            end
        else
            TriggerEvent('DoLongHudText', 'Already burned.', 2)
        end
    end
end)

RegisterNetEvent("drp-ud:particleclient")
AddEventHandler("drp-ud:particleclient", function(method, vec3)
    local ptfx

    RequestNamedPtfxAsset("scr_ornate_heist")
    while not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
        Citizen.Wait(1)
    end
        ptfx = vector3(vec3.x, vec3.y, vec3.z)
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
        Citizen.Wait(5)       
        
        local enterLocation = vector3(10.2258, -668.2372, 33.4494)
        local exitLocation = vector3(0.6342, -703.1225, 16.1310)
        local playerCoords = GetEntityCoords(PlayerPedId())
        
        if s["ongoingHeist"] then
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
                        Citizen.Trace("Defender Spawned: " .. tostring(s["defenderSpawned"]) .. "\n")
                        if defenderSpawned == false then
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
                            
                            TriggerServerEvent("drp-ud:setVariable", "defenderSpawned", true)
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
                    SetEntityCoords(PlayerPedId(), enterLocation.x, enterLocation.y, enterLocation.z)
                end
            end
        end
        if totalThermite >= 1 then
            TriggerServerEvent("drp-doors:change-lock-state", 543, true, true)
        end
    end
end)

RegisterNetEvent("drp-ud:getVariables")
AddEventHandler("drp-ud:getVariables", function(pagMan)
    s = pagMan
end)

RegisterNetEvent("drp-ud:checkThermite")
AddEventHandler("drp-ud:checkThermite", function(thermite)
    local thermite1Spot = vector4(9.6769, -706.9669, 16.1310, 250.4085)
    local thermite2Spot = vector4(2.2467, -698.3090, 16.1310, 337.7159)
    local thermite3Spot = vector4(-5.4115, -700.2985, 16.1310, 192.9095)
    local thermite4Spot = vector4(1.8693, -688.9332, 16.1310, 241.7260)

    local playerCoords = GetEntityCoords(PlayerPedId())
    -- Door 1 
    if GetDistanceBetweenCoords(thermite1Spot.x, thermite1Spot.y, thermite1Spot.z, playerCoords.x, playerCoords.y, playerCoords.z, true) < 2.5 then
        TriggerEvent("drp-ud:doThermite", thermite1Spot)
    end 
    
    -- Door 2
    if GetDistanceBetweenCoords(thermite2Spot.x, thermite2Spot.y, thermite2Spot.z, playerCoords.x, playerCoords.y, playerCoords.z, true) < 2.5 then
        TriggerEvent("drp-ud:doThermite", thermite2Spot)
    end

    -- Door 3
    if GetDistanceBetweenCoords(thermite3Spot.x, thermite3Spot.y, thermite3Spot.z, playerCoords.x, playerCoords.y, playerCoords.z, true) < 2.5 then
        TriggerEvent("drp-ud:doThermite", thermite3Spot)
    end

    -- Door 4
    if GetDistanceBetweenCoords(thermite4Spot.x, thermite4Spot.y, thermite4Spot.z, playerCoords.x, playerCoords.y, playerCoords.z, true) < 2.5 then
        TriggerEvent("drp-ud:doThermite", thermite4Spot)
    end


end)


RegisterNetEvent("drp-ud:doThermite")
AddEventHandler("drp-ud:doThermite", function(vec4)
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
    
    TaskGoStraightToCoord(PlayerPedId(), vec4.x, vec4.y, vec4.z, 1.0, -1, vec4.w, 0.0)
    Citizen.Wait(4000)
    TriggerEvent('inventory:removeItem', 'thermitecharge', 1)
    exports["blz-memory"]:thermiteminigame(1, 3, 3, 8,
    function()
        local rotx, roty, rotz = table.unpack(vec3(GetEntityRotation(PlayerPedId())))
        local bagscene = NetworkCreateSynchronisedScene(vec4.x, vec4.y, vec4.z, rotx, roty, rotz, 2, false, false, 1065353216, 0, 1.3)
        local bag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), vec4.x, vec4.y, vec4.z, true, true, true)

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
        local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", vec4.x, vec4.y, vec4.z - 0.3, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
        
        NetworkStopSynchronisedScene(bagscene)
        TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_intro", 8.0, 8.0, 1000, 36, 1, 0, 0, 0)
        TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_loop", 8.0, 8.0, 3000, 49, 1, 0, 0, 0)
        Citizen.Wait(10000)
        ClearPedTasks(ped)
        DeleteObject(bomba)
        DeleteObject(bag)
        StopParticleFxLooped(effect, 0)
        Citizen.Wait(2000)

        TriggerServerEvent("drp-ud:addThermite")
    end,
    function()

    end)
end)


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
    
    TriggerServerEvent("drp-ud:setVariable", "defender2Spawned", defender1)
end