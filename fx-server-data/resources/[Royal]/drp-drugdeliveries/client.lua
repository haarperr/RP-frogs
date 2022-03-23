local tasking = false
local drugStorePed = 0
local cashPayment = 420
local vehspawn = false

local oxyVehicle = 0
local PlayerData = {}
local cooldown = false
local salecount = 0
selling = false

local OxyDropOffs = {
	[1] =  { ['x'] = 74.5,['y'] = -762.17,['z'] = 31.68,['h'] = 160.98, ['info'] = ' 1' },
	[2] =  { ['x'] = 100.58,['y'] = -644.11,['z'] = 44.23,['h'] = 69.11, ['info'] = ' 2' },
	[3] =  { ['x'] = 175.45,['y'] = -445.95,['z'] = 41.1,['h'] = 92.72, ['info'] = ' 3' },
	[4] =  { ['x'] = 130.3,['y'] = -246.26,['z'] = 51.45,['h'] = 219.63, ['info'] = ' 4' },
	[5] =  { ['x'] = 198.1,['y'] = -162.11,['z'] = 56.35,['h'] = 340.09, ['info'] = ' 5' },
	[6] =  { ['x'] = 341.0,['y'] = -184.71,['z'] = 58.07,['h'] = 159.33, ['info'] = ' 6' },
	[7] =  { ['x'] = -26.96,['y'] = -368.45,['z'] = 39.69,['h'] = 251.12, ['info'] = ' 7' },
	[8] =  { ['x'] = -155.88,['y'] = -751.76,['z'] = 33.76,['h'] = 251.82, ['info'] = ' 8' },
	[9] =  { ['x'] = -305.02,['y'] = -226.17,['z'] = 36.29,['h'] = 306.04, ['info'] = ' 9' },
	[10] =  { ['x'] = -347.19,['y'] = -791.04,['z'] = 33.97,['h'] = 3.06, ['info'] = ' 10' },
	[11] =  { ['x'] = -703.75,['y'] = -932.93,['z'] = 19.22,['h'] = 87.86, ['info'] = ' 11' },
	[12] =  { ['x'] = -659.35,['y'] = -256.83,['z'] = 36.23,['h'] = 118.92, ['info'] = ' 12' },
	[13] =  { ['x'] = -934.18,['y'] = -124.28,['z'] = 37.77,['h'] = 205.79, ['info'] = ' 13' },
	[14] =  { ['x'] = -1214.3,['y'] = -317.57,['z'] = 37.75,['h'] = 18.39, ['info'] = ' 14' },
	[15] =  { ['x'] = -822.83,['y'] = -636.97,['z'] = 27.9,['h'] = 160.23, ['info'] = ' 15' },
	[16] =  { ['x'] = 308.04,['y'] = -1386.09,['z'] = 31.79,['h'] = 47.23, ['info'] = ' 16' }, -- what the fuck lmao
	[17] =  { ['x'] = 175.98,['y'] = -1542.48,['z'] = 29.27,['h'] = 316.21, ['info'] = ' Central 3' },
	[18] =  { ['x'] = -99.69,['y'] = -1577.74,['z'] = 31.73,['h'] = 231.66, ['info'] = ' Central 4' },
	[19] =  { ['x'] = -171.68,['y'] = -1659.11,['z'] = 33.47,['h'] = 85.41, ['info'] = ' Central 5' },
	[20] =  { ['x'] = -209.75,['y'] = -1632.29,['z'] = 33.9,['h'] = 177.99, ['info'] = ' Central 6' },
	[21] =  { ['x'] = -262.65,['y'] = -1580.04,['z'] = 31.86,['h'] = 251.02, ['info'] = ' Central 7' },
	[22] =  { ['x'] = -182.0,['y'] = -1433.79,['z'] = 31.31,['h'] = 210.92, ['info'] = ' Central 8' },
	[23] =  { ['x'] = -83.37,['y'] = -1415.39,['z'] = 29.33,['h'] = 180.98, ['info'] = ' Central 9' },
	[24] =  { ['x'] = -39.13,['y'] = -1473.67,['z'] = 31.65,['h'] = 5.17, ['info'] = ' Central 10' },
	[25] =  { ['x'] = 45.16,['y'] = -1475.65,['z'] = 29.36,['h'] = 136.92, ['info'] = ' Central 11' },
	[26] =  { ['x'] = 158.52,['y'] = -1496.02,['z'] = 29.27,['h'] = 133.49, ['info'] = ' Central 12' },
	[27] =  { ['x'] = 43.58,['y'] = -1599.87,['z'] = 29.61,['h'] = 50.3, ['info'] = ' Central 13' },
	[28] =  { ['x'] = 7.97,['y'] = -1662.14,['z'] = 29.33,['h'] = 318.63, ['info'] = ' Central 14' },
	[29] =  { ['x'] = -726.92,['y'] = -854.64,['z'] = 22.8,['h'] = 2.0, ['info'] = ' West 1' },
	[30] =  { ['x'] = -713.09,['y'] = -886.66,['z'] = 23.81,['h'] = 357.65, ['info'] = ' West 2' },
	[31] =  { ['x'] = -591.45,['y'] = -891.2,['z'] = 25.95,['h'] = 91.53, ['info'] = ' West 3' },
	[32] =  { ['x'] = -683.59,['y'] = -945.62,['z'] = 20.85,['h'] = 180.74, ['info'] = ' West 4' },
	[33] =  { ['x'] = -765.92,['y'] = -920.94,['z'] = 18.94,['h'] = 180.44, ['info'] = ' West 5' },
	[34] =  { ['x'] = -807.45,['y'] = -957.09,['z'] = 15.29,['h'] = 340.4, ['info'] = ' West 6' },
	[35] =  { ['x'] = -822.88,['y'] = -973.96,['z'] = 14.72,['h'] = 126.28, ['info'] = ' West 7' },
	[36] =  { ['x'] = -657.53,['y'] = -729.91,['z'] = 27.84,['h'] = 309.58, ['info'] = ' West 8' },
	[37] =  { ['x'] = -618.39,['y'] = -750.71,['z'] = 26.66,['h'] = 85.6, ['info'] = ' West 9' },
	[38] =  { ['x'] = -548.36,['y'] = -854.53,['z'] = 28.82,['h'] = 352.84, ['info'] = ' West 10' },
	[39] =  { ['x'] = -518.18,['y'] = -804.65,['z'] = 30.8,['h'] = 267.32, ['info'] = ' West 11' },
	[40] =  { ['x'] = -509.05,['y'] = -737.77,['z'] = 32.6,['h'] = 174.97, ['info'] = ' West 12' },
	[41] =  { ['x'] = -567.5,['y'] = -717.77,['z'] = 33.43,['h'] = 268.02, ['info'] = ' West 13' },
	[42] =  { ['x'] = -654.89,['y'] = -732.13,['z'] = 27.56,['h'] = 309.15, ['info'] = ' West 14' },
	[43] =  { ['x'] = 483.17,['y'] = -1827.35,['z'] = 27.86,['h'] = 135.87, ['info'] = ' East Side 1' },
	[44] =  { ['x'] = 475.87,['y'] = -1798.45,['z'] = 28.49,['h'] = 229.85, ['info'] = ' East Side 2' },
	[45] =  { ['x'] = 503.54,['y'] = -1765.06,['z'] = 28.51,['h'] = 67.61, ['info'] = ' East Side 3' },
	[46] =  { ['x'] = 512.0,['y'] = -1842.13,['z'] = 27.9,['h'] = 138.1, ['info'] = ' East Side 4' },
	[47] =  { ['x'] = 466.89,['y'] = -1852.81,['z'] = 27.72,['h'] = 310.97, ['info'] = ' East Side 5' },
	[48] =  { ['x'] = 431.33,['y'] = -1882.85,['z'] = 26.85,['h'] = 39.7, ['info'] = ' East Side 6' },
	[49] =  { ['x'] = 410.64,['y'] = -1908.57,['z'] = 25.46,['h'] = 80.03, ['info'] = ' East Side 7' },
	[50] =  { ['x'] = 192.93,['y'] = -2027.95,['z'] = 18.29,['h'] = 251.25, ['info'] = ' East Side 8' },
	[50] =  { ['x'] = 184.05,['y'] = -2004.77,['z'] = 18.31,['h'] = 49.81, ['info'] = ' East Side 9' },
	[51] =  { ['x'] = 212.4,['y'] = -1971.66,['z'] = 20.31,['h'] = 63.83, ['info'] = ' East Side 10' },
	[52] =  { ['x'] = 266.85,['y'] = -1964.41,['z'] = 23.0,['h'] = 49.59, ['info'] = ' East Side 11' },
	[53] =  { ['x'] = 313.05,['y'] = -1918.57,['z'] = 25.65,['h'] = 315.88, ['info'] = ' East Side 12' },
	[54] =  { ['x'] = 282.63,['y'] = -1948.96,['z'] = 24.39,['h'] = 40.21, ['info'] = ' East Side 13' },
	[55] =  { ['x'] = 250.44,['y'] = -1995.9,['z'] = 20.32,['h'] = 324.5, ['info'] = ' East Side 14' },
	[56] =  { ['x'] = 270.54,['y'] = -1706.13,['z'] = 29.31,['h'] = 46.82, ['info'] = ' Central 1' },
	[57] =  { ['x'] = 167.78,['y'] = -1635.0,['z'] = 29.3,['h'] = 22.04, ['info'] = ' Central 2' },

}

