local startX = 2388.725 
local startY = 5044.985
local startZ = 46.304

local converterX = -96.007   
local converterY = 6206.92
local converterZ = 31.02

local converterX2 = -100.64  
local converterY2 = 6202.30
local converterZ2 = 31.02

local packingX = -106.44 
local packingY = 6204.29
local packingZ = 31.02

local packingX2 = -104.20 
local packingY2 = 6206.45
local packingZ2 = 31.02

local sellX = -524.7509
local sellY = -711.4124
local sellZ =  33.8249
local chickencd = false
local chickencounter = 0
local chicken1
local chicken2
local chicken3
local Zlapany1 = 0
local Zlapany2 = 0
local Zlapany3 = 0
local splashed = 0
local share = false
local prop
local packedintothecar = false
local carton
local meat
local packs = 0

local Keys = {
  ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
  ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
  ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
  ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
  ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
  ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
  ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
  ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
  ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}



Citizen.CreateThread(function()
local lapaniek = AddBlipForCoord(startX, startY, startZ)
    SetBlipSprite (lapaniek, 126)
    SetBlipDisplay(lapaniek, 4)
    SetBlipScale  (lapaniek, 0.5)
    SetBlipColour (lapaniek, 46)
    SetBlipAsShortRange(lapaniek, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('Chicken Farm')
    EndTextCommandSetBlipName(lapaniek)
local rzeznia = AddBlipForCoord(converterX, converterY, converterZ)
    SetBlipSprite (rzeznia, 273)
    SetBlipDisplay(rzeznia, 4)
    SetBlipScale  (rzeznia, 0.5)
    SetBlipColour (rzeznia, 46)
    SetBlipAsShortRange(rzeznia, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('Slaughterhouse')
    EndTextCommandSetBlipName(rzeznia)
local skupk = AddBlipForCoord(sellX, sellY, sellZ)
    SetBlipSprite (skupk, 478)
    SetBlipDisplay(skupk, 4)
    SetBlipScale  (skupk, 0.5)
    SetBlipColour (skupk, 46)
    SetBlipAsShortRange(skupk, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('Chicken Dealer')
    EndTextCommandSetBlipName(skupk)
end)


function DrawText3D2(x, y, z, text)
    local onScreen,_x,_y=World3dToScreen2d(x, y, z)
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
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 90)
end



function GetVehicleInDirection()
    local pos = GetEntityCoords(PlayerPedId())
    local entityWorld = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 3.0, 0.0)
    local rayHandle = CastRayPointToPoint(pos.x, pos.y, pos.z, entityWorld.x, entityWorld.y, entityWorld.z, 10, PlayerPedId(), 0)
    local a, b, c, d, result = GetRaycastResult(rayHandle)
    return result
end

RegisterNetEvent("drp-civjobs:package-chicken")
AddEventHandler("drp-civjobs:package-chicken", function(position)
	if exports["drp-inventory"]:hasEnoughOfItem("freshmeat", 6) then
		if exports["drp-inventory"]:getQuantity("freshmeat") >= 1 then
			SetEntityHeading(GetPlayerPed(-1), 40.0)
			local PedCoords = GetEntityCoords(GetPlayerPed(-1))
			local meat = CreateObject(GetHashKey('prop_cs_steak'),PedCoords.x, PedCoords.y,PedCoords.z, true, true, true)
			AttachEntityToEntity(meat, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 0x49D9), 0.15, 0.0, 0.01, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
			local carton = CreateObject(GetHashKey('prop_cs_clothes_box'),PedCoords.x, PedCoords.y,PedCoords.z, true, true, true)
			AttachEntityToEntity(carton, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 57005), 0.13, 0.0, -0.16, 250.0, -30.0, 0.0, false, false, false, false, 2, true)
			packs = 1
			LoadDict("anim@heists@ornate_bank@grab_cash_heels")
			TaskPlayAnim(PlayerPedId(), "anim@heists@ornate_bank@grab_cash_heels", "grab", 8.0, -8.0, -1, 1, 0, false, false, false)
			--FreezeEntityPosition(GetPlayerPed(-1), true)

			local finishedpacktime = 5000

			if exports['drp-inventory']:hasEnoughOfItem('chickenslammer', 1, false) then
				finishedpacktime = math.random(1500, 5000)
			end

			local finishedpacking = exports['drp-taskbar']:taskBar(finishedpacktime, 'Processing Meat')

			if (finishedpacking == 100 ) then 
				local lockingAnimation = exports["drp-ui"]:taskBarSkill(math.random(750, 1500),math.random(50,75))
				if (lockingAnimation == 100) then

					if exports["drp-inventory"]:hasEnoughOfItem("freshmeat", 6) then
						FreezeEntityPosition(GetPlayerPed(-1),false)
						TriggerEvent('inventory:removeItem', "freshmeat", math.random(3,6))
						if math.random(1,6) == 1 then
							TriggerEvent('player:receiveItem', "lqprotein", math.random(1,2))	
						else
							TriggerEvent('player:receiveItem', "cut_chicken", math.random(1,2))	
						end
						TriggerEvent('DoLongHudText', 'Keep processing the chicken.', 1)
						ClearPedTasks(GetPlayerPed(-1))
					end
				end
				DeleteEntity(carton)
				DeleteEntity(meat)
			end
		else
			TriggerEvent('DoLongHudText', 'Your Chicken Meat is already bad!', 2)	
		end
	else
		TriggerEvent('DoLongHudText', 'You have nothing to pack!', 2)
	end
end)


