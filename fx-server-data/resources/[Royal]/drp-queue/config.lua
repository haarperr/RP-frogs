Config = {
	Default_Prio = 500000, -- This is the default priority value if a discord isn't found
	AllowedPerTick = 6, -- How many players should we allow to connect at a time?
	HostDisplayQueue = false,
	onlyActiveWhenFull = false,
	Requirements = { -- A player must have the identifier to be allowed into the server
		Discord = true,
		Steam = true
	},
	WhitelistRequired = true, -- If this option is set to true, a player must have a role in Config.Rankings to be allowed into the server
	Debug = true,
	Webhook = 'https://discord.com/api/webhooks/956353404878331935/-1rf_W71i6Fmh2-vfN0niVvdTMcD00QjvZe0TYXnbiB22hY1wf6GEkNhamuwEywzIGQL',
	Displays = {
		Prefix = '[RPFrogsQueue]',
		ConnectingLoop = { 
			'🦡🌿🦡🌿🦡🌿',
			'🌿🦡🌿🦡🌿🦡',
			'🦡🌿🦡🌿🦡🥦',
			'🌿🦡🌿🦡🥦🦡',
			'🦡🌿🦡🥦🦡🥦',
			'🌿🦡🥦🦡🥦🦡',
			'🦡🥦🦡🥦🦡🥦',
			'🥦🦡🥦🦡🥦🦡',
			'🦡🥦🦡🥦🦡🌿',
			'🥦🦡🥦🦡🌿🦡',
			'🦡🥦🦡🌿🦡🌿',
			'🥦🦡🌿🦡🌿🦡',
		},
		Messages = {
			MSG_CONNECTING = 'Your position in queue [{QUEUE_NUM}/{QUEUE_MAX}]: ', -- Default message if they have no discord roles 
			MSG_CONNECTED = 'Dont Quit! Loading in now...',
			MSG_DISCORD_REQUIRED = 'Discord ID Not Found',
			MSG_STEAM_REQUIRED = 'Steam GUID Not Found',
			MSG_NOT_WHITELISTED = 'Not whitelisted - Join us at discord.gg/rpfrog',
		},
	},
}

Config.Rankings = {
	-- LOWER NUMBER === HIGHER PRIORITY 
	-- ['roleID'] = {rolePriority, connectQueueMessage},
	['956067351567159336'] = {30000, "Your position in queue [{QUEUE_NUM}/{QUEUE_MAX}]:"}, -- EMS
	['956067344927576095'] = {300, "Your position in queue (EMS Queue) [{QUEUE_NUM}/{QUEUE_MAX}]:"}, -- EMS
	['956067335268081694'] = {300, "Your position in queue (Police Queue) [{QUEUE_NUM}/{QUEUE_MAX}]:"}, -- PD 
	['956067315072507935'] = {50, "Your position in queue (Staff Queue) [{QUEUE_NUM}/{QUEUE_MAX}]:"}, -- Staff
	['956067314401443891'] = {1, "Your position in queue (Management Queue) [{QUEUE_NUM}/{QUEUE_MAX}]:"}, -- Management
}