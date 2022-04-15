Generic = {}
Generic.NPCS = {}

Generic.SpawnLocations = {
  -- vector4(620.48, 2752.6, 42.09 - 1.0, 359.94)
  vector4(-1605.03,-994.58,7.53 - 1.0,136.79),
}

Generic.ShopKeeperLocations = {
  vector4(-3039.1940917969, 584.90991210938, 6.9088621139526, 6.4417514801025),  --ok
  vector4(1960.4301757813, 3740.2768554688, 31.343681335449, 299.60113525391),  --ok
  vector4(1393.84,3606.8,33.99,172.8), -- ok 
  vector4(549.01,2672.44,41.16,122.33), -- store has no collision yet - fixed next gabz update
  vector4(2557.0915527344, 381.19845581055, 107.62288665771, 347.00051879883), -- ok
  vector4(-1819.57,793.59,137.09,134.3), -- ok
  vector4(-1221.26,-907.92,11.3,54.44), -- ok
  vector4(-706.12,-914.56,18.22,94.66),-- ok
  vector4(24.897365570068, -1347.1030273438, 28.496955871582, 255.65519714355),  --ok
  vector4(-47.36,-1758.68,28.43,50.84), --ok
  vector4(1164.95,-323.7,68.21,101.73),  --ok
  vector4(373.03802490234, 326.53616333008, 102.56628417969, 254.8840637207),
  vector4(2678.1408691406, 3279.8369140625, 54.241065979004, 323.23471069336), --ok
  vector4(1728.2629394531, 6415.1342773438, 34.037155151367, 243.92633056641), --ok
  vector4(-160.56,6320.76,30.59,319.99), -- THIS MAN FALLS THROUGH THE WORLD LOL
  vector4(1165.29,2710.85,37.16,178.47), --ok
  vector4(1697.23,4923.42,41.07,327.94), --ok
  vector4(160.89414978027, 6641.4897460938, 30.698888778687, 228.66091918945),
  vector4(-1486.81,-377.38,39.17,143.01), -- ok
  vector4(-3242.3862304688, 1000.4073486328, 11.830640792847, 357.01257324219),
  vector4(-2966.38,391.79,14.05,99.55), --ok
  vector4(1134.29,-983.39,45.42,292.7), --ok
  vector4(2517.4944, -342.0710, 93.0909, 184.4426), -- fib
}

Generic.SportsShopLocations = {
  vector4(-703.37164306641, -1179.4047851562, 9.609468460083, 122.92682647705),
  vector4(-23.520534515381, -106.42227935791, 56.061752319336, 154.0001373291)
}

Generic.DigitalShopLocations = {
  vector4(1134.5090332031, -468.16110229492, 65.485946655273, 165.39506530762)
}

Generic.HuntingShopLocations = {
  vector4(-679.46, 5839.32, 16.34, 218.69),
}

Generic.WeaponShopLocations = {
  vector4(16.90841293335, -1107.5418701172, 28.79719543457, 162.56214904785),
  vector4(814.86627197266,-2155.1357421875, 28.619186401367, 351.56033325195),
  vector4(1698.0460205078, 3757.3134765625, 33.705326080322, 176.1873626709),
  vector4(246.73857116699, -51.300354003906, 68.941200256348, 11.633701324463),
  vector4(841.12884521484, -1028.6094970703, 27.194860458374, 307.14804077148),
  vector4(-326.00717163086, 6081.1196289063, 30.454784393311, 176.46955871582),
  vector4(-659.17547607422, -939.98419189453, 20.829355239868, 14.84146881104),
  vector4(-1310.9399414063, -394.22991943359, 37.695793151855, 24.375707626343),
  vector4(-1112.3610839844, 2697.1477050781, 17.554275512695, 162.63261413574),
  vector4(2564.7287597656, 298.96563720703, 107.73498535156, 293.33502197266),
  vector4(-3166.9001464844, 1086.9260253906, 19.838754653931, 187.34577941895),
  vector4(2488.0313, -376.7964, 81.6940, 222.7847),
}

Generic.ToolShopLocations = {
  vector4(44.838947296143, -1748.5364990234, 28.549386978149, 35.3),
  vector4(2749.2309570313, 3472.3308105469, 54.679393768311, 244.4),
}

Generic.LaptopVendors = {
  vector4(-1358.93, -759.38, 21.32, 346.47),
}

-- Generic.CasinoLocations = {
--   {
--     coords = vector4(1087.97,221.13,-50.2,184.64), -- coat check
--     flags = { "isCasinoMembershipGiver" },
--   },
--   {
--     coords = vector4(1129.99,275.29,-52.04,270.69), -- rest room 1
--   },
--   {
--     coords = vector4(1157.45,247.93,-52.04,2.02), -- rest room 2
--   },
--   {
--     coords = vector4(1100.64,195.64,-50.44,314.95), -- jewel store
--   },
--   {
--     coords = vector4(990.80,30.97,71.466,51.20), -- casino chips
--     flags = { "isCasinoChipSeller" },
--   },
--   {
--     coords = vector4(988.26,42.93,71.26,199.95), -- wheel of fortune
--   },
--   {
--     coords = vector4(1110.2,208.29,-50.44,82.67), -- drinks bar
--     flags = { "isCasinoDrinkGiver" },
--   },
-- }

Generic.CasinoLocations = {
  {
    coords = vector4(966.29,47.52,70.72,145.85), -- coat check
    flags = { "isCasinoMembershipGiver" },
  },
  {
    coords = vector4(1030.35,71.56,68.88,238.32), -- rest room 1
  },
  {
    coords = vector4(1039.24,33.85,68.88,321.23), -- rest room 2
  },
  {
    coords = vector4(963.25,19.07,70.48,276.73), -- jewel store
  },
  {
    coords = vector4(990.79,30.95,70.48,58.76), -- casino chips
    flags = { "isCasinoChipSeller" },
  },
  {
    coords = vector4(988.61,42.97,70.28,201.73), -- wheel of fortune
    npcId = "casino_wheel_spin_npc",
  },
  {
    coords = vector4(978.4,25.39,70.48,43.67), -- drinks bar
    flags = { "isCasinoDrinkGiver" },
  },
}

-- Generic.GemShopLocations = {
--   vector4(-549.58,-618.83,33.72,178.55),
-- }

Generic.WeedShopLocations = {
  vector4(1175.49, -437.54, 65.9, 262.06),
}

-- Generic.JobVehLocations = {
--   vector4(-50.2,-1089.03,25.48,154.36),
-- }

-- Generic.WineryBuyLocations = {
--   vector4(-1928.02,2060.22,139.85,308.35),
-- }

-- Generic.LicenseBuyLocations = {
--   vector4(-540.57,-191.22,37.23,119.25),
-- }

-- Generic.MobilePhoneUsers = {
--   vector4(726.82,-1074.63,21.25,283.09),
--   vector4(729.65,-1069.9,21.25,176.13),
--   -- vector4(480.13,-1312.7,28.25,193.05),
-- }

