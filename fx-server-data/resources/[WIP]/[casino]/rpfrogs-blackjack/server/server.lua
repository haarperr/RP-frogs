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


-- omegalul copilot doing juicer
-- to-do:
-- 1. add a function to check if the player wins or loses
-- 2. add a function to check if the player busts
-- 3. add a function to check if the player has blackjack
-- 5. add a function to check if the player has enough money to bet
-- 6. add a function to check if the player has membership (?) i need to ask the business man guy
-- 7. finish serverside logic

-- expected finish date (server.lua) = 4/16/2022
