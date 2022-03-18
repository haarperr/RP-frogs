
---------------------------------------------------------------------------------
--  
--           Animations Below
--
---------------------------------------------------------------------------------

function FirstDoorBobcatAnim() -- First Door Bag animation
    RequestAnimDict("anim@heists@ornate_bank@thermal_charge")
    RequestModel("hei_p_m_bag_var22_arm_s")
    RequestNamedPtfxAsset("scr_ornate_heist")
    while not HasAnimDictLoaded("anim@heists@ornate_bank@thermal_charge") and not HasModelLoaded("hei_p_m_bag_var22_arm_s") and not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
        Citizen.Wait(50)
    end
    local ped = PlayerPedId()

    SetEntityHeading(ped, 170.52)
    Citizen.Wait(100)
    local rotx, roty, rotz = table.unpack(vec3(GetEntityRotation(PlayerPedId())))
    local bagscene = NetworkCreateSynchronisedScene(882.1660, -2258.35, 32.461, rotx, roty, rotz + 1.1, 2, false, false, 1065353216, 0, 1.3)
    local bag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), 882.1660, -2258.35, 32.461,  true,  true, false)

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
    TriggerServerEvent("ghost:particleserver", method)
    SetPtfxAssetNextCall("scr_ornate_heist")
    local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", ptfx, 0.0, 0.0, 0.0, 1.0, false, false, false, false)

    NetworkStopSynchronisedScene(bagscene)
    TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_intro", 8.0, 8.0, 1000, 36, 1, 0, 0, 0)
    TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_loop", 8.0, 8.0, 3000, 49, 1, 0, 0, 0)
    Citizen.Wait(5000)
    ClearPedTasks(ped)
    DeleteObject(bomba)
    StopParticleFxLooped(effect, 0)
    TriggerEvent("ghost:changeLocksFirstDoor")
end

function Number2DoorAnimation() -- Second Door Bag Animation
    RequestAnimDict("anim@heists@ornate_bank@thermal_charge")
    RequestModel("hei_p_m_bag_var22_arm_s")
    RequestNamedPtfxAsset("scr_ornate_heist")
    while not HasAnimDictLoaded("anim@heists@ornate_bank@thermal_charge") and not HasModelLoaded("hei_p_m_bag_var22_arm_s") and not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
        Citizen.Wait(50)
    end
    local ped = PlayerPedId()

    SetEntityHeading(ped, 170.52)
    Citizen.Wait(100)
    local rotx, roty, rotz = table.unpack(vec3(GetEntityRotation(PlayerPedId())))
    local bagscene = NetworkCreateSynchronisedScene(880.4080, -2264.50, 32.441, rotx, roty, rotz + 1.1, 2, false, false, 1065353216, 0, 1.3)
    local bag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), 880.4080, -2264.50, 32.441,  true,  true, false)

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
    SetPedComponentVariation(ped, 5, 45, 0, 0)
    DetachEntity(bomba, 1, 1)
    FreezeEntityPosition(bomba, true)
    TriggerServerEvent("ghost:particleserversec", method)
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



RegisterNetEvent("ghost:ptfxparticle")   --- Effects for thermite
AddEventHandler("ghost:ptfxparticle", function(method)
    local ptfx

    RequestNamedPtfxAsset("scr_ornate_heist")
    while not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
        Citizen.Wait(1)
    end
        ptfx = vector3(882.1320, -2257.34, 32.461)
    SetPtfxAssetNextCall("scr_ornate_heist")
    local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", ptfx, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
    Citizen.Wait(4000)
    StopParticleFxLooped(effect, 0)
end)

RegisterNetEvent("ghost:ptfxparticlesec")      --- Effects for thermite
AddEventHandler("ghost:ptfxparticlesec", function(method)
    local ptfx

    RequestNamedPtfxAsset("scr_ornate_heist")
    while not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
        Citizen.Wait(1)
    end
        ptfx = vector3(880.49, -2263.60, 32.441)
    SetPtfxAssetNextCall("scr_ornate_heist")
    local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", ptfx, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
    Citizen.Wait(4000)
    StopParticleFxLooped(effect, 0)
end)




