function AddTextEntry(key, value)
	Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), key, value)
end

Citizen.CreateThread(function()
	--Generic Liveries
	AddTextEntry("LIV_AP", "AP")
	AddTextEntry("LIV_FLAME", "Flame")
	AddTextEntry("LIV_JESSE", "Jesse")
	AddTextEntry("LIV_SRT", "SRT Demon")
	AddTextEntry("LIV_CERB", "Cerberus")
	--CVPI/Police Generic
	AddTextEntry('RETIN_LIV9','West Bromwich Constabulary')
	AddTextEntry('0xD0A61B6B','San Andreas Pursuit Interceptors')
	AddTextEntry('0xF792CF90','Roll Cage')
	AddTextEntry('0xAF357E34','Roll Cage & Rifle Rack')
	AddTextEntry('0x7CC58E60','State Range Antenna')
	AddTextEntry('0xF58E4969','Widebar Rambar')
	AddTextEntry('0x1224EA34','Slicktop')
	AddTextEntry('NPOL_SLICK2','Slicktop')
	AddTextEntry('0xFECF3A9D','ALPR Cameras(PD)')
	AddTextEntry('NPOL_ALPR2','ALPR Cameras & Aero Package')
	AddTextEntry('0x5A48C963','LSPD City Range')
	AddTextEntry('0x680EE4EF','BCSO County Range')
	AddTextEntry('0x9F06D2E2','SASP State Range')
	AddTextEntry('0x2D6614AF','MDT, Radio & Wisen Siren Controller')
	AddTextEntry('0x27A45995','Dash Radar')
	AddTextEntry('0xEBBF35CB','LSPD Push Bar')
	AddTextEntry('0xD8F39034','BCSO Bullbar')
	AddTextEntry('0x0852EEF2','SASP/Ranger Wrap-Around Bullbar')
	AddTextEntry('0xD39C39E7','Evidence Case')
	AddTextEntry('0x288EE3C7','Fire Extinguisher')
	AddTextEntry('0x1A50474A','Cases & Extinguisher')
	AddTextEntry('0xF5DF543C','Divider')
	AddTextEntry('0xFFAD955D','Divider & Gunrack')
	AddTextEntry('0x7CEDE162','Reading Light')
	AddTextEntry('0xF512A148','Add Rear Seats/Remove K9 Cage')
	AddTextEntry('0x1C7478CB','0')
	AddTextEntry('0x2E4D1C7C','1')
	AddTextEntry('0xB18F2302','2')
	AddTextEntry('0xC06EC0C1','3')
	AddTextEntry('0xD54CEA7D','4')
	AddTextEntry('0xE8038FEA','5')
	AddTextEntry('0xA39B0722','6')
	AddTextEntry('0xB4DA29A0','7')
	AddTextEntry('0xC7BCCF65','8')
	AddTextEntry('0xD956F299','9')
	AddTextEntry('0x2F618B3A','Los Santos Police Department')
	AddTextEntry('0xCD32C6DA','Los Santos Police Department K9')
	AddTextEntry('0xDAC66201','Blaine County Sheriffs Office')
	AddTextEntry('0x28C1FDFB','Blaine County Sheriffs Office K9')
	AddTextEntry('0xF64A190C','San Andreas State Police')
	AddTextEntry('0xB8A21DB5','San Andreas State Police K9')
	AddTextEntry('0xC67AB966','Department of Corrections')
	AddTextEntry('0xD420D4B2','San Andreas Park Rangers')
	AddTextEntry('0xE1D6701D','San Andreas Park Rangers K9')
	AddTextEntry('0x9A8132FD','Unmarked/Decommissioned')
	AddTextEntry('0x8C229640','San Andreas State Police V2')
	AddTextEntry('0x75BC6974','San Andreas State Police K9 V2')
	AddTextEntry('0x6676CAE9','Los Santos Police Department V2')
	AddTextEntry('0x306FDEDC','Los Santos Police Department K9 V2')
	AddTextEntry('NPOL_LIV17','BCSO Ghost (HC Only)')
	AddTextEntry('NPOL_LIV18','LSPD Ghost (HC Only)')
	AddTextEntry('NPOL_C0_DEP','0 - Patrol')
	AddTextEntry('NPOL_C1_DEP','1 - SCU')
	AddTextEntry('NPOL_C2_DEP','2 - HVTU')
	AddTextEntry('NPOL_C3_DEP','3 - Park Rangers')
	AddTextEntry('NPOL_C4_DEP','4 - S.W.A.T.')
	AddTextEntry('NPOL_C5_DEP','5 - SRU')
	AddTextEntry('NPOL_C6_DEP','6 - BTF')
	AddTextEntry('NPOL_C7_DEP','7')
	AddTextEntry('NPOL_C8_DEP','8')
	AddTextEntry('NPOL_C9_DEP','9')
	AddTextEntry('NPOL_C0_RANK','0 - Cadet')
	AddTextEntry('NPOL_C1_RANK','1 - Solo Cadet')
	AddTextEntry('NPOL_C2_RANK','2 - Officer / Deputy')
	AddTextEntry('NPOL_C3_RANK','3 - Sr Officer / Deputy')
	AddTextEntry('NPOL_C4_RANK','4 - Corporal')
	AddTextEntry('NPOL_C5_RANK','5 - Sergeant')
	AddTextEntry('NPOL_C6_RANK','6 - Lieutenant')
	AddTextEntry('NPOL_C7_RANK','7 - Captain')
	AddTextEntry('NPOL_C8_RANK','8 - Ass. Chief / Undersheriff ')
	AddTextEntry('NPOL_C9_RANK','9 - Chief of Police / Sheriff')

	--Police Flags
	AddTextEntry("FLAG_001", "United States of America")
	AddTextEntry("FLAG_002", "Australia")
	AddTextEntry("FLAG_003", "Brazil")
	AddTextEntry("FLAG_004", "Spain")
	AddTextEntry("FLAG_005", "Canada")
	AddTextEntry("FLAG_006", "United Kingdom")
	AddTextEntry("FLAG_007", "Scotland")
	AddTextEntry("FLAG_008", "Japan")
	AddTextEntry("FLAG_009", "Germany")
	AddTextEntry("FLAG_010", "France")
	AddTextEntry("FLAG_011", "Italy")
	AddTextEntry("FLAG_012", "Switzerland")
	AddTextEntry("FLAG_013", "Jamaica")
	AddTextEntry("FLAG_014", "Colombia")
	AddTextEntry("FLAG_015", "Norway")
	AddTextEntry("FLAG_016", "Russia")
	AddTextEntry("FLAG_017", "South Africa")
	AddTextEntry("FLAG_018", "Mexico")
	AddTextEntry("FLAG_019", "Belgium")
	AddTextEntry("FLAG_020", "Sweden")
	AddTextEntry("FLAG_021", "Argentina")
	AddTextEntry("FLAG_022", "Turkey")
	AddTextEntry("FLAG_023", "Ireland")
	AddTextEntry("FLAG_024", "Wales")
	AddTextEntry("FLAG_025", "England")
	--Police Stickers
	AddTextEntry("STICKER_SAPR", "Park Rangers")
	AddTextEntry("STICKER_K9", "K9")
	AddTextEntry("STICKER_SPONS_1", "NP Cards")
	AddTextEntry("STICKER_202", "A_202")
	AddTextEntry("STICKER_238", "A_238")
	AddTextEntry("STICKER_255", "A_255")
	AddTextEntry("STICKER_331", "A_331")
	AddTextEntry("STICKER_337", "A_337")
	AddTextEntry("STICKER_355", "A_355")
	AddTextEntry("STICKER_397", "A_397")
	AddTextEntry("STICKER_402", "A_402")
	AddTextEntry("STICKER_423", "A_423")
	AddTextEntry("STICKER_455", "A_455")
	AddTextEntry("STICKER_460", "A_460")
	AddTextEntry("STICKER_469", "A_469")
	AddTextEntry("STICKER_485", "A_485")
	AddTextEntry("STICKER_B_215", "B_215")
	AddTextEntry("STICKER_B_270", "B_270")
	AddTextEntry("STICKER_B_319", "B_319")
	AddTextEntry("STICKER_B_385", "B_385")
	AddTextEntry("STICKER_B_431", "B_431")
	AddTextEntry("STICKER_B_447", "B_447")
	AddTextEntry("STICKER_B_451", "B_451")
	AddTextEntry("STICKER_B_484", "B_484")
	AddTextEntry("STICKER_B_490", "B_490")
	--Charger
	AddTextEntry("NPOLCHAR_BBAR_1", "Widebar")
	AddTextEntry("NPOLCHAR_BBAR_2", "Widebar for Hellcat Conversion (SRU Leaders)")
	AddTextEntry("NPOL_CHAR_CONVER", "Hellcat Conversion (SRU Leaders)")
	AddTextEntry("NPOLCHAR_LIV_SASP2", "SASP Snow Leopard HP")
	AddTextEntry("NPOL_SLICK3", "Slicktop")
	AddTextEntry("NPOL_SLICK4", "Performance Package")
	AddTextEntry("NPOLCHAR_SPL0", "SRT Spoiler (Cpt+)")
	AddTextEntry("NPOLCHAR_SPL1", "Hellcat Spoiler (SRU Leaders)")
	--Explorer
	AddTextEntry("NPOLEXP_ANT1", "LSPD City Range")
	AddTextEntry("NPOLEXP_ANT2", "State & County Range")
	AddTextEntry("NPOLEXP_BBAR_1", "Widebar")
	-- Generic Spoiler
	AddTextEntry("NULL_SPOILER", "Aero package")
	--M5
	AddTextEntry("DIABLO_LIV1", "RAMP CAR LIVERY HAHAHAHA")
	--M5
	AddTextEntry("F10M5_WINGRICE", "Awful Forza Spoiler")
	AddTextEntry("F10M5_SPLITRICE", "Awful Forza Splitter")
	AddTextEntry("F10M5_FCAGE", "Forza Rollcage")
	AddTextEntry("BMW", "BMW")
	AddTextEntry("F10M5", "M5 F10")
	AddTextEntry("F10M5_NFS_EXH_01", "Speedhunters Style 1")
	AddTextEntry("F10M5_NFS_EXH_02", "Speedhunters Style 2")
	AddTextEntry("F10M5_NFS_EXH_02A", "Speedhunters Style 2.5")
	AddTextEntry("F10M5_NFS_EXH_03", "Speedhunters Style 3")
	AddTextEntry("F10M5_NFS_EXH_03A", "Speedhunters Style 3.5")
	AddTextEntry("F10M5_NFS_EXH_04", "Speedhunters Style 4")
	AddTextEntry("F10M5_NFS_EXH_04A", "Speedhunters Style 4.5")
	AddTextEntry("F10M5_NFS_EXH_05", "Speedhunters Style 5")
	AddTextEntry("F10M5_NFS_EXH_06", "Speedhunters Style 6")
	AddTextEntry("F10M5_NFS_EXH_07", "Speedhunters Style 7")
	AddTextEntry("F10M5_NFS_EXH_08", "Speedhunters Style 8")
	AddTextEntry("F10M5_NFS_EXH_09", "Speedhunters Style 9")
	AddTextEntry("F10_M5_BUMR1", "Carbon Rear Bumper")
	AddTextEntry("F10_M5_BUMR1A", "Carbon Rear Bumper W/ Diffuser")
	AddTextEntry("F10_M5_PLUSH_MIRROR", "GVMA Mirror Mascot")
	AddTextEntry("F10_M5_PLUSH_CHASSIS", "GVMA Boot Mascot")
	AddTextEntry("VMT_M5_MASCOT", "Mascots")
	AddTextEntry("F10_M5_PLUSH_ALL", "All The Mascots")
	AddTextEntry("M5_RBSWAP", "Standard Twin Turbo RB26")
	AddTextEntry("M5_RBSWAP_STURBO", "Upgraded Single Turbo RB26")
	AddTextEntry("M5_GRILLE_FULLBLCK", "Black Grille")
	AddTextEntry("M5_GRILLE_FULLBLCK_A", "Black M-Sport Grille")
	AddTextEntry("M5_GRILLE_FULLCHRM", "Chrome Grille")
	AddTextEntry("M5_GRILLE_FULLCHRM_A", "Chrome M-Sport Grille")
	AddTextEntry("M5_GRILLE_CARB", "Carbon Grille")
	AddTextEntry("M5_GRILLE_CARB_A", "Carbon M-Sport Grille")
	AddTextEntry("M5_GRILLE_B_HALFCHRM", "Alt Stock Grille")
	AddTextEntry("M5_GRILLE_B_HALFCHRM_A", "Alt Stock M-Sport Grille")
	AddTextEntry("M5_GRILLE_B_FULLCHRM", "Alt Chrome Grille")
	AddTextEntry("M5_GRILLE_B_FULLCHRM_A", "Alt Chrome M-Sport Grille")
	AddTextEntry("M5_GRILLE_B_FULLBLCK", "Alt Black Grille")
	AddTextEntry("M5_GRILLE_B_FULLBLCK_A", "Alt Black M-Sport Grille")
	AddTextEntry("M5_GRILLE_B_CARB", "Alt Carbon Grille")
	AddTextEntry("M5_GRILLE_B_CARB_A", "Alt Carbon M-Sport Grille")
	AddTextEntry("F10_M5_BUMPER_F1", "Modern Bumper")
	AddTextEntry("F10_M5_BUMPER_F1_ACC", "Modern Bumper W/ Foglights")
	AddTextEntry("F10_M5_BUMPER_F1_ACCA", "Modern Bumper W/ Awful Splitter & Foglights")
	AddTextEntry("F10_M5_BUMPER_F1_ACCB", "Modern Bumper W/ Custom Splitter & Foglights")
	AddTextEntry("F10_M5_BUMPER_F1_ACC2", "Modern Bumper W/ Tinted Foglights")
	AddTextEntry("F10_M5_BUMPER_F1_ACC2A", "Modern Bumper W/ Awful Splitter & Tinted Foglights")
	AddTextEntry("F10_M5_BUMPER_F1_ACC2B", "Modern Bumper W/ Custom Splitter & Tinted Foglights")
	AddTextEntry("F10_M5_HKS_01", "HKS Hi-Power Muffler")
	AddTextEntry("M5_F10_SPLIT_F_01", "Custom Splitter")
	AddTextEntry("M5_F10_SPLIT_F_01B", "Modern Bumper W/ Custom Splitter")
	AddTextEntry("M5_F10_SPLIT_F_01A", "Modern Bumper W/ Awful Splitter")
	AddTextEntry("F10M5_CUSTOMWING_01", "Carbon Stock Spoiler")
	AddTextEntry("F10M5_REMWING", "Remove Spoiler")
	AddTextEntry("M5_F10_SPOILERSTEW", "Custom Spoiler")
	AddTextEntry("M5_F10_SPOILERSTEW_A", "Custom Carbon Spoiler")
	AddTextEntry("F10M5_BUMFACC_01", "Stock Bumper W/ OEM Foglights")
	AddTextEntry("F10M5_BUMFACC_01A", "Stock W/ Awful Splitter & OEM Foglights")
	AddTextEntry("F10M5_BUMFACC_01B", "Stock W/ Custom Splitter & OEM Foglights")
	AddTextEntry("M5_GRILLE_FULLCHRM_C", "Chrome Diamond Grille")
	AddTextEntry("M5_GRILLE_FULLBLCK_C", "Black Diamond Grille")
	AddTextEntry("M5_GRILLE_CARB_C", "Carbon Diamond Grille")
	AddTextEntry("F10_M5_BONNET_CARBON", "Carbon Bonnet")
	AddTextEntry("F10_M5_BON_CUSTOM", "Vented Bonnet")
	AddTextEntry("F10_M5_BON_CUSTOM_B", "Carbon Vented Bonnet")
	AddTextEntry("F10_M5_BON_CUSTOM2", "Custom Vented Bonnet")
	AddTextEntry("F10_M5_BON_CUSTOM2_C", "Carbon Custom Vented Bonnet")
	AddTextEntry("F10_M5_BON_CUSTOM3", "Power Bulge")
	AddTextEntry("F10_M5_BON_CUSTOM3_C", "Carbon Power Bulge")
	AddTextEntry("F10_M5_BON_CUSTOM4", "Power Bulge W/ Vents")
	AddTextEntry("F10_M5_BON_CUSTOM4_C", "Carbon Power Bulge W/ Vents")
	AddTextEntry("F10_M5_WIDE_01", "Custom PD54X Widebody Kit")
	AddTextEntry("F10_M5_ARIEL_01", "Carbon Antenna")
	AddTextEntry("F10_M5_ARIEL_02", "Blanking Plate (Remove Antenna)")
	AddTextEntry("M5_F10_ENG_V10", "Standard E60 M5 V10")
	AddTextEntry("F10M5RC", "RC F10 M5")
	AddTextEntry("F10_M5_LIVERY_1", "BMW M Motorsport")
	--LC500
	AddTextEntry('0x2C4374B9','QNFKR Racer by Flex')
	AddTextEntry('0xFE7D192D','KillaManShankz by SnuggyMonkey')
	AddTextEntry('0x11B9BFA6','KillaManShankz Alt by SnuggyMonkey')
	AddTextEntry('0xE2086044','Rustic Geometric by Auggus')
	AddTextEntry('0xB3678303','Regal by Nixety')
	AddTextEntry('0xC5B5279E','Warhawk by Nixety')
	AddTextEntry('0x96A3C954','Glitch by Becca')
	AddTextEntry('0xA8E66DD9','Samurai by theycamefrombehindd')
	AddTextEntry('0x9E49D8C4','Liberty by Flex')
	AddTextEntry('0x886F8C57','07 by Hippow')
	AddTextEntry('LC500_LIV11','CyberBlack by SnuggyMonkey')
	AddTextEntry('LC500_LIV12','CyberRed by SnuggyMonkey')
	AddTextEntry('LC500_LIV13','Shankz by JacobF')
	AddTextEntry('LC500_LIV14','DodoAK47 by elle')
	AddTextEntry('LC500_LIV15','Bullet Club by auggus')
	--Bentley
	AddTextEntry('0x6251F2A3','The Dragon')
	--GTR C
	AddTextEntry('0xFF1F5E98','Downforce COPIUM')
	--Boxville
	AddTextEntry('0xC33D77CC','NoPixel Cards')
	AddTextEntry('0x81097365','Dodo Logistics')
	AddTextEntry('0x726DD62E','Dodo Prime')
	AddTextEntry('0xA4CA3AEA','Vultur Le Culture')
	--Deluxo
	AddTextEntry('0x850EC7A8','Back to the Future by Viper')
	AddTextEntry('0x6FBE9D08','Black Waves by Kikobri')
	AddTextEntry('0x7994B0B4','Brutal by Brutal')
	AddTextEntry('0x4C11D5AF','Brutal Black by Brutal')
	AddTextEntry('0x563AEA01','Glitch Dark by Clear')
	AddTextEntry('0x0D9A5A69','Glitch Light by Clear')
	AddTextEntry('0x1B287585','Horimono by Hammling')
	AddTextEntry('0x28E91106','Initial D by Viper')
	AddTextEntry('0x46D84CE4','Irezumi by Hammling')
	AddTextEntry('0xCB8FD9BD','6STR by Viper')
	AddTextEntry('0xD01AE2D3','Rooster Black by Clear')
	AddTextEntry('0xA6538F45','Rooster Yellow by Clear')
	AddTextEntry('0xB4A52BE8','Timelord 2077 Blue by SpartanOne')
	AddTextEntry('0x0A71D780','Timelord 2077 Red by SpartanOne')
	AddTextEntry('0x16C0701D','Timelord 2077 White by SpartanOne')
	AddTextEntry('0xED0F1CBB','Vix by Vix')
	AddTextEntry('0xFB94B9C6','White Waves by Kikobri')
	--Mustang
	AddTextEntry('0x1AC92852','RTR Spec2')
	AddTextEntry('0x2C2380BA','Spoiler2')
	AddTextEntry('0x4C1A2A85','Works Motorsport')
	AddTextEntry('0x6FD3F1F8','Eleanor')
	AddTextEntry('0x7DF2EA80','Raijin2')
	AddTextEntry('0x9D8FADDD','Shelby GT350R')
	AddTextEntry('0x1DE74E20','Shelby GT350R')
	AddTextEntry('0x30C1A8A7','Works Motorsport')
	AddTextEntry('0x41F1AC56','Spoiler1')
	AddTextEntry('0x60FA0F67','Mustang Cage')
	AddTextEntry('0x70AF09D0','Shelby GT350R')
	AddTextEntry('0x70B14FFD','Shelby GT350R')
	AddTextEntry('0x85ACF9F0','Works Motorsport')
	AddTextEntry('0x86E73640','RTR Spec5')
	AddTextEntry('0x95BA78B3','RTR Spec2')
	AddTextEntry('0x418E156D','Apollo Edition')
	AddTextEntry('0x683C9DB8','RTR Spec5')
	AddTextEntry('0x776B5D6D','Raijin')
	AddTextEntry('0x8733A0BF','RTR Spec5')
	AddTextEntry('0x9531D2D5','Spoiler3')
	AddTextEntry('0x27905D86','Works Motorsport')
	AddTextEntry('0x303598BD','Eleanor')
	AddTextEntry('0x1397746B','Shelby GT350R')
	AddTextEntry('0x78650322','RTR Spec2')
	AddTextEntry('0xB6C81C42','Ford Mustang GT')
	AddTextEntry('0xB111D0B9','RTR Spec5')
	AddTextEntry('0xB7059BE1','Shelby GT350R')
	AddTextEntry('0xD2F44E49','Mustang GT')
	AddTextEntry('0xE1FA6C65','RTR Spec2')
	--C7
	AddTextEntry('0x4A1931C5','Z06')
	AddTextEntry('0x56DF3703','Z06')
	AddTextEntry('0x342378AB','Chevrolet Corvette Stingray(C7) 14')
	AddTextEntry('0x35966909','Roof')
	AddTextEntry('0xB3A4AA28','Hennessy')
	AddTextEntry('0xC2D17AE5','Z06')
	AddTextEntry('0xC440B206','C7R Edition')
	AddTextEntry('0xCC7F463E','Hennessy')
	AddTextEntry('0xCE8648AE','Hennessy')
	AddTextEntry('0xD94B5B62','Z06')
	AddTextEntry('0xF5ACE7AB','Z06')
	--Challenger
	AddTextEntry('0x23B6AF16','SRT Spoiler')
	--News
	AddTextEntry('0xE3613EAD','LSBN News')
	AddTextEntry('0xD11A9A20','LSBN News Inverse')
	AddTextEntry('0x413AFA63','Weazel News')
	--Everything Else
	AddTextEntry('0x00D6B5EE','Hayes Auto Body Shop')
	AddTextEntry('0xE9225A81','Hayes Auto Body Shop')
	AddTextEntry('0xCB722C8B','Viking Logistics')
	AddTextEntry('0x32AEF9C0','I Fucked the Queen')
	AddTextEntry('0xFB005A4F','Leanbois')
	AddTextEntry('0x09B21C7B','Leanbois (Neon)')
	AddTextEntry('0x5931C6E1','Wu Chang Records')
	AddTextEntry('0x66E7624C','Wu Chang Inverse')
    AddTextEntry('0xFBB193EE','Sentinel SG4')
    AddTextEntry('0xF8C99B0F','Rear Window Louvers')
    AddTextEntry('0xF8A12584','Hot Property')
    AddTextEntry('0x8BDC8DB2','Foglights')
    AddTextEntry('0xD34A5ADF','Zaibatsucorp #90')
    AddTextEntry('0xA289E7EC','STD Stripes II')
    AddTextEntry('0xA54CFEDD','Dynasty 8 #08')
    AddTextEntry('0x46834147','ONO Racing #71')
    AddTextEntry('0x5750966B','UK Rear License Plate')
    AddTextEntry('0x652931FC','Carbon Roof')
    AddTextEntry('0x570750E8','White Vertical Stripes')
    AddTextEntry('0x306699ED','Sentinel Tuning Division Wing')
    AddTextEntry('0x743D8B54','Ripper Roo #23')
    AddTextEntry('0x99B3295F','Racing Foglights')
    AddTextEntry('0x78B4A5AD','Dense #35')
    AddTextEntry('0x8FBD4253','Black Vertical Stripes')
    AddTextEntry('0x8F86D351','Ubermacht STD #03')
    AddTextEntry('0x8EAA288C','Louvers')
    AddTextEntry('0x8BDC8DB2','Foglights')
    AddTextEntry('0x7AE75D78','Carbon Roof w/ Livery Support')
    AddTextEntry('0x6A00E4CA','UK License Plates')
    AddTextEntry('0x5C456CCB','Whiz Fractal #55')
    AddTextEntry('0x4E023EDE','STD Stripes I')
    AddTextEntry('0x3A1278D0','Chrome Exhaust Tips')
    AddTextEntry('0x2A1D887C','Experimental Ubermacht STD #91')
    AddTextEntry('0x0FD1C27E','Zaibatsucorp Street Edition')
    AddTextEntry('0x04BBACC3','Front Plate Delete')
	AddTextEntry("0x20275456","Nitrous")
	AddTextEntry("0x840E5171","100 Shot")
	AddTextEntry("0x98EC7B2D","300 Shot")
	AddTextEntry("0x27B218BA","600 Shot")
	AddTextEntry("0x9E7969A4","Chang Livery")
	AddTextEntry("0xE1FCF0AA","Rat Livery")
	AddTextEntry("0xD792DBD6","Mothership Livery")
	AddTextEntry("0xC4E1B674","Herbert Livery")
	AddTextEntry("0xB31C12E9","Rusty Herbert Livery")
	AddTextEntry("0x702F8D11","Ladybird Livery")
	AddTextEntry("0x5499CB4E","De-chrome")
	AddTextEntry("0x187A5314","De-badge")
	AddTextEntry("0x26C46FA8","Headlight Brows Delete")
	AddTextEntry("0x57538F57","Front Arch Delete")
	AddTextEntry("0x39D75457","Double Arch Delete")
	AddTextEntry("0x6B2146EA","Indicators Delete")
	AddTextEntry("0x845E7964","Primary Paint")
	AddTextEntry("0x4F368F15","Secondary Paint")
	AddTextEntry("0x5978A399","Remove Bumper")
	AddTextEntry("0x236E21B9","Reverse Light Delete")
	AddTextEntry("0x74FC44CC","Primary Paint")
	AddTextEntry("0x86D5687E","Secondary Paint")
	AddTextEntry("0x590B8CEB","Remove Bumper")
	AddTextEntry("0x3DFE2094","Roof Rack")
	AddTextEntry("0x54564D40","Summer Rack")
	AddTextEntry("0x025F295B","Winter Rack")
	AddTextEntry("0x272E72F9","Travel Rack")
	AddTextEntry("0x1C40297C","6STR Ladybird")
	AddTextEntry("0xF6BAE2D4","NA V6")
	AddTextEntry("0x93E91D32","Twin Turbo")
	AddTextEntry("0xA77D84E8","Street Bumper")
	AddTextEntry("0xB5432073","Drift Bumper")
	AddTextEntry("0xA1CD4878","Diffuser")
	AddTextEntry("0x3140BDF0","Headlight Duct")
	AddTextEntry("0x4DCC1248","Vented Hood")
	AddTextEntry("0x637D3DAA","Bulge Hood")
	AddTextEntry("0x54119EF7","Boost Scooper Hood")
	AddTextEntry("0xCE641EC5","Show Car Sponsors Livery")
	AddTextEntry("0x4C269A4C","Drift King Livery")
	AddTextEntry("0xFD196415","Louvres")
	AddTextEntry("0x6D9B404B","Sunstrip")
	AddTextEntry("0x6537AE53","Street Skirt")
	AddTextEntry("0x7CECC885","Factory Wing")
	AddTextEntry("0x6EAA2C00","Annis Race Wing")
	AddTextEntry("0xB44EB748","380 Destiny Wing")
	AddTextEntry("0x8E176ADA","Garage Wing")
	AddTextEntry("0xD60A7ABF","Ducktail")
	AddTextEntry("0xC78BDDC2","Chassis Mount Wing")
	AddTextEntry("0xE9342116","Street Cruiser")
	AddTextEntry("0xDAEE848B","Drift King Wing")
	AddTextEntry("0x3299D5CC","6STR Racing Seats")
	AddTextEntry("0x9584C573","6STR ZR380")
	AddTextEntry("0x15DCB730","6STR Drift Ellie")
	AddTextEntry("0x9F7A7E31","Ragga Rum Livery")
	AddTextEntry("0x9244E40D","Ragga Rum Inverse Livery")
	AddTextEntry("0x425EC43E","6STR Livery")
	AddTextEntry("0x2E259BCC","6STR Inverse Livery")
	AddTextEntry("0x9EE3FC32","Garage Wing")
	AddTextEntry("0x8D2A58BF","Chassis Mount Wing")
	AddTextEntry("0xD61A8209","6STR Steering Wheel")
	AddTextEntry("0xE8E10F86","Street Splitter")
	AddTextEntry("0xF723AC0B","Drift Splitter")
	AddTextEntry("0x0B97D4F3","Competition Splitter")
	AddTextEntry("0x7E04D512","Street Skirt")
	AddTextEntry("0x92DAFEBE","Drift Skirt")
	AddTextEntry("0x62847436","Street Grill")
	AddTextEntry("0x0A4B43B9","Mesh Grill")
	AddTextEntry("0xFB7DA61E","Slot Grill")
	AddTextEntry("0x35A11A70","Remove Grill")
	AddTextEntry("0x27047D2B","LED Street Grill")
	AddTextEntry("0xC27BB41B","LED Mesh Grill")
	AddTextEntry("0xB4A09865","LED Slot Grill")
	AddTextEntry("0xEE5D8BDE","LED Remove Grill")
	AddTextEntry("0xAB281721","Riveted Arches")
	AddTextEntry("0x219104D4","Side Exit Exhaust")
	AddTextEntry("0xF36CA00B","Remove Exhaust")
	AddTextEntry("0x70AE2A28","Carbon Doorcard")
	AddTextEntry("0xAF56E8A3","Diffuser")
	AddTextEntry("0xEEECF5A6","Rockstar")
	AddTextEntry("0xBA098BE0","Old School")
	AddTextEntry("0xCB692E9F","Modern")
	AddTextEntry("0xA680E4CF","Chimneys")
	AddTextEntry("0x376C86AC","Filtered")
	AddTextEntry("0x82E41D96","V Ram Catcher")
	AddTextEntry("0x942C4026","Twin Turbo")
	AddTextEntry("0xA8653211","Sunstrip")
	AddTextEntry("0xFB71611C","Roll Cage")
	AddTextEntry("0x76CD10F6","Drift Setup")
	AddTextEntry("0x49692DBE","Remove Vents & Fuel Cap")
	AddTextEntry("0x9A1CFE17","Livery bumper")
	AddTextEntry("0xCF8FE8FC","Drift splitter")
	AddTextEntry("0x9F29B99D","Cutout grill")
	AddTextEntry("0x1F613A0A","Open grill")
	AddTextEntry("0xC50C0E34","Twin Turbo")
	AddTextEntry("0x42D9C158","Carbon Skirt")
	AddTextEntry("0xB16D09F2","Primary Bed Cap")
	AddTextEntry("0x22F76D05","Secondary Bed Cap")
	AddTextEntry("0xCCC8C0A9","Rustic Bed Cap")
	AddTextEntry("0xAFDB9026","B*tch Lasagna Livery")
	AddTextEntry("0x1483EBAF","Open Wheel spec")
	AddTextEntry("0x232BFC9E","Drift Mirrors")
	AddTextEntry("0x71A7E1A1","Drift Wing")
	AddTextEntry("0x935E2AD9","Hood Dump")
	AddTextEntry("0x6606CA5F","Chassis Mount Wing")
	AddTextEntry("0xA8E74E6C","Prototype Spec")
	AddTextEntry("0xB7723139","6STR Drift Yosemite")
	AddTextEntry("0xA209F483","WiseGuy Livery")
	AddTextEntry("0x6BC68B88","6STR Sentinel Classic")
	AddTextEntry("0xE646E5B9","Titanium Exhaust")
	AddTextEntry("0x78BB0A9B","Chrome Exhaust")
	AddTextEntry("0x9BAA5079","Ceramic Exhaust")
	AddTextEntry("0xD4FFB6FE","Remove Hood")
	AddTextEntry("0x6DA155EB","External Oil Cooler")
	AddTextEntry("0x7835CF18","Antenna")
	AddTextEntry("0x03371C3E","6STR Plate Holder")
	AddTextEntry("0x23ACB951","Sloop Skirt")
	AddTextEntry("0x15F21DDC","Riveted Skirt")
	AddTextEntry("0x7396591F","Riveted Sloop Skirt")
	AddTextEntry("0x65D3BD9A","Sealed Skirt")
	AddTextEntry("0x390563FE","Sealed Sloop Skirt")
	AddTextEntry("0x8E6C9CE4","Ducktail")
	AddTextEntry("0x5677ACFB","Riveted Ducktail")
	AddTextEntry("0xD0B68159","Chopped Kit")
	AddTextEntry("0xC2B3E644","Riveted Kit")
	AddTextEntry("0xAFF940CB","Chopped Riveted Kit")
	AddTextEntry("0xE306A3CD","Sealed Kit")
	AddTextEntry("0xCD8B78CF","Chopped and Sealed Kit")
	AddTextEntry("0xACEAF05F","Secondary Cover")
	AddTextEntry("0x2CDC7048","Chrome Cover")
	AddTextEntry("0x1F22D4D5","Carbon Cover")
	AddTextEntry("0xA62EDC99","Exposed Primary Cover")
	AddTextEntry("0x31E97491","Exposed Secondary Cover")
	AddTextEntry("0x569B5A00","Exposed Chrome Cover")
	AddTextEntry("0xE2287F01","Exposed Carbon Cover")
	AddTextEntry("0xC65FA03C","Primary 6STD Cover")
	AddTextEntry("0xB8030383","Secondary 6STD Cover")
	AddTextEntry("0xEDB56EE7","Chrome 6STD Cover")
	AddTextEntry("0xDB9BCAB4","Carbon 6STD Cover")
	AddTextEntry("0x644D566C","Exposed Primary 6STD Cover")
	AddTextEntry("0xE0BF6C27","Exposed Secondary 6STD Cover")
	AddTextEntry("0x6F0E70F7","Exposed Chrome 6STD Cover")
	AddTextEntry("0xBE3AE89E","Exposed Carbon 6STD Cover")
	AddTextEntry("0x9817726C","Colorable Cam Gears")
	AddTextEntry("0x66250E88","Chrome Cam Gears")
	AddTextEntry("0x737BA935","Kevlar Belt and Colorable Gears")
	AddTextEntry("0x41144467","Kevlar Belt and Chrome Gears")
	AddTextEntry("0x54C4C121","Open Carbs")
	AddTextEntry("0x6C09EFAB","Sport Filters")
	AddTextEntry("0xF8AC88EE","Carbon Race Filters")
	AddTextEntry("0xE839CA85","Twin Turbo Kit")
	AddTextEntry("0x0FB29976","Big Turbo Kit")
	AddTextEntry("0x1DFBB608","1/4 Mile Kit")
	AddTextEntry("0x6C1EBE01","Widebody")
	AddTextEntry("0x709C7CDC","Antenna")
	AddTextEntry("0x99FD478D","Strut Brace")
	AddTextEntry("0x59952A4D","Convertible")
	AddTextEntry("0x0D5A1DBE","Cam Cover")
	AddTextEntry("0x4392FDE8","Cam Gear")
	AddTextEntry("0xE277F7E5","Aspiration")
	AddTextEntry("0x7E3A2D67","Soft Top Down")
	AddTextEntry("0x4FA5FE22","Open Mesh Grill")
	AddTextEntry("0x6967B17C","HockenFart Livery")
	AddTextEntry("0x5B9215D1","6STR Livery")
	AddTextEntry("0xE6C2FBC6","Robin Williams")
	AddTextEntry("0x8B665868","Jordan Henderson")
	AddTextEntry("0x7B1DDD4D","Jobless Gamer")
	AddTextEntry("0x4D00D4F5","Pluvio")
	AddTextEntry("0x7F0D2221","jdmxmonstaz")
	AddTextEntry("0x5253B62E","Colure 7")
	AddTextEntry("0xD600C700","JvyPennant")
	AddTextEntry("0x348B4EC8","Crowned")
	AddTextEntry("0x76F7D707","6STR Chrome Frame")
	AddTextEntry("0xFC3B6980","Tuners and Outlaws Frame")
	AddTextEntry("0xB546BBC4","Tuners and Outlaws Chrome Frame")
	AddTextEntry("0x971BEE4D","6STR Carbon Frame")
	AddTextEntry("0x1150A125","Tuners and Outlaws Carbon Frame")
	AddTextEntry("0xCFC9C90E","6STR Titanium Frame")
	AddTextEntry("0x6EDFF4A8","Tuners and Outlaws Titanium Frame")
	AddTextEntry("0x0D92F68A","6STR Gold Frame")
	AddTextEntry("0x4C3978C0","Tuners and Outlaws Gold Frame")
	AddTextEntry("0x9285ACF4","6STR Nitrous Frame")
	AddTextEntry("0x2D591907","Tuners and Outlaws Nitrous Frame")
	AddTextEntry("0xFC883D6B","6STR Gauntlet Custom")
	AddTextEntry("0xA4F14204","HellPanthaa")
	AddTextEntry("0xB743E6A9","6STR Drag")
	AddTextEntry("0x49A60B6F","6th Street Crew")
	AddTextEntry("0x5BCFAFC2","Bigness")
	AddTextEntry("0x6BF7D012","Classic Gauntlet")
	AddTextEntry("0x7E6E74FF","Concept Stripe")
	AddTextEntry("0x109A9959","Disruption Logistics")
	AddTextEntry("0x250BC23B","X-FLOW by artistraaw")
	AddTextEntry("0x3799E757","Hyman Hotring")
	AddTextEntry("0x542A688F","Meinmacht Geometric")
	AddTextEntry("0xAC2A988E","Six Star Crew")
	AddTextEntry("0xBEDD3DF3","Bravado Power")
	AddTextEntry("0x8885D145","BP Inverted")
	AddTextEntry("0xD3B5C6EC","Bullbous Splitter")
	AddTextEntry("0xE1716263","Bullbous Scraper")
	AddTextEntry("0xAF33FDE9","Bullbous Racer")
	AddTextEntry("0xBCDC993A","Buffalo Bumper")
	AddTextEntry("0xFEF79D73","Buffalo Splitter")
	AddTextEntry("0x0CBC38FC","Buffalo Scraper")
	AddTextEntry("0xD9CDD398","Buffalo Racer")
	AddTextEntry("0x5BCC48B0","Carbon Diffuser")
	AddTextEntry("0x46F85034","Street Skirt")
	AddTextEntry("0x7D7EBD40","Carbon Skirt")
	AddTextEntry("0x26648F0D","Bullbous Smoothed Skirt")
	AddTextEntry("0x54B26BA8","Bullbous Rustic Skirt")
	AddTextEntry("0x643A0ACB","Bullbous Bolt-on Skirt")
	AddTextEntry("0x978B716D","Bullbous Bolt-on Rustic Skirt")
	AddTextEntry("0xB4587564","Bullbous Rustic Arches")
	AddTextEntry("0xA28AD1C9","Bullbous Bolt-on Arches")
	AddTextEntry("0x5AE5C27C","Bullbous Bolt-on Rustic Arches")
	AddTextEntry("0xCCB3FA08","Snout Hood")
	AddTextEntry("0xB1DFC460","Snout Vented Hood")
	AddTextEntry("0xA01A20D5","Quaker Hood")
	AddTextEntry("0x91EC847A","Single Intake Bug Catcher")
	AddTextEntry("0x802EE0FF","Triple Intake Bug Catcher")
	AddTextEntry("0xD7CEA061","Lip Spoiler")
	AddTextEntry("0xCA63058A","Chopped Ducktail")
	AddTextEntry("0xBB47674F","Bullbous Ducktail")
	AddTextEntry("0xADF04CA1","Hotring Pilot Wing")
	AddTextEntry("0x53439155","Ceramic Exhaust")
	AddTextEntry("0x64FD34C8","Titanium Exhaust")
	AddTextEntry("0x27713A15","Chrome Exhaust")
	AddTextEntry("0x0914B276","Chrome Hood Catches")
	AddTextEntry("0x1DE1DC10","Straight Hood Catches")
	AddTextEntry("0x1F0486FE","Mesh Grill")
	AddTextEntry("0x91416B7A","VI Badge Grill")
	AddTextEntry("0x837ECFF5","6STR Badge Grill")
	AddTextEntry("0x677797E7","Hotring Grill")
	AddTextEntry("0xAAE706C7","Headlight Duct")
	AddTextEntry("0xB897A228","Frontal Headlight Duct")
	AddTextEntry("0x8EB8F850","Sunstrip")
	AddTextEntry("0xE087E534","6STR Ruiner Custom")
	AddTextEntry("0x49A4A547","Lip Splitter")
	AddTextEntry("0x3E5E8EBB","Sport Bumper")
	AddTextEntry("0xDB00C7FD","Clean Cut Bumper")
	AddTextEntry("0xCCB6AB69","Pacific Bumper")
	AddTextEntry("0xBE650EC6","Drift Bumper")
	AddTextEntry("0xB023F240","FatNappy Kit")
	AddTextEntry("0x325676A7","FatNappy Kit and Splitter")
	AddTextEntry("0x2187D50A","Drift Missile FatNappy")
	AddTextEntry("0x51F31F9F","Pacific Bumper")
	AddTextEntry("0x5E24B802","FatNappy Colored Diffuser")
	AddTextEntry("0x4F421A41","FatNappy Carbon Diffuser")
	AddTextEntry("0xA5CBC753","FatNappy Bumper Delete")
	AddTextEntry("0xB4A8650C","FatNappy Delete Carbon")
	AddTextEntry("0x6EE713BF","Tuner Exhaust")
	AddTextEntry("0x7C982F21","Titanium Tuner Exhaust")
	AddTextEntry("0xCA514A96","Chrome Tuner Exhaust")
	AddTextEntry("0xD83B666A","Bozo Exhaust")
	AddTextEntry("0xA78B050A","Bozo Titanium Exhaust")
	AddTextEntry("0xB5D9A1A7","Bozo Chrome Exhaust")
	AddTextEntry("0x1F99F526","Big Bore Exhaust")
	AddTextEntry("0xF0281643","Big Bore Titanium Exhaust")
	AddTextEntry("0xFE22B238","Big Bore Chrome Exhaust")
	AddTextEntry("0x4C9C4F2E","FatNappy Exhaust")
	AddTextEntry("0x5ADDEBB1","Backyard Racecar Exhaust")
	AddTextEntry("0xEEEE7353","SEND IT Wing")
	AddTextEntry("0xC3B01CD7","Oppressed Garage Wing")
	AddTextEntry("0xD248BA08","FatNappy Ducktail")
	AddTextEntry("0x194647FE","Chassis Mount Wing")
	AddTextEntry("0xC3C1A112","Vented Pacific Fenders")
	AddTextEntry("0x0EE89242","Pacific Skirt")
	AddTextEntry("0x3AC2E9F6","Drift Skirt")
	AddTextEntry("0xBE680D00","Clean Tail")
	AddTextEntry("0xEEE9B463","6STR Schwartzer Custom")
	AddTextEntry("0x32E0D0C2","6STR Oppressed Garage Wing 1")
	AddTextEntry("0xE4B1B465","6STR Oppressed Garage Wing 2")
	AddTextEntry("0x76C0D8A1","6STR Chassis Mount Wing")
	AddTextEntry("0x7471C2B5","6STR Dreadpipe Exhaust")
	AddTextEntry("0x221A1E07","6STR Chrome Dreadpipe Exhaust")
	AddTextEntry("0x3214BDFC","6STR Ceramic Dreadpipe Exhaust")
	AddTextEntry("0xED53E4C5","6STR Carbon Skirt")
	AddTextEntry("0x75CDD6A0","6STR Bolt-on Pincer Arches")
	AddTextEntry("0x1E892824","6STR Shaved Pincer Arches")
	AddTextEntry("0x111B8D49","6STR Shaved Bolt-on Pincer Arches")
	AddTextEntry("0x9BA055DB","6STR Carbon Splitter")
	AddTextEntry("0xA95DF156","6STR Pincer Canards")
	AddTextEntry("0xF1650163","6STR Splitter and Canards")
	AddTextEntry("0x062B2AEF","6STR Ankle Slicer Splitter")
	AddTextEntry("0xF350D07F","6STR Headlight Cover")
	AddTextEntry("0x22852ECB","6STR Sleepy Eyelids")
	AddTextEntry("0xA6297CC8","6STR Karin Futo GT Custom")
	AddTextEntry("0x023B52B3","6STR Chunky Ducktail")
	AddTextEntry("0x23D55999","6STR Wild Sprint Splitter")
	AddTextEntry("0x2B9516F1","6STR Bolt-On Tofu Chariot Fenders")
	AddTextEntry("0x2CC32526","6STR Wild Sprint Extension")
	AddTextEntry("0x50B95BC8","6STR Wild Sprint Skirt")
	AddTextEntry("0x9A1034C5","Trim Pieces")
	AddTextEntry("0xF2B33BBF","Retro Grill")
	AddTextEntry("0xF509194C","Roll Cage & Fujiwara Decal")
	AddTextEntry("0xFFBEC3B8","Fujiwara Decal")
	AddTextEntry("0x72518827","Roll Cage & Chassis Upgrade")
	AddTextEntry("0x682EDA35","6STR Left Plate")
	AddTextEntry("0x53D8FB71","6STR Exhaust System Burnt Tip")
	AddTextEntry("0x2981A6C3","6STR Exhaust System Chrome Tip")
	AddTextEntry("0x21B98181","6STR Painted Ducktail and Slats")
	AddTextEntry("0xF7122C33","6STR Carbon Ducktail and Slats")
	AddTextEntry("0x349A40DB","6STR Chassis Mounted Wing")
	AddTextEntry("0x80DA559C","6STR FattyNappy Side Skirt")
	AddTextEntry("0xD34004F0","6STR FattyNappy Splitter")
	AddTextEntry("0x8C59A9DD","6STR Tempesta Custom")
	AddTextEntry("0xB7D9F7F1","6STR Drift Tampa V2")
	AddTextEntry("0xA617546C","6STR Drift Tampa V2")
	AddTextEntry("0x9428B08F","6STR Drift Tampa V2")
	AddTextEntry("0x60C32CA6","Six Star Crew Livery")
	AddTextEntry("0xAFE14AE1","Bennysworks Livery")
	AddTextEntry("0xBD27656D","420GT Livery")
	AddTextEntry("0xAC6DC3DE","Jiffy Gurun Livery")
	AddTextEntry("0xAC6DC3DE","6STR Sentinel Custom")
	AddTextEntry("0xAABBA28E","6STR Revolution")
	AddTextEntry("0x020F36B8","6STR Revolution Widebody")
	AddTextEntry("0xAC6DC3DE","6STR Ruff Weld Comet")
	AddTextEntry("a6", "Audi A6")
	AddTextEntry("gtam21", "Alfa Romeo Giulia GTAm")
end)