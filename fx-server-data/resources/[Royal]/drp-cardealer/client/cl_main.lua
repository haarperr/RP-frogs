local previewVehicle, inShop = nil, false
  
local vehicles = {
	--[[ Compacts ]]--
	{name = "Asbo", sCode = "asbo", price = 29250, category = 'Compacts'},
	{name = "Blista", sCode = "blista", price = 46800, category = 'Compacts'},
	{name = "Brioso R/A", sCode = "brioso", price = 114150, category = 'Compacts'},
	{name = "Dilettante", sCode = "dilettante", price = 26400, category = 'Compacts'},
	{name = "Issi", sCode = "issi2", price = 53000, category = 'Compacts'},
	{name = "Panto", sCode = "panto", price = 53000, category = 'Compacts'},
	{name = "Prairie", sCode = "prairie", price = 50250, category = 'Compacts'},
	{name = "Rhapsody", sCode = "rhapsody", price = 34300, category = 'Compacts'},
	{name = "Blista Compact", sCode = "blista2", price = 39200, category = 'Compacts'},
	{name = "Club", sCode = "club", price = 34750, category = 'Compacts'},
	{name = "Issi Classic", sCode = "issi3", price = 39500, category = 'Compacts'},

	--[[ Coupes ]]--
	{name = "Taco Truck", sCode = "taco", price = 10000, category = 'Coupes'},
	{name = "Cognoscenti Cabrio", sCode = "cogcabrio", price = 96150, category = 'Coupes'},
	{name = "Exemplar", sCode = "exemplar", price = 52250, category = 'Coupes'},
	{name = "F620", sCode = "f620", price = 107450, category = 'Coupes'},
	{name = "Felon", sCode = "felon", price = 53550, category = 'Coupes'},
	{name = "Felon GT", sCode = "felon2", price = 112600, category = 'Coupes'},
	{name = "Jackal", sCode = "jackal", price = 43950, category = 'Coupes'},
	{name = "Oracle", sCode = "oracle2", price = 42800, category = 'Coupes'},
	{name = "Oracle XS", sCode = "oracle", price = 49250, category = 'Coupes'},
	{name = "Sentinel", sCode = "sentinel2", price = 48950, category = 'Coupes'},
	{name = "Sentinel XS", sCode = "sentinel", price = 52250, category = 'Coupes'},
	{name = "Windsor", sCode = "windsor", price = 116450, category = 'Coupes'},
	{name = "Windsor Drop", sCode = "windsor2", price = 117900, category = 'Coupes'},
	{name = "Zion", sCode = "zion", price = 116450, category = 'Coupes'},
	{name = "Zion Cabrio", sCode = "zion2", price = 114900, category = 'Coupes'},
	{name = "Futo", sCode = "futo", price = 42200, category = 'Coupes'},

    	--[[ Sedans ]]--
	{name = "Emperor", sCode = "emperor", price = 25250, category = 'Sedans'},
	{name = "Stafford", sCode = "stafford", price = 116900, category = 'Sedans'},
	{name = "Tornado", sCode = "tornado", price = 25200, category = 'Sedans'},
	{name = "Bodhi", sCode = "bodhi2", price = 25400, category = 'Sedans'},
	{name = "Asea", sCode = "asea", price = 24400, category = 'Sedans'},
	{name = "Asterope", sCode = "asterope", price = 29000, category = 'Sedans'},
	{name = "Fugitive", sCode = "fugitive", price = 43800, category = 'Sedans'},
	{name = "Glendale", sCode = "glendale", price = 28000, category = 'Sedans'},
	{name = "Intruder", sCode = "intruder", price = 47250, category = 'Sedans'},
	{name = "Premier", sCode = "premier", price = 42800, category = 'Sedans'},
	{name = "Regina", sCode = "regina", price = 25250, category = 'Sedans'},
	{name = "Schafter", sCode = "schafter2", price = 46200, category = 'Sedans'},
	{name = "Stanier", sCode = "stanier", price = 32300, category = 'Sedans'},
	{name = "Stratum", sCode = "stratum", price = 43950, category = 'Sedans'},
	{name = "Super Diamond", sCode = "superd", price = 58150, category = 'Sedans'},
	{name = "Warrener", sCode = "warrener", price = 34750, category = 'Sedans'},
	{name = "Washington", sCode = "washington", price = 36450, category = 'Sedans'},
	{name = "Tailgater", sCode = "tailgater", price = 52700, category = 'Sedans'},
	{name = "Cognoscenti", sCode = "cognoscenti", price = 49250, category = 'Sedans'},
	{name = "Surge", sCode = "surge", price = 71250, category = 'Sedans'},
	{name = "Ingot", sCode = "ingot", price = 29000, category = 'Sedans'},

    	--[[ Sports ]]--
	{name = "9F", sCode = "ninef", price = 150000, category = 'Sports'},
	{name = "9F Cabrio", sCode = "ninef2", price = 165300, category = 'Sports'},
	{name = "Alpha", sCode = "alpha", price = 104000, category = 'Sports'},
	{name = "Banshee", sCode = "banshee", price = 92650, category = 'Sports'},
	{name = "Bestia GTS", sCode = "bestiagts", price = 98250, category = 'Sports'},
	{name = "Buffalo", sCode = "buffalo", price = 53350, category = 'Sports'},
	{name = "Buffalo S", sCode = "buffalo2", price = 56800, category = 'Sports'},
	{name = "Carbonizzare", sCode = "carbonizzare", price = 99000, category = 'Sports'},
	{name = "Comet", sCode = "comet2", price = 121000, category = 'Sports'},
	{name = "Comet SR", sCode = "comet5", price = 142800, category = 'Sports'},
	{name = "Coquette", sCode = "coquette", price = 98800, category = 'Sports'},
	{name = "Feltzer", sCode = "feltzer2", price = 111300, category = 'Sports'},
	{name = "Furore GT", sCode = "furoregt", price = 108150, category = 'Sports'},
	{name = "Fusilade", sCode = "fusilade", price = 57250, category = 'Sports'},
	{name = "Kuruma", sCode = "kuruma", price = 53400, category = 'Sports'},
	{name = "Lynx", sCode = "lynx", price = 106300, category = 'Sports'},
	{name = "Massacro", sCode = "massacro", price = 107750, category = 'Sports'},
	{name = "Omnis", sCode = "omnis", price = 63200, category = 'Sports'},
	{name = "Penumbra", sCode = "penumbra", price = 108150, category = 'Sports'},
	{name = "Rapid GT", sCode = "rapidgt", price = 107000, category = 'Sports'},
	{name = "Rapid GT Convertible", sCode = "rapidgt2", price = 109450, category = 'Sports'},
	{name = "Schafter V12", sCode = "schafter3", price = 62000, category = 'Sports'},
	{name = "Sultan", sCode = "sultan", price = 56700, category = 'Sports'},
	{name = "Surano", sCode = "surano", price = 102300, category = 'Sports'},
	{name = "Sentinel Classic", sCode = "sentinel3", price = 54550, category = 'Sports'},
	{name = "Tropos", sCode = "tropos", price = 63200, category = 'Sports'},
	{name = "Verlierer", sCode = "verlierer2", price = 92250, category = 'Sports'},
	{name = "Streiter", sCode = "streiter", price = 42650, category = 'Sports'},
	{name = "Comet Safari", sCode = "comet4", price = 68300, category = 'Sports'},
	{name = "Pariah", sCode = "pariah", price = 99150, category = 'Sports'},

	--[[ Classic ]]--
	{name = "Cheburek", sCode = "cheburek", price = 57000, category = 'Classic'},
	{name = "Casco", sCode = "casco", price = 65750, category = 'Classic'},
	{name = "Zion Classic", sCode = "zion3", price = 45950, category = 'Classic'},
	{name = "Retinue", sCode = "retinue", price = 62200, category = 'Classic'},
	{name = "Dynasty", sCode = "dynasty", price = 28000, category = 'Classic'},
	{name = "Coquette Classic", sCode = "coquette2", price = 59750, category = 'Classic'},
	{name = "JB 700", sCode = "jb700", price = 69250, category = 'Classic'},
	{name = "Pigalle", sCode = "pigalle", price = 29000, category = 'Classic'},
	{name = "Stinger", sCode = "stinger", price = 60600, category = 'Classic'},
	{name = "Stinger GT", sCode = "stingergt", price = 62200, category = 'Classic'},
	{name = "Stirling GT", sCode = "feltzer3", price = 59600, category = 'Classic'},
	{name = "Rapid GT Classic", sCode = "rapidgt3", price = 58750, category = 'Classic'},
	{name = "Retinue MKII", sCode = "retinue2", price = 68650, category = 'Classic'},
	{name = "190z", sCode = "z190", price = 102450, category = 'Classic'},
	{name = "GT500", sCode = "gt500", price = 57600, category = 'Classic'},
	{name = "Savestra", sCode = "savestra", price = 43100, category = 'Classic'},
	{name = "Mamba", sCode = "mamba", price = 84200, category = 'Classic'},
	{name = "Tesla Model S", sCode = "teslapd", price = 122450, category = 'Classic'},

    	--[[ Muscle ]]--
	{name = "Clique", sCode = "clique", price = 86750, category = 'Muscle'},
	{name = "Blade", sCode = "blade", price = 105150, category = 'Muscle'},
	{name = "Buccaneer", sCode = "buccaneer", price = 52700, category = 'Muscle'},
	{name = "Buccaneer Lowrider", sCode = "buccaneer2", price = 66650, category = 'Muscle'},
	{name = "Chino", sCode = "chino", price = 36900, category = 'Muscle'},
	{name = "Chino Lowrider", sCode = "chino2", price = 46500, category = 'Muscle'},
	{name = "Coquette BlackFin", sCode = "coquette3", price =107200, category = 'Muscle'},
	{name = "Dukes", sCode = "dukes", price = 106900, category = 'Muscle'},
	{name = "Dominator", sCode = "dominator", price = 104450, category = 'Muscle'},
	{name = "Gauntlet", sCode = "gauntlet", price = 102450, category = 'Muscle'},
	{name = "Faction", sCode = "faction", price = 53150, category = 'Muscle'},
	{name = "Faction Lowrider", sCode = "faction2", price = 64650, category = 'Muscle'},
	{name = "Faction Lowrider DONK", sCode = "faction3", price = 69250, category = 'Muscle'},
	{name = "Moonbeam Lowrider", sCode = "moonbeam2", price = 48250, category = 'Muscle'},
	{name = "Minivan Lowrider", sCode = "minivan2", price = 62500, category = 'Muscle'},
	{name = "Picador", sCode = "picador", price = 54150, category = 'Muscle'},
	{name = "Sabre Turbo", sCode = "sabregt", price = 99300, category = 'Muscle'},
	{name = "SabreGT Lowrider", sCode = "sabregt2", price = 56600, category = 'Muscle'},
	{name = "Slamvan Lowrider", sCode = "slamvan3", price = 109500, category = 'Muscle'},
	{name = "Tampa", sCode = "tampa", price = 97150, category = 'Muscle'},
	{name = "Tornado Lowrider", sCode = "tornado5", price = 34750, category = 'Muscle'},
	{name = "Virgo", sCode = "virgo", price = 54300, category = 'Muscle'},
	{name = "Vigero", sCode = "vigero", price = 52300, category = 'Muscle'},
	{name = "Ellie", sCode = "ellie", price = 108050, category = 'Muscle'},
	{name = "Phoenix", sCode = "phoenix", price = 52000, category = 'Muscle'},
	{name = "Primo Lowrider", sCode = "primo2", price = 47250, category = 'Muscle'},
	{name = "Slam Van", sCode = "slamvan", price = 104750, category = 'Muscle'},
	{name = "Yosemite", sCode = "yosemite", price = 103600, category = 'Muscle'},
	{name = "Tulip", sCode = "tulip", price = 58300, category = 'Muscle'},
	{name = "Vamos", sCode = "vamos", price = 102600, category = 'Muscle'},
	{name = "Virgo Lowrider", sCode = "virgo3", price = 69250, category = 'Muscle'},
	{name = "Voodoo Lowrider", sCode = "voodoo", price = 34750, category = 'Muscle'},
	{name = "Ruiner", sCode = "ruiner3", price = 78300, category = 'Muscle'},
	{name = "Lost Slamvan", sCode = "slamvan2", price = 76250, category = 'Muscle'},
	{name = "Hustler", sCode = "hustler", price = 52000, category = 'Muscle'},
	{name = "Dominator GTX", sCode = "dominator3", price = 100990, category = 'Muscle'},
	{name = "Hermes", sCode = "hermes", price = 88500, category = 'Muscle'},
	{name = "Peyote Gaser", sCode = "peyote2", price = 72250, category = 'Muscle'},
	{name = "Dominator R", sCode = "dominator3", price = 128750, category = 'Muscle'},
	{name = "Gauntlet R", sCode = "gauntlet2", price = 129750, category = 'Muscle'},
	{name = "Burger Shot Stalion", sCode = "stalion2", price = 73000, category = 'Muscle'},
	{name = "Stalion", sCode = "stalion", price = 69250, category = 'Muscle'},
	{name = "Lurcher", sCode = "lurcher", price = 58750, category = 'Muscle'},
	{name = "Rat Truck", sCode = "ratloader2", price = 53000, category = 'Muscle'}, -- HERE

    	--[[ OffRoad ]]--
	{name = "Lifted Mesa", sCode = "mesa3", price = 47250, category = 'OffRoad'},
	{name = "Bifta", sCode = "bifta", price = 43650, category = 'OffRoad'},
	{name = "Outlaw", sCode = "outlaw", price = 55000, category = 'OffRoad'},
	{name = "Vagrant", sCode = "vagrant", price = 56150, category = 'OffRoad'},
	{name = "Guardian", sCode = "guardian", price = 43800, category = 'OffRoad'},
	{name = "GB200", sCode = "gb200", price = 62200, category = 'OffRoad'},
	{name = "Blazer Sports", sCode = "blazer4", price = 37150, category = 'OffRoad'},
	{name = "Everon", sCode = "everon", price = 59450, category = 'OffRoad'},
	{name = "Caracara", sCode = "caracara2", price = 46650, category = 'OffRoad'},
	{name = "Blazer", sCode = "blazer", price = 14050, category = 'OffRoad'},
	{name = "Brawler", sCode = "brawler", price = 39600, category = 'OffRoad'},
	{name = "Dune Buggy", sCode = "dune", price = 32000, category = 'OffRoad'},
	{name = "Rebel", sCode = "rebel2", price = 34150, category = 'OffRoad'},
	{name = "Sandking", sCode = "sandking", price = 48250, category = 'OffRoad'},
	{name = "Kamacho", sCode = "kamacho", price = 46650, category = 'OffRoad'},
	{name = "Dubsta 6x6", sCode = "dubsta3", price = 64500, category = 'OffRoad'},
	{name = "Vapid Trophy Truck", sCode = "trophytruck", price = 56300, category = 'OffRoad'},
	{name = "Vapid Desert Raid", sCode = "trophytruck2", price = 59150, category = 'OffRoad'},
	{name = "Riata", sCode = "riata", price = 40250, category = 'OffRoad'},
	{name = "Contender", sCode = "contender", price = 74250, category = 'OffRoad'},
	{name = "Seminole", sCode = "seminole", price = 36900, category = 'OffRoad'},
	{name = "Yosemite Rancher", sCode = "yosemite3", price = 64970, category = 'OffRoad'},
	{name = "Hot Rod Blazer", sCode = "blazer3", price = 19500, category = 'OffRoad'},
	{name = "Dune Loader", sCode = "dloader", price = 26250, category = 'OffRoad'},
	{name = "Injection", sCode = "bfinjection", price = 24250, category = 'OffRoad'},
	{name = "Freecrawler", sCode = "freecrawler", price = 47250, category = 'OffRoad'},
	{name = "Rancher XL", sCode = "rancherxl", price = 38750, category = 'OffRoad'},
	{name = "Kalahari", sCode = "kalahari", price = 31000, category = 'OffRoad'},

    	--[[ SUV ]]--
	{name = "Baller 2", sCode = "baller2", price = 38750, category = 'SUV'},
	{name = "Baller LE", sCode = "baller3", price = 57150, category = 'SUV'},
	{name = "Cavalcade", sCode = "cavalcade2", price = 39500, category = 'SUV'},
	{name = "Granger", sCode = "granger", price = 36900, category = 'SUV'},
	{name = "Lampadati Novak", sCode = "novak", price = 56300, category = 'SUV'},
	{name = "Rebla", sCode = "rebla", price = 52000, category = 'SUV'},
	{name = "Huntley S", sCode = "huntley", price = 57300, category = 'SUV'},
	{name = "Landstalker", sCode = "landstalker", price = 36900, category = 'SUV'},
	{name = "Radius", sCode = "radi", price = 34300, category = 'SUV'},
	{name = "Rocoto", sCode = "rocoto", price = 52000, category = 'SUV'},
	{name = "Seminole", sCode = "seminole", price = 35150, category = 'SUV'},
	{name = "XLS", sCode = "xls", price = 53000, category = 'SUV'},
	{name = "Dubsta", sCode = "dubsta", price = 52000, category = 'SUV'},
	{name = "Patriot", sCode = "patriot", price = 34750, category = 'SUV'},
	{name = "Gresley", sCode = "gresley", price = 49250, category = 'SUV'},
	{name = "Landstalker XL", sCode = "landstalker2", price = 52000, category = 'SUV'},
	{name = "Dubsta XL", sCode = "dubsta2", price = 59750, category = 'SUV'},

    	--[[ Vans ]]--
	{name = "Bison", sCode = "bison", price = 34200, category = 'Vans'},
	{name = "Bobcat XL", sCode = "bobcatxl", price = 36750, category = 'Vans'},
	{name = "Gang Burrito", sCode = "gburrito", price = 26250, category = 'Vans'},
	{name = "Journey", sCode = "journey", price = 28250, category = 'Vans'},
	{name = "Minivan", sCode = "minivan", price = 31000, category = 'Vans'},
	{name = "Paradise", sCode = "paradise", price = 29700, category = 'Vans'},
	{name = "Surfer", sCode = "surfer", price = 24250, category = 'Vans'},
	{name = "Youga", sCode = "youga", price = 34600, category = 'Vans'},
	{name = "Moonbeam", sCode = "moonbeam", price = 29000, category = 'Vans'},
	{name = "Camper", sCode = "camper", price = 29000, category = 'Vans'},
	{name = "Rumpo Custom", sCode = "rumpo3", price = 34750, category = 'Vans'},
	{name = "Youga Classic", sCode = "youga2", price = 32150, category = 'Vans'},

    	--[[ Motorcycles ]]--
	{name = "Akuma", sCode = "akuma", price = 49250, category = 'Motorcycles'},
	{name = "Bagger", sCode = "bagger", price = 46500, category = 'Motorcycles'},
	{name = "Bati 801", sCode = "bati", price = 38750, category = 'Motorcycles'},
	{name = "BF400", sCode = "bf400", price = 31000, category = 'Motorcycles'},
	{name = "Carbon RS", sCode = "carbonrs", price = 49250, category = 'Motorcycles'},
	{name = "Enduro", sCode = "enduro", price = 29000, category = 'Motorcycles'},
	{name = "Faggio", sCode = "faggio2", price = 8550, category = 'Motorcycles'},
	{name = "Gargoyle", sCode = "gargoyle", price = 46250, category = 'Motorcycles'},
	{name = "Hexer", sCode = "hexer", price = 49250, category = 'Motorcycles'},
	{name = "Innovation", sCode = "innovation", price = 48250, category = 'Motorcycles'},
	{name = "Nemesis", sCode = "nemesis", price = 36750, category = 'Motorcycles'},
	{name = "PCJ-600", sCode = "pcj", price = 44500, category = 'Motorcycles'},
	{name = "Ruffian", sCode = "ruffian", price = 42500, category = 'Motorcycles'},
	{name = "Sanchez", sCode = "sanchez", price = 24250, category = 'Motorcycles'},
	{name = "Sovereign", sCode = "sovereign", price = 57000, category = 'Motorcycles'},
	{name = "Zombiea", sCode = "zombiea", price = 52000, category = 'Motorcycles'},
	{name = "Vespa", sCode = "faggio", price = 9550, category = 'Motorcycles'},
	{name = "Manchez", sCode = "manchez", price = 35750, category = 'Motorcycles'},
	{name = "Vortex", sCode = "vortex", price = 34750, category = 'Motorcycles'},
	{name = "Avarus", sCode = "avarus", price = 39500, category = 'Motorcycles'},
	{name = "Vader", sCode = "vader", price = 35750, category = 'Motorcycles'},
	{name = "Esskey", sCode = "esskey", price = 42500, category = 'Motorcycles'},
	{name = "Defiler", sCode = "defiler", price = 53000, category = 'Motorcycles'},
	{name = "Chimera", sCode = "chimera", price = 52000, category = 'Motorcycles'},
	{name = "Daemon", sCode = "daemon", price = 48250, category = 'Motorcycles'},
	{name = "Daemon High", sCode = "daemon2", price = 42500, category = 'Motorcycles'},
	{name = "Nightblade", sCode = "nightblade", price = 63200, category = 'Motorcycles'},
	{name = "Wolfsbane", sCode = "wolfsbane", price = 59750, category = 'Motorcycles'},
	{name = "Sanctus", sCode = "sanctus", price = 52700, category = 'Motorcycles'},
	{name = "Hackuchou", sCode = "hakuchou", price = 49020, category = 'Motorcycles'},
	{name = "FCR", sCode = "fcr", price = 34750, category = 'Motorcycles'},
	{name = "FCR Custom", sCode = "fcr2", price =42500, category = 'Motorcycles'},
	{name = "Cliffhanger", sCode = "cliffhanger", price = 29000, category = 'Motorcycles'},
	{name = "Rat Bike", sCode = "ratbike", price = 22250, category = 'Motorcycles'},

    		--[[ Bikes ]]--
	{name = "BMX", sCode = "bmx", price = 550, category = 'Bikes'},
	{name = "Cruiser", sCode = "cruiser", price = 400, category = 'Bikes'},
	{name = "Fixter", sCode = "fixter", price = 345, category = 'Bikes'},
	{name = "Scorcher", sCode = "scorcher", price = 345, category = 'Bikes'},
	{name = "Pro 1", sCode = "tribike", price = 2875, category = 'Bikes'},
	{name = "Pro 2", sCode = "tribike2", price = 2990, category = 'Bikes'},
	{name = "Pro 3", sCode = "tribike3", price = 3335, category = 'Bikes'},
}


