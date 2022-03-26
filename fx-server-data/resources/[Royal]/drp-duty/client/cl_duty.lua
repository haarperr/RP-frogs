-- Police Duty --

local PDService = false
local SASPService = false
local BCSOService = false
local DOCService = false

RegisterNetEvent('drp-duty:PoliceMenu')
AddEventHandler('drp-duty:PoliceMenu', function()

	local menuData = {
		{
            title = "State Police",
            description = "Sign On/Off Duty",
            key = "EVENTS.SASP",
			children = {
				{ title = "Sign On Duty", action = "drp-duty:OnDutyHP", key = "EVENTS.SASP" },
				{ title = "Sign Off Duty", action = "drp-duty:OffDutyHP", key = "EVENTS.SASP" },
            },
        },
        {
            title = "Police",
            description = "Sign On/Off Duty",
            key = "EVENTS.POLICE",
			children = {
				{ title = "Sign On Duty", action = "drp-duty:OnDutyPD", key = "EVENTS.POLICE" },
				{ title = "Sign Off Duty", action = "drp-duty:OffDutyPD", key = "EVENTS.POLICE" },
            },
        },
        {
            title = "Sheriff",
            description = "Sign On/Off Duty",
            key = "EVENTS.SHERIFF",
			children = {
				{ title = "Sign On Duty", action = "drp-duty:OnDutySH", key = "EVENTS.SHERIFF" },
				{ title = "Sign Off Duty", action = "drp-duty:OffDutySH", key = "EVENTS.SHERIFF" },
            },
        },
		{
            title = "DOC",
            description = "Sign On/Off Duty",
            key = "EVENTS.DOC",
			children = {
				{ title = "Sign On Duty", action = "drp-duty:OnDutyDOC", key = "EVENTS.DOC" },
				{ title = "Sign Off Duty", action = "drp-duty:OffDutyDOC", key = "EVENTS.DOC" },
            },
        },
    }
    exports["drp-ui"]:showContextMenu(menuData)
end)

RegisterUICallback("drp-duty:OnDutyPD", function(data, cb)
	cb({ data = {}, meta = { ok = true, message = 'done' } })
	exports["drp-ui"]:hideContextMenu()
	if PDService == false then
		TriggerServerEvent('drp-duty:AttemptDuty', 'police')
		TriggerEvent('drp-clothes:inService', true)
		TriggerServerEvent('dispatch:setcallsign')
	else
		TriggerEvent("DoLongHudText",'You are on duty already!', 2)
	end
end)

RegisterUICallback("drp-duty:OffDutyPD", function(data, cb)
	cb({ data = {}, meta = { ok = true, message = 'done' } })
	exports["drp-ui"]:hideContextMenu()
	if PDService == true then
		PDService = false
		TriggerEvent('drp-clothes:inService', false)
		exports['drp-voice']:removePlayerFromRadio()
		exports["drp-voice"]:setVoiceProperty("radioEnabled", false)
		TriggerEvent('radio:SetRadioStatus', false)
		TriggerServerEvent("jobssystem:jobs", "unemployed")
		TriggerServerEvent('myskin_customization:wearSkin')
		TriggerServerEvent('tattoos:retrieve')
		TriggerServerEvent('Blemishes:retrieve')
		TriggerEvent("police:noLongerCop")
		TriggerEvent("logoffmedic")		
		TriggerEvent("loggedoff")					
		TriggerEvent('nowCopSpawnOff')
		TriggerEvent('nowMedicOff')
		SetPedRelationshipGroupHash(PlayerPedId(),`PLAYER`)
		SetPedRelationshipGroupDefaultHash(PlayerPedId(),`PLAYER`)
		SetPoliceIgnorePlayer(PlayerPedId(),false)
		TriggerServerEvent('drp-duty:OffDutyComplete', 'police')
		TriggerEvent("DoLongHudText",'Signed off Duty!',1)
	else
		TriggerEvent("DoLongHudText",'You wasnt on duty!', 2)
	end
end)


RegisterCommand('dutypd', function(source, args)
	TriggerServerEvent('drp-duty:OnDutyPD')


end)

RegisterCommand('dutyso', function(source, args)
	TriggerServerEvent('drp-duty:OnDutySH')

	
end)



-- Sheriff

RegisterUICallback("drp-duty:OnDutySH", function(data, cb)
	cb({ data = {}, meta = { ok = true, message = 'done' } })
	exports["drp-ui"]:hideContextMenu()
	if BCSOService == false then
		TriggerServerEvent('drp-duty:AttemptDuty', 'sheriff')
		TriggerEvent('drp-clothes:inService', true)
		TriggerServerEvent('dispatch:setcallsign')
	else
		TriggerEvent("DoLongHudText",'You are on duty already!', 2)
	end
end)

