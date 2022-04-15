function startGame()
    bet = 0
    hand = {}
    dealerHand = {}
    timeRemaining = 0
    
    if getElementData(localPlayer, "casino.blackjack.money") >= 1 then
        triggerServerEvent("checkPlayerCanBet", localPlayer)
    else
        TriggerEvent('DoLongHudText', 'You dont have enough money to play this game.', 2)	-- 1 == green | 2 == red
    end
end

