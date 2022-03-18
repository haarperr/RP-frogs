fx_version 'cerulean'
games {'gta5'}

-- dependency "drp-base"
-- dependency "ghmattimysql"


client_script "@drp-errorlog/client/cl_errorlog.lua"


client_script {
	'util/xml.lua',
	'client/ytyp/*',
	'client/cl_ytyp.lua',
	
}

exports {
	'request',
} 