RegisterUICallback("drp-duty:OffDutySH", function(data, cb)
	cb({ data = {}, meta = { ok = true, message = 'done' } })
	exports["drp-ui"]:hideContextMenu()
	if BCSOService == true then
		BCSOService = false
		TriggerEvent('drp-clothes:inService', false)
		exports['drp-voice']:removePlayerFromRadio()
		exports["drp-voice"]:setVoiceProperty("radioEnabled", false)
		TriggerEvent('radio:SetRadioStatus', false)
		TriggerServerEvent("jobssystem:jobs", "unemployed")
		TriggerServerEvent('myskin_customization:wearSkin')
		TriggerServerEvent('tattoos:retrieve')
		TriggerServerEvent('Blemishes:retrieve')
		TriggerEvent("police:noLongerCop")
		TriggerEvent("logoffmedic")		
		TriggerEvent("loggedoff")					
		TriggerEvent('nowCopSpawnOff')
		TriggerEvent('nowMedicOff')
		SetPedRelationshipGroupHash(PlayerPedId(),`PLAYER`)
		SetPedRelationshipGroupDefaultHash(PlayerPedId(),`PLAYER`)
		SetPoliceIgnorePlayer(PlayerPedId(),false)
		TriggerServerEvent('drp-duty:OffDutyComplete', 'sheriff')
		TriggerEvent("DoLongHudText",'Signed off Duty!',1)
	else
		TriggerEvent("DoLongHudText",'You wasnt on duty!', 2)
	end
end)

-- State

RegisterUICallback("drp-duty:OnDutyHP", function(data, cb)
	cb({ data = {}, meta = { ok = true, message = 'done' } })
	exports["drp-ui"]:hideContextMenu()
	if SASPService == false then
		TriggerServerEvent('drp-duty:AttemptDuty', 'state')
		TriggerEvent('drp-clothes:inService', true)
		TriggerServerEvent('dispatch:setcallsign')
	else
		TriggerEvent("DoLongHudText",'You are on duty already!', 2)
	end
end)

RegisterUICallback("drp-duty:OffDutyHP", function(data, cb)
	cb({ data = {}, meta = { ok = true, message = 'done' } })
	exports["drp-ui"]:hideContextMenu()
	if SASPService == true then
		SASPService = false
		TriggerEvent('drp-clothes:inService', false)
		exports['drp-voice']:removePlayerFromRadio()
		exports["drp-voice"]:setVoiceProperty("radioEnabled", false)
		TriggerEvent('radio:SetRadioStatus', false)
		TriggerServerEvent("jobssystem:jobs", "unemployed")
		TriggerServerEvent('myskin_customization:wearSkin')
		TriggerServerEvent('tattoos:retrieve')
		TriggerServerEvent('Blemishes:retrieve')
		TriggerEvent("police:noLongerCop")
		TriggerEvent("logoffmedic")		
		TriggerEvent("loggedoff")					
		TriggerEvent('nowCopSpawnOff')
		TriggerEvent('nowMedicOff')
		SetPedRelationshipGroupHash(PlayerPedId(),`PLAYER`)
		SetPedRelationshipGroupDefaultHash(PlayerPedId(),`PLAYER`)
		SetPoliceIgnorePlayer(PlayerPedId(),false)
		TriggerServerEvent('drp-duty:OffDutyComplete', 'state')
		TriggerEvent("DoLongHudText",'Signed off Duty!',1)
	else
		TriggerEvent("DoLongHudText",'You wasnt on duty!', 2)
	end
end)

-- DOC

RegisterUICallback("drp-duty:OnDutyDOC", function(data, cb)
	cb({ data = {}, meta = { ok = true, message = 'done' } })
	exports["drp-ui"]:hideContextMenu()
	if DOCService == false then
		TriggerServerEvent('drp-duty:AttemptDuty', 'doc')
		TriggerEvent('drp-clothes:inService', true)
		TriggerServerEvent('dispatch:setcallsign')
	else
		TriggerEvent("DoLongHudText",'You are on duty already!', 2)
	end
end)

RegisterUICallback("drp-duty:OffDutyDOC", function(data, cb)
	cb({ data = {}, meta = { ok = true, message = 'done' } })
	exports["drp-ui"]:hideContextMenu()
	if DOCService == true then
		DOCService = false
		TriggerEvent('drp-clothes:inService', false)
		exports['drp-voice']:removePlayerFromRadio()
		exports["drp-voice"]:setVoiceProperty("radioEnabled", false)
		TriggerEvent('radio:SetRadioStatus', false)
		TriggerServerEvent("jobssystem:jobs", "unemployed")
		TriggerServerEvent('myskin_customization:wearSkin')
		TriggerServerEvent('tattoos:retrieve')
		TriggerServerEvent('Blemishes:retrieve')
		TriggerEvent("police:noLongerCop")
		TriggerEvent("logoffmedic")		
		TriggerEvent("loggedoff")					
		TriggerEvent('nowCopSpawnOff')
		TriggerEvent('nowMedicOff')
		SetPedRelationshipGroupHash(PlayerPedId(),`PLAYER`)
		SetPedRelationshipGroupDefaultHash(PlayerPedId(),`PLAYER`)
		SetPoliceIgnorePlayer(PlayerPedId(),false)
		TriggerServerEvent('drp-duty:OffDutyComplete', 'doc')
		TriggerEvent("DoLongHudText",'Signed off Duty!',1)
	else
		TriggerEvent("DoLongHudText",'You wasnt on duty!', 2)
	end
end)