-- Generic.VehicleShopKeepersData = {
--   {
--     id = "bike_shop",
--     model = "a_m_y_beach_02",
--     location = vector4(-1109.4,-1694.36,3.5,308.3),
--   },
--   {
--     id = "veh_rental",
--     model = "a_m_y_business_02",
--     location = vector4(110.59,-1090.72,28.31,17.39),
--   },
--   {
--     id = "boat_shop",
--     model = "s_m_y_grip_01",
--     location = vector4(-874.3,-1325.08,0.61,87.95),
--   },
--   {
--     id = "air_shop",
--     model = "s_m_y_pilot_01",
--     location = vector4(-1620.67,-3151.72,13.0,8.23),
--   }
-- }

-- Generic.NPCS[#Generic.NPCS + 1] = {
--   id = "air_shop",
--   name = "Plane Rentals",
--   pedType = 4,
--   model = "s_m_y_pilot_01",
--   networked = false,
--   distance = 50.0,
--   position = {
--     coords = vector3(-1620.67,-3151.72,13.0),
--     heading = 8.23,
--     random = false
--   },
--   appearance = nil,
--   settings = {
--       { mode = "invincible", active = true },
--       { mode = "ignore", active = true },
--       { mode = "freeze", active = true },
--   },
--   flags = {
--       ['isNPC'] = true,
--   },
-- }


-- Generic.NPCS[#Generic.NPCS + 1] = {
--   id = "pawnshop",
--   name = "Pawn Shop",
--   pedType = 4,
--   model = "s_m_y_ammucity_01",
--   networked = false,
--   distance = 200.0,
--   position = {
--     coords = vector3(0.0, 0.0, 0.0),
--     heading = 0.0,
--     random = true
--   },
--   appearance = '{"eyebrow":{"params":[2,0,0.0],"mode":"overlay"},"skinproblem":{"params":[6,0,0.0],"mode":"overlay"},"freckles":{"params":[9,0,0.0],"mode":"overlay"},"badges":{"params":[10,0,0,1],"mode":"component"},"arms":{"params":[3,0,0,1],"mode":"component"},"hat":{"params":[0,-1,-1,1],"mode":"prop"},"beard_color":{"params":[2,0,0,0,0],"mode":"overlaycolor"},"kevlar":{"params":[9,0,0,1],"mode":"component"},"bag":{"params":[5,0,0,1],"mode":"component"},"undershirt":{"params":[8,0,0,1],"mode":"component"},"wrinkles":{"params":[3,0,0.0],"mode":"overlay"},"shoes":{"params":[6,0,0,1],"mode":"component"},"legs":{"params":[4,0,0,1],"mode":"component"},"watch":{"params":[6,-1,-1,1],"mode":"prop"},"haircolor":{"params":[-1,-1],"mode":"haircolor"},"bracelet":{"params":[7,-1,-1,1],"mode":"prop"},"torso":{"params":[11,0,0,1],"mode":"component"},"hair":{"params":[2,0,0,1],"mode":"component"},"glasses":{"params":[1,-1,-1,1],"mode":"prop"},"mask":{"params":[1,0,0,1],"mode":"component"},"beard":{"params":[1,0,0.0],"mode":"overlay"},"accesory":{"params":[7,0,0,1],"mode":"component"},"eyecolor":{"params":[-1],"mode":"eyecolor"},"face":{"params":[0,0,0,1],"mode":"component"},"ears":{"params":[2,-1,-1,1],"mode":"prop"}}',
--   settings = {
--       { mode = "invincible", active = true },
--       { mode = "ignore", active = true },
--       { mode = "freeze", active = true }
--   },
--   flags = {
--       ['isNPC'] = true,
--       ['isPawnBuyer'] = true
--   }
-- }


Generic.NPCS[#Generic.NPCS + 1] = {
  id = "fenceguy",
  name = "Fence Guy",
  pedType = 4,
  model = "s_m_y_ammucity_01",
  networked = false,
  distance = 200.0,
  position = {
    coords = vector3(331.3026, 362.8521, 105.6536),
    heading = 340.6491,
    random = false
  },
  appearance = '{"eyebrow":{"params":[2,0,0.0],"mode":"overlay"},"skinproblem":{"params":[6,0,0.0],"mode":"overlay"},"freckles":{"params":[9,0,0.0],"mode":"overlay"},"badges":{"params":[10,0,0,1],"mode":"component"},"arms":{"params":[3,0,0,1],"mode":"component"},"hat":{"params":[0,-1,-1,1],"mode":"prop"},"beard_color":{"params":[2,0,0,0,0],"mode":"overlaycolor"},"kevlar":{"params":[9,0,0,1],"mode":"component"},"bag":{"params":[5,0,0,1],"mode":"component"},"undershirt":{"params":[8,0,0,1],"mode":"component"},"wrinkles":{"params":[3,0,0.0],"mode":"overlay"},"shoes":{"params":[6,0,0,1],"mode":"component"},"legs":{"params":[4,0,0,1],"mode":"component"},"watch":{"params":[6,-1,-1,1],"mode":"prop"},"haircolor":{"params":[-1,-1],"mode":"haircolor"},"bracelet":{"params":[7,-1,-1,1],"mode":"prop"},"torso":{"params":[11,0,0,1],"mode":"component"},"hair":{"params":[2,0,0,1],"mode":"component"},"glasses":{"params":[1,-1,-1,1],"mode":"prop"},"mask":{"params":[1,0,0,1],"mode":"component"},"beard":{"params":[1,0,0.0],"mode":"overlay"},"accesory":{"params":[7,0,0,1],"mode":"component"},"eyecolor":{"params":[-1],"mode":"eyecolor"},"face":{"params":[0,0,0,1],"mode":"component"},"ears":{"params":[2,-1,-1,1],"mode":"prop"}}',
  settings = {
      { mode = "invincible", active = true },
      { mode = "ignore", active = true },
      { mode = "freeze", active = true }
  },
  flags = {
      ['isNPC'] = true,
      ['isFenceGuy'] = true
  }
}


Generic.NPCS[#Generic.NPCS + 1] = {
  id = "taxiguy",
  name = "Taxi Guy",
  pedType = 4,
  model = "cs_jimmyboston",
  networked = false,
  distance = 200.0,
  position = {
    coords = vector3(894.9174, -179.3615, 74.7003),
    heading = 239.7525,
    random = false
  },
  appearance = '{"eyebrow":{"params":[2,0,0.0],"mode":"overlay"},"skinproblem":{"params":[6,0,0.0],"mode":"overlay"},"freckles":{"params":[9,0,0.0],"mode":"overlay"},"badges":{"params":[10,0,0,1],"mode":"component"},"arms":{"params":[3,0,0,1],"mode":"component"},"hat":{"params":[0,-1,-1,1],"mode":"prop"},"beard_color":{"params":[2,0,0,0,0],"mode":"overlaycolor"},"kevlar":{"params":[9,0,0,1],"mode":"component"},"bag":{"params":[5,0,0,1],"mode":"component"},"undershirt":{"params":[8,0,0,1],"mode":"component"},"wrinkles":{"params":[3,0,0.0],"mode":"overlay"},"shoes":{"params":[6,0,0,1],"mode":"component"},"legs":{"params":[4,0,0,1],"mode":"component"},"watch":{"params":[6,-1,-1,1],"mode":"prop"},"haircolor":{"params":[-1,-1],"mode":"haircolor"},"bracelet":{"params":[7,-1,-1,1],"mode":"prop"},"torso":{"params":[11,0,0,1],"mode":"component"},"hair":{"params":[2,0,0,1],"mode":"component"},"glasses":{"params":[1,-1,-1,1],"mode":"prop"},"mask":{"params":[1,0,0,1],"mode":"component"},"beard":{"params":[1,0,0.0],"mode":"overlay"},"accesory":{"params":[7,0,0,1],"mode":"component"},"eyecolor":{"params":[-1],"mode":"eyecolor"},"face":{"params":[0,0,0,1],"mode":"component"},"ears":{"params":[2,-1,-1,1],"mode":"prop"}}',
  settings = {
      { mode = "invincible", active = true },
      { mode = "ignore", active = true },
      { mode = "freeze", active = true }
  },
  flags = {
      ['isNPC'] = true,
      ['isTaxiGuy'] = true
  }
}


