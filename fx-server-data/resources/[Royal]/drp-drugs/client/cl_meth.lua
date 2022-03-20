local ongoing = false
local cooking = false
local packing = false
local scaling = false

RegisterNetEvent("methtablemenu")
AddEventHandler("methtablemenu", function()
	TriggerEvent('drp-context:sendMenu', {
        {
            id = 1,
            header = "Meth Table Processing",
            txt = "",
            params = {
                event = ""
            }
        },
        {
            id = 2,
            header = "Cook Meth",
            txt = "Process raw ingredients into raw meth",
			params = {
                event = "meth:start",

           }
        },
        {
            id = 3,
            header = "Cure Meth",
            txt = "Cure the raw product",
			params = {
                event = "meth:packing",

           }
        },
        {
            id = 4,
            header = "Package Meth",
            txt = "Package meth into sellable product",
			params = {
                event = "meth:finish",

           }
        }
       
    })
end)


function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end 


cooldown = false

RegisterNetEvent("meth:start")
AddEventHandler("meth:start", function()
	local playerped = PlayerPedId()

	local heading = GetEntityHeading(playerped)
	local plyCoords = GetEntityCoords(PlayerPedId())
	if not cooldown then
	--local distance = (GetDistanceBetweenCoords(plyCoords.x, plyCoords.y, plyCoords.z, 1005.694152832, -3201.3181152344, -38.84700012207, false))		
	if exports["drp-inventory"]:hasEnoughOfItem("acetone",3,false) and exports["drp-inventory"]:hasEnoughOfItem("antifreeze",3,false) then
		cooldown = true
		TriggerEvent("meth:cd")
		Cooking()
		FreezeEntityPosition(PlayerPedId(),true)
		SetEntityHeading(PlayerPedId(), heading)
		local finished = exports["drp-taskbar"]:taskBar(60000,"Mixing Meth")
		if (finished == 100) then
			FreezeEntityPosition(PlayerPedId(),false)
			TriggerEvent("inventory:removeItem","acetone", 3)
			TriggerEvent("inventory:removeItem","antifreeze", 3)
			ongoing = true
			cooking = true
			if math.random(100) > 25 then  -- 75% CHANCE TO SUCCESSFULLY COOK METH
				TriggerEvent("DoLongHudText", "Cook was successful")
				TriggerEvent("player:receiveItem","methlabbatch",math.random(1,5))
				ongoing = false
				cooking = false
			else
				if math.random(100) < 25 then -- 25% CHANCE TO BLOW UP ON FAIL
					TriggerEvent("DoLongHudText", "Cook was unsuccessful and the table explodes!", 2)
					TriggerEvent("meth:blowup")
				else
					TriggerEvent("DoLongHudText", "Cook was unsuccessful", 2)
				end
			end
		end
	else
TriggerEvent("DoLongHudText", "Missing Items", 2)
end
else 
	TriggerEvent("DoLongHudText", "You have cooked too recently.", 2)
end
end)


RegisterNetEvent("meth:cd")
AddEventHandler("meth:cd", function()
	Citizen.Wait( 1800000 )
	cooldown = false	
end)


RegisterNetEvent("meth:blowup")
AddEventHandler("meth:blowup", function()
	Explode(PackageObject)
	
end)

RegisterNetEvent("meth:packing")
AddEventHandler("meth:packing", function()
	local playerped = PlayerPedId()
	local plyCoords = GetEntityCoords(PlayerPedId())
	local distance = (GetDistanceBetweenCoords(plyCoords.x, plyCoords.y, plyCoords.z, 1016.3265991211, -3194.9626464844, -38.993156433105, false))	
	if exports["drp-inventory"]:hasEnoughOfItem("methlabbatch",5,false) and ongoing == false then
		Packing()
		FreezeEntityPosition(PlayerPedId(),true)
		SetEntityHeading(PlayerPedId(), 359.97235107422)
		local finished = exports["drp-taskbar"]:taskBar(60000,"Curing Meth!")
		if (finished == 100) then
			FreezeEntityPosition(PlayerPedId(),false)
			TriggerEvent("inventory:removeItem","methlabbatch", 3)
			ongoing = true
			packing = true
			if packing == true then
				TriggerEvent("DoLongHudText", "You Received Them Good Good.")
				TriggerEvent("player:receiveItem","methlabcured", 1)
				ongoing = false
				packing = false
			elseif packing == false then
				TriggerEvent("DoLongHudText", "Failed!", 2)
			end
		end
	end
end)

