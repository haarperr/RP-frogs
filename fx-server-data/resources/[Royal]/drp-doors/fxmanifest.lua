fx_version 'cerulean'

games {
  'gta5',
  'rdr3'
}

client_scripts {
  '@drp-lib/client/cl_main.lua',
	'client/cl_*.lua'
}

shared_scripts {
	"shared/*.lua"
}

server_scripts {
  '@drp-lib/client/sv_main.lua',
	'server/*.lua'
}