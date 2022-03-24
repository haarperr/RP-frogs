

--// Tuner Shop Stash

RoyalTunerShopDoc = false

Citizen.CreateThread(function()
    exports["drp-polyzone"]:AddBoxZone("tuner_shop_docs_stash", vector3(128.46, -3014.08, 7.04), 2.5, 2.5, {
        name="tuner_shop_docs_stash",
        heading=0,
        debugPoly=false,
        minZ=5.04,
        maxZ=9.04
    })
end)

RegisterNetEvent('drp-polyzone:enter')
AddEventHandler('drp-polyzone:enter', function(name)
    if name == "tuner_shop_docs_stash" then
        RoyalTunerShopDoc = true     
        TunerShopStash()
            local rank = exports["isPed"]:GroupRank("tuner_shop")
            if rank > 1 then 
            exports['drp-textui']:showInteraction("[E] Stash")
        end
    end
end)

RegisterNetEvent('drp-polyzone:exit')
AddEventHandler('drp-polyzone:exit', function(name)
    if name == "tuner_shop_docs_stash" then
        RoyalTunerShopDoc = false
        exports['drp-textui']:hideInteraction()
    end
end)

function TunerShopStash()
	Citizen.CreateThread(function()
        while RoyalTunerShopDoc do
            Citizen.Wait(5)
			if IsControlJustReleased(0, 38) then
                    local rank = exports["isPed"]:GroupRank("tuner_shop")
                    if rank > 1 then 
                    TriggerEvent('tuner:stash:docs')
                end
			end
		end
	end)
end

RegisterNetEvent('tuner:stash:docs')
AddEventHandler('tuner:stash:docs', function()
    local job = exports["isPed"]:GroupRank('tuner_shop')
    if job >= 2 then
		TriggerEvent("server-inventory-open", "1", "storage-tuner-docs")
		Wait(1000)
	end
end)


