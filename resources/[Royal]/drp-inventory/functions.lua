local fixingvehicle = false
local justUsed = false
local retardCounter = 0
local lastCounter = 0
local HeadBone = 0x796e;
local wheelChair = nil
local boxAttached = false
local franksFluteCount = 0
local myJob = "none"
local isKatanaEquipped = false
local preventspam = 0

-- Buddha quest
local BuddhaIsItemFound1 = false
local BuddhaIsItemFound2 = false
local BuddhaIsItemFound3 = false

local randomDrivingActions = {
    7,
    8,
    10,
    11,
    32
  }

local randomEffects = {
    "lsd",
    "weed",
    "cocaine",
    "crack",
    "metamorphine"
  }

  local WillOD = 0

local parachuteConfig = {
  ["-72657034"] = {
    replace = `p_parachute1_mp_s`,
    tint = 6,
  },
  ["airxchute"] = {
    replace = `p_parachute1_mp_dec`,
    tint = 1,
  },
  ["airbornechute"] = {
    replace = `p_parachute2_mp_dec`,
    tint = 1,
  },
}

local jailBounds = PolyZone:Create({
  vector2(1855.8966064453, 2701.9802246094),
  vector2(1775.4013671875, 2770.5339355469),
  vector2(1646.7535400391, 2765.9870605469),
  vector2(1562.7836914063, 2686.6459960938),
  vector2(1525.3662109375, 2586.5190429688),
  vector2(1533.7038574219, 2465.5300292969),
  vector2(1657.5997314453, 2386.9389648438),
  vector2(1765.8286132813, 2404.4763183594),
  vector2(1830.1740722656, 2472.1193847656),
  vector2(1855.7557373047, 2569.0361328125)
}, {
    name = "jail_bounds",
    minZ = 30,
    maxZ = 70.5,
    debugGrid = false,
    gridDivisions = 25
})

