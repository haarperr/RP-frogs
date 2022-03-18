
MenuData = {
  apartment_check = {
    {
      title = "Apartment",
      description = "Forclose Apartment",
      key = "judge",
      children = {
          { title = "Yes", action = "drp-apartments:handler", key = { forclose = true} },
          { title = "No", action = "drp-apartments:handler", key = { forclose = false } },
      }
    }
  }
}
