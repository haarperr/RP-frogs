local tasking = false
local mygang = "local"
local watching = "local"
local watchinglist = {}
local drugStorePed = 0
local cashPayment = 420
local vehspawn = false
local myGangReputation = {
    ["mexican"] = 200,
    ["salva"] = 200,
    ["weicheng"] = 200,   
    ["family"] = 200,
    ["ballas"] = 200,
    ["robbery"] = 200,           
}
local oxyVehicle = 0
local PlayerData = {}
local display = false
local display1 = false
local setting = false
talking = false
cooking = false
local setted = false
good = false
Answering = false
check = false
selling = false
onGround = false

local lunchtime = false

RegisterNetEvent('lunchtime')
AddEventHandler('lunchtime', function(pass)
	lunchtime = pass
end)



local dropoffpoints = {
	[1] =  { ['x'] = 483.17,['y'] = -1827.35,['z'] = 27.86,['h'] = 135.87, ['info'] = ' East Side 1' },
	[2] =  { ['x'] = 475.87,['y'] = -1798.45,['z'] = 28.49,['h'] = 229.85, ['info'] = ' East Side 2' },
	[3] =  { ['x'] = 503.54,['y'] = -1765.06,['z'] = 28.51,['h'] = 67.61, ['info'] = ' East Side 3' },
	[4] =  { ['x'] = 512.0,['y'] = -1842.13,['z'] = 27.9,['h'] = 138.1, ['info'] = ' East Side 4' },
	[5] =  { ['x'] = 466.89,['y'] = -1852.81,['z'] = 27.72,['h'] = 310.97, ['info'] = ' East Side 5' },
	[6] =  { ['x'] = 431.33,['y'] = -1882.85,['z'] = 26.85,['h'] = 39.7, ['info'] = ' East Side 6' },
	[7] =  { ['x'] = 410.64,['y'] = -1908.57,['z'] = 25.46,['h'] = 80.03, ['info'] = ' East Side 7' },
	[8] =  { ['x'] = 192.93,['y'] = -2027.95,['z'] = 18.29,['h'] = 251.25, ['info'] = ' East Side 8' },
	[9] =  { ['x'] = 184.05,['y'] = -2004.77,['z'] = 18.31,['h'] = 49.81, ['info'] = ' East Side 9' },
	[10] =  { ['x'] = 212.4,['y'] = -1971.66,['z'] = 20.31,['h'] = 63.83, ['info'] = ' East Side 10' },
	[11] =  { ['x'] = 266.85,['y'] = -1964.41,['z'] = 23.0,['h'] = 49.59, ['info'] = ' East Side 11' },
	[12] =  { ['x'] = 313.05,['y'] = -1918.57,['z'] = 25.65,['h'] = 315.88, ['info'] = ' East Side 12' },
	[13] =  { ['x'] = 282.63,['y'] = -1948.96,['z'] = 24.39,['h'] = 40.21, ['info'] = ' East Side 13' },
	[14] =  { ['x'] = 250.44,['y'] = -1995.9,['z'] = 20.32,['h'] = 324.5, ['info'] = ' East Side 14' },
	[15] =  { ['x'] = 270.54,['y'] = -1706.13,['z'] = 29.31,['h'] = 46.82, ['info'] = ' Central 1' },
	[16] =  { ['x'] = 167.78,['y'] = -1635.0,['z'] = 29.3,['h'] = 22.04, ['info'] = ' Central 2' },

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
}

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

}


local drugLocs = {
	[1] =  { ['x'] = 131.94,['y'] = -1937.95,['z'] = 20.61,['h'] = 118.59, ['info'] = ' Grove Stash' },
	[2] =  { ['x'] = 1390.84,['y'] = -1507.94,['z'] = 58.44,['h'] = 29.6, ['info'] = ' East Side' },
	[3] =  { ['x'] = -676.81,['y'] = -877.94,['z'] = 24.48,['h'] = 324.9, ['info'] = ' Wei Cheng' },
}

local pillStore =  { ['x'] = 591.26,['y'] = 2744.11,['z'] = 42.05,['h'] = 5.53, ['info'] = ' oxy' }

local pillWorker = { ['x'] = 590.89,['y'] = 2747.82,['z'] = 15.86,['h'] = 177.65, ['info'] = ' lol' }


