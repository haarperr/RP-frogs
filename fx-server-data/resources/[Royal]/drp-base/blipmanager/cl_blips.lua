local blips = {
    {id = "courthouse", name = "Los Santos Courthouse", scale = 0.7, color = 5, sprite = 58, x=243.36264038086, y=-1077.0593261719, z=29.296752929688},
    {id = "Cluckin Bell", name = "Cluckin Bell", scale = 0.8, color = 47, sprite = 106, x=-517.5978, y=-696.2816, z=33.1680},
    {id = "Burger Shot", name = "Burger Shot", scale = 0.7, color = 8, sprite = 537, x=-1191.6701660156, y=-889.74584960938, z= 14.508341789246},
    {id = "police1", name = "Police Department HQ", scale = 0.7, color = 3, sprite = 60, x = 425.130, y = -979.558, z = 30.711},
    {id = "police2", name= "Sheriff Department HQ", scale = 0.7, color = 52, sprite=60, x=-450.063201904297, y=6016.5751953125, z=31.7163734436035},
    {id = "police3", name= "State Police HQ", scale = 0.7, color = 16, sprite=60, x=373.1340637207, y=-1602.3824462891, z=30.0380859375},
    {id = "police4", name = "Police Air HQ", scale = 0.7, color = 3, sprite = 43, x = 449.359, y = -980.727, z = 42.60},
    {id = "police5", name = "Prison", scale = 0.7, color = 76, sprite = 237, x = 1679.049, y = 2513.711, z = 45.565},
    {id = "cloth1", name = "Clothing", scale = 0.7, color = 3, sprite = 73, x = 425.236, y=-806.008, z=29.491},
    {id = "cloth2", name = "Clothing", scale = 0.7, color = 3, sprite = 73, x = -162.658, y=-303.397, z=39.733},
    {id = "cloth3", name = "Clothing", scale = 0.7, color = 3, sprite = 73, x = 75.950, y=-1392.891, z=29.376},
    {id = "cloth4", name = "Clothing", scale = 0.7, color = 3, sprite = 73, x = -822.194, y=-1074.134, z=11.328},
    {id = "cloth5", name = "Clothing", scale = 0.7, color = 3, sprite = 73, x = -1450.711, y=-236.83, z=49.809},
    {id = "cloth6", name = "Clothing", scale = 0.7, color = 3, sprite = 73, x = 4.254, y=6512.813, z=31.877},
    {id = "cloth7", name = "Clothing", scale = 0.7, color = 3, sprite = 73, x = 615.180, y=2762.933, z=44.088},
    {id = "cloth8", name = "Clothing", scale = 0.7, color = 3, sprite = 73, x = 1196.785, y=2709.558, z=38.222},
    {id = "cloth9", name = "Clothing", scale = 0.7, color = 3, sprite = 73, x = -3171.453, y=1043.857, z=20.863},
    {id = "cloth10", name = "Clothing", scale = 0.7, color = 3, sprite = 73, x = -1100.959, y=2710.211, z=19.107},
    {id = "cloth11", name = "Clothing", scale = 0.7, color = 3, sprite = 73, x = -1192.9453125, y=-772.62481689453, z=17.3254737854},
    {id = "cloth12", name = "Clothing", scale = 0.7, color = 3, sprite = 73, x = -707.33416748047, y=-155.07914733887, z=37.415187835693},
    {id = "cloth13", name = "Clothing", scale = 0.7, color = 3, sprite = 73, x = 1683.45667, y=4823.17725, z=42.1631294},
    {id = "cloth14", name = "Clothing", scale = 0.7, color = 3, sprite = 73, x = -712.215881, y=-155.352982, z=37.4151268},
    {id = "cloth15", name = "Clothing", scale = 0.7, color = 3, sprite = 73, x =121.76, y=-224.6, z=54.56},
    {id = "cloth16", name = "Clothing", scale = 0.7, color = 3, sprite = 73, x = -1207.5267333984, y=-1456.9530029297, z=4.3763856887817},
    {id = "hosp1", name = "Hospital", scale = 0.7, color = 2, sprite = 61, x = 357.43, y= -593.36, z= 28.79},
    {id = "casino", name = "Diamond Casino", scale = 0.8, color = 26, sprite = 679, x=931.50604248047, y=42.151905059814, z=81.095710754395},
    {id = "cardshop", name = "Comic Store", scale = 0.7, color = 3, sprite = 614, x=-143.68405151367, y=230.39543151855, z=94.94197845459},
    {id = "BestBuds", name = "Best Buds", scale = 0.6, color = 2, sprite = 140, x=378.81, y=-828.44, z= 29.29},
    {id = "unicorn", name = "Vanilla Unicorn", scale = 0.6, color = 83, sprite = 121, x=112.47842407227, y=-1306.8358154297, z= 34.643177032471},
}

AddEventHandler("drp-base:playerSessionStarted", function()
    Citizen.CreateThread(function()
        for k,v in ipairs(blips) do
            DRP.BlipManager:CreateBlip(v.id, v)
        end
    end)
end)


