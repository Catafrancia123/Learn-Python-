-- Icons
local placeholder = "__real-life-chemicals__/graphics/icons/placeholder.png"

-- Prototypes
local hydrogen = table.deepcopy(data.raw["fluid"]["steam"])

hydrogen.name = "hydrogen"
hydrogen.subgroup = "elements-col-1"
hydrogen.default_temperature = 0
hydrogen.max_temperature = 450  
hydrogen.base_color = {r=255,g=255,b=255}
hydrogen.emissions_multiplier = 10
hydrogen.icons = {
  {
    icon = placeholder,
    icon_size = 256,
  },
}

data:extend{hydrogen}

-- Recipes
local electrolysis = {
  type = "recipe",
  category = "chemistry",
  name = "electrolysis",
  icons = {
    {
      icon = placeholder,
      icon_size = 256,
    },
  },
  enabled = false,
  main_product = "hydrogen",
  energy_required = 60, -- time to craft in seconds (at crafting speed 1)
  ingredients = {{type = "fluid", name = "water", amount = 50}},
  results = {{type = "fluid", name = "hydrogen", amount = 2}}
}

data:extend{hydrogen, electrolysis}