Generic.NPCS[#Generic.NPCS + 1] = {
  id = "vpnguy",
  name = "Vpn Guy",
  pedType = 4,
  model = "ig_thornton",
  networked = false,
  distance = 200.0,
  position = {
    coords = vector3(944.7300, -1697.6277, 29.0850),
    heading = 263.1922,
    random = false
  },
  appearance = '{"eyebrow":{"params":[2,0,0.0],"mode":"overlay"},"skinproblem":{"params":[6,0,0.0],"mode":"overlay"},"freckles":{"params":[9,0,0.0],"mode":"overlay"},"badges":{"params":[10,0,0,1],"mode":"component"},"arms":{"params":[3,0,0,1],"mode":"component"},"hat":{"params":[0,-1,-1,1],"mode":"prop"},"beard_color":{"params":[2,0,0,0,0],"mode":"overlaycolor"},"kevlar":{"params":[9,0,0,1],"mode":"component"},"bag":{"params":[5,0,0,1],"mode":"component"},"undershirt":{"params":[8,0,0,1],"mode":"component"},"wrinkles":{"params":[3,0,0.0],"mode":"overlay"},"shoes":{"params":[6,0,0,1],"mode":"component"},"legs":{"params":[4,0,0,1],"mode":"component"},"watch":{"params":[6,-1,-1,1],"mode":"prop"},"haircolor":{"params":[-1,-1],"mode":"haircolor"},"bracelet":{"params":[7,-1,-1,1],"mode":"prop"},"torso":{"params":[11,0,0,1],"mode":"component"},"hair":{"params":[2,0,0,1],"mode":"component"},"glasses":{"params":[1,-1,-1,1],"mode":"prop"},"mask":{"params":[1,0,0,1],"mode":"component"},"beard":{"params":[1,0,0.0],"mode":"overlay"},"accesory":{"params":[7,0,0,1],"mode":"component"},"eyecolor":{"params":[-1],"mode":"eyecolor"},"face":{"params":[0,0,0,1],"mode":"component"},"ears":{"params":[2,-1,-1,1],"mode":"prop"}}',
  settings = {
      { mode = "invincible", active = true },
      { mode = "ignore", active = true },
      { mode = "freeze", active = true }
  },
  flags = {
      ['isNPC'] = true,
      ['isVpnGuy'] = true
  }
}

Generic.NPCS[#Generic.NPCS + 1] = {
  id = "oxyguy",
  name = "Oxy Guy",
  pedType = 4,
  model = "ig_thornton",
  networked = false,
  distance = 200.0,
  position = {
    coords = vector3(194.0911, -1843.4448, 26.2103),
    heading = 138.2796,
    random = false
  },
  appearance = '{"eyebrow":{"params":[2,0,0.0],"mode":"overlay"},"skinproblem":{"params":[6,0,0.0],"mode":"overlay"},"freckles":{"params":[9,0,0.0],"mode":"overlay"},"badges":{"params":[10,0,0,1],"mode":"component"},"arms":{"params":[3,0,0,1],"mode":"component"},"hat":{"params":[0,-1,-1,1],"mode":"prop"},"beard_color":{"params":[2,0,0,0,0],"mode":"overlaycolor"},"kevlar":{"params":[9,0,0,1],"mode":"component"},"bag":{"params":[5,0,0,1],"mode":"component"},"undershirt":{"params":[8,0,0,1],"mode":"component"},"wrinkles":{"params":[3,0,0.0],"mode":"overlay"},"shoes":{"params":[6,0,0,1],"mode":"component"},"legs":{"params":[4,0,0,1],"mode":"component"},"watch":{"params":[6,-1,-1,1],"mode":"prop"},"haircolor":{"params":[-1,-1],"mode":"haircolor"},"bracelet":{"params":[7,-1,-1,1],"mode":"prop"},"torso":{"params":[11,0,0,1],"mode":"component"},"hair":{"params":[2,0,0,1],"mode":"component"},"glasses":{"params":[1,-1,-1,1],"mode":"prop"},"mask":{"params":[1,0,0,1],"mode":"component"},"beard":{"params":[1,0,0.0],"mode":"overlay"},"accesory":{"params":[7,0,0,1],"mode":"component"},"eyecolor":{"params":[-1],"mode":"eyecolor"},"face":{"params":[0,0,0,1],"mode":"component"},"ears":{"params":[2,-1,-1,1],"mode":"prop"}}',
  settings = {
      { mode = "invincible", active = true },
      { mode = "ignore", active = true },
      { mode = "freeze", active = true }
  },
  flags = {
      ['isNPC'] = true,
      ['isOxyGuy'] = true
  }
}

Generic.NPCS[#Generic.NPCS + 1] = {
  id = "fibarmoryguy",
  name = "fibarmoryguy",
  pedType = 4,
  model = "ig_thornton",
  networked = false,
  distance = 200.0,
  position = {
    coords = vector3(2486.7634, -378.1111, 81.6940),
    heading = 220.7535,
    random = false
  },
  appearance = '{"eyebrow":{"params":[2,0,0.0],"mode":"overlay"},"skinproblem":{"params":[6,0,0.0],"mode":"overlay"},"freckles":{"params":[9,0,0.0],"mode":"overlay"},"badges":{"params":[10,0,0,1],"mode":"component"},"arms":{"params":[3,0,0,1],"mode":"component"},"hat":{"params":[0,-1,-1,1],"mode":"prop"},"beard_color":{"params":[2,0,0,0,0],"mode":"overlaycolor"},"kevlar":{"params":[9,0,0,1],"mode":"component"},"bag":{"params":[5,0,0,1],"mode":"component"},"undershirt":{"params":[8,0,0,1],"mode":"component"},"wrinkles":{"params":[3,0,0.0],"mode":"overlay"},"shoes":{"params":[6,0,0,1],"mode":"component"},"legs":{"params":[4,0,0,1],"mode":"component"},"watch":{"params":[6,-1,-1,1],"mode":"prop"},"haircolor":{"params":[-1,-1],"mode":"haircolor"},"bracelet":{"params":[7,-1,-1,1],"mode":"prop"},"torso":{"params":[11,0,0,1],"mode":"component"},"hair":{"params":[2,0,0,1],"mode":"component"},"glasses":{"params":[1,-1,-1,1],"mode":"prop"},"mask":{"params":[1,0,0,1],"mode":"component"},"beard":{"params":[1,0,0.0],"mode":"overlay"},"accesory":{"params":[7,0,0,1],"mode":"component"},"eyecolor":{"params":[-1],"mode":"eyecolor"},"face":{"params":[0,0,0,1],"mode":"component"},"ears":{"params":[2,-1,-1,1],"mode":"prop"}}',
  settings = {
      { mode = "invincible", active = true },
      { mode = "ignore", active = true },
      { mode = "freeze", active = true }
  },
  flags = {
      ['isNPC'] = true,
      ['isFibGuy'] = true
  }
}