function buildDrugShop()
	DoScreenFadeOut(1)
	
	Citizen.Wait(1000)

	local generator = { x = pillStore["x"] , y = pillStore["y"], z = pillStore["z"] - 35.0}
  	SetEntityCoords(PlayerPedId(),generator.x,generator.y,generator.z+2)
  	
	local building = CreateObject(`traphouse_shell`,generator.x-0.31811000,generator.y+1.79183500,generator.z+2.56171400,false,false,false)
	FreezeEntityPosition(building, true)
	local coordsofbuilding = GetEntityCoords(building, true)
	CreateObject(`V_38_C_Barbers_Det`,coordsofbuilding.x+0.36036100,coordsofbuilding.y-0.35528500,coordsofbuilding.z+1.54137200,false,false,false)
	CreateObject(`V_38_C_CABINET02`,coordsofbuilding.x+0.37338400,coordsofbuilding.y-3.67517500,coordsofbuilding.z+1.48056600,false,false,false)

	CreateObject(`V_38_FAN`,coordsofbuilding.x+0.18863910,coordsofbuilding.y-1.78123200,coordsofbuilding.z+1.49853700,false,false,false)
	CreateObject(`V_38_SHELVES`,coordsofbuilding.x+0.38722500,coordsofbuilding.y-0.21649000,coordsofbuilding.z+2.34309200,false,false,false)
	CreateObject(`V_38_Pictures`,coordsofbuilding.x+0.36021210,coordsofbuilding.y+0.34026300,coordsofbuilding.z+1.82029300,false,false,false)
	CreateObject(`V_38_LIGHTS`,coordsofbuilding.x+0.95295510,coordsofbuilding.y-0.34358800,coordsofbuilding.z+4.50438800,false,false,false)

	local plant = CreateObject(`V_38_BARB_PLANT02`,coordsofbuilding.x+3.01122600,coordsofbuilding.y-4.98704700,coordsofbuilding.z+2.91572800,false,false,false)
	SetEntityRotation(plant,0.0,0.0,170.0,2,1)

	local chair1 = CreateObject(`Prop_chair_01b`,coordsofbuilding.x+2.92626000,coordsofbuilding.y+0.70815100,coordsofbuilding.z+1.54303900,false,false,false)
	local chair2 = CreateObject(`prop_chair_04a`,coordsofbuilding.x+2.92626000,coordsofbuilding.y+2.21829500,coordsofbuilding.z+1.54303900,false,false,false)
	local chair3 = CreateObject(`prop_chair_02`,coordsofbuilding.x+2.92626000,coordsofbuilding.y+1.44866100,coordsofbuilding.z+1.54303900,false,false,false)
	local chair4 = CreateObject(`prop_chair_02`,coordsofbuilding.x+2.92626000,coordsofbuilding.y+0.00554299,coordsofbuilding.z+1.54303900,false,false,false)

	SetEntityRotation(chair1,0.0,0.0,-90.0,2,1)
	SetEntityRotation(chair2,0.0,0.0,-80.0,2,1)
	SetEntityRotation(chair3,0.0,0.0,-85.0,2,1)
	SetEntityRotation(chair4,0.0,0.0,-95.0,2,1)

	CreateObject(`prop_tv_05`,coordsofbuilding.x+2.97058500,coordsofbuilding.y+4.72485000,coordsofbuilding.z+3.96126500,false,false,false)
	local tv = CreateObject(`prop_tv_05`,coordsofbuilding.x-2.20064500,coordsofbuilding.y-4.56200100,coordsofbuilding.z+3.96016800,false,false,false)
	SetEntityRotation(tv,0.0,0.0,190.0,2,1)

	local til = CreateObject(`prop_till_01`,coordsofbuilding.x-2.18592300,coordsofbuilding.y-1.87080100,coordsofbuilding.z+2.51398500,false,false,false)
	SetEntityRotation(til,0.0,0.0,180.0,2,1)
	CreateObject(`v_ret_gc_fan`,coordsofbuilding.x+2.94997000,coordsofbuilding.y+3.27074200,coordsofbuilding.z+1.49715400,false,false,false)

	CreateObject(`prop_cctv_cam_06a`,coordsofbuilding.x-2.35117100,coordsofbuilding.y+4.86646700,coordsofbuilding.z+4.18179800,false,false,false)
	CreateObject(`prop_game_clock_01`,coordsofbuilding.x-0.54486800,coordsofbuilding.y+5.01194300,coordsofbuilding.z+3.67846000,false,false,false)
	CreateObject(`prop_radio_01`,coordsofbuilding.x+3.07343200,coordsofbuilding.y+3.16888200,coordsofbuilding.z+3.37168900,false,false,false)

	CreateObject(`prop_speaker_05`,coordsofbuilding.x-2.40189600,coordsofbuilding.y+0.54597100,coordsofbuilding.z+3.89755000,false,false,false)
	CreateObject(`prop_speaker_05`,coordsofbuilding.x-2.40189600,coordsofbuilding.y+3.19824400,coordsofbuilding.z+3.16581200,false,false,false)
	CreateObject(`prop_rub_stool`,coordsofbuilding.x-2.20233000,coordsofbuilding.y+4.06275700,coordsofbuilding.z+1.52316500,false,false,false)
	CreateObject(`prop_watercooler`,coordsofbuilding.x-2.26554100,coordsofbuilding.y+2.82748200,coordsofbuilding.z+1.41562700,false,false,false)
	CreateObject(`V_38_C_SHADOWMAP`,coordsofbuilding.x-0.31811000,coordsofbuilding.y+1.79183500,coordsofbuilding.z+1.54171400,false,false,false)


	CreateObject(`V_38_BARB_PLANT003`,coordsofbuilding.x-2.30056400,coordsofbuilding.y+1.66849900,coordsofbuilding.z+2.38898200,false,false,false)
	CreateObject(`V_38_C_Pictures3`,coordsofbuilding.x+3.20509200,coordsofbuilding.y-0.40208200,coordsofbuilding.z+1.91242400,false,false,false)
	CreateObject(`V_38_C_Sink`,coordsofbuilding.x-0.62845000,coordsofbuilding.y+4.84067900,coordsofbuilding.z+1.41538000,false,false,false)

	FreezeEntityPosition(coordsofbuilding,true)
	Citizen.Wait(500)
	SetEntityCoords(PlayerPedId(), 592.26, 2745.01, 15.22)
	Citizen.Wait(500)
	
	SetEntityHeading(PlayerPedId(),0.0)
	FreezeEntityPosition(PlayerPedId(),false)
	DoScreenFadeIn(1)
end

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
local gangTaskArea = "local"

function GroupSelect(number)
	if number == 1 then
		gangTaskArea = "mexican"
	elseif number == 2 then
		gangTaskArea = "salva"
	elseif number == 3 then
		gangTaskArea = "weicheng"
	elseif number == 4 then
		gangTaskArea = "family"
	elseif number == 5 then
		gangTaskArea = "ballas"
	end
end

local eastpedtypes = {
	'g_m_y_mexgang_01',
	'g_m_y_mexgoon_01',
	'g_m_y_mexgoon_02',
	'g_m_y_mexgoon_03',
}

local centpedtypes = {
	'g_m_y_ballaeast_01',
	'g_m_y_ballaorig_01',
	'g_m_y_famca_01',
	'g_m_y_famdnf_01',
	'g_m_y_famfor_01',
}

local westpedtypes = {
	'g_m_y_korean_01',
	'g_m_y_korean_02',
	'g_m_m_chiboss_01',
	'g_m_m_chicold_01',
	'g_m_m_chigoon_01',
	'g_m_m_chigoon_02',
	'g_m_m_korboss_01',
}

local oxyPeds = {
	'a_m_y_stwhi_02',
	'a_m_y_stwhi_01'
}

function CreateDrugStorePed()
	
	if DoesEntityExist(drugStorePed) then
		return
	end
	local hashKey = `a_m_y_stwhi_02`
	local pedType = GetPedType(hashKey)
    RequestModel(hashKey)
    while not HasModelLoaded(hashKey) do
        RequestModel(hashKey)
        Citizen.Wait(100)
    end
	ped = CreatePed(pedType, hashKey, pillWorker["x"],pillWorker["y"],pillWorker["z"], 270.0, 1, 1)
	SetEntityHeading(ped, 180.24)
	DecorSetBool(ped, 'ScriptedPed', true)
    ClearPedTasks(ped)
    ClearPedSecondaryTask(ped)
    TaskSetBlockingOfNonTemporaryEvents(ped, true)
    SetPedFleeAttributes(ped, 0, 0)
    SetPedCombatAttributes(ped, 17, 1)
	FreezeEntityPosition(ped, true)
	SetEntityInvincible(ped, true)
	SetEntityAsMissionEntity(ped, true, true)
    SetPedSeeingRange(ped, 0.0)
    SetPedHearingRange(ped, 0.0)
    SetPedAlertness(ped, 0)
    SetPedKeepTask(ped, true)

	drugStorePed = ped
end

