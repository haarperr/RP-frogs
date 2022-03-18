RegisterNetEvent('royal:peds:rogue')
AddEventHandler('royal:peds:rogue', function(pRoguePeds)
    if pRoguePeds then
        for _, ped in ipairs(pRoguePeds) do
            if ped.owner ~= -1 and ped.owner ~= 0 then
                TriggerClientEvent('royal:peds:rogue:delete', ped.owner, ped.netId)
            end
        end
    end
end)

RegisterNetEvent('royal:peds:decor')
AddEventHandler('royal:peds:decor', function(pServerId, pNetId)
    if pServerId ~= -1 or pServerId ~= 0 then
        TriggerClientEvent('royal:peds:decor:set', pServerId, pNetId, 2, 'ScriptedPed', true)
    end
end)