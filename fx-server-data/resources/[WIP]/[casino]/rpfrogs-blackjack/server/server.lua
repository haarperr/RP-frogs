ranks = {'02', '03', '04', '05', '06', '07', '08', '09', '10', 'JACK', 'QUEEN', 'KING', 'ACE'}
suits = {'CLUBS', 'DIAMONDS', 'HEARTS', 'SPADES'}

function shuffleDeck(deck)
    local i = #deck
    while i > 1 do
        local j = math.random(1, i)
        i = i - 1
        deck[i], deck[j] = deck[j], deck[i]
    end
    return deck
end

function getDeck()
    local deck = {}
    for i = 1, #ranks do
        for j = 1, #suits do
            table.insert(deck, ranks[i] .. ' ' .. suits[j])
        end
    end
    return shuffleDeck(deck)
end

function takeCard(deck)
    local card = table.remove(deck, 1)
    return card
end

function cardValue(card)
    local rank = 10
    for i=2,11 do
        if string.find(card, tostring(i)) then
            rank = i
        end
    end
    if string.find(card, 'ACE') then
        rank = 11
    end

    return rank
end

function handValue(hand)
    local value = 0
    for i=1, #hand do
        value = value + cardValue(hand[i])
    end

    return value
end

players = {}

timeTracker = {}

tableTracker = {}

getChipsCallback = nil
takeChipsCallback = nil
giveChipsCallback = nil

function FindPlayerIdx(player)
    for i=1, #players do
        if players[i] == player then
            return i
        end
    end
    return nil
end

function SetGetChipsCallback(callback)
    getChipsCallback = callback
end

function SetTakeChipsCallback(callback)
    takeChipsCallback = callback
end

function SetGiveChipsCallback(callback)
    giveChipsCallback = callback
end

function GiveMoney(player, amount)
    if giveChipsCallback then
        giveChipsCallback(player, amount)
    end
end

function TakeMoney(player, amount)
    if takeChipsCallback then
        takeChipsCallback(player, amount)
    end
end

function HaveAllPlayersBetted(table)
    for i,v in pairs(table) do
        if v.bet == 0 then
            return false
        end
    end
end

function ArePlayersStillIn(table)
    for i,v in pairs(table) do
        if v.player_in == false then
            return false
        end
    end
    return true
end

function PlayDealerAnim(dealer, animDict, anim)
    TriggerClientEvent("blackjack:PlayDealerAnim", -1, dealer, animDict, anim)
end

function PlayDealerSpeech(dealer, speech)
    TriggerClientEvent("blackjack:PlayDealerSpeech", -1, dealer, speech)
end

function SetPlayerBet(i, seat, bet, betId, double, split)
    split = split or false
    double = double or false

    local num = FindPlayerIdx(players[i], source)

    if num ~= nil then
        if double == false and split == false then
            TakeMoney(source, bet)
            players[i][num].bet = tonumber(bet)
        end
        
        TriggerClientEvent("blackjack:PlaceBetChip", -1, i, 5-seat, bet, double, split)
    else
        print("error player attempted bet but no longer is being tracked by blackjack")
    end
end

RegisterServerEvent("blackjack:SetPlayerBet")
AddEventHandler("blackjack:SetPlayerBet", SetPlayerBet)

function CheckPlayerBet(i, bet)
    local Player = exports["drp-base"]:getModule("Player"):GetUser(i)
    local ItemList = {
        ["casinochips"] = 1,
    }

    print('checking player bet and chips')

    local playerChips = Player.Functions.GetItemByName("casinochips")
    local canBet = false

    if playerChips ~= nil then
        if playerChips.count >= bet then
            canBet = true
        end
    end

    if canBet == true then
        print('player can bet')
        TriggerClientEvent("blackjack:BetRecieved", source, canBet)
    else
        print('player cant bet')
        TriggerClientEvent("blackjack:BetRecieved", source, canBet)
    end

    print('player bet checked')
end

RegisterServerEvent("blackjack:CheckPlayerBet")
AddEventHandler("blackjack:CheckPlayerBet", CheckPlayerBet)


RegisterServerEvent("blackjack:RecievedMove")