local carpick = {
    [1] = "felon",
    [2] = "kuruma",
    [3] = "sultan",
    [4] = "granger",
    [5] = "tailgater",
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
	SetVehicleIsStolen(vehioxyVehiclecle, false)
	SetVehicleIsWanted(oxyVehicle, true)
	SetVehRadioStation(oxyVehicle, 'OFF')
	TriggerEvent("keys:received",plt)


    while true do
    	Citizen.Wait(1)
		DrawText3Ds(carspawns[spawnpoint]["x"], carspawns[spawnpoint]["y"], carspawns[spawnpoint]["z"], "Your Delivery Car (Stolen).")
		if #(GetEntityCoords(PlayerPedId()) - vector3(carspawns[spawnpoint]["x"], carspawns[spawnpoint]["y"], carspawns[spawnpoint]["z"])) < 8.0 then
		return
		end
    end

end

function CreateOxyPed()

    local hashKey = `a_m_y_stwhi_01`

    local pedType = 5

    RequestModel(hashKey)
    while not HasModelLoaded(hashKey) do
        RequestModel(hashKey)
        Citizen.Wait(100)
    end


	deliveryPed = CreatePed(pedType, hashKey, OxyDropOffs[rnd]["x"],OxyDropOffs[rnd]["y"],OxyDropOffs[rnd]["z"], OxyDropOffs[rnd]["h"], 0, 0)
	
	DecorSetBool(deliveryPed, 'ScriptedPed', true)
    ClearPedTasks(deliveryPed)
    ClearPedSecondaryTask(deliveryPed)
    TaskSetBlockingOfNonTemporaryEvents(deliveryPed, true)
    SetPedFleeAttributes(deliveryPed, 0, 0)
    SetPedCombatAttributes(deliveryPed, 17, 1)

    SetPedSeeingRange(deliveryPed, 0.0)
    SetPedHearingRange(deliveryPed, 0.0)
    SetPedAlertness(deliveryPed, 0)
    searchPockets()
    SetPedKeepTask(deliveryPed, true)

end



function CreateDrugPed()
	

    local hashKey = `g_m_y_salvagoon_01`

    local pedType = 5

    RequestModel(hashKey)
    while not HasModelLoaded(hashKey) do
        RequestModel(hashKey)
			
        Citizen.Wait(100)
    end


	deliveryPed = CreatePed(pedType, hashKey, dropoffpoints[rnd]["x"],dropoffpoints[rnd]["y"],dropoffpoints[rnd]["z"], dropoffpoints[rnd]["h"], 1, 1)
	DecorSetBool(deliveryPed, 'ScriptedPed', true)
    ClearPedTasks(deliveryPed)
    ClearPedSecondaryTask(deliveryPed)
    TaskSetBlockingOfNonTemporaryEvents(deliveryPed, true)
    SetPedFleeAttributes(deliveryPed, 0, 0)
    SetPedCombatAttributes(deliveryPed, 17, 1)
	FreezeEntityPosition(deliveryPed, true)
    SetPedSeeingRange(deliveryPed, 0.0)
    SetPedHearingRange(deliveryPed, 0.0)
    SetPedAlertness(deliveryPed, 0)
    searchPockets()
    SetPedKeepTask(deliveryPed, true)
end

function DeleteCreatedPed()
	if DoesEntityExist(deliveryPed) then 
		FreezeEntityPosition(deliveryPed, false)
		SetPedKeepTask(deliveryPed, false)
		TaskSetBlockingOfNonTemporaryEvents(deliveryPed, false)
		ClearPedTasks(deliveryPed)
		TaskWanderStandard(deliveryPed, 10.0, 10)
		SetPedAsNoLongerNeeded(deliveryPed)
		DecorSetBool(deliveryPed, 'ScriptedPed', false)

		Citizen.Wait(20000)
		DeletePed(deliveryPed)
	end
end

function DeleteBlip()
	if DoesBlipExist(blip) then
		RemoveBlip(blip)
	end
end

function CreateBlip()
	DeleteBlip()
	
	if OxyRun then
		blip = AddBlipForCoord(OxyDropOffs[rnd]["x"],OxyDropOffs[rnd]["y"],OxyDropOffs[rnd]["z"])
	else
		blip = AddBlipForCoord(dropoffpoints[rnd]["x"],dropoffpoints[rnd]["y"],dropoffpoints[rnd]["z"])
	end
    
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

local stolenGoodsTable = {
	[84] = "rolexwatch",
	[85] = "stolen2ctchain",
	[86] = "stolen5ctchain",
	[87] = "stolen8ctchain",
	[88] = "stolengameboy",
	[89] = "stolenoakleys",
	[90] = "stolenpsp",

}

function HasStolenGoods()
	if OxyRun then
		
		TriggerEvent("attachitem","cashcase01")
		return true
	else
		for i = 84, 90 do
			local itemcount = exports["drp-inventory"]:hasEnoughOfItem(stolenGoodsTable[i],1,false)
			if itemcount then
				TriggerEvent("inventory:removeItem",stolenGoodsTable[i], 1)
				TriggerEvent("attachitem","cashcase01")
				return true
			end
		end
	end
	return false
end

local bandprice = 80
local rollcashprice = 40
local inkedmoneybagprice = 20000
local markedbillsprice = 500

function DoDropOff(requestMoney)

	cashPayment = 250 + math.random(350)
	local success = true

	searchPockets()

	Wait(1500)

	PlayAmbientSpeech1(deliveryPed, "Chat_State", "Speech_Params_Force")

	if DoesEntityExist(deliveryPed) and not IsEntityDead(deliveryPed) then

		if HasStolenGoods() then

			if math.random(10) == 1 then
				TriggerEvent( "player:receiveItem", "safecrackingkit", 1 )
			end
			
			if math.random(49) == 49 then
				TriggerEvent( "player:receiveItem", "heistusb4", 1 )
			end

			if OxyRun then

				cashPayment = math.random(150,550)
				
				takingList = {["inkedmoneybag", 1, inkedmoneybagprice], ["rollcash", math.random(3,10), rollcashprice], ["markedbills", math.random(3,10), markedbillsprice], ["band", math.random(3,10), bandprice]}
				yesno = false
				while yesno == false do
					rnd = math.random(1, table.getn(takingList))
					
					TriggerEvent("DoLongHudText",rnd)

					if exports["drp-inventory"]:hasEnoughOfItem(takingList[rnd][1], takingList[rnd][2], false) then	
						TriggerServerEvent('mission:completed', takingList[rnd][3] * takingList[rnd][2])
						TriggerEvent("DoLongHudText","Thanks for the extra sauce!")
						yesno = true
					end
				end

				if yesno == false then
		            TriggerEvent("DoLongHudText","Thanks, no extra sauce though?!")
				end

				if math.random(100) > 45 then
					TriggerEvent( "player:receiveItem", "oxy", math.random(5) )
				end

				
				if math.random(100) >= 7 then
					cashPayment = math.random(250,1000)
				end

				
				if math.random(100) >= 1 then
					cashPayment = math.random(1000,1500)
				end
				
				if math.random(1000) >= 1 then
					cashPayment = math.random(10000,15000)
				end

			else

				cashPayment = math.random(200,580)

			end
			
		else

			if not OxyRun then
				TriggerEvent("DoLongHudText","The drop off failed - you need stolen items.",2)
			else
				TriggerEvent("DoLongHudText","The drop off failed - you need Oxy.",2)
			end
			
			success = false
			return

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
		if math.random(7) == 5 then
		

		-- ADD PD PING ON CHANCE / GAINING STRESS ON SALE

	else
		--TriggerEvent("DoLongHudText","The drop off failed.",2)
	end
	
	DeleteBlip()
	if success then
		Citizen.Wait(2000)
		TriggerEvent("DoLongHudText", "I got the call in, delivery was on point, go await the next one! ",1)
	else
		TriggerEvent("DoLongHudText","The drop off failed - you need stolen items.",2)
	end

	DeleteCreatedPed()
end
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
    end

    fighting = 0
end

function DropItemPed(ai)
    local ai = ai
    local chance = math.random(50)
    if chance > 41 then
        DropDrugs(ai,true)
    elseif chance > 35 then
        DropDrugs(ai,false)
    end
    TriggerServerEvent('mission:completed', cashPayment)
end

function DropDrugs(ai,highvalue)
    local highvalue = highvalue
    local pos = GetEntityCoords(PlayerPedId())
    if highvalue then
	--	TriggerEvent("inv:CreatedropItem",90,math.random(4))
	else
	--	TriggerEvent("inv:CreatedropItem",85,1)
	end
end

function SearchPockets(ai)
    local timer = 3000
    local ai = ai
    local searching = false
    
    while timer > 0 do
        timer = timer - 1
        local pos = GetEntityCoords(ai)
        Citizen.Wait(1)

        if not searching then
            DrawText3Ds(pos["x"], pos["y"],pos["z"], "Press E to search person.")
            if IsControlJustReleased(1,38) and #(pos - GetEntityCoords(PlayerPedId())) < 3.0 then
                searching = true
                TriggerEvent("animation:PlayAnimation","search")
                local finished = exports["drp-taskbar"]:taskBar(15000,"Searching Thug")

                if tonumber(finished) == 100 then
                    DropItemPed(ai)
                end
                ClearPedTasks(PlayerPedId())
                timer = 0
            end
        end
    end
    searching = false
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

RegisterNetEvent('gangs:updateMyReputations')
AddEventHandler('gangs:updateMyReputations', function(mexican,salva,weicheng,family,ballas,robbery)
    myGangReputation["mexican"] = mexican
    myGangReputation["salva"] = salva
    myGangReputation["weicheng"] = weicheng
    myGangReputation["family"] = family
    myGangReputation["ballas"] = ballas
    myGangReputation["robbery"] = robbery

end)

RegisterNetEvent("gang:updateClientReputation")
AddEventHandler("gang:updateClientReputation", function(mexican,salva,weicheng,family,ballas,robbery)
    myGangReputation["mexican"] = mexican
    myGangReputation["salva"] = salva
    myGangReputation["weicheng"] = weicheng
    myGangReputation["family"] = family
    myGangReputation["ballas"] = ballas
    myGangReputation["robbery"] = robbery

end)

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
			DeleteCreatedPed()
			CreateOxyPed()
			TriggerEvent("DoLongHudText","You are close to the drop off.")
		end
		if toolong < 0 then

		    SetVehicleHasBeenOwnedByPlayer(oxyVehicle,false)
			SetEntityAsNoLongerNeeded(oxyVehicle)
			tasking = false
			OxyRun = false
			TriggerEvent("chatMessage", "EMAIL - Oxy Deliveries", 8, "You are no longer selling oxy.")
		end
		if dstcheck < 2.0 and pedCreated then

			local crds = GetEntityCoords(deliveryPed)
			DrawText3Ds(crds["x"],crds["y"],crds["z"], "[E]")  

			if IsControlJustReleased(0,38) then
				local pdping = math.random(15,100)
				if pdping <= 15 then
					TriggerEvent("drp-dispatch:oxyping")
				end
				TaskTurnPedToFaceEntity(deliveryPed, PlayerPedId(), 1.0)
				local finished = exports["drp-taskbar"]:taskBar(22500,"Dropping Off")
				if finished == 100 then	
					PlayAmbientSpeech1(deliveryPed, "Generic_Hi", "Speech_Params_Force")
					DoDropOff()
				end
				
				tasking = false
			end

		end

	end
	

	DeleteCreatedPed()
	DeleteBlip()

end)

