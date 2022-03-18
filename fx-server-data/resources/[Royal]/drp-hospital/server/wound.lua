local playerInjury = {}

function GetCharsInjuries(source)
    return playerInjury[source]
end

RegisterServerEvent('drp-hospital:server:SyncInjuries')
AddEventHandler('drp-hospital:server:SyncInjuries', function(data)
    playerInjury[source] = data
end)