RegisterNetEvent("drp-civjobs:process-alive_chicken")
AddEventHandler("drp-civjobs:process-alive_chicken", function(position)
	if exports["drp-inventory"]:hasEnoughOfItem("petchicken", 1) then
		local dict = 'anim@amb@business@coc@coc_unpack_cut_left@'
		LoadDict(dict)
		--FreezeEntityPosition(GetPlayerPed(-1),true)
		TaskPlayAnim(GetPlayerPed(-1), dict, "coke_cut_v1_coccutter", 3.0, -8, -1, 63, 0, 0, 0, 0 )
		local PedCoords = GetEntityCoords(GetPlayerPed(-1))
		local prop = CreateObject(GetHashKey('prop_knife'),PedCoords.x, PedCoords.y,PedCoords.z, true, true, true)
		AttachEntityToEntity(prop, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 0xDEAD), 0.13, 0.14, 0.09, 40.0, 0.0, 0.0, false, false, false, false, 2, true)		local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 0.5, 1))
		local chicken = CreateObject(GetHashKey('prop_int_cf_chick_01'), x, y, z,  true,  false, false)
		SetEntityHeading(chicken, GetEntityHeading(GetPlayerPed(-1)))

		local finishedtime = 5000

		if exports['drp-inventory']:hasEnoughOfItem('chickenslammer', 1, false) then
			finishedtime = math.random(1500, 5000)
		end

		local finished = exports['drp-taskbar']:taskBar(finishedtime, 'Cutting the Chicken')
		
		if (finished == 100 ) then 
			local lockingAnimation = exports["drp-ui"]:taskBarSkill(math.random(750, 1500),math.random(50,75))
			if (lockingAnimation == 100) then
				if exports["drp-inventory"]:hasEnoughOfItem("petchicken", 1) then
					TriggerEvent('DoLongHudText', 'You slaughtered a chicken!', 1)
					FreezeEntityPosition(GetPlayerPed(-1),false)
					ClearPedTasks(GetPlayerPed(-1))
					if exports["drp-inventory"]:getAmountOfItem("petchicken") >= 2 then
						if math.random(2) == 2 then
							TriggerEvent('inventory:removeItem', "petchicken", 2)
							TriggerEvent('player:receiveItem', "freshmeat", math.random(2,6))	
						else
							TriggerEvent('inventory:removeItem', "petchicken", 1)
							TriggerEvent('player:receiveItem', "freshmeat", math.random(1,2))	
						end
					else
						TriggerEvent('inventory:removeItem', "petchicken", 1)
						TriggerEvent('player:receiveItem', "freshmeat", math.random(1,2))	
					end
				end
			else
				TriggerEvent('DoLongHudText', 'Might wanna pick that Alive Chicken back up from the floor', 2)
			end
		end
		DeleteEntity(chicken)
		DeleteEntity(prop)
	else
		TriggerEvent('DoLongHudText', 'You dont have any chickens!', 2)
	end
