fleeca = {}
fleeca.timer = 600 -- countdown to secure lock in seconds (time needed to pass to door to be closed back)
fleeca.hacktime = 1000 -- first door open delay to make time for police to arrive (I highly recommend to leave it be (2.5 min default))
fleeca.maxcash = 200
fleeca.mincash = 150
fleeca.cooldown = 1800
fleeca.mincops = 0
fleeca.vaultdoor = "v_ilev_gb_vauldr"
fleeca.door = "v_ilev_gb_vaubar"
fleeca.office = "v_ilev_gb_teldr"
fleeca.Banks = {
    F1 = {
        doors = {
            startloc = {x = 310.93, y = -284.44, z = 54.16, h = -90.00, animcoords = {x = 311.05, y = -284.00, z = 53.16, h = 248.60}},
            secondloc = {x = 312.93, y = -284.45, z = 54.16, h = 160.91, animcoords = {x = 313.41, y = -284.42, z = 53.16, h = 160.91}}
        },
        prop = {
            first = {coords = vector3(311.5481, -284.5114, 54.285), rot = vector3(90.0, 180.0, 21.0)},
            second = {coords = vector3(312.90, -284.95, 54.285), rot = vector3(90.0, 180.0, 110.0)}
        },
        trolley1 = {x = 313.45, y = -289.24, z = 53.14, h = -15},
        trolley2 = {x = 311.51, y = -288.54, z = 53.14, h = -15},
        trolley3 = {x = 314.49, y = -283.65, z = 53.14, h = 160},
        objects = {
            vector3(313.45, -289.24, 53.14),
            vector3(311.51, -288.54, 53.14),
            vector3(314.49, -283.65, 53.14)
        },
        loot1 = false,
        loot2 = false,
        loot3 = false,
        onaction = false,
        lastrobbed = 0
    },
    F2 = {
        doors = {
            startloc = {x = 146.61, y = -1046.02, z = 29.37, h = 244.20, animcoords = {x = 146.75, y = -1045.60, z = 28.37, h = 244.20}},
            secondloc = {x = 148.76, y = -1045.89, z = 29.37, h = 158.54, animcoords = {x = 149.10, y = -1046.08, z = 28.37, h = 158.54}}
        },
        prop = {
            first = {coords = vector3(147.22, -1046.148, 29.487), rot = vector3(90.0, 180.0, 20.0)},
            second = {coords = vector3(148.57, -1046.578, 29.487), rot = vector3(90.0, 180.0, 110.0)}
        },
        trolley1 = {x = 147.25, y = -1050.38, z = 28.35, h = -15},
        trolley2 = {x = 149.21, y = -1051.07, z = 28.35, h = -15},
        trolley3 = {x = 150.23, y = -1045.40, z = 28.35, h = 160},
        objects = {
            vector3(147.25, -1050.38, 28.35),
            vector3(149.21, -1051.07, 28.35),
            vector3(150.23, -1045.40, 28.35)
        },
        loot1 = false,
        loot2 = false,
        loot3 = false,
        onaction = false,
        lastrobbed = 0
    },
    F3 = {
        doors = {
            startloc = {x = -1211.07, y = -336.68, z = 37.78, h = 296.76, animcoords = {x = -1211.25, y = -336.37, z = 36.78, h = 296.76}}, 
            secondloc = {x = -1209.66, y = -335.15, z = 37.78, h = 213.67, animcoords = {x = -1209.40, y = -335.05, z = 36.78, h = 213.67}}
        },
        prop = {
            first = {coords = vector3(-1210.50, -336.37, 37.901), rot = vector3(-90.0, 0.0, 25.0)},
            second = {coords = vector3(-1209.27, -335.68, 37.90), rot = vector3(90.0, 180.0, 65.0)}
        },
        trolley1 = {x = -1207.50, y = -339.20, z = 36.76, h = 30},
        trolley2 = {x = -1205.61, y = -338.24, z = 36.76, h = 30},
        trolley3 = {x = -1209.10, y = -333.59, z = 36.76, h = 210},
        objects = {
            vector3(-1207.50, -339.20, 36.76),
            vector3(-1205.61, -338.24, 36.76),
            vector3(-1209.10, -333.59, 36.76)
        },
        loot1 = false,
        loot2 = false,
        loot3 = false,
        onaction = false,
        lastrobbed = 0
    },
    F4 = {
        hash = 4231427725, -- exception
        doors = {
            startloc = {x = -2956.68, y = 481.34, z = 15.70, h = 353.97, animcoords = {x = -2956.68, y = 481.34, z = 14.70, h = 353.97}},
            secondloc = {x = -2957.26, y = 483.53, z = 15.70, h = 267.73, animcoords = {x = -2957.26, y = 483.53, z = 14.70, h = 267.73}}
        },
        prop = {
            first = {coords = vector3(-2956.59, 482.05, 15.815), rot = vector3(90.0, 180.0, -88.0)},
            second = {coords = vector3(-2956.60, 483.46, 15.815), rot = vector3(90.0, 180.0, 3.0)}
        },
        trolley1 = {x = -2952.69, y = 483.34, z = 14.68, h = 85},
        trolley2 = {x = -2952.57, y = 485.18, z = 14.68, h = 85},
        trolley3 = {x = -2958.35, y = 484.69, z = 14.68, h = 270},
        objects = {
            vector3(-2952.69, 483.34, 14.68),
            vector3(-2952.57, 485.18, 14.68),
            vector3(-2958.35, 484.69, 14.68)
        },
        loot1 = false,
        loot2 = false,
        loot3 = false,
        onaction = false,
        lastrobbed = 0
    },
    F5 = {
        doors = {
            startloc = {x = -354.15, y = -55.11, z = 49.04, h = 251.05, animcoords = {x = -354.15, y = -55.11, z = 48.04, h = 251.05}},
            secondloc = {x = -351.97, y = -55.18, z = 49.04, h = 159.79, animcoords = {x = -351.97, y = -55.18, z = 48.04, h = 159.79}}
        },
        prop = {
            first = {coords = vector3(-353.50, -55.37, 49.157), rot = vector3(90.0, 180.0, 20.0)},
            second = {coords = vector3(-352.15, -55.77, 49.157), rot = vector3(90.0, 180.0, 110.0)}
        },
        trolley1 = {x = -353.34, y = -59.48, z = 48.01, h = -15},
        trolley2 = {x = -351.57, y = -60.09, z = 48.01, h = -15},
        trolley3 = {x = -350.57, y = -54.45, z = 48.01, h = 160},
        objects = {
            vector3(-353.34, -59.48, 48.01),
            vector3(-351.57, -60.09, 48.01),
            vector3(-350.57, -54.45, 48.01)
        },
        loot1 = false,
        loot2 = false,
        loot3 = false,
        onaction = false,
        lastrobbed = 0
    },
    F6 = {
        doors = {
            startloc = {x = 1176.40, y = 2712.75, z = 38.09, h = 84.83, animcoords = {x = 1176.40, y = 2712.75, z = 37.09, h = 84.83}},
            secondloc = {x = 1174.24, y = 2712.47, z = 38.09, h = 359.05, animcoords = {x = 1174.33, y = 2712.09, z = 37.09, h = 359.05}}
        },
        prop = {
            first = {coords = vector3(1175.70, 2712.82, 38.207), rot = vector3(90.0, 180.0, 180.0)},
            second = {coords = vector3(1174.267, 2712.736, 38.207), rot = vector3(90.0, 180.0, -90.0)}
        },
        trolley1 = {x = 1174.24, y = 2716.69, z = 37.07, h = -180},
        trolley2 = {x = 1172.27, y = 2716.67, z = 37.07, h = -180},
        trolley3 = {x = 1173.23, y = 2711.02, z = 37.07, h = 0},
        objects = {
            vector3(1174.24, 2716.69, 37.07),
            vector3(1172.27, 2716.67, 37.07),
            vector3(1173.23, 2711.02, 37.07)
        },
        loot1 = false,
        loot2 = false,
        loot3 = false,
        onaction = false,
        lastrobbed = 0
    }
}