Generic.NPCS[#Generic.NPCS + 1] = {
  id = "bsguy",
  name = "Bugershot Guy",
  pedType = 4,
  model = "s_m_y_barman_01",
  networked = false,
  distance = 200.0,
  position = {
    coords = vector3(-1190.1145, -905.4796, 12.9847),
    heading = 70.9786,
    random = false
  },
  appearance = '{"eyebrow":{"params":[2,0,0.0],"mode":"overlay"},"skinproblem":{"params":[6,0,0.0],"mode":"overlay"},"freckles":{"params":[9,0,0.0],"mode":"overlay"},"badges":{"params":[10,0,0,1],"mode":"component"},"arms":{"params":[3,0,0,1],"mode":"component"},"hat":{"params":[0,-1,-1,1],"mode":"prop"},"beard_color":{"params":[2,0,0,0,0],"mode":"overlaycolor"},"kevlar":{"params":[9,0,0,1],"mode":"component"},"bag":{"params":[5,0,0,1],"mode":"component"},"undershirt":{"params":[8,0,0,1],"mode":"component"},"wrinkles":{"params":[3,0,0.0],"mode":"overlay"},"shoes":{"params":[6,0,0,1],"mode":"component"},"legs":{"params":[4,0,0,1],"mode":"component"},"watch":{"params":[6,-1,-1,1],"mode":"prop"},"haircolor":{"params":[-1,-1],"mode":"haircolor"},"bracelet":{"params":[7,-1,-1,1],"mode":"prop"},"torso":{"params":[11,0,0,1],"mode":"component"},"hair":{"params":[2,0,0,1],"mode":"component"},"glasses":{"params":[1,-1,-1,1],"mode":"prop"},"mask":{"params":[1,0,0,1],"mode":"component"},"beard":{"params":[1,0,0.0],"mode":"overlay"},"accesory":{"params":[7,0,0,1],"mode":"component"},"eyecolor":{"params":[-1],"mode":"eyecolor"},"face":{"params":[0,0,0,1],"mode":"component"},"ears":{"params":[2,-1,-1,1],"mode":"prop"}}',
  settings = {
      { mode = "invincible", active = true },
      { mode = "ignore", active = true },
      { mode = "freeze", active = true }
  },
  flags = {
      ['isNPC'] = true,
      ['isBSGuy'] = true
  }
}


Generic.NPCS[#Generic.NPCS + 1] = {
  id = "gneguy",
  name = "Gne Guy",
  pedType = 4,
  model = "ig_avon",
  networked = false,
  distance = 200.0,
  position = {
    coords = vector3(-519.7305, -593.6505, 29.4383),
    heading = 172.6103,
    random = false
  },
  appearance = '{"eyebrow":{"params":[2,0,0.0],"mode":"overlay"},"skinproblem":{"params":[6,0,0.0],"mode":"overlay"},"freckles":{"params":[9,0,0.0],"mode":"overlay"},"badges":{"params":[10,0,0,1],"mode":"component"},"arms":{"params":[3,0,0,1],"mode":"component"},"hat":{"params":[0,-1,-1,1],"mode":"prop"},"beard_color":{"params":[2,0,0,0,0],"mode":"overlaycolor"},"kevlar":{"params":[9,0,0,1],"mode":"component"},"bag":{"params":[5,0,0,1],"mode":"component"},"undershirt":{"params":[8,0,0,1],"mode":"component"},"wrinkles":{"params":[3,0,0.0],"mode":"overlay"},"shoes":{"params":[6,0,0,1],"mode":"component"},"legs":{"params":[4,0,0,1],"mode":"component"},"watch":{"params":[6,-1,-1,1],"mode":"prop"},"haircolor":{"params":[-1,-1],"mode":"haircolor"},"bracelet":{"params":[7,-1,-1,1],"mode":"prop"},"torso":{"params":[11,0,0,1],"mode":"component"},"hair":{"params":[2,0,0,1],"mode":"component"},"glasses":{"params":[1,-1,-1,1],"mode":"prop"},"mask":{"params":[1,0,0,1],"mode":"component"},"beard":{"params":[1,0,0.0],"mode":"overlay"},"accesory":{"params":[7,0,0,1],"mode":"component"},"eyecolor":{"params":[-1],"mode":"eyecolor"},"face":{"params":[0,0,0,1],"mode":"component"},"ears":{"params":[2,-1,-1,1],"mode":"prop"}}',
  settings = {
      { mode = "invincible", active = true },
      { mode = "ignore", active = true },
      { mode = "freeze", active = true }
  },
  flags = {
      ['isNPC'] = true,
      ['isGneGuy'] = true
  }
}



Generic.NPCS[#Generic.NPCS + 1] = {
  id = "chickenguy",
  name = "Chicken Guy",
  pedType = 4,
  model = "s_m_y_chef_01",
  networked = false,
  distance = 200.0,
  position = {
    coords = vector3(-524.7509, -711.4124, 32.8249),
    heading = 112.7492,
    random = false
  },
  appearance = '{"eyebrow":{"params":[2,0,0.0],"mode":"overlay"},"skinproblem":{"params":[6,0,0.0],"mode":"overlay"},"freckles":{"params":[9,0,0.0],"mode":"overlay"},"badges":{"params":[10,0,0,1],"mode":"component"},"arms":{"params":[3,0,0,1],"mode":"component"},"hat":{"params":[0,-1,-1,1],"mode":"prop"},"beard_color":{"params":[2,0,0,0,0],"mode":"overlaycolor"},"kevlar":{"params":[9,0,0,1],"mode":"component"},"bag":{"params":[5,0,0,1],"mode":"component"},"undershirt":{"params":[8,0,0,1],"mode":"component"},"wrinkles":{"params":[3,0,0.0],"mode":"overlay"},"shoes":{"params":[6,0,0,1],"mode":"component"},"legs":{"params":[4,0,0,1],"mode":"component"},"watch":{"params":[6,-1,-1,1],"mode":"prop"},"haircolor":{"params":[-1,-1],"mode":"haircolor"},"bracelet":{"params":[7,-1,-1,1],"mode":"prop"},"torso":{"params":[11,0,0,1],"mode":"component"},"hair":{"params":[2,0,0,1],"mode":"component"},"glasses":{"params":[1,-1,-1,1],"mode":"prop"},"mask":{"params":[1,0,0,1],"mode":"component"},"beard":{"params":[1,0,0.0],"mode":"overlay"},"accesory":{"params":[7,0,0,1],"mode":"component"},"eyecolor":{"params":[-1],"mode":"eyecolor"},"face":{"params":[0,0,0,1],"mode":"component"},"ears":{"params":[2,-1,-1,1],"mode":"prop"}}',
  settings = {
      { mode = "invincible", active = true },
      { mode = "ignore", active = true },
      { mode = "freeze", active = true }
  },
  flags = {
      ['isNPC'] = true,
      ['isChickenGuy'] = true
  }
}


