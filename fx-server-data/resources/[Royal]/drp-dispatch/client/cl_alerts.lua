--- Gun Shots ---

RegisterNetEvent('drp-dispatch:gunShot')
AddEventHandler('drp-dispatch:gunShot', function(targetCoords)
	if exports["isPed"]:isPed("myJob") == 'police' or exports["isPed"]:isPed("myJob") == 'sheriff' or exports["isPed"]:isPed("myJob") == 'state' or exports["isPed"]:isPed("myJob") == "ems" then
		local alpha = 360
		local gunshotBlip = AddBlipForCoord(targetCoords.x, targetCoords.y, targetCoords.z)

		SetBlipScale(gunshotBlip, 1.3)
		SetBlipSprite(gunshotBlip,  110)
		SetBlipColour(gunshotBlip,  4)
		SetBlipAlpha(gunshotBlip, alpha)
		SetBlipAsShortRange(gunshotBlip, false)
		BeginTextCommandSetBlipName("STRING")              -- set the blip's legend caption
		AddTextComponentString('10-71 Shots Fired')              -- to 'supermarket'
		EndTextCommandSetBlipName(gunshotBlip)
		PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)
		
		while alpha ~= 0 do
			Citizen.Wait(120 * 4)
			alpha = alpha - 1
			SetBlipAlpha(gunshotBlip, alpha)

			if alpha == 0 then
				RemoveBlip(gunshotBlip)
				return
			end
		end
	end
end)

AddEventHandler('drp-dispatch:gunshotcl', function()
	local pos = GetEntityCoords(PlayerPedId(), true)
	TriggerServerEvent('drp-dispatch:shoot', {x = pos.x, y = pos.y, z = pos.z})
end)


RegisterCommand("riot", function()
    if exports["isPed"]:isPed("myJob") == 'police' or exports["isPed"]:isPed("myJob") == 'sheriff' or exports["isPed"]:isPed("myJob") == 'state' or exports["isPed"]:isPed("myJob") == "ems" then
		local alpha = 360
		local Blip = AddBlipForCoord(1690.576, 2534.541, 61.3709)

		SetBlipScale(Blip, 1.3)
		SetBlipSprite(Blip,  285)
		SetBlipColour(Blip,  4)
		SetBlipAlpha(Blip, alpha)
		SetBlipAsShortRange(Blip, false)
		BeginTextCommandSetBlipName("STRING")              -- set the blip's legend caption
		AddTextComponentString('10-98 Jail Break')              -- to 'supermarket'
		EndTextCommandSetBlipName(Blip)
		TriggerEvent('InteractSound_CL:PlayOnOne', 'polalert', 1.0)

		TriggerServerEvent('dispatch:svNotify', {
			dispatchCode = '10-98',
			relatedCode = '10-98',
			firstStreet = "Prision",
			priority = 3,
			origin = {x = 1690.576, y = 2534.541, z = 61.3709},
			dispatchMessage = "Prision Break",
		})
		
		while alpha ~= 0 do
			Citizen.Wait(220 * 4)
			alpha = alpha - 1
			SetBlipAlpha(Blip, alpha)

			if alpha == 0 then
				RemoveBlip(Blip)
				return
			end
		end
	end
end)

-- ---- Fight ----

-- RegisterNetEvent('vrp-outlawalert:combatInProgress')
-- AddEventHandler('vrp-outlawalert:combatInProgress', function(targetCoords)
-- 	if PlayerData.job.name == 'police' then	
-- 		if Config.gunAlert then
-- 			local alpha = 360
-- 			local knife = AddBlipForCoord(targetCoords.x, targetCoords.y, targetCoords.z)

-- 			SetBlipScale(knife, 1.3)
-- 			SetBlipSprite(knife,  437)
-- 			SetBlipColour(knife,  1)
-- 			SetBlipAlpha(knife, alpha)
-- 			SetBlipAsShortRange(knife, false)
-- 			BeginTextCommandSetBlipName("STRING")              -- set the blip's legend caption
-- 			AddTextComponentString('10-11 Fight In Progress')              -- to 'supermarket'
-- 			EndTextCommandSetBlipName(knife)
-- 			SetBlipAsShortRange(knife,  1)
-- 			PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)

-- 			while alpha ~= 0 do
-- 				Citizen.Wait(Config.BlipGunTime * 4)
-- 				alpha = alpha - 1
-- 				SetBlipAlpha(knife, alpha)