RegisterNetEvent("meth:finish")
AddEventHandler("meth:finish", function()
	local playerped = PlayerPedId()
	local plyCoords = GetEntityCoords(PlayerPedId())
	local distance = (GetDistanceBetweenCoords(plyCoords.x, plyCoords.y, plyCoords.z, 1012.0330200195, -3194.8596191406, -38.99312210083, false))	
	if exports["drp-inventory"]:hasEnoughOfItem("methlabcured",2,false) and exports["drp-inventory"]:hasEnoughOfItem("methlabbaggy",1,false) and ongoing == false then
		Scaling()
		FreezeEntityPosition(PlayerPedId(),true)
		SetEntityHeading(PlayerPedId(), 1.2570070028305)
		local finished = exports["drp-taskbar"]:taskBar(32000,"Packing Crystals!")
		if (finished == 100) then
			FreezeEntityPosition(PlayerPedId(),false)
			TriggerEvent("inventory:removeItem","methlabcured", 2)
			TriggerEvent("inventory:removeItem","methlabbaggy", 1)
			ongoing = true
			scaling = true
			if scaling == true then
				TriggerEvent("DoLongHudText", "You Successfully Packed!")
				TriggerEvent("player:receiveItem","methlabproduct",math.random(1,3))
				ongoing = false
				scaling = false
			elseif scaling == false then
				TriggerEvent("DoLongHudText", "Failed!", 2)
			end
		end
	end

end)

RegisterNetEvent('animation:load')
AddEventHandler('animation:load', function(dict)
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end)

RegisterNetEvent('animation:meth')
AddEventHandler('animation:meth', function()
	inanimation = true
	local lPed = GetPlayerPed(-1)
	RequestAnimDict("mini@repair")
	while not HasAnimDictLoaded("mini@repair") do
		Citizen.Wait(0)
	end

	if IsEntityPlayingAnim(lPed, "mini@repair", "fixing_a_player", 3) then
		ClearPedSecondaryTask(lPed)
	else
		TaskPlayAnim(lPed, "mini@repair", "fixing_a_player", 8.0, -8, -1, 49, 0, 0, 0, 0)
		seccount = 4
		while seccount > 0 do
			Citizen.Wait(10000)
			FreezeEntityPosition(PlayerPedId(),false)
			seccount = seccount - 1
		end
		ClearPedSecondaryTask(lPed)
	end		
	inanimation = false
end)

RegisterNetEvent("meth:sell")
AddEventHandler("meth:sell", function()
	if exports["drp-inventory"]:hasEnoughOfItem("1gmeth",1,false) then
		LoadDict('mp_safehouselost@')
		TaskPlayAnim(GetPlayerPed(-1), "mp_safehouselost@", "package_dropoff", 8.0, 1.0, -1, 16, 0, 0, 0, 0 )
		local finished = exports["drp-taskbar"]:taskBar(3000,"Handing Over Something")
		if (finished == 100) then
			local meth = math.random(120, 160)
			TriggerServerEvent("meth:givemoney", meth)
			TriggerEvent("inventory:removeItem","1gmeth", 1)
			TriggerEvent("player:receiveItem","rollcash",math.random(5,10))
			TriggerEvent("DoLongHudText", "Thanks Man, Heres a lil something for that.")
			Citizen.Wait(5000)
		end
	else
	 TriggerEvent('DoLongHudText', "You need something!!", 2)
	end
end)

