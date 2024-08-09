-- Icons 
local ironpoleicon = "__real-life-mod__/graphics/icons/iron_pole.png"
local boffshore = table.deepcopy(data.raw["offshore-pump"]["offshore-pump"])
local placeholder = "__real-life-mod__/graphics/icons/placeholder.png"

--Technologies
local boffshore = {
    type = "technology",
    name = "irl-better-offshore-pump-tech",
    icons = {
      {
        icon = boffshore.icon,
        icon_size = boffshore.icon_size,
      }
    },
    effects = { 
      {
        type = "unlock-recipe",
        recipe = "irl-better-offshore-pump-recipe"
      },
    },
    prerequisites = {"engine"},
    unit = {
      count = 200,
      ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
      },
      time = 10
    },
}

local ironpole = {
    type = "technology",
    name = "irl-small-iron-electric-pole-tech",
    icons = {
      {
        icon = ironpoleicon,
        icon_size = 256,
      }
    },
    effects = { 
      {
        type = "unlock-recipe",
        recipe = "irl-small-iron-electric-pole-recipe"
      },
    },
    prerequisites = {"automation"},
    unit = {
      count = 50,
      ingredients = {
        {"automation-science-pack", 1},
      },
      time = 5
    },
}

--Technologies
local chemistry = {
  type = "technology",
  name = "irl-chemistry",
  icons = {
    {
      icon = placeholder,
      icon_size = 256
    },
  },
  effects = { 
    {
      type = "unlock-recipe",
        recipe = "irl-electrolysis"
    },
   
  },
  prerequisites = {"plastics","sulfur-processing"},
  unit = {
    count = 200,
    ingredients = {
      {"automation-science-pack", 1},
      {"logistic-science-pack", 1},
    },
    time = 10 
  },
}

local hydrogen_energy_creation = {
  type = "technology",
  name = "irl-hydrogen-energy",
  icons = {
    {
      icon = placeholder,
      icon_size = 256
    },
  },
  effects = {
    {
      type = "unlock-recipe",
      recipe = "irl-hydrogen-generator-recipe"
    },
   
  },
  prerequisites = {"irl-chemistry"},
  unit = {
    count = 200,
    ingredients = {
      {"automation-science-pack", 1},
      {"logistic-science-pack", 1},
      {"chemical-science-pack", 1},
    },
    time = 20
    },
}

data:extend{boffshore, ironpole, chemistry, hydrogen_energy_creation}