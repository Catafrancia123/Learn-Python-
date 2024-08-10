-- Functions
local function add_list_to_table(tab, list)
  for _, v in pairs(list) do
    table.insert(tab, v)
  end
end

-- Icons
local placeholder = "__real-life-mod__/graphics/icons/placeholder.png"
local ironpoleicon = "__real-life-mod__/graphics/icons/iron_pole.png"
local glassicon2 = "__real-life-mod__/graphics/icons/glass_icon2.png"
local emptyflask = "__real-life-mod__/graphics/icons/empty_flask.png"
local sandicon = "__real-life-mod__/graphics/icons/sand.png"

--Entities & Prototypes
local boffshore = table.deepcopy(data.raw["offshore-pump"]["offshore-pump"]) 
local iron_pole = table.deepcopy(data.raw["electric-pole"]["small-electric-pole"]) 
local flame = table.deepcopy(data.raw["fluid"]["steam"])

flame.name = "irl-flame"
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

boffshore.pumping_speed = 40
boffshore.fluid = "water"
boffshore.name = "irl-better-offshore-pump"
boffshore.circuit_wire_max_distance = 30
boffshore.icons = {
  {
    icon = boffshore.icon,
    icon_size = boffshore.icon_size,
  }
}
boffshore.minable = {
  mining_time = 1,
  result = "irl-better-offshore-pump-item"
}

iron_pole.name = "irl-small-iron-electric-pole"
iron_pole.maximum_wire_distance = 8.75
iron_pole.supply_area_distance = 3
iron_pole.icons = {
  {
    icon = ironpoleicon,
    icon_size = 256,
  }
}
iron_pole.minable = {
  mining_time = 1,
  result = "irl-small-iron-electric-pole-item"
}

data:extend{boffshore, iron_pole}

--Item Definitions
local boffshore_item = {
  order = "b[fluids]-b[offshore-pump]",
  stack_size = 10,
  icons = {
    {
      icon = boffshore.icon,
      icon_size = boffshore.icon_size,
    }
  },
  place_result = "irl-better-offshore-pump",
  type = "item",
  name = "irl-better-offshore-pump-item",
  subgroup = "extraction-machine",
}

local iron_pole_item = {
  order = "a[energy]-a[small-iron-electric-pole]",
  stack_size = 50,
  icons = {
    {
      icon = ironpoleicon,
      icon_size = 256,
    }
  },
  place_result = "irl-small-iron-electric-pole",
  type = "item",
  name = "irl-small-iron-electric-pole-item",
  subgroup = "energy-pipe-distribution",
}

local sand = {
  order = "d[and]",
  stack_size = 50,
  icons = {
    {
      icon = sandicon,
      icon_size = 256,
    }
  },
  name = "irl-sand",
  type = "item",
  subgroup = "raw-material",
}

local glass = {
  order = "d[glass]",
  stack_size = 100,
  icons = {
    {
      icon = glassicon2,
      icon_size = 256,
    }
  },
  name = "irl-glass",
  type = "item",
  subgroup = "raw-material",  
}

local flask = {
  order = "e[flask]",
  stack_size = 100,
  icons = {
    {
      icon = emptyflask,
      icon_size = 256,
    }
  },
  name = "irl-flask",
  type = "item",
  subgroup = "intermediate-product",
}

data:extend{boffshore_item, iron_pole_item, sand, glass, flask}

-- Recipes
local sand_recipe = {
  type = "recipe",
  name = "irl-sand-recipe",
  icons = {
    {
      icon = sandicon,
      icon_size = 256
    },
  },
  enabled = true,
  energy_required = 1, -- time to craft in seconds (at crafting speed 1)
  ingredients = {{"stone", 1}},
  results = {{type = "item", name = "irl-sand", amount = 1}}
}

local glass_recipe = {
  type = "recipe",
  name = "irl-glass-recipe",
  category = "smelting",
  icons = {
    {
      icon = glassicon2,
      icon_size = 256
    },
  },
  enabled = true,
  energy_required = 5, -- time to craft in seconds (at crafting speed 1)
  ingredients = {{"irl-sand", 5}},
  results = {{type = "item", name = "irl-glass", amount = 1}}
}

local flask_recipe = {
  type = "recipe",
  name = "irl-flask-recipe",
  icons = {
    {
      icon = emptyflask,
      icon_size = 256
    },
  },
  enabled = true,
  energy_required = 3, -- time to craft in seconds (at crafting speed 1)
  ingredients = {{"irl-glass", 2}},
  results = {{type = "item", name = "irl-flask", amount = 1}}
}

local boffshore_recipe = {
  type = "recipe",
  name = "irl-better-offshore-pump-recipe",
  icons = {
    {
      icon   = boffshore.icon,
      icon_size = boffshore.icon_size,
    }
  },
  enabled = false,
  energy_required = 5, -- time to craft in seconds (at crafting speed 1)
  ingredients = {{"steel-plate", 10}, {"engine-unit", 5}, {"electronic-circuit", 5}, {"iron-gear-wheel", 20}},
  results = {{type = "item", name = "irl-better-offshore-pump-item", amount = 1}}
}

local iron_pole_recipe = {
  type = "recipe",
  name = "irl-small-iron-electric-pole-recipe",
  icons = {
    {
      icon   = ironpoleicon,
      icon_size = 256,
    }
  },
  enabled = false,
  energy_required = 2, -- time to craft in seconds (at crafting speed 1)
  ingredients = {{"iron-stick", 2}, {"copper-cable", 5}},
  results = {{type = "item", name = "irl-small-iron-electric-pole-item", amount = 1}}
}

data:extend{sand_recipe, glass_recipe, flask_recipe, boffshore_recipe, iron_pole_recipe}