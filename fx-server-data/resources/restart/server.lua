
local text1 = "Tsunami Warning: 15 Minutes"
local text2 = "Tsunami Warning: 10 Minutes"
local text3 = "Tsunami Warning: 5 Minutes"
local test4 = "test pour avertir"

RegisterServerEvent("restart:checkreboot")

AddEventHandler('restart:checkreboot', function()
	date_local1 = os.date('%H:%M:%S', os.time())
	local date_local = date_local1
	if date_local == '11:45:00' then
		TriggerClientEvent('chatMessage', -1, "Server Tsunami", {0, 0, 0}, text1)
	elseif date_local == '11:50:00' then
		TriggerClientEvent('chatMessage', -1, "Server Tsunami", {0, 0, 0}, text2)
	elseif date_local == '11:55:00' then
		TriggerClientEvent('chatMessage', -1, "Server Tsunami", {0, 0, 0}, test3)
	elseif date_local == '23:45:00' then 
		TriggerClientEvent('chatMessage', -1, "Server Tsunami", {0, 0, 0}, text1)
	elseif date_local == '23:50:00' then
		TriggerClientEvent('chatMessage', -1, "Server Tsunami", {0, 0, 0}, text2)
	elseif date_local == '23:55:00' then
		TriggerClientEvent('chatMessage', -1, "Server Tsunami", {0, 0, 0}, text3)
	end
end)

function restart_server()
	SetTimeout(1000, function()
		TriggerEvent('restart:checkreboot')
		restart_server()
	end)
end
restart_server()