Generic.NPCS[#Generic.NPCS + 1] = {
  id = "cluckingirl",
  name = "Cluckin Girl",
  pedType = 4,
  model = "s_f_y_shop_mid",
  networked = false,
  distance = 200.0,
  position = {
    coords = vector3(-510.3228, -702.3388, 32.1680),
    heading = 38.5689,
    random = false
  },
  appearance = '{"eyebrow":{"params":[2,0,0.0],"mode":"overlay"},"skinproblem":{"params":[6,0,0.0],"mode":"overlay"},"freckles":{"params":[9,0,0.0],"mode":"overlay"},"badges":{"params":[10,0,0,1],"mode":"component"},"arms":{"params":[3,0,0,1],"mode":"component"},"hat":{"params":[0,-1,-1,1],"mode":"prop"},"beard_color":{"params":[2,0,0,0,0],"mode":"overlaycolor"},"kevlar":{"params":[9,0,0,1],"mode":"component"},"bag":{"params":[5,0,0,1],"mode":"component"},"undershirt":{"params":[8,0,0,1],"mode":"component"},"wrinkles":{"params":[3,0,0.0],"mode":"overlay"},"shoes":{"params":[6,0,0,1],"mode":"component"},"legs":{"params":[4,0,0,1],"mode":"component"},"watch":{"params":[6,-1,-1,1],"mode":"prop"},"haircolor":{"params":[-1,-1],"mode":"haircolor"},"bracelet":{"params":[7,-1,-1,1],"mode":"prop"},"torso":{"params":[11,0,0,1],"mode":"component"},"hair":{"params":[2,0,0,1],"mode":"component"},"glasses":{"params":[1,-1,-1,1],"mode":"prop"},"mask":{"params":[1,0,0,1],"mode":"component"},"beard":{"params":[1,0,0.0],"mode":"overlay"},"accesory":{"params":[7,0,0,1],"mode":"component"},"eyecolor":{"params":[-1],"mode":"eyecolor"},"face":{"params":[0,0,0,1],"mode":"component"},"ears":{"params":[2,-1,-1,1],"mode":"prop"}}',
  settings = {
      { mode = "invincible", active = true },
      { mode = "ignore", active = true },
      { mode = "freeze", active = true }
  },
  flags = {
      ['isNPC'] = true,
      ['isCluckinGirl'] = true
  }
}


-- Generic.NPCS[#Generic.NPCS + 1] = {
--   id = "houseguy",
--   name = "House Guy",
--   pedType = 4,
--   model = "a_m_y_smartcaspat_01",
--   networked = false,
--   distance = 200.0,
--   position = {
--     coords = vector3(-156.5230, -603.8885, 48.2422),
--     heading = 130.1756,
--     random = false
--   },
--   appearance = '{"eyebrow":{"params":[2,0,0.0],"mode":"overlay"},"skinproblem":{"params":[6,0,0.0],"mode":"overlay"},"freckles":{"params":[9,0,0.0],"mode":"overlay"},"badges":{"params":[10,0,0,1],"mode":"component"},"arms":{"params":[3,0,0,1],"mode":"component"},"hat":{"params":[0,-1,-1,1],"mode":"prop"},"beard_color":{"params":[2,0,0,0,0],"mode":"overlaycolor"},"kevlar":{"params":[9,0,0,1],"mode":"component"},"bag":{"params":[5,0,0,1],"mode":"component"},"undershirt":{"params":[8,0,0,1],"mode":"component"},"wrinkles":{"params":[3,0,0.0],"mode":"overlay"},"shoes":{"params":[6,0,0,1],"mode":"component"},"legs":{"params":[4,0,0,1],"mode":"component"},"watch":{"params":[6,-1,-1,1],"mode":"prop"},"haircolor":{"params":[-1,-1],"mode":"haircolor"},"bracelet":{"params":[7,-1,-1,1],"mode":"prop"},"torso":{"params":[11,0,0,1],"mode":"component"},"hair":{"params":[2,0,0,1],"mode":"component"},"glasses":{"params":[1,-1,-1,1],"mode":"prop"},"mask":{"params":[1,0,0,1],"mode":"component"},"beard":{"params":[1,0,0.0],"mode":"overlay"},"accesory":{"params":[7,0,0,1],"mode":"component"},"eyecolor":{"params":[-1],"mode":"eyecolor"},"face":{"params":[0,0,0,1],"mode":"component"},"ears":{"params":[2,-1,-1,1],"mode":"prop"}}',
--   settings = {
--       { mode = "invincible", active = true },
--       { mode = "ignore", active = true },
--       { mode = "freeze", active = true }
--   },
--   flags = {
--       ['isNPC'] = true,
--       ['isHouseGuy'] = true
--   }
-- }


Generic.NPCS[#Generic.NPCS + 1] = {
  id = "rentplaneguy",
  name = "Rent Plane/Heli Guy",
  pedType = 4,
  model = "a_m_y_smartcaspat_01",
  networked = false,
  distance = 200.0,
  position = {
    coords = vector3(-1622.8451, -3151.5771, 12.9922),
    heading = 56.4436,
    random = false
  },
  appearance = '{"eyebrow":{"params":[2,0,0.0],"mode":"overlay"},"skinproblem":{"params":[6,0,0.0],"mode":"overlay"},"freckles":{"params":[9,0,0.0],"mode":"overlay"},"badges":{"params":[10,0,0,1],"mode":"component"},"arms":{"params":[3,0,0,1],"mode":"component"},"hat":{"params":[0,-1,-1,1],"mode":"prop"},"beard_color":{"params":[2,0,0,0,0],"mode":"overlaycolor"},"kevlar":{"params":[9,0,0,1],"mode":"component"},"bag":{"params":[5,0,0,1],"mode":"component"},"undershirt":{"params":[8,0,0,1],"mode":"component"},"wrinkles":{"params":[3,0,0.0],"mode":"overlay"},"shoes":{"params":[6,0,0,1],"mode":"component"},"legs":{"params":[4,0,0,1],"mode":"component"},"watch":{"params":[6,-1,-1,1],"mode":"prop"},"haircolor":{"params":[-1,-1],"mode":"haircolor"},"bracelet":{"params":[7,-1,-1,1],"mode":"prop"},"torso":{"params":[11,0,0,1],"mode":"component"},"hair":{"params":[2,0,0,1],"mode":"component"},"glasses":{"params":[1,-1,-1,1],"mode":"prop"},"mask":{"params":[1,0,0,1],"mode":"component"},"beard":{"params":[1,0,0.0],"mode":"overlay"},"accesory":{"params":[7,0,0,1],"mode":"component"},"eyecolor":{"params":[-1],"mode":"eyecolor"},"face":{"params":[0,0,0,1],"mode":"component"},"ears":{"params":[2,-1,-1,1],"mode":"prop"}}',
  settings = {
      { mode = "invincible", active = true },
      { mode = "ignore", active = true },
      { mode = "freeze", active = true }
  },
  flags = {
      ['isNPC'] = true,
      ['isPlaneGuy'] = true
  }
}


