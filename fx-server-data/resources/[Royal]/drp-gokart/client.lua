RegisterNetEvent("drp-gokart:getkart")
AddEventHandler("drp-gokart:getkart", function()
    Citizen.Trace("debug hello")
    local hash = GetHashKey("veto2")
    local player = GetPlayerPed(-1)

    local cartSpawn = vector4(5547.5283, 289.1031, 20.1434, 263.5504)
    
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