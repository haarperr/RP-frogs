
local allowedToGrab = false
local canrobtrolly1 = true
local canrobtrolly2 = true
local canrobtrolly3 = true

RegisterNetEvent("vault:thermitecheck")
AddEventHandler("vault:thermitecheck", function()
    local player = GetEntityCoords(PlayerPedId())
    local distance = #(vector3(256.62463378906, 219.63626098633, 105.28650665283) - player)
    local distance2 = #(vector3(252.6576, 221.1492, 100.6845) - player)
    local distance3 = #(vector3(261.0443, 215.2489, 101.6834) - player)
    if distance < 1.5 then
        TriggerEvent('vault:thermitedoor1')
    end
    if distance2 < 1.5 then
        TriggerEvent('vault:thermitedoor2')
    end
    if distance3 < 1.5 then
        TriggerEvent('vault:thermitedoor3')
    end
end)

RegisterNetEvent("vault:laptopcheck")
AddEventHandler("vault:laptopcheck", function()
    local player = GetEntityCoords(PlayerPedId())
    local distance = #(vector3(261.9811, 223.1754, 105.2842) - player)
    local distance2 = #(vector3(253.33, 228.42, 101.68) - player)
    if distance < 1.5 then
        TriggerEvent('vault:laptopdoor1')
    end
    if distance2 < 1.5 then
        TriggerEvent('vault:laptopdoor2')
    end
end)


RegisterNetEvent("vault:dooraccess")
AddEventHandler("vault:dooraccess", function()
    --Citizen.Wait(300000) -- 5 Minutes then open
    allowedToGrab = true
    createCrates()
    local object = GetClosestObjectOfType(Config.BigBanks["pacific"]["coords"][2]["x"], Config.BigBanks["pacific"]["coords"][2]["y"], Config.BigBanks["pacific"]["coords"][2]["z"], 20.0, Config.BigBanks["pacific"]["object"], false, false, false)
    local timeOut = 10
    local entHeading = Config.BigBanks["pacific"]["heading"].closed

    if object ~= 0 then
        Citizen.CreateThread(function()
            while true do

                if entHeading > Config.BigBanks["pacific"]["heading"].open then
                    SetEntityHeading(object, entHeading - 10)
                    entHeading = entHeading - 0.5
                else
                    break
                end

                Citizen.Wait(10)
            end
        end)
    end
end)




RegisterNetEvent('vault:thermitedoor1') -- Very first door start of robbery
AddEventHandler('vault:thermitedoor1', function()
    local thermite = exports["drp-inventory"]:hasEnoughOfItem("thermitecharge",1,false)
    if thermite then
        placethermite1()
    local pCoords = GetEntityCoords(PlayerPedId())
    local vDoor = GetClosestObjectOfType(pCoords["x"], pCoords["y"], pCoords["z"], 3.0,-222270721, 0, 0, 0)
    if vDoor ~= 0 then
	if exports["isPed"]:isPed("countpolice") >= -1 then
    exports["memorygame"]:thermiteminigame(12, 3, 2, 6,
    function()
        VaultPDNoti()
        TriggerEvent("vault:unlockgate1") 
        TriggerEvent("inventory:removeItem","thermitecharge",1)
        TriggerEvent('cooldown:fixhopefully')
    end,
    function()

        TriggerEvent('DoLongHudText', 'Failed.', 2)
        TriggerEvent("inventory:removeItem","thermitecharge",1)
    end)
else
    TriggerEvent('DoLongHudText', 'Not enough cops!',2)
end
end
else
TriggerEvent('DoLongHudText', 'Missing Something !',2)
end
end) 

