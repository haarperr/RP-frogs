RegisterCommand('tow', function(source, args)
    local src = source
	local user = exports["drp-base"]:getModule("Player"):GetUser(src)
    local char = user:getCurrentCharacter()
    exports.ghmattimysql:execute("SELECT `job` FROM `jobs_whitelist` WHERE cid = ?", {char.id}, function(data)
        if data[1].job == 'towunion' then
            TriggerClientEvent('pv:tow', src)
        end
    end)
end)

RegisterServerEvent("drp-vehicles:checkrepo")
AddEventHandler("drp-vehicles:checkrepo", function(plate)
    local src = source
    exports.ghmattimysql:execute("SELECT * FROM `characters_cars` WHERE license_plate = ?", {plate}, function(data)
        if data[1] ~= nil then
            if data[1].last_payment == 0 and data[1].payments_left >= 1 then
                TriggerClientEvent('DoLongHudText', src, 'This vehicle is on the list!', 1)
            else
                TriggerClientEvent('DoLongHudText', src, 'This vehicle is not on the list!', 2)
            end
        else
            TriggerClientEvent('DoLongHudText', src, 'This vehicle does not exist!', 2)
        end
    end)
end)

RegisterServerEvent("drp-vehicles:repo")
AddEventHandler("drp-vehicles:repo", function(plate)
    local src = source
	local user = exports["drp-base"]:getModule("Player"):GetUser(src)
    local char = user:getCurrentCharacter()
    exports.ghmattimysql:execute("SELECT * FROM character_passes WHERE cid = @cid", {['cid'] = char.id}, function(result)
        if result[1].pass_type == 'car_shop' or result[1].pass_type == 'import_shop' or result[1].pass_type == 'towunion' then
            exports.ghmattimysql:execute("SELECT `license_plate`, `repoed` FROM `characters_cars` WHERE license_plate = ? AND last_payment = ? AND payments_left >= 1", {plate, "0", "0"}, function(data)
                if data[1] then
                    exports.ghmattimysql:execute("UPDATE characters_cars SET repoed = @repoed WHERE license_plate = @license_plate",
                        {['license_plate'] = plate,
                        ['@repoed'] = "1"
                    })
                    TriggerClientEvent("drp-vehicles:repo:success", src)
                    TriggerEvent("paycheck:server:add", src, cid, 100)
                else
                    TriggerClientEvent('DoLongHudText', src, 'This vehicle is not owned by anyone!', 2)
                end
            end)
        end
    end)
end)

RegisterServerEvent("drp-vehicles:judgerepo")
AddEventHandler("drp-vehicles:judgerepo", function(plate)
    local src = source
	local user = exports["drp-base"]:getModule("Player"):GetUser(src)
    local char = user:getCurrentCharacter()
    exports.ghmattimysql:execute("SELECT `license_plate`, `repoed` FROM `characters_cars` WHERE license_plate = ?", {char.id}, function(data)
        if data[1] then
            if data[1].repoed == 0 then
                exports.ghmattimysql:execute("UPDATE characters_cars SET repoed = @repoed WHERE license_plate = @license_plate",
                    {['license_plate'] = plate,
                    ['@repoed'] = "1",
                    ['@current_garage'] = "nomalimpound",
                    ['@vehicle_state'] = "In"
                })
                TriggerClientEvent('DoLongHudText', src, "The plate [".. plate .."] has successfully been repossed!", 1)
            else
                TriggerClientEvent('DoLongHudText', src, "The plate [".. plate .."] has been already repossed!", 2)
            end
        else
            TriggerClientEvent('DoLongHudText', src, 'This vehicle is not owned by anyone!', 2)
        end
    end)
end)

RegisterServerEvent("drp-vehicles:judgerepodelete")
AddEventHandler("drp-vehicles:judgerepodelete", function(plate)
    local src = source
	local user = exports["drp-base"]:getModule("Player"):GetUser(src)
    local char = user:getCurrentCharacter()
    exports.ghmattimysql:execute("SELECT `license_plate`, `repoed` FROM `characters_cars` WHERE license_plate = ?", {char.id}, function(data)
        if data[1] then
            if data[1].repoed == 1 then
                exports.ghmattimysql:execute("UPDATE characters_cars SET repoed = @repoed WHERE license_plate = @license_plate",
                    {['license_plate'] = plate,
                    ['@repoed'] = "0",
                    ['@current_garage'] = "nomalimpound",
                    ['@vehicle_state'] = "In"
                })
                TriggerClientEvent('DoLongHudText', src, "The plate [".. plate .."] has been removed from repossed garage!", 1)
            else
                TriggerClientEvent('DoLongHudText', src, "The plate [".. plate .."] has not been repossed!", 2)
            end
        else
            TriggerClientEvent('DoLongHudText', src, 'This vehicle is not owned by anyone!', 2)
        end
    end)
end)

RegisterServerEvent("drp-vehicles:repo2")
AddEventHandler("drp-vehicles:repo2", function(plate)
    local src = source
	local user = exports["drp-base"]:getModule("Player"):GetUser(src)
    local char = user:getCurrentCharacter()
    exports.ghmattimysql:execute("SELECT * FROM characters WHERE id = @cid", {['cid'] = char.id}, function(result2)
        if result2[1].job == 'towunion' or result2[1].job == 'police' or result2[1].job == 'sheriff' then
            if result2[1] then
                exports.ghmattimysql:execute("UPDATE characters_cars SET current_garage = @current_garage, vehicle_state = @vehicle_state WHERE license_plate = @license_plate", {
                    ['@license_plate'] = plate,
                    ['@repoed'] = "0",
                    ['@current_garage'] = "nomalimpound",
                    ['@vehicle_state'] = "In"
                })
                TriggerClientEvent("drp-vehicles:repo:success2", src)
            else
                TriggerClientEvent('DoLongHudText', SrcID, 'You cannot do this.', 2)
            end
        end
    end)
end)


RegisterServerEvent("drp-vehicles:release:vehicle")
AddEventHandler("drp-vehicles:release:vehicle", function(ServerID, plate)
    local SrcID = tonumber(ServerID)
    exports.ghmattimysql:execute("UPDATE characters_cars SET repoed = @repoed, vehicle_state = @vehicle_state WHERE license_plate = @license_plate",{
        ['license_plate'] = plate,
        ['vehicle_state'] = "In",
        ['repoed'] = "0"
    })
    exports['drp-exports']:removeCash(SrcID, 500)
    TriggerClientEvent('DoLongHudText', SrcID, 'Your vehicle has been released!', 1)
end)

RegisterCommand('towbill', function(source, args)
    local src = source
	local user = exports["drp-base"]:getModule("Player"):GetUser(tonumber(args[1]))
	local character = user:getCurrentCharacter()
	local user2 = exports["drp-base"]:getModule("Player"):GetUser(src)
	local character2 = user2:getCurrentCharacter()
	exports.ghmattimysql:execute('SELECT * FROM jobs_whitelist WHERE cid = ?', {character2.id}, function(result)
		if result[1].job == 'towunion' then
			user:removeBank(tonumber(args[2]))
			TriggerClientEvent('DoLongHudText', tonumber(args[1]), 'You have $'.. tonumber(user:getBalance()) .. ' in the bank!')
			TriggerClientEvent('chatMessage', src, 'BILL', 4, 'You have billed them $'.. tonumber(args[2]))
			TriggerClientEvent("drp-vehicles:towBill", src, tonumber(args[2]))
		else
		end
	end)
end)