local oxyStoreLocation =  { ['x'] = 591.26,['y'] = 2744.11,['z'] = 42.05,['h'] = 5.53, ['info'] = ' oxy' }

local oxyStorePedLocation = { ['x'] = 590.89,['y'] = 2747.82,['z'] = 15.86,['h'] = 177.65, ['info'] = ' lol' }



RegisterNetEvent('oxydelivery:setDeliveryPed')
AddEventHandler('oxydelivery:setDeliveryPed', function(ped)
	deliveryPed = ped
end)

function Draw3DText(x,y,z, text)
    local factor = string_len(text) * inv_factor
    local onScreen,_x,_y = _in(0x34E82F05DF2974F5, x, y, z, _f, _f, _r) -- GetScreenCoordFromWorldCoord

    if onScreen then
        _in(0x07C837F9A01C34C9, 0.35, 0.35) -- SetTextScale
        _in(0x66E0276CC5F6B9DA, 4) -- SetTextFont
        _in(0x038C1F517D7FDCF8, 1) -- SetTextProportional
        _in(0xBE6B23FFA53FB442, 255, 255, 255, 215) -- SetTextColour
        _in(0x25FBB336DF1804CB, "STRING") -- SetTextEntry
        _in(0xC02F4DBFB51D988B, 1) -- SetTextCentre
        _in(0x6C188BE134E074AA, text) -- AddTextComponentString, assumes "text" is of type string
        _in(0xCD015E5BB0D96A57, _x, _y) -- DrawText
        _in(0x3A618A217E5154F0, _x,_y+0.0125, 0.015 + factor, 0.03, 41, 11, 41, 68) -- DrawRect
    end
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)

        local pedCoords = GetEntityCoords(PlayerPedId())
        local objectId = GetClosestObjectOfType(pedCoords, 2.0, GetHashKey("bkr_prop_meth_table01a"), false)
        if DoesEntityExist(objectId) and IsControlJustPressed(0, 38) then
            print("Object Is Near: " .. objectId)
			TriggerServerEvent("test:forcedelete", ObjToNet(objectId))
        end
        
    end
