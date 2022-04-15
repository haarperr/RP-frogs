RegisterNetEvent("drp-gokart:removemoney")
AddEventHandler("drp.gokart:removemoney", function()
    local player = GetPlayerPed(-1)
    local money = GetPlayerMoney(player)
    if money >= 500 then
        local newMoney = money - 500
        SetPlayerMoney(player, newMoney)
    end
end)