local function has_value (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end
    return false
end

local isStressBlocking = false
local function processStressBlock()
  if isStressBlocking then return end
  isStressBlocking = true
  TriggerEvent("client:disableStress", true)
  Citizen.CreateThread(function()
    Wait(1000 * 60 * 15) -- 15 minutes
    TriggerEvent("client:disableStress", false)
    isStressBlocking = false
  end)
end

RegisterNetEvent("drp-jobmanager:playerBecameJob")
AddEventHandler("drp-jobmanager:playerBecameJob", function(job)
  myJob = job
end)

AddEventHandler("drp-katana:removeEquippedKatana", function()
    isKatanaEquipped = false
end)

local fruits = {
    "apple",
    "banana",
    "cherry",
    "coconut",
    "grapes",
    "kiwi",
    "lemon",
    "peach",
    "strawberry",
    "watermelon"
}

local validWaterItem = {
    ["oxygentank"] = true,
    ["water"] = true,
    ["poisonedwater"] = true,
    ["vodka"] = true,
    ["beer"] = true,
    ["whiskey"] = true,
    ["coffee"] = true,
    ["fishtaco"] = true,
    ["taco"] = true,
    ["burrito"] = true,
    ["churro"] = true,
    ["hotdog"] = true,
    ["greencow"] = true,
    ["donut"] = true,
    ["applepie"] = true,
    ["eggsbacon"] = true,
    ["icecream"] = true,
    ["mshake"] = true,
    ["winemilkshake"] = true,
    ["sandwich"] = true,
    ["customfooditem"] = true,
    ["customwateritem"] = true,
    ["customcoffeeitem"] = true,
    ["poisonedsandwich"] = true,
    ["hamburger"] = true,
    ["cola"] = true,
    ["jailfood"] = true,
    ["bleederburger"] = true,
    ["heartstopper"] = true,
    ["torpedo"] = true,
    ["meatfree"] = true,
    ["moneyshot"] = true,
    ["fries"] = true,
    ["slushy"] = true,
    ["frappuccino"] = true,
    ['latte'] = true,
    ['cookie'] = true,
    ['muffin'] = true,
    ['chocolate'] = true,
    ['softdrink'] = true,
    ['franksmonster'] = true,
    ['roostertea'] = true,
    ['buddhamedalion'] = true,
    ['buddhashovel'] = true,
    ["katsucurry"] = true,
    ["misosoup"] = true,
    ["teriyakichicken"] = true,
    ["boabun"] = true,
    ["chickennoodles"] = true,
    ["gemanjicompass"] = true,
    ["shochu"] = true,
    ["chuhai"] = true,
    ["asahi"] = true,
    ["yamazaki"] = true,
}

local sandwichItems = {
  ["sandwich"] = true,
  ["hamburger"] = true,
  ["poisonedsandwich"] = true,
  ["customfooditem"] = true,
  ["panini"] = true,
}

local waterItems = {
  ["cola"] = true,
  ["water"] = true,
  ["poisonedwater"] = true,
  ["customwateritem"] = true,
  ["roostertea"] = true,
  ["chuhai"] = true,
}

local waterItemsAttached = {
  ["water"] = true,
  ["poisonedwater"] = true,
  ["cola"] = true,
  ["vodka"] = true,
  ["whiskey"] = true,
  ["beer"] = true,
  ["coffee"] = true,
  ["bscoffee"] = true,
  ["softdrink"] = true,
  ["fries"] = true,
  ["roostertea"] = true,
  ["customwateritem"] = true,
  ["customcoffeeitem"] = true,
  ["kdragonwater"] = true,
  ["shochu"] = true,
  ["chuhai"] = true,
  ["asahi"] = true,
  ["yamazaki"] = true,
}

local deanworldFood = {
  ["deanworldcorndog"] = true,
  ["deanworldcottoncandy"] = true,
  ["deanworldcaramelapple"] = true,
  ["deanworldkettlecorn"] = true,
  ["deanworldsoftpretzel"] = true,
}

local validDogModels = {
    [`a_c_chop`] = true,
    [`a_c_husky`] = true,
}

local customMarketItems = {
  ["customfooditem"] = true,
  ["customwateritem"] = true,
  ["customcoffeeitem"] = true,
  ["customjointitem"] = true,
  ["custommerchitem"] = true,
}

local Throttles = {}

function GetRandomString(lenght)
    local chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'
    local randomString, stringLenght = '', lenght or 10
    local charTable = {}

    for char in chars:gmatch"." do
        table.insert(charTable, char)
    end

    for i = 1, stringLenght do
        randomString = randomString .. charTable[math.random(1, #charTable)]
    end
    return randomString
end

function Throttled(name, time)
    if not Throttles[name] then
        Throttles[name] = true
        Citizen.SetTimeout(time or 500, function() Throttles[name] = false end)
        return false
    end

    return true
end

local ItemCallbacks = {}

function RegisterItemCallback(itemName, cb)
    ItemCallbacks[itemName] = cb
end

RegisterCommand('+useKeyFob', function()
    if Throttled("drp-doorss:doorKeyFob", 1000) then return end
    TriggerEvent("drp-doors:doorKeyFob")
end, false)
RegisterCommand('-useKeyFob', function() end, false)

Citizen.CreateThread(function()
    exports["drp-binds"]:registerKeyMapping("", "Vehicle", "Door Keyfob", "+useKeyFob", "-useKeyFob", "Y")
    TriggerServerEvent("inv:playerSpawned")
    TriggerEvent("closeInventoryGui")
end)

RegisterNetEvent('inventory-jail')
AddEventHandler('inventory-jail', function(startPosition, cid, name)
    if (hasEnoughOfItem("okaylockpick",1,false)) then
        local plyPed = PlayerPedId()
        local coord = GetPedBoneCoords(plyPed, HeadBone)
        local inPoly = jailBounds:isPointInside(coord)
        if inPoly  then
             TriggerServerEvent("server-inventory-open", startPosition, cid, "1", name);
        end
    end
end)

local stolenItems = {
  ["stolentv"] = true
}

local LastUsedItem = 0
local LastUsedItemId = "ciggy"

RegisterNetEvent('inventory:DegenLastUsedItem')
AddEventHandler('inventory:DegenLastUsedItem', function(percent)
    local cid = exports["isPed"]:isPed("cid")
    print("Degen applied to ".. LastUsedItemId .. " ID: " .. LastUsedItem .. " at %" .. percent)
    TriggerServerEvent("inventory:degItem",LastUsedItem,percent,LastUsedItemId,cid)
end)

RegisterNetEvent('RunUseItem')
AddEventHandler('RunUseItem', function(itemid, slot, inventoryName, isWeapon, passedItemInfo)

    if itemid == nil then
        return
    end
    local player = PlayerPedId()
    local ItemInfo = GetItemInfo(slot)
    local currentVehicle = GetVehiclePedIsUsing(player)
    LastUsedItem = ItemInfo.id
    LastUsedItemId = itemid
    if ItemInfo.quality == nil then return end
    if ItemInfo.quality < 1 then
        TriggerEvent("DoLongHudText","Item is too worn.",2)
        TriggerEvent("inventory:removeItem", LastUsedItemId, 1)
        if isWeapon then
            TriggerEvent("brokenWeapon")
        end
        return
    end

    if justUsed then
        retardCounter = retardCounter + 1
        if retardCounter > 10 and retardCounter > lastCounter+5 then
            lastCounter = retardCounter
            TriggerServerEvent("exploiter", "Tried using " .. retardCounter .. " items in < 500ms ")
        end
        return
    end

    justUsed = true

    if (not hasEnoughOfItem(itemid,1,false)) then
        TriggerEvent("DoLongHudText","You dont appear to have this item on you?",2)
        justUsed = false
        retardCounter = 0
        lastCounter = 0
        return
    end

    if parachuteConfig[itemid] and tonumber(ItemInfo.quality) > 0 and not IsPedInParachuteFreeFall(player) and not IsPedFalling(player) and (GetPedParachuteState(player) == -1 or GetPedParachuteState(player) == 0) then
        local pConf = parachuteConfig[itemid]
        SetPlayerParachuteModelOverride(PlayerId(), pConf.replace)
        SetPedParachuteTintIndex(PlayerPedId(), pConf.tint)
        SetPlayerReserveParachuteTintIndex(PlayerId(), pConf.tint)
        TriggerEvent("equipWeaponID", "-72657034",ItemInfo.information,ItemInfo.id)
        TriggerEvent("inventory:removeItem",itemid, 1)
        TriggerEvent("hud:equipParachute")
        justUsed = false
        retardCounter = 0
        lastCounter = 0
        return
    end

    if not isValidUseCase(itemid,isWeapon) then
        justUsed = false
        retardCounter = 0
        lastCounter = 0
        return
    end

    if (itemid == nil) then
        justUsed = false
        retardCounter = 0
        lastCounter = 0
        return
    end

    if itemid == "-1518444656" then
        if tonumber(ItemInfo.quality) > 0 then
              local katanaInfo = json.decode(ItemInfo.information)
              katanaInfo.componentVariant = "1"
              local hiddenKeys = katanaInfo._hideKeys or {}
              hiddenKeys[#hiddenKeys + 1] = "componentVariant"
              katanaInfo._hideKeys = hiddenKeys
              TriggerEvent("equipWeaponID","1649403952",json.encode(katanaInfo),ItemInfo.id)
              Citizen.CreateThread(function()
                while GetSelectedPedWeapon(PlayerPedId()) ~= 1649403952 do
                    Wait(100)
                end
                GiveWeaponComponentToPed(PlayerPedId(), 1649403952, 0xF605986F )
                GiveWeaponComponentToPed(PlayerPedId(), 1649403952, 0xCDCEC991 )
                GiveWeaponComponentToPed(PlayerPedId(), 1649403952, 0xF07EECC4 )
                GiveWeaponComponentToPed(PlayerPedId(), 1649403952, 0xA3BCB36E )
              end)
        end
        justUsed = false
        retardCounter = 0
        lastCounter = 0
        return
    end

    if (isWeapon) then
        if tonumber(ItemInfo.quality) > 0 then
            TriggerEvent("equipWeaponID",itemid,ItemInfo.information,ItemInfo.id)
        end
        justUsed = false
        retardCounter = 0
        lastCounter = 0
        Wait(1500)
        TriggerEvent("AttachWeapons")
        return
    end

    if itemid == "smokegrenadeswat" or itemid == "smokegrenadenpa" then
      if tonumber(ItemInfo.quality) > 0 then
          TriggerEvent("equipWeaponID",-37975472,ItemInfo.information,ItemInfo.id, itemid)
      end
      justUsed = false
      retardCounter = 0
      lastCounter = 0
      return
    end

    if itemid == "cursedkatanaweapon" then
        if tonumber(ItemInfo.quality) > 0 then
            if not isKatanaEquipped then
              isKatanaEquipped = true
              Citizen.CreateThread(function()
                  Citizen.Wait(1000)
                  TriggerEvent("drp-katana:cursedKatanaEquipC")
              end)
            else
              isKatanaEquipped = false
            end
            TriggerEvent("equipWeaponID","1692590063",json.encode(katanaInfo),ItemInfo.id)
        end
      justUsed = false
      retardCounter = 0
      lastCounter = 0
      return
    end

    if itemid == "1692590063" then
        if tonumber(ItemInfo.quality) > 0 then
            local katanaInfo = json.decode(ItemInfo.information)
            katanaInfo.componentVariant = "5"
            local hiddenKeys = katanaInfo._hideKeys or {}
            hiddenKeys[#hiddenKeys + 1] = "componentVariant"
            katanaInfo._hideKeys = hiddenKeys
            TriggerEvent("equipWeaponID","1692590063",json.encode(katanaInfo),ItemInfo.id)
        end
        justUsed = false
        retardCounter = 0
        lastCounter = 0
        return
    end

    if itemid == "knuckle_chain" then
        if tonumber(ItemInfo.quality) > 0 then
              local katanaInfo = json.decode(ItemInfo.information)
              katanaInfo.componentVariant = "2"
              local hiddenKeys = katanaInfo._hideKeys or {}
              hiddenKeys[#hiddenKeys + 1] = "componentVariant"
              katanaInfo._hideKeys = hiddenKeys
              TriggerEvent("equipWeaponID","3638508604",json.encode(katanaInfo),ItemInfo.id)
        end
        justUsed = false
        retardCounter = 0
        lastCounter = 0
        return
    end

    if itemid == "gepard" then
        if tonumber(ItemInfo.quality) > 0 then
              local katanaInfo = json.decode(ItemInfo.information)
              katanaInfo.componentVariant = "1"
              local hiddenKeys = katanaInfo._hideKeys or {}
              hiddenKeys[#hiddenKeys + 1] = "componentVariant"
              katanaInfo._hideKeys = hiddenKeys
              TriggerEvent("equipWeaponID","1649403952",json.encode(katanaInfo),ItemInfo.id)
              Citizen.CreateThread(function()
                while GetSelectedPedWeapon(PlayerPedId()) ~= 1649403952 do
                    Wait(100)
                end
                GiveWeaponComponentToPed(PlayerPedId(), 1649403952, 0xF605986F )
                GiveWeaponComponentToPed(PlayerPedId(), 1649403952, 0xCDCEC991 )
                GiveWeaponComponentToPed(PlayerPedId(), 1649403952, 0xF07EECC4 )
                GiveWeaponComponentToPed(PlayerPedId(), 1649403952, 0xA3BCB36E )
              end)
        end
        justUsed = false
        retardCounter = 0
        lastCounter = 0
        return
    end

    if itemid == "gavel" then
        if tonumber(ItemInfo.quality) > 0 then
              local katanaInfo = json.decode(ItemInfo.information)
              katanaInfo.componentVariant = "1"
              local hiddenKeys = katanaInfo._hideKeys or {}
              hiddenKeys[#hiddenKeys + 1] = "componentVariant"
              katanaInfo._hideKeys = hiddenKeys
              TriggerEvent("equipWeaponID","1317494643",json.encode(katanaInfo),ItemInfo.id)
        end
        justUsed = false
        retardCounter = 0
        lastCounter = 0
        return
    end

    if itemid == "buddhamedalion" then
        buddhaMedalion()
    end

    if stolenItems[itemid] and exports["drp-npcs"]:isCloseToPawnPed() then
        print("You should do stuff")
        justUsed = false
        retardCounter = 0
        lastCounter = 0
        return
    end


    TriggerEvent("hud-display-item",itemid,"Used")

    Wait(800)

    local playerVeh = GetVehiclePedIsIn(player, false)

    if (not IsPedInAnyVehicle(player)) then
        if (itemid == "Suitcase") then
            TriggerEvent('attach:suitcase')
            
        end

        if (itemid == "Boombox") then
                TriggerEvent('attach:boombox')
                -- TriggerEvent('boombox:request:song')
        end
        if (itemid == "Box") then
            if not boxAttached then
                TriggerEvent('attach:box')
                boxAttached = true
            else
                TriggerEvent("animation:carry", "none")
                boxAttached = false
            end
        end
        if (itemid == "DuffelBag") then
            local finished = exports["drp-taskbar"]:taskBar(10000,"Opening Duffel Bag",false,false,playerVeh)
            if (finished == 100) then
                remove = true
                TriggerEvent("inventory:removeItem","DuffelBag", 1)
                TriggerEvent( "player:receiveItem", "lockpick", 2)
                TriggerEvent( "player:receiveItem", "advlockpick", 2)
                TriggerEvent( "player:receiveItem", "repairkit", 2 )
                TriggerEvent( "player:receiveItem", "radio", 2)
                TriggerEvent( "player:receiveItem", "binoculars", 2 )
                TriggerEvent( "player:receiveItem", "armor", 2 )
                TriggerEvent( "player:receiveItem", "oxygentank", 2 )
            end
        end
        if (itemid == "MedicalBag") then
            local finished = exports["drp-taskbar"]:taskBar(10000,"Opening Medical Supplies",false,false,playerVeh)
            if (finished == 100) then
                remove = true
                TriggerEvent( "player:receiveItem", "ibuprofen", 5)
                TriggerEvent( "player:receiveItem", "bandage", 5)
                TriggerEvent( "player:receiveItem", "ifak", 2 )
                TriggerEvent( "player:receiveItem", "water", 5)
                TriggerEvent( "player:receiveItem", "sandwich", 2 )
            end
        end
        if (itemid == "SecurityCase") then
          TriggerEvent('attach:securityCase')
        end
        if (itemid == "Toolbox") then
          TriggerEvent('attach:toolbox')
        end
        if itemid == "wheelchair" then
            if not DoesEntityExist(wheelChair) then
                local wheelChairModel = `npwheelchair`
                RequestModel(wheelChairModel)
                while not HasModelLoaded(wheelChairModel) do
                    Citizen.Wait(0)
                end
                wheelChair = CreateVehicle(wheelChairModel, GetEntityCoords(PlayerPedId()), GetEntityHeading(PlayerPedId()), true, false)
                SetVehicleOnGroundProperly(wheelChair)
                SetVehicleNumberPlateText(wheelChair, "PILLBOX".. math.random(9))
                SetPedIntoVehicle(PlayerPedId(), wheelChair, -1)
                SetModelAsNoLongerNeeded(wheelChairModel)
                local wheelChairPlate = GetVehicleNumberPlateText(wheelChair)
                TriggerServerEvent('garages:addJobPlate', wheelChairPlate)
                TriggerEvent("keys:addNew", wheelChair, wheelChairPlate)
            elseif DoesEntityExist(wheelChair) and #(GetEntityCoords(wheelChair) - GetEntityCoords(PlayerPedId())) < 3.0 and GetPedInVehicleSeat(wheelChair,-1) == 0 then
                Sync.DeleteVehicle(wheelChair)
                wheelChair = nil
            else
                TriggerEvent("DoLongHudText","Too far away from the wheelchair or someon is sitting in it !",1)
            end
        end
    end

    local remove = false
    local removeId = nil
    local itemreturn = false
    local drugitem = false
    local fooditem = false
    local drinkitem = false
    local healitem = false

    if ItemCallbacks[itemid] and type(ItemCallbacks[itemid]) == 'function' then
        local options = { remove = false }

        ItemCallbacks[itemid](itemid, itemInfo, options)

        -- This is pepega af but I can't be arsed right now to make something that makes more sense
        if options.remove then
            remove = true
        end
    end

    if (itemid == "spellbook-flame" and currentVehicle == 0) then
        TriggerEvent("fx:spellcast","FireRay")
    end

    if (itemid == "spellbook-roar" and currentVehicle == 0) then
        TriggerEvent("fx:spellcast","FireRoar")
    end

    if (itemid == "spellbook-heal" and currentVehicle == 0) then
        TriggerEvent("fx:spellcast","AOEheal")
    end
    if (itemid == "spellbook-slow" and currentVehicle == 0) then
        TriggerEvent("fx:spellcast","AOEslow")
    end
    if (itemid == "spellbook-shock" and currentVehicle == 0) then
        TriggerEvent("fx:spellcast","AOEshock")
    end
    if (itemid == "spellbook-test" and currentVehicle == 0) then
        TriggerEvent("fx:spellcast","AOEtest")
    end
    if (itemid == "spellbook-blink" and currentVehicle == 0) then
        TriggerEvent("fx:spellcast","blink")
    end
    if (itemid == "spellbook-speed" and currentVehicle == 0) then
        TriggerEvent("fx:spellcast","AOEspeed")
    end
    if (itemid == "spellbook-buff" and currentVehicle == 0) then
        TriggerEvent("fx:spellcast","AOEbuff")
    end
    if (itemid == "spellbook-mana" and currentVehicle == 0) then
        remove = true
        TriggerEvent("fx:spellmana")
    end   

    if (itemid == "spellbook-poop" and currentVehicle == 0) then
        TriggerEvent("fx:spellcast","AOEpoop")
    end  

    if (itemid == "spikes" and currentVehicle == 0) then
        TriggerEvent('placespikes')
        remove = true
    end
    if (itemid == "nitrous") then
        TriggerEvent("carmod:nos")
    end

    if (itemid == "francisdice" and currentVehicle == 0) then
        TriggerEvent("francisroll")
    end

    if (itemid == "heistduffelbag") then
        local itemInfo = GetItemInfo(slot)
        
        if itemInfo == nil then
                return
            else 
            if itemInfo ~= nil then
                if itemInfo.id ~= nil then
                    TriggerEvent("server-inventory-open", "1", "duffelbag" .. ItemInfo.id)
                end
            end
        end
    end

    if (itemid == "dojochain") then
        TriggerEvent('dojo:togglechain')
    end

    if (itemid == "jessemask") then
        TriggerEvent('jesse:togglemask')
    end

    if (itemid == "radio") then
        TriggerEvent('radioGui')
    end

    if (itemid == "mobilephone" or itemid == "stoleniphone" or itemid == "stolens8" or itemid == "stolennokia" or itemid == "stolenpixel3" or itemid == "assphone" or itemid == "boomerphone") then
        TriggerEvent("phoneGui")
    end

    if (itemid == "burnerphone") then
        TriggerEvent('burner:ui')
    end

    if (itemid == "pdbadge") then
        RPC.execute("drp-gov:police:showBadge", json.decode(ItemInfo.information))
    end

    if (itemid == "joint" or itemid == "weed5oz" or itemid == "weedq" or itemid == "beer" or itemid == "vodka" or itemid == "whiskey" or itemid == "lsdtab" or itemid == 'winemilkshake' or itemid == 'honestwineglass' or itemid == "customjointitem") then
        drugitem = true
    end

    if (itemid == "burnerphone") then
        openBurner({
            source_number = json.decode(ItemInfo.information).Number,
            isOwner = true
        })
    end

    if (itemid == "electronickit" or itemid == "lockpick") then
      TriggerServerEvent("robbery:triggerItemUsedServer",itemid)

    end
    if (itemid == "locksystem") then
      TriggerServerEvent("robbery:triggerItemUsedServer")
    end

  
    if (itemid == "thermite") then
      TriggerServerEvent("robbery:triggerItemUsedServer",itemid)
    end

    if (itemid == "thermitecharge") then
        TriggerEvent("vault:thermitecheck")
      end

    if (itemid == "pdbadge") then
        local ItemInfo = GetItemInfo(slot)
        TriggerServerEvent("drp-badge:server:useitem", ItemInfo.information)
    end

    if (itemid == "tablet") then
        TriggerEvent("shithappensg")
    end


    if(itemid == "evidencebag") then
        TriggerEvent("evidence:startCollect", itemid, slot)
        local itemInfo = GetItemInfo(slot)
        local data = itemInfo.information
        if data == '{}' then
            TriggerEvent("DoLongHudText","Start collecting evidence!",1)
            TriggerEvent("inventory:updateItem", itemid, slot, '{"used": "true"}')
            --
        else
            local dataDecoded = json.decode(data)
            if(dataDecoded.used) then
                print('YOURE ALREADY COLLECTING EVIDENCE YOU STUPID FUCK')
            end
        end
    end

    if (itemid == "lsdtab" or itemid == "badlsdtab") then
        TriggerEvent("animation:PlayAnimation","pill")
        local finished = exports["drp-taskbar"]:taskBar(3000,"Placing LSD Strip on 👅",false,false,playerVeh)
        if (finished == 100) then
            TriggerEvent("Evidence:StateSet",2,1200)
            TriggerEvent("Evidence:StateSet",24,1200)
            TriggerEvent("fx:run", "lsd", 180, -1, (itemid == "badlsdtab" and true or false))
            remove = true
        end
    end

    if (itemid == "decryptersess" or itemid == "decrypterfv2" or itemid == "decrypterenzo") then
      if (#(GetEntityCoords(player) - vector3( 1275.49, -1710.39, 54.78)) < 3.0) then
          local finished = exports["drp-taskbar"]:taskBar(25000,"Decrypting Data",false,false,playerVeh)
          if (finished == 100) then
            TriggerEvent("phone:crypto:use", 1, 3, "robbery:decrypt", true)
          end
      end

      if #(GetEntityCoords(player) - vector3( 2328.94, 2571.4, 46.71)) < 3.0 then
          local finished = exports["drp-taskbar"]:taskBar(25000,"Decrypting Data",false,false,playerVeh)
          if finished == 100 then
            TriggerEvent("phone:crypto:use", 1, 3, "robbery:decrypt2", true)
          end
      end

      if #(GetEntityCoords(player) - vector3( 1208.73,-3115.29, 5.55)) < 3.0 then
          local finished = exports["drp-taskbar"]:taskBar(25000,"Decrypting Data",false,false,playerVeh)
          if finished == 100 then
            TriggerEvent("phone:crypto:use", 1, 3,"robbery:decrypt3", true)
          end
      end

    end

    if (itemid == "grapplegun" or itemid == "grapplegunpd") then
        TriggerEvent('UseGrappleGun')
    end

    if (itemid == "pix1") then
      if (#(GetEntityCoords(player) - vector3( 1275.49, -1710.39, 54.78)) < 3.0) then
          local finished = exports["drp-taskbar"]:taskBar(25000,"Decrypting Data",false,false,playerVeh)
          if (finished == 100) then
            TriggerEvent("phone:crypto:add", 1, math.random(1,2))
            remove = true
          end
      end
    end

    if (itemid == "pix2") then
      if (#(GetEntityCoords(player) - vector3( 1275.49, -1710.39, 54.78)) < 3.0) then
          local finished = exports["drp-taskbar"]:taskBar(25000,"Decrypting Data",false,false,playerVeh)
          if (finished == 100) then
            TriggerEvent("phone:crypto:add", 1, math.random(5,12))
            remove = true
          end
      end
    end

    if (itemid == "femaleseed") then
       TriggerEvent("Evidence:StateSet",4,1600)
       --TriggerEvent("weed:startcrop","female")
       TriggerEvent("drp-weed:plantSeed", itemid)
    end

    if (itemid == "maleseed") then
       TriggerEvent("Evidence:StateSet",4,1600)
       TriggerEvent("drp-weed:plantSeed", itemid)
    end

    if (itemid == "highgrademaleseed") then
        TriggerEvent("Evidence:StateSet",4,1600)
        TriggerEvent("drp-weed:plantSeed", itemid)
    end

    if (itemid == "weedoz" and hasEnoughOfItem("qualityscales",1,false) ) then

      local finished = exports["drp-taskbar"]:taskBar(5000,"Rolling Joints",false,false,playerVeh)
        if (finished == 100) then
            CreateCraftOption("joint", 10, true)
        end

    end

    if (itemid == "weedq" and hasEnoughOfItem("qualityscales",1,false)) then
        local finished = exports["drp-taskbar"]:taskBar(1000,"Rolling Joints",false,false,playerVeh)
        if (finished == 100) then
            CreateCraftOption("joint2", 3, true) 
        end
    end

    if (itemid == "lighter") then
        TriggerEvent("animation:PlayAnimation","lighter")
          local finished = exports["drp-taskbar"]:taskBar(2000,"Starting Fire",false,false,playerVeh)
        if (finished == 100) then

        end
    end

    if (itemid == "joint" or itemid == "joint2") then
        local finished = exports["drp-taskbar"]:taskBar(2000,"Smoking Joint",false,false,playerVeh)
        if (finished == 100) then

            Wait(200)

            if math.random(100) == 69 then
                TriggerEvent("player:receiveItem","femaleseed",1)
            end

            if math.random(600) == 69 then
                TriggerEvent("player:receiveItem","maleseed",1)
            end

            if itemid == "joint" then
                TriggerEvent("drp-hud:updateStress",false,50)
            end

            TriggerEvent("animation:PlayAnimation","weed")
            TriggerEvent("Evidence:StateSet",3,600)
            SetPedArmour( player, 100 )
            TriggerEvent("Evidence:StateSet",4,600)
            TriggerEvent("drp-hud:updateStress",false,20)
            TriggerEvent(
              "weed",
              5000,
              "WORLD_HUMAN_SMOKING_POT",
              itemid == "joint" and 1.5 or 0.75
            )
            remove = true
        end
    end

    if (
         itemid == "vodka"
      or itemid == "beer"
      or itemid == "whiskey" 
      or itemid == "absinthe" 
      or itemid == "drink1" 
      or itemid == "drink2" 
      or itemid == "drink3" 
      or itemid == "drink4" 
      or itemid == "drink5" 
      or itemid == "drink6"
      or itemid == "drink7" 
      or itemid == "drink8" 
      or itemid == "drink9" 
      or itemid == "drink10" 
      or itemid == "shot1" 
      or itemid == "shot2" 
      or itemid == "shot3" 
      or itemid == "shot4" 
      or itemid == "shot5" 
      or itemid == "shot6" 
      or itemid == "winemilkshake"
      or itemid == "shot7" 
      or itemid == "shot8" 
      or itemid == "shot9" 
      or itemid == "shot10" 
      or itemid == "moonshine"
      or itemid == "poisonedcocktail"
      or itemid == "mead_watermelon"
      or itemid == "mead_strawberry"
      or itemid == "mead_potato"
      or itemid == "mead_peach"
      or itemid == "mead_orange"
      or itemid == "mead_lime"
      or itemid == "mead_lemon"
      or itemid == "mead_kiwi"
      or itemid == "mead_grape"
      or itemid == "mead_coconut"
      or itemid == "mead_cherry"
      or itemid == "mead_banana"
      or itemid == "mead_apple"
    ) then
        local success = itemid == "winemilkshake" and true or (AttachPropAndPlayAnimation("amb@world_human_drinking@coffee@male@idle_a", "idle_c", 49,6000,"Drink","changethirst",true,itemid,playerVeh))
        if success then
            TriggerEvent("Evidence:StateSet", 8, 600)
            local alcoholStrength = 0.5
            if itemid == "vodka" or itemid == "whiskey" or itemid == "yamazaki" or itemid == "shochu" then alcoholStrength = 1.0 end
            if itemid == "absinthe" then alcoholStrength = 2.5 end
            if itemid == "moonshine" then 
                alcoholStrength = 4.0
            end
            if itemid == "drink1" or itemid == "drink2" or itemid == "drink3" or itemid == "drink4" or itemid == "drink5" or itemid == "drink6"
            or itemid == "drink7" or itemid == "drink8" or itemid == "drink9" or itemid == "drink10" then
                alcoholStrength = 0.6
            end
            if itemid == "shot1" or itemid == "shot2" or itemid == "shot3" or itemid == "shot4" or itemid == "shot5" or itemid == "shot6"
            or itemid == "shot7" or itemid == "shot8" or itemid == "shot9" or itemid == "shot10" then
                alcoholStrength = 0.8
            end
            if itemid == "mead_watermelon"
            or itemid == "mead_strawberry"
            or itemid == "mead_potato"
            or itemid == "mead_peach"
            or itemid == "mead_orange"
            or itemid == "mead_lime"
            or itemid == "mead_lemon"
            or itemid == "mead_kiwi"
            or itemid == "mead_grape"
            or itemid == "mead_coconut"
            or itemid == "mead_cherry"
            or itemid == "mead_banana"
            or itemid == "mead_apple" then
                alcoholStrength = 1.0
                TriggerEvent("inv:slushy")
                if math.random(1,10) <= 3 then
                    TriggerEvent( "player:receiveItem","bottle_cap",1)
                    if math.random() < 0.30 then
                        TriggerServerEvent("fx:puke")
                    end
                end
            end
            TriggerEvent("fx:run", "alcohol", 180, alcoholStrength, -1, (itemid == "absinthe" and true or false))
        end
    end

    if (itemid == "coffee" or itemid == "frappuccino" or itemid == "latte" or itemid == "customcoffeeitem") then
        AttachPropAndPlayAnimation(
          "amb@world_human_drinking@coffee@male@idle_a", 
          "idle_c", 
          49,
          6000,
          "Drink",
          "coffee:drink", 
          not customMarketItems[itemid], 
          itemid == "customcoffeeitem" and "coffee" or itemid, 
          playerVeh
        )
        remove = customMarketItems[itemid]
    end

    if (itemid == "fishtaco") then
        AttachPropAndPlayAnimation("mp_player_inteat@burger", "mp_player_int_eat_burger", 49,6000,"Eating","food:FishTaco",true,itemid,playerVeh)
    end

    if (itemid == "taco" or itemid == "burrito") then
        AttachPropAndPlayAnimation("mp_player_inteat@burger", "mp_player_int_eat_burger", 49,6000,"Eating","food:Taco",true,itemid,playerVeh)
    end

    if (itemid == "churro" or itemid == "hotdog" or itemid == "chocobar" or itemid == "katsucurry" or itemid == "misosoup" or itemid == "teriyakichicken" or itemid == "boabun" or itemid == "chickennoodles") then
        TaskItem("mp_player_inteat@burger", "mp_player_int_eat_burger", 49,6000,"Eating","food:Condiment",true,itemid,playerVeh)
    end

    if (itemid == "greencow" or itemid == "franksmonster") then
        local fmMsg = itemid == "greencow" and "Drink" or "Shotgunning"
        local fmTimer = itemid == "greencow" and 6000 or 2000
        AttachPropAndPlayAnimation("amb@world_human_drinking@coffee@male@idle_a", "idle_c", 49,fmTimer,fmMsg,"food:Condiment",true,itemid,playerVeh)
    end

    if (itemid == "donut" or itemid == "applepie" or itemid == "eggsbacon" or itemid == "cookie" or itemid == "muffin") then
        AttachPropAndPlayAnimation("mp_player_inteat@burger", "mp_player_int_eat_burger", 49,6000,"Eating","food:Condiment",true,itemid,playerVeh)
    end

    if (itemid == "icecream" or itemid == "mshake" or itemid == "winemilkshake" or itemid == "softdrink") then
        TaskItem("mp_player_inteat@burger", "mp_player_int_eat_burger", 49,6000,"Eating","inv:fed2",true,itemid,playerVeh)
    end

    if (itemid == "advlockpick") then

        local myJob = exports["isPed"]:isPed("myJob")
        if myJob ~= "news" then
            TriggerEvent("inv:advlockPick")
            TriggerEvent("inv:advancedLockpick")
            
        else
            TriggerEvent("DoLongHudText","Nice news reporting, you shit lord idiot.")
        end

    end
    

    if (itemid == "safecrackingkit") then
        TriggerEvent('drp-robberies:HitSafes')
        local myJob = exports["isPed"]:isPed("myJob")
        if myJob ~= "news" then
            TriggerEvent('inv:advancedLockpick',inventoryName,slot)
        else
            TriggerEvent("DoLongHudText","Nice news reporting, you shit lord idiot.")
        end   
           -- remove = true
    end

    if (itemid == "heistlaptop2") then
        TriggerEvent("drp-paleto:distcheck")
    end

    if (itemid == "miningpickaxe") then
        TriggerEvent("drp-start-mining")
    end


    if (itemid == "heistlaptop3") then
        TriggerEvent("drp-fleeca:distcheck")
    end

    if (itemid == "heistlaptop4") then
        TriggerEvent("vault:laptopcheck")
    end
 
     if (itemid == "Gruppe6Card") then
        local police = exports["isPed"]:isPed("countpolice")
        if police >= 0 then
        local coordA = GetEntityCoords(PlayerPedId(), 1)
        local coordB = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 100.0, 0.0)
        -- local countpolice = exports["isPed"]:isPed("countpolice")
        local targetVehicle = getVehicleInDirection(coordA, coordB)
        if targetVehicle ~= 0 and GetHashKey("stockade") == GetEntityModel(targetVehicle) then
            local entityCreatePoint = GetOffsetFromEntityInWorldCoords(targetVehicle, 0.0, -4.0, 0.0)
            local coords = GetEntityCoords(PlayerPedId())
            local aDist = GetDistanceBetweenCoords(coords["x"], coords["y"],coords["z"], entityCreatePoint["x"], entityCreatePoint["y"],entityCreatePoint["z"])
            local cityCenter = vector3(-204.92, -1010.13, 29.55) -- alta street train station
            local timeToOpen = 45000
            local distToCityCenter = #(coords - cityCenter)
            if distToCityCenter > 1000 then
                local multi = math.floor(distToCityCenter / 1000)
                timeToOpen = timeToOpen + (30000 * multi)
            end
            if aDist < 2.0 then
                --TriggerEvent("alert:noPedCheck", "banktruck")
                local finished = exports["drp-taskbar"]:taskBar(timeToOpen,"Unlocking Vehicle",false,false,playerVeh)
                if finished == 100 then
                    remove = true
                    TriggerEvent("sec:AttemptHeist", targetVehicle)
                else
                    TriggerEvent("evidence:bleeding")
                end

            else
                TriggerEvent("DoLongHudText","You need to do this from behind the vehicle.")
            end
        end
    end
    end

    if (itemid == "repairkit") then
      TriggerEvent('veh:repairing',inventoryName,slot,itemid)
           
    end

    if (itemid =="advrepairkit") then
      TriggerEvent('veh:repairing',inventoryName,slot,itemid)
           
    end

    if (itemid == "huntingbait") then
        TriggerEvent('drp-hunting:usedBait')
    end

    if (itemid == "huntingknife") then
        TriggerEvent('drp-hunting:skinAnimal')
    end 

    if (itemid == "heistlaptop3") then
        TriggerEvent('drp-fleeca:UseGreenLapTop')
    end 


    -- TODO: Unused?
    -- if (itemid == "weed12oz") then
    --     TriggerEvent("inv:weedPacking")
    --     remove = true
    -- end

    if (itemid == "heavyammo") then
        local finished = exports["drp-taskbar"]:taskBar(5000,"Reloading",false,false,playerVeh)
        if (finished == 100) then
            TriggerEvent("actionbar:ammo",1788949567,50,true)
            remove = true
        end
    end

    if (itemid == "pistolammo") then
        local finished = exports["drp-taskbar"]:taskBar(2500,"Reloading",false,false,playerVeh)
        if (finished == 100) then
            TriggerEvent("actionbar:ammo",1950175060,50,true)
            remove = true
        end
    end

    if (itemid == "pistolammoPD") then
        local finished = exports["drp-taskbar"]:taskBar(2500,"Reloading",false,false,playerVeh)
        if (finished == 100) then
            TriggerEvent("actionbar:ammo",1950175060,50,true)
            remove = true
        end
    end

    if (itemid == "rifleammoPD") then
        local finished = exports["drp-taskbar"]:taskBar(5000,"Reloading",false,false,playerVeh)
        if (finished == 100) then
            TriggerEvent("actionbar:ammo",218444191,50,true)
            remove = true
        end
    end

    if (itemid == "shotgunammoPD") then
        local finished = exports["drp-taskbar"]:taskBar(5000,"Reloading",false,false,playerVeh)
        if (finished == 100) then
            TriggerEvent("actionbar:ammo",218444191,50,true)
            remove = true
        end
    end

    if (itemid == "subammoPD") then
        local finished = exports["drp-taskbar"]:taskBar(5000,"Reloading",false,false,playerVeh)
        if (finished == 100) then
            TriggerEvent("actionbar:ammo",1820140472,50,true)
            remove = true
        end
    end

    if (itemid == "flamethrowerammo") then
        local finished = exports["drp-taskbar"]:taskBar(20000,"Reloading flamethrower",false,false,playerVeh)
        if (finished == 100) then
            TriggerEvent("actionbar:ammo",1970280428,15000,true)
            remove = true
        end
    end

    if (itemid == "rifleammo") then
        local finished = exports["drp-taskbar"]:taskBar(5000,"Reloading",false,false,playerVeh)
        if (finished == 100) then
            TriggerEvent("actionbar:ammo",218444191,50,true)
            remove = true
        end
    end

    if (itemid == "sniperammo") then
        local finished = exports["drp-taskbar"]:taskBar(5000,"Reloading",false,false,playerVeh)
        if (finished == 100) then
            TriggerEvent("actionbar:ammo",1285032059,25,true)
            remove = true
        end
    end

    if (itemid == "huntingammo") then
        local finished = exports["drp-taskbar"]:taskBar(10000,"Reloading",false,false,playerVeh)
        if (finished == 100) then
            TriggerEvent("actionbar:ammo",1285032059,10,true)
            remove = true
        end
    end
    if (itemid == "widowmakerammo") then
        local finished = exports["drp-taskbar"]:taskBar(10000,"Reloading",false,false,playerVeh)
        if (finished == 100) then
            TriggerEvent("actionbar:ammo", -1614428030, 15000,true)
            remove = true
        end
    end
    if (itemid == "rpgammo") then
        local finished = exports["drp-taskbar"]:taskBar(25000,"Reloading",false,false,playerVeh)
        if (finished == 100) then
            TriggerEvent("actionbar:ammo",1742569970,1,true)
            remove = true
        end
    end
    

    if (itemid == "shotgunammo") then
        local finished = exports["drp-taskbar"]:taskBar(5000,"Reloading",false,false,playerVeh)
        if (finished == 100) then
            TriggerEvent("actionbar:ammo",-1878508229,50,true)
            remove = true
        end
    end

    if (itemid == "subammo") then
        local finished = exports["drp-taskbar"]:taskBar(5000,"Reloading",false,false,playerVeh)
        if (finished == 100) then
            TriggerEvent("actionbar:ammo",1820140472,50,true)
            remove = true
        end
    end

    if (itemid == "nails") then
        local finished = exports["drp-taskbar"]:taskBar(5000,"Reloading",false,false,playerVeh)
        if (finished == 100) then
            TriggerEvent("actionbar:ammo",965225813,50,true)
            remove = true
        end
    end

    if (itemid == "paintballs") then
        local finished = exports["drp-taskbar"]:taskBar(5000,"Reloading",false,false,playerVeh)
        if (finished == 100) then
            TriggerEvent("actionbar:ammo",1916856719,100,true)
            remove = true
        end
    end

    if (itemid == "rubberslugs") then
        local finished = exports["drp-taskbar"]:taskBar(5000,"Reloading",false,false,playerVeh)
        if (finished == 100) then
            TriggerEvent("actionbar:ammo",1517835987,10,true)
            remove = true
        end
    end

    if (itemid == "taserammo") then
        local finished = exports["drp-taskbar"]:taskBar(2000,"Reloading",false,false,playerVeh)
        if (finished == 100) then
            TriggerEvent("actionbar:ammo",-1575030772,3,true)
            remove = true
        end
    end

    if (itemid == "empammo") then
        local finished = exports["drp-taskbar"]:taskBar(30000,"Recharging EMP",false,false,playerVeh)
        if (finished == 100) then
            TriggerEvent("actionbar:ammo",2034517757,2,true)
            remove = true
        end
    end

    if (itemid == "fishingrod") then
       
            TriggerEvent("drp-fishing:start-fishing")
            --remove = true
       
    end
   
    if (itemid == "armor" or itemid == "pdarmor") then
        local finished = exports["drp-taskbar"]:taskBar(5000,"Armor",true,false,playerVeh)
        if (finished == 100) then
            SetPlayerMaxArmour(PlayerId(), 100 )
            SetPedArmour( player, 20 )
            TriggerEvent("UseBodyArmor")
            remove = true
        end
    end

    if (itemid == "cbrownie" or itemid == "cgummies") then
        TriggerEvent("animation:PlayAnimation","pill")
        local finished = exports["drp-taskbar"]:taskBar(3000,"Consuming edibles 😉",false,false,playerVeh)
        if (finished == 100) then
            TriggerEvent("Evidence:StateSet",3,1200)
            TriggerEvent("Evidence:StateSet",7,1200)
            TriggerEvent("fx:run", "weed", 180, -1, false)
            remove = true
        end
    end

    if (itemid == "bodybag") then
        local finished = exports["drp-taskbar"]:taskBar(10000,"Opening bag",true,false,playerVeh)
        if (finished == 100) then
            remove = true
            TriggerEvent( "player:receiveItem", "humanhead", 1 )
            TriggerEvent( "player:receiveItem", "humantorso", 1 )
            TriggerEvent( "player:receiveItem", "humanarm", 2 )
            TriggerEvent( "player:receiveItem", "humanleg", 2 )
        end
    end

    if (itemid == "bodygarbagebag") then
            local finished = exports["drp-taskbar"]:taskBar(10000,"Opening trash bag",false,false,playerVeh)
            if (finished == 100) then
                remove = true
                TriggerServerEvent('loot:useItem', itemid)
            end
    end

    if (itemid == "newaccountbox") then
        local finished = exports["drp-taskbar"]:taskBar(5000,"Opening present",false,false,playerVeh)
        if (finished == 100) then
            remove = true
            TriggerServerEvent('loot:useItem', itemid)
        end
    end

    if (itemid == "foodsupplycrate") then
        TriggerEvent("DoLongHudText","Make sure you have a ton of space in your inventory! 100 or more.",2)
        local finished = exports["drp-taskbar"]:taskBar(20000,"Opening the crate (ESC to Cancel)",false,false,playerVeh)
        if (finished == 100) then
            remove = true
            TriggerEvent( "player:receiveItem", "heartstopper", 10 )
            TriggerEvent( "player:receiveItem", "moneyshot", 10 )
            TriggerEvent( "player:receiveItem", "bleederburger", 10 )
            TriggerEvent( "player:receiveItem", "fries", 10 )
            TriggerEvent( "player:receiveItem", "cola", 10 )
        end
    end

    if (itemid == "fishingtacklebox") then
        local finished = exports["drp-taskbar"]:taskBar(5000,"Opening",true,false,playerVeh)
        if (finished == 100) then
            remove = true
            TriggerServerEvent('loot:useItem', itemid)
        end
    end

    if (itemid == "housesafe") then
        if not hasEnoughOfItem("heavydutydrill", 1, false) then
            TriggerEvent("DoLongHudText", "Seems like you need something to get into this...", 2)
        else
            local finished = exports["drp-taskbar"]:taskBar(30000, "Cracking Safe...", true, false)
            if (finished == 100) then
                remove = true
                TriggerServerEvent('loot:useItem', itemid)
            end
        end

    end

    if (itemid == "pixellaptop") then
        local finished = exports["drp-taskbar"]:taskBar(3500,"Powering UP",false,false,playerVeh)
        if (finished == 100) then
            TriggerEvent("drp-boosting:openLaptop")
        end
    end

    if (itemid == "tunerlaptop") then
        local finished = exports["drp-taskbar"]:taskBar(3500,"Powering UP",false,false,playerVeh)
        if (finished == 100) then
            TriggerEvent("durp:tunercars")
            TriggerEvent("tunacatalogue")
        end
    end

    if (itemid == "durpman") then
        local finished = exports["drp-taskbar"]:taskBar(1500,"Opening",false,false,playerVeh)
        if (finished == 100) then
            TriggerEvent("attemt:play:song")
        end
    end
    
    if (itemid == "disabler") then
        local finished = exports["drp-taskbar"]:taskBar(500,"Powering UP",false,false,playerVeh)
        if (finished == 100) then
            TriggerEvent("boosting:DisablerUsed")
        end
    end

    if (itemid == "fishingchest") then
        local finished = exports["drp-taskbar"]:taskBar(5000, "Opening Chest", true, false)
        if (finished == 100) then
            remove = true
            TriggerServerEvent('loot:useItem', itemid)
        end
    end

    if (itemid == "keychain") then 
        TriggerEvent("event:control:openpersonal");
    end

    if (itemid == "repcrate") then
        local finished = exports["drp-taskbar"]:taskBar(30000, "Opening...", true, false)
        if (finished == 100) then
            remove = true
            TriggerServerEvent('loot:useItem', itemid)
        end
    end

    if (itemid == "babyoil") then
        local finished = exports["drp-taskbar"]:taskBar(10000,"Applying baby oil to dome",true,false,playerVeh)
        if (finished == 100) then
            remove = true
            TriggerEvent("DoLongHudText","Your dome is now shiny AF!",5)
        end
    end

    if (itemid == "fishinglockbox") then
        local finished = exports["drp-taskbar"]:taskBar(5000,"Opening",true,false,playerVeh)
        if (finished == 100) then
            --remove = true
            --TriggerServerEvent('loot:useItem', itemid)
            TriggerEvent("DoLongHudText","Add your map thing here DW you fucking fuck fuck",2)
        end
    end

    if (itemid == "organcooler") then
        local finished = exports["drp-taskbar"]:taskBar(5000,"Opening cooler",true,false,playerVeh)
        if (finished == 100) then
            remove = true
            TriggerEvent( "player:receiveItem", "humanheart", 1 )
            TriggerEvent( "player:receiveItem", "organcooleropen", 1 )
        end
    end

    if itemid == "humanhead" then
        TaskItem("mp_player_inteat@burger", "mp_player_int_eat_burger", 49, 10000, "Eating (ESC to Cancel)", "inv:wellfed", true,itemid,playerVeh,true,"humanskull")
    end

    if (itemid == "humantorso" or itemid == "humanarm" or itemid == "humanhand" or itemid == "humanleg" or itemid == "humanfinger") then
        TaskItem("mp_player_inteat@burger", "mp_player_int_eat_burger", 49, 10000, "Eating (ESC to Cancel)", "inv:wellfed", true,itemid,playerVeh,true,"humanbone")
    end

    if (itemid == "humanear" or itemid == "humanintestines" or itemid == "humanheart" or itemid == "humaneye" or itemid == "humanbrain" or itemid == "humankidney" or itemid == "humanliver" or itemid == "humanlungs" or itemid == "humantongue" or itemid == "humanpancreas") then
        TaskItem("mp_player_inteat@burger", "mp_player_int_eat_burger", 49, 10000, "Eating (ESC to Cancel)", "inv:wellfed", true,itemid)
    end

    if (itemid == "Bankbox") then
        if (hasEnoughOfItem("locksystem",1,false)) then
            local finished = exports["drp-taskbar"]:taskBar(10000,"Opening bank box.",false,false,playerVeh)
            if (finished == 100) then
                remove = true
                TriggerEvent("inventory:removeItem","locksystem", 1)

                TriggerServerEvent('loot:useItem', itemid)
            end
        else
            TriggerEvent("DoLongHudText","You are missing something to open the box with",2)
        end
    end

    if (itemid == "Securebriefcase") then
        if (hasEnoughOfItem("Bankboxkey",1,false)) then
            local finished = exports["drp-taskbar"]:taskBar(5000,"Opening briefcase.",false,false,playerVeh)
            if (finished == 100) then
                remove = true
                TriggerEvent("inventory:removeItem","Bankboxkey", 1)

                TriggerServerEvent('loot:useItem', itemid)
            end
        else
            TriggerEvent("DoLongHudText","You are missing something to open the briefcase with",2)
        end
    end

    if (itemid == "Largesupplycrate") then
        if (hasEnoughOfItem("2227010557",1,false)) then
            local finished = exports["drp-taskbar"]:taskBar(15000,"Opening supply crate.",false,false,playerVeh)
            if (finished == 100) then
                remove = true
                TriggerEvent("inventory:removeItem","2227010557", 1)

                TriggerServerEvent('loot:useItem', itemid)
            end
        else
            TriggerEvent("DoLongHudText","You are missing something to open the crate with",2)
        end
    end

    if (itemid == "xmasgiftcoal") then
        local finished = exports["drp-taskbar"]:taskBar(15000, "Opening Gift", false, false, playerVeh)
        if (finished == 100) then
            remove = true
            TriggerServerEvent('loot:useItem', itemid)
        end
    end

    if (itemid == "Smallsupplycrate") then
        if (hasEnoughOfItem("2227010557",1,false)) then
            local finished = exports["drp-taskbar"]:taskBar(15000,"Opening supply crate.",false,false,playerVeh)
            if (finished == 100) then
                remove = true
                TriggerEvent("inventory:removeItem","2227010557", 1)

                TriggerServerEvent('loot:useItem', itemid)
            end
        else
            TriggerEvent("DoLongHudText","What, are you going to break it open with your hands?",2)
        end
    end

    if (itemid == "Smallsupplycrate2") then
        if (hasEnoughOfItem("2227010557",1,false)) then
            local finished = exports["drp-taskbar"]:taskBar(15000,"Opening supply crate.",false,false,playerVeh)
            if (finished == 100) then
                remove = true
                TriggerEvent("inventory:removeItem","2227010557", 1)

                TriggerServerEvent('loot:useItem', itemid)
            end
        else
            TriggerEvent("DoLongHudText","What, are you going to break it open with your hands?",2)
        end
    end

    if (itemid == "Mediumsupplycrate") then
        if (hasEnoughOfItem("2227010557",1,false)) then
            local finished = exports["drp-taskbar"]:taskBar(15000,"Opening supply crate.",false,false,playerVeh)
            if (finished == 100) then
                remove = true
                TriggerEvent("inventory:removeItem","2227010557", 1)

                TriggerServerEvent('loot:useItem', itemid)
            end
        else
            TriggerEvent("DoLongHudText","What, are you going to break it open with your hands?",2)
        end
    end

    if (itemid == "emptyballoon") then
        if (hasEnoughOfItem("nitrous",1,false)) then
            local finished = exports["drp-taskbar"]:taskBar(5000,"Filling Balloon.",false,false,playerVeh)
            if (finished == 100) then
                remove = true
                TriggerEvent( "player:receiveItem","nosballoon",1)
            end
        else
            TriggerEvent("DoLongHudText","You need a bottle to fill the balloon with.",2)
        end
    end

    if (itemid == "Peecup_empty") then
        if preventspam == 0 then
        Citizen.CreateThread(function()
            preventspam = 1
            TriggerEvent("animation:PlayAnimation","pee")
            --TaskPlayAnim(PlayerPedId(), "misscarsteal2peeing", "peeing_loop", 20.0, -8, -1, 49, 0, false, false, false)
            PeeingID = GetRandomString(12)
            TriggerServerEvent("fx:pee:start", PeeingID)

            local animationplaying = true
            Citizen.CreateThread(function()
                 while animationplaying do
                     if not IsEntityPlayingAnim(PlayerPedId(), "misscarsteal2peeing", "peeing_loop", 3) then
                         TaskPlayAnim(PlayerPedId(), "misscarsteal2peeing", "peeing_loop", 20.0, -8, -1, 49, 0, false, false, false)
                     end
                     Citizen.Wait(100)
                 end
            end)

            Citizen.Wait(10000)
            animationplaying = false
            TriggerEvent("animation:PlayAnimation","cancel")
            Citizen.Wait(50000)
            preventspam = 0
        end)
        local finished = exports["drp-taskbar"]:taskBar(10000, "Peeing in cup.", false, false, playerVeh)
        if (finished == 100) then
            remove = true
            TriggerEvent( "player:receiveItem","Peecup_full",1)
        end
        else
            TriggerEvent("DoLongHudText","You just peed! Try again later.",2)
        end
    end
    
    if itemid == "Peecup_full" then
        local success = AttachPropAndPlayAnimation("amb@world_human_drinking@beer@female@idle_a", "idle_e", 49,7500,"Drinking pee.","food:SoftDrink",true,itemid,playerVeh)
        if success and math.random() > 0.50 then
            TriggerServerEvent("fx:puke")
            TriggerEvent("animation:PlayAnimation","outofbreath")
            TaskPlayAnim(PlayerPedId(), "re@construction", "out_of_breath", 20.0, -8, -1, 49, 0, false, false, false)
            Citizen.Wait(6000)
            TriggerEvent("animation:PlayAnimation","cancel")
        end
    end

    if (itemid == "binoculars") then
        TriggerEvent("binoculars:Activate")
    end

    if (itemid == "camera") then
        TriggerEvent("camera:Activate")
    end

    if (itemid == "megaphone") then
      TriggerEvent("drp-usableprops:megaphone")
    end

    if (itemid == "nitrous") then
        local currentVehicle = GetVehiclePedIsIn(player, false)

        if currentVehicle == nil or currentVehicle == 0 then
            TriggerEvent("attachItem","nosbottle")
            TaskItem("amb@code_human_wander_idles@male@idle_a", "idle_b_rubnose", 49, 2800, "Sniff Sniff", "hadnitrous", false, itemid, playerVeh)
            TriggerEvent("destroyProp")
        elseif not IsToggleModOn(currentVehicle, 18) then
            TriggerEvent("DoLongHudText","You need a Turbo to use NOS!", 2)
        else
            local finished = 0
            local cancelNos = false
            Citizen.CreateThread(function()
                while finished ~= 100 and not cancelNos do
                    Citizen.Wait(100)
                    if GetEntitySpeed(GetVehiclePedIsIn(player, false)) > 11 then
                        exports["drp-taskbar"]:closeGuiFail()
                        cancelNos = true
                    end
                end
            end)
            finished = exports["drp-taskbar"]:taskBar(20000,"Nitrous")
            if (finished == 100 and not cancelNos) then
                TriggerEvent("NosStatus")
                TriggerEvent("vehicle:addNos", "large")
                TriggerEvent("noshud", 100, false)
                remove = true
            else
                TriggerEvent("DoLongHudText","You can't drive and hook up nos at the same time.",2)
            end
        end
    end

    if (itemid == "methtable") then
   
        TriggerEvent("methjob_place")
    remove = true
end

    if (itemid == "lockpick") then
        TriggerEvent('drp-heists:distcheckpower')
        -- TriggerEvent("inv:advancedLockpick")
        TriggerEvent('drp-robberies:HitRegister')
        local myJob = exports["isPed"]:isPed("myJob")
        if myJob ~= "news" then
            TriggerEvent("inv:lockPick",false,inventoryName,slot)
        else
            TriggerEvent("DoLongHudText","Nice news reporting, you shit lord idiot.")
        end
    end

    if (itemid == "godlockpick") then
        local myJob = exports["isPed"]:isPed("myJob")
        if myJob ~= "news" then
            TriggerEvent("inv:lockPick2", false, inventoryName, slot, "godlockpick")

        else
            TriggerEvent("DoLongHudText","Nice news reporting, you shit lord idiot.")
        end
    end

    if (itemid == "hackingdevice") then
        local myJob = exports["isPed"]:isPed("myJob")
        if myJob ~= "news" then
            TriggerEvent("inv:lockPick", false, inventoryName, slot, "hackingdevice")

        else
            TriggerEvent("DoLongHudText","Nice news reporting, you shit lord idiot.")
        end
    end

    if (itemid == "umbrella") then
        TriggerEvent("animation:PlayAnimation","umbrella")

    end

    if (itemid == "securityblue" or itemid == "securityblack" or itemid == "securitygreen" or itemid == "securitygold" or itemid == "securityred")  then
        TriggerEvent("robbery:scanLock",false,itemid)
    end

    if (itemid == "Gruppe6Card2")  then
        TriggerServerEvent("robbery:triggerItemUsedServer",itemid)
    end

    if (itemid == "Gruppe6Card222")  then
        TriggerServerEvent("robbery:triggerItemUsedServer",itemid)
    end

    if (itemid == "ciggypack" or itemid == "customciggyitem") then
        TriggerEvent( "player:receiveItem","ciggy",1)
        TriggerEvent("inventory:DegenLastUsedItem",1)
       -- TriggerServerEvent("inventory:degItem",ItemInfo.id)
    end

    if (itemid == "ciggy") then
        local finished = exports["drp-taskbar"]:taskBar(1000,"Lighting Up",false,false,playerVeh)
        if (finished == 100) then
            Wait(300)
            TriggerEvent("animation:PlayAnimation","smoke")
        end
    end

    if (itemid == "golfballpack") then
        TriggerEvent("player:receiveItem", "golfball", 1)
        TriggerEvent("inventory:DegenLastUsedItem", 5)
    end

    if (itemid == "golfballpackpink") then
        TriggerEvent("player:receiveItem", "golfballpink", 1)
        TriggerEvent("inventory:DegenLastUsedItem", 5)
    end

    if (itemid == "golfballpackorange") then
        TriggerEvent("player:receiveItem", "golfballorange", 1)
        TriggerEvent("inventory:DegenLastUsedItem", 5)
    end

    if (itemid == "golfballpackyellow") then
        TriggerEvent("player:receiveItem", "golfballyellow", 1)
        TriggerEvent("inventory:DegenLastUsedItem", 5)
    end
    
    if (itemid == "cigar") then
        local finished = exports["drp-taskbar"]:taskBar(1000,"Lighting Up",false,false,playerVeh)
        if (finished == 100) then
            Wait(300)
            TriggerEvent("animation:PlayAnimation","cigar")
        end
    end

    if (itemid == "oxygentank") then
        local finished = exports["drp-taskbar"]:taskBar(30000,"Oxygen Tank",true,false,playerVeh)
        if (finished == 100) then
            TriggerEvent("UseOxygenTank")
            remove = true
        end
    end

    
    if (itemid == "nightvisiongoggles") then
            TriggerEvent("nightvision:toggle")
    end

    if (itemid == "bandage" or itemid == "custombandageitem") then
        TaskItem("amb@world_human_clipboard@male@idle_a", "idle_c", 49,10000,"Healing","healed:minors",true,itemid,playerVeh)
    end

    if (itemid == "bandagelarge") then
        TriggerEvent("inventory:DegenLastUsedItem", 33)
        TaskItem(
            "amb@world_human_clipboard@male@idle_a",
            "idle_c",
            49,
            10000,
            "Healing",
            "healed:minors",
            false,
            itemid,
            playerVeh
        )
        Citizen.CreateThread(function()
            Wait(32000)
            TriggerEvent("healed:minors")
            Wait(32000)
            TriggerEvent("healed:minors")
        end)
    end

    if (itemid == "cocainebrick") then
        CreateCraftOption("1gcocaine", 100, true)
    end    
    
    if (itemid == "bakingsoda") then
        CreateCraftOption("1gcrack", 80, true)
    end

    if (itemid == "glucose") then
        CreateCraftOption("1gcocaine", 80, true)
    end

    if (itemid == "idcard") then 
        local ItemInfo = GetItemInfo(slot)
        TriggerServerEvent("police:showID",ItemInfo.information)    
    end

    if (itemid == "adrenaline") then
        TaskItem("amb@world_human_clipboard@male@idle_a", "idle_c", 49,1000,"POG GAMING Adrenaline","inventory:adrenaline",true,itemid,playerVeh)
    end

    if (itemid == "laxative") then
            remove = true
            Citizen.CreateThread(function()
                Wait(math.random(10000,120000))
                TriggerEvent("animation:PlayAnimation","shit")
                Wait(2000)
                PooingID = GetRandomString(12)
                TriggerServerEvent("fx:poo:start", PooingID)
                Wait(10000)
                TriggerEvent("animation:PlayAnimation","cancel")
            end)
    end

    if (itemid == "Desomorphine") then
        local success = TaskItem("amb@world_human_clipboard@male@idle_a", "idle_c", 49,5000,"Injecting Desomorphine","inventory:adrenaline",true,itemid,playerVeh)
        if success then
            TriggerEvent( "player:receiveItem","Desomorphine_used",1)
            WillOD = WillOD + 1
            TriggerEvent("Evidence:StateSet",2,1200)
            TriggerEvent("Evidence:StateSet",24,1200)
            TriggerEvent("fx:run", "metamorphine", 180, -1, false)
            if not HasAnimSetLoaded("move_m@drunk@slightlydrunk") then
                RequestAnimSet("move_m@drunk@slightlydrunk")
                while not HasAnimSetLoaded("move_m@drunk@slightlydrunk") do
                  Citizen.Wait(0)
                end
            end
            SetPedMovementClipset(PlayerPedId(), "move_m@drunk@slightlydrunk", 1.0)

            local ufoModelHash = GetHashKey("dt1_tc_dufo_core_np")
            RequestModel(ufoModelHash)
            
            while not HasModelLoaded(ufoModelHash) do
                Citizen.Wait(1)
            end

            local coords = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 25.0, 25.0, 100.0)
            local ufoObject = CreateObject(ufoModelHash, coords, false, false, false)
            SetEntityLodDist(ufoObject,	500)

            Citizen.CreateThread(function()
                Wait(1000*180)
                DeleteObject(ufoObject)
            end)

            local drugEffect = true
            Citizen.CreateThread(function()
              while drugEffect do
                  Wait(10000)
                  local curVeh = GetVehiclePedIsIn(PlayerPedId(), false)
                    if math.random() < 0.11 then
                        SetPedToRagdoll(PlayerPedId(), 5500, 5500, 0, 0, 0, 0)
                    end
                    if math.random() < 0.11 then
                        TaskVehicleTempAction(PlayerPedId(), curVeh, randomDrivingActions[math.random(#randomDrivingActions)], 4000)
                    end
                  SetEntityHealth(PlayerPedId(), GetEntityHealth(PlayerPedId()) - 1)
                  if GetEntityHealth(PlayerPedId()) < 105 then
                      drugEffect = false
                      TriggerEvent("fx:run", "weed", 180, -1, false)
                      if math.random() < 0.70 then
                        TriggerServerEvent("fx:puke")
                        TriggerEvent("animation:PlayAnimation","outofbreath")
                        TaskPlayAnim(PlayerPedId(), "re@construction", "out_of_breath", 20.0, -8, -1, 49, 0, false, false, false)
                        Citizen.Wait(6000)
                        TriggerEvent("animation:PlayAnimation","cancel")
                      end
                      Wait(10000)
                      if math.random() < 0.25 or WillOD >= 3 then
                        SetEntityHealth(PlayerPedId(), GetEntityHealth(PlayerPedId()) - 100)
                        WillOD = 0
                      else
                        SetEntityHealth(PlayerPedId(), 150)
                      end
                  end
              end
            end)
        end
    end 

    if (itemid == "drivingtest") then
        local ItemInfo = GetItemInfo(slot)
        if (ItemInfo.information ~= "No information stored") then
            local data = json.decode(ItemInfo.information)
            TriggerServerEvent("driving:getResults", data.ID)
        end
    end

    if (itemid == "1gcocaine") then
        TriggerEvent("attachItemObjectnoanim","drugpackage01")
        TriggerEvent("Evidence:StateSet",2,1200)
        TriggerEvent("Evidence:StateSet",6,1200)
        TaskItem("anim@amb@nightclub@peds@", "missfbi3_party_snort_coke_b_male3", 49, 5000, "Coke Gaming", "hadcocaine", true,itemid,playerVeh)
    end

    if (itemid == "1gcrack") then
        TriggerEvent("attachItemObjectnoanim","crackpipe01")
        TriggerEvent("Evidence:StateSet",2,1200)
        TriggerEvent("Evidence:StateSet",6,1200)
        TaskItem("switch@trevor@trev_smoking_meth", "trev_smoking_meth_loop", 49, 5000, "Smoking Quack", "hadcrack", true,itemid,playerVeh)
    end

    if (itemid == "nosballoon") then
        TriggerEvent("Evidence:StateSet",2,1200)
        TriggerEvent("Evidence:StateSet",6,1200)
        TaskItem("switch@trevor@trev_smoking_meth", "trev_smoking_meth_loop", 49, 5000, "Huffing Nos", "hadcrack", true,itemid,playerVeh)
    end

    if (itemid == "treat") then
        local model = GetEntityModel(player)
        if validDogModels[model] then
            TaskItem("mp_player_inteat@burger", "mp_player_int_eat_burger", 49, 1200, "Treat Num's", "hadtreat", true,itemid,playerVeh)
        end
    end

    if (itemid == "IFAK") then
        TaskItem("amb@world_human_clipboard@male@idle_a", "idle_c", 49,2000,"Applying IFAK","healed:useOxy",true,itemid,playerVeh)
    end

    if (has_value(fruits, itemid)) then
        AttachPropAndPlayAnimation("mp_player_inteat@burger", "mp_player_int_eat_burger", 49,6000,"Eating",true,itemid,playerVeh)
        TriggerEvent("drp-hud:ChangeHunger", 40)
    end


    if (itemid == "oxy") then
        TriggerEvent("animation:PlayAnimation","pill")
        TriggerEvent("healed:useOxy", true)
        remove = true
    end

    if (itemid == "oxybettalife") then
        TriggerEvent("animation:PlayAnimation","pill")
        TriggerEvent("healed:useOxy", true, true)
        remove = true
    end

    if (itemid == "experiment_01"
    or itemid == "experiment_02"
    or itemid == "experiment_03"
    or itemid == "experiment_04"
    or itemid == "experiment_05"
    or itemid == "experiment_06"
    or itemid == "experiment_07"
    or itemid == "experiment_08"
    or itemid == "experiment_09") then
        TriggerEvent("animation:PlayAnimation","pill")
        local finished = exports["drp-taskbar"]:taskBar(3000,"Downing content of bottle. 💊",false,false,playerVeh)
        if (finished == 100) then
            if math.random() < 0.20 then
                TriggerServerEvent("fx:puke")
                TriggerEvent("animation:PlayAnimation","outofbreath")
                TaskPlayAnim(PlayerPedId(), "re@construction", "out_of_breath", 20.0, -8, -1, 49, 0, false, false, false)
                Citizen.Wait(6000)
                
                TriggerEvent("animation:PlayAnimation","cancel")
            end
            if math.random() < 0.50 then
                TriggerEvent("fx:run", randomEffects[math.random(#randomEffects)], 280, -1, false)
            end
            remove = true
        end
    end

    if (itemid == "pillbox") then
        local finished = exports["drp-taskbar"]:taskBar(5000, "Opening pill box", false, false, playerVeh)
        if (finished == 100) then
            TriggerEvent( "player:receiveItem", "experiment_01", 5 )
            TriggerEvent( "player:receiveItem", "experiment_02", 5 )
            TriggerEvent( "player:receiveItem", "experiment_03", 5 )
            TriggerEvent( "player:receiveItem", "experiment_04", 5 )
            TriggerEvent( "player:receiveItem", "experiment_05", 5 )
            TriggerEvent( "player:receiveItem", "experiment_06", 5 )
            TriggerEvent( "player:receiveItem", "experiment_07", 5 )
            TriggerEvent( "player:receiveItem", "experiment_08", 5 )
            TriggerEvent( "player:receiveItem", "experiment_09", 5 )
        end
    end

    if itemid == "frankstruth" then
        TriggerEvent("animation:PlayAnimation","pill")
        remove = true
    end

    if itemid == "copium" then
        local success = TaskItem("switch@trevor@trev_smoking_meth", "trev_smoking_meth_loop", 49, 10000, "Taking a hit of copium", "hadtreat", true,itemid,playerVeh)
        if success then
            SetPedToRagdoll(PlayerPedId(), 30000, 30000, 0, 0, 0, 0)
        end
    end

    if sandwichItems[itemid] or deanworldFood[itemid] then
        AttachPropAndPlayAnimation(
          "mp_player_inteat@burger",
          "mp_player_int_eat_burger",
          49,
          6000,
          "Eating",
          not customMarketItems[itemid],
          itemid,
          playerVeh
        )
        remove = true
        TriggerEvent("drp-hud:ChangeHunger", 25)
    end

    if itemid == "customfooditem" then
        TriggerEvent("drp-hud:ChangeHunger", 100)
    end

    if deanworldFood[itemid] then
      TriggerEvent("DoLongHudText", "Ew, tastes like shit.", 2)
      if math.random() < 0.05 then
        TriggerServerEvent("fx:puke")
      end
    end

    if waterItems[itemid] then
        --attachPropsToAnimation(itemid, 6000)
        --TaskItem("amb@world_human_drinking@coffee@male@idle_a", "idle_c", 49,6000,"Drink","changethirst",true,itemid)
        AttachPropAndPlayAnimation(
          "amb@world_human_drinking@beer@female@idle_a", 
          "idle_e", 
          49,
          6000,
          "Drink",
          not customMarketItems[itemid],
          itemid,
          playerVeh
        )
        TriggerEvent("drp-hud:ChangeThirst", 30)
        remove = true
    end

    if itemid == "customwateritem" then
        TriggerEvent("drp-hud:ChangeThirst", 100)
    end

    if itemid == "kdragonwater" then
        --attachPropsToAnimation(itemid, 6000)
        --TaskItem("amb@world_human_drinking@coffee@male@idle_a", "idle_c", 49,6000,"Drink","changethirst",true,itemid)
        AttachPropAndPlayAnimation(
          "amb@world_human_drinking@beer@female@idle_a",
          "idle_e", 
          49,
          6000,
          "Drink",
          "drp-katana:transformKFromDrink",
          true,
          itemid,
          playerVeh
        )
        remove = true
    end


    if (itemid == "bleederburger"
      or itemid == "heartstopper"
      or itemid == "torpedo"
      or itemid == "meatfree"
      or itemid == "moneyshot"
      or itemid == "maccheese"
      or itemid == "questionablemeatburger"
      or itemid == "panini"
      or itemid == "pizza"
      or itemid == "pancakes"
      or itemid == "wings"
    ) then
        AttachPropAndPlayAnimation("mp_player_inteat@burger", "mp_player_int_eat_burger", 49,6000,"Eating","inv:wellfed",true,itemid,playerVeh)
        --attachPropsToAnimation(itemid, 6000)
        --TaskItem("mp_player_inteat@burger", "mp_player_int_eat_burger", 49, 6000, "Eating", "inv:wellfed", true,itemid)
    end

    if (itemid == "sushiplate"
      or itemid == "sushiplatec"
      or itemid == "beefdish"
      or itemid == "beefdishc"
      or itemid == "ramen"
    ) then
        local success = AttachPropAndPlayAnimation("mp_player_inteat@burger", "mp_player_int_eat_burger", 49,6000,"Eating","inv:wellfedNoStress",true,itemid,playerVeh)
        if success then
          TriggerEvent("DoLongHudText", "You feel lucky.")
          TriggerEvent("buffs:triggerBuff", itemid)
          TriggerServerEvent("buffs:triggerBuff", itemid)
        end
    end

    if (itemid == "blue_rare_steak"
      or itemid == "rare_steak"
      or itemid == "medium_rare_steak"
      or itemid == "medium_steak"
      or itemid == "medium_well_steak"
      or itemid == "well_done_steak"
    ) then
        local success = AttachPropAndPlayAnimation("mp_player_inteat@burger", "mp_player_int_eat_burger", 49,6000,"Eating","inv:wellfedNoStress",true,itemid,playerVeh)
        if success then
          TriggerEvent("DoLongHudText", "Hmmm.. delicious.")
          TriggerEvent("buffs:triggerBuff", itemid)
          TriggerServerEvent("buffs:triggerBuff", itemid)
        end
    end

    if (itemid == "methlabproduct") then
        local finished = exports["drp-ui"]:taskBarSkill(2400, math.random(12, 18))
        if finished == 100 then
            TriggerEvent("attachItemObjectnoanim","crackpipe01")
            TriggerEvent("Evidence:StateSet",2,1200)
            TriggerEvent("Evidence:StateSet",6,1200)

            TaskItem(
              "switch@trevor@trev_smoking_meth",
              "trev_smoking_meth_loop",
              49,
              1500,
              "Smoking Meth",
              "hadmeth",
              true,
              itemid,
              playerVeh,
              nil,
              nil,
              json.decode(passedItemInfo).purity
          )
        end
    end

    if itemid == "ketamine" then
        local finished = exports["drp-ui"]:taskBarSkill(2000, math.random(10, 15))
        if finished == 100 then
            TriggerEvent("attachItemObjectnoanim","drugpackage01")
            TriggerEvent("Evidence:StateSet",2,1200)
            TriggerEvent("Evidence:StateSet",6,1200)
            TaskItem("anim@amb@nightclub@peds@", "missfbi3_party_snort_coke_b_male3", 49, 5000, "Entering the K-Hole", "inventory:ketamine", true,itemid,playerVeh, nil, nil, json.decode(passedItemInfo).purity)
        end
    end

    if (itemid == "shiningpack") then ---------------- DONE 
        TriggerEvent('drp-pokemon:openPack', itemid)
    end
    
    if (itemid == "bulbasaur") then ---------------- DONE 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("drp-pokemon:previewCard", itemid, ItemInfo.information)
    end  

    if (itemid == "ivysaur") then ---------------- DONE 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("drp-pokemon:previewCard", itemid, ItemInfo.information)
    end  

    if (itemid == "shroomish") then ---------------- DONE 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("drp-pokemon:previewCard", itemid, ItemInfo.information)
    end  

    if (itemid == "breloom") then ---------------- DONE 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("drp-pokemon:previewCard", itemid, ItemInfo.information)
    end 

    if (itemid == "torkoal") then ---------------- DONE 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("drp-pokemon:previewCard", itemid, ItemInfo.information)
    end 
    
    if (itemid == "larvesta") then ---------------- DONE 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("drp-pokemon:previewCard", itemid, ItemInfo.information)
    end    

    if (itemid == "litten") then ---------------- DONE 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("drp-pokemon:previewCard", itemid, ItemInfo.information)
    end  

    if (itemid == "torracat") then ---------------- DONE 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("drp-pokemon:previewCard", itemid, ItemInfo.information)
    end  

    if (itemid == "totodile") then ---------------- DONE 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("drp-pokemon:previewCard", itemid, ItemInfo.information)
    end  

    if (itemid == "croconaw") then ---------------- DONE 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("drp-pokemon:previewCard", itemid, ItemInfo.information)
    end  

    if (itemid == "qwilfish") then ---------------- DONE 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("drp-pokemon:previewCard", itemid, ItemInfo.information)
    end  

    if (itemid == "buizel") then ---------------- DONE 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("drp-pokemon:previewCard", itemid, ItemInfo.information)
    end  

    if (itemid == "pikachu") then ---------------- DONE 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("drp-pokemon:previewCard", itemid, ItemInfo.information)
    end  

    if (itemid == "voltorb") then ---------------- DONE 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("drp-pokemon:previewCard", itemid, ItemInfo.information)
    end  

    if (itemid == "plusle") then ---------------- DONE 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("drp-pokemon:previewCard", itemid, ItemInfo.information)
    end 

    if (itemid == "minun") then ---------------- DONE 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("drp-pokemon:previewCard", itemid, ItemInfo.information)
    end 

    if (itemid == "ekans") then ---------------- DONE 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("drp-pokemon:previewCard", itemid, ItemInfo.information)
    end 

    if (itemid == "jynx") then ---------------- DONE 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("drp-pokemon:previewCard", itemid, ItemInfo.information)
    end 

    if (itemid == "golett") then ---------------- DONE 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("drp-pokemon:previewCard", itemid, ItemInfo.information)
    end 
    
    if (itemid == "stunfisk") then ---------------- DONE 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("drp-pokemon:previewCard", itemid, ItemInfo.information)
    end 

    if (itemid == "purrloin") then ---------------- DONE 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("drp-pokemon:previewCard", itemid, ItemInfo.information)
    end 

    if (itemid == "scraggy") then ---------------- DONE 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("drp-pokemon:previewCard", itemid, ItemInfo.information)
    end 

    if (itemid == "zorua") then ---------------- DONE 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("drp-pokemon:previewCard", itemid, ItemInfo.information)
    end 

    if (itemid == "shaymin") then ---------------- DONE 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("drp-pokemon:previewCard", itemid, ItemInfo.information)
    end 

    if (itemid == "virizion") then ---------------- DONE 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("drp-pokemon:previewCard", itemid, ItemInfo.information)
    end 

    if (itemid == "reshiram") then ---------------- DONE 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("drp-pokemon:previewCard", itemid, ItemInfo.information)
    end 

    if (itemid == "palkia") then ---------------- DONE 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("drp-pokemon:previewCard", itemid, ItemInfo.information)
    end 

    if (itemid == "manaphy") then ---------------- DONE 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("drp-pokemon:previewCard", itemid, ItemInfo.information)
    end 

    if (itemid == "keldeo") then ---------------- DONE 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("drp-pokemon:previewCard", itemid, ItemInfo.information)
    end 

    if (itemid == "raikou") then ---------------- DONE 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("drp-pokemon:previewCard", itemid, ItemInfo.information)
    end 

    if (itemid == "zekrom") then ---------------- DONE 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("drp-pokemon:previewCard", itemid, ItemInfo.information)
    end

    if (itemid == "latios") then ---------------- DONE 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("drp-pokemon:previewCard", itemid, ItemInfo.information)
    end

    if (itemid == "marshadow") then ---------------- DONE 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("drp-pokemon:previewCard", itemid, ItemInfo.information)
    end

    if (itemid == "yveltal") then ---------------- DONE 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("drp-pokemon:previewCard", itemid, ItemInfo.information)
    end

    if (itemid == "hoopa") then ---------------- DONE 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("drp-pokemon:previewCard", itemid, ItemInfo.information)
    end

    if (itemid == "genesect") then ---------------- DONE 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("drp-pokemon:previewCard", itemid, ItemInfo.information)
    end
    
    if (itemid == "volcanion") then ---------------- DONE 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("drp-pokemon:previewCard", itemid, ItemInfo.information)
    end

    if (itemid == "mew") then ---------------- DONE 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("drp-pokemon:previewCard", itemid, ItemInfo.information)
    end

    if (itemid == "jiranchi") then ---------------- DONE 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("drp-pokemon:previewCard", itemid, ItemInfo.information)
    end

    if (itemid == "rayquaza") then ---------------- DONE 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("drp-pokemon:previewCard", itemid, ItemInfo.information)
    end

    if (itemid == "arceus") then ---------------- DONE 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("drp-pokemon:previewCard", itemid, ItemInfo.information)
    end

    if (itemid == "venusaur") then ---------------- DONE 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("drp-pokemon:previewCard", itemid, ItemInfo.information)
    end

    if (itemid == "carnivine") then ---------------- DONE 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("drp-pokemon:previewCard", itemid, ItemInfo.information)
    end

    if (itemid == "volcarona") then ---------------- DONE 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("drp-pokemon:previewCard", itemid, ItemInfo.information)
    end

    if (itemid == "incineroar") then ---------------- DONE 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("drp-pokemon:previewCard", itemid, ItemInfo.information)
    end

    if (itemid == "feraligatr") then ---------------- DONE 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("drp-pokemon:previewCard", itemid, ItemInfo.information)
    end

    if (itemid == "floatzel") then ---------------- DONE 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("drp-pokemon:previewCard", itemid, ItemInfo.information)
    end
    
    if (itemid == "electrode") then ---------------- DONE 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("drp-pokemon:previewCard", itemid, ItemInfo.information)
    end

    if (itemid == "arbok") then ---------------- DONE 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("drp-pokemon:previewCard", itemid, ItemInfo.information)
    end

    if (itemid == "jimmyjones") then ---------------- DONE 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("drp-pokemon:previewCard", itemid, ItemInfo.information)
    end

    if (itemid == "golurk") then ---------------- DONE 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("drp-pokemon:previewCard", itemid, ItemInfo.information)
    end

    if (itemid == "spiritomb") then ---------------- DONE 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("drp-pokemon:previewCard", itemid, ItemInfo.information)
    end

    if (itemid == "liepard") then ---------------- DONE 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("drp-pokemon:previewCard", itemid, ItemInfo.information)
    end

    if (itemid == "scrafty") then ---------------- DONE 
        local ItemInfo = GetItemInfo(slot)
        TriggerEvent("drp-pokemon:previewCard", itemid, ItemInfo.information)
    end

    if (itemid == "cardbinder") then
        local itemInfo = GetItemInfo(slot)
        
        if itemInfo == nil then
                return
            else 
            if itemInfo ~= nil then
                if itemInfo.id ~= nil then
                    TriggerEvent("server-inventory-open", "1", "binder-" .. ItemInfo.id)
                    TriggerEvent("drp-tcg:open-binder")
                end
            end
        end
    end




    if itemid == "slushy" then
        --attachPropsToAnimation(itemid, 6000)
        AttachPropAndPlayAnimation("amb@world_human_drinking@beer@female@idle_a", "idle_e", 49, 6000,"Eating", "inv:slushy",true,itemid,playerVeh)
    end

    if itemid == "asahi" then
        --attachPropsToAnimation(itemid, 6000)
        AttachPropAndPlayAnimation("amb@world_human_drinking@beer@female@idle_a", "idle_e", 49, 6000,"Eating", "inv:well",true,itemid,playerVeh)
    end

    if itemid == "fruitslushy" then
        AttachPropAndPlayAnimation("amb@world_human_drinking@beer@female@idle_a", "idle_e", 49, 6000,"Drinking", "inv:fruitslushy",true,itemid,playerVeh)
    end

    if itemid == "jailfood" then
        AttachPropAndPlayAnimation("mp_player_inteat@burger", "mp_player_int_eat_burger", 49,6000,"Eating","inv:wellfed",true,itemid,playerVeh)
        TriggerEvent( "player:receiveItem","emptyjailtray", 1)
    end

    if itemid == "jaildrink" then
        AttachPropAndPlayAnimation("amb@world_human_drinking@beer@female@idle_a", "idle_e", 49, 6000,"Drinking", "inv:fruitslushy",true,itemid,playerVeh)
    end

    if (itemid == "shitlockpick") then
        lockpicking = true
        TriggerEvent("animation:lockpickinvtestoutside")
        local finished = exports["drp-ui"]:taskBarSkill(1000, math.random(7, 12))
        if (finished == 100) then
            TriggerEvent("police:uncuffMenu")
        end
        lockpicking = false
        remove = true
    end

    if (itemid == "watch") then
        TriggerEvent("drp-ui:watch")
    end

    if (itemid == "tuner") then
        local finished = exports["drp-taskbar"]:taskBar(2000,"Connecting Tuner Laptop",false,false,playerVeh)
        if (finished == 100) then
            TriggerEvent("tuner:open")
        end
    end

    if (itemid == "godbook") then
        local ItemInfo = GetItemInfo(slot)
        if (ItemInfo == nil or ItemInfo.information == "No information stored" or  ItemInfo.information == nil) then 
            justUsed = false
            retardCounter = 0
            lastCounter = 0
            return
        end
        local data = json.decode(ItemInfo.information)
        local cid = exports["isPed"]:isPed("cid")

        if data.cid == cid then
            remove = true
            TriggerServerEvent("inventory:gb",data)
        else
            TriggerEvent("DoLongHudText","Just looks blank to me.",2)
        end
    end

    if (itemid == "harness") then
        local veh = GetVehiclePedIsIn(player, false)
        local driver = GetPedInVehicleSeat(veh, -1)
        if (PlayerPedId() == driver) then
            TriggerEvent("vehicleMod:useHarnessItem")
            remove = true
        end
    end


    if itemid == "softdrink" then
        AttachPropAndPlayAnimation("amb@world_human_drinking@coffee@male@idle_a", "idle_c", 49,15000,"Drink","food:SoftDrink",true,itemid,playerVeh)
    end

    if itemid == "roostertea" then
        AttachPropAndPlayAnimation("amb@world_human_drinking@coffee@male@idle_a", "idle_c", 49,15000,"Drink","drp-roostersrest:drinkTea",true,itemid,playerVeh)
    end
 
    if itemid == "fries" or itemid == "chips" then
        AttachPropAndPlayAnimation("mp_player_inteat@burger", "mp_player_int_eat_burger", 49,15000,"Eating","inv:fed",true,itemid,playerVeh)
    end

    if itemid == "bscoffee" then
        AttachPropAndPlayAnimation("amb@world_human_drinking@coffee@male@idle_a", "idle_c", 49,15000,"Drink","coffee:drink",true,itemid,playerVeh)
    end

    if itemid == "foodbag" or itemid == "collectiblepouch" then
        local data = exports["isPed"]:isPed("cid")
        -- local data = json.decode(passedItemInfo)
        TriggerEvent("inventory-open-container", data.inventoryId, data.slots, data.weight)
    end

    if itemid == "mask" then
        local parsedInfo = json.decode(passedItemInfo)
        --TriggerEvent("facewear:setWear", 4, parsedInfo.mask, parsedInfo.txd, parsedInfo.palette)
        TriggerEvent("facewear:adjust", 4, false)
        remove = true
    end

    if itemid == "hat" then
        local parsedInfo = json.decode(passedItemInfo)
        --TriggerEvent("facewear:setWear", 1, parsedInfo.hat, parsedInfo.txd)
        TriggerEvent("facewear:adjust", 6, false)
        remove = true
    end

    if itemid == "glasses" then
        local parsedInfo = json.decode(passedItemInfo)
        --TriggerEvent("facewear:setWear", 1, parsedInfo.hat, parsedInfo.txd)
        TriggerEvent("facewear:adjust", 2, false)
        remove = true
    end

    if itemid == "franksflute" then
      TriggerServerEvent("drp-inventory:franksFlute", GetEntityCoords(PlayerPedId()))
      franksFluteCount = franksFluteCount + 1
      if franksFluteCount == 3 then
        franksFluteCount = 0
        remove = true
      end
    end

    if itemid == "tattooremover" then
        local target = exports['drp-polytarget']:GetCurrentEntity()
        --local target = PlayerPedId()
        if IsEntityAPed(target) and IsPedAPlayer(target) then
            TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_WELDING", 0, true)
            local finished = exports["drp-taskbar"]:taskBar(60000, "Removing tattoos")
            ClearPedTasks(PlayerPedId())
            if finished == 100 then
                local plyCoords = GetEntityCoords(PlayerPedId())
                local targetCoords = GetEntityCoords(target)
                if #(plyCoords - targetCoords) < 5.0 then
                    local plyId = GetPlayerServerId( NetworkGetPlayerIndexFromPed(target))
                    local success = RPC.execute("clothing:removeTattoosForPlayer", plyId)
                    if success then 
                        TriggerEvent("DoLongHudText", "Removed tattoos.")
                    else
                        TriggerEvent("DoLongHudText", "Could not remove tattos.")
                    end
                else
                    TriggerEvent("DoLongHudText", "They are too far away.")
                end
            end
        end
    end

    if itemid == "buddhaletter" then
        local finished = exports["drp-taskbar"]:taskBar(5000,"Opening Parcel.",false,false,playerVeh)
        if finished == 100 then
            TriggerEvent("DoLongHudText","As you open the letter, you feel a great sense of power.",10)
            remove = true
            TriggerEvent( "player:receiveItem","buddhamedalion",1)
            TriggerEvent( "player:receiveItem","buddhashovel",1)
        end
    end

    if itemid == "buddhablade" or itemid == "buddhaguard" or itemid == "buddhahilt" then
        if hasEnoughOfItem("buddhablade",1,false) and hasEnoughOfItem("buddhaguard",1,false) and hasEnoughOfItem("buddhahilt",1,false) then
            if hasEnoughOfItem("buddhamedalion",1,false) then
                local playerPos = GetEntityCoords(PlayerPedId())
                if #(playerPos - vector3(-453.333, 1.6416, 35.5193)) < 3 then
                    local finished = exports["drp-taskbar"]:taskBar(30000,"Putting blade together.",false,false,playerVeh)
                    if (finished == 100) then
                        TriggerEvent("inventory:removeItem","buddhablade", 1)
                        TriggerEvent("inventory:removeItem","buddhaguard", 1)
                        TriggerEvent("inventory:removeItem","buddhahilt", 1)
                        TriggerEvent("inventory:removeItem","buddhamedalion", 1)
                        TriggerEvent("player:receiveItem","3713923289",1)
                    end
                else
                    TriggerEvent("DoLongHudText","Voice in your head: The parts are calling to the tunnels",5)
                end
            else
                TriggerEvent("DoLongHudText","You seem to be missing something.",5)
            end
        else
            TriggerEvent("DoLongHudText","Voice in your head: Your quest is not yet complete.",5)
        end
    end
    if itemid == "buddhashovel" then
        local playerPos = GetEntityCoords(PlayerPedId())
        if #(playerPos - vector3(-1911.78, 1388.1, 219.35)) < 10 then
            if BuddhaIsItemFound1 == false then
                TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_GARDENER_PLANT", 0, true)
                local finished = exports["drp-taskbar"]:taskBar(15000, "Digging for something.", false, true, false, false, nil, 5.0, PlayerPedId())
                ClearPedTasks(PlayerPedId())
                if finished == 100 then
                    BuddhaIsItemFound1 = true
                    TriggerEvent( "player:receiveItem","buddhablade",1)
                end
            end
        elseif #(playerPos - vector3(-1717.48, 5649.55, -119.6)) < 5 then
            if BuddhaIsItemFound2 == false then
                TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_GARDENER_PLANT", 0, true)
                local finished = exports["drp-taskbar"]:taskBar(15000, "Digging for something.", false, true, false, false, nil, 5.0, PlayerPedId())
                ClearPedTasks(PlayerPedId())
                if finished == 100 then
                    BuddhaIsItemFound2 = true
                    TriggerEvent( "player:receiveItem","buddhaguard",1)
                end
            end
        elseif #(playerPos - vector3(3647.61, 3121.15, 1.31)) < 10 then
            if BuddhaIsItemFound3 == false then
                TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_GARDENER_PLANT", 0, true)
                local finished = exports["drp-taskbar"]:taskBar(15000, "Digging for something.", false, true, false, false, nil, 5.0, PlayerPedId())
                ClearPedTasks(PlayerPedId())
                if finished == 100 then
                    BuddhaIsItemFound3 = true
                    TriggerEvent( "player:receiveItem","buddhahilt",1)
                end
            end
        elseif not BuddhaIsItemFound1 or not BuddhaIsItemFound2 or not BuddhaIsItemFound3 then
            TriggerEvent("DoLongHudText","Voice in your head: This is not the place.",5)
        else
            TriggerEvent("DoLongHudText","Voice in your head: You already found it, move on!",5)
        end
    end

    if itemid == "notepad" then
        notepadUsed()
    end
    if itemid == "notepadnote" then
        notepadPageUsed(passedItemInfo)
    end

    TriggerEvent("drp-inventory:itemUsed", itemid, passedItemInfo, inventoryName, slot)
    TriggerServerEvent("drp-inventory:itemUsed", itemid, passedItemInfo, inventoryName, slot)

    if remove then
        local info = json.decode(passedItemInfo)
        if info and info._remove_id then
            TriggerEvent("inventory:removeItemByMetaKV", itemid, 1, "_remove_id", info._remove_id)
        else
            TriggerEvent("inventory:removeItem", itemid, 1)
        end
    end

    Wait(500)
    retardCounter = 0
    justUsed = false


end)

function AttachPropAndPlayAnimation(dictionary,animation,typeAnim,timer,message,func,remove,itemid,vehicle)
    if itemid == "hamburger" or itemid == "heartstopper" or itemid == "bleederburger" or itemid == "moneyshot" or itemid == "torpedo" or itemid == "questionablemeatburger" then
        TriggerEvent("attachItem", "hamburger")
    elseif sandwichItems[itemid] then
        TriggerEvent("attachItem", "sandwich")
    elseif itemid == "donut" or itemid == "applepie" then
        TriggerEvent("attachItem", "donut")
    elseif waterItemsAttached[itemid] then
        TriggerEvent(
            "attachItem",
            (itemid == "poisonedwater"
            or itemid == "kdragonwater"
            or itemid == "customwateritem"
            ) and "water" or itemid)
    elseif itemid == "drink1" or itemid == "drink2" or itemid == "drink3" or itemid == "drink4" or itemid == "drink5" or itemid == "drink6"
        or itemid == "drink7" or itemid == "drink8" or itemid == "drink9" or itemid == "drink10" or itemid == "absinthe" or itemid == "moonshine" then
        TriggerEvent("attachItem", "whiskeyglass")
    elseif itemid == "shot1" or itemid == "shot2" or itemid == "shot3" or itemid == "shot4" or itemid == "shot5" or itemid == "shot6"
        or itemid == "shot7" or itemid == "shot8" or itemid == "shot9" or itemid == "shot10" then
        TriggerEvent("attachItem", "shotglass")
    elseif itemid == "fishtaco" or itemid == "taco" then
        TriggerEvent("attachItem", "taco")
    elseif itemid == "greencow" or itemid == "franksmonster" or itemid == "chuhai" then
        TriggerEvent("attachItem", "energydrink")
    elseif itemid == "slushy" then
        TriggerEvent("attachItem", "cup")
    elseif itemid == "blue_rare_steak" or itemid == "rare_steak" or itemid == "medium_rare_steak" or itemid == "medium_steak" or itemid == "medium_well_steak" or itemid == "well_done_steak" then
        TriggerEvent("attachItem", "steak")
    elseif has_value(fruits, itemid) then
        TriggerEvent("attachItem", "fruit")
    end
    local success = TaskItem(dictionary, animation, typeAnim, timer, message, func, remove, itemid,vehicle)
    TriggerEvent("destroyProp")
    return success
end

AddEventHandler("drp-inventory:attachPropPlayAnim", function(pType)
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    local success = false
    if pType == "sandwich" then
        success = AttachPropAndPlayAnimation(
            "mp_player_inteat@burger",
            "mp_player_int_eat_burger",
            49,
            6000,
            "Eating",
            "",
            false,
            "sandwich",
            vehicle
        )
    end
    if pType == "fries" then
        success = AttachPropAndPlayAnimation(
            "mp_player_inteat@burger",
            "mp_player_int_eat_burger",
            49,
            15000,
            "Eating",
            "",
            false,
            "fries",
            vehicle
        )
    end
    if pType == "donut" then
        success = AttachPropAndPlayAnimation(
            "mp_player_inteat@burger",
            "mp_player_int_eat_burger",
            49,
            6000,
            "Eating",
            "",
            false,
            "donut",
            vehicle
        )
    end
    if pType == "water" then
        success = AttachPropAndPlayAnimation(
            "amb@world_human_drinking@beer@female@idle_a", 
            "idle_e", 
            49,
            6000,
            "Drink",
            "",
            false,
            "water",
            vehicle
        )
    end
    if pType == "beer" then
        success = AttachPropAndPlayAnimation(
            "amb@world_human_drinking@coffee@male@idle_a",
            "idle_c",
            49,
            6000,
            "Drink",
            "",
            false,
            "beer",
            vehicle
        )
    end
    TriggerEvent("drp-buffs:itemUsedSuccess", success)
end)

RegisterNetEvent('randPickupAnim')
AddEventHandler('randPickupAnim', function()
    loadAnimDict('pickup_object')
    TaskPlayAnim(PlayerPedId(),'pickup_object', 'putdown_low',5.0, 1.5, 1.0, 48, 0.0, 0, 0, 0)
    Wait(1000)
    ClearPedSecondaryTask(PlayerPedId())
end)


-- should remove weapons from players if they drop them but dont put them away
RegisterNetEvent('inventory:wepDropCheck')
AddEventHandler('inventory:wepDropCheck', function()
    if (not hasEnoughOfItem(GetSelectedPedWeapon(PlayerPedId()),1,false)) then
        SetCurrentPedWeapon(PlayerPedId(), `WEAPON_UNARMED`, true)
    end
end)




local clientInventory = {};
RegisterNetEvent('current-items')
AddEventHandler('current-items', function(inv)
    clientInventory = inv
    checkForItems()
    checkForAttachItem()
    TriggerEvent("AttachWeapons")
end)



RegisterNetEvent('SniffRequestCID')
AddEventHandler('SniffRequestCID', function(src)
    local cid = exports["isPed"]:isPed("cid")
    TriggerServerEvent("SniffCID",cid,src)
end)


function GetItemInfo(checkslot)
    for i,v in pairs(clientInventory) do
        if (tonumber(v.slot) == tonumber(checkslot)) then
            local info = {["information"] = v.information,["id"] = v.id, ["quality"] = v.quality, ["item_id"] = v.item_id, ["amount"] = v.amount }
            return info
        end
    end
    return "No information stored";
end
exports("GetItemInfo", GetItemInfo)

function GetInfoForFirstItemOfName(item_id)
    for i,v in pairs(clientInventory) do
        if (v.item_id == item_id) then
            local info = {
              ["information"] = v.information,
              ["id"] = v.id,
              ["quality"] = v.quality,
            }
            return info
        end
    end
    return nil
end

function GetItemsByItemMetaKV(item_id, meta_key, meta_value)
  local items = {}
  for i, v in pairs(clientInventory) do
      if v.item_id == item_id then
          local info = json.decode(v.information)
          if info[meta_key] == meta_value then
              items[#items + 1] = {
                ["information"] = v.information,
                ["id"] = v.id,
                ["quality"] = v.quality,
              }
          end
      end
  end
  return items
end
exports("GetItemsByItemMetaKV", GetItemsByItemMetaKV)

-- item id, amount allowed, crafting.
function CreateCraftOption(id, add, craft)
    TriggerEvent("CreateCraftOption", id, add, craft)
end


RegisterNetEvent('drp-business:repairItem')
AddEventHandler('drp-business:repairItem', function()
    
    local info = GetItemInfo(1)
    local Quality = info.quality
    local QualityCheck = (Quality < 80 and Quality or false)
    local PercentRepair = 80 - Quality
    local itemListInfo = json.decode(exports["drp-inventory"]:itemListInfo(info.item_id))
    local allowed = true  

    itemListInfo = itemListInfo.craft ~= nil and itemListInfo.craft or false
    if itemListInfo then
        for k, v in pairs(itemListInfo[1]) do
            local itemid = v.itemid
            local cost = math.ceil( v.amount * PercentRepair/100 )
            if Quality == 0 then cost = cost * 2 end
            if not hasEnoughOfItem(itemid,cost,true,true) then
                allowed = false
            end
        end 
    end

    local failed = ( (info.amount > 1 and "You can only repair 1 item at a time" ) or (not QualityCheck and "Can only repair items between 0-80%. ") or (tonumber(info.item_id) ~= nil and "Can not repair weapons. ") or (not itemListInfo and "Item is unrepairable. ") or (not allowed and "Not enough materials. "))

    if type(failed) == 'string' or not allowed then
        TriggerEvent('chatMessage', "", {255, 0, 0}, " " .. failed );
        return
    end
 
    for k, v in pairs(itemListInfo[1]) do
        local itemid = v.itemid
        local cost = math.ceil( v.amount * PercentRepair/100 )
        if Quality == 0 then cost = cost * 2 end
        TriggerEvent("inventory:removeItem", itemid, cost)
    end

    local cid = exports["isPed"]:isPed("cid")
    TriggerServerEvent("inventory:repairItem",info.id,80,info.item_id,cid)

end)

RegisterNetEvent('drp-business:examineItem')
AddEventHandler('drp-business:examineItem', function()

    local info = GetItemInfo(1)
    local Quality = info.quality
    local PercentRepair = 80 - Quality
    local QualityCheck = (Quality < 80 and Quality or false)
    local itemListInfo = json.decode(exports["drp-inventory"]:itemListInfo(info.item_id))

    itemListInfo = itemListInfo.craft ~= nil and itemListInfo.craft or false

    local failed = ( (info.amount > 1 and "You can only repair 1 item at a time" ) or (not QualityCheck and "Can only repair items between 0-80%. ") or (tonumber(info.item_id) ~= nil and "Can not repair weapons. ") or (not itemListInfo and "Item is unrepairable. ") )

    if type(failed) == 'string' then
        TriggerEvent('chatMessage', "", {255, 0, 0}, " " .. failed );
        return
    end
    
    TriggerEvent('chatMessage', "", {255, 0, 0}, " ^1Item current quality is: " .. Quality .. " we will repair a total of %" .. PercentRepair);

    for k, v in pairs(itemListInfo[1]) do
        print(k,v.itemid,v.amount)
        local itemid = v.itemid
        local cost = math.ceil( v.amount * PercentRepair/100 )
        if Quality == 0 then cost = cost * 2 end
        TriggerEvent('chatMessage', "", {255, 0, 0}, itemid .. " ^1required: " .. cost);
    end
    
end)


-- Animations
function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end

function TaskItem(dictionary,animation,typeAnim,timer,message,func,remove,itemid,playerVeh,itemreturn,itemreturnid,quality)
    loadAnimDict( dictionary )
    TaskPlayAnim( PlayerPedId(), dictionary, animation, 8.0, 1.0, -1, typeAnim, 0, 0, 0, 0 )
    local timer = tonumber(timer)
    if timer > 0 then
        local finished = exports["drp-taskbar"]:taskBar(timer,message,true,false,playerVeh)
        if finished == 100 or timer == 0 then
            TriggerEvent(func, quality and quality or -1, itemid)
            if remove then
                TriggerEvent("inventory:removeItem", itemid, 1)
            end
            if itemreturn then
                TriggerEvent( "player:receiveItem",itemreturnid, 1 )
            end
            
            TriggerServerEvent( "player:itemTaskCompleted", itemid, timer)

            ClearPedSecondaryTask(PlayerPedId())
            return true
        else
            ClearPedSecondaryTask(PlayerPedId())
            return false
        end
    else
        TriggerEvent(func, quality and quality or -1, itemid)
        ClearPedSecondaryTask(PlayerPedId())
        return true
    end
end



function GetCurrentWeapons()
    local returnTable = {}
    for i,v in pairs(clientInventory) do
        if (tonumber(v.item_id)) then
            local t = { ["hash"] = v.item_id, ["id"] = v.id, ["information"] = v.information, ["name"] = v.item_id, ["slot"] = v.slot }
            returnTable[#returnTable+1]=t
        end
    end
    if returnTable == nil then
        return {}
    end
    return returnTable
end

function getFreeSpace()
    local space = 40
    for i,v in pairs(clientInventory) do
        if v.item_id then
            space = space - 1
        end
    end
    return space
end

function getQuantity(itemid, checkQuality, metaInformation)
  local amount = 0
  for i,v in pairs(clientInventory) do
      local qCheck = not checkQuality or v.quality > 0
      if v.item_id == itemid and qCheck then
          if metaInformation then
              local totalMetaKeys = 0
              local metaFoundCount = 0
              local itemMeta = json.decode(v.information)
              for metaKey, metaValue in pairs(metaInformation) do
                  totalMetaKeys = totalMetaKeys + 1
                  if itemMeta[metaKey] and itemMeta[metaKey] == metaValue then
                      metaFoundCount = metaFoundCount + 1
                  end
              end
              if totalMetaKeys <= metaFoundCount then
                  amount = amount + v.amount
              end
          else
              amount = amount + v.amount
          end
      end
  end
  return amount
end

function hasEnoughOfItem(itemid,amount,shouldReturnText,checkQuality, metaInformation)
  if shouldReturnText == nil then shouldReturnText = true end
  if itemid == nil or itemid == 0 or amount == nil or amount == 0 then
      if shouldReturnText then
          TriggerEvent("DoLongHudText","I dont seem to have " .. itemid .. " in my pockets.",2)
      end
      return false
  end
  amount = tonumber(amount)
  local slot = 0
  local found = false

  if getQuantity(itemid, checkQuality, metaInformation) >= amount then
      return true
  end
  return false
end

function getItemsOfType(itemid, limitAmount, checkQuality, metaInformation)
    if itemid == nil then
        return nil
    end
    local minQuality = type(checkQuality) == "number" and checkQuality or 0
    local itemsFound = {}
    local amount = tonumber(limitAmount)
    for i,v in pairs(clientInventory) do
        if amount and #itemsFound >= amount then
            break
        end

        local qCheck = not checkQuality or v.quality > minQuality
        if v.item_id == itemid and qCheck then
          if metaInformation then
              local totalMetaKeys = 0
              local metaFoundCount = 0
              local itemMeta = json.decode(v.information)
              for metaKey, metaValue in pairs(metaInformation) do
                  totalMetaKeys = totalMetaKeys + 1
                  if itemMeta[metaKey] and itemMeta[metaKey] == metaValue then
                      metaFoundCount = metaFoundCount + 1
                  end
              end
              if totalMetaKeys <= metaFoundCount then
                  itemsFound[#itemsFound+1] = v
              end
          else
              itemsFound[#itemsFound+1] = v
          end
      end
  end
  return itemsFound
end

exports("getItemsOfType", getItemsOfType)



RegisterNetEvent('inventory:DegenItemType')
AddEventHandler('inventory:DegenItemType', function(percent,itemid)
    local cid = exports["isPed"]:isPed("cid")
    local itemFound = getItemsOfType(itemid,1,true,false)
    print("Degen applied to ".. itemid .. " ID: " .. itemFound[1].id .. " at %" .. percent)
    TriggerServerEvent("inventory:degItem",itemFound[1].id,percent,itemid,cid)
end)

function checkForAttachItem()
    local AttatchItems = {
        "stolentv",
        "stolenmusic",
        "stolencoffee",
        "stolenmicrowave",
        "stolencomputer",
        "stolenart",
        "darkmarketpackage",
        "weedpackage",
        "methpackage",
        "boxscraps",
        "dodopackagesmall",
        "dodopackagemedium",
        "dodopackagelarge",
        "housesafe",
        "fridge"
    }

    local itemToAttach = "none"
    for k,v in pairs(AttatchItems) do
        if getQuantity(v) >= 1 then
            itemToAttach = v
            break
        end
    end

    TriggerEvent("animation:carry",itemToAttach,true)
end

local PreviousItemCheck = {}

function checkForItems()
    local items = {
        "mobilephone",
        "stoleniphone",
        "stolennokia",
        "stolenpixel3",
        "stolens8",
        "boomerphone",
        "radio",
        "civradio",
        "burgershotheadset",
        "megaphone",
        "watch",
        "boxinggloves",
        "cgchain",
        "gsfchain",
        "cerberuschain",
        "mdmchain",
        "vagoschain",
        "koilchain",
        "racingusb",
    }

    for _, item in ipairs(items) do
        local quantity = getQuantity(item)
        local hasItem = quantity >= 1

        if hasItem and not PreviousItemCheck[item] then
            PreviousItemCheck[item] = true
            TriggerEvent('drp-inventory:itemCheck', item, true, quantity)
        elseif not hasItem and PreviousItemCheck[item] then
            PreviousItemCheck[item] = false
            TriggerEvent('drp-inventory:itemCheck', item, false, quantity)
        end
    end
end

function isValidUseCase(itemID, isWeapon)
    local player = PlayerPedId()
    local playerVeh = GetVehiclePedIsIn(player, false)
    if playerVeh ~= 0 then
        local model = GetEntityModel(playerVeh)
        if IsThisModelACar(model) or IsThisModelABike(model) or IsThisModelAQuadbike(model) then
            if IsEntityInAir(playerVeh) then
                Wait(1000)
                if IsEntityInAir(playerVeh) then
                    TriggerEvent("DoLongHudText","You appear to be flying through the air",2)
                    return false
                end
            end
        end
    end

    if not validWaterItem[itemID] and not isWeapon then
        if IsPedSwimming(player) then
            local targetCoords = GetEntityCoords(player, 0)
            Wait(700)
            local plyCoords = GetEntityCoords(player, 0)
            if #(targetCoords - plyCoords) > 1.3 then
                TriggerEvent("DoLongHudText","Cannot be moving while swimming to use this.",2)
                return false
            end
        end

        if IsPedSwimmingUnderWater(player) then
            TriggerEvent("DoLongHudText","Cannot be underwater to use this.",2)
            return false
        end
    end

    return true
end


-- DNA



RegisterNetEvent('evidence:addDnaSwab')
AddEventHandler('evidence:addDnaSwab', function(dna)
    TriggerEvent("DoLongHudText", "DNA Result: " .. dna,1)
end)

RegisterNetEvent('CheckDNA')
AddEventHandler('CheckDNA', function()
    TriggerServerEvent("Evidence:checkDna")
end)

RegisterNetEvent('evidence:dnaSwab')
AddEventHandler('evidence:dnaSwab', function(pArgs, pEntity, pContext)
    TriggerServerEvent("police:dnaAsk", GetPlayerServerId(NetworkGetPlayerIndexFromPed(pEntity)))
end)

RegisterNetEvent('evidence:swabNotify')
AddEventHandler('evidence:swabNotify', function()
    TriggerEvent("DoLongHudText", "DNA swab taken.",1)
end)


function GetPlayers()
    local players = {}

    for i = 0, 255 do
        if NetworkIsPlayerActive(i) then
            players[#players+1]= i
        end
    end

    return players
end

function GetClosestPlayer()
    local players = GetPlayers()
    local closestDistance = -1
    local closestPlayer = -1
    local ply = PlayerPedId()
    local plyCoords = GetEntityCoords(ply, 0)

    for index,value in ipairs(players) do
        local target = GetPlayerPed(value)
        if(target ~= ply) then
            local targetCoords = GetEntityCoords(GetPlayerPed(value), 0)
            local distance = #(vector3(targetCoords["x"], targetCoords["y"], targetCoords["z"]) - vector3(plyCoords["x"], plyCoords["y"], plyCoords["z"]))
            if(closestDistance == -1 or closestDistance > distance) then
                closestPlayer = value
                closestDistance = distance
            end
        end
    end

    return closestPlayer, closestDistance
end


-- DNA AND EVIDENCE END

-- Others
local buddhaEventLastDist = 0
function buddhaMedalion()
    local playerPos = GetEntityCoords(PlayerPedId())

    local hasBlade = hasEnoughOfItem("buddhablade", 1, false)
    local hasGuard = hasEnoughOfItem("buddhaguard", 1, false)
    local hasHilt = hasEnoughOfItem("buddhahilt", 1, false)

    local dist = 9999
    
    if hasBlade and hasGuard and hasHilt then
        --return TriggerEvent("DoLongHudText", "The medallion is pulling you towards the basement.", 5)
        dist = #(playerPos - vector3(-172.54, 319.13, 87.35))
    end
    
    if not hasBlade then
        dist = #(playerPos - vector3(-1911.78, 1388.1, 219.35))
    end
    local distToGuard = #(playerPos - vector3(-1717.48, 5649.55, -119.6))
    if not hasGuard and dist > distToGuard then
        dist = distToGuard
    end
    local distToHilt = #(playerPos - vector3(3647.61, 3121.15, 1.31))
    if not hasHilt and dist > distToHilt then
        dist = distToHilt
    end

    local oldDist = buddhaEventLastDist
    buddhaEventLastDist = dist

    if dist < 10 then
        return TriggerEvent("DoLongHudText", "The medallion is shaking uncontrollably.", 5)
    end
    if dist < 2500 then
        if dist > oldDist then
            return TriggerEvent("DoLongHudText", "The humming is getting weaker.", 5)
        end
        if dist < oldDist then
            return TriggerEvent("DoLongHudText", "The humming is getting stronger.", 5)
        end
        return TriggerEvent("DoLongHudText", "The medallion is humming.", 5)
    end
    TriggerEvent("DoLongHudText", "The medallion is quiet.", 5)
end




















-- this is the upside down world, be careful.


function getVehicleInDirection(coordFrom, coordTo)
    local offset = 0
    local rayHandle
    local vehicle

    for i = 0, 100 do
        rayHandle = CastRayPointToPoint(coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z + offset, 2, PlayerPedId(), 0)
        a, b, c, d, vehicle = GetRaycastResult(rayHandle)

        offset = offset - 1

        if vehicle ~= 0 then break end
    end

    local distance = Vdist2(coordFrom, GetEntityCoords(vehicle))

    if distance > 25 then vehicle = nil end

    return vehicle ~= nil and vehicle or 0
end

function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)

end


RegisterNetEvent('inv:wellfedwater')
AddEventHandler('inv:wellfedwater', function()
    TriggerEvent("inv:wellfed")
    TriggerEvent("drp-hud:ChangeHunger", 50)
end)

RegisterNetEvent("inv:slushy")
AddEventHandler('inv:slushy', function()
    TriggerEvent("inv:wellfed")
    TriggerEvent("healed:useOxy")

end)

RegisterNetEvent("inv:fruitslushy")
AddEventHandler('inv:fruitslushy', function()
    TriggerEvent("inv:wellfed")
    TriggerEvent("healed:useOxy")

end)

local burgies = 0
RegisterNetEvent('inv:wellfed')
AddEventHandler('inv:wellfed', function()
    TriggerEvent("Evidence:StateSet",25,3600)
    TriggerEvent("drp-hud:updateStress",false,30)
    TriggerEvent("drp-hud:ChangeHunger", 60)
    TriggerEvent("drp-hud:ChangeThirst", 60)
    burgies = 0
end)

local burgies2 = 0
RegisterNetEvent('inv:fed')
AddEventHandler('inv:fed', function()
    TriggerEvent("Evidence:StateSet",25,3600)
     TriggerEvent("drp-hud:updateStress",false,30)
    TriggerEvent("drp-hud:ChangeHunger", 60)
    TriggerEvent("drp-hud:ChangeThirst", 30)
    processStressBlock()
    burgies2 = 0
end)

local burgies3 = 0
RegisterNetEvent('inv:fed2')
AddEventHandler('inv:fed2', function()
    TriggerEvent("Evidence:StateSet",25,3600)
     TriggerEvent("drp-hud:updateStress",false,30)
    TriggerEvent("drp-hud:ChangeHunger", 30)
    TriggerEvent("drp-hud:ChangeThirst", 70)
    processStressBlock()
    burgies3 = 0
end)

local burgies4 = 0
RegisterNetEvent('inv:well')
AddEventHandler('inv:well', function()
    TriggerEvent("drp-hud:updateStress",false,30)
    TriggerEvent("drp-hud:ChangeHunger", 20)
    TriggerEvent("drp-hud:ChangeThirst", 30)
    burgies4 = 0
end)

local burgies5 = 0
RegisterNetEvent('changethirst')
AddEventHandler('changethirst', function()
    TriggerEvent("drp-hud:ChangeThirst", 30)
    burgies5 = 0
end)

RegisterNetEvent('animation:lockpickinvtestoutside')
AddEventHandler('animation:lockpickinvtestoutside', function(itemType)
    local anim = {
        dict = "veh@break_in@0h@p_m_one@",
        name = "low_force_entry_ds"
    }
    local lPed = PlayerPedId()
    if itemType == "hackingdevice" then
        TaskStartScenarioInPlace(lPed, "CODE_HUMAN_MEDIC_KNEEL", 0, false)
        while lockpicking do
            Wait(2500)
        end
        ClearPedTasks(lPed)
        return
    end
    RequestAnimDict(anim.dict)
    while not HasAnimDictLoaded(anim.dict) do
        Citizen.Wait(0)
    end

    while lockpicking do
        TaskPlayAnim(lPed, anim.dict, anim.name, 1.0, 1.0, 1.0, 16, 0.0, 0, 0, 0)
        Citizen.Wait(2500)
    end
    ClearPedTasks(lPed)
end)

RegisterNetEvent('animation:lockpickinvtest')
AddEventHandler('animation:lockpickinvtest', function(disable)
    local lPed = PlayerPedId()
    RequestAnimDict("mini@repair")
    while not HasAnimDictLoaded("mini@repair") do
        Citizen.Wait(0)
    end
    if disable ~= nil then
        if not disable then
            lockpicking = false
            return
        else
            lockpicking = true
        end
    end
    while lockpicking do

        if not IsEntityPlayingAnim(lPed, "mini@repair", "fixing_a_player", 3) then
            ClearPedSecondaryTask(lPed)
            TaskPlayAnim(lPed, "mini@repair", "fixing_a_player", 8.0, -8, -1, 16, 0, 0, 0, 0)
        end
        Citizen.Wait(1)
    end
    ClearPedTasks(lPed)
end)



RegisterNetEvent('inv:lockPick')
AddEventHandler('inv:lockPick', function(isForced,inventoryName,slot)
    TriggerEvent("robbery:scanLock",true)
    if lockpicking then return end

    lockpicking = true
    playerped = PlayerPedId()
    targetVehicle = GetVehiclePedIsUsing(playerped)
    local itemid = 21

    if targetVehicle == 0 then
        coordA = GetEntityCoords(playerped, 1)
        coordB = GetOffsetFromEntityInWorldCoords(playerped, 0.0, 100.0, 0.0)
        targetVehicle = getVehicleInDirection(coordA, coordB)
        local driverPed = GetPedInVehicleSeat(targetVehicle, -1)
        if targetVehicle == 0 then
            lockpicking = false
            TriggerEvent("robbery:lockpickhouse",isForced)
            return
        end

        if driverPed ~= 0 then
            lockpicking = false
            return
        end
            local d1,d2 = GetModelDimensions(GetEntityModel(targetVehicle))
            local leftfront = GetOffsetFromEntityInWorldCoords(targetVehicle, d1["x"]-0.25,0.25,0.0)

            local count = 5000
            local dist = #(vector3(leftfront["x"],leftfront["y"],leftfront["z"]) - GetEntityCoords(PlayerPedId()))
            while dist > 2.0 and count > 0 do
                dist = #(vector3(leftfront["x"],leftfront["y"],leftfront["z"]) - GetEntityCoords(PlayerPedId()))
                Citizen.Wait(1)
                count = count - 1
                DrawText3Ds(leftfront["x"],leftfront["y"],leftfront["z"],"Move here to lockpick.")
            end

            if dist > 2.0 then
                lockpicking = false
                return
            end


            TaskTurnPedToFaceEntity(PlayerPedId(), targetVehicle, 1.0)
            Citizen.Wait(1000)
            TriggerEvent('InteractSound_CL:PlayOnOne', 'lockpick', 1.0)
            local triggerAlarm = GetVehicleDoorLockStatus(targetVehicle) > 1
            if triggerAlarm then
                SetVehicleAlarm(targetVehicle, true)
                StartVehicleAlarm(targetVehicle)
            end


            --TriggerEvent("civilian:alertPolice",20.0,"lockpick",targetVehicle)
           
            TriggerEvent("animation:lockpickinvtestoutside")
             TriggerEvent('InteractSound_CL:PlayOnOne', 'lockpick', 1.0)



 
            local finished = exports["drp-bar"]:taskBar(25000,3)

            if finished ~= 100 then
                 lockpicking = false
                return
            end


            if finished == 100 then
                if triggerAlarm then
                    SetVehicleAlarm(targetVehicle, false)
                end
                local chance = math.random(50)
                if #(GetEntityCoords(targetVehicle) - GetEntityCoords(PlayerPedId())) < 10.0 and targetVehicle ~= 0 and GetEntitySpeed(targetVehicle) < 5.0 then

                    SetVehicleDoorsLocked(targetVehicle, 1)
                    TriggerEvent("DoLongHudText", "Vehicle Unlocked.",1)
                    TriggerEvent('InteractSound_CL:PlayOnOne', 'unlock', 0.1)

                end
            end
        lockpicking = false
    else
        if targetVehicle ~= 0 and not isForced then

            TriggerEvent('InteractSound_CL:PlayOnOne', 'lockpick', 1.0)
            local triggerAlarm = GetVehicleDoorLockStatus(targetVehicle) > 1
            if triggerAlarm then
                SetVehicleAlarm(targetVehicle, true)
                StartVehicleAlarm(targetVehicle)
            end

            SetVehicleHasBeenOwnedByPlayer(targetVehicle,true)
            --TriggerEvent("civilian:alertPolice",12.0,"lockpick",targetVehicle)
           
            TriggerEvent("animation:lockpickinvtest")
            TriggerEvent('InteractSound_CL:PlayOnOne', 'lockpick', 1.0)

           
            local carTimer = GetVehicleHandlingFloat(targetVehicle, 'CHandlingData', 'nMonetaryValue')
            if carTimer == nil then
                carTimer = math.random(25000,180000)
            end
            if carTimer < 25000 then
                carTimer = 25000
            end

            if carTimer > 180000 then
                carTimer = 180000
            end
            
            carTimer = math.ceil(carTimer / 3)


            local myJob = exports["isPed"]:isPed("myJob")
            if myjob == "towtruck" then
                carTimer = 4000
            end

          

            TriggerEvent("civilian:alertPolice",12.0,"lockpick",targetVehicle)
            local finished = exports["drp-bar"]:taskBar(5000,math.random(5,10))
            local lockpickbreak = math.random(1,10)
            if finished ~= 100 and lockpickbreak == 1 then
               
                TriggerEvent("DoLongHudText", "The lockpick bent out of shape.",2)
                TriggerEvent("inventory:removeItem","lockpick", 1)                
                 lockpicking = false
                return
            end     


            Citizen.Wait(500)
            if finished == 100 then
                if triggerAlarm then
                    SetVehicleAlarm(targetVehicle, false)
                end
                local chance = math.random(50)
                if #(GetEntityCoords(targetVehicle) - GetEntityCoords(PlayerPedId())) < 10.0 and targetVehicle ~= 0 and GetEntitySpeed(targetVehicle) < 5.0 then

                    local plate = GetVehicleNumberPlateText(targetVehicle)
                    SetVehicleDoorsLocked(targetVehicle, 1)
                    TriggerEvent("keys:addNew",targetVehicle,plate)
                    TriggerEvent("DoLongHudText", "Ignition Working.",1)
                    SetEntityAsMissionEntity(targetVehicle,false,true)
                    SetVehicleHasBeenOwnedByPlayer(targetVehicle,true)
                    TriggerEvent("chop:plateoff",plate)

                end
                lockpicking = false
            end
        end
    end
    lockpicking = false
end)

RegisterNetEvent('inv:lockPick2')
AddEventHandler('inv:lockPick2', function(isForced,inventoryName,slot)
    TriggerEvent("robbery:scanLock",true)
    if lockpicking then return end

    lockpicking = true
    playerped = PlayerPedId()
    targetVehicle = GetVehiclePedIsUsing(playerped)
    local itemid = 21

    if targetVehicle == 0 then
        coordA = GetEntityCoords(playerped, 1)
        coordB = GetOffsetFromEntityInWorldCoords(playerped, 0.0, 100.0, 0.0)
        targetVehicle = getVehicleInDirection(coordA, coordB)
        local driverPed = GetPedInVehicleSeat(targetVehicle, -1)
        if targetVehicle == 0 then
            lockpicking = false
            TriggerEvent("robbery:lockpickhouse",isForced)
            return
        end

        if driverPed ~= 0 then
            lockpicking = false
            return
        end
            local d1,d2 = GetModelDimensions(GetEntityModel(targetVehicle))
            local leftfront = GetOffsetFromEntityInWorldCoords(targetVehicle, d1["x"]-0.25,0.25,0.0)

            local count = 5000
            local dist = #(vector3(leftfront["x"],leftfront["y"],leftfront["z"]) - GetEntityCoords(PlayerPedId()))
            while dist > 2.0 and count > 0 do
                dist = #(vector3(leftfront["x"],leftfront["y"],leftfront["z"]) - GetEntityCoords(PlayerPedId()))
                Citizen.Wait(1)
                count = count - 1
                DrawText3Ds(leftfront["x"],leftfront["y"],leftfront["z"],"Move here to lockpick.")
            end

            if dist > 2.0 then
                lockpicking = false
                return
            end


            TaskTurnPedToFaceEntity(PlayerPedId(), targetVehicle, 1.0)
            Citizen.Wait(1000)
            TriggerEvent('InteractSound_CL:PlayOnOne', 'lockpick', 1.0)
            local triggerAlarm = GetVehicleDoorLockStatus(targetVehicle) > 1
            if triggerAlarm then
                SetVehicleAlarm(targetVehicle, true)
                StartVehicleAlarm(targetVehicle)
            end

            TriggerEvent("animation:lockpickinvtestoutside")
            TriggerEvent('InteractSound_CL:PlayOnOne', 'lockpick', 1.0)



 
            local finished = exports["drp-taskbar"]:taskBar(2000,"Picking")

            if finished ~= 100 then
                 lockpicking = false
                return
            end

            if finished == 100 then
                if triggerAlarm then
                    SetVehicleAlarm(targetVehicle, false)
                end
                local chance = math.random(50)
                if #(GetEntityCoords(targetVehicle) - GetEntityCoords(PlayerPedId())) < 10.0 and targetVehicle ~= 0 and GetEntitySpeed(targetVehicle) < 5.0 then

                    SetVehicleDoorsLocked(targetVehicle, 1)
                    TriggerEvent("DoLongHudText", "Vehicle Unlocked.",1)
                    TriggerEvent('InteractSound_CL:PlayOnOne', 'unlock', 0.1)

                end
            end
        lockpicking = false
    else
        if targetVehicle ~= 0 and not isForced then

            TriggerEvent('InteractSound_CL:PlayOnOne', 'lockpick', 1.0)
            local triggerAlarm = GetVehicleDoorLockStatus(targetVehicle) > 1
            if triggerAlarm then
                SetVehicleAlarm(targetVehicle, true)
                StartVehicleAlarm(targetVehicle)
            end

            SetVehicleHasBeenOwnedByPlayer(targetVehicle,true)
            TriggerEvent("animation:lockpickinvtest")
            TriggerEvent('InteractSound_CL:PlayOnOne', 'lockpick', 1.0)

           
            local carTimer = GetVehicleHandlingFloat(targetVehicle, 'CHandlingData', 'nMonetaryValue')
            if carTimer == nil then
                carTimer = math.random(2500,3800)
            end
            if carTimer < 2500 then
                carTimer = 2500
            end

            if carTimer > 3800 then
                carTimer = 3800
            end
            
            carTimer = math.ceil(carTimer / 3)


            local myJob = exports["isPed"]:isPed("myJob")
            if myjob == "towtruck" then
                carTimer = 1000
            end

            local finished = exports["drp-taskbar"]:taskBar(1000,"Picking")
            if finished ~= 100 then
                 lockpicking = false
                return
            end


            Citizen.Wait(500)
            if finished == 100 then
                if triggerAlarm then
                    SetVehicleAlarm(targetVehicle, false)
                end
                local chance = math.random(50)
                if #(GetEntityCoords(targetVehicle) - GetEntityCoords(PlayerPedId())) < 10.0 and targetVehicle ~= 0 and GetEntitySpeed(targetVehicle) < 5.0 then

                    local plate = GetVehicleNumberPlateText(targetVehicle)
                    SetVehicleDoorsLocked(targetVehicle, 1)
                    TriggerEvent("keys:addNew",targetVehicle,plate)
                    TriggerEvent("DoLongHudText", "Ignition Working.",1)
                    SetEntityAsMissionEntity(targetVehicle,false,true)
                    SetVehicleHasBeenOwnedByPlayer(targetVehicle,true)
                    TriggerEvent("chop:plateoff",plate)

                end
                lockpicking = false
            end
        end
    end
    lockpicking = false
end)

RegisterNetEvent('inv:advlockPick')
AddEventHandler('inv:advlockPick', function(isForced,inventoryName,slot)
    TriggerEvent("robbery:scanLock",true)
    if lockpicking then return end

    lockpicking = true
    playerped = PlayerPedId()
    targetVehicle = GetVehiclePedIsUsing(playerped)
    local itemid = 21

    if targetVehicle == 0 then
        coordA = GetEntityCoords(playerped, 1)
        coordB = GetOffsetFromEntityInWorldCoords(playerped, 0.0, 100.0, 0.0)
        targetVehicle = getVehicleInDirection(coordA, coordB)
        local driverPed = GetPedInVehicleSeat(targetVehicle, -1)
        if targetVehicle == 0 then
            lockpicking = false
            TriggerEvent("robbery:lockpickhouse",isForced)
            return
        end

        if driverPed ~= 0 then
            lockpicking = false
            return
        end
            local d1,d2 = GetModelDimensions(GetEntityModel(targetVehicle))
            local leftfront = GetOffsetFromEntityInWorldCoords(targetVehicle, d1["x"]-0.25,0.25,0.0)

            local count = 5000
            local dist = #(vector3(leftfront["x"],leftfront["y"],leftfront["z"]) - GetEntityCoords(PlayerPedId()))
            while dist > 2.0 and count > 0 do
                dist = #(vector3(leftfront["x"],leftfront["y"],leftfront["z"]) - GetEntityCoords(PlayerPedId()))
                Citizen.Wait(1)
                count = count - 1
                DrawText3Ds(leftfront["x"],leftfront["y"],leftfront["z"],"Move here to lockpick.")
            end

            if dist > 2.0 then
                lockpicking = false
                return
            end


            TaskTurnPedToFaceEntity(PlayerPedId(), targetVehicle, 1.0)
            Citizen.Wait(1000)
            TriggerEvent('InteractSound_CL:PlayOnOne', 'lockpick', 1.0)
            local triggerAlarm = GetVehicleDoorLockStatus(targetVehicle) > 1
            if triggerAlarm then
                SetVehicleAlarm(targetVehicle, true)
                StartVehicleAlarm(targetVehicle)
            end


            --TriggerEvent("civilian:alertPolice",20.0,"lockpick",targetVehicle)
           
            TriggerEvent("animation:lockpickinvtestoutside")
            TriggerEvent('InteractSound_CL:PlayOnOne', 'lockpick', 1.0)



 
            local finished = exports["drp-bar"]:taskBar(25000,3)

            if finished ~= 100 then
                 lockpicking = false
                return
            end


            if finished == 100 then
                if triggerAlarm then
                    SetVehicleAlarm(targetVehicle, false)
                end
                local chance = math.random(50)
                if #(GetEntityCoords(targetVehicle) - GetEntityCoords(PlayerPedId())) < 10.0 and targetVehicle ~= 0 and GetEntitySpeed(targetVehicle) < 5.0 then

                    SetVehicleDoorsLocked(targetVehicle, 1)
                    TriggerEvent("DoLongHudText", "Vehicle Unlocked.",1)
                    TriggerEvent('InteractSound_CL:PlayOnOne', 'unlock', 0.1)

                end
            end
        lockpicking = false
    else
        if targetVehicle ~= 0 and not isForced then

            TriggerEvent('InteractSound_CL:PlayOnOne', 'lockpick', 1.0)
            local triggerAlarm = GetVehicleDoorLockStatus(targetVehicle) > 1
            if triggerAlarm then
                SetVehicleAlarm(targetVehicle, true)
                StartVehicleAlarm(targetVehicle)
            end

            SetVehicleHasBeenOwnedByPlayer(targetVehicle,true)
            --TriggerEvent("civilian:alertPolice",12.0,"lockpick",targetVehicle)
           
            TriggerEvent("animation:lockpickinvtest")
            TriggerEvent('InteractSound_CL:PlayOnOne', 'lockpick', 1.0)

           
            local carTimer = GetVehicleHandlingFloat(targetVehicle, 'CHandlingData', 'nMonetaryValue')
            if carTimer == nil then
                carTimer = math.random(25000,180000)
            end
            if carTimer < 25000 then
                carTimer = 25000
            end

            if carTimer > 180000 then
                carTimer = 180000
            end
            
            carTimer = math.ceil(carTimer / 3)


            local myJob = exports["isPed"]:isPed("myJob")
            if myjob == "towtruck" then
                carTimer = 4000
            end

          

            TriggerEvent("civilian:alertPolice",12.0,"lockpick",targetVehicle)
            local finished = exports["drp-bar"]:taskBar(5000,math.random(5,10))
            local lockpickbreak = math.random(1,15)
            if finished ~= 100 and lockpickbreak == 1 then
               
                TriggerEvent("DoLongHudText", "Your advanced lockpick broke",2)
                TriggerEvent("inventory:removeItem","advlockpick", 1)                
                 lockpicking = false
                return
            end     


            Citizen.Wait(500)
            if finished == 100 then
                if triggerAlarm then
                    SetVehicleAlarm(targetVehicle, false)
                end
                local chance = math.random(50)
                if #(GetEntityCoords(targetVehicle) - GetEntityCoords(PlayerPedId())) < 10.0 and targetVehicle ~= 0 and GetEntitySpeed(targetVehicle) < 5.0 then

                    local plate = GetVehicleNumberPlateText(targetVehicle)
                    SetVehicleDoorsLocked(targetVehicle, 1)
                    TriggerEvent("keys:addNew",targetVehicle,plate)
                    TriggerEvent("DoLongHudText", "Ignition Working.",1)
                    SetEntityAsMissionEntity(targetVehicle,false,true)
                    SetVehicleHasBeenOwnedByPlayer(targetVehicle,true)
                    TriggerEvent("chop:plateoff",plate)

                end
                lockpicking = false
            end
        end
    end
    lockpicking = false
end)



local reapiring = false
RegisterNetEvent('veh:repairing')
AddEventHandler('veh:repairing', function(inventoryName,slot,itemid)
    local playerped = PlayerPedId()
    local coordA = GetEntityCoords(playerped, 1)
    local coordB = GetOffsetFromEntityInWorldCoords(playerped, 0.0, 100.0, 0.0)
    local targetVehicle = getVehicleInDirection(coordA, coordB)

    local advanced = false
    if itemid == "advrepairkit" or itemid == "pdrepairkit" or itemid == "racerepairkit" then
        advanced = true
    end

    if targetVehicle ~= 0 then

        local d1,d2 = GetModelDimensions(GetEntityModel(targetVehicle))
        local moveto = GetOffsetFromEntityInWorldCoords(targetVehicle, 0.0,d2["y"]+0.5,0.2)
        local dist = #(vector3(moveto["x"],moveto["y"],moveto["z"]) - GetEntityCoords(PlayerPedId()))
        local count = 1000
        local fueltankhealth = GetVehiclePetrolTankHealth(targetVehicle)

        while dist > 1.5 and count > 0 do
            dist = #(vector3(moveto["x"],moveto["y"],moveto["z"]) - GetEntityCoords(PlayerPedId()))
            Citizen.Wait(1)
            count = count - 1
            DrawText3Ds(moveto["x"],moveto["y"],moveto["z"],"Move here to repair.")
        end

        if reapiring then return end
        reapiring = true
        
        local timeout = 20

        NetworkRequestControlOfEntity(targetVehicle)

        while not NetworkHasControlOfEntity(targetVehicle) and timeout > 0 do 
            NetworkRequestControlOfEntity(targetVehicle)
            Citizen.Wait(100)
            timeout = timeout -1
        end


        if dist < 1.5 then
            TriggerEvent("animation:repair",targetVehicle)
            fixingvehicle = true

            local repairlength = 1000

            if advanced then
                local timeAdded = 0
                for i=0,5 do
                    if IsVehicleTyreBurst(targetVehicle, i, false) then
                        if IsVehicleTyreBurst(targetVehicle, i, true) then
                            timeAdded = timeAdded + 1200
                        else
                           timeAdded = timeAdded + 800
                        end
                    end
                end
                local fuelDamage = 48000 - (math.ceil(fueltankhealth)*12)
                repairlength = ((3500 - (GetVehicleEngineHealth(targetVehicle) * 3) - (GetVehicleBodyHealth(targetVehicle)) / 2) * 5) + 2000
                repairlength = repairlength + timeAdded + fuelDamage
            else
                local timeAdded = 0
                for i=0,5 do
                    if IsVehicleTyreBurst(targetVehicle, i, false) then
                        if IsVehicleTyreBurst(targetVehicle, i, true) then
                            timeAdded = timeAdded + 1600
                        else
                           timeAdded = timeAdded + 1200
                        end
                    end
                end
                local fuelDamage = 48000 - (math.ceil(fueltankhealth)*12)
                repairlength = ((3500 - (GetVehicleEngineHealth(targetVehicle) * 3) - (GetVehicleBodyHealth(targetVehicle)) / 2) * 3) + 2000
                repairlength = repairlength + timeAdded + fuelDamage
            end


            local finished = exports["drp-bar"]:taskBar(5000,math.random(4,8))
            if finished ~= 100 then
                fixingvehicle = false
                reapiring = false
                ---ClearPedTasks(playerped)
                return
            end

            if finished == 100 then
                
                local myJob = exports["isPed"]:isPed("myJob")
                if myJob == "towtruck" then

                    SetVehicleEngineHealth(targetVehicle, 1000.0)
                    SetVehicleBodyHealth(targetVehicle, 1000.0)
                    SetVehiclePetrolTankHealth(targetVehicle, 4000.0)

                    if math.random(100) > 95 then
                        TriggerEvent("inventory:removeItem","repairtoolkit",1)
                    end

                else

                    

                    if advanced then
                        
                        if GetVehicleEngineHealth(targetVehicle) < 900.0 then
                            SetVehicleEngineHealth(targetVehicle, 1000.0)
                            SetVehicleFixed(targetVehicle, 1000)
                        end
                        if GetVehicleBodyHealth(targetVehicle) < 945.0 then
                            SetVehicleBodyHealth(targetVehicle, 945.0)
                            SetVehicleFixed(targetVehicle, 1000.0)
                        end

                        if fueltankhealth < 3800.0 then
                            SetVehiclePetrolTankHealth(targetVehicle, 3800.0)
                            SetVehicleFixed(targetVehicle, 1000.0)
                        end

                    else

                        local timer = math.ceil(GetVehicleEngineHealth(targetVehicle) * 5)
                        if timer < 2000 then
                            timer = 2000
                        end
                        exports["drp-taskbar"]:taskBar(15000, "Fixing Vehicle")
                        if finished == 100 then
                            fixingvehicle = false
                            reapiring = false
                            ClearPedTasks(playerped)

                            
                        if math.random(100) > 55 then
                            TriggerEvent("inventory:removeItem","repairtoolkit",1)
                        end

                        if GetVehicleEngineHealth(targetVehicle) < 200.0 then
                            SetVehicleEngineHealth(targetVehicle, 200.0)
                        end
                        if GetVehicleBodyHealth(targetVehicle) < 945.0 then
                            SetVehicleBodyHealth(targetVehicle, 945.0)
                        end

                        if fueltankhealth < 2900.0 then
                            SetVehiclePetrolTankHealth(targetVehicle, 2900.0)
                        end                        

                        if GetEntityModel(targetVehicle) == `BLAZER` then
                            SetVehicleEngineHealth(targetVehicle, 600.0)
                            SetVehicleBodyHealth(targetVehicle, 800.0)
                        end
                        
                            return
                        end

                    end                    
                end

                for i = 0, 5 do
                    SetVehicleTyreFixed(targetVehicle, i) 
                end
            end
            ClearPedTasks(playerped)
        end
        fixingvehicle = false
    end
    reapiring = false
end)

local function repairVehiclePart(pTargetVehicle, pData)
    for part, data in pairs(pData) do
        if part == "Engine" then
            SetVehicleEngineHealth(pTargetVehicle, data + 0.0)
        elseif part == "Body" then
            SetVehicleBodyHealth(pTargetVehicle, data + 0.0)
        elseif part == "PetrolTank" then
            SetVehiclePetrolTankHealth(pTargetVehicle, data + 0.0)
        elseif part == "Tyre" then
            for i = 0, 11 do
                SetVehicleTyreFixed(pTargetVehicle, i)
            end
        end
    end
end


RegisterNetEvent("repair:vehicle")
AddEventHandler("repair:vehicle", function(pTargetVehicle, pData)
    repairVehiclePart(NetToVeh(pTargetVehicle), pData)
end)

-- Animations
RegisterNetEvent('animation:load')
AddEventHandler('animation:load', function(dict)
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end)

RegisterNetEvent('animation:repair')
AddEventHandler('animation:repair', function(veh)
    SetVehicleDoorOpen(veh, 4, 0, 0)
    RequestAnimDict("mini@repair")
    while not HasAnimDictLoaded("mini@repair") do
        Citizen.Wait(0)
    end

    TaskTurnPedToFaceEntity(PlayerPedId(), veh, 1.0)
    Citizen.Wait(1000)

    while fixingvehicle do
        local anim3 = IsEntityPlayingAnim(PlayerPedId(), "mini@repair", "fixing_a_player", 3)
        if not anim3 then
            TaskPlayAnim(PlayerPedId(), "mini@repair", "fixing_a_player", 8.0, -8, -1, 16, 0, 0, 0, 0)
        end
        Citizen.Wait(1)
    end
    SetVehicleDoorShut(veh, 4, 1, 1)
end)

function getInformationFromFirstItem(itemToFind)
  local foundItem = exports["drp-inventory"]:GetInfoForFirstItemOfName(itemToFind)
  return foundItem and json.decode(foundItem.information or '{}') or nil
end
exports("getInformationFromFirstItem", getInformationFromFirstItem)

--
local isDead = false
AddEventHandler("pd:deathcheck", function()
  isDead = not isDead
end)
local poisonedThings = {
  ["poisonedcocktail"] = true,
  ["poisonedsandwich"] = true,
  ["poisonedwater"] = true,
}
AddEventHandler("drp-inventory:itemUsed", function(name, info)
  if not info then return end
  local info = json.decode(info)
  if not info then return end
  if not info._is_poisoned then return end
  local potency = info.potency or 5
  if not potency or potency < 1 then
    potency = 1
  end
  if potency and potency > 101 then
    potency = 101
  end
  local interval = info.interval or 60
  if interval < 1 then
    interval = 1
  end
  local duration = info.duration or 60
  if duration < 1 then
    duration = 1
  end
  TriggerServerEvent("ems:addpoisonedblood")
  Citizen.CreateThread(function()
    local loopCount = 0
    local alertSent = false
    Wait(interval * 1000)
    while loopCount < duration and not isDead do
      if not alertSent and math.random() < 0.2 then
        alertSent = true
        TriggerEvent("DoLongHudText", "You don't feel too well.", 2)
      end
      if info.nonLethal then
        TriggerEvent('ragdoll:setPoisonState', true)
      end
      SetEntityHealth(PlayerPedId(), GetEntityHealth(PlayerPedId()) - potency)
      loopCount = loopCount + 1
      Wait(interval * 1000)
    end
    TriggerEvent('ragdoll:setPoisonState', false)
  end)
end)

RegisterUICallback("drp-ui:inv:moneycaseAction", function(data, cb)
	cb({ data = {}, meta = { ok = true, message = "done" } })
  exports['drp-ui']:closeApplication('textbox')
  RPC.execute("drp-inventory:doMoneycaseAction", data)
end)

AddEventHandler("drp-inventory:openGolfStore", function(name, info)
  TriggerEvent("server-inventory-open", "42086", "Shop");
end)

function openBurner(info)
    loadAnimDict("cellphone@")
    TaskPlayAnim(PlayerPedId(), "cellphone@", "cellphone_text_read_base", 2.0, 3.0, -1, 49, 0, 0, 0, 0)
    TriggerEvent("attachItemPhone", "phone01")
    exports["drp-ui"]:openApplication("burner", info)
end

AddEventHandler("ammonium_bicarbonate:insert", function(pOriginInventory, pTargetInventory, pOriginSlot, pTargetSlot, pOriginItemId, pTargetItemId, pOriginItemInfo, pTargetItemInfo)
    if pOriginItemId ~= "1gcocaine" then return end
  
    local itemInfo = GetItemInfo(pOriginSlot)
    if itemInfo == nil then return end
  
    local quantity = itemInfo.amount or 0
    if quantity == 0 then return end
  
    if quantity > 5 then
        return TriggerEvent("DoLongHudText", "Hmm seems like I can't do that many...", 2)
    end
  
    local newBagsQuantity = quantity * 2
    
    TriggerEvent("closeInventoryGui")
    
    local finished = exports["drp-taskbar"]:taskBar(5000 * quantity, "Breaking down into baggies...", false, false)
    if finished ~= 100 then return end
  
    -- Remove 10g bags
    TriggerEvent("inventory:removeItem", pOriginItemId, quantity)
    TriggerEvent("inventory:removeItem", "ammonium_bicarbonate", 1)
    
    -- Give 5g bags
    TriggerEvent("player:receiveItem", "coke5g", newBagsQuantity)
  
  end)

function notepadUsed()
    exports["drp-ui"]:openApplication("notepad", {
        canSave = true
    })
    TriggerEvent("animation:PlayAnimation", "notepad")
end

RegisterUICallback('drp-ui:cancelNotepadEmote', function (data, cb)
    cb({ data = {}, meta = { ok = true, message = "done" } })
    TriggerEvent("animation:PlayAnimation", "cancel")
end)

RegisterUICallback('drp-ui:createNotepadNote', function (data, cb)
    cb({ data = {}, meta = { ok = true, message = "done" } })

    exports["drp-ui"]:closeApplication("notepad")

    TriggerEvent("player:receiveItem", "notepadnote", 1, false, {
        ["content"] = data.content,
        ["_hideKeys"] = { "content" }
    })
    TriggerEvent("inventory:DegenLastUsedItem", 10)
end)

function notepadPageUsed(itemInfo)
    local json = json.decode(itemInfo)
    exports["drp-ui"]:openApplication("notepad", {
        canSave = false,
        content = json.content
    })
end
