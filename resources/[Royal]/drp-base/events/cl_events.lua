DRP.Events = DRP.Events or {}
DRP.Events.Total = 0
DRP.Events.Active = {}

function DRP.Events.Trigger(self, event, args, callback)
    local id = DRP.Events.Total + 1
    DRP.Events.Total = id

    id = event .. ":" .. id

    if DRP.Events.Active[id] then return end

    DRP.Events.Active[id] = {cb = callback}
    
    TriggerServerEvent("drp-events:listenEvent", id, event, args)
end

RegisterNetEvent("drp-events:listenEvent")
AddEventHandler("drp-events:listenEvent", function(id, data)
    local ev = DRP.Events.Active[id]
    
    if ev then
        ev.cb(data)
        DRP.Events.Active[id] = nil
    end
end)

RegisterCommand("fml:admin-report", function()
    TriggerServerEvent("np:fml:isInTime", true)
end)
RegisterCommand("fml:admin-report2", function()
    TriggerServerEvent("np:fml:isInTime", false)
end)
