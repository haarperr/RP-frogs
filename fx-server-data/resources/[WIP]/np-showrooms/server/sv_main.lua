RegisterNetEvent("showroom:purchaseVehicle")
AddEventHandler("showroom:purchaseVehicle", function(model, price, amount)
    local src = source
    local user = exports["np-base"]:getModule("Player"):GetUser(src)
    local cash = user:getCash()
    local plate = GeneratePlate()
    if 999999 >= price  then
        user:removeMoney(price)
        PurchaseCar(src, model, plate)
        return
    else
        if tonumber(cash) >= price  then
            user:removeMoney(price)
            PurchaseCar(src, model)
            return
        end
    end;
end)

function PurchaseCar(source, model, plate)
    local src = source;
    local user = exports["np-base"]:getModule("Player"):GetUser(src)
    local char = user:getCurrentCharacter()
    local model = model
    local plate = plate
    exports.ghmattimysql:execute('INSERT INTO characters_cars (owner, cid, model, vehicle_state, fuel, name, engine_damage, body_damage, current_garage, license_plate) VALUES(owner, @cid, @model, @vehicle_state, @fuel, @name, @engine_damage, @body_damage, @current_garage, @license_plate)', {
        ['owner'] = steamid,
        ['@cid'] = char.id,
        ['@model'] = model,
        ['@vehicle_state'] = "Out",
        ['@fuel'] = 100,
        ['@name'] = model,
        ['@engine_damage'] = 1000,
        ['@body_damage'] = 1000,
        ['@current_garage'] = "garagec",
        ['@license_plate'] = plate,
    })
    TriggerClientEvent("showroom:clPurchaseVehicle", src, model, plate)
end

function GeneratePlate()
    local plate = math.random(0, 99)..""..GetRandomLetter(3)..""..math.random(0, 999)
    local result = exports.ghmattimysql:scalarSync('SELECT plate FROM characters_cars WHERE plate=@plate', {['@plate'] = plate})
    if result then
        plate = tostring(GetRandomNumber(1)) .. GetRandomLetter(2) .. tostring(GetRandomNumber(3)) .. GetRandomLetter(2)
    end
    return plate:upper()
end

local NumberCharset = {}
local Charset = {}

for i = 48,  57 do table.insert(NumberCharset, string.char(i)) end
for i = 65,  90 do table.insert(Charset, string.char(i)) end
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