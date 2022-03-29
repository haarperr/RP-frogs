RegisterNetEvent('casino:context:hit&stand', function() 
    print("hit casino menu") 

    TriggerEvent('drp-context:sendMenu', {
        {
            id = 1,
            header = "Diamond Casino Blackjack",
            txt = ""
        },
        {
            id = 2,
            header = "Hit", 
            txt = "Draw another card",
            params = {
                event = "BLACKJACK:client:hit",
                args = {
                    
                }
            }
        },
        {
            id = 3,
            header = "Stand", 
            txt = "Be a pussy",
            params = {
                event = "BLACKJACK:client:stand",
                args = {
                    
                }
            }
        },
    })
end)

RegisterNetEvent('casino:context:hit&doubledown', function() 
    print("hit & doubledown casino menu") 

    TriggerEvent('drp-context:sendMenu', {
        {
            id = 1,
            header = "Diamond Casino Blackjack",
            txt = ""
        },
        {
            id = 2,
            header = "Hit", 
            txt = "Draw another card",
            params = {
                event = "BLACKJACK:client:hit",
                args = {
                    
                }
            }
        },
        {
            id = 3,
            header = "Stand", 
            txt = "Be a pussy",
            params = {
                event = "BLACKJACK:client:stand",
                args = {
                    
                }
            }
        },
        {
            id = 4,
            header = "Double Down", 
            txt = "Double your initial bet",
            params = {
                event = "BLACKJACK:client:double",
                args = {
                    
                }
            }
        },
    })
end)

RegisterNetEvent('casino:context:hit&split', function()
    print("hit & split casino menu") 
    TriggerEvent('drp-context:sendMenu', {
        {
            id = 1,
            header = "Diamond Casino Blackjack",
            txt = ""
        },
        {
            id = 2,
            header = "Hit", 
            txt = "Draw another card",
            params = {
                event = "BLACKJACK:client:hit",
                args = {
                    
                }
            }
        },
        {
            id = 3,
            header = "Stand", 
            txt = "Be a pussy",
            params = {
                event = "BLACKJACK:client:stand",
                args = {
                    
                }
            }
        },
        {
            id = 4,
            header = "Split", 
            txt = "Split",
            params = {
                event = "BLACKJACK:client:split",
                args = {
                    
                }
            }
        },
    })
end)




-- RegisterNetEvent("BLACKJACK:RequestMove")
-- AddEventHandler("BLACKJACK:RequestMove", function(_timeLeft)
-- 	Citizen.CreateThread(function()
-- 		timeLeft = _timeLeft

-- 		if leavingBlackjack == true then 
-- 			leaveBlackjack() 
-- 			return 
-- 		else	
-- 		 -- exports['textUi']:DrawTextUi('show', "Hit : ENTER</p>Stand: SPACEBAR") 		
-- 			TriggerEvent("casino:context:hit")
-- 			-- TriggerEvent("casino:context:fullmenu") 

-- 		end
		

-- 		if #hand < 3 and #splitHand == 0 then
-- 			-- exports['textUi']:DrawTextUi('show', "Hit : ENTER</p>Stand: SPACEBAR</p>Double Down: Q")
-- 			TriggerEvent("casino:context:hit&doubledown") 
-- 		else
-- 			TriggerEvent("casino:context:hit")

-- 		end

-- 		if CanSplitHand(hand) == true then
-- 			-- exports['textUi']:DrawTextUi('show', "Hit : ENTER</p>Stand: SPACEBAR</p>Split: LEFT SHIFT") 
-- 			TriggerEvent("casino:context:hit&split") 
-- 		else
-- 			TriggerEvent("casino:context:hit")
-- 		end
		
-- 		while true do Wait(0)	
			
-- 			-- exports['casinoUi']:DrawCasinoUi('show', "Diamond Casino Blackjack</p>Dealer: "..dealerValue[g_seat].."</p>Hand: "..handValue(hand).."</p>Time Left: "..s2m(timeLeft)) 
-- 			exports['casinoUi']:DrawCasinoUi('show', "Diamond Casino Blackjack</p>Time Left: "..s2m(timeLeft).."</p>Dealer: "..dealerValue[g_seat].."</p>Hand: "..handValue(hand).."</p>[Split Hand: "..handValue(splitHand).."]") 

-- 			-- if IsControlJustPressed(1, 201) then
-- 				--TriggerEvent("BLACKJACK:client:hit")
-- 			-- end

-- 			-- if IsControlJustPressed(1, 203) then
-- 				--TriggerEvent("BLACKJACK:client:stand")
-- 			-- end

-- 			-- if IsControlJustPressed(1, 205) and #hand == 2 and #splitHand == 0 then
-- 				--TriggerEvent("BLACKJACK:client:double")
-- 			-- end

-- 			-- if IsControlJustPressed(1, 209) and CanSplitHand(hand) == true then
-- 				--TriggerEvent("BLACKJACK:client:split")
-- 			-- end

-- 		end
-- 	end)
-- end)