this_is_a_map "yes"
fx_version 'bodacious'
game 'gta5'

ui_page {
    'html/ui.html',
}

lua54 'yes'

client_scripts {
    'client/client.lua',
	'@drp-rpc/client/cl_main.lua',
}


server_scripts {
	'@drp-rpc/server/sv_main.lua',
    'server/server.lua',
}


files {
	'html/ui.html',
	'html/assets/*.png',
	'html/css/*.css',
	'html/js/*.js',

}