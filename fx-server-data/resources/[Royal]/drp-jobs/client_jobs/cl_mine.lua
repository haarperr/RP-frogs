
--// Start With Axe

RegisterNetEvent('drp-start-mining')
AddEventHandler('drp-start-mining', function()
    if RoyalMiningZone then
        TriggerEvent('drp-civjobs-mining')
    else
        TriggerEvent('DoLongHudText', 'You are not in the Mining Zone', 2)
    end
end)

local currentlyMining = false
local pFarmed = 0

RegisterNetEvent("drp-civjobs-mining")
AddEventHandler("drp-civjobs-mining", function()
	if exports["drp-inventory"]:hasEnoughOfItem("miningpickaxe",1,false) and not currentlyMining then 
        currentlyMining = true
        local playerPed = PlayerPedId()
        local coords = GetEntityCoords(playerPed)
            FreezeEntityPosition(playerPed, true)
            SetCurrentPedWeapon(playerPed, GetHashKey('WEAPON_UNARMED'))
            Citizen.Wait(200)
            local pickaxe = GetHashKey("prop_tool_pickaxe")
            
            -- Loads Pickaxe
            RequestModel(pickaxe)
            while not HasModelLoaded(pickaxe) do
            Wait(1)
            end
            
            local anim = "melee@hatchet@streamed_core_fps"
            local action = "plyr_front_takedown"
            
            -- Loads Anims
            RequestAnimDict(anim)
            while not HasAnimDictLoaded(anim) do
                Wait(1)
            end
            
            local object = CreateObject(pickaxe, coords.x, coords.y, coords.z, true, false, false)
            AttachEntityToEntity(object, playerPed, GetPedBoneIndex(playerPed, 57005), 0.1, 0.0, 0.0, -90.0, 25.0, 35.0, true, true, false, true, 1, true)
            TaskPlayAnim(PlayerPedId(), anim, action, 3.0, -3.0, -1, 31, 0, false, false, false)
            local finished = exports["drp-ui"]:taskBarSkill(5000,math.random( 200,400 ))
            if (finished == 100) then
                local finished = exports["drp-ui"]:taskBarSkill(5000,math.random( 200,400 ))
                if (finished == 100) then
                    local finished = exports["drp-ui"]:taskBarSkill(5000,math.random( 200,400 ))
                    if (finished == 100) then
                        TriggerEvent('drp-civjobs:mines-items')
                        pFarmed = pFarmed + 1    
                    else
                        TriggerEvent("DoLongHudText", "Failed", 2)
                        currentlyMining = false
                        ClearPedTasks(PlayerPedId())
                        FreezeEntityPosition(playerPed, false)
                        DeleteObject(object)
                    
                    end
                else
                    TriggerEvent("DoLongHudText", "Failed", 2)
                    currentlyMining = false
                    ClearPedTasks(PlayerPedId())
                    FreezeEntityPosition(playerPed, false)
                    DeleteObject(object)
                
                end        
            else
                TriggerEvent("DoLongHudText", "Failed", 2)
                currentlyMining = false
                ClearPedTasks(PlayerPedId())
                FreezeEntityPosition(playerPed, false)
                DeleteObject(object)
            
            end
            currentlyMining = false
            ClearPedTasks(PlayerPedId())
            FreezeEntityPosition(playerPed, false)
            DeleteObject(object)
    else
		TriggerEvent('DoLongHudText', 'You need a pickaxe to mine', 2)
    end
end)

--// Events to get items

RegisterNetEvent('drp-civjobs:mines-items', function()
    local roll = math.random(8)
        if roll == 1 then
            TriggerEvent('DoLongHudText', 'You found nothing', 2)
        elseif roll == 2 then
            TriggerEvent('player:receiveItem', 'jadeite', 1)
            TriggerEvent('DoLongHudText', 'You found some jadeite!', 1)
        elseif roll == 3 then
            TriggerEvent('player:receiveItem', 'ruby', 1)
            TriggerEvent('DoLongHudText', 'You found a ruby!', 1)
        elseif roll == 4 then
            TriggerEvent('player:receiveItem', 'steel', math.random(1, 3))
            TriggerEvent('DoLongHudText', 'You found some steel!', 1)
        elseif roll == 5 then
            TriggerEvent('player:receiveItem', 'aluminium', math.random(1, 3))
            TriggerEvent('DoLongHudText', 'You found some aluminium!', 1)
        elseif roll == 6 then
            TriggerEvent('player:receiveItem', 'copper', math.random(1, 3))
            TriggerEvent('DoLongHudText', 'You found some copper!', 1)
        elseif roll == 7 then
            local ore math.random(1,3)
            if ore == 3 then
            TriggerEvent('player:receiveItem', 'gallerygem', 1)
            TriggerEvent('DoLongHudText', 'You found a gemstone!', 1)
            else
                TriggerEvent('player:receiveItem', 'copper', 1)
                TriggerEvent('DoLongHudText', 'You found some copper!', 1)
            end
        elseif roll == 8 then
            local ore math.random(1,5)
            local ore2 math.random(1,5)
            if ore == 5 then
            TriggerEvent('player:receiveItem', 'uruore', 1)
            TriggerEvent('DoLongHudText', 'You found Uwu Ore!', 1)
           
            if ore2 == 5 then
                TriggerEvent('player:receiveItem', 'uruore', 5)
                TriggerEvent('DoLongHudText', 'You found an Uwu ore vein!', 1)
            end
            else
                TriggerEvent('DoLongHudText', 'You found nothing', 2)
            end
         end
    end)

