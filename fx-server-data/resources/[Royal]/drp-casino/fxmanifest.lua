fx_version 'cerulean'
games { 'gta5' }

--[[ dependencies {
  "drp-polyzone",
  "drp-lib",
  "drp-ui"
} ]]--

client_script "@drp-lib/client/cl_ui.lua"
client_script "@drp-locales/client/lib.lua"

client_scripts {
  '@drp-lib/client/cl_rpc.lua',
  'client/cl_*.lua',
  'client/cl_*.js',
  "@PolyZone/client.lua",
  "@PolyZone/ComboZone.lua",
}

shared_script {
  '@drp-lib/shared/sh_util.lua',
  'shared/sh_*.*',
}

server_script "@drp-lib/server/sv_npx.js"
server_scripts {
  '@drp-lib/server/sv_asyncExports.lua',
  '@drp-lib/server/sv_rpc.lua',
  '@drp-lib/server/sv_rpc.js',
  '@drp-lib/server/sv_sql.lua',
  '@drp-lib/server/sv_sql.js',
  'server/sv_*.lua',
  'server/sv_*.js',
}