RegisterNetEvent("drugdelivery:client")
AddEventHandler("drugdelivery:client", function()

	if tasking then
		return
	end

	if mygang == "mexican" then
		rnd = math.random(1,14)
	elseif mygang == "ballas" then
		rnd = math.random(15,28)
	elseif mygang == "weicheng" then
		rnd = math.random(29,42)
	end

	CreateBlip()

	local pedCreated = false

	tasking = true
	local timer = 120000
	while tasking and timer > 0 do
		timer = timer - 1
		Citizen.Wait(1)
		local plycoords = GetEntityCoords(PlayerPedId())
		local dstcheck = #(plycoords - vector3(dropoffpoints[rnd]["x"],dropoffpoints[rnd]["y"],dropoffpoints[rnd]["z"])) 
		if dstcheck <= 40.0 and not pedCreated then
			pedCreated = true
			DeleteCreatedPed()
			CreateDrugPed()
			TriggerEvent("DoLongHudText","You are close to the drop off.")
		end

		if dstcheck < 2.0 and pedCreated then

			local crds = GetEntityCoords(deliveryPed)
			DrawText3Ds(crds["x"],crds["y"],crds["z"], "[E]")  

			if IsControlJustReleased(0,38) then
				local pdping = math.random(15,100)
				if pdping <= 15 then
					TriggerEvent("drp-dispatch:oxyping") -- todo maybe add drugs extra but idk should be the same
				end
				TaskTurnPedToFaceEntity(deliveryPed, PlayerPedId(), 1.0)
				local finished = exports["drp-taskbar"]:taskBar(22500,"Dropping Off")
    			if finished == 100 then	
					PlayAmbientSpeech1(deliveryPed, "Generic_Hi", "Speech_Params_Force")
					DoDropOff()
					tasking = false
				end
			end

		end

	end
	
	tasking = false
	DeleteCreatedPed()
	DeleteBlip()

end)

local drugdealer = false
local salecount = 0

local drugLocs = {
	[1] =  { ['x'] = 182.56,['y'] = -1319.25,['z'] = 29.32,['h'] = 236.06, ['info'] = ' Central', ["gang"] = "ballas", ["ent"] = 0 },
}

local areaLocs = {
	[1] =  { ['x'] = 228.36,['y'] = -1762.18,['z'] = 28.7,['h'] = 37.01, ['info'] = 1 },
	[2] =  { ['x'] = 449.71,['y'] = -1760.62,['z'] = 28.99,['h'] = 337.34, ['info'] = 2 },
	[3] =  { ['x'] = -719.0,['y'] = -897.81,['z'] = 20.43,['h'] = 270.27, ['info'] = 3 },
}

local HasProduct = {
	["mexican"] = true,
	["ballas"] = true,
	["weicheng"] = true,
}

local chopinfo = {

	[1] =  { ['x'] = 2341.1,['y'] = 3052.2, ['z'] = 48.15, ['h'] = 359.2, ['info'] = ' Chop Entry Point' },
	[2] =  { ['x'] = 2341.1,['y'] = 3052.2, ['z'] = 48.15,['h'] = 309.96, ['info'] = ' Craft' },
	[3] =  { ['x'] = 115.34,['y'] = 164.33,['z'] = 104.52,['h'] = 71.96, ['info'] = ' outside entrance' },
	[4] =  { ['x'] = 100.17,['y'] = 169.15,['z'] = 104.54,['h'] = 253.79, ['info'] = ' 1' },
	[5] =  { ['x'] = 126.96,['y'] = 159.32,['z'] = 104.51,['h'] = 249.47, ['info'] = ' 2' },
	[6] =  { ['x'] = 144.16,['y'] = 165.17,['z'] = 104.75,['h'] = 341.08, ['info'] = ' 3' },
	[7] =  { ['x'] = 147.77,['y'] = 175.11,['z'] = 105.1,['h'] = 339.32, ['info'] = ' 4' },

}


function IsDroppable()
	playerped = PlayerPedId()
	coordA = GetEntityCoords(playerped, 1)
	coordB = GetOffsetFromEntityInWorldCoords(playerped, 0.0, 100.0, 0.0)
	veh = getVehicleInDirection(coordA, coordB)
	return veh
end

