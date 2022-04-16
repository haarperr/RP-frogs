fx_version 'cerulean'
games { 'gta5' }

client_script "@npx/client/lib.js"
server_script "@npx/server/lib.js"
shared_script "@npx/shared/lib.lua"

client_script "@drp-errorlog/client/cl_errorlog.lua"
client_script '@drp-locales/client/lib.lua'
client_script "@drp-lib/client/cl_ui.lua"

client_scripts {
  'client/cl_*.lua',
  '@drp-rpc/client/cl_main.lua',
  '@drp-lib/client/cl_rpcother.lua',
}

shared_script {
  'sh_config.lua',
}

server_scripts {
  'server/sv_*.lua',
  '@drp-rpc/server/sv_main.lua',
  '@drp-lib/server/sv_rpcother.lua',
  '@drp-lib/server/sv_sql.lua',
}


ui_page ('ui/index.html')

files {
  'ui/*'
}