--------------------------------------------------------------------------------------------------------------------

 RegisterNetEvent('drp-civjobs:craft-lockpick')
 AddEventHandler('drp-civjobs:craft-lockpick', function()
     if exports['drp-inventory']:hasEnoughOfItem('steel', 2) then
         TriggerEvent('inventory:removeItem', 'steel', 2)
         TriggerEvent('player:receiveItem', 'lockpick', 1)
         TriggerEvent('DoLongHudText', 'Successfully crafted Lockpick', 1)
     else
         TriggerEvent('DoLongHudText', 'You dont have 2x Steel', 2)
     end
 end)

 RegisterNetEvent('drp-civjobs:craft-advlockpick')
 AddEventHandler('drp-civjobs:craft-advlockpick', function()
     if exports['drp-inventory']:hasEnoughOfItem('refinedaluminium', 15) and exports['drp-inventory']:hasEnoughOfItem('refinedplastic', 12) and exports['drp-inventory']:hasEnoughOfItem('refinedrubber', 15) then
         TriggerEvent('inventory:removeItem', 'refinedaluminium', 15)
         TriggerEvent('inventory:removeItem', 'refinedplastic', 12)
         TriggerEvent('inventory:removeItem', 'refinedrubber', 15)
         TriggerEvent('player:receiveItem', 'advlockpick', 1)
         TriggerEvent('DoLongHudText', 'Successfully crafted Advanced Lockpick', 1)
     else
         TriggerEvent('DoLongHudText', 'You do not have the required materials', 2)
     end
 end)

 RegisterNetEvent('drp-civjobs:craft-repairkit')
 AddEventHandler('drp-civjobs:craft-repairkit', function()
    if exports['drp-inventory']:hasEnoughOfItem('electronics', 25) then
         TriggerEvent('inventory:removeItem', 'electronics', 25)
         TriggerEvent('player:receiveItem', 'advrepairkit', 1)
         TriggerEvent('DoLongHudText', 'Successfully crafted Advanced Repair Kit', 1)
     else
         TriggerEvent('DoLongHudText', 'You dont have the required materials', 2)
     end
 end)

 RegisterNetEvent('drp-civjobs:craft-tyre-repairkit')
 AddEventHandler('drp-civjobs:craft-tyre-repairkit', function()
     if exports['drp-inventory']:hasEnoughOfItem('refinedaluminium', 10) then
    TriggerEvent('inventory:removeItem', 'refinedaluminium', 25)
    TriggerEvent('player:receiveItem', 'asslockpick', 1)
     else
         TriggerEvent('DoLongHudText', 'Successfully crafted Ass Lockpick', 2)
     end
 end)

 -- GUN CRAFTING
 RegisterNetEvent('drp-civjobs:craft-pammo')
 AddEventHandler('drp-civjobs:craft-pammo', function()
     if exports['drp-inventory']:hasEnoughOfItem('aluminium', 5) and exports['drp-inventory']:hasEnoughOfItem('steel', 5) then
    TriggerEvent('inventory:removeItem', 'aluminium', 5)
    TriggerEvent('inventory:removeItem', 'steel', 5)
    TriggerEvent('player:receiveItem', 'pistolammo', 1)
    TriggerEvent('DoLongHudText', 'Successfully crafted Pistol Ammo', 2)
     else
        TriggerEvent('DoLongHudText', 'You dont have the required materials', 2)
     end
 end)
 RegisterNetEvent('drp-civjobs:craft-subammo')
 AddEventHandler('drp-civjobs:craft-subammo', function()
    if exports['drp-inventory']:hasEnoughOfItem('aluminium', 5) and exports['drp-inventory']:hasEnoughOfItem('steel', 5) then
        TriggerEvent('inventory:removeItem', 'aluminium', 5)
        TriggerEvent('inventory:removeItem', 'steel', 5)
        TriggerEvent('player:receiveItem', 'subammo', 1)
        TriggerEvent('DoLongHudText', 'Successfully crafted Ass Lockpick', 2)
     else
        TriggerEvent('DoLongHudText', 'You dont have the required materials', 2)
     end
 end)

 RegisterNetEvent('drp-civjobs:craft-knuckle')
 AddEventHandler('drp-civjobs:craft-knuckle', function()
    if exports['drp-inventory']:hasEnoughOfItem('aluminium', 15) and exports['drp-inventory']:hasEnoughOfItem('steel', 15) then
        TriggerEvent('inventory:removeItem', 'aluminium', 15)
        TriggerEvent('inventory:removeItem', 'steel', 15)
        TriggerEvent('player:receiveItem', '3638508604', 1)
        TriggerEvent('DoLongHudText', 'Successfully crafted Knuckle', 2)
     else
        TriggerEvent('DoLongHudText', 'You dont have the required materials', 2)
     end
 end)

 RegisterNetEvent('drp-civjobs:craft-browning')
 AddEventHandler('drp-civjobs:craft-browning', function()
    if exports['drp-inventory']:hasEnoughOfItem('aluminium', 50) and exports['drp-inventory']:hasEnoughOfItem('steel', 50) then
        TriggerEvent('inventory:removeItem', 'aluminium', 50)
        TriggerEvent('inventory:removeItem', 'steel', 50)
        TriggerEvent('player:receiveItem', '148457251', 1)
        TriggerEvent('DoLongHudText', 'Successfully crafted a Browning', 2)
     else
        TriggerEvent('DoLongHudText', 'You dont have the required materials', 2)
     end
 end)

 RegisterNetEvent('drp-civjobs:craft-deagle')
 AddEventHandler('drp-civjobs:craft-deagle', function()
    if exports['drp-inventory']:hasEnoughOfItem('aluminium', 20) and exports['drp-inventory']:hasEnoughOfItem('steel', 20) then
        TriggerEvent('inventory:removeItem', 'aluminium', 20)
        TriggerEvent('inventory:removeItem', 'steel', 20)
        TriggerEvent('player:receiveItem', '-1716589765', 1)
        TriggerEvent('DoLongHudText', 'Successfully crafted a Dessert Deagle', 2)
     else
        TriggerEvent('DoLongHudText', 'You dont have the required materials', 2)
     end
 end)

 RegisterNetEvent('drp-civjobs:craft-mac10')
 AddEventHandler('drp-civjobs:craft-mac10', function()
    if exports['drp-inventory']:hasEnoughOfItem('refinedaluminium', 20) and exports['drp-inventory']:hasEnoughOfItem('refinedsteel', 20) then
        TriggerEvent('inventory:removeItem', 'refinedaluminium', 20)
        TriggerEvent('inventory:removeItem', 'refinedsteel', 20)
        TriggerEvent('player:receiveItem', '-134995899', 1)
        TriggerEvent('DoLongHudText', 'Successfully crafted a Mac-10', 2)
     else
        TriggerEvent('DoLongHudText', 'You dont have the required materials', 2)
     end
 end)

 
 RegisterNetEvent('drp-civjobs:craft-uzi')
 AddEventHandler('drp-civjobs:craft-uzi', function()
    if exports['drp-inventory']:hasEnoughOfItem('refinedaluminium', 20) and exports['drp-inventory']:hasEnoughOfItem('refinedsteel', 20) then
        TriggerEvent('inventory:removeItem', 'refinedaluminium', 20)
        TriggerEvent('inventory:removeItem', 'refinedsteel', 20)
        TriggerEvent('player:receiveItem', '-942620673', 1)
        TriggerEvent('DoLongHudText', 'Successfully crafted a Uzi', 2)
     else
        TriggerEvent('DoLongHudText', 'You dont have the required materials', 2)
     end
 end)

 
 RegisterNetEvent('drp-civjobs:craft-c4')
 AddEventHandler('drp-civjobs:craft-c4', function()
    if exports['drp-inventory']:hasEnoughOfItem('aluminium', 150) and exports['drp-inventory']:hasEnoughOfItem('scrapmetal', 150) and exports['drp-inventory']:hasEnoughOfItem('rubber', 150) then
        TriggerEvent('inventory:removeItem', 'aluminium', 150)
        TriggerEvent('inventory:removeItem', 'steel', 150)
        TriggerEvent('inventory:removeItem', 'rubber', 150)
        TriggerEvent('player:receiveItem', '741814745', 1)
        TriggerEvent('DoLongHudText', 'Successfully crafted a Sticky Bomb', 2)
     else
        TriggerEvent('DoLongHudText', 'You dont have the required materials', 2)
     end
 end)

 
 
 RegisterNetEvent('drp-civjobs:craft-pipebomb')
 AddEventHandler('drp-civjobs:craft-pipebomb', function()
    if exports['drp-inventory']:hasEnoughOfItem('aluminium', 50) and exports['drp-inventory']:hasEnoughOfItem('scrapmetal', 50) then
        TriggerEvent('inventory:removeItem', 'aluminium', 50)
        TriggerEvent('inventory:removeItem', 'scrapmetal', 50)
        TriggerEvent('player:receiveItem', '-1169823560', 1)
        TriggerEvent('DoLongHudText', 'Successfully crafted a Pipe Bomb', 2)
     else
        TriggerEvent('DoLongHudText', 'You dont have the required materials', 2)
     end
 end)

 
 
 RegisterNetEvent('drp-civjobs:craft-rpgammo')
 AddEventHandler('drp-civjobs:craft-rpgammo', function()
    if exports['drp-inventory']:hasEnoughOfItem('refinedaluminium', 40) and exports['drp-inventory']:hasEnoughOfItem('refinedsteel', 40) then
        TriggerEvent('inventory:removeItem', 'refinedaluminium', 40)
        TriggerEvent('inventory:removeItem', 'refinedsteel', 40)
        TriggerEvent('player:receiveItem', 'rpg', 1)
        TriggerEvent('DoLongHudText', 'Successfully crafted a RPG Ammo', 2)
     else
        TriggerEvent('DoLongHudText', 'You dont have the required materials', 2)
     end
 end)

 RegisterNetEvent('drp-civjobs:craft-rpg')
 AddEventHandler('drp-civjobs:craft-rpg', function()
    if exports['drp-inventory']:hasEnoughOfItem('refinedaluminium', 150) and exports['drp-inventory']:hasEnoughOfItem('refinedsteel', 150) then
        TriggerEvent('inventory:removeItem', 'refinedaluminium', 150)
        TriggerEvent('inventory:removeItem', 'refinedsteel', 150)
        TriggerEvent('player:receiveItem', '-1312131151', 1)
        TriggerEvent('DoLongHudText', 'Successfully crafted a Rocket Launcher', 2)
     else
        TriggerEvent('DoLongHudText', 'You dont have the required materials', 2)
     end
 end)

 RegisterNetEvent('notherelol')
 AddEventHandler('notherelol', function()
    TriggerEvent('player:receiveItemm', 'notepadnote', 1)

 end)

 RegisterNetEvent('drp-jobs:mechanic-craft')
 AddEventHandler('drp-jobs:mechanic-craft', function()
     TriggerEvent('drp-context:sendMenu', {
         {
             id = 1,
             header = "Public Workbench",
             txt = ""
         },
         {
             id = 2,
             header = "Craft Lockpick",
             txt = "Requires: 2x Steel",
             params = {
                event = "drp-civjobs:craft-lockpick"
            }
         },
         {
             id = 3,
             header = "Craft Adv Lockpick",
             txt = "Requires: 15x Refined Aluminium | 12x Refined Plastic | 15x Refined Rubber",
             params = {
                 event = "drp-civjobs:craft-advlockpick"
             }
         },
         {
             id = 4,
           header = "Craft Adv Repair Kit",
            txt = "Requires: 25x Electronics",
             params = {
                 event = "drp-civjobs:craft-repairkit"
             }
        },
         {
             id = 5,
             header = "Craft Ass Lockpick",
           txt = "Requires: 25x Refined Aluminium",
            params = {
                event = "drp-civjobs:craft-tyre-repairkit"
             }
         },
        {
             id = 6,
             header = "Close",
             txt = "Exit the bench",
             params = {
                 event = ""
             }
         },
     })
 end)

 
 
 RegisterNetEvent('civguncrafting')
 AddEventHandler('civguncrafting', function()
     TriggerEvent('drp-context:sendMenu', {
         {
             id = 1,
             header = "Weapons Bench",
             txt = ""
         },
         {
             id = 2,
             header = "Craft Pistol Ammo",
             txt = "Requires: 5x Aluminium | 5x Steel",
             params = {
                event = "drp-civjobs:craft-pammo"
            }
         },
         {
             id = 3,
             header = "Craft Sub Ammo",
             txt = "Requires: 5x Aluminium | 5x Steel",
             params = {
                 event = "drp-civjobs:craft-subammo"
             }
         },
         {
             id = 4,
           header = "Craft Browning Hi-Power",
            txt = "Requires: 20x Aluminium | 20x Steel",
             params = {
                 event = "drp-civjobs:craft-browning"
             }
        },
         {
             id = 5,
             header = "Craft Mac-10",
           txt = "Requires: 20x Refined Aluminium | 20x Refined Steel",
            params = {
                event = "drp-civjobs:craft-mac10"
             }
         },
        {
             id = 6,
             header = "Close",
             txt = "Exit the bench",
             params = {
                 event = ""
             }
         },
     })
 end)
 

 
 RegisterNetEvent('racooncrafting')
 AddEventHandler('racooncrafting', function()
    local cid = exports["isPed"]:isPed("cid")
        if cid == 114 or cid == 74 then
        TriggerEvent('drp-context:sendMenu', {
            {
                id = 1,
                header = "Racoon Bench",
                txt = ""
            },
            {
                id = 2,
                header = "Craft Pistol Ammo",
                txt = "Requires: 5x Aluminium | 5x Steel",
                params = {
                    event = "drp-civjobs:craft-pammo"
                }
            },
            {
                id = 3,
                header = "Craft Sticky Bomb",
                txt = "Requires: 150x aluminium | 150x scrapmetal | 150x rubber",
                params = {
                    event = "drp-civjobs:craft-c4"
                }
            },
            {
                id = 4,
                header = "Craft Pipe Bomb",
                txt = "Requires: 50x Aluminium | 50x Steel",
                params = {
                    event = "drp-civjobs:craft-pipebomb"
                }
            },
            {
                id = 5,
                header = "Craft RPG",
                txt = "Requires: 40x Refined Aluminium | 40x Refined Steel",
                params = {
                    event = "drp-civjobs:craft-rpgammo"
                }
            },
            {
                id = 6,
                header = "Craft Rocket Launcher",
                txt = "Requires: 100x Refined Aluminium | 100x Refined Steel",
                params = {
                    event = "drp-civjobs:craft-rpg"
                }
            },
            {
                id = 7,
                header = "Close",
                txt = "Exit the bench",
                params = {
                    event = ""
                }
            },
        })
    else 
        TriggerEvent('DoLongHudText', 'You are not Vagos Puto', 2)
    end
 end)

 RegisterNetEvent('vagoscrafting-disabled') -- disabled
 AddEventHandler('vagoscrafting-disabled', function()
    local cid = exports["isPed"]:isPed("cid")
    if cid == 110 or cid == 17 or cid == 74 then
        TriggerEvent('drp-context:sendMenu', {
            {
                id = 1,
                header = "Vagos Bench",
                txt = ""
            },
            {
                id = 2,
                header = "Craft Pistol Ammo",
                txt = "Requires: 5x Aluminium | 5x Steel",
                params = {
                    event = "drp-civjobs:craft-pammo"
                }
            },
            {
                id = 3,
                header = "Craft Sub Ammo",
                txt = "Requires: 5x Aluminium | 5x Steel",
                params = {
                    event = "drp-civjobs:craft-subammo"
                }
            },
            {
                id = 4,
                header = "Craft Knuckle",
                txt = "Requires: 15x Aluminium | 15x Steel",
                params = {
                    event = "drp-civjobs:craft-uzi"
                }
            },
            {
                id = 5,
                header = "Craft Uzi",
                txt = "Requires: 20x Refined Aluminium | 20x Refined Steel",
                params = {
                    event = "drp-civjobs:craft-uzi"
                }
            },
            {
                id = 6,
                header = "Craft Mac-10",
                txt = "Requires: 20x Refined Aluminium | 20x Refined Steel",
                params = {
                    event = "drp-civjobs:craft-mac10"
                }
            },
            {
                id = 7,
                header = "Craft Dessert Eagle",
                txt = "Requires: 20x Aluminium | 20x Steel",
                params = {
                    event = "drp-civjobs:craft-deagle"
                }
            },
            {
                id = 8,
                header = "Close",
                txt = "Exit the bench",
                params = {
                    event = ""
                }
            },
        })
    else 
        TriggerEvent('DoLongHudText', 'You are not Vagos Puto', 2)
    end
 end)

