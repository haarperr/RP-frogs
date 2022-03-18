local carTable = {
	[1] = { ["model"] = "911turbos", ["baseprice"] = 525000, ["commission"] = 15 },
    [2] = { ["model"] = "panamera17turbo", ["baseprice"] = 600000, ["commission"] = 15 },
	[3] = { ["model"] = "m4", ["baseprice"] = 400000, ["commission"] = 15 },
	[4] = { ["model"] = "lp670", ["baseprice"] = 750000, ["commission"] = 15 },
	[5] = { ["model"] = "granlb", ["baseprice"] = 500000, ["commission"] = 15 },
	[6] = { ["model"] = "filthynsx", ["baseprice"] = 400000, ["commission"] = 15 },
	[7] = { ["model"] = "audirs6tk", ["baseprice"] = 350000, ["commission"] = 15 },
	[8] = { ["model"] = "bdragon", ["baseprice"] = 550000, ["commission"] = 15 }, 
}

-- Update car table to server
RegisterServerEvent('drp-sunrise:CarTablePDM')
AddEventHandler('drp-sunrise:CarTablePDM', function(table)
    if table ~= nil then
        carTable = table
        TriggerClientEvent('drp-sunrise:ReturnPDMTTable', -1, carTable)
        for i=1, #carTable do
            exports.ghmattimysql:execute("UPDATE vehicle_display SET model=@model, name=@name, commission=@commission, baseprice=@baseprice WHERE id=@id", {
                ['@id'] = i,
                ['@model'] = table[i]["model"],
                ['@name'] = table[i]["name"],
                ['@commission'] = table[i]["commission"],
                ['@baseprice'] = table[i]["baseprice"]
            })
        end
    end
end)

-- Enables finance for 60 seconds
RegisterServerEvent('drp-sunrise:FinaceEnabledSV')
AddEventHandler('drp-sunrise:FinaceEnabledSV', function(plate)
    if plate ~= nil then
        TriggerClientEvent('drp-sunrise:FinaceEnabledCL', -1, plate)
    end
end)

RegisterServerEvent('drp-sunrise:BuyEnabledSV')
AddEventHandler('drp-sunrise:BuyEnabledSV', function(plate)
    if plate ~= nil then
        TriggerClientEvent('drp-sunrise:BuyEnabledCL', -1, plate)
    end
end)

-- return table
-- TODO (return db table)
RegisterServerEvent('drp-sunrise:RequestPDMTTable')
AddEventHandler('drp-sunrise:RequestPDMTTable', function()
    local user = source
    exports.ghmattimysql:execute("SELECT * FROM vehicle_display", {}, function(display)
        for k,v in pairs(display) do
            carTable[v.id] = v
            v.price = carTable[v.id].baseprice
        end
        TriggerClientEvent('drp-sunrise:ReturnPDMTTable', user, carTable)
    end)
end)

-- Check if player has enough money
RegisterServerEvent('drp-sunrise:ChechMoney')
AddEventHandler('drp-sunrise:ChechMoney', function(name, model, price)
    local src = source
    local user = exports["drp-base"]:getModule("Player"):GetUser(src)
    local characterId = user:getCurrentCharacter().id
    local cash = user:getCash()
    local plate = GeneratePlate()

    if tonumber(cash) >= price then
        user:removeMoney(price)
        TriggerClientEvent('FinishMoneyCheckForVehpdm', src, name, model, price, plate)
    elseif tonumber(cash) <= price then
        TriggerClientEvent('DoLongHudText', src, "You don't have enough money!", 2)
        TriggerClientEvent('drp-sunrise:FailedPurchase', src)
    end
end)

RegisterServerEvent('drp-sunrise:BuyVehicle')
AddEventHandler('drp-sunrise:BuyVehicle', function(plate, name, vehicle, price, personalvehicle)
    local src = source
    local user = exports["drp-base"]:getModule("Player"):GetUser(src)
    local player = user:getVar("hexid")
    local char = user:getVar("character")
    exports.ghmattimysql:execute('INSERT INTO characters_cars (cid, license_plate, model, data, purchase_price, name, vehicle_state, current_garage) VALUES (@cid, @license_plate, @model, @data, @purchase_price, @name, @vehicle_state, @current_garage)',{
        ['@cid']   = char.id,
        ['@license_plate']  = plate,
        ['@model'] = vehicle,
        ['@data'] = json.encode(personalvehicle),
        ['@name'] = name,
        ['@purchase_price'] = price,
        ['@current_garage'] = "garagec",
        ['@vehicle_state'] = "Out",
    })
end)

function GeneratePlate()
    local plate = math.random(0, 99) .. "" .. GetRandomLetter(3) .. "" .. math.random(0, 999)
    local result = exports.ghmattimysql:scalarSync('SELECT license_plate FROM characters_cars WHERE license_plate = @license_plate', {['@license_plate'] = plate})
    if result then
        plate = tostring(GetRandomNumber(1)) .. GetRandomLetter(2) .. tostring(GetRandomNumber(3)) .. GetRandomLetter(2)
    end
    return plate:upper()
end

local NumberCharset = {}
local Charset = {}

for i = 48, 57 do table.insert(NumberCharset, string.char(i)) end
for i = 65, 90 do table.insert(Charset, string.char(i)) end
for i = 97, 122 do table.insert(Charset, string.char(i)) end

function GetRandomLetter(length)
    Citizen.Wait(1)
    math.randomseed(GetGameTimer())
    if length > 0 then
        return GetRandomLetter(length - 1) .. Charset[math.random(1, #Charset)]
    else
        return ''
    end
end