RegisterNetEvent('drp-barriers:cone')
RegisterNetEvent('drp-barriers:sbarrier')
RegisterNetEvent('drp-barriers:barrier')
RegisterNetEvent('drp-barriers:insuffPerms')

AddEventHandler('drp-barriers:cone', function()
	local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
	local heading = GetEntityHeading(GetPlayerPed(-1))
	
	RequestModel('prop_mp_cone_01')
	
	while not HasModelLoaded('prop_mp_cone_01') do
		Citizen.Wait(1)
	end
	
	local cone = CreateObject('prop_mp_cone_01', x, y, z-2, true, true, true)
	PlaceObjectOnGroundProperly(cone)
	SetEntityHeading(cone, heading)
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