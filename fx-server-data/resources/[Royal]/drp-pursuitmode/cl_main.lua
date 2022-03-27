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

local mode1 = false
local mode2 = false
local mode3 = false
local mode4 = true

CreateThread(function()
    while true do
        local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
        if IsControlJustPressed(0, 178) then --delete
            if vehicle ~= 0 then
                local vehiclehash = GetEntityModel(vehicle)
                if vehiclehash == Veny.PursuitCar1 or vehiclehash == Veny.PursuitCar2 or vehiclehash == Veny.PursuitCar3 or vehiclehash == Veny.PursuitCar4 or vehiclehash == Veny.PursuitCar5 or vehiclehash == Veny.PursuitCar6  or vehiclehash == Veny.PursuitCar7 then
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
        Wait(0)
    end
end)