Generic.NPCS[#Generic.NPCS + 1] = {
  id = "recycle_exchange",
  name = "Recycle Exchange",
  pedType = 4,
  model = "s_m_y_garbage",
  networked = false,
  distance = 150.0,
  position = {
    coords = vector3(-355.76, -1556.04, 24.18),
    heading = 179.96,
    random = false
  },
  appearance = nil,
  settings = {
      { mode = "invincible", active = true },
      { mode = "ignore", active = true },
      { mode = "freeze", active = true }
  },
  flags = {
      ['isNPC'] = true,
      ['isRecycleExchange'] = true
  }
}

Generic.NPCS[#Generic.NPCS + 1] = {
  id = "mrpd_helispawn",
  name = "MRPD Heli Spawn",
  pedType = 4,
  model = "s_m_y_dockwork_01",
  networked = false,
  distance = 150.0,
  position = {
    coords = vector3(441.92965698242, -974.62414550781, 42.686401367188),
    heading = 232.44094848633,
    random = false
  },
  appearance = nil,
  settings = {
      { mode = "invincible", active = true },
      { mode = "ignore", active = true },
      { mode = "freeze", active = true }
  },
  flags = {
      ['isNPC'] = true,
  },
  scenario = "WORLD_HUMAN_CLIPBOARD"
}

Generic.NPCS[#Generic.NPCS + 1] = {
  id = "sandy_helispawn",
  name = "SANDY Heli Spawn",
  pedType = 4,
  model = "s_m_y_dockwork_01",
  networked = false,
  distance = 150.0,
  position = {
    coords = vector3(1839.1317138672, 3639.2416992188, 34.696365356445),
    heading = 314.70147705078,
    random = false
  },
  appearance = nil,
  settings = {
      { mode = "invincible", active = true },
      { mode = "ignore", active = true },
      { mode = "freeze", active = true }
  },
  flags = {
      ['isNPC'] = true,
  },
  scenario = "WORLD_HUMAN_CLIPBOARD"
}

Generic.NPCS[#Generic.NPCS + 1] = {
  id = "paleto_helispawn",
  name = "Paleto Heli Spawn",
  pedType = 4,
  model = "s_m_y_dockwork_01",
  networked = false,
  distance = 150.0,
  position = {
    coords = vector3(-486.35507202148, 5997.9926757813, 30.311866760254),
    heading = 229.36386108398,
    random = false
  },
  appearance = nil,
  settings = {
      { mode = "invincible", active = true },
      { mode = "ignore", active = true },
      { mode = "freeze", active = true }
  },
  flags = {
      ['isNPC'] = true,
  },
  scenario = "WORLD_HUMAN_CLIPBOARD"
}

Generic.NPCS[#Generic.NPCS + 1] = {
  id = "casino_wheel",
  name = "Casino Wheel",
  pedType = 4,
  model = "S_M_Y_Casino_01",
  networked = false,
  distance = 150.0,
  position = {
    coords = vector3(1109.48, 229.35, -50.90),
    heading = 200.0,
    random = false
  },
  appearance = nil,
  settings = {
      { mode = "invincible", active = true },
      { mode = "ignore", active = true },
      { mode = "freeze", active = true }
  },
  flags = {
      ['isNPC'] = true,
      ['isCasinoWheel'] = true
  }
}

Generic.NPCS[#Generic.NPCS + 1] = {
  id = "casino_enter",
  name = "Casino enter",
  pedType = 4,
  model = "S_M_Y_Casino_01",
  networked = false,
  distance = 150.0,
  position = {
    coords = vector3(935.93383789062, 47.202331542969, 80.095794677734),
    heading = 149.85632324219,
    random = false
  },
  appearance = nil,
  settings = {
      { mode = "invincible", active = true },
      { mode = "ignore", active = true },
      { mode = "freeze", active = true }
  },
  flags = {
      ['isNPC'] = true,
      ['isCasinoEnter'] = true
  }
}

--Generic.NPCS[#Generic.NPCS + 1] = {
--  id = "bcso_helicopter",
--  name = "BCSO Helicopter",
--  pedType = 2,
--  model = "s_m_y_sheriff_01",
--  networked = false,
--  distance = 150.0,
--  position = {
--    coords = vector3(1839.0559082031, 3639.021484375, 34.696365356445),
--    heading = 306.08755493164,
--    random = false
--  },
--  appearance = nil,
--  settings = {
--      { mode = "invincible", active = true },
--      { mode = "ignore", active = true },
--      { mode = "freeze", active = true }
--  },
--  flags = {
--      ['isNPC'] = true,
--      ['isBCSO'] = true
--  }
--}

Generic.NPCS[#Generic.NPCS + 1] = {
  id = "cosmic_storer",
  name = "Comic Store",
  pedType = 4,
  model = "ig_chef",
  networked = false,
  distance = 150.0,
  position = {
    coords = vector3(-139.69010925293, 224.63238525391, 93.987030029297),
    heading = 89.615570068359,
    random = false
  },
  appearance = nil,
  settings = {
      { mode = "invincible", active = true },
      { mode = "ignore", active = true },
      { mode = "freeze", active = true }
  },
  flags = {
      ['isNPC'] = true,
      ['isComicStore'] = true
  }
}

Generic.NPCS[#Generic.NPCS + 1] = {
  id = "casino_exit",
  name = "Casino exit",
  pedType = 4,
  model = "S_M_Y_Casino_01",
  networked = false,
  distance = 150.0,
  position = {
    coords = vector3(1089.6560058594, 205.87905883789, -49.999778747559),
    heading = 0.46232384443283,
    random = false
  },
  appearance = nil,
  settings = {
      { mode = "invincible", active = true },
      { mode = "ignore", active = true },
      { mode = "freeze", active = true }
  },
  flags = {
      ['isNPC'] = true,
      ['isCasinoExit'] = true
  }
}

-- Generic.NPCS[#Generic.NPCS + 1] = {
--   id = "head_stripper",
--   name = "Head Stripper",
--   pedType = 4,
--   model = "csb_tonya",
--   networked = false,
--   distance = 25.0,
--   position = {
--     coords = vector3(110.98, -1297.22, 28.39),
--     heading = 204.3,
--     random = false
--   },
--   appearance = nil,
--   settings = {
--       { mode = "invincible", active = true },
--       { mode = "ignore", active = true },
--       { mode = "freeze", active = true }
--   },
--   flags = {
--       ['isNPC'] = true,
--       ['isCommonJobProvider'] = true
--   },
--   scenario = "WORLD_HUMAN_SMOKING"
-- }


