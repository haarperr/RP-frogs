RegisterNetEvent("drp-gokart:getkart")
AddEventHandler("drp-gokart:getkart", function()
    local player = GetPlayerPed(-1)

    -- pay 500$
    TriggerServerEvent("drp-gokart:pay")
end)

RegisterNetEvent("drp-gokart:recievekart")
AddEventHandler("drp-gokart:recievekart", function()
    local hash = GetHashKey("veto2")

    local cartSpawn = vector4(5472.5215, 254.6226, 19.0711, 359.8210)
    
    RequestModel(hash)
    while not HasModelLoaded(hash) do
        Wait(1)
    end

    local cart = CreateVehicle("veto2", cartSpawn.x, cartSpawn.y, cartSpawn.z, cartSpawn.w, true, true)
    SetVehicleHasBeenOwnedByPlayer(cart, true)
    SetVehicleNeedsToBeHotwired(cart, false)
    SetVehicleEngineOn(cart, true, true)
    SetVehicleUndriveable(cart, false)
    SetPedIntoVehicle(player, cart, -1)
    
end)