-- 				if alpha == 0 then
-- 					RemoveBlip(knife)
-- 					return
-- 				end
-- 			end

-- 		end
-- 	end
-- end)

-- AddEventHandler('drp-dispatch:fight', function()
-- 	local pos = GetEntityCoords(PlayerPedId(), true)
-- 	TriggerServerEvent('drp-dispatch:figher', {x = pos.x, y = pos.y, z = pos.z})
-- end)

-- ---- 10-13s Officer Down ----

RegisterNetEvent('drp-dispatch:policealertA')
AddEventHandler('drp-dispatch:policealertA', function(targetCoords)
  if exports["isPed"]:isPed("myJob") == 'police' or exports["isPed"]:isPed("myJob") == 'sheriff' or exports["isPed"]:isPed("myJob") == 'state' or exports["isPed"]:isPed("myJob") == "ems" then	
		local alpha = 360
		local policedown = AddBlipForCoord(targetCoords.x, targetCoords.y, targetCoords.z)

		SetBlipSprite(policedown,  489)
		SetBlipColour(policedown,  18)
		SetBlipScale(policedown, 1.5)
		SetBlipAsShortRange(policedown,  false)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('10-13A Officer Down')
		EndTextCommandSetBlipName(policedown)
		TriggerEvent('InteractSound_CL:PlayOnOne', 'polalert', 1.0)

		while alpha ~= 0 do
			Citizen.Wait(120 * 4)
			alpha = alpha - 1
			SetBlipAlpha(policedown, alpha)

		if alpha == 0 then
			RemoveBlip(policedown)
		return
      end
    end
  end
end)

AddEventHandler('drp-dispatch:1013A', function()
	local pos = GetEntityCoords(PlayerPedId(), true)
	TriggerServerEvent('drp-dispatch:teenA', {x = pos.x, y = pos.y, z = pos.z})
end)

RegisterNetEvent('drp-dispatch:policealertB')
AddEventHandler('drp-dispatch:policealertB', function(targetCoords)
	if exports["isPed"]:isPed("myJob") == 'police' or exports["isPed"]:isPed("myJob") == 'sheriff' or exports["isPed"]:isPed("myJob") == 'state' or exports["isPed"]:isPed("myJob") == "ems" then	
		local alpha = 360
		local policedown2 = AddBlipForCoord(targetCoords.x, targetCoords.y, targetCoords.z)

		SetBlipSprite(policedown2,  489)
		SetBlipColour(policedown2,  18)
		SetBlipScale(policedown2, 1.5)
		SetBlipAsShortRange(policedown2, false)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('10-13B Officer Down')
		EndTextCommandSetBlipName(policedown2)
		PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)

		while alpha ~= 0 do
			Citizen.Wait(120 * 4)
			alpha = alpha - 1
			SetBlipAlpha(policedown2, alpha)

		if alpha == 0 then
			RemoveBlip(policedown2)
		return
      end
    end
  end
end)

AddEventHandler('drp-dispatch:1013B', function()
	local pos = GetEntityCoords(PlayerPedId(), true)
	TriggerServerEvent('drp-dispatch:teenB', {x = pos.x, y = pos.y, z = pos.z})
end)


RegisterNetEvent('drp-dispatch:panic')
AddEventHandler('drp-dispatch:panic', function(targetCoords)
if exports["isPed"]:isPed("myJob") == 'police' or exports["isPed"]:isPed("myJob") == 'sheriff' or exports["isPed"]:isPed("myJob") == 'state' or exports["isPed"]:isPed("myJob") == "ems" then	
		local alpha = 360
		local panic = AddBlipForCoord(targetCoords.x, targetCoords.y, targetCoords.z)

		SetBlipSprite(panic,  126)
		SetBlipColour(panic,  1)
		SetBlipScale(panic, 1.3)
		SetBlipAsShortRange(panic, false)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('10-78 Officer Panic Botton')
		EndTextCommandSetBlipName(panic)
		TriggerEvent('InteractSound_CL:PlayOnOne', 'polalert', 1.0)

		while alpha ~= 0 do
			Citizen.Wait(120 * 4)
			alpha = alpha - 1
			SetBlipAlpha(panic, alpha)

		if alpha == 0 then
			RemoveBlip(panic)
		return
      end
    end
  end
end)

