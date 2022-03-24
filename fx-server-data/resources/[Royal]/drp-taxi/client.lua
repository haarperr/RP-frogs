local alreadySigned = false

RegisterNetEvent("drp_taxi:startJob")
AddEventHandler("drp_taxi:startJob", function(
    if alreadySigned then
        TriggerEvent("DoLongHudText","You are already signed in!")
    else 
        TriggerServerEvent("drp_taxi:getDeposit")
    end
end)

RegisterNetEvent("drp_taxi:getTaxi")
AddEventHandler("drp_taxi:getTaxi", function(
    alreadySigned = true
    
    RequestModel('taxi')
    while not HasModelLoaded('taxi') do
        Wait(1)
        RequestModel('taxi')
    end

    taxi = CreateVehicle("tasi", 910.8181, -177.8087, 74.2730, 236.2925, true, true)

    SetVehicleHasBeenOwnedByPlayer(taxi, true)
    SetEntityAsMissionEntity(taxi, true, true)
    SetVehicleIsStolen(taxi, false)
    SetVehicleIsWanted(taxi, false)
    SetVehRadioStation(taxi, 'OFF')

    Citizen.Wait(math.random(60000, 120000))
end)