RegisterNetEvent('drp-duty:PDSuccess')
AddEventHandler('drp-duty:PDSuccess', function()
	if PDService == false then
--		exports["drp-voice"]:setVoiceProperty("radioEnabled", true)
--		exports['drp-voice']:addPlayerToRadio(1)
--		TriggerEvent('radio:SetRadioStatus', true)
		PDService = true
		TriggerEvent('nowCop')
		TriggerEvent('nowService')
		TriggerEvent('nowCopHud')
		TriggerEvent('nowCopDeath')
		TriggerEvent('nowCopSpawn')
		TriggerEvent('nowMedic')
		SetPedRelationshipGroupDefaultHash(PlayerPedId(),`MISSION2`)
		SetPedRelationshipGroupHash(PlayerPedId(),`MISSION2`)
		SetPoliceIgnorePlayer(PlayerPedId(),true)
	else
		TriggerEvent("DoLongHudText",'You are on duty already!', 2)
	end
end)

RegisterNetEvent('drp-duty:BCSOSuccess')
AddEventHandler('drp-duty:BCSOSuccess', function()
	if BCSOService == false then
--		exports["drp-voice"]:setVoiceProperty("radioEnabled", true)
--		exports['drp-voice']:addPlayerToRadio(1)
--		TriggerEvent('radio:SetRadioStatus', true)
		BCSOService = true
		TriggerEvent('nowCop')
		TriggerEvent('nowService')
		TriggerEvent('nowCopHud')
		TriggerEvent('nowCopDeath')
		TriggerEvent('nowCopSpawn')
		TriggerEvent('nowMedic')
		SetPedRelationshipGroupDefaultHash(PlayerPedId(),`MISSION2`)
		SetPedRelationshipGroupHash(PlayerPedId(),`MISSION2`)
		SetPoliceIgnorePlayer(PlayerPedId(),true)
	else
		TriggerEvent("DoLongHudText",'You are on duty already!', 2)
	end
end)

RegisterNetEvent('drp-duty:SASPSuccess')
AddEventHandler('drp-duty:SASPSuccess', function()
	if SASPService == false then
--		exports["drp-voice"]:setVoiceProperty("radioEnabled", true)
--		exports['drp-voice']:addPlayerToRadio(1)
--		TriggerEvent('radio:SetRadioStatus', true)
		SASPService = true
		TriggerEvent('nowCop')
		TriggerEvent('nowService')
		TriggerEvent('nowCopHud')
		TriggerEvent('nowCopDeath')
		TriggerEvent('nowCopSpawn')
		TriggerEvent('nowMedic')
		SetPedRelationshipGroupDefaultHash(PlayerPedId(),`MISSION2`)
		SetPedRelationshipGroupHash(PlayerPedId(),`MISSION2`)
		SetPoliceIgnorePlayer(PlayerPedId(),true)
	else
		TriggerEvent("DoLongHudText",'You are on duty already!', 2)
	end
end)

RegisterNetEvent('drp-duty:DOCSuccess')
AddEventHandler('drp-duty:DOCSuccess', function()
	if DOCService == false then
--		exports["drp-voice"]:setVoiceProperty("radioEnabled", true)
--		exports['drp-voice']:addPlayerToRadio(3)
--		TriggerEvent('radio:SetRadioStatus', true)
		DOCService = true
		TriggerEvent('nowCop')
		TriggerEvent('nowService')
		TriggerEvent('nowCopHud')
		TriggerEvent('nowCopDeath')
		TriggerEvent('nowCopSpawn')
		TriggerEvent('nowMedic')
		SetPedRelationshipGroupDefaultHash(PlayerPedId(),`MISSION2`)
		SetPedRelationshipGroupHash(PlayerPedId(),`MISSION2`)
		SetPoliceIgnorePlayer(PlayerPedId(),true)
	else
		TriggerEvent("DoLongHudText",'You are on duty already!', 2)
	end
end)

-- EMS Duty --

local EMSService = false

RegisterNetEvent('drp-duty:EMSMenu')
AddEventHandler('drp-duty:EMSMenu', function()
	TriggerEvent('drp-context:sendMenu', {
        {
            id = 1,
            header = "Sign In / Off ",
            txt = ""
        },
        {
            id = 2,
            header = "Signing On Duty",
			txt = "Use this to sign in",
			params = {
                event = "drp-duty:OnDutyEMS"
            }
        },
		{
            id = 3,
            header = "Signing Off Duty",
			txt = "Use this to sign off",
			params = {
                event = "drp-duty:OffDutyEMS"
            }
        },
    })
end)

RegisterNetEvent('drp-duty:OnDutyEMS')
AddEventHandler('drp-duty:OnDutyEMS', function()
	if EMSService == false then
		TriggerServerEvent('drp-duty:AttemptDutyEMS')
		TriggerEvent('drp-clothes:inService', true)
		TriggerServerEvent('dispatch:setcallsign')
	else
		TriggerEvent("DoLongHudText",'You are on duty already!', 2)
	end
end)