function getVehicleInDirection(coordFrom, coordTo)
	local offset = 0
	local rayHandle
	local vehicle
	for i = 0, 100 do
		rayHandle = CastRayPointToPoint(coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z + offset, 10, PlayerPedId(), 0)	
		a, b, c, d, vehicle = GetRaycastResult(rayHandle)
		offset = offset - 1
		if vehicle ~= 0 then break end
	end
	local distance = Vdist2(coordFrom, GetEntityCoords(vehicle))
	if distance > 25 then vehicle = nil end
    return vehicle ~= nil and vehicle or 0
end

local vehicleList = {
	{ ["name"] = "Sultan", ["modelname"] = "sultan" },
	{ ["name"] = "Ingot", ["modelname"] = "INGOT" },
	{ ["name"] = "Surge", ["modelname"] = "SURGE" },
	{ ["name"] = "Issi", ["modelname"] = "ISSI2" },
	{ ["name"] = "Gresley", ["modelname"] = "GRESLEY" },
	{ ["name"] = "Pigalle", ["modelname"] = "PIGALLE" },
	{ ["name"] = "Sabre Turbo", ["modelname"] = "SABREGT" },
	{ ["name"] = "Landstalker", ["modelname"] = "Landstalker" },
	{ ["name"] = "Panto", ["modelname"] = "PANTO" },
	{ ["name"] = "Super Diamond", ["modelname"] = "superd" },
	{ ["name"] = "Massacro", ["modelname"] = "MASSACRO" },
	{ ["name"] = "Schafter", ["modelname"] = "schafter2" },
	{ ["name"] = "Bullet", ["modelname"] = "BULLET" },
	{ ["name"] = "Ruiner", ["modelname"] = "RUINER" },
	{ ["name"] = "Prairie", ["modelname"] = "PRAIRIE" },
	{ ["name"] = "Voltic", ["modelname"] = "VOLTIC" },
	{ ["name"] = "Sentinel", ["modelname"] = "SENTINEL2" },
	{ ["name"] = "Intruder", ["modelname"] = "INTRUDER" },
	{ ["name"] = "Seminole", ["modelname"] = "SEMINOLE" },
	{ ["name"] = "Felon GT", ["modelname"] = "FELON2" },
	{ ["name"] = "Emperor", ["modelname"] = "EMPEROR" },
	{ ["name"] = "Manana", ["modelname"] = "MANANA" },
	{ ["name"] = "Coquette", ["modelname"] = "COQUETTE" },
	{ ["name"] = "9F Cabrio", ["modelname"] = "NINEF2" },
	{ ["name"] = "Cavalcade", ["modelname"] = "Cavalcade" },
	{ ["name"] = "Comet", ["modelname"] = "Comet2" },
	{ ["name"] = "Rapid GT", ["modelname"] = "rapidgt" },
	{ ["name"] = "Blista Compact", ["modelname"] = "blista2" },
	{ ["name"] = "Mesa", ["modelname"] = "Mesa" },
	{ ["name"] = "Banshee", ["modelname"] = "Banshee" },
	{ ["name"] = "Carbonizzare", ["modelname"] = "carbonizzare" },
	{ ["name"] = "Peyote", ["modelname"] = "Peyote" },
	{ ["name"] = "BeeJay XL", ["modelname"] = "BJXL" },
	{ ["name"] = "Dilettante", ["modelname"] = "Dilettante" },
	{ ["name"] = "Tornado", ["modelname"] = "Tornado" },
	{ ["name"] = "Rocoto", ["modelname"] = "Rocoto" },
	{ ["name"] = "Zion", ["modelname"] = "Zion" },
	{ ["name"] = "Furore", ["modelname"] = "FuroreGT" },
	{ ["name"] = "Buffalo", ["modelname"] = "Buffalo" },
	{ ["name"] = "F620", ["modelname"] = "F620" },
	{ ["name"] = "Asea", ["modelname"] = "Asea" },
	{ ["name"] = "Feltzer", ["modelname"] = "feltzer2" },
	{ ["name"] = "Dubsta", ["modelname"] = "Dubsta" },
	{ ["name"] = "FQ2", ["modelname"] = "FQ2" },
	{ ["name"] = "Radius", ["modelname"] = "RADI" },
	{ ["name"] = "Stanier", ["modelname"] = "Stanier" },
	{ ["name"] = "Futo", ["modelname"] = "Futo" },
	{ ["name"] = "Vigero", ["modelname"] = "Vigero" },
	{ ["name"] = "Oracle", ["modelname"] = "oracle" },
	{ ["name"] = "Nine F", ["modelname"] = "ninef" },
	{ ["name"] = "Banshee", ["modelname"] = "banshee" },
	{ ["name"] = "Buffalo", ["modelname"] = "buffalo" },
	{ ["name"] = "Fusilade", ["modelname"] = "fusilade" },
	{ ["name"] = "Jester", ["modelname"] = "jester" },
	{ ["name"] = "Kuruma", ["modelname"] = "kuruma" },
	{ ["name"] = "Sultan", ["modelname"] = "sultan" },
	{ ["name"] = "Infernus", ["modelname"] = "infernus" },
	{ ["name"] = "Buccaneer", ["modelname"] = "buccaneer" },
	{ ["name"] = "Chino", ["modelname"] = "chino" },
	{ ["name"] = "Sanchez", ["modelname"] = "sanchez" },
	{ ["name"] = "Dominator", ["modelname"] = "dominator" },
	{ ["name"] = "Picador", ["modelname"] = "picador" },
	{ ["name"] = "Bifta", ["modelname"] = "bifta" },
	{ ["name"] = "Sandking", ["modelname"] = "sandking" },
	{ ["name"] = "Bison", ["modelname"] = "bison" },
	{ ["name"] = "Fugitive", ["modelname"] = "fugitive" },
	{ ["name"] = "Intruder", ["modelname"] = "intruder" },
	{ ["name"] = "Premier", ["modelname"] = "premier" },
	{ ["name"] = "Primo", ["modelname"] = "primo" },
	{ ["name"] = "Regina", ["modelname"] = "regina" },
	{ ["name"] = "Washington", ["modelname"] = "washington" },
	{ ["name"] = "Akuma", ["modelname"] = "AKUMA" },
	{ ["name"] = "Bagger", ["modelname"] = "bagger" },
	{ ["name"] = "Bati", ["modelname"] = "bati" },
	{ ["name"] = "Double", ["modelname"] = "double" },
	{ ["name"] = "Hexer", ["modelname"] = "hexer" },
	{ ["name"] = "Nemesis", ["modelname"] = "nemesis" },
	{ ["name"] = "BF 400", ["modelname"] = "bf400" },
	{ ["name"] = "Blade", ["modelname"] = "blade" },
	{ ["name"] = "Hot Rod Blazer", ["modelname"] = "blazer3" },
	{ ["name"] = "Street Blazer", ["modelname"] = "blazer4" },
	{ ["name"] = "Buccaneer Custom", ["modelname"] = "buccaneer2" },
	{ ["name"] = "Carbon RS", ["modelname"] = "carbonrs" },
	{ ["name"] = "Cheburek", ["modelname"] = "cheburek" },
	{ ["name"] = "Chino Custom", ["modelname"] = "chino2" },
	{ ["name"] = "Cliffhanger", ["modelname"] = "cliffhanger" },
	{ ["name"] = "Cognoscenti Cabrio", ["modelname"] = "cogcabrio" },
	--{ ["name"] = "", ["modelname"] = "comet4" },
	--{ ["name"] = "", ["modelname"] = "comet5" },
	{ ["name"] = "Defiler", ["modelname"] = "defiler" },
	{ ["name"] = "Diabolus", ["modelname"] = "diablous" },
	{ ["name"] = "Diabolus Custom", ["modelname"] = "diablous2" },
	{ ["name"] = "Ellie", ["modelname"] = "ellie" },
	{ ["name"] = "Enduro", ["modelname"] = "enduro" },
	{ ["name"] = "Esskey", ["modelname"] = "esskey" },
	{ ["name"] = "Faction", ["modelname"] = "faction" },
	{ ["name"] = "Faction Custom", ["modelname"] = "faction2" },
	{ ["name"] = "Fagaloa", ["modelname"] = "fagaloa" },
	{ ["name"] = "Faggio", ["modelname"] = "faggio" },
	{ ["name"] = "Furore GT", ["modelname"] = "furoregt" },
	{ ["name"] = "GB200", ["modelname"] = "gb200" },
	{ ["name"] = "Kamacho", ["modelname"] = "kamacho" },
	{ ["name"] = "Lynx", ["modelname"] = "lynx" },
	{ ["name"] = "Manchez", ["modelname"] = "manchez" },
	{ ["name"] = "Nightblade", ["modelname"] = "nightblade" },
	{ ["name"] = "Primo Custom", ["modelname"] = "primo2" },
	{ ["name"] = "Raiden", ["modelname"] = "raiden" },
	{ ["name"] = "Rapid GT Classic", ["modelname"] = "rapidgt3" },
	{ ["name"] = "Sadler", ["modelname"] = "sadler" },
	{ ["name"] = "Schafter LWB", ["modelname"] = "schafter4" },
	{ ["name"] = "Sentinel Classic", ["modelname"] = "sentinel3" },
	{ ["name"] = "Sovereign", ["modelname"] = "sovereign" },
	{ ["name"] = "Clown Van", ["modelname"] = "speedo2" },
	{ ["name"] = "Stryder", ["modelname"] = "stryder" },
	{ ["name"] = "Toros", ["modelname"] = "toros" },
	{ ["name"] = "Tropos Rallye", ["modelname"] = "tropos" },
	{ ["name"] = "Vindicator", ["modelname"] = "vindicator" },
	{ ["name"] = "Voodoo", ["modelname"] = "voodoo" },
	{ ["name"] = "Windsor", ["modelname"] = "windsor" },
	{ ["name"] = "Windsor Drop", ["modelname"] = "windsor2" }
}

