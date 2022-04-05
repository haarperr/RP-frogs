local blackout = false
RegisterNetEvent('efe:explotiontype')
AddEventHandler('efe:explotiontype', function()
    if #(vector3(712.9213, 164.0436, 80.754) - GetEntityCoords(PlayerPedId())) <= 20 and not blackout then
        blackout = true
        TriggerServerEvent('efe:server:elektrikkes', true)
        Wait(900000) -- 15 min
        TriggerServerEvent('efe:server:elektrikkes', false)
        print(blackout)
    end
end)

RegisterNetEvent('efe:client:elektrikkes')
AddEventHandler('efe:client:elektrikkes', function(durum)
    if durum then
        AddExplosion(712.9213, 164.0436, 80.754, 37, 150000.0, true, false, 4.0)
        Wait(500)
        AddExplosion(695.8688, 157.2403, 83.940, 37, 150000.0, true, false, 4.0)
        Wait(500)
        AddExplosion(680.5214, 164.1465, 83.940, 37, 150000.0, true, false, 4.0)
        AddExplosion(665.3880, 123.9860, 83.940, 37, 150000.0, true, false, 4.0)
        AddExplosion(690.4120, 141.7257, 83.940, 37, 150000.0, true, false, 4.0)
        Wait(500)
        AddExplosion(680.4738, 115.9748, 83.940, 37, 150000.0, true, false, 4.0)
        Wait(500)
        AddExplosion(894.0084, -2284.90, 32.580, 37, 150000.0, true, false, 4.0)
        AddExplosion(706.7719, 116.2826, 83.940, 37, 150000.0, true, false, 4.0)
        AddExplosion(701.2233, 101.3244, 83.929, 37, 150000.0, true, false, 4.0)
        AddExplosion(710.6165, 125.4014, 83.929, 37, 150000.0, true, false, 4.0)
        print(durum)
        Citizen.CreateThread(function()
            TriggerServerEvent("efe:chatmessage")
            while true do
                Wait(5)
                SetArtificialLightsState(true)
                SetArtificialLightsStateAffectsVehicles(false)
            end
        end)
    elseif not durum then
        Citizen.CreateThread(function()
            while true do
                Wait(5)
                SetArtificialLightsState(true)
            end
        end)
    end
end)

exports('checkblackout', function()
    return blackout
end)

RegisterCommand('sado', function()
    blackout = true
end)

RegisterCommand('restore', function()
    TriggerServerEvent('efe:server:elektrikkes', false)
end)