RegisterNetEvent('drp-duty:OffDutyEMS')
AddEventHandler('drp-duty:OffDutyEMS', function()
	if EMSService == true then
		EMSService = false
		TriggerEvent('drp-clothes:inService', false)
		exports['drp-voice']:removePlayerFromRadio()
		exports["drp-voice"]:setVoiceProperty("radioEnabled", false)
		TriggerEvent('radio:SetRadioStatus', false)
		TriggerServerEvent("jobssystem:jobs", "unemployed")
		TriggerServerEvent('myskin_customization:wearSkin')
		TriggerServerEvent('tattoos:retrieve')
		TriggerServerEvent('Blemishes:retrieve')
		TriggerEvent("logoffmedic")		
		TriggerEvent("loggedoff")					
		TriggerEvent('nowCopSpawnOff')
		TriggerEvent('nowMedicOff')
		SetPedRelationshipGroupHash(PlayerPedId(),`PLAYER`)
		SetPedRelationshipGroupDefaultHash(PlayerPedId(),`PLAYER`)
		SetPoliceIgnorePlayer(PlayerPedId(),false)
		TriggerServerEvent('drp-duty:OffDutyCompleteEMS')
		TriggerEvent("DoLongHudText",'Signed off Duty!',1)
	else
		TriggerEvent("DoLongHudText",'You are not on duty!', 2)
	end
end)

RegisterNetEvent('drp-duty:EMSSuccess')
AddEventHandler('drp-duty:EMSSuccess', function()
	if EMSService == false then
		exports["drp-voice"]:setVoiceProperty("radioEnabled", true)
		exports['drp-voice']:addPlayerToRadio(2)
		TriggerEvent('radio:SetRadioStatus', true)
		EMSService = true
		TriggerEvent('nowCop')
		TriggerEvent('nowService')
		TriggerEvent('nowCopHud')
		TriggerEvent('nowCopDeath')
		TriggerEvent('nowCopSpawn')
		TriggerEvent('nowMedic')
		SetPedRelationshipGroupDefaultHash(PlayerPedId(),`MISSION2`)
		SetPedRelationshipGroupHash(PlayerPedId(),`MISSION2`)
		SetPoliceIgnorePlayer(PlayerPedId(),true)
	else
		TriggerEvent("DoLongHudText",'You are on duty already!', 2)
	end
end)

-- Suits Duty ----------------------------------------------------------------

local SuitsService = false

RegisterNetEvent('drp-duty:SuitsMenu')
AddEventHandler('drp-duty:SuitsMenu', function()
	TriggerEvent('drp-context:sendMenu', {
        {
            id = 1,
            header = "Sign In / Off ",
            txt = ""
        },
        {
            id = 2,
            header = "Signing On Duty",
			txt = "Use this to sign in",
			params = {
                event = "drp-duty:OnDutySuits"
            }
        },
		{
            id = 3,
            header = "Signing Off Duty",
			txt = "Use this to sign off",
			params = {
                event = "drp-duty:OffDutySuits"
            }
        },
    })
end)

RegisterNetEvent('drp-duty:OnDutySuits')
AddEventHandler('drp-duty:OnDutySuits', function()
	if SuitsService == false then
		TriggerServerEvent('drp-duty:AttemptDutySuits')
		TriggerEvent('drp-clothes:inService', true)
	else
		TriggerEvent("DoLongHudText",'You are on duty already!', 2)
	end
end)

RegisterNetEvent('drp-duty:OffDutySuits')
AddEventHandler('drp-duty:OffDutySuits', function()
	if SuitsService == true then
		SuitsService = false
		TriggerEvent('drp-clothes:inService', false)
		TriggerServerEvent("jobssystem:jobs", "unemployed")
		TriggerServerEvent('myskin_customization:wearSkin')
		TriggerServerEvent('tattoos:retrieve')
		TriggerServerEvent('Blemishes:retrieve')
		TriggerEvent("logoffmedic")		
		TriggerEvent("loggedoff")					
		TriggerEvent('nowCopSpawnOff')
		TriggerEvent('nowMedicOff')
		SetPedRelationshipGroupHash(PlayerPedId(),`PLAYER`)
		SetPedRelationshipGroupDefaultHash(PlayerPedId(),`PLAYER`)
		SetPoliceIgnorePlayer(PlayerPedId(),false)
		TriggerServerEvent('drp-duty:OffDutyCompleteSuits')
		TriggerEvent("DoLongHudText",'Signed off Duty!',1)
	else
		TriggerEvent("DoLongHudText",'You are not on duty!', 2)
	end
end)

RegisterNetEvent('drp-duty:SuitsSuccess')
AddEventHandler('drp-duty:SuitsSuccess', function()
	if SuitsService == false then
		SuitsService = true
		TriggerEvent('nowCop')
		TriggerEvent('nowService')
		TriggerEvent('nowCopHud')
		TriggerEvent('nowCopDeath')
		TriggerEvent('nowCopSpawn')
		TriggerEvent('nowMedic')
		SetPedRelationshipGroupDefaultHash(PlayerPedId(),`MISSION2`)
		SetPedRelationshipGroupHash(PlayerPedId(),`MISSION2`)
		SetPoliceIgnorePlayer(PlayerPedId(),true)
	else
		TriggerEvent("DoLongHudText",'You are on duty already!', 2)
	end
end)

-- Judge Duty ------------------------------------------------------------

local JudgeService = false

