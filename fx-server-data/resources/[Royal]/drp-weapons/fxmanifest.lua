fx_version 'bodacious'
game 'gta5'
description "Weapons"

dependencies  {
  "damage-events"
}

client_script 'client.lua'
server_script 'server.lua'

client_scripts {
  "@drp-errorlog/client/cl_errorlog.lua",
  "@drp-lib/client/cl_rpc.lua",
  "modes.lua",
  "melee.lua",
  "pickups.lua"
}

shared_script {
  "@drp-lib/shared/sh_util.lua"
}

server_scripts {
  "@drp-lib/server/sv_rpc.lua",
  "@drp-lib/server/sv_sql.lua",
}

server_export 'getWeaponMetaData'
server_export "updateWeaponMetaData"

exports{
	'toName',
	'findModel'
}