function checkCars()
	for i = 1, #vehicleList do
		local hash = GetHashKey(vehicleList[i]["modelname"])
	end
end

local currentVehicleList = {}
local currentTimer = 60



RegisterNetEvent('chop:CurrentCarListRemove')
AddEventHandler('chop:CurrentCarListRemove', function(id)
	currentVehicleList[id]["resolved"] = true
	print(currentVehicleList[id]["resolved"])
end)

RegisterNetEvent('chop:CurrentCarList')
AddEventHandler('chop:CurrentCarList', function(newList, timer)
	currentVehicleList = newList
	currentTimer = timer
end)


local tradingTable = { 
	[1] = "plastic",
	[2] = "electronics",
	[3] = "plastic",
	[4] = "glass",
	[5] = "rubber",
	[6] = "copper",
	[7] = "aluminium",
	[8] = "steel"
}

RegisterNetEvent('payment:chopshopscrap')
AddEventHandler('payment:chopshopscrap', function(rarity,playsound)
	
	
	if playsound then
		-- if math.random(50) == 20 then
		-- 	TriggerEvent( "player:receiveItem", "Gruppe6Card3", 1 )
		-- end
		TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 2.0, 'impactdrill', 0.5)
	end
	local amount = rarity * 5
		TriggerEvent('player:receiveItem', tradingTable[math.random(#tradingTable)], amount)	
	if amount <= 50 then
		TriggerEvent('player:receiveItem', "recyclablematerial", math.random(7,20))
	else
		TriggerEvent('player:receiveItem', "recyclablematerial", math.random(10,50))
	end
	TriggerEvent("DoLongHudText","Picked up Scrap Items.",1)
end)


RegisterNetEvent('chopshoppub:leave')
AddEventHandler('chopshoppub:leave', function(plate)

	local veh = GetVehiclePedIsIn(PlayerPedId(), false)
	local myplate = GetVehicleNumberPlateText(veh)
	if plate == myplate then
		TaskLeaveVehicle(PlayerPedId(), veh, 0)
		Citizen.Wait(100)
		SetEntityCoords(PlayerPedId(),GetEntityCoords(PlayerPedId()))
	end

end)



function listedVehicle(veh)
	local answer = 0
	for i = 1, #currentVehicleList do 
		local modelID = currentVehicleList[i]["id"]
		if GetEntityModel(veh) == GetHashKey(vehicleList[modelID]["modelname"]) and not currentVehicleList[i]["resolved"] then
			answer = i
		end
	end
	return answer
end


local recentpix = false
function CompleteScrapping(vehicle, originalVehicleLocation)

	TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 2.0, 'impactdrill', 0.5)

	RequestAnimDict('mp_car_bomb')
	while not HasAnimDictLoaded("mp_car_bomb") do
		Citizen.Wait(0)
	end

	TaskPlayAnim(PlayerPedId(), "mp_car_bomb", "car_bomb_mechanic", 8.0, -8, -1, 49, 0, 0, 0, 0)

	local finished = exports["drp-taskbar"]:taskBar(20000,"Scrapping Car")
	local currentLocation = GetEntityCoords(vehicle)
	if finished == 100 then
	    local vehicleDifference = #(currentLocation - originalVehicleLocation)
		if not IsPedInVehicle(PlayerPedId(),vehicle,false) then
			if vehicleDifference <= 1 then
				local vehResponse = listedVehicle(veh)
				local plate = GetVehicleNumberPlateText(veh)
				TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 2.0, 'impactdrill', 0.5)
				TriggerServerEvent("chopshop:removevehicle",vehResponse,plate,50)
				Citizen.Wait(2500)
				TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 2.0, 'impactdrill', 0.5)
				SetEntityAsNoLongerNeeded(veh,true)
				DeleteEntity(veh)
			else
				TriggerEvent("DoLongHudText","Don't move your vehicle while we're trying to chop it, idiot.",2)
			end
		else
			TriggerEvent("DoLongHudText","You can't stay inside the vehicle while we're trying to chop it, idiot.",2)
		end
	end
end

--[[
RegisterNetEvent('resetpix')
AddEventHandler('resetpix', function()
	Wait(60000)
	recentpix = false
end)

RegisterNetEvent('payment:chopPixerium')
AddEventHandler('payment:chopPixerium', function()
	if not recentpix then
		--TriggerEvent("player:receiveItem","pix1",1)
		TriggerServerEvent('loot:useItem', 'chopchop2')
		recentpix = true
		TriggerEvent("resetpix")
	end
end)
]]

