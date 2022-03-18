local currentCops = 0
local currentEMS = 0

RegisterServerEvent('drp-duty:AttemptDuty')
AddEventHandler('drp-duty:AttemptDuty', function(pJobType)
	local src = source
	if src == nil or src == 0 then src = source end
	local user = exports["drp-base"]:getModule("Player"):GetUser(src)
	local character = user:getCurrentCharacter()
	local jobs = exports["drp-base"]:getModule("JobManager")
	local job = pJobType
	exports.ghmattimysql:execute('SELECT callsign FROM jobs_whitelist WHERE cid = ?', {character.id}, function(result)
		jobs:SetJob(user, job, false, function()
			if result[1].callsign ~= nil then
				pCallSign = result[1].callsign
			else
				pCallSign = "000"
			end
			if pJobType == 'police' then
				TriggerClientEvent('drp-duty:PDSuccess', src)
				TriggerClientEvent("DoLongHudText", src,"10-41 and Restocked.",17)
				TriggerClientEvent("startSpeedo",src)
				currentCops = currentCops + 1
				TriggerClientEvent("job:policecount", -1, currentCops)
				TriggerEvent('drp-eblips:server:registerPlayerBlipGroup', src, job)
				TriggerEvent('drp-eblips:server:registerSourceName', src, pCallSign .." | ".. character.first_name .." ".. character.last_name)
			elseif pJobType == 'sheriff' then
				TriggerClientEvent('drp-duty:BCSOSuccess', src)
				TriggerClientEvent("DoLongHudText", src,"10-41 and Restocked.",17)
				TriggerClientEvent("startSpeedo",src)
				currentCops = currentCops + 1
				TriggerClientEvent("job:policecount", -1, currentCops)
				TriggerEvent('drp-eblips:server:registerPlayerBlipGroup', src, job)
				TriggerEvent('drp-eblips:server:registerSourceName', src, pCallSign .." | ".. character.first_name .." ".. character.last_name)
			elseif pJobType == 'state' then
				TriggerClientEvent('drp-duty:SASPSuccess', src)
				TriggerClientEvent("DoLongHudText", src,"10-41 and Restocked.",17)
				TriggerClientEvent("startSpeedo",src)
				currentCops = currentCops + 1
				TriggerClientEvent("job:policecount", -1, currentCops)
				TriggerEvent('drp-eblips:server:registerPlayerBlipGroup', src, job)
				TriggerEvent('drp-eblips:server:registerSourceName', src, pCallSign .." | ".. character.first_name .." ".. character.last_name)
			elseif pJobType == 'doc' then
				TriggerClientEvent('drp-duty:DOCSuccess', src)
				TriggerClientEvent("DoLongHudText", src,"10-41 and Restocked.",17)
				TriggerClientEvent("startSpeedo",src)
				currentCops = currentCops + 1
				TriggerClientEvent("job:policecount", -1, currentCops)
				TriggerEvent('drp-eblips:server:registerPlayerBlipGroup', src, job)
				TriggerEvent('drp-eblips:server:registerSourceName', src, pCallSign .." | ".. character.first_name .." ".. character.last_name)
			end
		end)
	end)
end)


RegisterServerEvent('drp-duty:AttemptDutyEMS')
AddEventHandler('drp-duty:AttemptDutyEMS', function(src, pJobType)
	if src == nil or src == 0 then src = source end
	local user = exports["drp-base"]:getModule("Player"):GetUser(src)
	local character = user:getCurrentCharacter()
	local jobs = exports["drp-base"]:getModule("JobManager")
	local job = pJobType and pJobType or 'ems'
	exports.ghmattimysql:execute('SELECT callsign FROM jobs_whitelist WHERE cid = ?', {character.id}, function(result)
		jobs:SetJob(user, job, false, function()
			TriggerClientEvent('drp-duty:EMSSuccess', src)
			TriggerClientEvent("DoLongHudText", src,"On-Duty.",17)
			currentEMS = currentEMS + 1
			TriggerClientEvent("job:emscount", -1, currentEMS)
			TriggerEvent('drp-eblips:server:registerPlayerBlipGroup', src, 'ems')
			TriggerEvent('drp-eblips:server:registerSourceName', src, result[1].callsign .." | ".. character.first_name .." ".. character.last_name)
		end)
	end)
end)

RegisterServerEvent('drp-duty:OffDutyComplete')
AddEventHandler('drp-duty:OffDutyComplete', function(pJobType)
	print(pJobType)
	if currentCops ~= 0 then
		currentCops = currentCops - 1
	else
		currentCops = 0
	end
	TriggerClientEvent("job:policecount", -1, currentCops)
	TriggerEvent('drp-eblips:server:removePlayerBlipGroup', source, pJobType)
end)

