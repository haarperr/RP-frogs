--[[

	Variables

]]

local musicPlaying = false

--[[

	Events

]]

AddEventHandler("drp-inventory:itemUsed", function(item, info)
	if item == "musictape" then
		local info = json.decode(info)
		local url = string.gsub(info.url, "NULL", "?")

		if musicPlaying == false or musicPlaying ~= url then
			if not exports["drp-inventory"]:hasEnoughOfItem("musicwalkman", 1, false, true) then
				TriggerEvent("DoLongHudText", "You need a walkman to listen to music!", 2)
				return
			end

			musicPlaying = url

			SetNuiFocus(true, true)
			SendNUIMessage({ show = true, link = url })
		elseif musicPlaying == url then
			SetNuiFocus(true, true)
		end
	elseif item == "musicwalkman" then
		if musicPlaying ~= false then
			musicPlaying = false
			SetNuiFocus(false, false)
			SendNUIMessage({ show = false })
		end
	end
end)

AddEventHandler("drp-inventory:itemCheck", function(itemId, hasItem)
    if not itemId == "musicwalkman" then return end

    if not hasItem and musicPlaying ~= false then
        musicPlaying = false
		SetNuiFocus(false, false)
		SendNUIMessage({ show = false })
    end
end)

AddEventHandler("drp-music:addMusicEntry", function(pParams)
	--if exports["drp-groups"]:GroupRank(pParams.group) < 1 then
	  --	TriggerEvent("DoLongHudText", "Você não pode fazer isso.", 2)
	  --	return
	--end

	local input = exports["drp-applications"]:KeyboardInput({
		rows = {
		{
			id = 0, 
			icon = "music",
			label = "Soundcloud URL",
			name = "url",
		},
		{
			id = 1, 
			icon = "user",
			label = "Artist",
			name = "artist",
		},
		{
			id = 2, 
			icon = "user-edit",
			label = "Title",
			name = "title",
		},
	}
	})

	if input[1].input["url"] and input[2].input["artist"] and input[3].input["title"] then
		RPC.execute("drp-music:addMusicEntry", input, pParams.group)
	end
end)

RegisterCommand("createtape", function()
	TriggerEvent("drp-music:addMusicEntry")
  end)

AddEventHandler("drp-music:createMusicTapes", function(pParams)
	--if exports["drp-groups"]:GroupRank(pParams.group) < 1 then
	--	return
  --	end

	local songOptionsRaw = RPC.execute("drp-music:getSongOptions", pParams.group)

	local songOptions = {}
	for i, v in ipairs(songOptionsRaw) do
	  	if not songOptions[v.artist] then
			songOptions[v.artist] = {}
		end

		table.insert(songOptions[v.artist], v)
	end

	local context = {}
	for k, v in pairs(songOptions) do
		local _children = {}
		for i2, v2 in ipairs(v) do
			table.insert(_children, {
				title = v2.title,
				action = "drp-music:createMusicTape",
				params = v2,
			})
		end

		table.insert(context, {
			title = k,
			children = _children,
		})
	end

	exports["drp-context"]:showContext(context)
end)

AddEventHandler("drp-music:createMusicTape", function(pParameters)
	local data = {
		["Artista"] = pParameters.artist,
		["Musica"] = pParameters.title,
		["url"] = pParameters.url,
		["_hideKeys"] = { "url" },
	}
	TriggerEvent("player:receiveItem", "musictape", 5, true, data)
end)

--[[

	NUI

]]

RegisterNUICallback("mouseToggle", function(data)
	SetNuiFocus(false, false)
end)