end)

function TepnijWyjscie()
	DoScreenFadeOut(500)
	Citizen.Wait(500)
	SetEntityCoordsNoOffset(GetPlayerPed(-1), startX+2, startY+2, startZ, 0, 0, 1)
	if DoesEntityExist(chicken1) or DoesEntityExist(chicken2) or DoesEntityExist(chicken3) then
		DeleteEntity(chicken1)
		DeleteEntity(chicken2)
		DeleteEntity(chicken3)
	end
	Citizen.Wait(500)
	DoScreenFadeIn(500)

	local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))
	prop = CreateObject(GetHashKey('hei_prop_heist_box'), x, y, z+0.2,  true,  true, true)
	AttachEntityToEntity(prop, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 60309), 0.025, 0.08, 0.255, -145.0, 290.0, 0.0, true, true, false, true, 1, true)
							
	local dajdoAuta = true

	while dajdoAuta do
		Citizen.Wait(250)
		local vehicle   = GetVehicleInDirection()
		local coords    = GetEntityCoords(GetPlayerPed(-1))
		LoadDict('anim@heists@box_carry@')

		if not IsEntityPlayingAnim(GetPlayerPed(-1), "anim@heists@box_carry@", "idle", 3 ) and dajdoAuta == true then
			TaskPlayAnim(GetPlayerPed(-1), 'anim@heists@box_carry@', "idle", 3.0, -8, -1, 63, 0, 0, 0, 0 )
		end
		
		if DoesEntityExist(vehicle) then
			dajdoAuta = false
			TriggerEvent('DoLongHudText', 'You put the chicken in the vehicle!', 2)
			LoadDict('anim@heists@narcotics@trash')
			TaskPlayAnim(GetPlayerPed(-1), 'anim@heists@narcotics@trash', "throw_a", 3.0, -8, -1, 63, 0, 0, 0, 0 )
			Citizen.Wait(900)
			ClearPedTasks(GetPlayerPed(-1))
			DeleteEntity(prop)
			TriggerEvent('player:receiveItem', "petchicken", 5)
		end
	end
end

RegisterNetEvent('chickencooldown')
AddEventHandler('chickencooldown', function()
	if chickencounter == 15 then
		TriggerEvent('DoLongHudText', 'You must wait a bit to catch more chooks', 2)
		Citizen.Wait(1200000) -- OK 20 now Sadge
		chickencounter = 0
	end
end)


RegisterNetEvent("chickens-start")
AddEventHandler("chickens-start", function()
	chickencounter = chickencounter + 1
	TriggerEvent("chickencooldown")
	DoScreenFadeOut(500)
	Citizen.Wait(500)
	SetEntityCoordsNoOffset(GetPlayerPed(-1), 2385.963, 5047.333, 46.400, 0, 0, 1)
	RequestModel(GetHashKey('a_c_hen'))
	while not HasModelLoaded(GetHashKey('a_c_hen')) do
		Wait(1)
	end
	chicken1 = CreatePed(26, "a_c_hen", 2370.262, 5052.913, 46.437, 276.351, true, false)
	chicken2 = CreatePed(26, "a_c_hen", 2372.040, 5059.604, 46.444, 223.595, true, false)
	chicken3 = CreatePed(26, "a_c_hen", 2379.192, 5062.992, 46.444, 195.477, true, false)

	TaskReactAndFleePed(chicken1, GetPlayerPed(-1))
	TaskReactAndFleePed(chicken2, GetPlayerPed(-1))
	TaskReactAndFleePed(chicken3, GetPlayerPed(-1))
	Citizen.Wait(500)
	DoScreenFadeIn(500)
	share = true
end)
-----
function LoadDict(dict)
    RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
	  	Citizen.Wait(10)
    end