---------------------------------------------------------------------------------
--  
--           Events Below
--
---------------------------------------------------------------------------------


RegisterNetEvent('ghost:ThermiteFirstDoor') -- Very first door
AddEventHandler('ghost:ThermiteFirstDoor', function()
    local pCoords = GetEntityCoords(PlayerPedId())
    local vDoor = GetClosestObjectOfType(pCoords["x"], pCoords["y"], pCoords["z"], 3.0, -1259801187, 0, 0, 0)
    local thermite = exports["drp-inventory"]:hasEnoughOfItem("thermite",1,false)
    if thermite then
    if vDoor ~= 0 then
	if exports["isPed"]:isPed("countpolice") >= 4 then
    exports["memorygame"]:thermiteminigame(12, 3, 2, 6,
    function()
        TriggerEvent("inventory:removeItem","thermite",1)
        AlertBobCat()
        TriggerServerEvent('startcooldown:fixhopefully') 
        FirstDoorBobcatAnim()
    end,
    function()
        TriggerEvent('DoLongHudText', 'Failed.')
        TriggerEvent("inventory:removeItem","thermite",1)
        end)
    else
        TriggerEvent('DoLongHudText', 'Not enough cops!',2)
    end
end
else
    TriggerEvent('DoLongHudText', 'Missing Something !',2)
end
end)    

RegisterNetEvent('ghost:secondoor') -- Second door thermite
AddEventHandler('ghost:secondoor', function()
    local pCoords = GetEntityCoords(PlayerPedId())
    local vDoor = GetClosestObjectOfType(pCoords["x"], pCoords["y"], pCoords["z"], 3.0, -551608542, 0, 0, 0)
    local thermite = exports["drp-inventory"]:hasEnoughOfItem("thermite",1,false)
    if thermite then
    if vDoor ~=        0 then
    exports["memorygame"]:thermiteminigame(13, 4, 2, 6,
    function() 
        TriggerEvent("ghost:unlockSecondDoor")
        TriggerEvent("inventory:removeItem","thermite",1)
    end,
    function()
        TriggerEvent('DoLongHudText', 'Failed.')
        TriggerEvent("inventory:removeItem","thermite",1)
    end)

end
else
TriggerEvent('DoLongHudText', 'Missing Something !',2)
end
end)

RegisterNetEvent('ghost:keypad') -- third set of doors
AddEventHandler('ghost:keypad', function()
    local pCoords = GetEntityCoords(PlayerPedId())
    local ped = PlayerPedId()
            if exports['drp-inventory']:hasEnoughOfItem('securitycard', 1) then
                AlertBobCat()
                TriggerEvent("inventory:removeItem","securitycard", 1)
                FreezeEntityPosition(ped, true)
                RequestAnimDict("anim@amb@business@meth@meth_monitoring_cooking@monitoring@")
                while not HasAnimDictLoaded("anim@amb@business@meth@meth_monitoring_cooking@monitoring@") do Citizen.Wait(0) end
                TaskPlayAnim(ped, "anim@amb@business@meth@meth_monitoring_cooking@monitoring@", "look_around_v5_monitor", 8.0, 8.0, 1.0, 48, -1, 0, 0, 0)
                local finished = exports["drp-taskbar"]:taskBar(10000,"Pressing Buttons...",false,true)
                if finished == 100 then
                FreezeEntityPosition(ped, false)
                TriggerEvent("DoLongHudText", "Access Granted")
                TriggerServerEvent('ghost:ServerPeds')
                TriggerServerEvent('drp-doors:change-lock-state', 271, false) 
                TriggerServerEvent('drp-doors:change-lock-state', 272, false)
                end
            else
                TriggerEvent('DoLongHudText', 'Access Denied !',2)
            end
    end)