AddEventHandler('drp-dispatch:policepanic', function()
	local pos = GetEntityCoords(PlayerPedId(), true)
	TriggerServerEvent('drp-dispatch:teenpanic', {x = pos.x, y = pos.y, z = pos.z})
end)


RegisterNetEvent('drp-dispatch:epanic')
AddEventHandler('drp-dispatch:epanic', function(targetCoords)
if exports["isPed"]:isPed("myJob") == 'police' or exports["isPed"]:isPed("myJob") == 'sheriff' or exports["isPed"]:isPed("myJob") == 'state' or exports["isPed"]:isPed("myJob") == "ems" then	
		local alpha = 360
		local panic = AddBlipForCoord(targetCoords.x, targetCoords.y, targetCoords.z)

		SetBlipSprite(panic,  126)
		SetBlipColour(panic,  1)
		SetBlipScale(panic, 1.3)
		SetBlipAsShortRange(panic, false)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('10-78 EMS Panic Botton')
		EndTextCommandSetBlipName(panic)
		TriggerEvent('InteractSound_CL:PlayOnOne', 'polalert', 1.0)

		while alpha ~= 0 do
			Citizen.Wait(120 * 4)
			alpha = alpha - 1
			SetBlipAlpha(panic, alpha)

		if alpha == 0 then
			RemoveBlip(panic)
		return
      end
    end
  end
end)

AddEventHandler('drp-dispatch:emspanic', function()
	local pos = GetEntityCoords(PlayerPedId(), true)
	TriggerServerEvent('drp-dispatch:empanic', {x = pos.x, y = pos.y, z = pos.z})
end)



RegisterNetEvent('drp-dispatch:gexplosion')
AddEventHandler('drp-dispatch:gexplosion', function(targetCoords)
if exports["isPed"]:isPed("myJob") == 'police' or exports["isPed"]:isPed("myJob") == 'sheriff' or exports["isPed"]:isPed("myJob") == 'state' or exports["isPed"]:isPed("myJob") == "ems" then	
		local alpha = 360
		local explosion = AddBlipForCoord(targetCoords.x, targetCoords.y, targetCoords.z)

		SetBlipSprite(explosion,  361)
		SetBlipColour(explosion,  59)
		SetBlipScale(explosion, 1.3)
		SetBlipAsShortRange(explosion, false)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('Gas Station Explosion')
		EndTextCommandSetBlipName(explosion)
		PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)

		while alpha ~= 0 do
			Citizen.Wait(120 * 4)
			alpha = alpha - 1
			SetBlipAlpha(explosion, alpha)

		if alpha == 0 then
			RemoveBlip(explosion)
		return
      end
    end
  end
end)

AddEventHandler('drp-dispatch:gasexplosion', function()
	local pos = GetEntityCoords(PlayerPedId(), true)
	TriggerServerEvent('drp-dispatch:gaexplosion', {x = pos.x, y = pos.y, z = pos.z})
end)



-- ---- 10-14 EMS ----

RegisterNetEvent('drp-dispatch:tenForteenA')
AddEventHandler('drp-dispatch:tenForteenA', function(targetCoords)
	if exports["isPed"]:isPed("myJob") == 'police' or exports["isPed"]:isPed("myJob") == 'sheriff' or exports["isPed"]:isPed("myJob") == 'state' or exports["isPed"]:isPed("myJob") == "ems" then	
		local alpha = 360
		local medicDown = AddBlipForCoord(targetCoords.x, targetCoords.y, targetCoords.z)

		SetBlipSprite(medicDown,  489)
		SetBlipColour(medicDown,  48)
		SetBlipScale(medicDown, 1.3)
		SetBlipAsShortRange(medicDown, false)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('10-14A Medic Down')
		EndTextCommandSetBlipName(medicDown)
		TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 3.0, 'polalert', 0.4)

		while alpha ~= 0 do
			Citizen.Wait(120 * 4)
			alpha = alpha - 1
			SetBlipAlpha(medicDown, alpha)

		if alpha == 0 then
			RemoveBlip(medicDown)
		return
      end
    end
  end
end)

AddEventHandler('drp-dispatch:1014A', function()
	local pos = GetEntityCoords(PlayerPedId(), true)
	TriggerServerEvent('drp-dispatch:fourA', {x = pos.x, y = pos.y, z = pos.z})
end)


