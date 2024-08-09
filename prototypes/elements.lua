-- Icons
local placeholder = "__real-life-mod__/graphics/icons/placeholder.png"

-- Prototypes
local hydrogen = table.deepcopy(data.raw["fluid"]["steam"])

hydrogen.name = "irl-hydrogen"
hydrogen.subgroup = "irl-elements-col-1"
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
  name = "irl-electrolysis",
  icons = {
    {
      icon = placeholder,
      icon_size = 256,
    },
  },
  enabled = false,
  main_product = "irl-hydrogen",
  energy_required = 60, -- time to craft in seconds (at crafting speed 1)
  ingredients = {{type = "fluid", name = "water", amount = 50}},
  results = {{type = "fluid", name = "irl-hydrogen", amount = 25}, {type = "fluid", name = "steam", amount = 12.5}}
}

data:extend{hydrogen, electrolysis}