RegisterNetEvent('drp-duty:JudgeMenu')
AddEventHandler('drp-duty:JudgeMenu', function()
	TriggerEvent('drp-context:sendMenu', {
        {
            id = 1,
            header = "Sign In / Off ",
            txt = ""
        },
        {
            id = 2,
            header = "Signing On Duty",
			txt = "Use this to sign in",
			params = {
                event = "drp-duty:OnDutyJudge"
            }
        },
		{
            id = 3,
            header = "Signing Off Duty",
			txt = "Use this to sign off",
			params = {
                event = "drp-duty:OffDutyJudge"
            }
        },
    })
end)

RegisterNetEvent('drp-duty:OnDutyJudge')
AddEventHandler('drp-duty:OnDutyJudge', function()
	if JudgeService == false then
		TriggerServerEvent('drp-duty:AttemptDutyJudge')
	else
		TriggerEvent("DoLongHudText",'You are on duty already!', 2)
	end
end)

RegisterNetEvent('drp-duty:OffDutyJudge')
AddEventHandler('drp-duty:OffDutyJudge', function()
	if JudgeService == true then
		JudgeService = false
		TriggerServerEvent('drp-duty:OffDutyCompleteEMS')
		TriggerServerEvent("jobssystem:jobs", "unemployed")
		TriggerEvent("DoLongHudText",'Signed off Duty!',1)
	else
		TriggerEvent("DoLongHudText",'You are not on duty!', 2)
	end
end)

RegisterNetEvent('drp-duty:JudgeSuccess')
AddEventHandler('drp-duty:JudgeSuccess', function()
	if JudgeService == false then
		JudgeService = true
	else
		TriggerEvent("DoLongHudText",'You are on duty already!', 2)
	end
end)

-- DA Duty --

local DAService = false

RegisterNetEvent('drp-duty:DAMenu')
AddEventHandler('drp-duty:DAMenu', function()
	TriggerEvent('drp-context:sendMenu', {
        {
            id = 1,
            header = "Sign In / Off ",
            txt = ""
        },
        {
            id = 2,
            header = "Signing On Duty",
			txt = "Use this to sign in",
			params = {
                event = "drp-duty:OnDutyDA"
            }
        },
		{
            id = 3,
            header = "Signing Off Duty",
			txt = "Use this to sign off",
			params = {
                event = "drp-duty:OffDutyDA"
            }
        },
    })
end)

RegisterNetEvent('drp-duty:OnDutyDA')
AddEventHandler('drp-duty:OnDutyDA', function()
	if DAService == false then
		TriggerServerEvent('drp-duty:AttemptDutyDA')
	else
		TriggerEvent("DoLongHudText",'You are on duty already!', 2)
	end
end)

RegisterNetEvent('drp-duty:OffDutyDA')
AddEventHandler('drp-duty:OffDutyDA', function()
	if DAService == true then
		DAService = false
		TriggerServerEvent("jobssystem:jobs", "unemployed")
		TriggerEvent("DoLongHudText",'Signed off Duty!',1)
	else
		TriggerEvent("DoLongHudText",'You are not on duty!', 2)
	end
end)

RegisterNetEvent('drp-duty:DASuccess')
AddEventHandler('drp-duty:DASuccess', function()
	if DAService == false then
		DAService = true
	else
		TriggerEvent("DoLongHudText",'You are on duty already!', 2)
	end
end)

-- Public Duty --

local PublicService = false

RegisterNetEvent('drp-duty:PublicMenu')
AddEventHandler('drp-duty:PublicMenu', function()
	TriggerEvent('drp-context:sendMenu', {
        {
            id = 1,
            header = "Sign In / Off ",
            txt = ""
        },
        {
            id = 2,
            header = "Signing On Duty",
			txt = "Use this to sign in",
			params = {
                event = "drp-duty:OnDutyPublic"
            }
        },
		{
            id = 3,
            header = "Signing Off Duty",
			txt = "Use this to sign off",
			params = {
                event = "drp-duty:OffDutyPublic"
            }
        },
    })
end)

RegisterNetEvent('drp-duty:OnDutyPublic')
AddEventHandler('drp-duty:OnDutyPublic', function()
	if PublicService == false then
		TriggerServerEvent('drp-duty:AttemptDutyPublic')
	else
		TriggerEvent("DoLongHudText",'You are on duty already!', 2)
	end
end)

RegisterNetEvent('drp-duty:OffDutyPublic')
AddEventHandler('drp-duty:OffDutyPublic', function()
	if PublicService == true then
		PublicService = false
		TriggerServerEvent("jobssystem:jobs", "unemployed")
		TriggerEvent("DoLongHudText",'Signed off Duty!',1)
	else
		TriggerEvent("DoLongHudText",'You are not on duty!', 2)
	end
end)

RegisterNetEvent('drp-duty:PublicSuccess')
AddEventHandler('drp-duty:PublicSuccess', function()
	if PublicService == false then
		PublicService = true
	else
		TriggerEvent("DoLongHudText",'You are on duty already!', 2)
	end
end)

-- ADA Duty --

local ADAService = false

RegisterNetEvent('drp-duty:ADAMenu')
AddEventHandler('drp-duty:ADAMenu', function()
	TriggerEvent('drp-context:sendMenu', {
        {
            id = 1,
            header = "Sign In / Off ",
            txt = ""
        },
        {
            id = 2,
            header = "Signing On Duty",
			txt = "Use this to sign in",
			params = {
                event = "drp-duty:OnDutyADA"
            }
        },
		{
            id = 3,
            header = "Signing Off Duty",
			txt = "Use this to sign off",
			params = {
                event = "drp-duty:OffDutyADA"
            }
        },
    })
end)