RegisterNetEvent('drp-dispatch:tenForteenB')
AddEventHandler('drp-dispatch:tenForteenB', function(targetCoords)
	if exports["isPed"]:isPed("myJob") == 'police' or exports["isPed"]:isPed("myJob") == 'sheriff' or exports["isPed"]:isPed("myJob") == 'state' or exports["isPed"]:isPed("myJob") == "ems" then	
		local alpha = 360
		local medicDown2 = AddBlipForCoord(targetCoords.x, targetCoords.y, targetCoords.z)

		SetBlipSprite(medicDown2,  489)
		SetBlipColour(medicDown2,  48)
		SetBlipScale(medicDown2, 1.3)
		SetBlipAsShortRange(medicDown2, false)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('10-14B Medic Down')
		EndTextCommandSetBlipName(medicDown2)
		PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)

		while alpha ~= 0 do
			Citizen.Wait(120 * 4)
			alpha = alpha - 1
			SetBlipAlpha(medicDown2, alpha)

		if alpha == 0 then
			RemoveBlip(medicDown2)
		return
      end
    end
  end
end)

AddEventHandler('drp-dispatch:1014B', function()
	local pos = GetEntityCoords(PlayerPedId(), true)
	TriggerServerEvent('drp-dispatch:fourB', {x = pos.x, y = pos.y, z = pos.z})
end)

-- ---- Down Person ----

RegisterNetEvent('drp-dispatch:downalert')
AddEventHandler('drp-dispatch:downalert', function(targetCoords)
	if exports["isPed"]:isPed("myJob") == 'police' or exports["isPed"]:isPed("myJob") == 'sheriff' or exports["isPed"]:isPed("myJob") == 'state' or exports["isPed"]:isPed("myJob") == "ems" then	
		local alpha = 360
		local injured = AddBlipForCoord(targetCoords.x, targetCoords.y, targetCoords.z)

		SetBlipSprite(injured,  126)
		SetBlipColour(injured,  1)
		SetBlipScale(injured, 1.5)
		SetBlipAsShortRange(injured, false)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('10-47 Injured Person')
		EndTextCommandSetBlipName(injured)
		TriggerEvent('InteractSound_CL:PlayOnOne', 'dispatch', 1.0)

		while alpha ~= 0 do
			Citizen.Wait(120 * 4)
			alpha = alpha - 1
			SetBlipAlpha(injured, alpha)

		if alpha == 0 then
			RemoveBlip(injured)
		return
      end
    end
  end
end)

AddEventHandler('drp-dispatch:downguy', function()
	local pos = GetEntityCoords(PlayerPedId(), true)
	TriggerServerEvent('drp-dispatch:downperson', {x = pos.x, y = pos.y, z = pos.z})
end)

-- ---- assistance ----
-- RegisterNetEvent('drp-dispatch:assistance')
-- AddEventHandler('drp-dispatch:assistance', function(targetCoords)
-- if PlayerData.job.name == 'police' or PlayerData.job.name == 'ambulance' then	
-- 		local alpha = 360
-- 		local assistance = AddBlipForCoord(targetCoords.x, targetCoords.y, targetCoords.z)

-- 		SetBlipSprite(assistance,  126)
-- 		SetBlipColour(assistance,  18)
-- 		SetBlipScale(assistance, 1.5)
-- 		SetBlipAsShortRange(assistance,  1)
-- 		BeginTextCommandSetBlipName("STRING")
-- 		AddTextComponentString('Assistance Needed')
-- 		EndTextCommandSetBlipName(assistance)
-- 		TriggerServerEvent('InteractSound_SV:PlayOnSource', 'dispatch', 0.1)

-- 		while alpha ~= 0 do
-- 			Citizen.Wait(120 * 4)
-- 			alpha = alpha - 1
-- 			SetBlipAlpha(assistance, alpha)

-- 		if alpha == 0 then
-- 			RemoveBlip(assistance)
-- 		return
--       end
--     end
--   end
-- end)

-- AddEventHandler('drp-dispatch:assistanceneeded', function()
-- 	local pos = GetEntityCoords(PlayerPedId(), true)
-- 	TriggerServerEvent('drp-dispatch:assistancen', {x = pos.x, y = pos.y, z = pos.z})
-- end)

-- ---- Car Crash ----

