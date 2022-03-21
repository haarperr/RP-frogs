AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
      return
    end
    print('The resource ' .. resourceName .. ' has been started.')
    exports.hypnonema:play("Hypnonema Example Screen", "https://twitch.tv/xqcow")
    exports.hypnonema:play("PD Monitor", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcReULWfKHC4vFgFZ37Ew2O7Pej3vILuMaofZQ&usqp=CAU")

  end)
  