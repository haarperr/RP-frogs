fx_version 'cerulean'
games { 'gta5' }

dependencies {
  "PolyZone"
}

client_script "@drp-lib/client/cl_ui.lua"
client_script "config.lua"

client_scripts {
  "@PolyZone/client.lua",
  "@PolyZone/BoxZone.lua",
  "@PolyZone/CircleZone.lua",
  "@PolyZone/ComboZone.lua",
  "@PolyZone/EntityZone.lua",
  '@drp-errorlog/client/cl_errorlog.lua',
  '@drp-lib/client/cl_rpc.lua',
  'client/cl_*.lua'
}


shared_script 'shared/sh_*.*'

server_scripts {
    '@drp-lib/server/sv_rpc.lua',
    '@drp-lib/server/sv_sql.lua',
    'server/sv_*.lua',
}

export "getModule"