RegisterNetEvent('vault:thermitedoor2') -- second gate
AddEventHandler('vault:thermitedoor2', function()
    local thermite = exports["drp-inventory"]:hasEnoughOfItem("thermitecharge",1,false)
    if thermite then
        placethermite2()
    local pCoords = GetEntityCoords(PlayerPedId())
    local vDoor = GetClosestObjectOfType(pCoords["x"], pCoords["y"], pCoords["z"], 3.0,-1508355822, 0, 0, 0)
    if vDoor ~= 0 then
        exports["memorygame"]:thermiteminigame(12, 3, 2, 6,
    function()
        TriggerEvent("vault:unlockgate3") -- 
        TriggerEvent("inventory:removeItem","thermitecharge",1)
        VaultPDNoti()
    end,
    function()
        TriggerEvent('DoLongHudText', 'Failed.', 2)
        TriggerEvent("inventory:removeItem","thermitecharge",1)
        end)
end
else
    TriggerEvent('DoLongHudText', 'Missing Something !',2)
end
end)    

RegisterNetEvent('vault:thermitedoor3') -- last gate in vault 
AddEventHandler('vault:thermitedoor3', function()
    local thermite = exports["drp-inventory"]:hasEnoughOfItem("thermitecharge",1,false)
    if thermite then
        placethermite3()
    local pCoords = GetEntityCoords(PlayerPedId())
    local vDoor = GetClosestObjectOfType(pCoords["x"], pCoords["y"], pCoords["z"], 3.0,-1508355822, 0, 0, 0)
    if vDoor ~= 0 then
    exports["memorygame"]:thermiteminigame(12, 3, 2, 6,
    function()
        TriggerEvent("vault:unlockgate3") 
        TriggerEvent("inventory:removeItem","thermitecharge",1)
        VaultPDNoti()
    end,
    function()
       
        TriggerEvent('DoLongHudText', 'Failed.', 2)
        TriggerEvent("inventory:removeItem","thermitecharge",1)
        end)
end
else
    TriggerEvent('DoLongHudText', 'Missing Something !',2)
end
end)    

RegisterNetEvent('vault:laptopdoor2') -- This will open vault door
AddEventHandler('vault:laptopdoor2', function()

            local pCoords = GetEntityCoords(PlayerPedId())
            local vDoor = GetClosestObjectOfType(pCoords["x"], pCoords["y"], pCoords["z"], 1.0,-160937700, 0, 0, 0)
            if vDoor ~= 0 then
            if exports['drp-inventory']:hasEnoughOfItem('heistlaptop4', 1, false) then
            VaultPDNoti()
            TriggerEvent('drp-robberies:hackinganim', true)
            Citizen.Wait(7000)
            exports["hacking"]:hacking(
                function() -- success
                    TriggerEvent("vault:dooraccess")  
                    TriggerEvent('drp-robberies:hackinganim', false)  
                end,
                function() -- failure
                    if math.random(1, 6) == 1 then
                    TriggerEvent("inventory:removeItem","heistlaptop4",1)
                    end
                    TriggerEvent('drp-robberies:hackinganim', false)
                end)
                            
            if math.random(1, 6) == 1 then
                TriggerEvent("inventory:removeItem","heistlaptop4",1)
     end
  end
end
end)

RegisterNetEvent('vault:laptopdoor1')
AddEventHandler('vault:laptopdoor1', function()
            local pCoords = GetEntityCoords(PlayerPedId())
            local vDoor = GetClosestObjectOfType(pCoords["x"], pCoords["y"], pCoords["z"], 1.0,-160937700, 0, 0, 0)
            if vDoor ~= 0 then
            if exports['drp-inventory']:hasEnoughOfItem('heistlaptop4', 1, false) then
            TriggerEvent('drp-robberies:hackinganim', true)
            Citizen.Wait(7000)
            exports["hacking"]:hacking(
                function() -- success
                    TriggerEvent("vault:unlockgate2")
                    TriggerEvent('drp-robberies:hackinganim', false)  
                end,
                function() -- failure
                    if math.random(1, 6) == 1 then
                    TriggerEvent("inventory:removeItem","heistlaptop4",1)
                    end
                    TriggerEvent('drp-robberies:hackinganim', false)
                end)
                            
            if math.random(1, 6) == 1 then
                TriggerEvent("inventory:removeItem","heistlaptop4",1)
        end
    end
end
end)


