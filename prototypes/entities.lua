-- Functions
function add_list_to_table(tab, list)
  for _, v in pairs(list) do
    table.insert(tab, v)
  end
end

-- Icons
local placeholder = "__real-life-chemicals__/graphics/icons/placeholder.png"

-- Prototypes
local flame = table.deepcopy(data.raw["fluid"]["steam"])

flame.name = "flame"
flame.subgroup = "fluid"
flame.default_temperature = 600
flame.max_temperature = 800
flame.base_color = {r=226,g=88,b=34}
flame.icons = {
  {
    icon = flame.icon,
    icon_size = flame.icon_size,
    tint = {r=226,g=88,b=34}
  },
}

data:extend({flame})

--Entities
local combustionchamber = table.deepcopy(data.raw["assembling-machine"]["chemical-plant"])
local combustiongenerator = table.deepcopy(data.raw["generator"]["steam-engine"])

combustionchamber.ingredient_count = 10
combustionchamber.energy_usage = "1MW"
combustionchamber.crafting_speed = 1
add_list_to_table(combustionchamber.allowed_effects, {"productivity", "consumption", "pollution"})
add_list_to_table(combustionchamber.crafting_categories, {"crafting-with-fluid"})
combustionchamber.return_ingredients_on_change = false
combustionchamber.energy_source.type = "electric"
combustionchamber.energy_source.usage_priority = "secondary-input"
combustionchamber.energy_source.emissions_per_minute = 5
combustionchamber.name = "combustion-chamber-entity"
combustionchamber.subgroup = "energy"

combustiongenerator.energy_source.usage_priority = "secondary-output"
combustiongenerator.fluid_usage_per_tick = 1
combustiongenerator.fluid_box.pipe_connections = {
  {
    type = "input",
    position = {0,3}
  }
}
combustiongenerator.fluid_box.filter = "flame"
combustiongenerator.name = "combustion-generator-entity"
combustiongenerator.max_power_output = "5MW"
combustiongenerator.maximum_temperature = 800
combustiongenerator.subgroup = "energy"

data:extend({combustionchamber, combustiongenerator})

--Item Definitions
local combustionchamberi = {
  stack_size = 50,
  icons = {
    {
      icon = placeholder,
      icon_size = 32
    },
  },
  place_result = "combustion-chamber-entity",
  type = "item",
  name = "combustion-chamber",
}

local combustiongeneratori = {
  stack_size = 50,
  icons = {
    {
      icon = placeholder,
      icon_size = 32
    },
  },
  place_result = "combustion-chamber-entity",
  type = "item",
  name = "combustion-generator",
}

data:extend({combustionchamberi, combustiongeneratori})

-- Recipes

local combustionchamberr = {
  type = "recipe",
  name = "combustion-chamber",
  icons = {
    {
      icon = placeholder,
      icon_size = 32
    },
  },
  enabled = false,
  energy_required = 15, -- time to craft in seconds (at crafting speed 1)
  ingredients = {{"steel-plate", 50}, {"copper-plate", 100}, {"pipe", 30}, {"electronic-circuit", 25}, {"iron-gear-wheel", 10}},
  results = {{type = "item", name = "combustion-chamber", amount = 1}}
}

local combustiongeneratorr = {
  type = "recipe",
  name = "combustion-generator",
  icons = {
    {
      icon = placeholder,
      icon_size = 32
    },
  },
  enabled = false,
  energy_required = 20, -- time to craft in seconds (at crafting speed 1)
  ingredients = {{"steel-plate", 50}, {"iron-plate", 100}, {"iron-gear-wheel", 20}},
  results = {{type = "item", name = "combustion-generator", amount = 1}}
}

local combustion = {
  type = "recipe",
  name = "combustion",
  category = "crafting-with-fluid",
  icons = {
    {
      icon = placeholder,
      icon_size = 32
    },
  },
  enabled = false,
  energy_required = 0.1, -- time to craft in seconds (at crafting speed 1)
  ingredients = {{type = "fluid", name = "hydrogen", amount = 2}},
  results = {{type = "fluid", name = "flame", amount = 200}}
}

data:extend{combustionchamber, combustionchamberr}
data:extend{combustiongenerator, combustiongeneratorr}
data:extend{flame, combustion}