RegisterNetEvent('drp-duty:OnDutyADA')
AddEventHandler('drp-duty:OnDutyADA', function()
	if PublicService == false then
		TriggerServerEvent('drp-duty:AttemptDutyADA')
	else
		TriggerEvent("DoLongHudText",'You are on duty already!', 2)
	end
end)

RegisterNetEvent('drp-duty:OffDutyADA')
AddEventHandler('drp-duty:OffDutyADA', function()
	if ADAService == true then
		ADAService = false
		TriggerServerEvent("jobssystem:jobs", "unemployed")
		TriggerEvent("DoLongHudText",'Signed off Duty!',1)
	else
		TriggerEvent("DoLongHudText",'You are not on duty!', 2)
	end
end)

RegisterNetEvent('drp-duty:ADASuccess')
AddEventHandler('drp-duty:ADASuccess', function()
	if ADAService == false then
		ADAService = true
	else
		TriggerEvent("DoLongHudText",'You are on duty already!', 2)
	end
end)

-- PDM Duty --

local PDMService = false

RegisterNetEvent('drp-duty:PDMMenu')
AddEventHandler('drp-duty:PDMMenu', function()
	TriggerEvent('drp-context:sendMenu', {
        {
            id = 1,
            header = "Sign In / Off ",
            txt = ""
        },
        {
            id = 2,
            header = "Signing On Duty",
			txt = "Use this to sign in",
			params = {
                event = "drp-duty:OnDutyPDM"
            }
        },
		{
            id = 3,
            header = "Signing Off Duty",
			txt = "Use this to sign off",
			params = {
                event = "drp-duty:OffDutyPDM"
            }
        },
    })
end)

RegisterNetEvent('drp-duty:OnDutyPDM')
AddEventHandler('drp-duty:OnDutyPDM', function()
	if PDMService == false then
		TriggerServerEvent('drp-duty:AttemptDutyPDM')
	else
		TriggerEvent("DoLongHudText",'You are on duty already!', 2)
	end
end)

RegisterNetEvent('drp-duty:OffDutyPDM')
AddEventHandler('drp-duty:OffDutyPDM', function()
	if PDMService == true then
		PDMService = false
		TriggerServerEvent("jobssystem:jobs", "unemployed")
		TriggerEvent("DoLongHudText",'Signed off Duty!',1)
	else
		TriggerEvent("DoLongHudText",'You are not on duty!', 2)
	end
end)

RegisterNetEvent('drp-duty:PDMSuccess')
AddEventHandler('drp-duty:PDMSuccess', function()
	if PDMService == false then
		PDMService = true
	else
		TriggerEvent("DoLongHudText",'You are on duty already!', 2)
	end
end)

-- Sanders Duty --

local SandersService = false

RegisterNetEvent('drp-duty:SandersMenu')
AddEventHandler('drp-duty:SandersMenu', function()
	TriggerEvent('drp-context:sendMenu', {
        {
            id = 1,
            header = "Sign In / Off ",
            txt = ""
        },
        {
            id = 2,
            header = "Signing On Duty",
			txt = "Use this to sign in",
			params = {
                event = "drp-duty:OnDutySanders"
            }
        },
		{
            id = 3,
            header = "Signing Off Duty",
			txt = "Use this to sign off",
			params = {
                event = "drp-duty:OffDutySanders"
            }
        },
    })
end)

RegisterNetEvent('drp-duty:OnDutySanders')
AddEventHandler('drp-duty:OnDutySanders', function()
	if SandersService == false then
		TriggerServerEvent('drp-duty:AttemptDutySanders')
	else
		TriggerEvent("DoLongHudText",'You are on duty already!', 2)
	end
end)

RegisterNetEvent('drp-duty:OffDutySanders')
AddEventHandler('drp-duty:OffDutySanders', function()
	if SandersService == true then
		SandersService = false
		TriggerServerEvent("jobssystem:jobs", "unemployed")
		TriggerEvent("DoLongHudText",'Signed off Duty!',1)
	else
		TriggerEvent("DoLongHudText",'You are not on duty!', 2)
	end
end)

RegisterNetEvent('drp-duty:SandersSuccess')
AddEventHandler('drp-duty:SandersSuccess', function()
	if SandersService == false then
		SandersService = true
	else
		TriggerEvent("DoLongHudText",'You are on duty already!', 2)
	end
end)

-- Sanders Duty --

local TowService = false

