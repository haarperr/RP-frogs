RegisterNetEvent("drp-garages:open")
AddEventHandler("drp-garages:open", function()
    local pJob = exports["isPed"]:isPed("myJob")
    local pGarage = exports['drp-menu']:currentGarage()
    RPC.execute("drp-garages:selectMenu", pGarage, pJob)
end)

RegisterNetEvent("drp-garages:openSharedGarage")
AddEventHandler("drp-garages:openSharedGarage", function()
    local pJob = exports["isPed"]:isPed("myJob")
    exports['drp-garages']:DeleteViewedCar()
    RPC.execute("drp-garages:selectSharedGarage", exports['drp-menu']:currentGarage(), pJob)
end)

RegisterNetEvent("drp-garages:openPersonalGarage")
AddEventHandler("drp-garages:openPersonalGarage", function()
    exports['drp-garages']:DeleteViewedCar()
    RPC.execute("drp-garages:select", exports['drp-menu']:currentGarage())
end)

RegisterNetEvent("drp-garages:attempt:spawn", function(data, pRealSpawn)
    if not pRealSpawn then
        RPC.execute("drp-garages:attempt:sv", data)
        SpawnVehicle(data.model, exports['drp-menu']:currentGarage(), data.fuel, data.customized, data.plate, true)
    else
        SpawnVehicle(data.model, exports['drp-menu']:currentGarage(), data.fuel, data.customized, data.plate, false)
    end
end)

RegisterNetEvent("drp-garages:takeout", function(pData)
    RPC.execute("drp-garages:spawned:get", pData.pVeh)
end)

RegisterNetEvent("drp-garages:store", function()
    local pos = GetEntityCoords(PlayerPedId())
    local Stored = RPC.execute("drp-garages:states", "In", exports["drp-vehicles"]:NearVehicle("plate"), exports['drp-menu']:currentGarage(), exports["drp-vehicles"]:NearVehicle("Fuel"))
    local coordA = GetEntityCoords(PlayerPedId(), 1)
    local coordB = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 100.0, 0.0)
    local curVeh = exports['drp-vehicles']:getVehicleInDirection(coordA, coordB)
    if DoesEntityExist(curVeh) then
        if Stored then
            DeleteVehicle(curVeh)
            DeleteEntity(curVeh)
            TriggerEvent('keys:remove', exports["drp-vehicles"]:NearVehicle("plate"))
            TriggerEvent('DoLongHudText', "Vehicle stored in garage: " ..exports['drp-menu']:currentGarage(), 1)
        else
            TriggerEvent('DoLongHudText', "You cant store local cars!", 2)
        end
    else
        TriggerEvent("DoLongHudText", "No vehicle near by!" , 2)
    end
end)