RegisterNetEvent("drp-cardealer:openMenu")
AddEventHandler("drp-cardealer:openMenu", function()
    enableGUI(true)
end)

local firstTime = true

function enableGUI(enable)
    local toggle = "close"
    if enable then
        toggle = "open"
        RequestCollisionAtCoord(974.1, -2997.94, -39.00)
        local cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", 974.1, -2997.94, -39.00, 216.5, 0.00, 0.00, 60.00, false, 0)
        PointCamAtCoord(cam, 979.1, -3003.00, -40.50)
		SetEntityHeading(PlayerPedId(), 90)
		SetEntityCoords(PlayerPedId(), -54.24690246582, -1095.0140380859, 26.422348022461)
        SetCamActive(cam, true)
        RenderScriptCams(true, true, 1, true, true)
            
        SetFocusPosAndVel(974.1, -2997.94, -39.72, 0.0, 0.0, 0.0)
        if firstTime then
            setCategory("Sports")
            firstTime = false
        end
    else
        SetFocusEntity(PlayerPedId()) 
        RenderScriptCams(false)
        DestroyAllCams(true)
    end
    SendNUIMessage({
        open = toggle
    })
    SetNuiFocus(enable, enable)
end

RegisterNUICallback("close", function(data, cb)
    enableGUI(false)
    cb(true)
end)

