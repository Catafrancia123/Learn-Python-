-- Icons
local placeholder = "__real-life-chemicals__/graphics/icons/placeholder.png"

--Technologies
local chemistry = {
  type = "technology",
  name = "chemistry",
  icons = {
    {
      icon = placeholder,
      icon_size = 256
    },
  },
  effects = { 
    {
      type = "unlock-recipe",
        recipe = "electrolysis"
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

local combustionenergy = {
  type = "technology",
  name = "combustion-energy",
  icons = {
    {
      icon = placeholder,
      icon_size = 256
    },
  },
  effects = {
    {
      type = "unlock-recipe",
      recipe = "combustion"
    },
    {
      type = "unlock-recipe",
      recipe = "combustion-chamber"
    },
    {
      type = "unlock-recipe",
      recipe = "combustion-generator"
    },
   
  },
  prerequisites = {"chemistry", "oxygen-turbine"},
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

data:extend({chemistry})