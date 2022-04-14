RegisterNetEvent('drp-barriers:cone')
RegisterNetEvent('drp-barriers:sbarrier')
RegisterNetEvent('drp-barriers:barrier')
RegisterNetEvent('drp-barriers:insuffPerms')

RegisterCommand("cone", function()
	local can = (exports["isPed"]:isPed("myJob") == 'police' or exports["isPed"]:isPed("myJob") == 'sheriff' or exports["isPed"]:isPed("myJob") == 'state' or exports["isPed"]:isPed("myJob") == 'judge' or exports["isPed"]:isPed("myJob") == 'district_attorney' or exports["isPed"]:isPed("myJob") == 'public_defender') and not exports['drp-death']:GetDeathStatus()
    if can then 
		TriggerEvent('drp-barriers:cone')
		TriggerServerEvent("drp-barriers:stoptraffic", GetEntityCoords(GetPlayerPed(-1)))")
	end
end)

RegisterCommand("sbarrier", function()
	local can = (exports["isPed"]:isPed("myJob") == 'police' or exports["isPed"]:isPed("myJob") == 'sheriff' or exports["isPed"]:isPed("myJob") == 'state' or exports["isPed"]:isPed("myJob") == 'judge' or exports["isPed"]:isPed("myJob") == 'district_attorney' or exports["isPed"]:isPed("myJob") == 'public_defender') and not exports['drp-death']:GetDeathStatus()
    if can then 
		TriggerEvent('drp-barriers:sbarrier')
		TriggerServerEvent("drp-barriers:stoptraffic", GetEntityCoords(GetPlayerPed(-1)))")
	end
end)

RegisterCommand("barrier", function()
	local can = (exports["isPed"]:isPed("myJob") == 'police' or exports["isPed"]:isPed("myJob") == 'sheriff' or exports["isPed"]:isPed("myJob") == 'state' or exports["isPed"]:isPed("myJob") == 'judge' or exports["isPed"]:isPed("myJob") == 'district_attorney' or exports["isPed"]:isPed("myJob") == 'public_defender') and not exports['drp-death']:GetDeathStatus()
    if can then 
		TriggerEvent('drp-barriers:barrier')
		TriggerServerEvent("drp-barriers:stoptraffic", GetEntityCoords(GetPlayerPed(-1)))")
	end
end)

RegisterCommand("pickup", function()
	local can = (exports["isPed"]:isPed("myJob") == 'police' or exports["isPed"]:isPed("myJob") == 'sheriff' or exports["isPed"]:isPed("myJob") == 'state' or exports["isPed"]:isPed("myJob") == 'judge' or exports["isPed"]:isPed("myJob") == 'district_attorney' or exports["isPed"]:isPed("myJob") == 'public_defender') and not exports['drp-death']:GetDeathStatus()
    if can then 
		TriggerEvent('drp-barriers:cleanup')
	end
end)

AddEventHandler("drp-barriers:cleanup", function()
	-- delete every model prop_mp_cone_01 and prop_mp_barrier_02b and prop_barrier_work05 in an radius of 10
	local cone = GetClosestObjectOfType(GetEntityCoords(PlayerPedId()), 10.0, GetHashKey("prop_mp_cone_01"), false, false, false)
	local barrier = GetClosestObjectOfType(GetEntityCoords(PlayerPedId()), 10.0, GetHashKey("prop_mp_barrier_02b"), false, false, false)
	local barrier2 = GetClosestObjectOfType(GetEntityCoords(PlayerPedId()), 10.0, GetHashKey("prop_barrier_work05"), false, false, false)

	if DoesEntityExist(cone) then
		DeleteEntity(cone)
	end

	if DoesEntityExist(barrier) then
		DeleteEntity(barrier)
	end

	if DoesEntityExist(barrier2) then
		DeleteEntity(barrier2)
	end
end)




AddEventHandler('drp-barriers:cone', function()
	local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
	local heading = GetEntityHeading(GetPlayerPed(-1))
	
	RequestModel('prop_mp_cone_01')
	
	while not HasModelLoaded('prop_mp_cone_01') do
		Citizen.Wait(1)
	end
	
	local cone = CreateObject('prop_mp_cone_01', x, y, z-2, true, true, true)
	PlaceObjectOnGroundProperly(cone)
	SetEntityHeading(cone, heading+0.5)
	notification('~g~The cone has been placed!')
end)

AddEventHandler('drp-barriers:sbarrier', function()
	local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
	local heading = GetEntityHeading(GetPlayerPed(-1))
	
	RequestModel('prop_mp_barrier_02b')
	
	while not HasModelLoaded('prop_mp_barrier_02b') do
		Citizen.Wait(1)
	end
	
	local sbarrier = CreateObject('prop_mp_barrier_02b', x, y, z-2, true, true, true)
	local cone = CreateObject('prop_mp_cone_01', x, y, z-2, true, true, true)
	PlaceObjectOnGroundProperly(sbarrier)
	PlaceObjectOnGroundProperly(cone)
	SetEntityHeading(sbarrier, heading)
	notification('~g~The small barrier has been placed!')
end)

AddEventHandler('drp-barriers:barrier', function()
	local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
	local heading = GetEntityHeading(GetPlayerPed(-1))
	
	RequestModel('prop_barrier_work05')
	
	while not HasModelLoaded('prop_barrier_work05') do
		Citizen.Wait(1)
	end
	
	local barrier = CreateObject('prop_barrier_work05', x, y, z-2, true, true, true)
	local cone = CreateObject('prop_mp_cone_01', x, y, z-2, true, true, true)
	PlaceObjectOnGroundProperly(barrier)
	PlaceObjectOnGroundProperly(cone)
	SetEntityHeading(barrier, heading)
	notification('~g~The barrier has been placed!')
end)

function notification(msg)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(msg)
	DrawNotification(false, false)
end