RegisterNUICallback("category", function(data, cb)
    setCategory(data.type)
    cb(true)
end)

RegisterNUICallback("previewVeh", function(data, cb)
    updatePreviewVehicle(data.model)
    cb(true)
end)

RegisterNUICallback("purchaseVeh", function(data, cb)
    purchaseVeh(data.spawnName, data.price, false)
    cb(true)
end)

RegisterNUICallback("financeVeh", function(data, cb)
    purchaseVeh(data.spawnName, data.price, true)
    cb(true)
end)

function updatePreviewVehicle(model)
    local hash = GetHashKey(model)

    if not HasModelLoaded(hash) then
        RequestModel(hash)
        while not HasModelLoaded(hash) do
            Citizen.Wait(10)
        end
    end

    if previewVehicle ~= nil then
        DeleteEntity(previewVehicle)
    end

  previewVehicle = CreateVehicle(hash, 978.19, -3001.99, -40.62, 89.5, 0, 1)
end

function setCategory(type)
    local categoryVehs = {}
    for k, v in pairs(vehicles) do
        if v.category == type then
            table.insert(categoryVehs, {displayName = v.name, sCode = v.sCode, price = (v.price * 2.5)})
        end
    end
    SendNUIMessage({
        update = "vehHolder",
        vehicles = categoryVehs
    })