-----------------------------------------------------------------------------------------------------------------

--// Start Of Hayes Autos

RoyalHayesAutosStash = false

Citizen.CreateThread(function()
    exports["drp-polyzone"]:AddBoxZone("hayes_autos_stash", vector3(-1415.05, -451.58, 35.91), 1, 4.6, {
        name="hayes_autos_stash",
        heading=30,
        --debugPoly=true,
        minZ=33.11,
        maxZ=37.11
    })
end)

RegisterNetEvent('drp-polyzone:enter')
AddEventHandler('drp-polyzone:enter', function(name)
    if name == "hayes_autos_stash" then
        RoyalHayesAutosStash = true     
        HayesAutosStash()
            local rank = exports["isPed"]:GroupRank("hayes_autos")
            if rank > 1 then 
            exports['drp-textui']:showInteraction("[E] Stash")
        end
    end
end)

RegisterNetEvent('drp-polyzone:exit')
AddEventHandler('drp-polyzone:exit', function(name)
    if name == "hayes_autos_stash" then
        RoyalHayesAutosStash = false
        exports['drp-textui']:hideInteraction()
    end
end)

function HayesAutosStash()
	Citizen.CreateThread(function()
        while RoyalHayesAutosStash do
            Citizen.Wait(5)
			if IsControlJustReleased(0, 38) then
                    local rank = exports["isPed"]:GroupRank("hayes_autos")
                    if rank > 1 then 
                    TriggerEvent('drp-jobs:hayes_mechanic-shop')
                end
			end
		end
	end)