RegisterServerEvent('drp-duty:OffDutyCompleteEMS')
AddEventHandler('drp-duty:OffDutyCompleteEMS', function()
	if currentEMS ~= 0 then
		currentEMS = currentEMS - 1
	else
		currentEMS = 0
	end
	TriggerClientEvent("job:emscount", -1, currentEMS)
	TriggerEvent('drp-eblips:server:removePlayerBlipGroup', source, 'ems')
end)

RegisterServerEvent('drp-duty:AttemptDutyJudge')
AddEventHandler('drp-duty:AttemptDutyJudge', function(src, pJobType)
	if src == nil or src == 0 then src = source end
	local user = exports["drp-base"]:getModule("Player"):GetUser(src)
	local character = user:getCurrentCharacter()
	local jobs = exports["drp-base"]:getModule("JobManager")
	exports.ghmattimysql:execute('SELECT job FROM jobs_whitelist WHERE cid = ? AND job = ?', {character.id, 'judge'}, function(result)
		if result[1] ~= nil then
			jobs:SetJob(user, 'judge', false, function()
				TriggerClientEvent("DoLongHudText", src,"Clock On!", 1)
				TriggerClientEvent('drp-duty:JudgeSuccess', src)
			end)
		else
			TriggerClientEvent("DoLongHudText", src,"You are not whitelisted for this job!", 2)
		end
	end)
end)

RegisterServerEvent('drp-duty:AttemptDutyDA')
AddEventHandler('drp-duty:AttemptDutyDA', function(src, pJobType)
	if src == nil or src == 0 then src = source end
	local user = exports["drp-base"]:getModule("Player"):GetUser(src)
	local character = user:getCurrentCharacter()
	local jobs = exports["drp-base"]:getModule("JobManager")
	exports.ghmattimysql:execute('SELECT job FROM jobs_whitelist WHERE cid = ? AND job = ?', {character.id, 'da'}, function(result)
		if result[1] ~= nil then
			jobs:SetJob(user, 'da', false, function()
				TriggerClientEvent("DoLongHudText", src,"Clock On!", 1)
				TriggerClientEvent('drp-duty:DASuccess', src)
			end)
		else
			TriggerClientEvent("DoLongHudText", src,"You are not whitelisted for this job!", 2)
		end
	end)
end)

RegisterServerEvent('drp-duty:AttemptDutyPublic')
AddEventHandler('drp-duty:AttemptDutyPublic', function(src, pJobType)
	if src == nil or src == 0 then src = source end
	local user = exports["drp-base"]:getModule("Player"):GetUser(src)
	local character = user:getCurrentCharacter()
	local jobs = exports["drp-base"]:getModule("JobManager")
	exports.ghmattimysql:execute('SELECT job FROM jobs_whitelist WHERE cid = ? AND job = ?', {character.id, 'defender'}, function(result)
		if result[1] ~= nil then
			jobs:SetJob(user, 'defender', false, function()
				TriggerClientEvent("DoLongHudText", src,"Clock On!", 1)
				TriggerClientEvent('drp-duty:PublicSuccess', src)
			end)
		else
			TriggerClientEvent("DoLongHudText", src,"You are not whitelisted for this job!", 2)
		end
	end)
end)

RegisterServerEvent('drp-duty:AttemptDutyADA')
AddEventHandler('drp-duty:AttemptDutyADA', function(src, pJobType)
	if src == nil or src == 0 then src = source end
	local user = exports["drp-base"]:getModule("Player"):GetUser(src)
	local character = user:getCurrentCharacter()
	local jobs = exports["drp-base"]:getModule("JobManager")
	exports.ghmattimysql:execute('SELECT job FROM jobs_whitelist WHERE cid = ? AND job = ?', {character.id, 'ada'}, function(result)
		if result[1] ~= nil then
			jobs:SetJob(user, 'ada', false, function()
				TriggerClientEvent("DoLongHudText", src,"Clock On!", 1)
				TriggerClientEvent('drp-duty:ADASuccess', src)
			end)
		else
			TriggerClientEvent("DoLongHudText", src,"You are not whitelisted for this job!", 2)
		end
	end)
end)

RegisterServerEvent('drp-duty:AttemptDutyPDM')
AddEventHandler('drp-duty:AttemptDutyPDM', function(src, pJobType)
	if src == nil or src == 0 then src = source end
	local user = exports["drp-base"]:getModule("Player"):GetUser(src)
	local character = user:getCurrentCharacter()
	local jobs = exports["drp-base"]:getModule("JobManager")
	exports.ghmattimysql:execute('SELECT job FROM jobs_whitelist WHERE cid = ? AND job = ?', {character.id, 'pdm'}, function(result)
		if result[1] ~= nil then
			jobs:SetJob(user, 'pdm', false, function()
				TriggerClientEvent("DoLongHudText", src,"Clock On!", 1)
				TriggerClientEvent('drp-duty:PDMSuccess', src)
			end)
		else
			TriggerClientEvent("DoLongHudText", src,"You are not whitelisted for this job!", 2)
		end
	end)
end)

