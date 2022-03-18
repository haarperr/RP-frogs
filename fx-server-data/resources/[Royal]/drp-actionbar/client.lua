
local ammoTable = {}
unholsteringactive = false
local prevupdate = 0
local armed = false
local currentInformation = 0
local CurrentSqlID = 0
local TIME_REMOVED_FOR_DEG = 1000 * 60 * 5 -- 5 mins
local focusTaken = false
local UNARMED_HASH = `WEAPON_UNARMED`



local throwableWeapons = {}
throwableWeapons["741814745"] = true
throwableWeapons["615608432"] = true
throwableWeapons["1233104067"] = true
throwableWeapons["2874559379"] = true
throwableWeapons["126349499"] = true
throwableWeapons["-73270376"] = true
throwableWeapons["-1169823560"] = true



function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end

RegisterNetEvent('drp-items:SetAmmo')
AddEventHandler('drp-items:SetAmmo', function(sentammoTable)
	if sentammoTable ~= nil then
		ammoTable = sentammoTable
		GiveAmmoNow()
		Wait(300)
	end
end)

function GiveAmmoNow()
	for i,v in pairs(ammoTable) do
		for x,b in pairs(v) do
			SetPedAmmoByType(PlayerPedId(), v.type, v.ammo)
		end
	end
end



local lastWeaponDeg = 0
function attemptToDegWeapon()
	if math.random(100) > 85 then
		local hasTimer = 99999
		hasTimer = (GetGameTimer()-lastWeaponDeg)

		if  hasTimer >= 2000 then
			lastWeaponDeg = GetGameTimer();
			TriggerServerEvent("inventory:degItem",CurrentSqlID)
		end
	end
end

local reDelayed = false
function actionBarDown()
	if focusTaken or reDelayed then return end
	TriggerEvent("inventory-bar", true)
	ExecuteCommand('cash')
end

function actionBarUp()
  if focusTaken then return end
  reDelayed = true
  TriggerEvent("inventory-bar", false)
  Citizen.SetTimeout(2500, function() reDelayed = false end)
end

Citizen.CreateThread(function()
  exports["drp-binds"]:registerKeyMapping("", "Player", "Action Bar", "+actionBar", "-actionBar", "TAB")
  RegisterCommand('+actionBar', actionBarDown, false)
  RegisterCommand('-actionBar', actionBarUp, false)

  exports["drp-binds"]:registerKeyMapping("", "Player", "Wink", "+playerWink", "-playerWink")
  RegisterCommand('+playerWink', playerWink, false)
  RegisterCommand('-playerWink', function() end, false)

  exports["drp-binds"]:registerKeyMapping("", "Player", "Passive Mode", "+passiveMode", "-passiveMode")
  RegisterCommand('+passiveMode', passiveMode, false)
  RegisterCommand('-passiveMode', function() end, false)  
end)

function playerWink()
	Citizen.CreateThread(function()
	  SetFacialIdleAnimOverride(GetPlayerPed(-1), "pose_aiming_1")
	  Citizen.Wait(300)
	  SetFacialIdleAnimOverride(GetPlayerPed(-1), "pose_normal_1")
	end)
  end

  local passiveModeEnabled = false
  function passiveMode()
	if passiveModeEnabled then
	  passiveModeEnabled = false
	  TriggerEvent("DoLongHudText", _L("actionbar-passivemode-off", "Passive mode off"))
	  return
	end
	TriggerEvent("DoLongHudText", _L("actionbar-passivemode-on", "Passive mode on"))
	passiveModeEnabled = true
	Citizen.CreateThread(function()
	  while passiveModeEnabled do
		DisablePlayerFiring(PlayerPedId(), true)
			  DisableControlAction(0, 24, true) -- Attack
			  DisableControlAction(0, 142, true) -- MeleeAttackAlternate
		Citizen.Wait(0)
	  end
	end)
  end  