end

Citizen.CreateThread(function()
    while true do
      Citizen.Wait(5)
	
		if share == true then
			local chicken1Coords = GetEntityCoords(chicken1)
			local chicken2Coords = GetEntityCoords(chicken2)
			local chicken3Coords = GetEntityCoords(chicken3)
			local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
			local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, chicken1Coords.x, chicken1Coords.y, chicken1Coords.z)
			local dist2 = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, chicken2Coords.x, chicken2Coords.y, chicken2Coords.z)
			local dist3 = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, chicken3Coords.x, chicken3Coords.y, chicken3Coords.z)
			
			if splashed == 3 then
				Zlapany1 = 0
				Zlapany2 = 0
				Zlapany3 = 0
				splashed = 0
				share = false
				TriggerEvent('DoLongHudText', 'Take the chickens to a vehicle!', 1)
				TepnijWyjscie()
			end
			
			if dist <= 3.0 then
			DrawText3D2(chicken1Coords.x, chicken1Coords.y, chicken1Coords.z+0.5, "~o~[E]~b~ Catch the chicken")
				if IsControlJustPressed(0, Keys['E']) then 
					Zlapany1 = 1
					Hewascaught()
				end	
			elseif dist2 <= 3.0 then
				DrawText3D2(chicken2Coords.x, chicken2Coords.y, chicken2Coords.z+0.5, "~o~[E]~b~ Catch the chicken")
				if IsControlJustPressed(0, Keys['E']) then 
					Zlapany2 = 1
					Hewascaught()
				end	
			elseif dist3 <= 3.0 then
				DrawText3D2(chicken3Coords.x, chicken3Coords.y, chicken3Coords.z+0.5, "~o~[E]~b~ Catch the chicken")
				if IsControlJustPressed(0, Keys['E']) then 
					Zlapany3 = 1
					Hewascaught()
				end	
			end
		else
			Citizen.Wait(500)
		end	
	end
end)

local ragdoll = false
function Hewascaught()
	LoadDict('move_jump')
	TaskPlayAnim(GetPlayerPed(-1), 'move_jump', 'dive_start_run', 8.0, -8.0, -1, 0, 0.0, 0, 0, 0)
	Citizen.Wait(600)
	SetPedToRagdoll(GetPlayerPed(-1), 1000, 1000, 0, 0, 0, 0)
	Citizen.Wait(1000)
	ragdoll = true
	local szansaZlapania = math.random(1,100)
	if szansaZlapania <= 60 then
		TriggerEvent('DoLongHudText', 'You managed to catch a chicken!', 1)
		if Zlapany1 == 1 then
			DeleteEntity(chicken1)
			Zlapany1 = 0
			splashed = splashed +1
		elseif Zlapany2 == 1 then
			DeleteEntity(chicken2)
			Zlapany2 = 0
			splashed = splashed +1
		elseif Zlapany3 == 1 then
			DeleteEntity(chicken3)
			Zlapany3 = 0
			splashed = splashed +1
		end
	else
		TriggerEvent('DoLongHudText', 'The chicken escaped your arms!', 2)
	end
end

Citizen.CreateThread(function()
    while true do
	Citizen.Wait(0)
		if ragdoll then
			SetEntityHealth(PlayerPedId(), 200)
			TriggerEvent('drp-hospital:client:ResetLimbs')
            TriggerEvent('drp-hospital:client:RemoveBleed')
			ragdoll = false
		end
	end
end)