end

RegisterNetEvent("pdm:payment")
AddEventHandler("pdm:payment", function(CurrentPayment)
	local pdmbank = CurrentPayment / 10
    TriggerServerEvent("server:GroupPayment","pdm", pdmbank)
end)

function purchaseVeh(model, price, financed)
    local model, price = model, price
    local HasEnoughBread = remoteCalls.execute("drp-cardealer:hasEnough", price, financed)
    if HasEnoughBread then
        enableGUI(false)
        local hash = GetHashKey(model)

        if not HasModelLoaded(hash) then
            RequestModel(hash)
            while not HasModelLoaded(hash) do
                Citizen.Wait(10)
            end
        end
        local purchasedVeh = CreateVehicle(hash, -47.001846313477, -1075.7963867188, 27.041862487793, 65.265701293945, 1, 0)
        local vehname = GetDisplayNameFromVehicleModel(model)
        local plate = GeneratePlate()
        if previewVehicle ~= nil then
            DeleteEntity(previewVehicle)
        end
        SetVehicleNumberPlateText(purchasedVeh, plate)
        TaskWarpPedIntoVehicle(PlayerPedId(), purchasedVeh, -1)
        TriggerEvent('keys:addNew', purchasedVeh, GetVehicleNumberPlateText(purchasedVeh))
        TriggerServerEvent("drp-cardealer:server:purchaseVeh", price, GetVehicleNumberPlateText(purchasedVeh), model, vehname, financed)
        TriggerEvent("DoLongHudText", "Congraduations on the new vehicle!", 15)
    else
        SendNUIMessage({
            update = "notification"
        })
    end