local shotRecently = false
local lastShot = 0
local lastDamageTrigger = 0
Citizen.CreateThread( function()
	while true do
		Citizen.Wait(0)
		
		local ped = PlayerPedId()
		if IsPedShooting(ped) then
			local hash = GetSelectedPedWeapon(ped)
			local ammoType = Citizen.InvokeNative(0x7FEAD38B326B9F74, ped, hash)
			newammo = GetPedAmmoByType(ped, ammoType)
			if newammo < 5 then
				updateAmmo()
			end

			attemptToDegWeapon()

			local weapon = "".. hash ..""
			if throwableWeapons[weapon] then
				if exports["drp-inventory"]:hasEnoughOfItem(weapon,1,false) then
					TriggerEvent("inventory:removeItem", weapon, 1)
					Citizen.Wait(3000)
				end
			end

			if hash ~= `WEAPON_STUNGUN` and hash ~= `WEAPON_FIREEXTINGUISHER` then
				lastShot = GetGameTimer()
				shotRecently = true
			end

			if hash == `WEAPON_FIREEXTINGUISHER` then
				local pos = GetOffsetFromEntityInWorldCoords(GetPlayerPed(PlayerId()), 0.0, 3.0, 0.0)
				if GetNumberOfFiresInRange(pos,4.0) > 1 then
					local rnd = math.random(100)
					if rnd > 40 then TriggerServerEvent('fire:serverStopFire',pos.x,pos.y,pos.z,4.0) end
				end
			end

		end

		if unholsteringactive then
			DisablePlayerFiring(PlayerPedId(), true) -- Disable weapon firing
			DisableControlAction(0, 24, true) -- Attack
			DisableControlAction(0, 142, true) -- MeleeAttackAlternate
		end


		prevupdate = prevupdate - 1

		if (IsControlJustReleased(0,157) or IsDisabledControlJustReleased(0,157)) and not focusTaken then
			TriggerEvent("inventory-bind",1)
		end

		if (IsControlJustReleased(0,158) or IsDisabledControlJustReleased(0,158)) and not focusTaken then
			TriggerEvent("inventory-bind",2)
		end

		if (IsControlJustReleased(0,160) or IsDisabledControlJustReleased(0,160)) and not focusTaken then
			TriggerEvent("inventory-bind",3)
		end

		if (IsControlJustReleased(0,164) or IsDisabledControlJustReleased(0,164)) and not focusTaken then
			TriggerEvent("inventory-bind",4)
		end

		if IsPedPlantingBomb(ped) then
			if exports["drp-inventory"]:hasEnoughOfItem("741814745",1,false) then

				TriggerEvent("inventory:removeItem", 741814745, 1)
				Citizen.Wait(3000)
			end
		end
	end

	if shotRecently and GetGameTimer() - lastShot >= 1200000 then shotRecently = false end

end)

AddEventHandler("drp-voice:focus:set", function(pState)
  focusTaken = pState
end)

RegisterNetEvent("police:hasShotRecently")
AddEventHandler("police:hasShotRecently", function(copId)
	TriggerServerEvent("police:hasShotRecently", shotRecently, copId)
end)

local cannotPullWeaponInAnimation = false


RegisterNetEvent('equipWeaponID')
AddEventHandler('equipWeaponID', function(hash,newInformation,sqlID)
	--GiveAmmoNow()
	if not exports["drp-propattach"]:canPullWeaponHoldingEntity() then return end
	
	if cannotPullWeaponInAnimation  then return end

	cannotPullWeaponInAnimation = true
	CurrentSqlID = sqlID
	currentInformation = json.decode(newInformation)

	


	if (currentInformation.cartridge == nil) then
		currentInformation = "Scratched off data"
	else
		currentInformation = currentInformation.cartridge
	end
	TriggerEvent("evidence:bulletInformation", currentInformation)

	local dead = exports['drp-death']:GetDeathStatus()
	if dead then
		return
	end

	if UNARMED_HASH == GetSelectedPedWeapon(PlayerPedId()) then
		armed = false
	end

	SetPlayerCanDoDriveBy(PlayerId(),false)
	
	if armed then
		armed = false
		TriggerEvent("hud-display-item",tonumber(hash),"Holster")
		holster1h()		
	else
		armed = true
		TriggerEvent("hud-display-item",tonumber(hash),"Equip")
		unholster1h(tonumber(hash),true)
	end	


	SetPedAmmo(PlayerPedId(),  `WEAPON_FIREEXTINGUISHER`, 10000)
	SetPedAmmo(PlayerPedId(),  `WEAPON_STICKYBOMB`, 1)
	
	SetPlayerCanDoDriveBy(PlayerId(),true)

end)

RegisterNetEvent('brokenWeapon')
AddEventHandler('brokenWeapon', function()

	local dead = exports['drp-death']:GetDeathStatus()
	if dead then
		return
	end


	holster1h()
	armed = false

	SetPedAmmo(PlayerPedId(),  `WEAPON_FIREEXTINGUISHER`, 10000)

end)