-- RegisterNetEvent('drp-dispatch:vehiclecrash')
-- AddEventHandler('drp-dispatch:vehiclecrash', function()
-- if PlayerData.job.name == 'police' or PlayerData.job.name == 'ambulance' then	
-- 		local alpha = 360
-- 		local targetCoords = GetEntityCoords(PlayerPedId(), true)
-- 		local recket = AddBlipForCoord(targetCoords.x, targetCoords.y, targetCoords.z)

-- 		SetBlipSprite(recket,  488)
-- 		SetBlipColour(recket,  1)
-- 		SetBlipScale(recket, 1.5)
-- 		SetBlipAsShortRange(recket,  1)
-- 		BeginTextCommandSetBlipName("STRING")
-- 		AddTextComponentString('10-50 Vehicle Crash')
-- 		EndTextCommandSetBlipName(recket)
-- 		PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)

-- 		while alpha ~= 0 do
-- 			Citizen.Wait(120 * 4)
-- 			alpha = alpha - 1
-- 			SetBlipAlpha(recket, alpha)

-- 		if alpha == 0 then
-- 			RemoveBlip(recket)
-- 		return
--       end
--     end
--   end
-- end)
-- ---- Vehicle Theft ----

RegisterNetEvent("drp-dispatch:carBoost")
AddEventHandler("drp-dispatch:carBoost", function()
	local pos = GetEntityCoords(PlayerPedId(), true)
	TriggerServerEvent("drp-dispatch:svCarBoost", {x = pos.x, y = pos.y, z = pos.z})
end)

RegisterNetEvent("drp-dispatch:carBoostBlip")
AddEventHandler("drp-dispatch:carBoostBlip", function(targetCoords)
	if exports["isPed"]:isPed("myJob") == 'police' or exports["isPed"]:isPed("myJob") == 'sheriff' or exports["isPed"]:isPed("myJob") == 'state' then	
		local alpha = 360
		local thiefBlip = AddBlipForCoord(targetCoords.x, targetCoords.y, targetCoords.z)

		SetBlipSprite(thiefBlip,  488)
		SetBlipColour(thiefBlip,  1)
		SetBlipScale(thiefBlip, 1.5)
		SetBlipAsShortRange(thiefBlip, false)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('10-60 Car Jacking')
		EndTextCommandSetBlipName(thiefBlip)
		TriggerEvent('InteractSound_CL:PlayOnOne', 'bankalarm', 1.0)

		while alpha ~= 0 do
			Citizen.Wait(120 * 4)
			alpha = alpha - 1
			SetBlipAlpha(thiefBlip, alpha)

		if alpha == 0 then
			RemoveBlip(thiefBlip)
		return
      end
    end

	end
end)

RegisterNetEvent("drp-dispatch:carBoostTracker")
AddEventHandler("drp-dispatch:carBoostTracker", function()
	local pos = GetEntityCoords(PlayerPedId(), true)
	TriggerServerEvent("drp-dispatch:svCarBoostTracker", {x = pos.x, y = pos.y, z = pos.z})
end)

RegisterNetEvent("drp-dispatch:carBoostBlipTracker")
AddEventHandler("drp-dispatch:carBoostBlipTracker", function(targetCoords)
	if exports["isPed"]:isPed("myJob") == 'police' or exports["isPed"]:isPed("myJob") == 'sheriff' or exports["isPed"]:isPed("myJob") == 'state' then	
		local alpha = 360
		local thiefBlip = AddBlipForCoord(targetCoords.x, targetCoords.y, targetCoords.z)

		SetBlipSprite(thiefBlip,  326)
		SetBlipColour(thiefBlip,  1)
		SetBlipScale(thiefBlip, 1.5)
		SetBlipAsShortRange(thiefBlip, false)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('Car Tracker')
		EndTextCommandSetBlipName(thiefBlip)
		TriggerEvent('InteractSound_CL:PlayOnOne', 'dispatch', 1.0)

		while alpha ~= 0 do
			Citizen.Wait(100)
			alpha = alpha - 1
			SetBlipAlpha(thiefBlip, alpha)

		if alpha == 0 then
			RemoveBlip(thiefBlip)
		return
      end
    end

	end
end)




