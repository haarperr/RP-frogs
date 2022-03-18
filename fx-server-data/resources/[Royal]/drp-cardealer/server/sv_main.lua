local repayTime = 168 * 60 -- hours * 60
local timer = ((60 * 1000) * 10) -- 10 minute timer

RegisterServerEvent("drp-cardealer:server:purchaseVeh")
AddEventHandler("drp-cardealer:server:purchaseVeh", function(price, plate, model, name, financed)
    local pSrc = source
    local user = exports["drp-base"]:getModule("Player"):GetUser(pSrc)
    local char = user:getCurrentCharacter()
    local player = user:getVar("hexid")
    if not financed then
        exports.ghmattimysql:execute('INSERT INTO characters_cars (owner, cid, license_plate, name, model, purchase_price, vehicle_state) VALUES (@owner, @cid, @license_plate, @name, @model, @buy_price, @vehicle_state)',{
            ['@owner'] = player,
            ['@cid'] = char.id,
            ['@license_plate'] = plate,
            ['@name'] = name,
            ['@model'] = model,
            ['@buy_price'] = price,
            ['@vehicle_state'] = "Out"
        })
    else
        local cols = 'owner, cid, license_plate, name, purchase_price, financed, model, vehicle_state, payments_left'
        local val = '@owner, @cid, @license_plate, @name, @buy_price, @financed, @model, @vehicle_state, @payments_left'
        local downPay = math.ceil(price / 4)
        exports.ghmattimysql:execute('INSERT INTO characters_cars ( '..cols..' ) VALUES ( '..val..' )',{
            ['@owner'] = player,
            ['@cid'] = char.id,
            ['@license_plate'] = plate,
            ['@name'] = name,
            ['@model'] = model,
            ['@buy_price'] = price,
            ['@financed'] = price - downPay,
            ['@payments_left'] = 12,
            ['@vehicle_state'] = "Out",
        })
    end
end)

------------ Repo Shit ----------------

RegisterServerEvent('car:dopayment')
AddEventHandler('car:dopayment', function(plateNumber)
    local pSrc = source
    local user = exports["drp-base"]:getModule("Player"):GetUser(pSrc)
    exports.ghmattimysql:execute("SELECT * FROM `characters_cars` WHERE license_plate = ?", {plateNumber}, function(data)
        if data[1] then
            local CurrentPayment = math.floor(data[1].financed/data[1].payments_left)
            if user:getBalance() >= CurrentPayment then
                local total_price = data[1].purchase_price
                exports.ghmattimysql:execute("UPDATE characters_cars SET finance_time = @finance_time, payments_left = @payments_left, financed = @financed WHERE license_plate = @license_plate",{
                    ['@license_plate'] = plateNumber,
                    ['@payments_left'] =  data[1].payments_left  - 1,
                    ['@finance_time'] = repayTime,
                    ['@financed'] =  data[1].financed - CurrentPayment
                })

                user:removeBank(CurrentPayment)
                TriggerEvent("Endless:AddToMoneyLog", pSrc, "personal", -CurrentPayment, "withdraw", "N/A", (note ~= "" and note or "Car payment of $"..math.floor(CurrentPayment).." was taken out."))
            else
                TriggerClientEvent("DoLongHudText", pSrc, "You need $"..CurrentPayment.. " in your bank account to afford this car payment!")
            end                
        end
    end)
end)

RegisterServerEvent("drp-vehicleshop:repo")
AddEventHandler("drp-vehicleshop:repo", function(plate)
    local src = source
    local user = exports["drp-base"]:getModule("Player"):GetUser(src)
    local cid = user:getVar("character").id

    exports.ghmattimysql:execute("SELECT `license_plate`, `repoed` FROM `characters_cars` WHERE license_plate = ? AND finance_time = ? AND payments_left >= 1", {plate, "0"}, function(data)
        if data[1] then
            exports.ghmattimysql:execute("UPDATE characters_cars SET repoed = @repoed WHERE license_plate = @license_plate",
                {['license_plate'] = plate,
                ['@repoed'] = "1"
            })
            TriggerClientEvent("drp-vehicleshop:repo:success", src)
            TriggerEvent("paycheck:server:add", src, cid, 500)
        else
            TriggerClientEvent("DoLongHudText", src, "This vehicle is not owned by anyone", 2)
        end
    end)        
  
end)

RegisterServerEvent("drp-vehicleshop:checkrepo")
AddEventHandler("drp-vehicleshop:checkrepo", function(plate)
    if plate == nil then
        return 
    end

    local src = source
    local user = exports["drp-base"]:getModule("Player"):GetUser(src)
    local cid = user:getVar("character").id

    exports.ghmattimysql:execute("SELECT * FROM `characters_cars` WHERE license_plate = ? and cid = ?", {plate, cid}, function(data)
        if data[1] ~= nil then
            local pVehID = data[1].id
            local pFinace = data[1].finance_time
            if data[1].repoed == tonumber(1) then
                if pFinace >= 2500 then
                    if user:getBalance() >= 5000 then
                        exports.ghmattimysql:execute("UPDATE characters_cars SET repoed = @repoed WHERE license_plate = @license_plate",{
                            ['license_plate'] = plate,
                            ['repoed'] = "0"
                        })
                        user:removeBank(5000)
                        data = {
                            pVeh = pVehID
                        }
                        TriggerClientEvent("drp-garages:takeout", src, data)
                        TriggerClientEvent("DoLongHudText", src, "Vehicle released behind the building", 1)
                    else
                        TriggerClientEvent("DoLongHudText", src, "You cant afford the release fee of $5000", 2)
                    end
                else
                    TriggerClientEvent("DoLongHudText", src, "You need to make a payment before your car is released", 2)
                end
            else
                TriggerClientEvent("DoLongHudText", src, "This vehicle is not on the list!", 2)
            end
        end
    end)
end)


function updateFinance()
    exports.ghmattimysql:execute("SELECT * FROM `characters_cars` WHERE finance_time > 0 AND payments_left >= 1", {}, function(result)
        for i=1, #result do
            local financeTimer = result[i].finance_time
            local license_plate = result[i].license_plate
            local newTimer = financeTimer - 10
            if financeTimer ~= nil then
                exports.ghmattimysql:execute('UPDATE characters_cars SET finance_time = @timer WHERE license_plate = @license_plate', {
                    ['@license_plate'] = license_plate,
                    ['@timer'] = newTimer
                })
            end
        end
    end)
    SetTimeout(timer, updateFinance)
end
SetTimeout(timer, updateFinance)