RegisterNetEvent('drp-duty:TowMenu')
AddEventHandler('drp-duty:TowMenu', function()
	TriggerEvent('drp-context:sendMenu', {
        {
            id = 1,
            header = "Tow Menu",
            txt = ""
        },
        {
            id = 2,
            header = "Signing On Duty",
			txt = "Use this to sign in",
			params = {
                event = "drp-duty:OnDutyTow"
            }
        },
		{
            id = 3,
            header = "Signing Off Duty",
			txt = "Use this to sign off",
			params = {
                event = "drp-duty:OffDutyTow"
            }
        },
		{
            id = 4,
            header = "Repo Records",
			txt = "Access Repo Records",
			params = {
                event = "search:list:repotow"
            }
        },
		{
            id = 4,
            header = "Retrieve Vehicle",
			txt = "Remove vehicle from Impound",
			params = {
                event = "search:list:reporetrieve"
            }
        },
		{
            id = 4,
            header = "Reposses Vehicle",
			txt = "Access Repo Records",
			params = {
                event = "search:list:reporepo"
            }
        },
    })
end) 

RegisterNetEvent('drp-duty:OnDutyTow')
AddEventHandler('drp-duty:OnDutyTow', function()
	if TowService == false then
		TriggerServerEvent('drp-duty:AttemptDutyTow')
	else
		TriggerEvent("DoLongHudText",'You are on duty already!', 2)
	end
end)

RegisterNetEvent('drp-duty:OffDutyTow')
AddEventHandler('drp-duty:OffDutyTow', function()
	if TowService == true then
		TowService = false
		TriggerServerEvent("jobssystem:jobs", "unemployed")
		TriggerEvent("DoLongHudText",'Signed off Duty!',1)
	else
		TriggerEvent("DoLongHudText",'You are not on duty!', 2)
	end
end)

RegisterNetEvent('drp-duty:TowSuccess')
AddEventHandler('drp-duty:TowSuccess', function()
	if TowService == false then
		TowService = true
	else
		TriggerEvent("DoLongHudText",'You are on duty already!', 2)
	end
end)

RegisterCommand('pdduty', function()
	TriggerEvent('drp-duty:OnDuty')
end)
RegisterCommand('pddutyoff', function()
	TriggerEvent('drp-duty:OffDuty')
end)

-- In N Out Duty --

local ClockedOnAsInNOut = false

RegisterNetEvent('drp-duty:in-n-out:clockin')
AddEventHandler('drp-duty:in-n-out:clockin', function()
	TriggerEvent('drp-context:sendMenu', {
        {
            id = 1,
            header = "Sign In / Off ",
            txt = ""
        },
        {
            id = 2,
            header = "Signing On Duty",
			txt = "Use this to sign in",
			params = {
                event = "drp-duty:on-in-n-out"
            }
        },
		{
            id = 3,
            header = "Signing Off Duty",
			txt = "Use this to sign off",
			params = {
                event = "drp-duty:off-duty-in-n-out"
            }
        },
    })
end)

RegisterNetEvent('drp-duty:on-in-n-out')
AddEventHandler('drp-duty:on-in-n-out', function()
	if ClockedOnAsInNOut == false then
		TriggerServerEvent('drp-duty:attempt-in-n-out:duty')
	else
		TriggerEvent("DoLongHudText",'You are on duty already!', 2)
	end
end)

RegisterNetEvent('drp-duty:off-duty-in-n-out')
AddEventHandler('drp-duty:off-duty-in-n-out', function()
	if ClockedOnAsInNOut == true then
		ClockedOnAsInNOut = false
		TriggerServerEvent("jobssystem:jobs", "unemployed")
		TriggerEvent("DoLongHudText",'Signed off Duty!',1)
	else
		TriggerEvent("DoLongHudText",'You are not on duty!', 2)
	end
end)

RegisterNetEvent('drp-duty:in-n-out:successful')
AddEventHandler('drp-duty:in-n-out:successful', function()
	if ClockedOnAsInNOut == false then
		ClockedOnAsInNOut = true
	else
		TriggerEvent("DoLongHudText",'You are on duty already!', 2)
	end
end)


curpol = 0

RegisterNetEvent('job:policecount')
AddEventHandler('job:policecount', function(currentCops)

	curpol = currentCops
end)

function LawAmount()
	return curpol
end



-- DOJ Duty --

local ClockedInAsJudge = false

local ClockedInAsPublicDefender = false

local ClockedInAsDistrictAttorney = false

RegisterNetEvent('drp-duty:doj_board')
AddEventHandler('drp-duty:doj_board', function()
	TriggerEvent('drp-context:sendMenu', {
        {
            id = 1,
            header = "DOJ Duty Board",
            txt = ""
        },
        {
            id = 2,
            header = "Judge Duty",
			txt = "Use this to sign in as a judge !",
			params = {
                event = "drp-duty:clock_in:judge_context"
            }
        },
		{
            id = 3,
            header = "Public Defender Duty",
			txt = "Use this to sign in as a Public Defender",
			params = {
				event = "drp-duty:clock_in:public_defender_context"
            }
        },
		{
            id = 4,
            header = "District Attorney Duty",
			txt = "Use this to sign in as a District Attorney",
			params = {
				event = "drp-duty:clock_in:district_attorney_context"
            }
        },
    })
end)

-- Judge --

RegisterNetEvent('drp-duty:clock_in:judge_context')
AddEventHandler('drp-duty:clock_in:judge_context', function()
	TriggerEvent('drp-context:sendMenu', {
		{
            id = 1,
            header = "< Go Back",
			txt = "",
			params = {
                event = "drp-duty:doj_board"
            }
        },
        {
            id = 2,
            header = "Sign In",
			txt = "",
			params = {
                event = "drp-duty:clock_in:judge"
            }
        },
		{
            id = 3,
            header = "Sign Out",
			txt = "",
			params = {
				event = "drp-duty:clock_out:judge"
            }
        },
    })
end)

