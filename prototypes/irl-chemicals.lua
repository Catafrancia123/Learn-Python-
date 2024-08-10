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

-- Entities
local hydrogen_generator = table.deepcopy(data.raw["generator"]["steam-engine"])

-- I also had an idea for a hydrogen generator, burn up hydrogen for some power and trace amounts of water - pivin
hydrogen_generator.energy_source.usage_priority = "secondary-output"
hydrogen_generator.fluid_usage_per_tick = 1
hydrogen_generator.fluid_box.pipe_connections = {
  {
    type = "input",
    position = {0,3}
  }
}
hydrogen_generator.fluid_box.filter = "irl-hydrogen"
hydrogen_generator.name = "irl-hydrogen-generator"
hydrogen_generator.max_power_output = "5MW"
hydrogen_generator.maximum_temperature = 800
hydrogen_generator.type = "generator"

data:extend{hydrogen_generator}

-- Item Definitions
local hydrogen_generator_item = {
  order = "b[steam-power]-c[steam-engine]",
  subgroup = "energy",
  stack_size = 50,
  icons = {
    {
      icon = placeholder,
      icon_size = 256
    },
  },
  place_result = "irl-hydrogen-generator",
  type = "item",
  name = "irl-hydrogen-generator-item",
}

data:extend{hydrogen_generator_item}

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

local hydrogen_generator_recipe = {
  type = "recipe",
  name = "irl-hydrogen-generator-recipe",
  icons = {
    {
      icon = placeholder,
      icon_size = 256
    },
  },
  enabled = false,
  energy_required = 10, -- time to craft in seconds (at crafting speed 1)
  ingredients = {{"steel-plate", 15}, {"pipe", 10}, {"iron-gear-wheel", 12}},
  results = {{type = "item", name = "irl-hydrogen-generator-item", amount = 1}}
}

data:extend{electrolysis, hydrogen_generator_recipe}