function CleanUpArea()
    local playerped = PlayerPedId()
    local plycoords = GetEntityCoords(playerped)
    local handle, ObjectFound = FindFirstObject()
    local success
    repeat
        local pos = GetEntityCoords(ObjectFound)
        local distance = #(plycoords - pos)
        if distance < 10.0 and ObjectFound ~= playerped then
        	if IsEntityAPed(ObjectFound) then
        		if IsPedAPlayer(ObjectFound) then
        		else
        			DeleteObject(ObjectFound)
        		end
        	else
        		if not IsEntityAVehicle(ObjectFound) and not IsEntityAttached(ObjectFound) then
	        		DeleteObject(ObjectFound)
	        	end
        	end            
        end
        success, ObjectFound = FindNextObject(handle)
    until not success

    SetEntityAsNoLongerNeeded(drugStorePed)
    DeleteEntity(drugStorePed)

    EndFindObject(handle)
end
function buyDrugs()
	TriggerEvent( "player:receiveItem", "oxy", 1)
end

local GoldBarTime = false

RegisterNetEvent('cracktime')
AddEventHandler('cracktime', function(sentinfo)
	GoldBarTime = sentinfo
end)

RegisterNetEvent('goldtrade')
AddEventHandler('goldtrade', function()
	if exports["drp-inventory"]:hasEnoughOfItem("goldbar",70,true) then
		TriggerEvent("inventory:removeItem", "goldbar", 70)
		TriggerServerEvent('mission:completed', 35000)
	end
end)


Citizen.CreateThread(function()

    while true do

	    Citizen.Wait(1)
	    local dropOff = #(vector3(GetEntityCoords(PlayerPedId())) - vector3(chopinfo[1]["x"],chopinfo[1]["y"],chopinfo[1]["z"]))

	    local dropOff2 = #(vector3(GetEntityCoords(PlayerPedId())) - vector3(chopinfo[2]["x"],chopinfo[2]["y"],chopinfo[2]["z"]))
	  --  local dropOff3 = #(vector3(GetEntityCoords(PlayerPedId())) - vector3(chopinfo[3]["x"],chopinfo[3]["y"],chopinfo[3]["z"]))
	    local dropOff4 = #(GetEntityCoords(PlayerPedId()) - vector3(590.51, 2739.8, 15.86))
	    local dropOff5 = #(GetEntityCoords(PlayerPedId()) - vector3(pillStore["x"],pillStore["y"],pillStore["z"]))
	    local dropOff6 = #(GetEntityCoords(PlayerPedId()) - vector3(pillWorker["x"],pillWorker["y"],pillWorker["z"]))

	    local GoldBars = #(GetEntityCoords(PlayerPedId()) - vector3(-112.58, 6468.93, 31.63))


		if GoldBars < 1.5 then

			if GoldBarTime then

				DrawText3Ds(-112.58, 6468.93, 31.63, "[E] to Exchange 70 Gold Bars for $35000 (5p)") 
								
				if IsControlJustReleased(0,38) then
					if exports["drp-inventory"]:hasEnoughOfItem("goldbar",70,true) then
						local finished = exports["drp-taskbar"]:taskBar(120000,"Trading Bars")
						if finished == 100 then
							TriggerEvent("pixerium:check",5,"goldtrade",false)
						end
					end
					Citizen.Wait(1000)
				end

			else

				DrawText3Ds(-112.58, 6468.93, 31.63, "We are currently not open") 

			end

		end

		if dropOff4 < 1.5 then
			DrawText3Ds(590.51, 2739.8, 15.86, "[E] to Leave") 
			if IsControlJustReleased(0,38) then
				CleanUpArea()
				SetEntityCoords(PlayerPedId(),pillStore["x"],pillStore["y"],pillStore["z"])
				Citizen.Wait(1000)
			end
		end
		if dropOff5 < 1.5 then
			DrawText3Ds(pillStore["x"],pillStore["y"],pillStore["z"], "[E] to Enter") 
			TriggerServerEvent("kGetWeather")
			if IsControlJustReleased(0,38) then
				buildDrugShop()
				
				CreateDrugStorePed()
			end
		end		

		if dropOff6 < 1.6 and not OxyRun then

			DrawText3Ds(pillWorker["x"],pillWorker["y"],pillWorker["z"], "[E] $1500 - Delivery Job (Payment Cash + Oxy)") 
			if IsControlJustReleased(0,38) then
				TriggerServerEvent("oxydelivery:server",1500)
				Citizen.Wait(1000)
			end


		end		


	    if dropOff2 < 20.0 then
	    	local isInVehicle = IsPedInAnyVehicle(PlayerPedId(), false)
	    	if not isInVehicle then
	    		local veh = IsDroppable()
	    		local vehResponse = listedVehicle(veh)
	    		if DoesEntityExist(veh) and vehResponse > 0 then
	    			local vehLoc = GetEntityCoords(veh)
	    			DrawText3Ds(vehLoc["x"],vehLoc["y"],vehLoc["z"], "[E] Drop Vehicle Off") 
    				if IsControlJustReleased(0,38) then
    					CompleteScrapping(veh, GetEntityCoords(veh))
					end
	    		else
	    			DrawText3Ds(chopinfo[2]["x"],chopinfo[2]["y"],chopinfo[2]["z"], "The Chop Shop") 
    				if IsControlJustReleased(0,38) then
    					if #currentVehicleList == 0 then
    						TriggerServerEvent("request:chopshop")
    						Citizen.Wait(2000)
						end
    					local message = "Required List:"
						for i = 1, #currentVehicleList do 
							if not currentVehicleList[i]["resolved"] then
								if currentVehicleList[i]["rarity"] > 10 then
     								if i == 1 then
    									message = message .. " " .. vehicleList[currentVehicleList[i]["id"]]["name"] .. " (priority)"
    								else
    									message = message .. " | " .. vehicleList[currentVehicleList[i]["id"]]["name"] .. " (priority)"
    								end
								else
    								if i == 1 then
    									message = message .. " " .. vehicleList[currentVehicleList[i]["id"]]["name"]
    								else
    									message = message .. " | " .. vehicleList[currentVehicleList[i]["id"]]["name"]
    								end
								end

								
							end
						end
						TriggerEvent("chatMessage", "EMAIL ", 8, message)
    				end
	    		end
	    	end
	    else

	    	if dropOff2 > 2.0 and dropOff4 > 2.0 and dropOff5 > 2.0 and dropOff6 > 2.0 and GoldBars > 2.0 then
		    	Citizen.Wait(1000)
		    end

	    end

	    for i = 1, #drugLocs do

	    	if DoesEntityExist( drugLocs[i]["ent"] ) then

				if IsEntityDead( drugLocs[i]["ent"] ) then

					SetEntityAsNoLongerNeeded(drugLocs[i]["ent"])

					DeleteEntity( drugLocs[i]["ent"] )

				end

			end

		end

    end

end)

local hoods = {
	[1] =  { ['x'] = -854.57,['y'] = -929.71,['z'] = 15.69,['h'] = 180.43, ['info'] = ' west side' },
	[2] =  { ['x'] = -17.4,['y'] = -1610.89,['z'] = 29.24,['h'] = 179.87, ['info'] = ' central' },
	[3] =  { ['x'] = 1139.68,['y'] = -1715.13,['z'] = 35.67,['h'] = 179.31, ['info'] = ' east side' },
}

RegisterCommand("choplist", function(source, args, rawCommand)
    TriggerEvent('chop:commandrequest')
end)

