DRP.Commands = DRP.Commands or {}
DRP.Commands.Registered = DRP.Commands.Registered or {}

AddEventHandler("drp-base:exportsReady", function()
    addModule("Commands", DRP.Commands)
end)
