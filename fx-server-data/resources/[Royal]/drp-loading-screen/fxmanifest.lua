fx_version 'cerulean'
games { 'gta5' }

description 'iconic-loadingscreen'
version '1.0'
author 'Incern#0001'

files {
	'ui.html',
	'html/*',
	'assets/*',
}

loadscreen_manual_shutdown "yes"

client_script "client.lua"

loadscreen {
	'ui.html'
}