end

-- Plate Generator

local NumberCharset = {}
local Charset = {}

for i = 48,  57 do table.insert(NumberCharset, string.char(i)) end

for i = 65,  90 do table.insert(Charset, string.char(i)) end
for i = 97, 122 do table.insert(Charset, string.char(i)) end

function GeneratePlate()
	local generatedPlate
	local doBreak = false

	while true do
		Citizen.Wait(2)	
		math.randomseed(GetGameTimer())
		generatedPlate = string.upper(GetRandomLetter(4) .. GetRandomNumber(4))

        local isPlateTaken = remoteCalls.execute("check:db:plate", generatedPlate)
        if not isPlateTaken then
            doBreak = true
        end


		if doBreak then
			break
		end
	end

	return generatedPlate
end

function GetRandomNumber(length)
	Citizen.Wait(1)
	math.randomseed(GetGameTimer())
	if length > 0 then
		return GetRandomNumber(length - 1) .. NumberCharset[math.random(1, #NumberCharset)]
	else
		return ''
	end
end

function GetRandomLetter(length)
	Citizen.Wait(1)
	math.randomseed(GetGameTimer())
	if length > 0 then
		return GetRandomLetter(length - 1) .. Charset[math.random(1, #Charset)]
	else
		return ''
	end
end

RegisterNetEvent("drp-vehicleshop:repo:success")
AddEventHandler("drp-vehicleshop:repo:success", function()
	local veh = GetVehiclePedIsIn(PlayerPedId())
	if veh ~= 0 then
		Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(veh))
		TriggerEvent("DoLongHudText", "You have successfully repossed the vehicle")
	end
end)


RegisterNetEvent("search:list:repo")
AddEventHandler("search:list:repo", function()
	local valid = exports["drp-applications"]:KeyboardInput({
		header = "Search Repo List",
		rows = {
			{
				id = 0,
				txt = "Vehicle Plate Number"
			},
		}
	})
	if valid then
		TriggerServerEvent("drp-vehicleshop:checkrepo", valid[1].input)
	end
end)