RegisterNetEvent("drp-chickens:sellprotein")
AddEventHandler("drp-chickens:sellprotein", function()
	local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 0.9, -0.98))
	local prop = CreateObject(GetHashKey('hei_prop_heist_box'), x, y, z,  true,  false, false)
	SetEntityHeading(prop, GetEntityHeading(GetPlayerPed(-1)))
	LoadDict('amb@medic@standing@tendtodead@idle_a')
	TaskPlayAnim(GetPlayerPed(-1), 'amb@medic@standing@tendtodead@idle_a', 'idle_a', 8.0, -8.0, -1, 1, 0.0, 0, 0, 0)
	local toSell = exports["drp-inventory"]:getAmountOfItem("lqprotein")
	local finished = exports['drp-taskbar']:taskBar(7500*toSell/5, 'Selling Protein')
	LoadDict('amb@medic@standing@tendtodead@exit')
	TaskPlayAnim(GetPlayerPed(-1), 'amb@medic@standing@tendtodead@exit', 'exit', 8.0, -8.0, -1, 1, 0.0, 0, 0, 0)
	if (finished == 100) then		
		if exports["drp-inventory"]:hasEnoughOfItem("lqprotein",toSell,false) and GetDistanceBetweenCoords(x, y, z, GetEntityCoords(GetPlayerPed(-1)).x, GetEntityCoords(GetPlayerPed(-1)).y, GetEntityCoords(GetPlayerPed(-1)).z, true) <= 25 then
			if exports["drp-inventory"]:getQuantity("lqprotein") >= 1 then
				TriggerEvent('inventory:removeItem', 'lqprotein', toSell)
				TriggerServerEvent('chickenpayment:pay', math.random(200, 450) * toSell)
				ClearPedTasksImmediately(PlayerPedId())
			else 
				TriggerEvent('DoLongHudText', 'Your proteins are bad!', 2)
			end
		end
	end
	DeleteEntity(prop)
end)


RegisterNetEvent("drp-chickens:sellcuttedchicken")
AddEventHandler("drp-chickens:sellcuttedchicken", function()
	local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 0.9, -0.98))
	local prop = CreateObject(GetHashKey('hei_prop_heist_box'), x, y, z,  true,  false, false)
	SetEntityHeading(prop, GetEntityHeading(GetPlayerPed(-1)))
	LoadDict('amb@medic@standing@tendtodead@idle_a')
	TaskPlayAnim(GetPlayerPed(-1), 'amb@medic@standing@tendtodead@idle_a', 'idle_a', 8.0, -8.0, -1, 1, 0.0, 0, 0, 0)
	local toSell = exports["drp-inventory"]:getAmountOfItem("cut_chicken")
	local finished = exports['drp-taskbar']:taskBar(7500*toSell/5, 'Selling Chickens')
	LoadDict('amb@medic@standing@tendtodead@exit')
	TaskPlayAnim(GetPlayerPed(-1), 'amb@medic@standing@tendtodead@exit', 'exit', 8.0, -8.0, -1, 1, 0.0, 0, 0, 0)
	if (finished == 100) then		
		if exports["drp-inventory"]:hasEnoughOfItem("cut_chicken",toSell,false) and GetDistanceBetweenCoords(x, y, z, GetEntityCoords(GetPlayerPed(-1)).x, GetEntityCoords(GetPlayerPed(-1)).y, GetEntityCoords(GetPlayerPed(-1)).z, true) <= 25 then
			if exports["drp-inventory"]:getQuantity("cut_chicken") >= 1 then
				TriggerEvent('inventory:removeItem', 'cut_chicken', toSell)
				TriggerServerEvent('chickenpayment:pay', math.random(200, 300) * toSell)
				ClearPedTasksImmediately(PlayerPedId())
			else 
				TriggerEvent('DoLongHudText', 'Your chickens are bad!', 2)
			end
		end
	end
	DeleteEntity(prop)
end)

--// Proccess Stations

--// Station 1

RoyalChickenProcessStation1 = false

Citizen.CreateThread(function()
    exports["drp-polyzone"]:AddBoxZone("royal_chicken_procces_station_1", vector3(-95.52, 6207.25, 31.03), 2, 1.8, {
        name="royal_chicken_procces_station_1",
		heading=315,
		--debugPoly=true,
		minZ=28.23,
		maxZ=32.23
    })
end)

RegisterNetEvent('drp-polyzone:enter')
AddEventHandler('drp-polyzone:enter', function(name)
    if name == "royal_chicken_procces_station_1" then
        RoyalChickenProcessStation1 = true     
        RoyalProccesStation1Chickens()
		exports['drp-textui']:showInteraction("[E] Process Alive Chicken")
    end
end)