-- Generic.NPCS[#Generic.NPCS + 1] = {
--   id = "paycheck_banker",
--   name = "Bank Account Manager",
--   pedType = 4,
--   model = "cs_bankman",
--   networked = false,
--   distance = 25.0,
--   position = {
--     coords = vector3(242.020568847656, 227.114593505859, 106.031478881835),
--     heading = 160.0,
--     random = false
--   },
--   appearance = nil,
--   settings = {
--       { mode = "invincible", active = true },
--       { mode = "ignore", active = true },
--       { mode = "freeze", active = true },
--       { mode = "collision", active = true }
--   },
--   flags = {
--       ['isNPC'] = true,
--       ['isBankAccountManager'] = true
--   },
--   scenario = "PROP_HUMAN_SEAT_CHAIR_UPRIGHT"
-- }



-- Generic.NPCS[#Generic.NPCS + 1] = {
--   id = "coke_spawner",
--   name = "Coke Spawn",
--   pedType = 4,
--   model = "s_m_m_pilot_02",
--   networked = false,
--   distance = 35.0,
--   position = {
--     coords = vector3(2121.2570800781, 4782.9345703125, 40.970268249512 - 1),
--     heading = 322.08538818359,
--     random = true
--   },
--   appearance = nil,
--   settings = {
--       { mode = "invincible", active = true },
--       { mode = "ignore", active = true },
--       { mode = "freeze", active = true },
--   },
--   flags = {
--       ['isNPC'] = true,
--   },
--   scenario = "WORLD_HUMAN_AA_SMOKE"
-- }


-- Generic.NPCS[#Generic.NPCS + 1] = {
--   id = "rolled_cash",
--   name = "Rolled Cash",
--   pedType = 4,
--   model = "csb_popov",
--   networked = false,
--   distance = 50.0,
--   position = {
--     coords = vector3(-2166.23, 5198.61,16.88 - 1),
--     heading = 147.83,
--     random = false
--   },
--   appearance = nil,
--   settings = {
--       { mode = "invincible", active = true },
--       { mode = "ignore", active = true },
--       { mode = "freeze", active = true },
--   },
--   flags = {
--       ['isNPC'] = true,
--   },
--   scenario = "WORLD_HUMAN_LEANING"
-- }





-- Generic.NPCS[#Generic.NPCS + 1] = {
--   id = "news_reporter",
--   name = "News Reporter",
--   pedType = 4,
--   model = "a_m_m_paparazzi_01",
--   networked = false,
--   distance = 75.0,
--   position = {
--     coords = vector3(-598.85, -929.87, 22.87),
--     heading = 83.47,
--     random = false
--   },
--   appearance = nil,
--   settings = {
--       { mode = "invincible", active = true },
--       { mode = "ignore", active = true },
--       { mode = "freeze", active = true }
--   },
--   flags = {
--       ['isNPC'] = true,
--       ['isCommonJobProvider'] = true
--   }
-- }

-- Generic.NPCS[#Generic.NPCS + 1] = {
--   id = "fish_market",
--   name = "Fish Market",
--   pedType = 4,
--   model = "ig_chef",
--   networked = false,
--   distance = 50.0,
--   position = {
--     coords = vector3(-3257.5280761719, 983.59783935547, 11.605745315552),
--     heading = 263.47634887695,
--     random = false
--   },
--   appearance = nil,
--   settings = {
--       { mode = "invincible", active = true },
--       { mode = "ignore", active = true },
--       { mode = "freeze", active = true },
--   },
--   flags = {
--       ['isNPC'] = true,
--   },
-- }

-- Generic.NPCS[#Generic.NPCS + 1] = {
--   id = "fish_shop",
--   name = "Fish Shop",
--   pedType = 4,
--   model = "ig_chef",
--   networked = false,
--   distance = 35.0,
--   position = {
--     coords = vector3(-1598.01,5200.89,4.38 - 1),
--     heading = 73.401,
--     random = true
--   },
--   appearance = nil,
--   settings = {
--       { mode = "invincible", active = true },
--       { mode = "ignore", active = true },
--       { mode = "freeze", active = true },
--   },
--   flags = {
--       ['isNPC'] = true,
--   },
-- }

-- Generic.NPCS[#Generic.NPCS + 1] = {
--   id = "boat_spawner",
--   name = "Boat Spawn",
--   pedType = 4,
--   model = "ig_floyd",
--   networked = false,
--   distance = 35.0,
--   position = {
--     coords = vector3(-1607.67,5264.94,3.97 - 1),
--     heading = 167.78746032715,
--     random = true
--   },
--   appearance = nil,
--   settings = {
--       { mode = "invincible", active = true },
--       { mode = "ignore", active = true },
--       { mode = "freeze", active = true },
--   },
--   flags = {
--       ['isNPC'] = true,
--   },
-- }

Generic.NPCS[#Generic.NPCS + 1] = {
  id = "beanmachine_npc",
  name = "Bean Machine",
  pedType = 1,
  model = "a_f_m_prolhost_01",
  networked = false,
  distance = 50.0,
  position = {
    coords = vector3(-634.63977050781, 233.7843170166, 81.881446838379 - 1),
    heading = 272.13958740234,
    random = true
  },
  appearance = nil,
  settings = {
      { mode = "invincible", active = true },
      { mode = "ignore", active = true },
      { mode = "freeze", active = true },
  },
  flags = {
      ['isNPC'] = true,
  },
}

 Generic.NPCS[#Generic.NPCS + 1] = {
   id = "isPillboxMedicalGarage",
   name = "Pillbox EMS",
   pedType = 2,
   model = "s_m_m_doctor_01",
   networked = false,
   distance = 50.0,
   position = {
     coords = vector3(340.29, -582.66, 28.8 - 1.0),
     heading = 72.09049987793,
 },
   appearance = nil,
   settings = {
       { mode = "invincible", active = true },
       { mode = "ignore", active = true },
       { mode = "freeze", active = true },
   },
   flags = {
     isNPC = true,
   },
   scenario = "WORLD_HUMAN_CLIPBOARD"
 }

-- Generic.NPCS[#Generic.NPCS + 1] = {
--   id = "isGarbageInst",
--   name = "GARBAGE INST",
--   pedType = 2,
--   model = "s_m_y_garbage",
--   networked = false,
--   distance = 50.0,
--   position = {
--     coords = vector3(-321.55, -1546.16, 31.01 - 1.0),
--     heading = 355.26,
-- },
--   appearance = nil,
--   settings = {
--       { mode = "invincible", active = true },
--       { mode = "ignore", active = true },
--       { mode = "freeze", active = true },
--   },
--   flags = {
--     isNPC = true,
--     isGarbageInst = true,
--   },
-- }

