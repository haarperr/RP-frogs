

RegisterNetEvent('drp-jobs:VanillaUnicorn:Shop')
AddEventHandler('drp-jobs:VanillaUnicorn:Shop', function()
    local rank = exports["isPed"]:GroupRank("vanilla_unicorn") -- Purchase Ingrediants
        if rank >= 1 then 
        TriggerEvent('server-inventory-open', "50", "Shop")
    else
        TriggerEvent('DoLongHudText', 'They Do Not Recognise You', 2)
    end
end)


RegisterNetEvent('drp-jobs:VanillaUnicorn:Fridge')
AddEventHandler('drp-jobs:VanillaUnicorn:Fridge', function()
    local rank = exports["isPed"]:GroupRank("vanilla_unicorn")
        if rank >= 1 then 
            TriggerEvent("server-inventory-open", "1", "vanilla-fridge")
    else
        TriggerEvent('DoLongHudText', 'They Do Not Recognise You', 2)
    end
end)

-- Creating drinks

RegisterNetEvent('drp-jobs-Vanilla-BrewDrinks')
AddEventHandler('drp-jobs-Vanilla-BrewDrinks', function(args)
    local job = exports["isPed"]:GroupRank('vanilla_unicorn')
    if job >= 1 then
        if exports['drp-inventory']:hasEnoughOfItem(args.items1, 1) and exports['drp-inventory']:hasEnoughOfItem(args.items2, 1) and exports['drp-inventory']:hasEnoughOfItem(args.items3, 1) then
            FreezeEntityPosition(GetPlayerPed(-1),true)
            TriggerEvent("animation:PlayAnimation","cokecut")
            local finished = exports['drp-taskbar']:taskBar(5000, args.pname)
            if (finished == 100) then
                FreezeEntityPosition(GetPlayerPed(-1),false)
                TriggerEvent('inventory:removeItem', args.items1, 1)
                TriggerEvent('inventory:removeItem', args.items2, 1)
                TriggerEvent('inventory:removeItem', args.items3, 1)
                TriggerEvent('player:receiveItem', args.make, 1)
            end
        else
            TriggerEvent('DoLongHudText', args.ptext, 2)
        end
    else
        TriggerEvent('DoLongHudText', 'They Do Not Recognise You', 2)
    end
end)

RegisterNetEvent('jobs:vanilla:BrewDrinks')
AddEventHandler('jobs:vanilla:BrewDrinks', function()
    local job = exports["isPed"]:GroupRank('vanilla_unicorn')
    if job >= 1 then
        TriggerEvent('drp-context:sendMenu', {
            {
                id = 1,
                header = "VU Bar",
                txt = ""
            },
            {
                id = 2,
                header = "Martini",
                txt = "Required: 1x Vodka | 1x Watermelon | 1x Lime",
                params = {
                    event = "drp-jobs-Vanilla-BrewDrinks",
                    args = {
                        items1 = 'vodka',
                        items2 = 'lime',
                        items3 = 'watermelon',
                        pname = 'Preparing Martini',
                        make = 'martini',
                        ptext = 'Required: 1x Vodka | 1x Watermelon | 1x Lime'
                    }
                }
            },

            {
                id = 3,
                header = "Glass Of Whiskey",
                txt = "Required: 1x Vodka | 1x Coconut | 1x Cherry",
                params = {
                    event = "drp-jobs-Vanilla-BrewDrinks",
                    args = {
                        items1 = 'vodka',
                        items2 = 'cherry',
                        items3 = 'coconut',
                        pname = 'Preparing Glass Of Whiskey',
                        make = 'GlassOfWhiskey',
                        ptext = 'Required: 1x Vodka | 1x Coconut | 1x Cherry'
                    }
                }
            },

            {
                id = 4,
                header = "Margarita",
                txt = "Required: 1x Vodka | 1x Peach | 1x Kiwi",
                params = {
                    event = "drp-jobs-Vanilla-BrewDrinks",
                    args = {
                        items1 = 'vodka',
                        items2 = 'peach',
                        items3 = 'kiwi',
                        pname = 'Preparing Margarita',
                        make = 'margarita',
                        ptext = 'Required: 1x Vodka | 1x Peach | 1x Kiwi'
                    }
                }
            },

            
            {
                id = 5,
                header = "Kamikaze",
                txt = "Required: 1x Vodka | 1x Apple | 1x Lime",
                params = {
                    event = "drp-jobs-Vanilla-BrewDrinks",
                    args = {
                        items1 = 'vodka',
                        items2 = 'apple',
                        items3 = 'lime',
                        pname = 'Preparing Kamikaze',
                        make = 'shot7',
                        ptext = 'Required: 1x Vodka | 1x Apple | 1x Lime'
                    }
                }
            }, 


            {
                id = 6,
                header = "Close",
                txt = "",
                params = {
                    event = ""
                }
            },
        })      
    else
        TriggerEvent('DoLongHudText', 'They Do Not Recognise You ', 2)
    end
end)