RegisterNetEvent('drp-dispatch:vehiclesteal')
AddEventHandler('drp-dispatch:vehiclesteal', function(targetCoords)
	if exports["isPed"]:isPed("myJob") == 'police' or exports["isPed"]:isPed("myJob") == 'sheriff' or exports["isPed"]:isPed("myJob") == 'state' then	
		local alpha = 360
		local thiefBlip = AddBlipForCoord(targetCoords.x, targetCoords.y, targetCoords.z)

		SetBlipSprite(thiefBlip,  488)
		SetBlipColour(thiefBlip,  1)
		SetBlipScale(thiefBlip, 1.5)
		SetBlipAsShortRange(thiefBlip, false)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('10-60 Vehicle Theft')
		EndTextCommandSetBlipName(thiefBlip)
		PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)

		while alpha ~= 0 do
			Citizen.Wait(120 * 4)
			alpha = alpha - 1
			SetBlipAlpha(thiefBlip, alpha)

		if alpha == 0 then
			RemoveBlip(thiefBlip)
		return
      end
    end
  end
end)

AddEventHandler('drp-dispatch:stolenveh', function()
	local pos = GetEntityCoords(PlayerPedId(), true)
	TriggerServerEvent('drp-dispatch:sveh', {x = pos.x, y = pos.y, z = pos.z})
end)



-- ---- Store Robbery ----

RegisterNetEvent('drp-dispatch:storerobbery')
AddEventHandler('drp-dispatch:storerobbery', function(targetCoords)
	if exports["isPed"]:isPed("myJob") == 'police' or exports["isPed"]:isPed("myJob") == 'sheriff' or exports["isPed"]:isPed("myJob") == 'state' then	
		local alpha = 360
		local store = AddBlipForCoord(targetCoords.x, targetCoords.y, targetCoords.z)

		SetBlipHighDetail(store, true)
		SetBlipSprite(store,  52)
		SetBlipColour(store,  4)
		SetBlipScale(store, 1.3)
		SetBlipAsShortRange(store, false)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('10-31B Robbery In Progress')
		EndTextCommandSetBlipName(store)
		TriggerEvent('InteractSound_CL:PlayOnOne', 'bankalarm', 1.0)

		while alpha ~= 0 do
			Citizen.Wait(120 * 4)
			alpha = alpha - 1
			SetBlipAlpha(store, alpha)

		if alpha == 0 then
			RemoveBlip(store)
		return
      end
    end
  end
end)

AddEventHandler('drp-dispatch:robstore', function()
	local pos = GetEntityCoords(PlayerPedId(), true)
	TriggerServerEvent('drp-dispatch:storerob', {x = pos.x, y = pos.y, z = pos.z})
end)

-- ---- House Robbery ----

RegisterNetEvent('drp-dispatch:houserobbery2')
AddEventHandler('drp-dispatch:houserobbery2', function(targetCoords)
	if exports["isPed"]:isPed("myJob") == 'police' or exports["isPed"]:isPed("myJob") == 'sheriff' or exports["isPed"]:isPed("myJob") == 'state' then	
		local alpha = 360
		local burglary = AddBlipForCoord(targetCoords.x, targetCoords.y, targetCoords.z)

		SetBlipHighDetail(burglary, true)
		SetBlipSprite(burglary,  411)
		SetBlipColour(burglary,  4)
		SetBlipScale(burglary, 1.3)
		SetBlipAsShortRange(burglary, false)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('10-31A Burglary')
		EndTextCommandSetBlipName(burglary)
		TriggerEvent('InteractSound_CL:PlayOnOne', 'bankalarm', 1.0)

		while alpha ~= 0 do
			Citizen.Wait(120 * 4)
			alpha = alpha - 1
			SetBlipAlpha(burglary, alpha)

		if alpha == 0 then
			RemoveBlip(burglary)
		return
      end
    end
  end
end)

AddEventHandler('drp-dispatch:robhouse', function()
	local pos = GetEntityCoords(PlayerPedId(), true)
	TriggerServerEvent('drp-dispatch:houserob', {x = pos.x, y = pos.y, z = pos.z})
end)

-- ---- Bank Truck ----