end

RegisterNetEvent('drp-jobs:hayes_mechanic-shop')
AddEventHandler('drp-jobs:hayes_mechanic-shop', function()
    local job = exports["isPed"]:GroupRank('hayes_autos')
    if job >= 2 then
		TriggerEvent("server-inventory-open", "1", "storage-hayes_autos")
		Wait(1000)
	end
end)

--// Crafting

--// Hayes

RoyalCraftingHayesAutos = false

Citizen.CreateThread(function()
    exports["drp-polyzone"]:AddBoxZone("royal_crafting_hayes_autos", vector3(-1408.39, -447.37, 35.91), 1, 5.4, {
        name="royal_crafting_hayes_autos",
        heading=30,
        --debugPoly=true,
        minZ=33.31,
        maxZ=37.31
    })
end)

RegisterNetEvent('drp-polyzone:enter')
AddEventHandler('drp-polyzone:enter', function(name)
    if name == "royal_crafting_hayes_autos" then
        RoyalCraftingHayesAutos = true     
            local rank = exports["isPed"]:GroupRank("hayes_autos")
            if rank > 1 then 
            TunerShopCraft()
            exports['drp-textui']:showInteraction("[E] Craft")
        end
    end
end)

RegisterNetEvent('drp-polyzone:exit')
AddEventHandler('drp-polyzone:exit', function(name)
    if name == "royal_crafting_hayes_autos" then
        RoyalCraftingHayesAutos = false
        exports['drp-textui']:hideInteraction()
    end
end)

