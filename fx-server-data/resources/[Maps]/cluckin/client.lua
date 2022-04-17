Citizen.CreateThread(function()
  while true do
    Citizen.Wait(1)
    local myCoords = GetEntityCoords(GetPlayerPed(-1))
    if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -503.7418, -691.0309, 20.8454, true ) < 100 then
      ClearAreaOfPeds(-503.7418, -691.0309, 20.8454, 86.4835, 0)
    end
  end
end)