function ammoTypeCheck(atype)
	if type(atype) == "number" then
		if ammoTable["" .. atype .. ""] == nil then
			ammoTable["" .. atype .. ""] = {}
			ammoTable["" .. atype .. ""]["ammo"] = 0
			ammoTable["" .. atype .. ""]["type"] = atype
		end
	end
end



RegisterNetEvent('actionbar:ammo')
AddEventHandler('actionbar:ammo', function(hash,amount,addition)

	local ped = PlayerPedId()
	local ammoType = hash
	ammoTypeCheck(ammoType)

	if ammoTable == nil then
		TriggerServerEvent("drp-weapons:getAmmo")
		
	end

	if ammoTable["" .. ammoType .. ""] == nil then
		TriggerServerEvent("drp-weapons:getAmmo")
	end


	if hash == Citizen.InvokeNative(0x7FEAD38B326B9F74, ped, GetSelectedPedWeapon(ped)) then
		curAmmo = GetPedAmmoByType(ped, hash)
	else
		curAmmo = ammoTable["" .. ammoType .. ""]["ammo"]

		if curAmmo == nil then
			ammoTable["" .. ammoType .. ""]["ammo"] = 0
		end
	end

	if addition then
	    newammo = tonumber(curAmmo) + tonumber(amount)
	else
		newammo = tonumber(curAmmo) - tonumber(amount)
	end

	if (curAmmo == newammo) then
		newammo = newammo + 30
	end

	if addition and newammo < amount then newammo = amount end


	if newammo > 150 and ammoType ~= -899475295 then
   		newammo = 150
    elseif newammo < 0 then
    	newammo = 0
    end

    ammoTable["" .. ammoType .. ""]["ammo"] = newammo

    SetPedAmmoByType(PlayerPedId(), ammoType, newammo)

    prevupdate = 0
	updateAmmoTable(newammo,ammoType)
end)


function updateAmmoTable(newammo,ammoType)
	local ped = PlayerPedId()
	local hash = GetSelectedPedWeapon(ped)
	if hash == UNARMED_HASH then
		updateAmmo(true)
		return
	end
	TriggerServerEvent("drp-weapons:updateAmmo",newammo,ammoType,ammoTable)
end

RegisterNetEvent('armory:ammo')
AddEventHandler('armory:ammo', function()
	TriggerEvent("actionbar:ammo",1950175060,150,true)
	TriggerEvent("actionbar:ammo",218444191,150,true)
	TriggerEvent("actionbar:ammo",-1878508229,150,true)
	TriggerEvent("actionbar:ammo",1820140472,150,true)
	TriggerEvent("actionbar:ammo",965225813,150,true)
end)

RegisterNetEvent('actionbar:setEmptyHanded')
AddEventHandler('actionbar:setEmptyHanded', function()
	prevupdate = 0
	updateAmmo(true)
	Wait(500)
	SetCurrentPedWeapon(PlayerPedId(), UNARMED_HASH, true)
end)


local lastUsedAmmo = GetSelectedPedWeapon(PlayerPedId())
function updateAmmo(isForced)

	if prevupdate > 0 then
		return
	end

	prevupdate = 5
	local ped = PlayerPedId()
	local hash = GetSelectedPedWeapon(ped)
	if hash == UNARMED_HASH then
		hash = lastUsedAmmoHash
	end
	lastUsedAmmoHash = hash
	local newammo = 0
	local ammoType = Citizen.InvokeNative(0x7FEAD38B326B9F74, ped, hash)

	if type(ammoType) == 'number' then 

		ammoTypeCheck(ammoType)

		newammo = GetPedAmmoByType(ped, ammoType)
		
		if newammo == nil then
			return
		end

		if isForced and newammo == 0 then 
			return
		end

		if newammo > 150 and ammoType ~= -899475295 then
			newammo = 150
		end

		ammoTable["" .. ammoType .. ""]["ammo"] = newammo


		TriggerServerEvent("drp-weapons:updateAmmo",newammo,ammoType,ammoTable)

	end

	return newammo
end

function getAmmo(hash)
	if (throwableWeapons[""..hash..""]) then
    	return 2
    end

	local ped = PlayerPedId()
	local ammoType = Citizen.InvokeNative(0x7FEAD38B326B9F74, ped, hash)

	local newammo = 0

	if type(ammoType) == "number" then
		ammoTypeCheck(ammoType)
		newammo = ammoTable["" .. ammoType .. ""]["ammo"]
	end

	if newammo > 150 and ammoType ~= -899475295 then
		newammo = 150
	end

	return newammo
end