function TunerShopCraft()
	Citizen.CreateThread(function()
        while RoyalCraftingHayesAutos do
            Citizen.Wait(5)
			if IsControlJustReleased(0, 38) then
                    local rank = exports["isPed"]:GroupRank("hayes_autos")
                    if rank > 0 then 
                    TriggerEvent('server-inventory-open', '27', 'Craft')
                end
			end
		end
	end)
end

--// Tuner Shop

RoyalTunerCraft = false

Citizen.CreateThread(function()
    exports["drp-polyzone"]:AddBoxZone("royal_crafting_tuner_shop", vector3(144.39, -3050.88, 7.04), 4, 1.4, {
        name="royal_crafting_tuner_shop",
        heading=270,
        --debugPoly=true,
        minZ=5.44,
        maxZ=9.44
    })
end)

RegisterNetEvent('drp-polyzone:enter')
AddEventHandler('drp-polyzone:enter', function(name)
    if name == "royal_crafting_tuner_shop" then
        RoyalTunerCraft = true     
            local rank = exports["isPed"]:GroupRank("tuner_shop")
            if rank > 1 then 
            TunerShopCrafting()
            exports['drp-textui']:showInteraction("[E] Craft")
        end
    end
end)

RegisterNetEvent('drp-polyzone:exit')
AddEventHandler('drp-polyzone:exit', function(name)
    if name == "royal_crafting_tuner_shop" then
        RoyalTunerCraft = false
        exports['drp-textui']:hideInteraction()
    end
end)