RegisterNetEvent("vault:fx3")
AddEventHandler("vault:fx3", function(method)
    local ptfx

    RequestNamedPtfxAsset("scr_ornate_heist")
    while not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
        Citizen.Wait(1)
    end
    ptfx = vector3(261.6857, 216.8138, 101.6834)
    SetPtfxAssetNextCall("scr_ornate_heist")
    local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", ptfx, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
    Citizen.Wait(4000)
    StopParticleFxLooped(effect, 0)
end)

RegisterNetEvent("vault:fx1")
AddEventHandler("vault:fx1", function(method)
    local ptfx

    RequestNamedPtfxAsset("scr_ornate_heist")
    while not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
        Citizen.Wait(1)
    end
        ptfx = vector3(257.1248, 221.1111, 106.2853)
    SetPtfxAssetNextCall("scr_ornate_heist")
    local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", ptfx, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
    Citizen.Wait(4000)
    StopParticleFxLooped(effect, 0)
end)

RegisterNetEvent("vault:fx2")
AddEventHandler("vault:fx2", function(method)
    local ptfx

    RequestNamedPtfxAsset("scr_ornate_heist")
    while not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
        Citizen.Wait(1)
    end
        ptfx = vector3(252.7835, 222.061, 101.6834)
    SetPtfxAssetNextCall("scr_ornate_heist")
    local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", ptfx, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
    Citizen.Wait(4000)
    StopParticleFxLooped(effect, 0)
end)



RegisterNetEvent('vault:unlockgate3')
AddEventHandler('vault:unlockgate3', function()
	secondDoorAnimation()
	TriggerServerEvent('drp-doors:change-lock-state', 51, false) 
end)

RegisterNetEvent('vault:unlockgate2')
AddEventHandler('vault:unlockgate2', function()
	
	TriggerServerEvent('drp-doors:change-lock-state', 50, false) 
end)

RegisterNetEvent('vault:unlockgate3')
AddEventHandler('vault:unlockgate3', function()
	ThirdDoorAnimation()
	TriggerServerEvent('drp-doors:change-lock-state', 52, false) 
end)

RegisterNetEvent('vault:unlockgate1')  
AddEventHandler('vault:unlockgate1', function()
	FirstDoorAnimation()
    TriggerServerEvent('drp-doors:change-lock-state', 48, false) 
end)

function createCrates()
    local weaponbox = CreateObject(GetHashKey("hei_prop_hei_cash_trolly_01"), 260.2569, 216.6969, 100.7, true,  true, true)
    CreateObject(weaponbox)
    SetEntityHeading(weaponbox, 39.34)
    FreezeEntityPosition(weaponbox, true)

    local weaponbox3 = CreateObject(GetHashKey("hei_prop_hei_cash_trolly_01"), 263.4992, 215.5975, 100.7, true,  true, true)
    CreateObject(weaponbox3)
    SetEntityHeading(weaponbox3, 155.9427)
    FreezeEntityPosition(weaponbox3, true) 

    local weaponbox4 = CreateObject(GetHashKey("hei_prop_hei_cash_trolly_01"), 265.0378, 212.4969, 100.7, true,  true, true)
    CreateObject(weaponbox4)
    SetEntityHeading(weaponbox4, 333.677)
    FreezeEntityPosition(weaponbox4, true)
end

function placethermite1()
    RequestAnimDict("anim@heists@ornate_bank@thermal_charge")
    RequestModel("hei_p_m_bag_var22_arm_s")
    RequestNamedPtfxAsset("scr_ornate_heist")
    while not HasAnimDictLoaded("anim@heists@ornate_bank@thermal_charge") and not HasModelLoaded("hei_p_m_bag_var22_arm_s") and not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
        Citizen.Wait(50)
    end
    local ped = PlayerPedId()

    SetEntityHeading(ped, 334.8091)
    Citizen.Wait(100)
    local rotx, roty, rotz = table.unpack(vec3(GetEntityRotation(PlayerPedId())))
    
    local bagscene = NetworkCreateSynchronisedScene(257.1732, 220.3132, 106.2849,  rotx, roty, rotz + 1.1, 2, false, false, 1065353216, 0, 1.3)
    local bag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), 257.1732, 220.3132, 106.2849,  true,  true, false)

    SetEntityCollision(bag, false, true)
    NetworkAddPedToSynchronisedScene(ped, bagscene, "anim@heists@ornate_bank@thermal_charge", "thermal_charge", 1.2, -4.0, 1, 16, 1065353216, 0)
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
    --SetPedComponentVariation(ped, 5, 45, 0, 0)
    DetachEntity(bomba, 1, 1)
    FreezeEntityPosition(bomba, true)
    Citizen.Wait(1000)
    ClearPedTasks(ped)
    DeleteObject(bomba)
    StopParticleFxLooped(effect, 0)
