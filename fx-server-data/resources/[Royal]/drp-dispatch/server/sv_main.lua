local addCallAmount = 0

local function isAuth(pJob)
    for idx, job in pairs(Config["AuthJobs"]) do
        if pJob == job then
            return true
        end
    end
    return false
end

LoadRoyalVersion = function()
    RegisterServerEvent("dispatch:svNotify", function(data)
        addCallAmount = addCallAmount + 1
        for index, id in pairs(GetPlayers()) do
            local xPlayer = exports['drp-base']:getModule("Player"):GetUser(tonumber(id))
            if isAuth(xPlayer.job) then
                TriggerClientEvent("dispatch:clNotify", xPlayer.source, data, data.dispatchCode, source, addCallAmount)
            end
        end
    end)
end

RegisterServerEvent('dispatch:setcallsign')
AddEventHandler('dispatch:setcallsign', function()
    local src = source
    local user = exports["drp-base"]:getModule("Player"):GetUser(src)
    local character = user:getCurrentCharacter()
    exports.ghmattimysql:execute('SELECT * FROM jobs_whitelist WHERE cid = ?', {character.id}, function(result)
        if result[1] ~= nil then
            TriggerClientEvent('police:setCallSign', src, result[1].callsign)
        end
    end)
end)

Citizen.CreateThread(function()
    if Config["CoreSettings"]["Core"] == "rrpbase" then
        LoadRoyalVersion()
    end
end)