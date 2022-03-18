game 'common'
fx_version 'bodacious'

client_scripts {
    '@drp-lib/client/cl_rpcother.lua',
    'client/*.lua',
    'shared/sh*.lua',
}

server_scripts {
    '@drp-lib/server/sv_rpcother.lua',
    '@drp-lib/server/sv_sql.lua',
    'server/*.lua',
    'shared/sh*.lua',
}
