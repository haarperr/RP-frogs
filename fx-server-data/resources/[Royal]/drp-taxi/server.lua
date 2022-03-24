RegisterServerEvent("drp_taxi:getDeposit")
AddEventHandler("drp_taxi:getDeposit", function(
    local src = source
    local user = exports["drp-base"]:getModule("Player"):GetUser(src)
    local money = tonumber(user:getCash())
    if money >= tonumber(1000) then
        user:removeMoney(1000)
        TriggerClientEvent("DoLongHudText", src, "You have sucessfully deposited 1k for your Taxi", 2)
    else
        TriggerClientEvent("DoLongHudText", src, "Not Enough Money for deposit. (1k)", 2)
    end
end)

RegisterServerEvent("drp_taxi:startJob")
AddEventHandler("drp_taxi:startJob", function(
    TriggerClientEvent("drp_taxi:checkIfSigned")
end)