end

function placethermite2()
    RequestAnimDict("anim@heists@ornate_bank@thermal_charge")
    RequestModel("hei_p_m_bag_var22_arm_s")
    RequestNamedPtfxAsset("scr_ornate_heist")
    while not HasAnimDictLoaded("anim@heists@ornate_bank@thermal_charge") and not HasModelLoaded("hei_p_m_bag_var22_arm_s") and not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
        Citizen.Wait(50)
    end
    local ped = PlayerPedId()

    SetEntityHeading(ped, 168.91)
    Citizen.Wait(100)
    local rotx, roty, rotz = table.unpack(vec3(GetEntityRotation(PlayerPedId())))
    local bagscene = NetworkCreateSynchronisedScene(252.8131, 220.7777, 101.6833, rotx, roty, rotz + 1.1, 2, false, false, 1065353216, 0, 1.3)
    local bag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), 252.7777, 220.8791, 101.6833,  true,  true, false)

    SetEntityCollision(bag, false, true)
    NetworkAddPedToSynchronisedScene(ped, bagscene, "anim@heists@ornate_bank@thermal_charge", "thermal_charge", 1.2, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, bagscene, "anim@heists@ornate_bank@thermal_charge", "bag_thermal_charge", 4.0, -8.0, 1)
    SetPedComponentVariation(ped, 5, 0, 0, 0)
    NetworkStartSynchronisedScene(bagscene)
    Citizen.Wait(1500)
    local x, y, z = table.unpack(GetEntityCoords(ped))
    local bomba = CreateObject(GetHashKey("hei_prop_heist_thermite"), x, y, z + 0.4,  true,  true, true)

    SetEntityCollision(bomba, false, true)
    AttachEntityToEntity(bomba, ped, GetPedBoneIndex(ped, 28422), 0, 0, 0, 0, 0, 200.0, true, true, false, true, 1, true)
    Citizen.Wait(2000)
    DeleteObject(bag)
    --SetPedComponentVariation(ped, 5, 45, 0, 0)
    DetachEntity(bomba, 1, 1)
    FreezeEntityPosition(bomba, true)
    Citizen.Wait(1000)
    ClearPedTasks(ped)
    DeleteObject(bomba)
    StopParticleFxLooped(effect, 0)

end


function placethermite3()
    RequestAnimDict("anim@heists@ornate_bank@thermal_charge")
    RequestModel("hei_p_m_bag_var22_arm_s")
    RequestNamedPtfxAsset("scr_ornate_heist")
    while not HasAnimDictLoaded("anim@heists@ornate_bank@thermal_charge") and not HasModelLoaded("hei_p_m_bag_var22_arm_s") and not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
        Citizen.Wait(50)
    end
    local ped = PlayerPedId()

    SetEntityHeading(ped, 247.194)
    Citizen.Wait(100)
    local rotx, roty, rotz = table.unpack(vec3(GetEntityRotation(PlayerPedId())))
    local bagscene = NetworkCreateSynchronisedScene(261.6666, 215.6335, 101.6834, rotx, roty, rotz + 1.1, 2, false, false, 1065353216, 0, 1.3)
    local bag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), 261.6666, 215.6335, 101.6834,  true,  true, false)

    SetEntityCollision(bag, false, true)
    NetworkAddPedToSynchronisedScene(ped, bagscene, "anim@heists@ornate_bank@thermal_charge", "thermal_charge", 1.2, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, bagscene, "anim@heists@ornate_bank@thermal_charge", "bag_thermal_charge", 4.0, -8.0, 1)
    SetPedComponentVariation(ped, 5, 0, 0, 0)
    NetworkStartSynchronisedScene(bagscene)
    Citizen.Wait(1500)
    local x, y, z = table.unpack(GetEntityCoords(ped))
    local bomba = CreateObject(GetHashKey("hei_prop_heist_thermite"), x, y, z + 0.4,  true,  true, true)

    SetEntityCollision(bomba, false, true)
    AttachEntityToEntity(bomba, ped, GetPedBoneIndex(ped, 28422), 0, 0, 0, 0, 0, 200.0, true, true, false, true, 1, true)
    Citizen.Wait(2000)
    DeleteObject(bag)
    --SetPedComponentVariation(ped, 5, 45, 0, 0)
    DetachEntity(bomba, 1, 1)
    FreezeEntityPosition(bomba, true)
    Citizen.Wait(1000)
    ClearPedTasks(ped)
    DeleteObject(bomba)
    StopParticleFxLooped(effect, 0)