function Explode(PackageObject)
	ped = GetPlayerPed(-1)
	local currentPos = GetEntityCoords(ped)
	explode = math.random(10)
	--if explode == 10 then
	
	AddExplosion(currentPos.x, currentPos.y, currentPos.z, EXPLOSION_GAS_TANK, 500.0, true, true, true) --Explode player, not table, so if you would like to run and don't care about your table, you will be one who will explode, not table.
	DeleteObject(PackageObject)
		check = true
		cooking = false
		FreezeEntityPosition(ped, false)
		
	--else
	--	Smoke(PackageObject)
	--  end
  end

function Smoke(obj)
	pos = GetEntityCoords(obj)
		SetPtfxAssetNextCall("core")
  		local smoke = StartParticleFxLoopedAtCoord("exp_grd_flare", pos.x, pos.y, pos.z-1.0, 0.0, 0.0, 0.0, 2.0, false, false, false, false)
		SetParticleFxLoopedAlpha(smoke, 0.5)
		SetParticleFxLoopedColour(smoke, 0.0, 0.0, 0.0, 0)
		Wait(5000)
		StopParticleFxLooped(smoke, 0)
	end

function LoadDict(dict)
    RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
	  	Citizen.Wait(10)
    end
end

function DaBabyBoom()
	local currentPos = GetEntityCoords(ped)
	local ped = PlayerPedId()
    local coords = vector3(1005.694152832, -3201.3181152344, -38.84700012207)
	local coords2 = vector3(1009.1714477539, -3198.2309570312, -39.580497741699)
	RequestWeaponAsset(GetHashKey("WEAPON_RPG")) 
    while not HasWeaponAssetLoaded(GetHashKey("WEAPON_RPG")) do
        Wait(0)
    end
	ShootSingleBulletBetweenCoords( 
		currentPos.x,
        currentPos.y,
        currentPos.z, 
	    currentPos.x,
        currentPos.y,
        currentPos.z,  
		500,
		true,
		GetHashKey("WEAPON_RPG"),
		ped,
		true,
		true,
		-1.0
    )
	ShootSingleBulletBetweenCoords( 
		currentPos.x,
        currentPos.y,
        currentPos.z, 
	    currentPos.x,
        currentPos.y,
        currentPos.z,  
		500,
		true,
		GetHashKey("WEAPON_RPG"),
		ped,
		true,
		true,
		-1.0
    )
	while true do 
		Citizen.Wait(5)
		StopFireInRange(currentPos.x,currentPos.y,currentPos.z, 300.0)
	end
end

didplace = false 

RegisterNetEvent("methjob_place")
AddEventHandler("methjob_place", function(source)
	loadAnimDict('amb@medic@standing@kneel@base')
	loadAnimDict('anim@gangops@facility@servers@bodysearch@')

	local ped = GetPlayerPed(-1)
  	local pos = GetEntityCoords(ped)
  	local vector = GetEntityForwardVector(ped)
  	heading = GetEntityHeading(ped)
	
	TaskPlayAnim(GetPlayerPed(-1), "amb@medic@standing@kneel@base" ,"base" ,8.0, -8.0, -1, 1, 0, false, false, false )
		TaskPlayAnim(GetPlayerPed(-1), "anim@gangops@facility@servers@bodysearch@" ,"player_search" ,8.0, -8.0, -1, 48, 0, false, false, false)

	local finished = exports["drp-taskbar"]:taskBar(3000,"Setting Up Table")
									if finished == 100 then
										didplace = true
										local PackageObject = CreateObject(GetHashKey("v_ret_ml_tablea"), pos.x + (vector.x), pos.y + (vector.y), pos.z-1.0, true)
										SetEntityHeading(PackageObject, heading)
										SetEntityAsMissionEntity(PackageObject)
										ClearPedTasksImmediately(GetPlayerPed(-1))
									end
end)

