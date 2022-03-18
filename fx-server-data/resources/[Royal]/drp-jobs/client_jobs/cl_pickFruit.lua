local nearPicking = false
local isSignedOn = false

local currentTreeStatus = {
	["Ready"] = 1,
}

Citizen.CreateThread(function()
    exports["drp-polyzone"]:AddBoxZone("pickingarea:civjob", vector3(233.05, 6510.96, 30.08), 113.6, 31.0, {
		name="pickingarea:civjob",
		heading=279,
    }) 

    -- Clock on

    exports["drp-polyzone"]:AddCircleZone("pickfruit:clock-ON", vector3(291.11, 6519.55, 29.81), 1.05, {
		name="pickingarea:civjob",
		heading=279,
    }) 
end)

RegisterNetEvent('drp-polyzone:enter')
AddEventHandler('drp-polyzone:enter', function(name)
    if name == "pickingarea:civjob" then
        -- local rank = exports["isPed"]:GroupRank("winery")
		-- if rank > 0 then 
            nearPicking = true

			exports['drp-textui']:showInteraction(("[E] %s"):format("In Zone"))
        end
    -- end
end)


-- RegisterNetEvent('drp-polyzone:exit')
-- AddEventHandler('drp-polyzone:exit', function(name)
--     if name == "pickingarea:civjob" then
--         nearPicking = false
--     end
--     TriggerEvent('DoLongHudText', 'Work zone left.. Clocked out ! ', 2)

-- end)

RegisterNetEvent('drp-jobs:startpick')
AddEventHandler('drp-jobs:startpick', function()
                    if nearPicking then
                    local ped = PlayerPedId()
                        LoadAnim('mp_common_heist')
                        FreezeEntityPosition(ped,true)
                        Citizen.Wait(500)
                        ClearPedTasksImmediately(ped)
                        TaskPlayAnim(ped, "mp_common_heist", 'use_terminal_loop', 2.0, 2.0, -1, 1, 0, true, true, true)
                        local finished = exports['drp-taskbar']:taskBar(math.random(5000, 10000), 'Picking Grapes')
                        if (finished == 100) then
                            local chance = math.random(0, 1)
                            FreezeEntityPosition(ped,false)
                            if chance == 0 then
                                TriggerEvent('player:receiveItem', 'green_grapes')
                            elseif chance == 1 then 
                                TriggerEvent('player:receiveItem', 'purple_grapes')
                            end
                        else
                            FreezeEntityPosition(ped,false)
                        end
                    end
                end)



        RegisterNetEvent('checktree')
        AddEventHandler('checktree', function()
            if currentTreeStatus["Ready"] == 1 then
            TriggerEvent('drp-context:sendMenu', {
                {
                    id = 1,
                    header = "Current Tree Status : Not Ready",
                    txt = ""
                },
                {
                    id = 2,
                    header = "Unavailable",
                    txt = "",
                    params = {
                        event = "xxxxxxxx"
                    }
                },
                
            })
        else
            if currentTreeStatus["Ready"] >= 2 then
            TriggerEvent('drp-context:sendMenu', {
                {
                    id = 1,
                    header = "Current Tree Status : 2% Ready",
                    txt = ""
                },
                {
                    id = 2,
                    header = "Unavailable",
                    txt = "",
                    params = {
                        event = "xxxxxxxx"
                    }
                },
                
            })
        end
    end
end)


RegisterNetEvent('start-picking:Apples')
AddEventHandler('start-picking:Apples', function(name)
    if isSignedOn then
    TriggerEvent('checktree')
    else
        TriggerEvent('DoShortHudText' , 'Not clocked in',2)
    end
end)

function LoadAnim(animDict)
	RequestAnimDict(animDict)
	while not HasAnimDictLoaded(animDict) do
		Citizen.Wait(10)
	end
end



RegisterNetEvent('drp-pickfruit:ClockONmenu')
AddEventHandler('drp-pickfruit:ClockONmenu', function()
    if isSignedOn then
        TriggerEvent('drp-context:sendMenu', {
            {
                id = 1,
                header = "Pick Fruit",
                txt = ""
            },
            {
                id = 2,
                header = "Clock Off",
                txt = "",
                params = {
                    event = "drp-pickfruit:DoSignOnStuff"
                }
            },
            
        })
    else
        TriggerEvent('drp-context:sendMenu', {
            {
                id = 1,
                header = "Pick Fruit",
                txt = ""
            },
            {
                id = 2,
                header = "Clock On",
                txt = "",
                params = {
                    event = "drp-pickfruit:DoSignOnStuff"
                }
            },
            
        })
    end
end)