RegisterNetEvent('drp-item:CheckClientAmmo')
AddEventHandler('drp-item:CheckClientAmmo', function(weapons)
	local ped = PlayerPedId()
	local ammoType = Citizen.InvokeNative(0x7FEAD38B326B9F74, ped, weapons)
	local newammo = 0

	ammoTypeCheck(ammoType)

	if type(ammoType) == "number" then
		ammoTypeCheck(ammoType)
		newammo = ammoTable["" .. ammoType .. ""]["ammo"]
	end


end)


function unholster1h(weaponHash)

	unholsteringactive = true

	local dict = "reaction@intimidation@1h"
	local anim = "intro"
	local myJob = exports["isPed"]:isPed("myJob")
	local ped = PlayerPedId()

	if myJob == "police" or myJob == "doc" or myJob == "sheriff" or myJob == "state" then
		copunholster(weaponHash)

	    if weaponHash == 3219281620 then
			GiveWeaponComponentToPed(PlayerPedId(), 3219281620, `COMPONENT_AT_PI_FLSH_02` )
	    end


	    if weaponHash == 736523883 then
			GiveWeaponComponentToPed( ped, 736523883, `COMPONENT_AT_AR_FLSH` )
			GiveWeaponComponentToPed( ped, 736523883, `COMPONENT_AT_SCOPE_MACRO_02` )	
	    end

	    if weaponHash == -2084633992 then
			GiveWeaponComponentToPed( ped, -2084633992, `COMPONENT_AT_AR_FLSH` )
			GiveWeaponComponentToPed( ped, -2084633992, `COMPONENT_AT_AR_AFGRIP` )
			GiveWeaponComponentToPed( ped, -2084633992, `COMPONENT_AT_SCOPE_MEDIUM` )
	    end
	    if weaponHash == 1432025498 then
			GiveWeaponComponentToPed( ped, 1432025498, `COMPONENT_AT_SCOPE_MACRO_MK2` )
			GiveWeaponComponentToPed( ped, 1432025498, `COMPONENT_AT_AR_FLSH` )

	    end

	    if weaponHash == 2024373456 then
			GiveWeaponComponentToPed( ped, 2024373456, `COMPONENT_AT_AR_FLSH` )
			GiveWeaponComponentToPed( ped, 2024373456, `COMPONENT_AT_SIGHTS_SMG` )	
			GiveWeaponComponentToPed( ped, 2024373456, `COMPONENT_AT_MUZZLE_01` )
			GiveWeaponComponentToPed( ped, 2024373456, `COMPONENT_AT_SB_BARREL_02` )	
	    end

	    if weaponHash == -86904375 then
	    	GiveWeaponComponentToPed( ped, -86904375, `COMPONENT_AT_AR_FLSH` )
	    	GiveWeaponComponentToPed( ped, -86904375, `COMPONENT_AT_SIGHTS` )
	    end

	    if weaponHash == -1075685676 then
	    	GiveWeaponComponentToPed( ped, -1075685676, `COMPONENT_AT_PI_FLSH_02` )
	    end  

		AttachmentCheck(weaponHash)
		
	    Citizen.Wait(450)
		unholsteringactive = false
		cannotPullWeaponInAnimation = false
		return
	end	

	RemoveAllPedWeapons(ped)

	if weaponHash ~= -538741184 and weaponHash ~= 615608432 then
		local animLength = GetAnimDuration(dict, anim) * 1000
	    loadAnimDict(dict) 
	    TaskPlayAnim(ped, dict, anim, 1.0, 1.0, -1, 50, 0, 0, 0, 0)
	    Citizen.Wait(900)
	    GiveWeaponToPed(ped, weaponHash, getAmmo(weaponHash), 0, 1)
	    SetCurrentPedWeapon(ped, weaponHash, 1)
	else
		GiveWeaponToPed(ped, weaponHash, getAmmo(weaponHash), 1, 0)
		SetCurrentPedWeapon(ped, weaponHash, 0)
	end
    

   
    AttachmentCheck(weaponHash)
    Citizen.Wait(500)
    cannotPullWeaponInAnimation = false
    ClearPedTasks(ped)
    Citizen.Wait(1200)
    
    unholsteringactive = false

end