---------------------------------------------------------------------------------
--  
--           Door states n shit Below
--
---------------------------------------------------------------------------------
RegisterNetEvent('ghost:unlockSecondDoor')
AddEventHandler('ghost:unlockSecondDoor', function()
	Number2DoorAnimation()
	TriggerServerEvent('drp-doors:change-lock-state', 270, false)
end)


RegisterNetEvent('ghost:changeLocksFirstDoor') 
AddEventHandler('ghost:changeLocksFirstDoor', function()
    TriggerServerEvent('drp-doors:change-lock-state', 269, false) --  Door on left  fuck locks 
    TriggerServerEvent('drp-doors:change-lock-state', 268, false) --  Door on right
end)

RegisterNetEvent('ghost:changeseconddoorlocks') -- Second Door 
AddEventHandler('ghost:changeseconddoorlocks', function()
	TriggerServerEvent('drp-doors:change-lock-state', 272, false)
end)



    function AlertBobCat()
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
          dispatchMessage = "Robbery Reported At Bobcat Security",
          recipientList = {
            police = "police"
          },
          origin = {
            x = plyPos.x,
            y = plyPos.y,
            z = plyPos.z
          }
        })
      
        TriggerEvent('drp-dispatch:dispatchBobcat')
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

RegisterNetEvent('ghost:createCrates')
AddEventHandler('ghost:createCrates', function(toggle)
    if toggle == true then
     weaponbox = CreateObject(GetHashKey("ex_prop_crate_ammo_sc"), 888.0774, -2287.33, 31.441, true,  true, true)
    CreateObject(weaponbox)
    SetEntityHeading(weaponbox, 176.02)
    FreezeEntityPosition(weaponbox, true)

     weaponbox4 = CreateObject(GetHashKey("ex_prop_crate_ammo_bc"), 881.4557, -2282.61, 31.441, true,  true, true)
    CreateObject(weaponbox4)
    SetEntityHeading(weaponbox4, 52.02)
    FreezeEntityPosition(weaponbox4, true)

    elseif toggle == false then
        DeleteObject(weaponbox)
        DeleteObject(weaponbox4)
        DeleteObject(weaponbox3)
    end
end)


function CreatenBrakeCrates()
    local ped = PlayerPedId()

    TriggerEvent('ghost:CleanClientVaultD')
    TriggerEvent("ghost:createCrates" ,true)

    TriggerEvent('DoLongHudText', 'The crates will be destroyed in 5 minutes be fast.. ' ,ped)
    Citizen.Trace("Crates Spawned :  Sucess")
    Citizen.Wait(240000) -- 4 mins 
    TriggerEvent('DoLongHudText', 'The crates will be destroyed in 1 minute' ,ped)
    Citizen.Wait(60000) -- 1 min warning then delete 
    TriggerEvent("ghost:createCrates" ,false)
    Citizen.Trace("Crates Remove :  Timer Complete Removed")
  end

RegisterNetEvent('ghost:changeVaultDoorState')
AddEventHandler('ghost:changeVaultDoorState', function()
	local interiorid = GetInteriorAtCoords(883.4142, -2282.372, 31.44168)
	ActivateInteriorEntitySet(interiorid, "np_prolog_broken")
    Citizen.Trace("ActivateInterior : Broken ")
	RemoveIpl(interiorid, "np_prolog_broken")
	DeactivateInteriorEntitySet(interiorid, "np_prolog_clean")
	RefreshInterior(interiorid)
end)


local searched = true
local searchedSecond = true

