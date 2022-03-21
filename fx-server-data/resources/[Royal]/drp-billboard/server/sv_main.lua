AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
      return
    end
    print('The resource ' .. resourceName .. ' has been started.')
    while not exports or not exports['hypnonema'] do Wait(1) end
    exports['hypnonema']:play("Hypnonema Example Screen", "https://twitch.tv/xqcow")
    exports['hypnonema']:play("PD Monitor", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcReULWfKHC4vFgFZ37Ew2O7Pej3vILuMaofZQ&usqp=CAU")

    while true do
        exports['hypnonema']:play("Hypnonema Example Screen", "https://twitch.tv/xqcow")
        Citizen.Wait(5500)
    end

  end)
  