function AttachmentCheck(weaponhash)

	if exports["drp-inventory"]:hasEnoughOfItem("silencer_l",1,false) then
		GiveWeaponComponentToPed( PlayerPedId(), weaponhash, `COMPONENT_AT_AR_SUPP` )
	end

	if exports["drp-inventory"]:hasEnoughOfItem("silencer_l2",1,false) then
		GiveWeaponComponentToPed( PlayerPedId(), weaponhash, `COMPONENT_AT_AR_SUPP_02` )
	end

	if exports["drp-inventory"]:hasEnoughOfItem("silencer_s",1,false) then
		GiveWeaponComponentToPed( PlayerPedId(), weaponhash, `COMPONENT_AT_PI_SUPP` )
	end

	if exports["drp-inventory"]:hasEnoughOfItem("silencer_s2",1,false) then
		GiveWeaponComponentToPed( PlayerPedId(), weaponhash, `COMPONENT_AT_PI_SUPP_02` )	
	end

	if exports["drp-inventory"]:hasEnoughOfItem("extended_ap",1,false) then
		GiveWeaponComponentToPed( PlayerPedId(), weaponhash, `COMPONENT_APPISTOL_CLIP_02` )	
	end

	if exports["drp-inventory"]:hasEnoughOfItem("extended_sns",1,false) then
		GiveWeaponComponentToPed( PlayerPedId(), weaponhash, `COMPONENT_SNSPISTOL_CLIP_02` )	
	end

	if exports["drp-inventory"]:hasEnoughOfItem("extended_micro",1,false) then
		GiveWeaponComponentToPed( PlayerPedId(), weaponhash, `COMPONENT_MICROSMG_CLIP_02` )	
	end

	if exports["drp-inventory"]:hasEnoughOfItem("MediumScope",1,false) then
		GiveWeaponComponentToPed( PlayerPedId(), weaponhash, `COMPONENT_AT_SCOPE_MEDIUM` )	
	end

	if exports["drp-inventory"]:hasEnoughOfItem("SmallScope",1,false) then
		GiveWeaponComponentToPed( PlayerPedId(), weaponhash, `COMPONENT_AT_SCOPE_SMALL` )	
	end


	if exports["drp-inventory"]:hasEnoughOfItem("TinyScope",1,false) then
		GiveWeaponComponentToPed( PlayerPedId(), weaponhash, `COMPONENT_AT_SCOPE_MACRO` )	
	end

	if exports["drp-inventory"]:hasEnoughOfItem("extended_tec9",1,false) then
		GiveWeaponComponentToPed( PlayerPedId(), weaponhash, `COMPONENT_MACHINEPISTOL_CLIP_02` )	
	end




end


function copunholster(weaponHash)
  local dic = "reaction@intimidation@cop@unarmed"
  local anim = "intro"
  local ammoCount = 0
   loadAnimDict( dic ) 

	local ped = PlayerPedId()
	RemoveAllPedWeapons(ped)

	TaskPlayAnim(ped, dic, anim, 10.0, 2.3, -1, 49, 1, 0, 0, 0 )

	Citizen.Wait(600)

    GiveWeaponToPed(ped, weaponHash, getAmmo(weaponHash), 0, 1)
	
	SetCurrentPedWeapon(ped, weaponHash, 1)
	ClearPedTasks(ped)

end

function copholster()

  local dic = "reaction@intimidation@cop@unarmed"
  local anim = "intro"
  local ammoCount = 0
   loadAnimDict( dic ) 

	local ped = PlayerPedId()
	prevupdate = 0
	updateAmmo()

	TaskPlayAnim(ped, dic, anim, 10.0, 2.3, -1, 49, 1, 0, 0, 0 )

	Citizen.Wait(600)
	SetCurrentPedWeapon(ped, UNARMED_HASH, 1)
	RemoveAllPedWeapons(ped)
	ClearPedTasks(ped)
end
function holster1h()
	unholsteringactive = true
	local dict = "reaction@intimidation@1h"
	local anim = "outro"
	local myJob = exports["isPed"]:isPed("myJob")
	if myJob == "police" or myJob == "doc" or myJob == "sheriff" or myJob == "state" then
		copholster()
		Citizen.Wait(600)
		unholsteringactive = false
		cannotPullWeaponInAnimation = false
		return
	end
	local ped = PlayerPedId()
	prevupdate = 0
	updateAmmo()
	local animLength = GetAnimDuration(dict, anim) * 1000
    loadAnimDict(dict) 
    TaskPlayAnim(ped, dict, anim, 1.0, 1.0, -1, 50, 0, 0, 0, 0)   
    Citizen.Wait(animLength - 2200)
    
    SetCurrentPedWeapon(ped, UNARMED_HASH, 1)
    Citizen.Wait(300)
    RemoveAllPedWeapons(ped)
    ClearPedTasks(ped)
    Citizen.Wait(800)
	unholsteringactive = false
	cannotPullWeaponInAnimation = false
end
