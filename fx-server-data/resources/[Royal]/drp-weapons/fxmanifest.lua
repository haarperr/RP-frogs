fx_version 'bodacious'
game 'gta5'

resource_manifest_version '05cfa83c-a124-4cfa-a768-c24a5811d8f9'

client_script 'client.lua'
server_script 'server.lua'


client_scripts {
	"@drp-errorlog/client/cl_errorlog.lua",
	"@drp-lib/client/cl_rpc.lua",
	"modes.lua",
	"melee.lua",
	"pickups.lua"
  }

server_export 'getWeaponMetaData'
server_export "updateWeaponMetaData"

exports{
	'toName',
	'findModel'
}
