fx_version 'cerulean'
game "gta5"

name 'rpfrogs-blackjack'
description 'gamba'

shared_scripts {
	'coords.lua',
	'@drp-lib/import.lua'
}

client_script 'timing.lua'
client_script 'client.lua'
server_script 'server.lua'

pizza_topping "pineapple"