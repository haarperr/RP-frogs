RegisterServerEvent("blackjack:checkPlayerCanBet")
AddEventHandler('blackjack:checkPlayercanBet', checkBet)

function startblackjack(player)
    local player = exports["drp-base"]:getModule("Player"):GetUser(player)
