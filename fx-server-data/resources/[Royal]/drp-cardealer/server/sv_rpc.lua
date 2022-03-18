remoteCalls.register("drp-cardealer:hasEnough", function(price, financed)
    local pSrc = source
    local user = exports["drp-base"]:getModule("Player"):GetUser(pSrc)
    local char = user:getCurrentCharacter()

    if not financed then
        if (user:getCash() >= price) then
            user:removeMoney(price)
            pPassed = true
        else
            pPassed = false
        end
    elseif financed then
        local AskingPrice = math.ceil(price / 3)
        if (user:getCash() >=  AskingPrice) then
            user:removeMoney(AskingPrice)
            pPassed = true
        else
            pPassed = false
        end
    end
    
    Citizen.Wait(100)
    return pPassed
end)


remoteCalls.register("check:db:plate", function(generatedPlate)
    local pSrc = source
    exports.ghmattimysql:execute("SELECT * FROM `characters_cars` WHERE license_plate = ?", {generatedPlate}, function(result)
        if result[1] then
            pNotTaken = true
        else
            pNotTaken = false
        end
    end)
    
    Citizen.Wait(100)
    return pNotTaken
end)