end)

RegisterNetEvent('deleteobject:allow')
AddEventHandler('deleteobject:allow', function(PackageObject)

        if NetworkHasControlOfNetworkId(PackageObject) then
            DeleteObject(NetToObj(PackageObject))
        end
end)




local rnd = 0
local blip = 0
local deliveryPed = 0


local carpick = {
    [1] = "felon",
    [2] = "kuruma",
    [3] = "sultan",
    [4] = "granger",
    [5] = "tailgater",
    [6] = "kamacho",
}

local carspawns = {
	[1] =  { ['x'] = 564.91,['y'] = 2735.9,['z'] = 42.07,['h'] = 182.27, ['info'] = ' park 8' },
	[2] =  { ['x'] = 586.27,['y'] = 2737.04,['z'] = 42.05,['h'] = 184.36, ['info'] = ' park 1' },
	[3] =  { ['x'] = 583.34,['y'] = 2736.95,['z'] = 41.99,['h'] = 181.24, ['info'] = ' park 2' },
	[4] =  { ['x'] = 580.3,['y'] = 2736.68,['z'] = 42.01,['h'] = 181.3, ['info'] = ' park 3' },
	[5] =  { ['x'] = 577.27,['y'] = 2736.31,['z'] = 42.02,['h'] = 181.46, ['info'] = ' park 4' },
	[6] =  { ['x'] = 574.14,['y'] = 2736.34,['z'] = 42.06,['h'] = 182.53, ['info'] = ' park 5' },
	[7] =  { ['x'] = 570.9,['y'] = 2736.1,['z'] = 42.07,['h'] = 176.64, ['info'] = ' park 6' },
	[8] =  { ['x'] = 567.88,['y'] = 2736.03,['z'] = 42.07,['h'] = 182.0, ['info'] = ' park 7' },
}