RegisterNetEvent('ghost:searchCrate') -- Searching crate 
AddEventHandler('ghost:searchCrate', function()
    if searchedSecond == true then
    TriggerServerEvent( 'mission:completed', math.random(900, 6783))
    TriggerServerEvent('drp-bobcat:reward')
    searchedSecond = false
    if math.random(4) == 3 then
		TriggerEvent("player:receiveItem", "1593441988",math.random(1,1)) 
        TriggerEvent("player:receiveItem", "band",math.random(10,20))
        TriggerEvent("player:receiveItem", "ifak",math.random(10,20))
    end
    searchedSecond = false
    else
        TriggerEvent('DoLongHudText', 'Already Searched !',2)
    end
end)

RegisterNetEvent('ghost:searchCrate2') -- Searching crate 
AddEventHandler('ghost:searchCrate2', function()
    if searched == true then
        searched = false
        TriggerServerEvent('drp-bobcat:reward')
        if math.random(4) == 3 then
            TriggerEvent("player:receiveItem", "handcuffs",math.random(2,4)) 
            TriggerEvent("player:receiveItem", "oxy",math.random(10,20)) -- tec 9
            TriggerEvent("player:receiveItem", "band",math.random(10,25))
            searched = false
        end
else
    TriggerEvent('DoLongHudText', 'Already Searched !',2)
end
end)

RegisterNetEvent('ghost:CleanClientVaultD')
AddEventHandler('ghost:CleanClientVaultD', function()
	local interiorid = GetInteriorAtCoords(883.4142, -2282.372, 31.44168)
	ActivateInteriorEntitySet(interiorid, "np_prolog_clean")
	RemoveIpl(interiorid, "np_prolog_broken")
	DeactivateInteriorEntitySet(interiorid, "np_prolog_broken")
	RefreshInterior(interiorid)
end)


function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end

Citizen.CreateThread(function()
    local hash = GetHashKey("s_m_m_armoured_01")
    while not HasModelLoaded(hash) do
    RequestModel(hash)
    Wait(20)
end
    gaurdped = CreatePed("PED_TYPE_CIVFEMALE", "s_m_m_armoured_01", 870.1760, -2288.20, 31.441, 175.21, false, false)
    SetBlockingOfNonTemporaryEvents(gaurdped, true)
    SetPedDiesWhenInjured(gaurdped, false)
    SetPedCanPlayAmbientAnims(gaurdped, true)
    SetPedCanRagdollFromPlayerImpact(gaurdped, false)
	SetEntityInvincible(gaurdped, false)
    local animLength = GetAnimDuration("random@arrests@busted", "idle_a")
    TaskPlayAnim(gaurdped, "random@arrests@busted", "idle_a", 1.0, 4.0, animLength, 2, 0, 0, 0, 0)
end)

RegisterNetEvent('ghost:pedblowtheDoorStart')
AddEventHandler('ghost:pedblowtheDoorStart', function()
	ClearPedTasks(gaurdped)
	TaskGoStraightToCoord(gaurdped, 869.2078, -2292.60, 32.441, 150.0, -1, 265.61, 0)
	Citizen.Wait(5000)
	TaskGoStraightToCoord(gaurdped, 893.3309, -2294.90, 32.441, 150.0, -1, 350.61, 0)
	Citizen.Wait(13000)
	TriggerEvent('ghost:ghostpedStage3')
end)


RegisterNetEvent('ghost:ghostpedStage3')
AddEventHandler('ghost:ghostpedStage3', function()
	TaskGoStraightToCoord(gaurdped, 894.6337, -2284.97, 32.441, 150.0, -1, 82.56, 0)
	Citizen.Wait(5500)

    GiveWeaponToPed(gaurdped, 741814745, 1, false, true)
    SetCurrentPedWeapon(gaurdped, 741814745, true)
    Citizen.Wait(1000)
    ClearPedTasksImmediately(gaurdped)
    TaskThrowProjectile(gaurdped, vector3(890.518, -2285.068, 31.62272))
	Citizen.Wait(1000)
    GhostBoom()
end)

         
RegisterNetEvent('ghost:resetvault')
AddEventHandler('ghost:resetvault', function()
    TriggerServerEvent('ghost:serverResetDoorVault')
    end)


