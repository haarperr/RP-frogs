Citizen.CreateThread(function()
    print(Veny.notify)
    if Veny.notify == "qbcorenotify" then
        while QBCore == nil do
            TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
            Citizen.Wait(200)
            PlayerData = QBCore.Functions.GetPlayerData()
        end
    end
end)

function isPursuitCar(currentCar)
    for i, v in pairs(Veny.PursuitCars) do
        if currentCar == GetHashKey(v) then
            return true
        end
    end
    return false
end

local mode1 = false
local mode2 = false
local mode3 = false
local mode4 = true

CreateThread(function()
    while true do
        local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
        if IsControlJustPressed(0, 178) then --delete
            -- check if driver
            if GetPedInVehicleSeat(vehicle, -1) == PlayerPedId() then
                
                if vehicle ~= 0 then
                    local vehiclehash = GetEntityModel(vehicle)
                    if isPursuitCar(vehiclehash) then
                        local defaultcarspeed = GetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fInitialDriveForce')
                        if mode4 then
                            mode1 = true
                            mode2 = false
                            mode3 = false
                            mode4 = false
                            TriggerEvent('DoLongHudText', "Pursuit Mode: A+" , 1)
                            SetVehicleHandlingField(vehicle, "CHandlingData", "fInitialDriveForce", defaultcarspeed+Veny.MultiplierAPlus-Veny.MultiplierA)
                        elseif mode1 then
                            mode1 = false
                            mode2 = true
                            mode3 = false
                            mode4 = false
                            TriggerEvent('DoLongHudText', "Pursuit Mode: S" , 1)
                            SetVehicleHandlingField(vehicle, "CHandlingData", "fInitialDriveForce", defaultcarspeed+Veny.MultiplierS-Veny.MultiplierAPlus)
                        elseif mode2 then
                            mode1 = false
                            mode2 = false
                            mode3 = true
                            mode4 = false
                            TriggerEvent('DoLongHudText', "Pursuit Mode: S+" , 1)
                            SetVehicleHandlingField(vehicle, "CHandlingData", "fInitialDriveForce", defaultcarspeed+Veny.MultiplierSPlus-Veny.MultiplierS)
                        elseif mode3 then
                            mode1 = false
                            mode2 = false
                            mode3 = false
                            mode4 = true
                            TriggerEvent('DoLongHudText', "Pursuit Mode: A" , 1)
                            SetVehicleHandlingField(vehicle, "CHandlingData", "fInitialDriveForce", defaultcarspeed+Veny.MultiplierA-Veny.MultiplierSPlus)
                        end
                    else
                    TriggerEvent('DoLongHudText', "You are not in a pursuit car" , 2)
                    end
                else
                    TriggerEvent('DoLongHudText', "You are not in a car" , 2)
                end
            end
        end
        Wait(1)
    end
end)