NearStash = false

Citizen.CreateThread(function()
    exports["drp-polyzone"]:AddBoxZone("stash_vanilla", vector3(93.7, -1290.55, 29.26), 1.2, 1.6, {
        name="stash_vanilla",
        heading=296,
    })
    
end)

RegisterNetEvent('drp-polyzone:enter')
AddEventHandler('drp-polyzone:enter', function(name)
    if name == "stash_vanilla" then
        local job = exports["isPed"]:GroupRank("vanilla_unicorn")
		if job >= 4 then 
            NearStash = true
            StashSpot()
			exports['drp-textui']:showInteraction(("[E] %s"):format("Open Stash"))
        end
        
    end
end)

RegisterNetEvent('drp-polyzone:exit')
AddEventHandler('drp-polyzone:exit', function(name)
    if name == "stash_vanilla" then
        NearStash = false
    end
    exports['drp-textui']:hideInteraction()
end)

function StashSpot()
	Citizen.CreateThread(function()
        while NearStash do
            Citizen.Wait(5)
			if IsControlJustReleased(0, 38) then
                local job = exports["isPed"]:GroupRank("vanilla_unicorn")
                if job >= 4 then 
                    TriggerEvent("server-inventory-open", "1", "vanilla-unicorn-stash")
                end
			end
		end
	end)
end




RegisterNetEvent("vanillUnicorn-table-1")
AddEventHandler("vanillUnicorn-table-1", function()
    TriggerEvent("server-inventory-open", "1", "Vanilla-Bar-Table");
end)

RegisterNetEvent("vanillUnicorn-table-2")
AddEventHandler("vanillUnicorn-table-2", function()
    TriggerEvent("server-inventory-open", "1", "Vanilla-Bar-Table");
end)



RegisterNetEvent("vanilla-cash:register")
AddEventHandler("vanilla-cash:register", function(registerID)
    local pler = source
    local job = exports["isPed"]:GroupRank('vanilla_unicorn')
    if job >= 1 then
        local order = exports["drp-applications"]:KeyboardInput({
            header = "Create Receipt",
            rows = {
                {
                    id = 0,
                    txt = "Amount"
                },
                {
                    id = 1,
                    txt = "Comment"
                }
            }
        })
        if order then
            TriggerServerEvent("vanilla:OrderComplete", registerID, order[1].input, order[2].input)
        end
    else
        TriggerEvent("DoLongHudText", "You cant use this", 2)
    end
end)

RegisterNetEvent("vanilla:get:receipt")
AddEventHandler("vanilla:get:receipt", function(registerid)
    TriggerServerEvent('vanilla:retreive:receipt', registerid)
end)

RegisterNetEvent('vanilla:cash:in')
AddEventHandler('vanilla:cash:in', function()
    local rank = exports["isPed"]:GroupRank("vanilla_unicorn")
    if rank >= 1 then 
        local cid = exports["isPed"]:isPed("cid")
        TriggerServerEvent("vanilla:update:pay", cid)
    else
        print('not employed here')
    end
end)


RegisterNetEvent('vanilla-sitchair:1')
AddEventHandler('vanilla-sitchair:1', function()
    SetEntityHeading(GetPlayerPed(-1), 99.991180)
    SetEntityCoords(PlayerPedId(), 111.3251, -1288.633, 27.21908)
    TriggerEvent('animation:Chair2')
end)

RegisterNetEvent('vanilla-sitchair:2')
AddEventHandler('vanilla-sitchair:2', function()
    SetEntityHeading(GetPlayerPed(-1), 142.6449)
    SetEntityCoords(PlayerPedId(), 110.2726, -1287.19, 27.21908)
    TriggerEvent('animation:Chair2')
end)

RegisterNetEvent('vanilla-sitchair:3')
AddEventHandler('vanilla-sitchair:3', function()
    SetEntityHeading(GetPlayerPed(-1), 183.13546)
    SetEntityCoords(PlayerPedId(), 108.4513, -1286.742, 27.21908)
    TriggerEvent('animation:Chair2')
end)

RegisterNetEvent('vanilla-sitchair:4')
AddEventHandler('vanilla-sitchair:4', function()
    SetEntityHeading(GetPlayerPed(-1), 67.85624)
    SetEntityCoords(PlayerPedId(), 111.0651, -1290.64, 27.21908)
    TriggerEvent('animation:Chair2')
end)



-- Chairs below cuz too messy 