RegisterNetEvent("methjob_remove")
AddEventHandler("methjob_remove", function()
	local ped = GetPlayerPed(-1)
	local pos = GetEntityCoords(ped)
	local vector = GetEntityForwardVector(ped)
	heading = GetEntityHeading(ped)
	local obj = GetClosestObjectOfType(pos.x, pos.y, pos.z, 3.0, GetHashKey("v_ret_ml_tablea"), false, false, false)
	if didplace then
	if DoesEntityExist(obj) then
	   NetworkRequestControlOfEntity(obj)
	   SetEntityAsMissionEntity(obj)
	   TaskPlayAnim(GetPlayerPed(-1), "amb@medic@standing@kneel@base" ,"base" ,8.0, -8.0, -1, 1, 0, false, false, false )
	   TaskPlayAnim(GetPlayerPed(-1), "anim@gangops@facility@servers@bodysearch@" ,"player_search" ,8.0, -8.0, -1, 48, 0, false, false, false)
	   local finished = exports["drp-taskbar"]:taskBar(3000,"Collapsing Table")
									if finished == 100 then

	ClearPedTasksImmediately(GetPlayerPed(-1))
									end
									
	   DeleteObject(obj)
	   TriggerEvent("player:receiveItem","methtable",1)
	   didplace = false
	else
	  print("cannot find the obj")
	end
else
	TriggerEvent('DoLongHudText', "You did not place this table.", 2)
end
end)


RegisterNetEvent("stopcooking")
AddEventHandler("stopcooking", function()
	if cooking == true then
		TriggerEvent("DoLongHudText", "Failed, You Left The Meth Lab To Early!")
		cooking = false
		ongoing = false
	end
end)

function Cooking()
	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(10)
			local ped = GetPlayerPed(-1)
  			local pos = GetEntityCoords(ped)
  			local vector = GetEntityForwardVector(ped)
  			heading = GetEntityHeading(ped)
            local targetRotation = vec3(180.0, 180.0, 180.0)
            local x,y,z = table.unpack(vec3(pos.x + (vector.x), pos.y + (vector.y), pos.z-1.0))

			local dict = 'missfinale_c2ig_11'
            LoadDict(dict)
            FreezeEntityPosition(GetPlayerPed(-1),true)
            TaskPlayAnim(GetPlayerPed(-1), dict, "pushcar_offcliff_f", 3.0, -8, -1, 63, 0, 0, 0, 0 )
			processo = false
			break    
		end
	end)
end


function Scaling()
		Citizen.CreateThread(function()
		while true do
			Citizen.Wait(10)
			local ped = GetPlayerPed(-1)
  			local pos = GetEntityCoords(ped)
  			local vector = GetEntityForwardVector(ped)
  			heading = GetEntityHeading(ped)
            local targetRotation = vec3(180.0, 180.0, 180.0)
            local x,y,z = table.unpack(vec3(pos.x + (vector.x), pos.y + (vector.y), pos.z-1.0))

			local dict = 'missfinale_c2ig_11'
            LoadDict(dict)
            FreezeEntityPosition(GetPlayerPed(-1),true)
            TaskPlayAnim(GetPlayerPed(-1), dict, "pushcar_offcliff_f", 3.0, -8, -1, 63, 0, 0, 0, 0 )
			processo = false
			break    
		end
	end)
end
function Packing()
		Citizen.CreateThread(function()
		while true do
			Citizen.Wait(10)
			local ped = GetPlayerPed(-1)
  			local pos = GetEntityCoords(ped)
  			local vector = GetEntityForwardVector(ped)
  			heading = GetEntityHeading(ped)
            local targetRotation = vec3(180.0, 180.0, 180.0)
            local x,y,z = table.unpack(vec3(pos.x + (vector.x), pos.y + (vector.y), pos.z-1.0))

			local dict = 'missfinale_c2ig_11'
            LoadDict(dict)
            FreezeEntityPosition(GetPlayerPed(-1),true)
            TaskPlayAnim(GetPlayerPed(-1), dict, "pushcar_offcliff_f", 3.0, -8, -1, 63, 0, 0, 0, 0 )
			processo = false
			break    
		end
	end)
end