RegisterNetEvent('drp-pickfruit:DoSignOnStuff')
AddEventHandler('drp-pickfruit:DoSignOnStuff', function()
    if isSignedOn then
        isSignedOn = false
        TriggerEvent('DoShortHudText', 'Clocked Out',2)
    else 
        isSignedOn = true
        TriggerEvent('DoShortHudText', 'Clocked In')
    end
end)


 Citizen.CreateThread(function()
	while true do
		Wait(90000)
		if currentTreeStatus["Ready"] >= 0 and nearPicking then
			print(currentTreeStatus["Ready"])
			if currentTreeStatus["Ready"] >= 0 and nearPicking then
				currentTreeStatus["Ready"] = currentTreeStatus["Ready"] + 1
			else
				currentTreeStatus["Ready"] = currentTreeStatus["Ready"] - 2.5
			end
        end
    end
end)


Citizen.CreateThread(function()
       
    exports["drp-polytarget"]:AddCircleZone("tree1",  vector3(280.57, 6531.12, 30.21), 2.15, {
         useZ = true
     })
 
     exports["drp-polytarget"]:AddCircleZone("tree1",  vector3(281.62, 6518.38, 30.2), 3.2, {
         useZ = true
     })
 
     exports["drp-polytarget"]:AddCircleZone("tree1",  vector3(282.27, 6506.57, 30.16), 2.85, {
         useZ = true
     })
 
     exports["drp-polytarget"]:AddCircleZone("tree1",  vector3(270.47, 6530.86, 30.45), 3.05, {
         useZ = true
     })
 
     exports["drp-polytarget"]:AddCircleZone("tree1",  vector3(272.39, 6518.7, 30.43), 2.95, {
         useZ = true
     })
 
     exports["drp-polytarget"]:AddCircleZone("tree1",  vector3(273.25, 6507.96, 30.4), 2.95, {
         useZ = true
     })
 
     exports["drp-polytarget"]:AddCircleZone("tree1",  vector3(262.6, 6516.46, 30.69), 2.85, {
         useZ = true
     })
 
     exports["drp-polytarget"]:AddCircleZone("tree1",  vector3(264.08, 6506.44, 30.68), 2.85, {
         useZ = true
     })
 
     exports["drp-polytarget"]:AddCircleZone("tree1",  vector3(261.88, 6527.42, 30.71), 2.9, {
         useZ = true
     })
 
     exports["drp-polytarget"]:AddCircleZone("tree1",  vector3(256.06, 6504.01, 30.86), 2.55, {
         useZ = true
     })
 
     exports["drp-polytarget"]:AddCircleZone("tree1",  vector3(253.84, 6514.0, 30.92), 2.45, {
         useZ = true
     })
 
     exports["drp-polytarget"]:AddCircleZone("tree1",  vector3(251.9, 6527.91, 30.97), 2.9, {
         useZ = true
     })
 
     exports["drp-polytarget"]:AddCircleZone("tree1",  vector3(246.83, 6503.43, 31.07), 2.7, {
         useZ = true
     })
 
     exports["drp-polytarget"]:AddCircleZone("tree1",  vector3(244.68, 6515.78, 31.09), 2.6, {
         useZ = true
     })
 
     exports["drp-polytarget"]:AddCircleZone("tree1",  vector3(242.84, 6526.23, 31.12), 2.55, {
         useZ = true
     })
 
     exports["drp-polytarget"]:AddCircleZone("tree1",  vector3(233.27, 6524.78, 31.23), 3.0, {
         useZ = true
     })
     exports["drp-polytarget"]:AddCircleZone("tree1",  vector3(234.64, 6513.03, 31.23), 2.5, {
         useZ = true
     })
     exports["drp-polytarget"]:AddCircleZone("tree1",  vector3(236.84, 6501.76, 31.2), 2.3, {
         useZ = true
     })
     exports["drp-polytarget"]:AddCircleZone("tree1",  vector3(227.99, 6502.16, 31.31), 2.65, {
         useZ = true
     })
 
     exports["drp-polytarget"]:AddCircleZone("tree1",  vector3(226.02, 6512.13, 31.33), 2.8, {
         useZ = true
     })
 
     exports["drp-polytarget"]:AddCircleZone("tree1",  vector3(223.93, 6523.38, 31.35), 2.65, {
         useZ = true
     })
 
     exports["drp-polytarget"]:AddCircleZone("tree1",  vector3(217.98, 6510.09, 31.39), 2.45, {
         useZ = true
     })
 
     exports["drp-polytarget"]:AddCircleZone("tree1",  vector3(220.02, 6499.39, 31.39), 2.6, {
         useZ = true
     })
 
     exports["drp-interact"]:AddPeekEntryByPolyTarget("pickfruit:clock-ON", {{
         event = "drp-pickfruit:ClockONmenu",
         id = "clock-ON",
         icon = "circle",
         label = "Clock On !",
         parameters = {},
     }}, {
         distance = { radius = 2.5 },
     });

     exports["drp-interact"]:AddPeekEntryByPolyTarget("tree1", {{
        event = "checktree",
        id = "treenumber1",
        icon = "circle",
        label = "Begin Picking !",
        parameters = {},
    }}, {
        distance = { radius = 1.5 },
    });

    
 end)