function TunerShopCrafting()
	Citizen.CreateThread(function()
        while RoyalTunerCraft do
            Citizen.Wait(5)
			if IsControlJustReleased(0, 38) then
                    local rank = exports["isPed"]:GroupRank("tuner_shop")
                    if rank > 1 then 
                    TriggerEvent('server-inventory-open', '27', 'Craft')
                end
			end
		end
	end)
end

--// Harmony Craft

RoyalHarmonyCraft = false

Citizen.CreateThread(function()
    exports["drp-polyzone"]:AddBoxZone("royal_harmony_craft", vector3(1176.22, 2635.66, 37.75), 2, 3.6, {
        name="royal_harmony_craft",
        heading=0,
        --debugPoly=true,
        minZ=35.35,
        maxZ=39.35
    })
end)

RegisterNetEvent('drp-polyzone:enter')
AddEventHandler('drp-polyzone:enter', function(name)
    if name == "royal_harmony_craft" then
        RoyalHarmonyCraft = true     
            local rank = exports["isPed"]:GroupRank("harmony_autos")
            if rank > 1 then 
            HarmonyShopCrafting()
            exports['drp-textui']:showInteraction("[E] Craft")
        end
    end
end)

RegisterNetEvent('drp-polyzone:exit')
AddEventHandler('drp-polyzone:exit', function(name)
    if name == "royal_harmony_craft" then
        RoyalHarmonyCraft = false
        exports['drp-textui']:hideInteraction()
    end
end)

function HarmonyShopCrafting()
	Citizen.CreateThread(function()
        while RoyalHarmonyCraft do
            Citizen.Wait(5)
			if IsControlJustReleased(0, 38) then
                    local rank = exports["isPed"]:GroupRank("harmony_autos")
                    if rank > 1 then 
                    TriggerEvent('server-inventory-open', '27', 'Craft')
                end
			end
		end
	end)
end

--// Harmony Stash

RoyalHarmony = false

Citizen.CreateThread(function()
    exports["drp-polyzone"]:AddBoxZone("harmony_mec_stash", vector3(1186.97, 2637.56, 38.44), 2, 2.0, {
        name="harmony_mec_stash",
        heading=0,
        --debugPoly=true,
        minZ=35.84,
        maxZ=39.84
    })
end)

