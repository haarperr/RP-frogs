
    
Original Blackjack Script - Kgv-Blackjack    
Original textUI & casinoUi - Cd_Drawtextui  
Original nh-contxt menu before removal    
    
this was made by a noob [me- Dojwun] so use at your own leisure :)
can obviously be improved but do i care? not really.. it works.. kinda .. i think 
enjoy this cuz its free and yeah    



Happy coding coders!

-- Optinal Casino Shop (Must add yourself sorry) 
--===== Bt-Target START=====
-- Add Ped "U_F_M_CasinoCash_01" or ped of your choice in bt/qtarget to access asino shop menu


    local Casino = {
        `U_F_M_CasinoCash_01`,
    }
    AddTargetModel(Casino, {
        options = {
            {
                event = "doj:casinoChipMenu",
                icon = "fas fa-exchange-alt",
                label = "Exchange Casino Chips", 
            },
            {
                event = "qb-casino:client:openCasinoChips",
                icon = "fas fa-coins",
                label = "Purchase Casino Chips", 
            },
            {
                event = "qb-casino:client:openCasinoMembersips", 
                icon = "fas fa-id-card",
                label = "Purchase Casino Memberships", 
            },
        },
        job = {"all"},
        distance = 3.5
    })
--===== Bt-Target END =====

--===== Qb_inventory START =====
-- Add "Config.CasinoChips & Config.CasinoMemberships" to "qb-inventory/config.lua" to add / remove items


--Chips
Config.CasinoChips = {
    [1] = { name = "whitechip", price = 1,   amount = 1000, info = {}, type = "item", slot = 1 },
    [2] = { name = "redchip",   price = 5,   amount = 1000, info = {}, type = "item", slot = 2 },
    [3] = { name = "bluechip",  price = 10,  amount = 1000, info = {}, type = "item", slot = 3 },
    [4] = { name = "blackchip", price = 50,  amount = 1000, info = {}, type = "item", slot = 4 },
    [5] = { name = "goldchip",  price = 100, amount = 1000, info = {}, type = "item", slot = 5 }
}
-- Memberships
Config.CasinoMemberships = {
    [1] = { name = "member", price = 500, amount = 5, info = {}, type = "item", slot = 1 },
    [2] = { name = "vip",    price = 750, amount = 5, info = {}, type = "item", slot = 2 }
}



--Add both of these events to "qb-inventory/client/main.lua" to register "casino shops"

RegisterNetEvent('qb-casino:client:openCasinoChips')
AddEventHandler('qb-casino:client:openCasinoChips', function()
    local ShopItems = {}
    ShopItems.label = "Diamond Casino Chips"
    ShopItems.items = Config.CasinoChips
    ShopItems.slots = #Config.CasinoChips
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "Vendingshop_", ShopItems)
end)

RegisterNetEvent('qb-casino:client:openCasinoMembersips')
AddEventHandler('qb-casino:client:openCasinoMembersips', function()
    local ShopItems = {}
    ShopItems.label = "Diamond Casino Memberships"
    ShopItems.items = Config.CasinoMemberships
    ShopItems.slots = #Config.CasinoMemberships
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "Vendingshop_", ShopItems)
end)


--===== Qb_inventory END =====
