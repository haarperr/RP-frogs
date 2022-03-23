RegisterServerEvent('oxydelivery:server')
AddEventHandler('oxydelivery:server', function(money)
    local src = source
    local user = exports["drp-base"]:getModule("Player"):GetUser(source)

	if user:getCash() >= money then
        user:removeMoney(money)

		TriggerClientEvent("oxydelivery:startDealing", source)
    else
        TriggerClientEvent('DoLongHudText', source, 'You dont have enough money little stupid fucking bitch.', 2)
	end
end)

RegisterServerEvent('mission:completed')
AddEventHandler('mission:completed', function(money)
    local src = source
    local user = exports["drp-base"]:getModule("Player"):GetUser(source)
    user:addMoney(money)
end)


AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
      return
    end
end)


RegisterServerEvent('oxydelivery:deleteOxyPed')
AddEventHandler('oxydelivery:deleteOxyPed', function(deliveryPed)
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
end)

RegisterServerEvent('oxydelivery:createOxyPed')
AddEventHandler('oxydelivery:createOxyPed', function(ped)
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

    TriggerClientEvent('oxydelivery:setDeliveryPed', deliveryPed)
end