end


function FirstDoorAnimation()
   
    TriggerEvent("vault:fx1")
    SetPtfxAssetNextCall("scr_ornate_heist")
    local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", ptfx, 0.0, 0.0, 0.0, 1.0, false, false, false, false)

    NetworkStopSynchronisedScene(bagscene)
    TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_intro", 8.0, 8.0, 1000, 36, 1, 0, 0, 0)
    TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_loop", 8.0, 8.0, 3000, 49, 1, 0, 0, 0)
    Citizen.Wait(5000)
    ClearPedTasks(ped)
    DeleteObject(bomba)
    StopParticleFxLooped(effect, 0)
end

function secondDoorAnimation()


    TriggerEvent("vault:fx2")
    SetPtfxAssetNextCall("scr_ornate_heist")
    local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", ptfx, 0.0, 0.0, 0.0, 1.0, false, false, false, false)

    NetworkStopSynchronisedScene(bagscene)
    TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_intro", 8.0, 8.0, 1000, 36, 1, 0, 0, 0)
    TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_loop", 8.0, 8.0, 3000, 49, 1, 0, 0, 0)
    Citizen.Wait(5000)
    ClearPedTasks(ped)
    DeleteObject(bomba)
    StopParticleFxLooped(effect, 0)
end


function ThirdDoorAnimation()
   
    TriggerEvent("vault:fx3")
    SetPtfxAssetNextCall("scr_ornate_heist")
    local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", ptfx, 0.0, 0.0, 0.0, 1.0, false, false, false, false)

    NetworkStopSynchronisedScene(bagscene)
    TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_intro", 8.0, 8.0, 1000, 36, 1, 0, 0, 0)
    TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_loop", 8.0, 8.0, 3000, 49, 1, 0, 0, 0)
    Citizen.Wait(5000)
    ClearPedTasks(ped)
    DeleteObject(bomba)
    StopParticleFxLooped(effect, 0)
end



RegisterNetEvent('grabtrolly1') -- Some times trollys bug and do not delete so this will prevent people grabbing over and over again
AddEventHandler('grabtrolly1',function()
    if canrobtrolly1 == true then    
    StartGrabing(name)
    canrobtrolly1 = false
elseif canrobtrolly1 == false then
    TriggerEvent('DoLongHudText', 'Already Grabbed !' ,2)
end
end)


RegisterNetEvent('grabtrolly2')
AddEventHandler('grabtrolly2',function()
    if canrobtrolly2 == true then    
    StartGrabing(name)
    canrobtrolly2 = false
    elseif canrobtrolly2 == false then
        TriggerEvent('DoLongHudText', 'Already Grabbed !',2)
    end
end)

RegisterNetEvent('grabtrolly3')
AddEventHandler('grabtrolly3',function()
    if canrobtrolly3 == true then    
    StartGrabing(name)
    canrobtrolly3 = false
    elseif canrobtrolly3 == false then
        TriggerEvent('DoLongHudText', 'Already Grabbed !',2)
    end
end)