--// Polyzone

RoyalMiningZone = false

Citizen.CreateThread(function()
    exports["drp-polyzone"]:AddBoxZone("mining_zone", vector3(-592.1, 2075.5, 131.38), 25, 4, {
        name="mining_zone",
        heading=15,
        minZ=129.18,
        maxZ=133.18
    })
end)

RegisterNetEvent('drp-polyzone:enter')
AddEventHandler('drp-polyzone:enter', function(name)
    if name == "mining_zone" then
        RoyalMiningZone = true     
       -- print("^2[Royal Mining] In Zone^0")
        exports['drp-textui']:showInteraction("Mining")
    end
end)

RegisterNetEvent('drp-polyzone:exit')
AddEventHandler('drp-polyzone:exit', function(name)
    if name == "mining_zone" then
        RoyalMiningZone = false  
       -- print("^2[Royal Mining] Left Zone^0")  
        exports['drp-textui']:hideInteraction()
    end
end)

--// Peds

function setMiningSalesPeds()
    modelHash = GetHashKey("a_m_y_stwhi_02")
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
        Wait(1)
    end
    created_ped = CreatePed(0, modelHash , -1463.947265625, -182.22857666016, 48.82568359375  -1, true)
    FreezeEntityPosition(created_ped, true)
    SetEntityHeading(created_ped, 34.015747070312)
    SetEntityInvincible(created_ped, true)
    SetBlockingOfNonTemporaryEvents(created_ped, true)
    TaskStartScenarioInPlace(created_ped, "WORLD_HUMAN_CLIPBOARD", 0, true)
end

Citizen.CreateThread(function()
    setMiningSalesPeds()
end)

--// Sell Mining Items

RegisterNetEvent('drp-civjobs:sell-mininggem')
AddEventHandler('drp-civjobs:sell-mininggem', function()    
    local toSell = exports["drp-inventory"]:getAmountOfItem("jadeite")
    TriggerEvent('inventory:removeItem', 'jadeite', toSell)
    TriggerServerEvent('drp-civjobs:sell-gem-cash', toSell)
end)

RegisterNetEvent('drp-civjobs:sell-stone')
AddEventHandler('drp-civjobs:sell-stone', function()
    local toSell = exports["drp-inventory"]:getAmountOfItem("ruby")
    TriggerEvent('inventory:removeItem', 'ruby', toSell)
    TriggerServerEvent('drp-civjobs:sell-stone-cash', toSell)
end)

RegisterNetEvent('drp-civjobs:sell-coal')
AddEventHandler('drp-civjobs:sell-coal', function()
    local toSell = exports["drp-inventory"]:getAmountOfItem("steel")
    TriggerEvent('inventory:removeItem', 'steel', toSell)
    TriggerServerEvent('drp-civjobs:sell-coal-cash', toSell)
end)

RegisterNetEvent('drp-civjobs:sell-diamonds')
AddEventHandler('drp-civjobs:sell-diamonds', function()
    local toSell = exports["drp-inventory"]:getAmountOfItem("aluminium")
    TriggerEvent('inventory:removeItem', 'aluminium', toSell)
    TriggerServerEvent('drp-civjobs:sell-diamond-cash', toSell)
end)

RegisterNetEvent('drp-civjobs:sell-sapphire')
AddEventHandler('drp-civjobs:sell-sapphire', function()
    local toSell = exports["drp-inventory"]:getAmountOfItem("copper")
    TriggerEvent('inventory:removeItem', 'copper', toSell)
    TriggerServerEvent('drp-civjobs:sell-sapphire-cash', toSell)
end)

RegisterNetEvent('drp-civjobs:sell-ruby')
AddEventHandler('drp-civjobs:sell-ruby', function()
    local toSell = exports["drp-inventory"]:getAmountOfItem("uwuore")
    TriggerEvent('inventory:removeItem', 'uwuore', toSell)
    TriggerServerEvent('drp-civjobs:sell-ruby-cash', toSell)
end)