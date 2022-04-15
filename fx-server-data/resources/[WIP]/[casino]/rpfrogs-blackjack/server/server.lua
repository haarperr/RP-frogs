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

-- bro im letting copilot do most of the work and its good code too OMEGALUL