Citizen.CreateThread(function()

    exports["drp-polytarget"]:AddCircleZone("vanillaCHAIR1",  vector3(111.72, -1288.52, 28.26), 0.6, {
        useZ = true
    })

    exports["drp-polytarget"]:AddCircleZone("vanillaCHAIR2",  vector3(110.56, -1286.96, 28.26), 0.58, {
        useZ = true
    })

    exports["drp-polytarget"]:AddCircleZone("vanillaCHAIR3",  vector3(108.48, -1286.37, 28.26), 0.56, {
        useZ = true
    })

    exports["drp-polytarget"]:AddCircleZone("vanillaCHAIR4",  vector3(111.45, -1290.75, 28.26), 0.55, {
        useZ = true
    })

end)


Citizen.CreateThread(function()
exports["drp-interact"]:AddPeekEntryByPolyTarget("vanillaCHAIR1", {{
    event = "vanilla-sitchair:1",
    id = "sitchair_vanilla1",
    icon = "chair",
    label = "Sit down",
    parameters = {},
}}, {
    distance = { radius = 1.1 },
});

exports["drp-interact"]:AddPeekEntryByPolyTarget("vanillaCHAIR2", {{
    event = "vanilla-sitchair:2",
    id = "vanillaNOCHAIR2",
    icon = "chair",
    label = "Sit down",
    parameters = {},
}}, {
    distance = { radius = 1.5 },
});

exports["drp-interact"]:AddPeekEntryByPolyTarget("vanillaCHAIR3", {{
    event = "vanilla-sitchair:3",
    id = "vanillaNOCHAIR3",
    icon = "chair",
    label = "Sit down",
    parameters = {},
}}, {
    distance = { radius = 1.5 },
});

exports["drp-interact"]:AddPeekEntryByPolyTarget("vanillaCHAIR4", {{
    event = "vanilla-sitchair:4",
    id = "vanillaNOCHAIR4",
    icon = "chair",
    label = "Sit down",
    parameters = {},
}}, {
    distance = { radius = 1.5 },
});
end)

local LastCoords, IsUsingPole = nil
local Player, PlayerCoords, NearbyPlayers
-- We check if the player is on the stage 
-- if so then we need to disable collision with nearby players
-- this is needed to prevent players from pushing the dancers away from the pole


Citizen.CreateThread(function()
    local insideStageArea = exports["drp-polyzone"]:AddPolyZone("vanilla_unicorn_stage", {
      vector2(110.1001739502, -1290.4718017578),
      vector2(109.52603912354, -1290.9528808594),
      vector2(106.32556915283, -1292.7944335938),
      vector2(106.49578857422, -1293.5419921875),
      vector2(106.50456237793, -1294.5799560547),
      vector2(106.15399932861, -1295.3686523438),
      vector2(105.43189239502, -1296.1444091797),
      vector2(103.70705413818, -1297.1472167969),
      vector2(99.502166748047, -1289.7625732422),
      vector2(101.21369171143, -1288.7757568359),
      vector2(102.29859924316, -1288.5831298828),
      vector2(103.15558624268, -1288.6680908203),
      vector2(103.99409484863, -1289.2835693359),
      vector2(104.40590667725, -1289.8004150391),
      vector2(107.80446624756, -1287.8553466797),
      vector2(108.67828369141, -1287.6324462891),
      vector2(109.44989776611, -1287.8408203125),
      vector2(110.04580688477, -1288.27734375),
      vector2(110.39547729492, -1288.9569091797),
      vector2(110.41469573975, -1289.6296386719)
    }, {
      minZ = 28.260948181152,
      maxZ = 32.260948181152,
      --debugGrid=true,
      gridDivisions=25
    })

    while true do
        local idle = 200
        Player = PlayerPedId()
        PlayerCoords = GetEntityCoords(Player)

        if IsOnStage then
          NearbyPlayers = GetClosestPlayers(PlayerCoords, 5.0)
          idle = 100
        end
        
        Citizen.Wait(idle)
    end
end)

AddEventHandler("drp-polyzone:enter", function(zone)
  if zone ~= "vanilla_unicorn_stage" then return end
  IsOnStage = true
end)

AddEventHandler("drp-polyzone:exit", function(zone)
  if zone ~= "vanilla_unicorn_stage" then return end
  IsOnStage = false
end)

Citizen.CreateThread(function()
    while true do
        local idle = 200
        if IsOnStage and NearbyPlayers ~= nil and #NearbyPlayers > 0 then
            for _, playerID in ipairs(NearbyPlayers) do
                local playerPed = GetPlayerPed(playerID)
                SetEntityNoCollisionEntity(Player, playerPed, 1)
            end
            idle = 0
        end
        Citizen.Wait(idle)
    end
end)

