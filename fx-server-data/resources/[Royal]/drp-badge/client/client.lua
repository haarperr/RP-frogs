RegisterNetEvent('drp-badge:client:showbadge')
AddEventHandler('drp-badge:client:showbadge', function(pid, image, grade, name, department)
  local person_src = pid
  local pid = GetPlayerFromServerId(person_src)
	local targetPed = GetPlayerPed(pid)
	local myCoords = GetEntityCoords(GetPlayerPed(-1))
    local targetCoords = GetEntityCoords(targetPed)
        --TriggerEvent("animation:Chair2")
    if pid ~= -1 then
	    if GetDistanceBetweenCoords(myCoords, targetCoords, true) <= 1.5 then
		SendNUIMessage({ action = "open", img = image, grade = grade, name = name, department = department, args = cidInformation})
		Citizen.Wait(7500)
		SendNUIMessage({
			action = "close"
		})
       end
    end
end)

RegisterNetEvent('drp-badge:client:getbadge')
AddEventHandler('drp-badge:client:getbadge', function()
	TriggerServerEvent("drp-pdbadge:buy")
end)
RegisterCommand("pdbadge", function()
    TriggerServerEvent("drp-pdbadge:buy")
end)

RegisterNetEvent("FlashBadge")
AddEventHandler('FlashBadge', function()
	local ped = GetPlayerPed()
	local myCoords1 = GetEntityCoords(ped)
	local badgeProp = CreateObject(GetHashKey(prop_fib_badge), myCoords1.x, myCoords1.y, myCoords1.z + 0.2, true, true, true)
	local boneIndex = GetPedBoneIndex(ped, 28422)

	AttachEntityToEntity(badgeProp, ped, boneIndex, 0.065, 0.029, -0.035, 80.0, -1.90, 75.0, true, true, false, true, 1, true)
        RequestAnimDict('paper_1_rcm_alt1-9')
		TaskPlayAnim(ped, "cellphone@", "cellphone_text_in", 2.0, 3.0, -1, 49, 0, 0, 0, 0)
        --TaskPlayAnim(ped, 'paper_1_rcm_alt1-9', 'player_one_dual-9', 8.0, -8, 10.0, 49, 0, 0, 0, 0)
        Citizen.Wait(3000)
        ClearPedSecondaryTask(ped)
        DeleteObject(badgeProp)

end)