RegisterNetEvent('drp-dispatch:banktruck')
AddEventHandler('drp-dispatch:banktruck', function(targetCoords)
	if exports["isPed"]:isPed("myJob") == 'police' or exports["isPed"]:isPed("myJob") == 'sheriff' or exports["isPed"]:isPed("myJob") == 'state' then	
		local alpha = 360
		local truck = AddBlipForCoord(targetCoords.x, targetCoords.y, targetCoords.z)

		SetBlipSprite(truck,  477)
		SetBlipColour(truck,  47)
		SetBlipScale(truck, 1.5)
		SetBlipAsShortRange(Blip, false)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('10-90D Bank Truck In Progress')
		EndTextCommandSetBlipName(truck)
		TriggerEvent('InteractSound_CL:PlayOnOne', 'bankalarm', 1.0)

		while alpha ~= 0 do
			Citizen.Wait(120 * 4)
			alpha = alpha - 1
			SetBlipAlpha(truck, alpha)

		if alpha == 0 then
			RemoveBlip(truck)
		return
      end
    end
  end
end)

AddEventHandler('drp-dispatch:bankt', function()
	local pos = GetEntityCoords(PlayerPedId(), true)
	TriggerServerEvent('drp-dispatch:tbank', {x = pos.x, y = pos.y, z = pos.z})
end)

---- Jewerly Store ----

RegisterNetEvent('drp-dispatch:jewelrobbey')
AddEventHandler('drp-dispatch:jewelrobbey', function()
	if exports["isPed"]:isPed("myJob") == 'police' or exports["isPed"]:isPed("myJob") == 'sheriff' or exports["isPed"]:isPed("myJob") == 'state' then	
		local alpha = 360
		local jew = AddBlipForCoord(-634.02, -239.49, 38)

		SetBlipSprite(jew,  487)
		SetBlipColour(jew,  4)
		SetBlipScale(jew, 1.8)
		SetBlipAsShortRange(Blip, false)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('10-90B In Progress')
		EndTextCommandSetBlipName(jew)
		TriggerEvent('InteractSound_CL:PlayOnOne', 'bankalarm', 1.0)

		while alpha ~= 0 do
			Citizen.Wait(120 * 4)
			alpha = alpha - 1
			SetBlipAlpha(jew, alpha)

		if alpha == 0 then
			RemoveBlip(jew)
		return
      end
    end
  end
end)

AddEventHandler('drp-dispatch:jewrob', function()
	TriggerServerEvent('drp-dispatch:robjew')
end)

-- ---- Jail Break ----

-- RegisterNetEvent('drp-dispatch:jailbreak')
-- AddEventHandler('drp-dispatch:jailbreak', function()
-- 	if PlayerData.job.name == 'police' then	
-- 		local alpha = 360
-- 		local jail = AddBlipForCoord(1779.65, 2590.39, 50.49)

-- 		SetBlipSprite(jail,  487)
-- 		SetBlipColour(jail,  4)
-- 		SetBlipScale(jail, 1.8)
-- 		SetBlipAsShortRange(jail, false)
-- 		BeginTextCommandSetBlipName("STRING")
-- 		AddTextComponentString('10-98 Jail Break')
-- 		EndTextCommandSetBlipName(jail)
-- 		TriggerServerEvent('InteractSound_SV:PlayOnSource', 'bankalarm', 0.3)

-- 		while alpha ~= 0 do
-- 			Citizen.Wait(120 * 4)
-- 			alpha = alpha - 1
-- 			SetBlipAlpha(jail, alpha)

-- 		if alpha == 0 then
-- 			RemoveBlip(jail)
-- 		return
--       end
--     end
--   end
-- end)

-- AddEventHandler('drp-dispatch:jailb', function()
-- 	TriggerServerEvent('drp-dispatch:bjail')
-- end)


RegisterNetEvent('drp-dispatch:bankrob')
AddEventHandler('drp-dispatch:bankrob', function(targetCoords)
	if exports["isPed"]:isPed("myJob") == 'police' or exports["isPed"]:isPed("myJob") == 'sheriff' or exports["isPed"]:isPed("myJob") == 'state' then	
		local alpha = 360
		local jew = AddBlipForCoord(targetCoords.x, targetCoords.y, targetCoords.z)

		SetBlipSprite(jew,  487)
		SetBlipColour(jew,  4)
		SetBlipScale(jew, 1.8)
		SetBlipAsShortRange(Blip, false)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('10-90A In Progress')
		EndTextCommandSetBlipName(jew)
		TriggerEvent('InteractSound_CL:PlayOnOne', 'bankalarm', 1.0)

		while alpha ~= 0 do
			Citizen.Wait(120 * 4)
			alpha = alpha - 1
			SetBlipAlpha(jew, alpha)

		if alpha == 0 then
			RemoveBlip(jew)
		return
      end
    end
  end
end)

