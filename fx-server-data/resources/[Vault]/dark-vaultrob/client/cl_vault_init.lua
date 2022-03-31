exports["drp-polyzone"]:AddBoxZone("vault_lower_pin_code1", vector3(279.57, 230.38, 97.69), 0.6, 0.4, {
    heading = 70,
    minZ = 97.29,
    maxZ = 97.69
})

exports["drp-polyzone"]:AddBoxZone("vault_lower_pin_code2", vector3(289.20, 227.47, 98.90), 0.4, 0.2, {
    heading = 142.81,
    minZ = 98.13,
    maxZ = 98.42
})

exports["drp-polyzone"]:AddBoxZone("vault_lower_pin_code3", vector3(286.83, 227.47, 98.90), 0.4, 0.2, {
    heading = 253.11,
    minZ = 98.13,
    maxZ = 98.42
}, {
    options = {
        {
            event = "dark-vaultrob:lower:secpindoor",
            icon = "fas fa-circle",
            label = "Access Code"
        },
    },
    job = {"all"},
    distance = 2
})

exports["drp-polyzone"]:AddBoxZone("vault_lower_pin_code4", vector3(284.75, 221.69, 98.27), 0.4, 0.2, {
    heading = 70.19,
    minZ = 98.13,
    maxZ = 98.42
}, {
    options = {
        {
            event = "dark-vaultrob:lower:thirdpindoor",
            icon = "fas fa-circle",
            label = "Access Code"
        },
    },
    job = {"all"},
    distance = 2
})

exports["drp-polyzone"]:AddBoxZone("vault_lower_pin_code5", vector3(286.52, 220.17, 98.27), 0.4, 0.2, {
    heading = 175.99,
    minZ = 98.13,
    maxZ = 98.42
}, {
    options = {
        {
            event = "dark-vaultrob:lower:fourthpindoor",
            icon = "fas fa-circle",
            label = "Access Code"
        },
    },
    job = {"all"},
    distance = 2
})

exports["drp-polyzone"]:AddBoxZone("vault_lower_entrance", vector3(266.01, 231.64, 97.68), 5.2, 13.4, {
    name="vault_lower_entrance",
    heading=340,
    --debugPoly=true,
    minZ=96.48,
    maxZ=99.88
})

exports["drp-polyzone"]:AddBoxZone("vault_heist_upper_trolley_1", vector3(259.52, 214.08, 100.683), 0.4, 0.6, {
    name="vault_heist_upper_trolley_1",
    debugPoly=false,
    useZ=true
    }, {
        options = {
            {
                event = "dark-vaultrob:upper:firsttrolley",
                icon = "fas fa-hand-holding",
                label = "Grab It!",
            },
        },
        job = {"all"},
        distance = 1.5
    }
)

exports["drp-polyzone"]:AddBoxZone("vault_heist_upper_trolley_2", vector3(263.709, 215.525, 100.683), 0.4, 0.6, {
    name="vault_heist_upper_trolley_2",
    debugPoly=false,
    useZ=true
    }, {
        options = {
            {
                event = "dark-vaultrob:upper:secondtrolley",
                icon = "fas fa-hand-holding",
                label = "Grab It!",
            },
        },
        job = {"all"},
        distance = 1.5
    }
)

exports["drp-polyzone"]:AddBoxZone("vault_heist_upper_trolley_3", vector3(262.944, 213.291, 100.683), 0.4, 0.6, {
    name="vault_heist_upper_trolley_3",
    debugPoly=false,
    useZ=true
    }, {
        options = {
            {
                event = "dark-vaultrob:upper:thirdtrolley",
                icon = "fas fa-hand-holding",
                label = "Grab!",
            },
        },
        job = {"all"},
        distance = 1.5
    }
)

exports["drp-polyzone"]:AddBoxZone("vault_heist_lower_trolley_1", vector3(309.44, 223.56, 96.73), 0.4, 0.6, {
    name="vault_heist_lower_trolley_1",
    debugPoly=false,
    useZ=true
    }, {
        options = {
            {
                event = "dark-vaultrob:lower:firsttrolley",
                icon = "fas fa-hand-holding",
                label = "Grab!",
            },
        },
        job = {"all"},
        distance = 1.5
    }
)

exports["drp-polyzone"]:AddBoxZone("vault_heist_lower_trolley_2", vector3(306.14, 219.41, 96.73), 0.4, 0.6, {
    name="vault_heist_lower_trolley_2",
    debugPoly=false,
    useZ=true
    }, {
        options = {
            {
                event = "dark-vaultrob:lower:thirdlwtrolley",
                icon = "fas fa-hand-holding",
                label = "Grab!",
            },
        },
        job = {"all"},
        distance = 1.5
    }
)

exports["drp-polyzone"]:AddBoxZone("vault_heist_lower_trolley_3", vector3(292.93, 218.6, 96.73), 0.4, 0.6, {
    name="vault_heist_lower_trolley_3",
    debugPoly=false,
    useZ=true
    }, {
        options = {
            {
                event = "dark-vaultrob:lower:fourthlwtrolley",
                icon = "fas fa-hand-holding",
                label = "Grab!",
            },
        },
        job = {"all"},
        distance = 1.5
    }
)

exports["drp-polyzone"]:AddBoxZone("vault_heist_lower_trolley_4", vector3(299.32, 217.47, 96.73), 0.4, 0.6, {
    name="vault_heist_lower_trolley_4",
    debugPoly=false,
    useZ=true
    }, {
        options = {
            {
                event = "dark-vaultrob:lower:sextrolley",
                icon = "fas fa-hand-holding",
                label = "Grab!",
            },
        },
        job = {"all"},
        distance = 1.5
    }
)

exports["drp-polyzone"]:AddBoxZone("vault_heist_lower_trolley_5", vector3(299.80, 228.1, 96.75), 0.4, 0.6, {
    name="vault_heist_lower_trolley_5",
    debugPoly=false,
    useZ=true
    }, {
        options = {
            {
                event = "dark-vaultrob:lower:seclwtrolley",
                icon = "fas fa-hand-holding",
                label = "Grab!",
            },
        },
        job = {"all"},
        distance = 1.5
    }
)

exports["drp-polyzone"]:AddBoxZone("vault_heist_lower_trolley_6", vector3(302.41, 209.97, 96.73), 0.4, 0.6, {
    name="vault_heist_lower_trolley_6",
    debugPoly=false,
    useZ=true
    }, {
        options = {
            {
                event = "dark-vaultrob:lower:sixthlwtrolley",
                icon = "fas fa-hand-holding",
                label = "Grab!",
            },
        },
        job = {"all"},
        distance = 1.5
    }
)

local dispatchsend = false

RegisterCommand("blackout", function()
    if not blackout then
        blackout = true
        print('blackout', blackout)
    elseif blackout then
        blackout = false
        print('blackout', blackout)
    end
end)

AddEventHandler("drp-polyzone:enter", function(name)
    if name == "vault_lower_entrance" then
        while true do
            if not dispatchsend then
                if not blackout then
                dispatchsend = true
                TriggerEvent('blz-alerts:vaultlowewrlasersrobbeydis') --ur dispatch event
                TriggerEvent('blz-alerts:vaultlowewrlasersrobbey') --ur dispatch event
                Wait(25000)
                dispatchsend = false
                end
            end
            break
        end
    end
end)