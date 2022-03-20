CardSpot = false

Citizen.CreateThread(function()
    exports["drp-polyzone"]:AddBoxZone("pok_shop", vector3(-141.61402893066, 224.66606140137, 94.987030029297), 2, 2, {
        name="pok_shop",
        heading=0,
        minZ=92.34,
        maxZ=96.34
      })
end)

AddEventHandler('drp-polyzone:enter', function(name)
    if name == "pok_shop" then
        CardSpot = true
	    CardShop()
        exports['drp-ui']:showInteraction("[E] Comic Store")
    end
end)
exports['drp-ui']:hideInteraction()

AddEventHandler('drp-polyzone:exit', function(name)
    if name == "pok_shop" then
	CardSpot = false 
    exports['drp-ui']:hideInteraction()
	end
end)

function CardShop()
    Citizen.CreateThread(function()
        while CardSpot do
            Citizen.Wait(5)
            if IsControlJustReleased(0, 38) then
                TriggerEvent("drp-pokemon:shop")
            end
        end
    end)
end

RegisterNetEvent("drp-pokemon:shop")
AddEventHandler("drp-pokemon:shop", function()
    TriggerEvent('drp-context:sendMenu', {
        {
            id = 1,
            header = 'Buy 1x Booster Pack',
            txt = '($1000)',
            params = {
                event = "1pack",
                
            }
        },
        {
            id = 2,
            header = 'Buy 2x Booster Packs',
            txt = '($2000)',
            params = {
                event = "2pac",
                
            }
        },
        {
            id = 3,
            header = 'Buy 3x Booster Packs',
            txt = '($3000)',
            params = {
                event = "3pac",
                
            }
        },
        {
            id = 4,
            header = 'Buy Card Binder',
            txt = '($500)',
            params = {
                event = "bindyourmumsnuts",
                
            }
        },
        {
            id = 5,
            header = 'Close Menu',
            txt = 'Exit the menu',
            params = {
                event = "",
                
            }
        },
    })
end)

RegisterNetEvent("1pack")
AddEventHandler("1pack", function()
   remoteCalls.execute("yourdadisafatneek")
end)

RegisterNetEvent("2pac")
AddEventHandler("2pac", function()
   remoteCalls.execute("yourmumisfatneek")
end)

RegisterNetEvent("3pac")
AddEventHandler("3pac", function()
   remoteCalls.execute("yoursisterisfatneek")
end)

RegisterNetEvent("bindyourmumsnuts")
AddEventHandler("bindyourmumsnuts", function()
   remoteCalls.execute("stepsisisbangingyournan")
end)

local cards = {}

local packs = {
    ['shiningpack'] = {
        {name = 'bulbasaur', hollow = false},
        {name = 'ivysaur', hollow = false},
		{name = 'breloom', hollow = false}, 
		{name = 'torkoal', hollow = false},
		{name = 'larvesta', hollow = false},
		{name = 'litten', hollow = false},
		{name = 'torracat', hollow = false},
		{name = 'totodile', hollow = false},
		{name = 'croconaw', hollow = false},
		{name = 'qwilfish', hollow = false},
		{name = 'buizel', hollow = false},
		{name = 'pikachu', hollow = false},
		{name = 'voltorb', hollow = false},
		{name = 'plusle', hollow = false},
		{name = 'minun', hollow = false},
		{name = 'ekans', hollow = false},
		{name = 'jynx', hollow = false},
		{name = 'golett', hollow = false},
		{name = 'stunfisk', hollow = false},
		{name = 'purrloin', hollow = false},
		{name = 'scraggy', hollow = false},
		{name = 'zorua', hollow = false},
		{name = 'shaymin', hollow = false},
		{name = 'virizion', hollow = false},
		{name = 'reshiram', hollow = false},
		{name = 'palkia', hollow = false},
		{name = 'manaphy', hollow = false},
		{name = 'keldeo', hollow = false},
		{name = 'raikou', hollow = false},
		{name = 'zekrom', hollow = false},
		{name = 'latios', hollow = false},
		{name = 'marshadow', hollow = false},
		{name = 'yveltal', hollow = false},
		{name = 'hoopa', hollow = false},
		{name = 'venusaur', hollow = false},
		{name = 'carnivine', hollow = false},	
		{name = 'volcarona', hollow = false},	
		{name = 'incineroar', hollow = false},	
		{name = 'feraligatr', hollow = false},	
		{name = 'floatzel', hollow = false},
		{name = 'electrode', hollow = false},	
		{name = 'arbok', hollow = false},	
		{name = 'golurk', hollow = false},	
		{name = 'spiritomb', hollow = false},
		{name = 'liepard', hollow = false},	
		{name = 'scrafty', hollow = false},	
		{name = 'genesect', hollow = true},
		{name = 'volcanion', hollow = true},
		{name = 'mew', hollow = true},
		{name = 'jiranchi', hollow = true},
		{name = 'rayquaza', hollow = true},	
		{name = 'arceus', hollow = true},	
	},
}