AddEventHandler('drp-dispatch:bankrobbery', function()
	local pos = GetEntityCoords(PlayerPedId(), true)
	TriggerServerEvent('drp-dispatch:bankrobberyfuck', {x = pos.x, y = pos.y, z = pos.z})
end)


RegisterNetEvent('drp-dispatch:drugdealreport')
AddEventHandler('drp-dispatch:drugdealreport', function(targetCoords)
	if exports["isPed"]:isPed("myJob") == 'police' or exports["isPed"]:isPed("myJob") == 'sheriff' or exports["isPed"]:isPed("myJob") == 'state' then	
		local alpha = 360
		local jew = AddBlipForCoord(targetCoords.x, targetCoords.y, targetCoords.z)

		SetBlipSprite(jew,  4)
		SetBlipColour(jew,  4)
		SetBlipScale(jew, 0.5)
		SetBlipAsShortRange(Blip, false)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('Suspicious Activity Reported')
		EndTextCommandSetBlipName(jew)

		while alpha ~= 0 do
			Citizen.Wait(120 * 4)
			alpha = alpha - 1
			SetBlipAlpha(jew, alpha)

		if alpha == 0 then
			RemoveBlip(jew)
		return
      end
    end
  end
end)


AddEventHandler('drp-dispatch:drug', function()
	local pos = GetEntityCoords(PlayerPedId(), true)
	TriggerServerEvent('drp-dispatch:drugg23', {x = pos.x, y = pos.y, z = pos.z})
end)



----------- Below is bobcat:

RegisterNetEvent('drp-dispatch:bobcatreport')
AddEventHandler('drp-dispatch:bobcatreport', function(targetCoords)
	if exports["isPed"]:isPed("myJob") == 'police' or exports["isPed"]:isPed("myJob") == 'sheriff' or exports["isPed"]:isPed("myJob") == 'state' then	
		local alpha = 360
		local jew = AddBlipForCoord(targetCoords.x, targetCoords.y, targetCoords.z)

		SetBlipSprite(jew,  500)
		SetBlipColour(jew,  1)
		SetBlipScale(jew, 1.5)
		SetBlipAsShortRange(jew, false)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('10-90A Bobcat Security Breach')
		EndTextCommandSetBlipName(jew)
		TriggerEvent('InteractSound_CL:PlayOnOne', 'bankalarm', 1.0)


		while alpha ~= 0 do
			Citizen.Wait(120 * 4)
			alpha = alpha - 1
			SetBlipAlpha(jew, alpha)

		if alpha == 0 then
			RemoveBlip(jew)
		return
      end
    end
  end
end)


AddEventHandler('drp-dispatch:dispatchBobcat', function()
	local pos = GetEntityCoords(PlayerPedId(), true)
	TriggerServerEvent('drp-dispatch:bobbycat', {x = pos.x, y = pos.y, z = pos.z})
end)


----------- Vault 

RegisterNetEvent('drp-dispatch:vaultreport')
AddEventHandler('drp-dispatch:vaultreport', function(targetCoords)
	if exports["isPed"]:isPed("myJob") == 'police' or exports["isPed"]:isPed("myJob") == 'sheriff' or exports["isPed"]:isPed("myJob") == 'state' then	
		local alpha = 360
		local jew = AddBlipForCoord(targetCoords.x, targetCoords.y, targetCoords.z)

		SetBlipSprite(jew,  500)
		SetBlipColour(jew,  1)
		SetBlipScale(jew, 1.5)
		SetBlipAsShortRange(jew, false)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('10-90A Robbery In Progress At The Vault')
		EndTextCommandSetBlipName(jew)
		TriggerEvent('InteractSound_CL:PlayOnOne', 'bankalarm', 1.0)


		while alpha ~= 0 do
			Citizen.Wait(120 * 4)
			alpha = alpha - 1
			SetBlipAlpha(jew, alpha)

		if alpha == 0 then
			RemoveBlip(jew)
		return
      end
    end
  end
end)


AddEventHandler('drp-dispatch:DispatchVaultAlert', function()
	local pos = GetEntityCoords(PlayerPedId(), true)
	TriggerServerEvent('drp-dispatch:vaulttt', {x = pos.x, y = pos.y, z = pos.z})
end)