paleto = {}
paleto.timer = 600 -- countdown to secure lock in seconds (time needed to pass to door to be closed back)
paleto.hacktime = 1000 -- first door open delay to make time for police to arrive (I highly recommend to leave it be (2.5 min default))
paleto.maxcash = 200
paleto.mincash = 150
paleto.cooldown = 3600
paleto.mincops = 0
paleto.vaultdoor = "v_ilev_cbankvauldoor01"

paleto.Banks = {
    P1 = {
        doors = {
            startloc = {x = -105.41538238525, y = 6471.6791992188, z = 31.621948242188, h = 48.188972473145}
        },
        prop = {
            first = {coords = vector3(-105.41538238525,6471.6791992188,31.621948242188), rot = vector3(90.0, 180.0, 21.0)}
        },
        trolley1 = {x = -107.36703491211, y = 6473.9604492188, z = 30.621948242188, h = 311.81103515625},
        trolley2 = {x = -102.81758117676, y = 6476.782226562, z = 30.621948242188, h = 138.89762878418},
        trolley3 = {x = -104.72966766357, y = 6478.5493164062, z = 30.621948242188, h = 136.06298828125},
        objects = {
            vector3(-107.36703491211, 6473.9604492188, 31.621948242188),
            vector3(-102.81758117676, 6476.782226562, 31.621948242188),
            vector3(-104.72966766357, 6478.5493164062, 31.621948242188)
        },
        loot1 = false,
        loot2 = false,
        loot3 = false,
        onaction = false,
        lastrobbed = 0
    }
}

