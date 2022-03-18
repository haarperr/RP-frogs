-- POLICE HIRE/FIRE --

RegisterServerEvent("drp-duty:HireLaw")
AddEventHandler("drp-duty:HireLaw", function(cid, job, rank)
    local src = source
    if job == 'state' or job == 'police' or job == 'sheriff' then
        exports.ghmattimysql:execute("INSERT INTO jobs_whitelist (cid, job, rank) VALUES (@cid, @job, @rank)", {['@cid'] = cid, ['@job'] = job, ['@rank'] = rank})
        exports.ghmattimysql:execute('SELECT * FROM characters WHERE id = @cid', {['@cid'] = cid}, function(result)
            if result[1] ~= nil then
                TriggerClientEvent('DoLongHudText', src, 'You hired '.. result[1].first_name ..' '.. result[1].last_name, 1)
            end
        end)
    else
        TriggerClientEvent('DoLongHudText', src, 'Please select one of these jobs! (police, state, sheriff)', 2)
    end
end)

RegisterServerEvent("drp-duty:FireLaw")
AddEventHandler("drp-duty:FireLaw", function(cid)
    local src = source
    exports.ghmattimysql:execute('SELECT * FROM characters WHERE id = @cid', {['@cid'] = cid}, function(result)
        exports.ghmattimysql:execute('SELECT * FROM jobs_whitelist WHERE cid = @cid', {['@cid'] = cid}, function(result2)
            if result[1] ~= nil and result2[1] ~= nil then
                if result2[1].job == 'state' or result2[1].job == 'police' or result2[1].job == 'sheriff' then
                    exports.ghmattimysql:execute("DELETE FROM jobs_whitelist WHERE `cid` = @cid AND `job` = @job", {['@cid'] = cid, ['@job'] = result2[1].job})
                    TriggerClientEvent('DoLongHudText', src, 'You fired '.. result[1].first_name ..' '.. result[1].last_name, 2)
                else
                    TriggerClientEvent('DoLongHudText', src, 'The person you are trying firing does not work for you!', 2)
                end
            end
        end) 
    end)
end)

RegisterCommand('hirepd', function(source, args)
	local src = source
	local user = exports["drp-base"]:getModule("Player"):GetUser(src)
	local cid = user:getCurrentCharacter().id
	exports.ghmattimysql:execute('SELECT * FROM jobs_whitelist WHERE cid = ?', {cid}, function(result)
		if result[1].job == 'police' or result[1].job == 'state' or result[1].job == 'sheriff' and result[1].rank >= 3 then
			TriggerClientEvent('drp-duty:HireLaw:Menu', src)
		end
	end)
end)

RegisterCommand('firepd', function(source, args)
	local src = source
	local user = exports["drp-base"]:getModule("Player"):GetUser(src)
	local cid = user:getCurrentCharacter().id
	exports.ghmattimysql:execute('SELECT * FROM jobs_whitelist WHERE cid = ?', {cid}, function(result)
		if result[1].job == 'police' or result[1].job == 'state' or result[1].job == 'sheriff' and result[1].rank >= 3 then
            TriggerClientEvent('drp-duty:FireLaw:Menu', src)
		end
	end)
end)

-- END POLICE HIRE/FIRE --

-- EMS HIRE/FIRE --

RegisterServerEvent("drp-duty:HireEMS")
AddEventHandler("drp-duty:HireEMS", function(cid, rank)
    local src = source
    exports.ghmattimysql:execute("INSERT INTO jobs_whitelist (cid, job, rank) VALUES (@cid, @job, @rank)", {['@cid'] = cid, ['@job'] = 'ems', ['@rank'] = rank})
    exports.ghmattimysql:execute('SELECT * FROM characters WHERE id = @cid', {['@cid'] = cid}, function(result)
        if result[1] ~= nil then
            TriggerClientEvent('DoLongHudText', src, 'You hired '.. result[1].first_name ..' '.. result[1].last_name, 1)
        end
    end)
end)

RegisterServerEvent("drp-duty:FireEMS")
AddEventHandler("drp-duty:FireEMS", function(cid)
    local src = source
    exports.ghmattimysql:execute('SELECT * FROM characters WHERE id = @cid', {['@cid'] = cid}, function(result)
        exports.ghmattimysql:execute('SELECT * FROM jobs_whitelist WHERE cid = @cid', {['@cid'] = cid}, function(result2)
            if result[1] ~= nil and result2[1] ~= nil then
                if result2[1].job == 'ems' then
                    exports.ghmattimysql:execute("DELETE FROM jobs_whitelist WHERE `cid` = @cid AND `job` = @job", {['@cid'] = cid, ['@job'] = result2[1].job})
                    TriggerClientEvent('DoLongHudText', src, 'You fired '.. result[1].first_name ..' '.. result[1].last_name, 2)
                else
                    TriggerClientEvent('DoLongHudText', src, 'The person you are trying firing does not work for you!', 2)
                end
            end
        end) 
    end)
end)

RegisterCommand('hireems', function(source, args)
	local src = source
	local user = exports["drp-base"]:getModule("Player"):GetUser(src)
	local cid = user:getCurrentCharacter().id
	exports.ghmattimysql:execute('SELECT * FROM jobs_whitelist WHERE cid = ?', {cid}, function(result)
		if result[1].job == 'ems' and result[1].rank >= 3 then
			TriggerClientEvent('drp-duty:HireEMS:Menu', src)
		end
	end)
end)

RegisterCommand('fireems', function(source, args)
	local src = source
	local user = exports["drp-base"]:getModule("Player"):GetUser(src)
	local cid = user:getCurrentCharacter().id
	exports.ghmattimysql:execute('SELECT * FROM jobs_whitelist WHERE cid = ?', {cid}, function(result)
		if result[1].job == 'ems' and result[1].rank >= 3 then
            TriggerClientEvent('drp-duty:FireEMS:Menu', src)
		end
	end)
end)

-- END EMS HIRE/FIRE --