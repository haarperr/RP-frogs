Citizen.CreateThread(
    function()
        -------- Police --------

        AddBoxZone("airone_mrpd", vector3(442.16, -974.79, 43.69), 1.8, 1.4, {
            name="mrpd_airone",
            heading=50,
            minZ=43.64,
            maxZ=44.64
        }, {
            options = {
                {
                    event = "drp-duty:aironemrpd",
                    icon = "fas fa-helicopter",
                    label = "PD AIR GARAGE"
                },
            },
            job = {"police", "sheriff", "state"},
            distance = 1.5
        })

        AddBoxZone("sandy_bcso", vector3(1839.37, 3639.35, 35.7), 1.2, 1, {
            name="sandy_bcso",
            heading=300,
            minZ=35.3,
            maxZ=36.7
        }, {
            options = {
                {
                    event = "drp-duty:aironesandybcso",
                    icon = "fas fa-helicopter",
                    label = "PD AIR GARAGE"
                },
            },
            job = {"police", "sheriff", "state"},
            distance = 1.5
        })

        --AddBoxZone("spin-wheel", vector3(1109.48, 229.35, -49.64), 0.5, 0.5, {
        --    name="spin-wheel",
        --    heading=35,
        --    minZ=-52.84,
        --    maxZ=-48.84
        --}, {
        --    options = {
        --        {
        --            event = "attempt:spin-in",
        --            icon = "fas fa-money-bill-wave",
        --            label = "Spin Wheel ($500)",
        --        },
--
        --        {
        --            event = "attempt:change:spin",
        --            icon = "fas fa-adjust",
        --            label = "Enable/Disable!",
        --        },
--
--
        --    },
        --    job = {"all"},
        --    distance = 4.0
        --})

    AddBoxZone("paleto_state", vector3(-486.36, 5998.05, 31.33), 1.2, 1, {
        name="paleto_state",
        heading=315,
        minZ=29.73,
        maxZ=32.53
        }, {
            options = {
                {
                    event = "drp-duty:aironepaletostate",
                    icon = "fas fa-helicopter",
                    label = "PD AIR GARAGE"
                },
            },
            job = {"police", "sheriff", "state"},
            distance = 1.5
        })

    AddBoxZone("pillbox_garage", vector3(340.21, -582.58, 28.8), 1.2, 1.45, {
        name="PillboxGarage",
        heading=339,
        minZ=28.65,
        maxZ=29.85
        }, {
            options = {
                {
                    event = "drp-garages:openBuyMenu2",
                    icon = "fas fa-car",
                    label = "Pillbox Medical Garage"
                },
            },
            job = {"ems"},
            distance = 1.5
        })    

--- Dumpsters

        --dumpster--
        local Dumpster = {
            218085040,
   
        }

        AddTargetModel(Dumpster,
            {
                options = {
                    {
                        event = "drp-dumpster",
                        icon = "fas fa-trash-alt",
                        label = "Dumpster Dive"
                    }
                },
                job = {"all"},
                distance = 1.5
            }
        )

        local Dumpster = {
            -58485588,
   
        }

        AddTargetModel(Dumpster,
            {
                options = {
                    {
                        event = "drp-dumpster2",
                        icon = "fas fa-trash-alt",
                        label = "Dumpster Dive"
                    }
                },
                job = {"all"},
                distance = 1.5
            }
        )

        local Dumpster = {
            666561306,
   
        }

        AddTargetModel(Dumpster,
            {
                options = {
                    {
                        event = "drp-dumpster3",
                        icon = "fas fa-trash-alt",
                        label = "Dumpster Dive"
                    }
                },
                job = {"all"},
                distance = 1.5
            }
        )        
    end)















    ---- AIR ONE GARAGE EVENTS

    RegisterNetEvent('drp-duty:aironemrpd')
AddEventHandler('drp-duty:aironemrpd', function()
	TriggerEvent('drp-context:sendMenu', {
        {
            id = 1,
            header = "MRPD Air Garage ",
            txt = ""
        },
        {
            id = 2,
            header = "Phoenix 1 Garage",
			txt = "LSPD CERTIFIED ONLY!",
			params = {
                event = "police:phoenix1mrpd"
            }
        },
		{
            id = 3,
            header = "Gurdian 1 Garage",
			txt = "BCSO CERTIFIED ONLY!",
			params = {
                event = "police:gurdian1mrpd"
            }
        },
    })
end)

RegisterNetEvent('drp-duty:aironesandybcso')
AddEventHandler('drp-duty:aironesandybcso', function()
	TriggerEvent('drp-context:sendMenu', {
        {
            id = 1,
            header = "BCSO Air Garage ",
            txt = ""
        },
        {
            id = 2,
            header = "Phoenix 1 Garage",
			txt = "LSPD CERTIFIED ONLY!",
			params = {
                event = "police:phoenix1bcso"
            }
        },
		{
            id = 3,
            header = "Gurdian 1 Garage",
			txt = "BCSO CERTIFIED ONLY!",
			params = {
                event = "police:gurdian1bcso"
            }
        },
    })
end)

RegisterNetEvent('drp-duty:aironepaletostate')
AddEventHandler('drp-duty:aironepaletostate', function()
	TriggerEvent('drp-context:sendMenu', {
        {
            id = 1,
            header = "PALETO Air Garage ",
            txt = ""
        },
        {
            id = 2,
            header = "Phoenix 1 Garage",
			txt = "LSPD CERTIFIED ONLY!",
			params = {
                event = "police:phoenix1paleto"
            }
        },
		{
            id = 3,
            header = "Gurdian 1 Garage",
			txt = "BCSO CERTIFIED ONLY!",
			params = {
                event = "police:gurdian1paleto"
            }
        },
    })
end)