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

RegisterNetEvent("drp-garages:open:law:normal")
AddEventHandler("drp-garages:open:law:normal", function()
    local pJob = exports["isPed"]:isPed("myJob")
    local pGarage = exports['drp-menu']:currentGarage()
    RPC.execute("drp-garages:open:law", pGarage, pJob, "normal")
end)

RegisterNetEvent("drp-garages:open:law:interceptor")
AddEventHandler("drp-garages:open:law:interceptor", function()
    local pJob = exports["isPed"]:isPed("myJob")
    local pGarage = exports['drp-menu']:currentGarage()
    RPC.execute("drp-garages:open:law", pGarage, pJob, "interceptor")
end)

RegisterNetEvent("drp-garages:open:law:uc")
AddEventHandler("drp-garages:open:law:uc", function()
    local pJob = exports["isPed"]:isPed("myJob")
    local pGarage = exports['drp-menu']:currentGarage()
    RPC.execute("drp-garages:open:law", pGarage, pJob, "uc")
end)

RegisterNetEvent("drp-garages:open:law:others")
AddEventHandler("drp-garages:open:law:others", function()
    local pJob = exports["isPed"]:isPed("myJob")
    local pGarage = exports['drp-menu']:currentGarage()
    RPC.execute("drp-garages:open:law", pGarage, pJob, "others")
end)


RegisterNetEvent("drp-garages:openPersonalGarage")
AddEventHandler("drp-garages:openPersonalGarage", function()
    exports['drp-garages']:DeleteViewedCar()
    RPC.execute("drp-garages:select", exports['drp-menu']:currentGarage())
end)

RegisterNetEvent("drp-garages:attempt:spawn", function(data, pRealSpawn)
    if not pRealSpawn then
        RPC.execute("drp-garages:attempt:sv", data)
      local vehicle = SpawnVehicle(data.model, exports['drp-menu']:currentGarage(), data.fuel, data.customized, data.plate, true)
      SetVehicleNeedsToBeHotwired(vehicle, false)
      SetVehicleHasBeenOwnedByPlayer(vehicle, true)
      SetEntityAsMissionEntity(vehicle, true, true)
      SetVehicleIsStolen(vehicle, false)
      SetVehicleIsWanted(vehicle, false)
      SetVehRadioStation(vehicle, 'OFF')
    else
     local vehicle = SpawnVehicle(data.model, exports['drp-menu']:currentGarage(), data.fuel, data.customized, data.plate, false)
     SetVehicleNeedsToBeHotwired(vehicle, false)
     SetVehicleHasBeenOwnedByPlayer(vehicle, true)
     SetEntityAsMissionEntity(vehicle, true, true)
     SetVehicleIsStolen(vehicle, false)
     SetVehicleIsWanted(vehicle, false)
     SetVehRadioStation(vehicle, 'OFF')
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