RegisterNetEvent('drp-polyzone:exit')
AddEventHandler('drp-polyzone:exit', function(name)
    if name == "royal_chicken_procces_station_1" then
        RoyalChickenProcessStation1 = false
        exports['drp-textui']:hideInteraction()
    end
end)

function RoyalProccesStation1Chickens()
	Citizen.CreateThread(function()
        while RoyalChickenProcessStation1 do
            Citizen.Wait(5)
			if IsControlJustReleased(0, 38) then
				TriggerEvent('drp-civjobs:process-alive_chicken')
			end
		end
	end)
end

--// Station 2

RoyalChickenProcessStation2 = false

Citizen.CreateThread(function()
    exports["drp-polyzone"]:AddBoxZone("royal_chicken_procces_station_2", vector3(-524.7509, -711.4124, 33.8249), 1, 1.8, {
        name="royal_chicken_procces_station_2",
		heading=112.7492,
		--debugPoly=true,
		minZ=28.03,
		maxZ=32.03
    })
end)

RegisterNetEvent('drp-polyzone:enter')
AddEventHandler('drp-polyzone:enter', function(name)
    if name == "royal_chicken_procces_station_2" then
        RoyalChickenProcessStation2 = true     
        RoyalProccesStation2Chickens()
		exports['drp-textui']:showInteraction("[E] Process Alive Chicken")
    end
end)

RegisterNetEvent('drp-polyzone:exit')
AddEventHandler('drp-polyzone:exit', function(name)
    if name == "royal_chicken_procces_station_2" then
        RoyalChickenProcessStation2 = false
        exports['drp-textui']:hideInteraction()
    end
end)

function RoyalProccesStation2Chickens()
	Citizen.CreateThread(function()
        while RoyalChickenProcessStation2 do
            Citizen.Wait(5)
			if IsControlJustReleased(0, 38) then
				TriggerEvent('drp-civjobs:process-alive_chicken')
			end
		end
	end)
end

--// Chicken Proccess

--// Process 1

RoyalProcessSlaughtered1 = false

Citizen.CreateThread(function()
    exports["drp-polyzone"]:AddBoxZone("royal_chicken_process_1", vector3(-99.97, 6211.17, 31.03), 2, 2, {
        name="royal_chicken_process_1",
		heading=315,
		--debugPoly=true,
		minZ=28.43,
		maxZ=32.43
    })
end)

RegisterNetEvent('drp-polyzone:enter')
AddEventHandler('drp-polyzone:enter', function(name)
    if name == "royal_chicken_process_1" then
        RoyalProcessSlaughtered1 = true     
        RoyalChickenProcess1()
		exports['drp-textui']:showInteraction("[E] Process Slaughtered Chicken [Bay 1]")
    end
end)

RegisterNetEvent('drp-polyzone:exit')
AddEventHandler('drp-polyzone:exit', function(name)
    if name == "royal_chicken_process_1" then
        RoyalProcessSlaughtered1 = false
        exports['drp-textui']:hideInteraction()
    end
end)

function RoyalChickenProcess1()
	Citizen.CreateThread(function()
        while RoyalProcessSlaughtered1 do
            Citizen.Wait(5)
			if IsControlJustReleased(0, 38) then
				TriggerEvent('drp-civjobs:package-chicken')
			end
		end
	end)
end

--// Process 2

RoyalProcessSlaughtered2 = false

Citizen.CreateThread(function()
    exports["drp-polyzone"]:AddBoxZone("royal_chicken_process_2", vector3(-102.1, 6208.91, 31.03), 2, 2, {
        name="royal_chicken_process_2",
		heading=45,
		--debugPoly=true,
		minZ=28.43,
		maxZ=32.43
    })
end)

RegisterNetEvent('drp-polyzone:enter')
AddEventHandler('drp-polyzone:enter', function(name)
    if name == "royal_chicken_process_2" then
        RoyalProcessSlaughtered2 = true     
        RoyalChickenProcess2()
		exports['drp-textui']:showInteraction("[E] Process Slaughtered Chicken [Bay 2]")
    end
end)