function StartGrabing(name)
    disableinput = true
    local ped = PlayerPedId()
    local model = "hei_prop_heist_cash_pile"
    Trolley = GetClosestObjectOfType(GetEntityCoords(ped), 1.0, GetHashKey("hei_prop_hei_cash_trolly_01"), false, false, false)
    local CashAppear = function()
	    local pedCoords = GetEntityCoords(ped)
        local grabmodel = GetHashKey(model)

        RequestModel(grabmodel)
        while not HasModelLoaded(grabmodel) do
            Citizen.Wait(100)
        end
	    local grabobj = CreateObject(grabmodel, pedCoords, true)

	    FreezeEntityPosition(grabobj, true)
	    SetEntityInvincible(grabobj, true)
	    SetEntityNoCollisionEntity(grabobj, ped)
	    SetEntityVisible(grabobj, false, false)
	    AttachEntityToEntity(grabobj, ped, GetPedBoneIndex(ped, 60309), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 0, true)
	    local startedGrabbing = GetGameTimer()

	    Citizen.CreateThread(function()
		    while GetGameTimer() - startedGrabbing < 37000 do
                Citizen.Wait(1)
                local mathfunc = math.random(1, 2)
                local matherino = math.random(1, 25)
			    DisableControlAction(0, 73, true)
			    if HasAnimEventFired(ped, GetHashKey("CASH_APPEAR")) then
				    if not IsEntityVisible(grabobj) then
					    SetEntityVisible(grabobj, true, false)
				    end
			    end
			    if HasAnimEventFired(ped, GetHashKey("RELEASE_CASH_DESTROY")) then
                    if IsEntityVisible(grabobj) then
                        if mathfunc == 2 then
                        end
                        SetEntityVisible(grabobj, false, false)
				    end
			    end
		    end
		    DeleteObject(grabobj)
            TriggerServerEvent( 'mission:completed', math.random(25000, 50000))
            TriggerEvent( "player:receiveItem", "markedbills", math.random(20, 50))
            if math.random(100) < 35 then -- Yellow Dongle Chance 35%
                TriggerEvent('player:receiveItem',"heistusb3", 1)
                end
            if math.random(100) < 85 then -- Big Bag Chance 85%
                TriggerEvent( "player:receiveItem", "inkedmoneybag", math.random(2, 4))
            end
            DeleteObject(bag)
	    end)
    end
	local trollyobj = Trolley
    local emptyobj = GetHashKey("hei_prop_hei_cash_trolly_03")

	if IsEntityPlayingAnim(trollyobj, "anim@heists@ornate_bank@grab_cash", "cart_cash_dissapear", 3) then
		return
    end
    local baghash = GetHashKey("hei_p_m_bag_var22_arm_s")

    RequestAnimDict("anim@heists@ornate_bank@grab_cash")
    RequestModel(baghash)
    RequestModel(emptyobj)
    while not HasAnimDictLoaded("anim@heists@ornate_bank@grab_cash") and not HasModelLoaded(emptyobj) and not HasModelLoaded(baghash) do
        Citizen.Wait(100)
    end
	while not NetworkHasControlOfEntity(trollyobj) do
		Citizen.Wait(1)
		NetworkRequestControlOfEntity(trollyobj)
	end
	local bag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), GetEntityCoords(PlayerPedId()), true, false, false)
    local scene1 = NetworkCreateSynchronisedScene(GetEntityCoords(trollyobj), GetEntityRotation(trollyobj), 2, false, false, 1065353216, 0, 1.3)

	NetworkAddPedToSynchronisedScene(ped, scene1, "anim@heists@ornate_bank@grab_cash", "intro", 1.5, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, scene1, "anim@heists@ornate_bank@grab_cash", "bag_intro", 4.0, -8.0, 1)
    SetPedComponentVariation(ped, 5, 0, 0, 0)
	NetworkStartSynchronisedScene(scene1)
	Citizen.Wait(1500)
	CashAppear()
	local scene2 = NetworkCreateSynchronisedScene(GetEntityCoords(trollyobj), GetEntityRotation(trollyobj), 2, false, false, 1065353216, 0, 1.3)

	NetworkAddPedToSynchronisedScene(ped, scene2, "anim@heists@ornate_bank@grab_cash", "grab", 1.5, -4.0, 1, 16, 1148846080, 0)
	NetworkAddEntityToSynchronisedScene(bag, scene2, "anim@heists@ornate_bank@grab_cash", "bag_grab", 4.0, -8.0, 1)
	NetworkAddEntityToSynchronisedScene(trollyobj, scene2, "anim@heists@ornate_bank@grab_cash", "cart_cash_dissapear", 4.0, -8.0, 1)
	NetworkStartSynchronisedScene(scene2)
	Citizen.Wait(37000)
	local scene3 = NetworkCreateSynchronisedScene(GetEntityCoords(trollyobj), GetEntityRotation(trollyobj), 2, false, false, 1065353216, 0, 1.3)

	NetworkAddPedToSynchronisedScene(ped, scene3, "anim@heists@ornate_bank@grab_cash", "exit", 1.5, -4.0, 1, 16, 1148846080, 0)
	NetworkAddEntityToSynchronisedScene(bag, scene3, "anim@heists@ornate_bank@grab_cash", "bag_exit", 4.0, -8.0, 1)
	NetworkStartSynchronisedScene(scene3)
	while not NetworkHasControlOfEntity(trollyobj) do
		Citizen.Wait(1)
		NetworkRequestControlOfEntity(trollyobj)
	end
	DeleteObject(trollyobj)
	Citizen.Wait(1800)
	DeleteObject(bag)
    --SetPedComponentVariation(ped, 5, 45, 0, 0)
	RemoveAnimDict("anim@heists@ornate_bank@grab_cash")
	SetModelAsNoLongerNeeded(emptyobj)
    SetModelAsNoLongerNeeded(GetHashKey("hei_p_m_bag_var22_arm_s"))
    disableinput = false