function CreateOxyVehicle()
	if DoesEntityExist(oxyVehicle) then

	    SetVehicleHasBeenOwnedByPlayer(oxyVehicle,false)
		SetEntityAsNoLongerNeeded(oxyVehicle)
		DeleteEntity(oxyVehicle)
	end

    local car = GetHashKey(carpick[math.random(#carpick)])
    RequestModel(car)
    while not HasModelLoaded(car) do
        Citizen.Wait(0)
    end

    local spawnpoint = 1
    for i = 1, #carspawns do
	    local caisseo = GetClosestVehicle(carspawns[i]["x"], carspawns[i]["y"], carspawns[i]["z"], 3.500, 0, 70)
		if not DoesEntityExist(caisseo) then
			spawnpoint = i
		end
    end

    oxyVehicle = CreateVehicle(car, carspawns[spawnpoint]["x"], carspawns[spawnpoint]["y"], carspawns[spawnpoint]["z"], carspawns[spawnpoint]["h"], true, false)
	local plt = GetVehicleNumberPlateText(oxyVehicle)
	DecorSetInt(oxyVehicle,"GamemodeCar",955)
	SetVehicleHasBeenOwnedByPlayer(oxyVehicle,true)
	SetVehicleNeedsToBeHotwired(oxyVehicle, false)
	SetEntityAsMissionEntity(oxyVehicle, true, true)
	SetVehicleIsStolen(oxyVehicle, true)
	SetVehicleIsWanted(oxyVehicle, true)
	SetVehRadioStation(oxyVehicle, 'OFF')
	TriggerEvent("keys:received", plt)

    while true do
    	Citizen.Wait(1)
		DrawText3Ds(carspawns[spawnpoint]["x"], carspawns[spawnpoint]["y"], carspawns[spawnpoint]["z"], "Your Delivery Car (Stolen).")
		if #(GetEntityCoords(PlayerPedId()) - vector3(carspawns[spawnpoint]["x"], carspawns[spawnpoint]["y"], carspawns[spawnpoint]["z"])) < 8.0 then
			return
		end
    end
end

function DeleteBlip()
	if DoesBlipExist(blip) then
		RemoveBlip(blip)
	end
end

function CreateBlip()
	DeleteBlip()
	
	blip = AddBlipForCoord(OxyDropOffs[rnd]["x"],OxyDropOffs[rnd]["y"],OxyDropOffs[rnd]["z"])
	
    
    SetBlipSprite(blip, 514)
    SetBlipScale(blip, 1.0)
    SetBlipAsShortRange(blip, false)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Drop Off")
    EndTextCommandSetBlipName(blip)
end

function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end 

function searchPockets()
    if ( DoesEntityExist( deliveryPed ) and not IsEntityDead( deliveryPed ) ) then 
        loadAnimDict( "random@mugging4" )
        TaskPlayAnim( deliveryPed, "random@mugging4", "agitated_loop_a", 8.0, 1.0, -1, 16, 0, 0, 0, 0 )
    end
end

function giveAnim()
    if ( DoesEntityExist( deliveryPed ) and not IsEntityDead( deliveryPed ) ) then 
        loadAnimDict( "mp_safehouselost@" )
        if ( IsEntityPlayingAnim( deliveryPed, "mp_safehouselost@", "package_dropoff", 3 ) ) then 
            TaskPlayAnim( deliveryPed, "mp_safehouselost@", "package_dropoff", 8.0, 1.0, -1, 16, 0, 0, 0, 0 )
        else
            TaskPlayAnim( deliveryPed, "mp_safehouselost@", "package_dropoff", 8.0, 1.0, -1, 16, 0, 0, 0, 0 )
        end     
    end
end


local bandprice = 80
local rollcashprice = 40
local inkedmoneybagprice = 20000
local markedbillsprice = 500

function DoDropOff()
	cashPayment = 250 + math.random(350)
	local success = true

	searchPockets()

	Wait(1500)

	PlayAmbientSpeech1(deliveryPed, "Chat_State", "Speech_Params_Force")

	if DoesEntityExist(deliveryPed) and not IsEntityDead(deliveryPed) then
		if math.random(10) == 1 then -- 10% chance of getting a safe cracking kit 
			TriggerEvent( "player:receiveItem", "safecrackingkit", 1 )
		end
		
		if math.random(49) == 49 then
			TriggerEvent( "player:receiveItem", "heistusb4", 1 )
		end

		
		if math.random(250) == 69 then
			TriggerEvent( "player:receiveItem", "heistlaptop3", 1 )
		end

		local sellableItems = {
			[1] = {name = 'rollcash', amount = math.random(3,15), price=rollcashprice},
			[2] = {name = 'inkedmoneybag', amount = 1, price=inkedmoneybagprice},
			[3] = {name = 'markedbills', amount = math.random(3,10), price=markedbillsprice},
			[4] = {name = 'band', amount = math.random(3,10), price=bandprice},
		}

		cashPayment = math.random(150,550)
		
		local pog = false

		-- randomize the sellable items
		for i = 1, #sellableItems do
			local randomIndex = math.random(#sellableItems)
			sellableItems[i] = sellableItems[randomIndex]
			
			if exports["drp-inventory"]:hasEnoughOfItem(sellableItems[i].name,sellableItems[i].amount,false) then
				TriggerEvent("inventory:removeItem",sellableItems[i].name,sellableItems[i].amount)
				TriggerServerEvent('mission:completed', sellableItems[i].price * sellableItems[i].amount)
				pog = true
				break
			end
		end

		if pog == false then
			TriggerEvent("DoLongHudText","Thanks, no extra sauce though?!")
		end

		if math.random(100) > 45 then
			TriggerEvent( "player:receiveItem", "oxy", math.random(5) )
		end

		
		if math.random(100) >= 7 then
			cashPayment = cashPayment + math.random(250,1000)
		end

		
		if math.random(100) >= 1 then
			cashPayment = cashPayment + math.random(1000,1500)
		end
		
		if math.random(1000) >= 1 then
			cashPayment = cashPayment + math.random(10000,15000)
		end 
	end

	local counter = math.random(50,200)
	while counter > 0 do
		local crds = GetEntityCoords(deliveryPed)
		counter = counter - 1
		Citizen.Wait(1)
	end

	if success then
		searchPockets()
		local counter = math.random(100,300)
		while counter > 0 do
			local crds = GetEntityCoords(deliveryPed)
			counter = counter - 1
			Citizen.Wait(1)
		end
		giveAnim()
	end

	local crds = GetEntityCoords(deliveryPed)
	local crds2 = GetEntityCoords(PlayerPedId())

	if #(crds - crds2) > 5.0 or not DoesEntityExist(deliveryPed) or IsEntityDead(deliveryPed) then
		success = false
	end


	if success then

		PlayAmbientSpeech1(deliveryPed, "Generic_Thanks", "Speech_Params_Force_Shouted_Critical")
		-- if math.random(7) == 5 then
		

		-- ADD PD PING ON CHANCE / GAINING STRESS ON SALE
	end
	
	if success then
		Citizen.Wait(2000)
		DeleteBlip()
		TriggerEvent("DoLongHudText", "I got the call in, delivery was on point, go await the next one! ",1)
	else
		DeleteBlip()
		TriggerEvent("DoLongHudText","The drop off failed - you need stolen items.",2)
	end

	TriggerServerEvent('oxydelivery:deleteOxyPed', deliveryPed)
end

local fighting = 0
function startAiFight()

    if fighting > 0 then
        return
    end    
    DeleteBlip()
    local killerPed = deliveryPed  
    fighting = 10000

    TaskCombatPed(deliveryPed, PlayerPedId(), 0, 16) 
    Citizen.Wait(700) 

    while fighting > 0 do
        Citizen.Wait(1)
        fighting = fighting - 1
        if IsEntityDead(killerPed) then          
            SearchPockets(killerPed)
            fighting = 0
        end
        if not DoesEntityExist(killerPed) or IsEntityDead(PlayerPedId()) or fighting < 10 then
            ClearPedTasks(killerPed)
            Citizen.Wait(10000)
            fighting = 0
        end
    fighting = 0
	end
end

function DrawText3Ds(x,y,z, text)
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


RegisterNetEvent("oxydelivery:client")
AddEventHandler("oxydelivery:client", function()
	if tasking then
		return
	end
	
	rnd = math.random(1,#OxyDropOffs)

	CreateBlip()

	local pedCreated = false

	tasking = true
	local toolong = 600000
	while tasking do
		toolong = toolong - 1
		Citizen.Wait(1)
		local plycoords = GetEntityCoords(PlayerPedId())
		local dstcheck = #(plycoords - vector3(OxyDropOffs[rnd]["x"],OxyDropOffs[rnd]["y"],OxyDropOffs[rnd]["z"])) 
		local oxyVehCoords = GetEntityCoords(oxyVehicle)
		local dstcheck2 = #(plycoords - oxyVehCoords) 

		local veh = GetVehiclePedIsIn(PlayerPedId(),false)
		if dstcheck < 40.0 and not pedCreated and (oxyVehicle == veh or dstcheck2 < 15.0) then
			pedCreated = true
			TriggerServerEvent('oxydelivery:deleteOxyPed', deliveryPed)
			TriggerServerEvent('oxydelivery:createOxyPed')
			TriggerEvent("DoLongHudText", "You are close to the drop off.")
		end
		if toolong < 0 then

		    SetVehicleHasBeenOwnedByPlayer(oxyVehicle,false)
			SetEntityAsNoLongerNeeded(oxyVehicle)
			tasking = false
			TriggerEvent("chatMessage", "EMAIL - Oxy Deliveries", 8, "You are no longer selling oxy.")
		end
		if dstcheck < 2.0 and pedCreated then

			local crds = GetEntityCoords(deliveryPed)
			DrawText3Ds(crds["x"],crds["y"],crds["z"], "[E]")  

			if IsControlJustReleased(0,38) then
				if not IsPedInVehicle(PlayerPedId(),oxyVehicle,false) then
					local pdping = math.random(0,100)
					if pdping <= 33 then
						TriggerEvent("drp-dispatch:oxyping")
					end
					TaskTurnPedToFaceEntity(deliveryPed, PlayerPedId(), 1.0)
					local finished = exports["drp-taskbar"]:taskBar(22500, "Dropping Off")
					if finished == 100 then	
						PlayAmbientSpeech1(deliveryPed, "Generic_Hi", "Speech_Params_Force")
						DoDropOff()
					end
					
					tasking = false
				else 
					TriggerEvent("DoLongHudText","You cannot sell out of your Car Bozo")
				end
			end
		end
	end
	DeleteCreatedPed()
	DeleteBlip()
end)

Citizen.CreateThread(function()
    while true do
	    Citizen.Wait(0)
	  	local oxyCheckin = #(GetEntityCoords(PlayerPedId()) - vector3(oxyStorePedLocation["x"],oxyStorePedLocation["y"],oxyStorePedLocation["z"]))
		local oxyExit = #(GetEntityCoords(PlayerPedId()) - vector3(590.51, 2739.8, 15.86))
		local oxyEnter = #(GetEntityCoords(PlayerPedId()) - vector3(oxyStoreLocation["x"],oxyStoreLocation["y"],oxyStoreLocation["z"]))

		if oxyExit < 2 then
			DrawText3Ds(590.51, 2739.8, 15.86, "[E] to Leave") 
			if IsControlJustReleased(0,38) then
				SetEntityCoords(PlayerPedId(),oxyStoreLocation["x"],oxyStoreLocation["y"],oxyStoreLocation["z"])
				Citizen.Wait(1000)
			end
		end

		if oxyEnter < 2 then
			DrawText3Ds(oxyStoreLocation["x"],oxyStoreLocation["y"],oxyStoreLocation["z"], "[E] to Enter") 
			if IsControlJustReleased(0,38) then
				TriggerServerEvent('oxydelivery:builddrugstore')
				TriggerServerEvent('oxydelivery:CreateDrugStorePed')
				Citizen.Wait(1000)
			end
		end		

		if oxyCheckin < 2 and cooldown == false then
			DrawText3Ds(oxyStorePedLocation["x"], oxyStorePedLocation["y"], oxyStorePedLocation["z"], "[E] $1500 - Oxy Delivery Job") 
			if IsControlJustReleased(0,38) then
				TriggerServerEvent("oxydelivery:server",1500)
				cooldown = true
				Citizen.Wait(1000)
			end
		end
		
		if cooldown and oxyCheckin < 2 then
			if IsControlJustReleased(0,38) then
				TriggerEvent("DoLongHudText", "I dont have any work for you right now.", 2)
			end
    	end
	end
end)

Citizen.CreateThread(function()

    while true do
		Citizen.Wait(2000)
		if cooldown then
			if (not DoesEntityExist(oxyVehicle) or GetVehicleEngineHealth(oxyVehicle) < 100.0) and vehspawn then
				tasking = false
				TriggerEvent("chatMessage", "EMAIL - Drug Deliveries", 8, "Dude! You fucked the car up, I canceled your run, asshole! ")
				Citizen.Wait(1200000)
				cooldown = false
			else
				if tasking then
					Citizen.Wait(30000)
				else
					TriggerEvent("oxydelivery:client")  
					salecount = salecount + 1
					if salecount == 6 then
						TriggerEvent("chatMessage", "EMAIL - Oxy Deliveries", 8, "You are no longer selling oxy.")
						Citizen.Wait(1200000) -- 20 minutes
						cooldown = false
					end
				end			
			end	
		end
    end
end)


RegisterNetEvent("oxydelivery:startDealing")
AddEventHandler("oxydelivery:startDealing", function()
	local NearNPC = exports["isPed"]:GetClosestNPC()
	PlayAmbientSpeech1(NearNPC, "Chat_Resp", "SPEECH_PARAMS_FORCE", 1)
	TriggerEvent("DoLongHudText","Your pager will be updated with locations soon.")
	TriggerEvent("player:receiveItem", "darkmarketdeliveries", 1)

	salecount = 0	
	vehspawn = false
	CreateOxyVehicle()
	vehspawn = true	
end)
