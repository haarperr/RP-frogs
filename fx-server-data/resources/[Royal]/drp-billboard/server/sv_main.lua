AddEventHandler(('onResourceStart'):format(IsDuplicityVersion() and 'Server' or 'Client'), function(resource)
    if resource == GetCurrentResourceName() then
      Citizen.CreateThread(function()
        exports.hypnonema:play("Hypnonema Example Screen", "https://twitch.tv/xqcow")
        exports.hypnonema:play("PD Monitor", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcReULWfKHC4vFgFZ37Ew2O7Pej3vILuMaofZQ&usqp=CAU")
        while true do
            exports.hypnonema:play("pdleft", "https://i.imgur.com/vwFVrRt.gif")
            Citizen.Wait(5500)
        end
      end)
    end
end)