end


function VaultPDNoti()
    local street1 = GetStreetAndZone()
    local gender = IsPedMale(PlayerPedId())
    local plyPos = GetEntityCoords(PlayerPedId(), true)

  
    local dispatchCode = "10-90A"

  
    TriggerServerEvent('dispatch:svNotify', {
      dispatchCode = dispatchCode,
      firstStreet = street1,
      gender = gender,

      isImportant = true,
          priority = 3,
      dispatchMessage = "Robbery In Progress At The Vault",
      recipientList = {
        police = "police"
      },
      origin = {
        x = plyPos.x,
        y = plyPos.y,
        z = plyPos.z
      }
    })
  
    TriggerEvent('drp-dispatch:DispatchVaultAlert')
--        Wait(math.random(5000,15000))

  end



function GetStreetAndZone()
local plyPos = GetEntityCoords(PlayerPedId(),  true)
local s1, s2 = Citizen.InvokeNative( 0x2EB41072B4C1E4C0, plyPos.x, plyPos.y, plyPos.z, Citizen.PointerValueInt(), Citizen.PointerValueInt() )
local street1 = GetStreetNameFromHashKey(s1)
local street2 = GetStreetNameFromHashKey(s2)
zone = tostring(GetNameOfZone(plyPos.x, plyPos.y, plyPos.z))
local playerStreetsLocation = GetLabelText(zone)
local street = street1 .. ", " .. playerStreetsLocation
return street
end



RegisterNetEvent('vault:Reset')
AddEventHandler('vault:Reset', function()
  TriggerServerEvent("drp-doors:change-lock-state", 49, true)
  TriggerServerEvent('drp-doors:change-lock-state', 48, true)
  TriggerServerEvent('drp-doors:change-lock-state', 46, true)
  TriggerServerEvent('drp-doors:change-lock-state', 50, true) 
  allowedToGrab = false
end)




RegisterNetEvent('cooldown:fixhopefully')
AddEventHandler('cooldown:fixhopefully', function()
print('V Cool Start')
Citizen.Wait(3.6e+6) -- 60 Minute timer then reset all door states n shit for the vault
print('V Cool End')
TriggerEvent("vault:Reset") 
canrobtrolly1 = true
canrobtrolly2 = true
canrobtrolly3 = true
end)