RegisterServerEvent('drp-duty:AttemptDutySanders')
AddEventHandler('drp-duty:AttemptDutySanders', function(src, pJobType)
	if src == nil or src == 0 then src = source end
	local user = exports["drp-base"]:getModule("Player"):GetUser(src)
	local character = user:getCurrentCharacter()
	local jobs = exports["drp-base"]:getModule("JobManager")
	exports.ghmattimysql:execute('SELECT job FROM jobs_whitelist WHERE cid = ? AND job = ?', {character.id, 'sanders'}, function(result)
		if result[1] ~= nil then
			jobs:SetJob(user, 'sanders', false, function()
				TriggerClientEvent("DoLongHudText", src,"Clock On!", 1)
				TriggerClientEvent('drp-duty:SandersSuccess', src)
			end)
		else
			TriggerClientEvent("DoLongHudText", src,"You are not whitelisted for this job!", 2)
		end
	end)
end)

RegisterServerEvent('drp-duty:AttemptDutyTow')
AddEventHandler('drp-duty:AttemptDutyTow', function(src, pJobType)
	if src == nil or src == 0 then src = source end
	local user = exports["drp-base"]:getModule("Player"):GetUser(src)
	local character = user:getCurrentCharacter()
	local jobs = exports["drp-base"]:getModule("JobManager")
	exports.ghmattimysql:execute('SELECT job FROM jobs_whitelist WHERE cid = ? AND job = ?', {character.id, 'towunion'}, function(result)
		if result[1] ~= nil then
			jobs:SetJob(user, 'towunion', false, function()
				TriggerClientEvent("DoLongHudText", src,"Clock On!", 1)
				TriggerClientEvent('drp-duty:TowSuccess', src)
			end)
		else
			TriggerClientEvent("DoLongHudText", src,"You are not whitelisted for this job!", 2)
		end
	end)
end)

AddEventHandler('playerDropped', function()
	local src = source
	if src ~= nil then
		local steamIdentifier = GetPlayerIdentifiers(src)[1]
		exports.ghmattimysql:execute('SELECT * FROM characters WHERE owner = ?', {steamIdentifier}, function(result)
			if result[1].job == 'police' or result[1].job == 'sheriff' or result[1].job == 'state' then
				if currentCops ~= 0 then
					currentCops = currentCops - 1
				else
					currentCops = 0
				end
                print('Active PD:', currentCops)
                exports.ghmattimysql:execute("UPDATE characters SET `job` = @job WHERE `owner` = @owner", {['@owner'] = steamIdentifier, ['@job'] = 'unemployed'})
				TriggerClientEvent("job:policecount", -1, currentCops)
				TriggerEvent('drp-eblips:server:removePlayerBlipGroup', src, 'police')
				TriggerClientEvent('drp-duty:OffDuty' ,src)
            elseif result[1].job == 'ems' then
                if currentEMS ~= 0 then
					currentEMS = currentEMS - 1
				else
					currentEMS = 0
				end
                print('Active EMS:', currentEMS)
				TriggerClientEvent('drp-duty:OffDutyEMS' ,src)
                exports.ghmattimysql:execute("UPDATE characters SET `job` = @job WHERE `owner` = @owner", {['@owner'] = steamIdentifier, ['@job'] = 'unemployed'})
				TriggerClientEvent("job:emscount", -1, currentEMS)
				TriggerEvent('drp-eblips:server:removePlayerBlipGroup', src, 'ems')
			end
		end)
	end
end)


function SignOnRadio(src)

	local user = exports["drp-base"]:getModule("Player"):GetUser(src)
	local char = user:getCurrentCharacter()

	local q = [[SELECT id, cid, job, callsign, rank FROM jobs_whitelist WHERE cid = @cid AND (job = 'police' or job = 'doc')]]
	local v = {["cid"] = char.id}

	exports.ghmattimysql:execute(q, v, function(results)
		if not results then return end
		local callsign = ""
		if results[1].callsign ~= nil and results[1].callsign == "" then callsign = results[1].callsign else callsign = "TBD" end
		if (src ~= nil and char.first_name ~= nil and char.last_name ~= nil) then
			TriggerClientEvent("DoLongHudText", "Sessioned!?", 2)
		else
			TriggerClientEvent("SignOnRadio", src)
		end
	end)
end

