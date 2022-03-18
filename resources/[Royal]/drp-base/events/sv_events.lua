DRP.Events = DRP.Events or {}
DRP.Events.Registered = DRP.Events.Registered or {}

RegisterServerEvent("drp-events:listenEvent")
AddEventHandler("drp-events:listenEvent", function(id, name, args)
    local src = source

    if not DRP.Events.Registered[name] then return end

    DRP.Events.Registered[name].f(DRP.Events.Registered[name].mod, args, src, function(data)
        TriggerClientEvent("drp-events:listenEvent", src, id, data)
    end)
end)

function DRP.Events.AddEvent(self, module, func, name)
    DRP.Events.Registered[name] = {
        mod = module,
        f = func
    }
end