function StartTableThread(i)
    Citizen.CreateThread(function ()
        local index = i
        while true do Wait(0)
            if players[index] and #players[index] ~= 0 then
                print('waiting for players at table to place bets')
                PlayDealerAnim(index, "anim_casino_b@amb@casino@games@blackjack@dealer", "female_place_bet_request")
                PlayDealerSpeech(index, "MINIGAME_DEALER_PLACE_CHIPS")
                
                repeat
                    for i,v in pairs(players[index]) do
                        TriggerClientEvent("blackjack:SyncTimer", v.player, bettingTime - timeTracker[index])
                    end -- remove players who didnt bet from stuff
                    Wait(1000)
                    timeTracker[index] = timeTracker[index] + 1
                until HaveAllPlayersBetted(players[index]) or #players[index] == 0 or timeTracker[index] >= bettingTime

                if #players[index] == 0 then
                    print('betting ended at table, no more player bets')
                    -- nono smells
                else
                    for i,v in pairs(players[index]) do
                        if v.bet < 1 then
                            v.player_in = false
                        end
                    end -- remove players who didnt bet from stuff

                    if ArePlayersStillIn(players[index]) then
                        print('betting ended at table, all players still in')
                        PlayDealerSpeech(index, "MINIGAME_DEALER_CLOSED_BETS")

                        local currentPlayers = {table.unpack(players[i])}
                        local deck = getDeck()
                        local dealerHand = {}

                        local gameRunning = true

                        Wait(1500)

                        for x=1,2 do
                            local card = takeCard(deck)
                            table.insert(dealerHand, card)

                            TriggerClientEvent("blackjack:GiveCard", -1, index, 0, #dealerHand, card, #dealerHand == 1)

                            if #dealerHand == 1 then
                                PlayDealerAnim(index, "anim_casino_b@amb@casino@games@blackjack@dealer", "female_deal_card_self")
                                print('table dealt dealer')
                            else
                                PlayDealerAnim(index, "anim_casino_b@amb@casino@games@blackjack@dealer", "female_deal_card_self_second_card")
                                print('table dealer dealer 2')
                            end
                            Wait(2000)

                            if #dealerHand > 1 then
                                PlayDealerSpeech(index, "MINIGAME_DEALER_DEALER_"..cardValue(dealerHand[2]))
                            end

                            for i,v in pairs(currentPlayers) do
                                if v.player_in then
                                    local card = takeCard(deck)
                                    TriggerClientEvent("blackjack:GiveCard", -1, index, v.seat, #v.hand+1, card)
                                    PlayDealerAnim(index, "anim_casino_b@amb@casino@games@blackjack@dealer", "female_deal_card_player_0" .. 5-v.seat)
                                    table.insert(v.hand, card)

                                    Wait(2000)

                                    print('table dealt')

                                    if handValue(v.hand) == 21 then
                                        TriggerClientEvent("blackjack:GameEndReaction", v.player, "good")
                                        print('player got blackjack pausemansit')
                                        GiveMoney(v.player, v.bet*2.5)
                                        v.player_in = false
                                        PlayDealerSpeech(index, "MINIGAME_BJACK_DEALER_BLACKJACK")
                                    else
                                        PlayDealerSpeech(index, "MINIGAME_BJACK_DEALER_"..handValue(v.hand))
                                    end
                                end
                            end
                        end

                        if handValue(dealerHand) == 21 then
                            print("dealer got blackjack")
                            PlayDealerAnim(index, "anim_casino_b@amb@casino@games@blackjack@dealer", "female_check_and_turn_card")
                            Wait(2000)
                            PlayDealerSpeech(index, "MINIGAME_BJACK_DEALER_BLACKJACK")
                            TriggerClientEvent("blackjack::DealerTurnOverCard", -1 index)

                            for i,v in pairs(currentPlayers) do
                                TriggerClientEvent("blackjack:GameEndReaction", v.player, "bad")
                            end

                            gameRunning = false
                        elseif cardValue(dealerHand[2]) == 10 or cardValue(dealerHand[2]) == 11 then
                            print("dealer got a 10 or an ace")
                            PlayDealerAnim(index, "anim_casino_b@amb@casino@games@blackjack@dealer", "
                            Wait(2000)
                        end

                        if gameRunning == true then
                            for i,v in pairs(currentPlayers) do
                                if v.player_in then
                                    if tableTracker[tostring(v.player)] == nil then
                                        print('table removed due to leaving ')
                                        v.player_in = false
                                        TriggerClientEvent('blackjack:RetrieveCards', -1, index, v.seat)
                                    else
                                        PlayDealerAnim(index, "anim_casino_b@amb@casino@games@blackjack@dealer", "female_dealer_focus_player_0".. 5-v.seat .."_idle_intro")
                                        Wait(1500)
                                        PlayDealerSpeech(index, "MINIGAME_BJACK_DEALER_ANOTHER_CARD")
                                        while v.player_in == true and #v.hand < 5 do
                                            timeTracker[index] = 0
                                            Wait(0)
                                            -- nono smells
                                            PlayDealerAnim(index, "anim_casino_b@amb@casino@games@blackjack@dealer", "female_dealer_focus_player_0".. 5-v.seat .."_idle")
                                            print('waiting move from player')
                                            TriggerClientEvent('blackjack::RequestMove', v.player, moveTime - timeTracker[index])
                                            local receivedMove = false
                                            local move = "stand"
                                            local eventHandle = AddEventHandler("blackjack::RecievedMove", function(m))
                                                if source ~= v.player then return end
                                                move = m
                                                receivedMove = true
                                            end)

                                            while receivedMove = false and tableTracker[tostring(v.player)] ~= nil and timeTracker[index] < moveTime do
                                                for i,v in pairs(currentPlayers) do
                                                    TriggerClientEvent("blackjack:SyncTimer", v.player, moveTime - timeTracker[index])
                                                end
                                                Wait(1000)
                                                timeTracker[index] = timeTracker[index] + 1
                                            end

-- omegalul copilot doing juicer
-- to-do:
-- 1. add a function to check if the player wins or loses
-- 5. add a function to check if the player has enough money to bet
-- 6. add a function to check if the player has membership (?) i need to ask the business man guy
-- 7. finish serverside logic

-- expected finish date (server.lua) = 4/17/2022