RegisterNUICallback("close", function(data, cb)
	SetNuiFocus(false, false)
	cb(true)
end)

RegisterNUICallback("giveCard", function(data, cb)
	local name = data.cardName
	local hollow = data.hollow
	local itemInfo = { ['hollow'] = hollow, ['psa'] = tostring(math.random(1, 10)) }
    TriggerEvent("player:receiveItem", name, 1, true, itemInfo)
	cb(true)
end)

RegisterNetEvent("drp-pokemon:previewCard")
AddEventHandler("drp-pokemon:previewCard", function(name, hollow)
	SendNUIMessage({
		open = true,
		card = name,
		hollow = json.decode(hollow).Hollow
	})
	SetNuiFocus(true, true)
end)

local function GetCard(type)
    local pickedCard = {}
    local data = packs[type]
    local shuffled = {}
    for i, v in pairs(data) do local pos = math.random(1, #shuffled+1) table.insert(shuffled, pos, v) end
    for i=1, #shuffled do
        local chance = (math.random(1, 1000) / 10)
        if (chance == 1 or chance == 2 or chance == 3 or chance == 4 or chance == 5) and shuffled[i]['hollow'] then
            pickedCard =  data[i]
            break
        elseif not shuffled[i]['hollow'] then
            if math.random(1, 2) == 2 then
                pickedCard =  shuffled[i]
                break
            end
        end
    end
    return pickedCard
end

RegisterNetEvent('murdermeal')
AddEventHandler('murdermeal', function()
	local cid = exports["isPed"]:isPed("cid")
	TriggerEvent("server-inventory-open", "1", "Murder Meal -"..cid)
end)

RegisterNetEvent('murdermeal:toys1')
AddEventHandler('murdermeal:toys1', function(type)
	TriggerEvent("inventory:removeItem","randomtoy", 1)
	local chance = (math.random(1, 13))
	if (chance == 1) then
		TriggerEvent( "player:receiveItem","toy_shelly",1)
	end
	if (chance == 2) then
		TriggerEvent( "player:receiveItem","toy_ken",1)
	end
	if (chance == 3) then
		TriggerEvent( "player:receiveItem","toy_rob",1)
	end
	if (chance == 4) then
		TriggerEvent( "player:receiveItem","toy_sheldon",1)
	end
	if (chance == 5) then
		TriggerEvent( "player:receiveItem","toy_kevin",1)
	end
    if (chance == 6) then
		TriggerEvent( "player:receiveItem","toy_x",1)
	end
    if (chance == 7) then
		TriggerEvent( "player:receiveItem","toy_frank",1)
	end
    if (chance == 8) then
		TriggerEvent( "player:receiveItem","toy_sherry",1)
	end
    if (chance == 9) then
		TriggerEvent( "player:receiveItem","toy_molly",1)
	end
    if (chance == 10) then
		TriggerEvent( "player:receiveItem","toy_kitty",1)
	end
    if (chance == 11) then
		TriggerEvent( "player:receiveItem","toy_oki",1)
	end
    if (chance == 12) then
		TriggerEvent( "player:receiveItem","toy_kyle",1)
	end
    if (chance == 13) then
		TriggerEvent( "player:receiveItem","toy_kiki",1)
	end

end)


RegisterNetEvent('drp-pokemon:openPack')
AddEventHandler('drp-pokemon:openPack', function(type)
	TriggerEvent("inventory:removeItem", type, 1)
    local cards = {}
    repeat 
        local obtainedCard = GetCard(type)
        if obtainedCard['name'] then
            local shouldInsert = true
            for i=1, #cards do
                if cards[i]['name'] == obtainedCard['name'] then
                    shouldInsert = false
                end
            end
            if shouldInsert then table.insert(cards, obtainedCard) end
        end
    until #cards == 5
	SendNUIMessage({
		open = true,
		cards = cards
	})
	SetNuiFocus(true, true)
end)