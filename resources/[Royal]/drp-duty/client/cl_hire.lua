-- POLICE HIRE/FIRE --

RegisterNetEvent("drp-duty:HireLaw:Menu")
AddEventHandler("drp-duty:HireLaw:Menu", function()
    local valid = exports["drp-applications"]:KeyboardInput({
        header = "Hire Menu",
        rows = {
            {
                id = 0,
                txt = "Enter CID"
            },
            {
                id = 1,
                txt = "Enter Department"
            },
            {
                id = 2,
                txt = "Enter Rank"
            },
        }
    })
    if valid then
        TriggerServerEvent("drp-duty:HireLaw", valid[1].input, valid[2].input, valid[3].input)
    end
end)

RegisterNetEvent("drp-duty:FireLaw:Menu")
AddEventHandler("drp-duty:FireLaw:Menu", function()
    local valid = exports["drp-applications"]:KeyboardInput({
        header = "Fire Menu",
        rows = {
            {
                id = 0,
                txt = "Enter CID"
            },
        }
    })
    if valid then
        TriggerServerEvent("drp-duty:FireLaw", valid[1].input)
    end
end)

-- END POLICE HIRE/FIRE --

-- EMS HIRE/FIRE --

RegisterNetEvent("drp-duty:HireEMS:Menu")
AddEventHandler("drp-duty:HireEMS:Menu", function()
    local valid = exports["drp-applications"]:KeyboardInput({
        header = "Hire Menu",
        rows = {
            {
                id = 0,
                txt = "Enter CID"
            },
            {
                id = 1,
                txt = "Enter Rank"
            },
        }
    })
    if valid then
        TriggerServerEvent("drp-duty:HireEMS", valid[1].input, valid[2].input)
    end
end)

RegisterNetEvent("drp-duty:FireEMS:Menu")
AddEventHandler("drp-duty:FireEMS:Menu", function()
    local valid = exports["drp-applications"]:KeyboardInput({
        header = "Fire Menu",
        rows = {
            {
                id = 0,
                txt = "Enter CID"
            },
        }
    })
    if valid then
        TriggerServerEvent("drp-duty:FireEMS", valid[1].input)
    end
end)

-- END EMS HIRE/FIRE --