Enabled = {
    ['Playground_1'] = true,
    ['Terrain_1'] = true,
    ['Vegetation_1'] = true,
  }
  
  IPLs = {
    Playground_1 = {
        "gabz_npa_hyperpipe",
    },
    Terrain_1 = {
        "gabz_npa_terrain1",
    },
    Vegetation_1 = {
        "gabz_npa_fern_proc",
        "gabz_npa_grass_mix_proc",
        "gabz_npa_grass_proc",
        "gabz_npa_grass_sm_proc",
        "gabz_npa_grass_xs_proc",
        "gabz_npa_log_proc",
        "gabz_npa_stones_proc",
        "gabz_npa_trees"
    },
  }
  
  Citizen.CreateThread(function()
    local cInteriorId = GetInteriorAtCoords(5515.0, 5985.28, 590.01)
    ActivateInteriorEntitySet(cInteriorId, "set_arena_dirt")
    ActivateInteriorEntitySet(cInteriorId, "set_npa")
    RefreshInterior(cInteriorId)
  end)
  
  Citizen.CreateThread(function()
    Citizen.Wait(60000)
    for category, iplName in pairs(IPLs) do
      if Enabled[category] then
        for k,v in pairs(iplName) do 
          RequestIpl(v)
        end
      end
    end
  end)