-- Generic.NPCS[#Generic.NPCS + 1] = {
--   id = "chicken_seller",
--   name = "Chicken Seller",
--   pedType = 2,
--   model = "s_m_y_factory_01",
--   networked = false,
--   distance = 35.0,
--   position = {
--     coords = vector3(180.22940063477, -1638.0153808594, 28.291742324829 ),
--     heading = 206.40956115723,
-- },
--   appearance = nil,
--   settings = {
--       { mode = "invincible", active = true },
--       { mode = "ignore", active = true },
--       { mode = "freeze", active = true },
--   },
--   flags = {
--     -- isNPC = true,
--     isChickienSeller = true,
--   },
--   scenario = "WORLD_HUMAN_AA_SMOKE"
-- }

-- Generic.NPCS[#Generic.NPCS + 1] = {
--   id = "chicken_start",
--   name = "Chicken Spawn",
--   pedType = 5,
--   model = "a_m_m_hillbilly_01",
--   networked = false,
--   distance = 35.0,
--   position = {
--     coords = vector3(2387.9135742188, 5046.1362304688, 46.424026489258 - 1),
--     heading = 250.26934814453,
--     random = true
--   },
--   appearance = nil,
--   settings = {
--       { mode = "invincible", active = true },
--       { mode = "ignore", active = true },
--       { mode = "freeze", active = true },
--   },
--   flags = {
--     isChickienSeller = true,
--   },
--   scenario = "WORLD_HUMAN_DRINKING"
-- }

-- Generic.NPCS[#Generic.NPCS + 1] = {
--   id = "city_hall_npc_m",
--   name = "City Hall Male",
--   pedType = 4,
--   model = "s_m_m_movprem_01",
--   networked = false,
--   distance = 50.0,
--   position = {
--     coords = vector3(-553.38,-192.37,38.21 - 1),
--     heading = 209.45,
--     random = false
--   },
--   appearance = nil,
--   settings = {
--       { mode = "invincible", active = true },
--       { mode = "ignore", active = true },
--       { mode = "freeze", active = true },
--   },
--   flags = {
--       ['isNPC'] = true,
--   },
--   scenario = "WORLD_HUMAN_CLIPBOARD"
-- }

-- Generic.NPCS[#Generic.NPCS + 1] = {
--   id = "city_hall_npc_f",
--   name = "City Hall Female",
--   pedType = 4,
--   model = "ig_molly",
--   networked = false,
--   distance = 50.0,
--   position = {
--     coords = vector3(-551.37,-191.23,38.21 - 1),
--     heading = 206.38,
--     random = false
--   },
--   appearance = nil,
--   settings = {
--       { mode = "invincible", active = true },
--       { mode = "ignore", active = true },
--       { mode = "freeze", active = true },
--   },
--   flags = {
--       ['isNPC'] = true,
--   },
--   scenario = "WORLD_HUMAN_CLIPBOARD"
-- }

-- Generic.NPCS[#Generic.NPCS + 1] = {
--   id = "car_rental",
--   name = "Car Rental",
--   pedType = 4,
--   model = "csb_popov",
--   networked = false,
--   distance = 50.0,
--   position = {
--     coords = vector3(110.54,-1091.00,29.30 - 1),
--     heading = 6.9090747833252,
--     random = false
--   },
--   appearance = nil,
--   settings = {
--       { mode = "invincible", active = true },
--       { mode = "ignore", active = true },
--       { mode = "freeze", active = true },
--   },
--   flags = {
--       ['isNPC'] = true,
--   },
--   scenario = "WORLD_HUMAN_CLIPBOARD"
-- }

-- Generic.NPCS[#Generic.NPCS + 1] = {
--   id = "pd_carbuy",
--   name = "MRPD Car Buy",
--   pedType = 4,
--   model = "s_m_m_prisguard_01",
--   networked = false,
--   distance = 50.0,
--   position = {
--     coords = vector3(444.15, -974.42,25.69 - 1),
--     heading = 217.808,
--     random = false
--   },
--   appearance = nil,
--   settings = {
--       { mode = "invincible", active = true },
--       { mode = "ignore", active = true },
--       { mode = "freeze", active = true },
--   },
--   flags = {
--       ['isNPC'] = true,
--   },
--   scenario = "WORLD_HUMAN_CLIPBOARD"
-- }

-- Generic.NPCS[#Generic.NPCS + 1] = {
--   id = "impoundlot_ped",
--   name = "Impound Lot",
--   pedType = 4,
--   model = "a_m_m_skidrow_01",
--   networked = false,
--   distance = 50.0,
--   position = {
--     coords = vector3(409.19, -1622.90,29.29 - 1),
--     heading = 226.297,
--     random = false
--   },
--   appearance = nil,
--   settings = {
--       { mode = "invincible", active = true },
--       { mode = "ignore", active = true },
--       { mode = "freeze", active = true },
--   },
--   flags = {
--       ['isNPC'] = true,
--   },
--   scenario = "WORLD_HUMAN_LEANING"
-- }

-- Generic.NPCS[#Generic.NPCS + 1] = {
--   id = "policeimpound_ped",
--   name = "Police Impound Lot",
--   pedType = 4,
--   model = "s_m_m_prisguard_01",
--   networked = false,
--   distance = 50.0,
--   position = {
--     coords = vector3(383.38, -1612.53,29.29 - 1),
--     heading = 223.13,
--     random = false
--   },
--   appearance = nil,
--   settings = {
--       { mode = "invincible", active = true },
--       { mode = "ignore", active = true },
--       { mode = "freeze", active = true },
--   },
--   flags = {
--       ['isNPC'] = true,
--   },
--   scenario = "WORLD_HUMAN_CLIPBOARD"
-- }

-- Generic.NPCS[#Generic.NPCS + 1] = {
--   id = "laptop_1",
--   name = "laptop vendor",
--   pedType = 2,
--   model = "a_m_y_stwhi_01",
--   networked = false,
--   distance = 50.0,
--   position = {
--     coords = vector3(-1358.93, -759.38, 21.32 - 1.0), --   -1358.93, -759.38, 21.32, 346.47
--     heading = 346.47,
-- },
--   appearance = nil,
--   settings = {
--       { mode = "invincible", active = true },
--       { mode = "ignore", active = true },
--       { mode = "freeze", active = true },
--   },
--   flags = {
--     ['isNPC'] = true,
--     --isLaptopInst = true,
--   },
-- }

-- MILINDRO WEED

 Generic.NPCS[#Generic.NPCS + 1] = {
   id = "join_vendor",
   name = "join_vendor",
   pedType = 2,
   model = "a_m_m_og_boss_01",
   networked = false,
   distance = 50.0,
   position = {
     coords = vector3(1148.0798339844, -437.89566040039, 66.9 - 1.0), --   1148.0798339844, -437.89566040039, 66.997009277344 Heading: 341.26635742188
     heading = 341.06,
 },
   appearance = nil,
   settings = {
       { mode = "invincible", active = true },
       { mode = "ignore", active = true },
       { mode = "freeze", active = true },
   },
   flags = {
     ['isNPC'] = true,
     ['isHouseGuy2'] = true
   },
   scenario = "WORLD_HUMAN_CLIPBOARD"
 }