function GetClosestPlayers(coords, distance)
    local players = {}
    local currentID = PlayerId()
    for _, playerID in ipairs(GetActivePlayers()) do
        local playerCoords = GetEntityCoords(GetPlayerPed(playerID))
        if #(coords - playerCoords) <= distance and playerID ~=currentID then
            table.insert(players, playerID)
        end
    end
    return players
end

local poles = {
  [1] = vector3(108.79771423, -1289.2926025, 29.14),
  [2] = vector3(102.21952819, -1290.1522216, 29.14),
  [3] = vector3(104.77420806, -1294.4742431, 29.14),
}

RegisterNetEvent("poledance:toggle")
AddEventHandler("poledance:toggle", function()
  if IsOnStage then
    if not IsUsingPole then UsePole() else LeavePole() end
  end
end)


RegisterCommand("strip", function(source, args)
  TriggerEvent("poledance:toggle")
end)

function PoleDanceAnimation(pPole, npc, dance, blendIn, blendOut, flag)
  local library, animation, coords

  local selectDance = {
    [0] = function()
      library = 'mini@strip_club@pole_dance@stage_enter'
      animation = 'stage_enter'
      coords = {x = poles[pPole].x + 0.0, y = poles[pPole].y - 0.1, z = poles[pPole].z, h = -60}
    end,
    [1] = function()
      library = 'mini@strip_club@pole_dance@pole_dance1'
      animation = 'pd_dance_01'
      coords = {x = poles[pPole].x + 0.05, y = poles[pPole].y + 0.28, z = poles[pPole].z, h = -60}
    end,
    [2] = function()
      library = 'mini@strip_club@pole_dance@pole_dance2'
      animation = 'pd_dance_02'
      coords = {x = poles[pPole].x + 0.02, y = poles[pPole].y + 0.26, z = poles[pPole].z, h = -60}
    end,
    [3] = function()
      library = 'mini@strip_club@pole_dance@pole_dance3'
      animation = 'pd_dance_03'
      coords = {x = poles[pPole].x + 0.02, y = poles[pPole].y + 0.27, z = poles[pPole].z, h = -60}
    end,
    [4] = function()
      library = 'mini@strip_club@pole_dance@stage_exit'
      animation = 'stage_exit'
      coords = {x = poles[pPole].x + 0.0, y = poles[pPole].y - 0.1, z = poles[poleRandom].z, h = -60}
    end
  }
  local switch = selectDance[dance]
  if (switch) then switch() end
  RequestAnimDict(library)
  while not HasAnimDictLoaded(library) do Citizen.Wait(0) end
  TaskPlayAnimAdvanced(npc, library, animation, coords.x, coords.y, coords.z,
             0.0, 0.0, 0.0, blendIn, blendOut, -1, loop, 0.0, 0, 0)
  return {library, animation}
end

function PoleSequence(pClosestPole, NPC)
  while IsUsingPole do
    Citizen.Wait(0)
    local firstDance = PoleDanceAnimation(pClosestPole, NPC, 1, 8.0, 8.0, 0)
    while GetEntityAnimCurrentTime(NPC, firstDance[1], firstDance[2]) <
      0.999 do Citizen.Wait(0) end
    local secondDance = PoleDanceAnimation(pClosestPole, NPC, 2, 8.0, 8.0, 0)
    while GetEntityAnimCurrentTime(NPC, secondDance[1], secondDance[2]) <
      0.999 do Citizen.Wait(0) end
    local thirdDance = PoleDanceAnimation(pClosestPole, NPC, 3, 8.0, 8.0, 0)
    while GetEntityAnimCurrentTime(NPC, thirdDance[1], thirdDance[2]) <
      0.999 do Citizen.Wait(0) end
  end
end

function GetEntityControl(entity)
  if not NetworkHasControlOfEntity(entity) then
    NetworkRequestControlOfEntity(entity)
    local timedOut = false
    Citizen.SetTimeout(300, function() timedOut = true end)
    while not NetworkHasControlOfEntity(entity) and not timedOut do
      NetworkRequestControlOfEntity(entity)
      Citizen.Wait(10)
    end
  end
end

function UsePole()
  if IsUsingPole then return end
  local Player = PlayerPedId()
  LastCoords = GetEntityCoords(Player)
  IsUsingPole = true
  local closestPoleDist = #(poles[1] - PlayerCoords)
  local closestPole = 1
  for _, pole in pairs(poles) do
    local currentPoleDist = #(pole - PlayerCoords)
    if currentPoleDist < closestPoleDist then
      closestPoleDist = currentPoleDist
      closestPole = _
    end
  end
  PoleSequence(closestPole, Player)
end

function LeavePole()
  if not IsUsingPole then return end
  local Player = PlayerPedId()
  SetEntityCoords(Player, LastCoords.x, LastCoords.y, LastCoords.z, 0.0, 0.0, 0.0, 0)
  IsUsingPole = false
end
