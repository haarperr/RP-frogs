fx_version 'cerulean'
game 'gta5'
description 'VoidRP Houserobberies'
version '1.0.0'
ui_page 'nui/index.html'

dependency "isPed"


files {
  "nui/index.html",
  "nui/scripts.js",
  "nui/css/style.css",
}

client_scripts {
	'config.lua',
	'@drp-lib/client/cl_rpc.lua',
	'client/*.lua'
}

server_scripts {
	'config.lua',
	'@drp-lib/server/sv_rpc.lua',
	'server/*.lua'
}

shared_scripts { 
	'@drp-lib/shared/sh_util.lua',
}