RegisterNetEvent('drp-duty:clock_in:judge')
AddEventHandler('drp-duty:clock_in:judge', function()
	if ClockedInAsJudge == false then
		TriggerServerEvent('drp-duty:attempt_duty:judge')
	else
		TriggerEvent("DoLongHudText",'You are on duty already!', 2)
	end
end)

RegisterNetEvent('drp-duty:clock_out:judge')
AddEventHandler('drp-duty:clock_out:judge', function()
	if ClockedInAsJudge == true then
		ClockedInAsJudge = false
		TriggerServerEvent("jobssystem:jobs", "unemployed")
		TriggerEvent("DoLongHudText",'Signed out. You are no longer a Judge', 2)
	else
		TriggerEvent("DoLongHudText",'You was never clocked in as a Judge', 2)
	end
end)

RegisterNetEvent('drp-duty:clocked_in:judge_successful')
AddEventHandler('drp-duty:clocked_in:judge_successful', function()
	if ClockedInAsJudge == false then
		ClockedInAsJudge = true
	else
		TriggerEvent("DoLongHudText",'You are already clocked in as a Judge', 2)
	end
end)

-- Public Defender --

RegisterNetEvent('drp-duty:clock_in:public_defender_context')
AddEventHandler('drp-duty:clock_in:public_defender_context', function()
	TriggerEvent('drp-context:sendMenu', {
		{
            id = 1,
            header = "< Go Back",
			txt = "",
			params = {
                event = "drp-duty:doj_board"
            }
        },
        {
            id = 2,
            header = "Sign In",
			txt = "",
			params = {
                event = "drp-duty:clock_in:public_defender"
            }
        },
		{
            id = 3,
            header = "Sign Out",
			txt = "",
			params = {
				event = "drp-duty:clock_out:public_defender"
            }
        },
    })
end)

RegisterNetEvent('drp-duty:clock_in:public_defender')
AddEventHandler('drp-duty:clock_in:public_defender', function()
	if ClockedInAsPublicDefender == false then
		TriggerServerEvent('drp-duty:attempt_duty:public_defender')
	else
		TriggerEvent("DoLongHudText",'You are on duty already!', 2)
	end
end)

RegisterNetEvent('drp-duty:clock_out:public_defender')
AddEventHandler('drp-duty:clock_out:public_defender', function()
	if ClockedInAsPublicDefender == true then
		ClockedInAsPublicDefender = false
		TriggerServerEvent("jobssystem:jobs", "unemployed")
		TriggerEvent("DoLongHudText",'Signed out. You are no longer a Public Defender', 2)
	else
		TriggerEvent("DoLongHudText",'You was never clocked in as a Public Defender', 2)
	end
end)

RegisterNetEvent('drp-duty:clocked_in:public_defender_successful')
AddEventHandler('drp-duty:clocked_in:public_defender_successful', function()
	if ClockedInAsPublicDefender == false then
		ClockedInAsPublicDefender = true
	else
		TriggerEvent("DoLongHudText",'You are already clocked in as a Public Defender', 2)
	end
end)

-- District Attorney --

RegisterNetEvent('drp-duty:clock_in:district_attorney_context')
AddEventHandler('drp-duty:clock_in:district_attorney_context', function()
	TriggerEvent('drp-context:sendMenu', {
		{
            id = 1,
            header = "< Go Back",
			txt = "",
			params = {
                event = "drp-duty:doj_board"
            }
        },
        {
            id = 2,
            header = "Sign In",
			txt = "",
			params = {
                event = "drp-duty:clock_in:district_attorney"
            }
        },
		{
            id = 3,
            header = "Sign Out",
			txt = "",
			params = {
				event = "drp-duty:clock_out:district_attorney"
            }
        },
    })
end)

RegisterNetEvent('drp-duty:clock_in:district_attorney')
AddEventHandler('drp-duty:clock_in:district_attorney', function()
	if ClockedInAsDistrictAttorney == false then
		TriggerServerEvent('drp-duty:attempt_duty:district_attorney')
	else
		TriggerEvent("DoLongHudText",'You are on duty already!', 2)
	end
end)

RegisterNetEvent('drp-duty:clock_out:district_attorney')
AddEventHandler('drp-duty:clock_out:district_attorney', function()
	if ClockedInAsDistrictAttorney == true then
		ClockedInAsDistrictAttorney = false
		TriggerServerEvent("jobssystem:jobs", "unemployed")
		TriggerEvent("DoLongHudText",'Signed out. You are no longer a District Attorney', 2)
	else
		TriggerEvent("DoLongHudText",'You was never clocked in as a District Attorney', 2)
	end
end)

RegisterNetEvent('drp-duty:clocked_in:district_attorney_successful')
AddEventHandler('drp-duty:clocked_in:district_attorney_successful', function()
	if ClockedInAsDistrictAttorney == false then
		ClockedInAsDistrictAttorney = true
	else
		TriggerEvent("DoLongHudText",'You are already clocked in as a District Attorney', 2)
	end
end)