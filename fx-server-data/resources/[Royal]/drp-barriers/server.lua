
AddEventHandler('chatMessage', function(source, n, msg)
    local msg = string.lower(msg)
    local identifier = GetPlayerIdentifiers(source)[1]
    local can = (exports["isPed"]:isPed("myJob") == 'police' or exports["isPed"]:isPed("myJob") == 'sheriff' or exports["isPed"]:isPed("myJob") == 'state' or exports["isPed"]:isPed("myJob") == 'judge' or exports["isPed"]:isPed("myJob") == 'district_attorney' or exports["isPed"]:isPed("myJob") == 'public_defender') and not exports['drp-death']:GetDeathStatus()
    if can then 
        if msg == '/cone' then
            CancelEvent()
            TriggerClientEvent('drp-barriers:cone', source)
            
        
        elseif msg == '/sbarrier' then
            CancelEvent()
            TriggerClientEvent('drp-barriers:sbarrier', source)
            
            
        elseif msg == '/barrier' then
            CancelEvent()
            TriggerClientEvent('drp-barriers:barrier', source)
            
        end
    end
end)

function checkAllowed(id)
    for k, v in pairs(allowed) do
        if id == v then
            return true
        end
    end
    
    return false
end