RegisterNetEvent('chop:commandrequest')
AddEventHandler('chop:commandrequest', function()
	if #currentVehicleList == 0 then
		TriggerServerEvent("request:chopshop")
		Citizen.Wait(2000)
	end
	local message = "Chop List: (" .. currentTimer .. " mins remaining) <br>"
	for i = 1, #currentVehicleList do 
		if not currentVehicleList[i]["resolved"] then
			if currentVehicleList[i]["rarity"] > 10 then
					if i == 1 then
					message = message .. " " .. vehicleList[currentVehicleList[i]["id"]]["name"] .. " (priority)"
				else
					message = message .. " | " .. vehicleList[currentVehicleList[i]["id"]]["name"] .. " (priority)"
				end
			else
				if i == 1 then
					message = message .. " " .. vehicleList[currentVehicleList[i]["id"]]["name"]
				else
					message = message .. " | " .. vehicleList[currentVehicleList[i]["id"]]["name"]
				end
			end

			
		end
	end
	TriggerEvent("chatMessage", "EMAIL ", 8, message)


end)

RegisterNetEvent('gangs:robloserep')
AddEventHandler('gangs:robloserep', function()
	
	local dstCheck = 450.0
	local groupid = 0
	for i=1,#hoods do
		local hoodDst = #(vector3(GetEntityCoords(PlayerPedId())) - vector3(hoods[i]["x"],hoods[i]["y"],hoods[i]["z"]))
		if hoodDst < dstCheck then
			groupid = i
			dstCheck = hoodDst
		end
	end

	if groupid ~= 0 then
		hood = "none"
		if groupid == 1 then
			hood = "weicheng"
		elseif groupid == 2 then
			hood = "ballas"
		elseif groupid == 3 then
			hood = "mexican"
		end
		TriggerEvent("loseGangReputationSpecific",hood)
	end

end)

--weicheng
--ballas
--mexican

local firstdeal = false
Citizen.CreateThread(function()

    while true do

        if drugdealer then

	        Citizen.Wait(1000)

	        if firstdeal then
	        	Citizen.Wait(10000)
	        end

	        TriggerEvent("drugdelivery:client")  

		    salecount = salecount + 1
		    if salecount == 7 then
		    	Citizen.Wait(1200000)
		    	drugdealer = false
		    end

		    Citizen.Wait(150000)
		    firstdeal = false

		elseif OxyRun then

			if (not DoesEntityExist(oxyVehicle) or GetVehicleEngineHealth(oxyVehicle) < 100.0) and vehspawn then
				tasking = false
				TriggerEvent("chatMessage", "EMAIL - Drug Deliveries", 8, "Dude! You fucked the car up, I canceled your run, asshole! ")
				Citizen.Wait(1200000)
				OxyRun = false
			else
				if tasking then
			        Citizen.Wait(30000)
			    else
			        TriggerEvent("oxydelivery:client")  
				    salecount = salecount + 1
				    if salecount == 6 then
						TriggerEvent("chatMessage", "EMAIL - Oxy Deliveries", 8, "You are no longer selling oxy.")
				    	Citizen.Wait(1200000) -- 20 minutes
				    	OxyRun = false
					end
				end
			end

	    else

	    	local close = false

	    	for i = 1, #drugLocs do

				local plycoords = GetEntityCoords(PlayerPedId())

				local dstcheck = #(plycoords - vector3(drugLocs[i]["x"],drugLocs[i]["y"],drugLocs[i]["z"])) 

			

				if dstcheck < 5.0 then

					close = true

					local job = exports["isPed"]:isPed("job")

					if job ~= "police" then

						local price = 100

			    		DrawText3Ds(drugLocs[i]["x"],drugLocs[i]["y"],drugLocs[i]["z"], "[E] $" .. price .. " offer to sell stolen goods (12).") 
				    	
				    	if IsControlJustReleased(0,38) then

				    		local countpolice = exports["drp-duty"]:LawAmount()
				    		local daytime = exports["isPed"]:isPed("daytime")

							if not daytime then
		            			TriggerEvent("DoLongHudText","Its too late - noones buying shit!",2)
		            		else
		            			mygang = drugLocs[i]["gang"]
					    		TriggerServerEvent("drugdelivery:server",price)
					    		Citizen.Wait(1500)
					    	end

				    	end

			    	else

			    		Citizen.Wait(60000)

			    	end

			    	Citizen.Wait(1)

			    end

			end

			if not close then
				Citizen.Wait(2000)
			end

	    end

    end

end)






RegisterNetEvent("drugdeliveries:AcceptBribe")
AddEventHandler("drugdeliveries:AcceptBribe", function()
	local NearNPC = exports["isPed"]:GetClosestNPC()
	PlayAmbientSpeech1(NearNPC, "Chat_Resp", "SPEECH_PARAMS_FORCE", 1)
	watchinglist[mygang] = { ["gang"] = mygang, ["timer"] = 3600 }
end)



RegisterNetEvent("drugdeliveries:nope")
AddEventHandler("drugdeliveries:nope", function()
	local NearNPC = exports["isPed"]:GetClosestNPC()
	TriggerEvent("DoLongHudText","We aint needing no help right now - come back later.",2)
	PlayAmbientSpeech1(NearNPC, "Chat_Resp", "SPEECH_PARAMS_FORCE", 1)
end)

RegisterNetEvent("drugdelivery:bribeInfo")
AddEventHandler("drugdelivery:bribeInfo", function(gangpassed,reputation)

	if watchinglist[gangpassed] then
		if watchinglist[gangpassed]["timer"] > 0 then
			local gangside = "None"
			if gangpassed == "mexican" then
				gangside = "East Side"
			elseif gangpassed == "ballas" then
				gangside = "Central"
			elseif gangpassed == "weicheng" then
				gangside = "West Side"
			end
			if myGangReputation[gangpassed] >= reputation then
				TriggerEvent("chatMessage", "EMAIL ", 8, "Yo, just had someone hit me up in the " .. gangside .. " area")
			end
		end
	end
end)

RegisterNetEvent("drugdelivery:receiveBox")
AddEventHandler("drugdelivery:receiveBox", function(amount)
	TriggerEvent("Evidence:StateSet",4,900)

end)
local breakingdown = false
RegisterNetEvent("drugdelivery:breakdownBox")
AddEventHandler("drugdelivery:breakdownBox", function()


end)




RegisterNetEvent("drugdelivery:startDealing")
AddEventHandler("drugdelivery:startDealing", function()
	local NearNPC = exports["isPed"]:GetClosestNPC()
	PlayAmbientSpeech1(NearNPC, "Chat_Resp", "SPEECH_PARAMS_FORCE", 1)
	TriggerEvent("DoLongHudText","Your pager will be updated with locations soon.")
	TriggerEvent( "player:receiveItem", "darkmarketdeliveries", 1 )

	salecount = 0
	drugdealer = true
	firstdeal = true
end)

RegisterNetEvent("oxydelivery:startDealing")
AddEventHandler("oxydelivery:startDealing", function()
	local NearNPC = exports["isPed"]:GetClosestNPC()
	PlayAmbientSpeech1(NearNPC, "Chat_Resp", "SPEECH_PARAMS_FORCE", 1)
	TriggerEvent("DoLongHudText","Your pager will be updated with locations soon.")
	TriggerEvent( "player:receiveItem", "darkmarketdeliveries", 1 )

	salecount = 0	
	firstdeal = true
	OxyRun = true
	vehspawn = false
	CreateOxyVehicle()
	vehspawn = true
	

	
end)

-- they pay $1000 for $3000 worth of product and start event.