jewelry = {}
jewelry.cooldown = 2700

Config = Config or {}

Config.SmallBanks = {
    [1] = {
        ["label"] = "Lol",
        ["coords"] = {
            ["x"] = 311.15,
            ["y"] = -284.49,
            ["z"] = 54.16,
        },
        ["alarm"] = true,
        ["object"] = GetHashKey("v_ilev_gb_vauldr"),
        ["heading"] = {
            closed = 250.0,
            open = 160.0,
        },
        ["camId"] = 21,
        ["isOpened"] = false,
        ["lockers"] = {
            [1] = {
                x = 311.16, 
                y = -287.71, 
                z = 54.14, 
                ["isBusy"] = false,
                ["isOpened"] = false,
            },
            [2] = {
                x = 311.86, 
                y = -286.21, 
                z = 54.14, 
                ["isBusy"] = false,
                ["isOpened"] = false,
            },
            [3] = {
                x = 313.39, 
                y = -289.15, 
                z = 54.14, 
                ["isBusy"] = false,
                ["isOpened"] = false,
            },
            [4] = {
                x = 311.7, 
                y = -288.45, 
                z = 54.14, 
                ["isBusy"] = false,
                ["isOpened"] = false,
            },
            [5] = {
                x = 314.23, 
                y = -288.77, 
                z = 54.14, 
                ["isBusy"] = false,
                ["isOpened"] = false,
            },
            [6] = {
                x = 314.83, 
                y = -287.33, 
                z = 54.14, 
                ["isBusy"] = false,
                ["isOpened"] = false,
            },
            [7] = {
                x = 315.24, 
                y = -284.85, 
                z = 54.14, 
                ["isBusy"] = false,
                ["isOpened"] = false,
            },
            [8] = {
                x = 314.08, 
                y = -283.38, 
                z = 54.14, 
                ["isBusy"] = false,
                ["isOpened"] = false,
            },
        },
    },
    [2] = {
        ["label"] = "Legion Square",
        ["coords"] = {
            ["x"] = 146.68939208984,
            ["y"] = -1045.8337402344,
            ["z"] = 29.368055343628,
        },
        ["player_heading"] = 244.90969848633,
        ["alarm"] = true,
        ["object"] = GetHashKey("v_ilev_gb_vauldr"),
        ["heading"] = {
            closed = 250.0,
            open = 160.0,
        },
        ["camId"] = 22,
        ["isOpened"] = false,
        ["lockers"] = {
            [1] = {
                x = 149.84, 
                y = -1044.9, 
                z = 29.34,
                ["isBusy"] = false,
                ["isOpened"] = false,
            },
            [2] = {
                x = 151.16, 
                y = -1046.64, 
                z = 29.34,
                ["isBusy"] = false,
                ["isOpened"] = false,
            },
            [3] = {
                x = 147.16, 
                y = -1047.72, 
                z = 29.34,
                ["isBusy"] = false,
                ["isOpened"] = false,
            },
            [4] = {
                x = 146.54, 
                y = -1049.28, 
                z = 29.34,
                ["isBusy"] = false,
                ["isOpened"] = false,
            },
            [5] = {
                x = 146.88, 
                y = -1050.33, 
                z = 29.34,
                ["isBusy"] = false,
                ["isOpened"] = false,
            },
            [6] = {
                x = 150.0, 
                y = -1050.67, 
                z = 29.34,
                ["isBusy"] = false,
                ["isOpened"] = false,
            },
            [7] = {
                x = 149.47, 
                y = -1051.28, 
                z = 29.34,
                ["isBusy"] = false,
                ["isOpened"] = false,
            },
            [8] = {
                x = 150.58, 
                y = -1049.09, 
                z = 29.34,
                ["isBusy"] = false,
                ["isOpened"] = false,
            },
        },
    },
    [3] = {
        ["label"] = "Hawick Ave",
        ["coords"] = {
            ["x"] = -353.82,
            ["y"] = -55.37,
            ["z"] = 49.03,
        },
        ["alarm"] = true,
        ["object"] = GetHashKey("v_ilev_gb_vauldr"),
        ["heading"] = {
            closed = 250.0,
            open = 160.0,
        },
        ["camId"] = 23,
        ["isOpened"] = false,
        ["lockers"] = {
            [1] = {
                x = -350.99, 
                y = -54.13, 
                z = 49.01,
                ["isBusy"] = false,
                ["isOpened"] = false,
            },
            [2] = {
                x = -349.53, 
                y = -55.77, 
                z = 49.01,
                ["isBusy"] = false,
                ["isOpened"] = false,
            },
            [3] = {
                x = -353.54, 
                y = -56.94, 
                z = 49.01,
                ["isBusy"] = false,
                ["isOpened"] = false,
            },
            [4] = {
                x = -354.09, 
                y = -58.55, 
                z = 49.01,
                ["isBusy"] = false,
                ["isOpened"] = false,
            },
            [5] = {
                x = -353.81, 
                y = -59.48, 
                z = 49.01,
                ["isBusy"] = false,
                ["isOpened"] = false,
            },
            [6] = {
                x = -349.8, 
                y = -58.3, 
                z = 49.01,
                ["isBusy"] = false,
                ["isOpened"] = false,
            },
            [7] = {
                x = -351.14, 
                y = -60.37, 
                z = 49.01,
                ["isBusy"] = false,
                ["isOpened"] = false,
            },
            [8] = {
                x = -350.4, 
                y = -59.92, 
                z = 49.01,
                ["isBusy"] = false,
                ["isOpened"] = false,
            },
        },
    },
    [4] = {
        ["label"] = "Del Perro Blvd",
        ["coords"] = {
            ["x"] = -1210.77,
            ["y"] = -336.57,
            ["z"] = 37.78,
        },
        ["alarm"] = true,
        ["object"] = GetHashKey("v_ilev_gb_vauldr"),
        ["heading"] = {
            closed = 296.863,
            open = 206.863,
        },
        ["camId"] = 24,
        ["isOpened"] = false,
        ["lockers"] = {
            [1] = {
                x = -1209.68, 
                y = -333.65, 
                z = 37.75,
                ["isBusy"] = false,
                ["isOpened"] = false,
            },
            [2] = {
                x = -1207.46, 
                y = -333.77, 
                z = 37.75,
                ["isBusy"] = false,
                ["isOpened"] = false,
            },
            [3] = {
                x = -1209.45, 
                y = -337.47, 
                z = 37.75,
                ["isBusy"] = false,
                ["isOpened"] = false,
            },
            [4] = {
                x = -1208.65, 
                y = -339.06, 
                z = 37.75,
                ["isBusy"] = false,
                ["isOpened"] = false,
            },
            [5] = {
                x = -1207.75, 
                y = -339.42, 
                z = 37.75,
                ["isBusy"] = false,
                ["isOpened"] = false,
            },
            [6] = {
                x = -1205.28,
                y = -338.14, 
                z = 37.75,
                ["isBusy"] = false,
                ["isOpened"] = false,
            },
            [7] = {
                x = -1205.08, 
                y = -337.28, 
                z = 37.75,
                ["isBusy"] = false,
                ["isOpened"] = false,
            },
            [8] = {
                x = -1205.92, 
                y = -335.75, 
                z = 37.75,
                ["isBusy"] = false,
                ["isOpened"] = false,
            },
        },
    },
    [5] = {
        ["label"] = "Great Ocean Hwy",
        ["coords"] = {
            ["x"] = -2956.55,
            ["y"] = 481.74,
            ["z"] = 15.69,
        },
        ["alarm"] = true,
        ["object"] = GetHashKey("hei_prop_heist_sec_door"),
        ["heading"] = {
            closed = 357.542,
            open = 267.542,
        },
        ["camId"] = 25,
        ["isOpened"] = false,
        ["lockers"] = {
            [1] = {
                x = -2958.54, 
                y = 484.1, 
                z = 15.67,
                ["isBusy"] = false,
                ["isOpened"] = false,
            },
            [2] = {
                x = -2957.3, 
                y = 485.95, 
                z = 15.67,
                ["isBusy"] = false,
                ["isOpened"] = false,
            },
            [3] = {
                x = -2955.09, 
                y = 482.43, 
                z = 15.67,
                ["isBusy"] = false,
                ["isOpened"] = false,
            },
            [4] = {
                x = -2953.26, 
                y = 482.42, 
                z = 15.67,
                ["isBusy"] = false,
                ["isOpened"] = false,
            },
            [5] = {
                x = -2952.63, 
                y = 483.09, 
                z = 15.67,
                ["isBusy"] = false,
                ["isOpened"] = false,
            },
            [6] = {
                x = -2952.45, 
                y = 485.66, 
                z = 15.67,
                ["isBusy"] = false,
                ["isOpened"] = false,
            },
            [7] = {
                x = -2953.13, 
                y = 486.26, 
                z = 15.67,
                ["isBusy"] = false,
                ["isOpened"] = false,
            },
            [8] = {
                x = -2954.98, 
                y = 486.37, 
                z = 15.67,
                ["isBusy"] = false,
                ["isOpened"] = false,
            },
        },
    },
}
Config.BigBanks = {
    ["pacific"] = {
        ["label"] = "Pacific Standard",
        ["coords"] = {
		    [1] = {
                ["x"] = 256.71,
                ["y"] = 219.86,
                ["z"] = 106.28,
            },
            [2] = {
                ["x"] = 261.95,
                ["y"] = 223.11,
                ["z"] = 106.28,
            },
            [3] = {
                ["x"] = 253.25,
                ["y"] = 228.44,
                ["z"] = 101.68,
            },
			[4] = {
                ["x"] = 254.05,
                ["y"] = 225.38,
                ["z"] = 101.88,
            },
        },
        ["alarm"] = true,
        ["object"] = 961976194,
        ["heading"] = {
            closed = 160.0,
            open = 110.0,
        },
		["isOpened"] = false,
        ["thermite"] = {
            [1] = {
                ["x"] = 252.55,
                ["y"] = 221.15,
                ["z"] = 101.68,
				["isBusy"] = false,
                ["isOpened"] = false,
            },
            [2] = {
                ["x"] = 261.15,
                ["y"] = 215.21,
                ["z"] = 101.68,
				["isBusy"] = false,
                ["isOpened"] = false,
            },
        },
        ["camId"] = 26,
        ["isOpened"] = false,
        ["lockers"] = {
            [1] = {
                x = 258.57, 
                y = 218.36, 
                z = 101.68,
                ["isBusy"] = false,
                ["isOpened"] = false,
            },
            [2] = {
                x = 260.82, 
                y = 217.62, 
                z = 101.68,
                ["isBusy"] = false,
                ["isOpened"] = false,
            },
            [3] = {
                x = 259.33, 
                y = 213.76, 
                z = 101.68,
                ["isBusy"] = false,
                ["isOpened"] = false,
            },
            [4] = {
                x = 257.09, 
                y = 214.55, 
                z = 101.68,
                ["isBusy"] = false,
                ["isOpened"] = false,
            },
            [5] = {
                x = 263.7, 
                y = 216.48, 
                z = 101.68,
                ["isBusy"] = false,
                ["isOpened"] = false,
            },
            [6] = {
                x = 265.81, 
                y = 215.81, 
                z = 101.68,
                ["isBusy"] = false,
                ["isOpened"] = false,
            },
            [7] = {
                x = 266.43, 
                y = 214.37, 
                z = 101.68,
                ["isBusy"] = false,
                ["isOpened"] = false,
            },
            [8] = {
                x = 265.71, 
                y = 212.49, 
                z = 101.68,
                ["isBusy"] = false,
                ["isOpened"] = false,
            },
            [9] = {
                x = 264.24, 
                y = 211.92, 
                z = 101.68,
                ["isBusy"] = false,
                ["isOpened"] = false,
            },
            [10] = {
                x = 262.21, 
                y = 212.67, 
                z = 101.68,
                ["isBusy"] = false,
                ["isOpened"] = false,
            },
        },
    },
}
