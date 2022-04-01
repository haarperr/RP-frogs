function doSell(itemname, price)
    if exports["drp-inventory"]:getQuantity(itemname) >= 1 then
        local toSell = exports["drp-inventory"]:getAmountOfItem(itemname)
		local finished = exports["drp-taskbar"]:taskBar(1000*toSell, "Selling")
		if finished == 100 then
			if exports["drp-inventory"]:getQuantity(itemname) >= 1 then
				ClearPedTasksImmediately(PlayerPedId())
				TriggerEvent('inventory:removeItem', itemname, toSell)
                TriggerServerEvent( 'sk1c2:payout', price*toSell)

                if math.random(1,100) == 1 then
                    TriggerServerEvent( 'sk1c2:payout', math.random(500, 750))
                    TriggerEvent('DoLongHudText', 'You are a loyal customer, here is some extra cash.', 2)
                end

                if math.random(1,250) == 1 then
                    TriggerServerEvent( 'sk1c2:payout', math.random(2500, 7500))
                    TriggerEvent('DoLongHudText', 'You are my best customer, here is some extra cash.', 2)
                end
			else
                TriggerEvent('DoLongHudText', 'Might want to try again you do not have that in your pockets', 2)
			end
		end
	else
        TriggerEvent('DoLongHudText', 'You dont seem to have this item.', 2)
	end
end
    

RegisterNetEvent('sell2ctchain')
AddEventHandler('sell2ctchain', function()
    doSell("stolen2ctchain", math.random(115,200))
end)


RegisterNetEvent('sell5ctchain')
AddEventHandler('sell5ctchain', function()
    doSell("stolen5ctchain", math.random(100,250))
end)

RegisterNetEvent('sell8ctchain')
AddEventHandler('sell8ctchain', function()
    doSell("stolen8ctchain", math.random(200,300))
end)
RegisterNetEvent('sellstolengameboy')
AddEventHandler('sellstolengameboy', function()
    doSell("stolengameboy", math.random(20,75))
end)

RegisterNetEvent('sellstolenoakleys')
AddEventHandler('sellstolenoakleys', function()
    doSell("stolenoakleys", math.random(50,125))
end)

RegisterNetEvent('sellstolenpsp')
AddEventHandler('sellstolenpsp', function()
    doSell("stolenpsp", math.random(75,125))
end)

RegisterNetEvent('sellstolennokia')
AddEventHandler('sellstolennokia', function()
    doSell("stolennokia", math.random(125,175))
end)
RegisterNetEvent('sellstoleniphone')
AddEventHandler('sellstoleniphone', function()
    doSell("stoleniphone", math.random(125,175))
end)

RegisterNetEvent('sellstolentv')
AddEventHandler('sellstolentv', function()
    doSell("stolentv", math.random(500,1250))
end)
RegisterNetEvent('sellstolenmusic')
AddEventHandler('sellstolenmusic', function()
    doSell("stolenmusic", math.random(350,550))
end)

RegisterNetEvent('sellstolenart')
AddEventHandler('sellstolenart', function()
    doSell("stolenart", math.random(250,1250))
end)
RegisterNetEvent('sellstolencomputer')
AddEventHandler('sellstolencomputer', function()
    doSell("stolencomputer", math.random(500,800))
end)

RegisterNetEvent('sellstolencasiowatch')
AddEventHandler('sellstolencasiowatch', function()
    doSell("stolencasiowatch", math.random(25,75))
end)

RegisterNetEvent('sellrolex')
AddEventHandler('sellrolex', function()
    doSell("rolexwatch", math.random(225,325))
end)

RegisterNetEvent('selloxy')
AddEventHandler('selloxy', function()
    doSell("oxy", math.random(85, 115))
end)

--#########--
--# Fence #--

--#########--

RegisterNetEvent("fenceguy:menu")
AddEventHandler("fenceguy:menu", function()
	TriggerEvent('drp-context:sendMenu', {
        {
			id = "1",
			header = "Sell your goods!",
            txt = ""
		},
		{
			id = "2",
			header = "Sell 2ct Chain",
			txt = "",
			params = {
				event = "sell2ctchain",
			}
		},
        {
			id = "3",
			header = "Sell 5ct Chain",
			txt = "",
			params = {
				event = "sell5ctchain",
			}
		},
        {
			id = "4",
			header = "Sell 8ct Chain",
			txt = "",
			params = {
				event = "sell8ctchain",
			}
		},
        {
			id = "5",
			header = "Sell Gameboy",
			txt = "",
			params = {
				event = "sellstolengameboy",
			}
		},
        {
			id = "6",
			header = "Sell Nokia",
			txt = "",
			params = {
				event = "sellstolennokia",
			}
		},
        {
			id = "7",
			header = "Sell IPhone",
			txt = "",
			params = {
				event = "sellstoleniphone",
			}
		},
        {
			id = "8",
			header = "Sell Oakleys",
			txt = "",
			params = {
				event = "sellstolenoakleys",
			}
		},
        {
			id = "9",
			header = "Sell PSP",
			txt = "",
			params = {
				event = "sellstolenpsp",
			}
		},
        {
			id = "10",
			header = "Sell Casio Watch",
			txt = "",
			params = {
				event = "sellstolencasiowatch",
			}
		},
        {
			id = "11",
			header = "Sell Rolex",
			txt = "",
			params = {
				event = "sellrolex",
			}
		},
        {
			id = "12",
			header = "Sell TV",
			txt = "",
			params = {
				event = "sellstolentv",
			}
		},
        {
			id = "13",
			header = "Sell Music Player",
			txt = "",
			params = {
				event = "sellstolenmusic",
			}
		},
        {
			id = "14",
			header = "Sell Art",
			txt = "",
			params = {
				event = "sellstolenart",
			}
		},
        {
			id = "15",
			header = "Sell Computer",
			txt = "",
			params = {
				event = "sellstolencomputer",
			}
		}
	})
end)
