games {'gta5'}

fx_version 'cerulean'

description "actionbar"

client_scripts {
  "@drp-errorlog/client/cl_errorlog.lua",
  '@drp-lib/client/cl_rpc.lua',
  "client.lua",
}

shared_script {
  '@drp-lib/shared/sh_util.lua'
}
server_scripts {
  '@drp-lib/server/sv_rpc.lua',
  '@drp-lib/server/sv_sql.lua',
}
