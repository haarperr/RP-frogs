RegisterServerEvent('drp-badge:server:useitem')
AddEventHandler('drp-badge:server:useitem', function(FUCKFEST)
    local pSrc = source
    local user = exports["drp-base"]:getModule("Player"):GetUser(pSrc)
    local char = user:getCurrentCharacter()
	local pData = tonumber(char.id)
	if pData ~= nil then
		exports.ghmattimysql:execute("SELECT `first_name`, `last_name` FROM characters WHERE id = @id", {['id'] = pData}, function(pName)
			
			local name = pName[1].first_name .. " " ..pName[1].last_name
			exports.ghmattimysql:execute("SELECT `mugshot_url` FROM user_mdt WHERE char_id = @char_id", {['char_id'] = pData}, function(result)
				local img = '0'
				if result[1] ~= nil then
					img = result[1].mugshot_url
				end
				exports.ghmattimysql:execute("SELECT `callsign` FROM jobs_whitelist WHERE cid = @cid", {['cid'] = pData}, function(grade)
					local badgenumber = grade[1].callsign
					exports.ghmattimysql:execute("SELECT `department` FROM jobs_whitelist WHERE cid = @cid", {['cid'] = pData}, function(department)
						local department = department[1].department    

				TriggerClientEvent('drp-badge:client:showbadge', -1, pSrc, img, badgenumber, name, department)
					end)
				end)
			end)
		end)
	end
end)

RegisterServerEvent("drp-pdbadge:buy")
AddEventHandler("drp-pdbadge:buy", function()
	local src = source
    local user = exports["drp-base"]:getModule("Player"):GetUser(src)
    local char = user:getCurrentCharacter()
	information = {
		["cid"] = char.id,
	}

	TriggerClientEvent("player:receiveItem", src, "pdbadge", 1, true, information)
end)