RegisterNetEvent('drp-polyzone:exit')
AddEventHandler('drp-polyzone:exit', function(name)
    if name == "royal_chicken_process_2" then
        RoyalProcessSlaughtered2 = false
        exports['drp-textui']:hideInteraction()
    end
end)

function RoyalChickenProcess2()
	Citizen.CreateThread(function()
        while RoyalProcessSlaughtered2 do
            Citizen.Wait(5)
			if IsControlJustReleased(0, 38) then
				TriggerEvent('drp-civjobs:package-chicken')
			end
		end
	end)
end

--// Process 3

RoyalProcessSlaughtered3 = false

Citizen.CreateThread(function()
    exports["drp-polyzone"]:AddBoxZone("royal_chicken_process_3", vector3(-104.31, 6206.7, 31.03), 2, 2, {
        name="royal_chicken_process_3",
		heading=315,
		debugPoly=false,
		minZ=28.43,
		maxZ=32.43
    })
end)

RegisterNetEvent('drp-polyzone:enter')
AddEventHandler('drp-polyzone:enter', function(name)
    if name == "royal_chicken_process_3" then
        RoyalProcessSlaughtered3 = true     
        RoyalChickenProcess3()
		exports['drp-textui']:showInteraction("[E] Process Slaughtered Chicken [Bay 3]")
    end
end)

RegisterNetEvent('drp-polyzone:exit')
AddEventHandler('drp-polyzone:exit', function(name)
    if name == "royal_chicken_process_3" then
        RoyalProcessSlaughtered3 = false
        exports['drp-textui']:hideInteraction()
    end
end)

function RoyalChickenProcess3()
	Citizen.CreateThread(function()
        while RoyalProcessSlaughtered3 do
            Citizen.Wait(5)
			if IsControlJustReleased(0, 38) then
				TriggerEvent('drp-civjobs:package-chicken')
			end
		end
	end)
end

--// Start Chickens

RoyalChickenStart = false

Citizen.CreateThread(function()
    exports["drp-polyzone"]:AddBoxZone("royal_chickens_start", vector3(2387.34, 5044.39, 46.31), 2, 2, {
        name="royal_chickens_start",
		heading=310,
		--debugPoly=true,
		minZ=43.51,
		maxZ=47.51
    })
end)

RegisterNetEvent('drp-polyzone:enter')
AddEventHandler('drp-polyzone:enter', function(name)
    if name == "royal_chickens_start" then
        RoyalChickenStart = true     
        RoyalRPChickensStart()
		exports['drp-textui']:showInteraction("[E] Start Catching Chickens")
    end
end)

RegisterNetEvent('drp-polyzone:exit')
AddEventHandler('drp-polyzone:exit', function(name)
    if name == "royal_chickens_start" then
        RoyalChickenStart = false
        exports['drp-textui']:hideInteraction()
    end
end)

function RoyalRPChickensStart()
	Citizen.CreateThread(function()
        while RoyalChickenStart do
            Citizen.Wait(5)
			if IsControlJustReleased(0, 38) then
				if chickencounter == 15 then
					TriggerEvent('DoLongHudText', 'You must wait a bit to catch more chooks', 2)
				else
					TriggerEvent('chickens-start')
				end
			end
		end
	end)
end



--// Peds

function setChickenStartPed()
	modelHash = GetHashKey("a_m_y_stwhi_02")
	RequestModel(modelHash)
	while not HasModelLoaded(modelHash) do
		Wait(1)
	end
	created_ped = CreatePed(0, modelHash , 2387.1955566406, 5044.6416015625, 46.331909179688  -1, true)
	FreezeEntityPosition(created_ped, true)
	SetEntityHeading(created_ped, 218.2677154541)
	SetEntityInvincible(created_ped, true)
	SetBlockingOfNonTemporaryEvents(created_ped, true)
	TaskStartScenarioInPlace(created_ped, "WORLD_HUMAN_CLIPBOARD", 0, true)
end

Citizen.CreateThread(function()
	setChickenStartPed()
end)


