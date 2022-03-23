local drugStorePed = 0

RegisterServerEvent('oxydelivery:CreateDrugStorePed')
AddEventHandler('oxydelivery:server', function()
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

	ped = CreatePed(pedType, hashKey, oxyStorePedLocation["x"],oxyStorePedLocation["y"],oxyStorePedLocation["z"], 270.0, 1, 1)
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

RegisterServerEvent('oxydelivery:server')
AddEventHandler('oxydelivery:server', function(money)
    local src = source
    local user = exports["drp-base"]:getModule("Player"):GetUser(source)

	if user:getCash() >= money then
        user:removeMoney(money)

		TriggerClientEvent("oxydelivery:startDealing", source)
    else
        TriggerClientEvent('notification', source, 'You dont have enough money little stupid fucking bitch.', 2)
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
AddEventHandler('oxydelivery:deleteOxyPed', function(deliveryPed))
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


RegisterServerEvent('oxydelivery:builddrugstore')
AddEventHandler('oxydelivery:builddrugstore', function(oxyStoreLocation)
	Citizen.Wait(1000)

	local generator = { x = oxyStoreLocation["x"] , y = oxyStoreLocation["y"], z = oxyStoreLocation["z"] - 35.0}
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
	TriggerClientEvent('oxydelivery:teleport')
end