RegisterServerEvent('drp-duty:AttemptDutySuits')
AddEventHandler('drp-duty:AttemptDutySuits', function(src, pJobType)
	if src == nil or src == 0 then src = source end
	local user = exports["drp-base"]:getModule("Player"):GetUser(src)
	local character = user:getCurrentCharacter()
	local jobs = exports["drp-base"]:getModule("JobManager")
	local job = pJobType and pJobType or 'suits'
	exports.ghmattimysql:execute('SELECT job FROM jobs_whitelist WHERE cid = ?', {character.id}, function(result)
		if result[1].job == "suits" then
			exports.ghmattimysql:execute('SELECT callsign FROM jobs_whitelist WHERE cid = ?', {character.id}, function(result2)
				jobs:SetJob(user, job, false, function()
					TriggerClientEvent('drp-duty:SuitsSuccess', src)
					TriggerClientEvent("DoLongHudText", src,"On-Duty.",17)
					TriggerClientEvent("job:suitscount", -1, currentSuits)
				end)
			end)
		else
			TriggerClientEvent("DoLongHudText", src,'You are not qualified for this', 2)
		end
	end)
end)

--// In N Out

RegisterServerEvent('drp-duty:attempt-in-n-out:duty')
AddEventHandler('drp-duty:attempt-in-n-out:duty', function(src, pJobType)
	if src == nil or src == 0 then src = source end
	local user = exports["drp-base"]:getModule("Player"):GetUser(src)
	local character = user:getCurrentCharacter()
	local jobs = exports["drp-base"]:getModule("JobManager")
	exports.ghmattimysql:execute('SELECT job FROM jobs_whitelist WHERE cid = ? AND job = ?', {character.id, 'in-n-out'}, function(result)
		if result[1] ~= nil then
			jobs:SetJob(user, 'in-n-out', false, function()
				TriggerClientEvent("DoLongHudText", src,"Clocked In As In N Out", 1)
				TriggerClientEvent('drp-duty:in-n-out:successful', src)
			end)
		else
			TriggerClientEvent("DoLongHudText", src, "You are not whitelisted for this job!", 2)
		end
	end)
end)

--// DOJ

-- Judge

RegisterServerEvent('drp-duty:attempt_duty:judge')
AddEventHandler('drp-duty:attempt_duty:judge', function(src, pJobType)
	if src == nil or src == 0 then src = source end
	local user = exports["drp-base"]:getModule("Player"):GetUser(src)
	local character = user:getCurrentCharacter()
	local jobs = exports["drp-base"]:getModule("JobManager")
	exports.ghmattimysql:execute('SELECT job FROM jobs_whitelist WHERE cid = ? AND job = ?', {character.id, 'judge'}, function(result)
		if result[1] ~= nil then
			jobs:SetJob(user, 'judge', false, function()
				TriggerClientEvent("DoLongHudText", src,"Successfully Clocked In As Judge", 1)
				TriggerClientEvent('drp-duty:clocked_in:judge_successful', src)
			end)
		else
			TriggerClientEvent("DoLongHudText", src, "You are not whitelisted for this job!", 2)
		end
	end)
end)

-- Public Defender

RegisterServerEvent('drp-duty:attempt_duty:public_defender')
AddEventHandler('drp-duty:attempt_duty:public_defender', function(src, pJobType)
	if src == nil or src == 0 then src = source end
	local user = exports["drp-base"]:getModule("Player"):GetUser(src)
	local character = user:getCurrentCharacter()
	local jobs = exports["drp-base"]:getModule("JobManager")
	exports.ghmattimysql:execute('SELECT job FROM jobs_whitelist WHERE cid = ? AND job = ?', {character.id, 'public_defender'}, function(result)
		if result[1] ~= nil then
			jobs:SetJob(user, 'public_defender', false, function()
				TriggerClientEvent("DoLongHudText", src,"Successfully Clocked In As Public Defender", 1)
				TriggerClientEvent('drp-duty:clocked_in:public_defender_successful', src)
			end)
		else
			TriggerClientEvent("DoLongHudText", src, "You are not whitelisted for this job!", 2)
		end
	end)
end)

-- District Attorney

RegisterServerEvent('drp-duty:attempt_duty:district_attorney')
AddEventHandler('drp-duty:attempt_duty:district_attorney', function(src, pJobType)
	if src == nil or src == 0 then src = source end
	local user = exports["drp-base"]:getModule("Player"):GetUser(src)
	local character = user:getCurrentCharacter()
	local jobs = exports["drp-base"]:getModule("JobManager")
	exports.ghmattimysql:execute('SELECT job FROM jobs_whitelist WHERE cid = ? AND job = ?', {character.id, 'district_attorney'}, function(result)
		if result[1] ~= nil then
			jobs:SetJob(user, 'district_attorney', false, function()
				TriggerClientEvent("DoLongHudText", src,"Successfully Clocked In As District Attorney", 1)
				TriggerClientEvent('drp-duty:clocked_in:district_attorney_successful', src)
			end)
		else
			TriggerClientEvent("DoLongHudText", src, "You are not whitelisted for this job!", 2)
		end
	end)
end)