RegisterNetEvent('drp-polyzone:enter')
AddEventHandler('drp-polyzone:enter', function(name)
    if name == "harmony_mec_stash" then
        RoyalHarmony = true     
            local rank = exports["isPed"]:GroupRank("harmony_autos")
            if rank > 1 then 
            HarmonyStash()
            exports['drp-textui']:showInteraction("[E] Stash")
        end
    end
end)

RegisterNetEvent('drp-polyzone:exit')
AddEventHandler('drp-polyzone:exit', function(name)
    if name == "harmony_mec_stash" then
        RoyalHarmony = false
        exports['drp-textui']:hideInteraction()
    end
end)

function HarmonyStash()
	Citizen.CreateThread(function()
        while RoyalHarmony do
            Citizen.Wait(5)
			if IsControlJustReleased(0, 38) then
                    local rank = exports["isPed"]:GroupRank("harmony_autos")
                    if rank > 1 then 
                    TriggerEvent("server-inventory-open", "1", "storage-harmony")
                end
			end
		end
	end)
end


-- // Racing Place Shit

RoyalRacingPartyTingInnit = false

Citizen.CreateThread(function()
    exports["drp-polyzone"]:AddBoxZone("racing_shit_like_southside_innit", vector3(1001.21, -2553.71, 32.87), 1, 4, {
        name="racing_shit_like_southside_innit",
        heading=355,
        --debugPoly=true,
        minZ=29.87,
        maxZ=33.87
    })
end)

RegisterNetEvent('drp-polyzone:enter')
AddEventHandler('drp-polyzone:enter', function(name)
    if name == "racing_shit_like_southside_innit" then
        RoyalRacingPartyTingInnit = true     
        RacingLocationWarehouseStash()
            local rank = exports["isPed"]:GroupRank("illegal_shop")
            if rank > 3 then 
            exports['drp-textui']:showInteraction("[E] Stash")
        end
    end
end)

RegisterNetEvent('drp-polyzone:exit')
AddEventHandler('drp-polyzone:exit', function(name)
    if name == "racing_shit_like_southside_innit" then
        RoyalRacingPartyTingInnit = false
        exports['drp-textui']:hideInteraction()
    end
end)

function RacingLocationWarehouseStash()
	Citizen.CreateThread(function()
        while RoyalRacingPartyTingInnit do
            Citizen.Wait(5)
			if IsControlJustReleased(0, 38) then
                    local rank = exports["isPed"]:GroupRank("illegal_shop")
                    if rank > 3 then 
                    TriggerEvent("server-inventory-open", "1", "storage-racing-shit")
                end
			end
		end
	end)
end

--// Craft

RoyalCraftingRacePlace = false

Citizen.CreateThread(function()
    exports["drp-polyzone"]:AddBoxZone("royal_racing_warehouse_craft", vector3(1046.79, -2531.53, 28.29), 1.5, 4, {
        name="royal_racing_warehouse_craft",
        heading=265,
        --debugPoly=true,
        minZ=25.29,
        maxZ=29.29
    })
end)

RegisterNetEvent('drp-polyzone:enter')
AddEventHandler('drp-polyzone:enter', function(name)
    if name == "royal_racing_warehouse_craft" then
        RoyalCraftingRacePlace = true     
            local rank = exports["isPed"]:GroupRank("illegal_shop")
            if rank > 3 then 
            print(rank)
            RacingPlaceCraft()
            exports['drp-textui']:showInteraction("[E] Craft")
        end
    end
end)

RegisterNetEvent('drp-polyzone:exit')
AddEventHandler('drp-polyzone:exit', function(name)
    if name == "royal_racing_warehouse_craft" then
        RoyalCraftingRacePlace = false
        exports['drp-textui']:hideInteraction()
    end
end)

function RacingPlaceCraft()
	Citizen.CreateThread(function()
        while RoyalCraftingRacePlace do
            Citizen.Wait(5)
			if IsControlJustReleased(0, 38) then
                    local rank = exports["isPed"]:GroupRank("illegal_shop")
                    if rank > 3 then 
                    TriggerEvent('server-inventory-open', '60', 'Craft')
                end
			end
		end
	end)
end