RegisterNetEvent('ghost:createAngryPeds')
AddEventHandler('ghost:createAngryPeds', function()
		bobcatped2 = CreatePed(30, 	-1782092083, 894.6846, -2284.772, 32.4417, 2.38102, true, false)
		SetPedArmour(bobcatped2, 500)
		SetPedAsEnemy(bobcatped2, true)
		SetPedRelationshipGroupHash(bobcatped2, 'ghost')
		GiveWeaponToPed(bobcatped2, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
		TaskCombatPed(bobcatped2, GetPlayerPed(-1))
		SetPedAccuracy(bobcatped2, 100)
		SetPedDropsWeaponsWhenDead(bobcatped2, false)

		bobcatped3 = CreatePed(30, 	-1782092083, 894.5069, -2291.852, 32.4417, 18.0647, true, false)
		SetPedArmour(bobcatped3, 500)
		SetPedAsEnemy(bobcatped3, true)
		SetPedRelationshipGroupHash(bobcatped3, 'ghost')
		GiveWeaponToPed(bobcatped3, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
		TaskCombatPed(bobcatped3, GetPlayerPed(-1))
		SetPedAccuracy(bobcatped3, 100)
		SetPedDropsWeaponsWhenDead(bobcatped3, false)

        bobcatped4 = CreatePed(30, 	-1782092083, 884.3759, -2274.026, 32.4417, 166.311, true, false)
		SetPedArmour(bobcatped4, 500)
		SetPedAsEnemy(bobcatped4, true)
		SetPedRelationshipGroupHash(bobcatped4, 'ghost')
		GiveWeaponToPed(bobcatped4, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
		TaskCombatPed(bobcatped4, GetPlayerPed(-1))
		SetPedAccuracy(bobcatped4, 100)
		SetPedDropsWeaponsWhenDead(bobcatped4, false)

        bobcatped5 = CreatePed(30, 	-1782092083, 878.249, -2293.418, 32.44169, true, false)
		SetPedArmour(bobcatped5, 500)
		SetPedAsEnemy(bobcatped5, true)
		SetPedRelationshipGroupHash(bobcatped5, 'ghost')
		GiveWeaponToPed(bobcatped5, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
		TaskCombatPed(bobcatped5, GetPlayerPed(-1))
		SetPedAccuracy(bobcatped5, 100)
		SetPedDropsWeaponsWhenDead(bobcatped5, false)     
end)

function GhostBoom()
	local ped = PlayerPedId()
    local coords = vector3(889.5819, -2284.789, 32.44141)

	RequestWeaponAsset(GetHashKey("WEAPON_RPG")) 
    while not HasWeaponAssetLoaded(GetHashKey("WEAPON_RPG")) do
        Wait(0)
    end
	ShootSingleBulletBetweenCoords( 
		coords.x,
        coords.y,
        coords.z, 
	    coords.x,
        coords.y,
        coords.z,  
		500,
		true,
		GetHashKey("WEAPON_RPG"),
		ped,
		true,
		true,
		-1.0
    )
    TriggerServerEvent("ghost:serverchangeVaultDoorState")
    CreatenBrakeCrates()
	while true do 
		Citizen.Wait(5)
		StopFireInRange(coords.x,coords.y,coords.z, 300.0)
	end
end


RegisterNetEvent('bobcat:fullrestart')
AddEventHandler('bobcat:fullrestart', function()
  TriggerEvent("ghost:resetvault") -- Resets back to orginal state unbroken
  TriggerServerEvent("drp-doors:change-lock-state", 268, true)
  TriggerServerEvent("drp-doors:change-lock-state", 269, true)
  TriggerServerEvent('drp-doors:change-lock-state', 270, true) 
  TriggerServerEvent('drp-doors:change-lock-state', 271, true)
  TriggerServerEvent("drp-doors:change-lock-state", 272, true)
  searched = true
  searchedSecond = true
end)
