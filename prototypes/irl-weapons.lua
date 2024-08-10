-- Icons 
local placeholder = "__real-life-mod__/graphics/icons/placeholder.png"

-- Entities
local light_machine_gun = table.deepcopy(data.raw["gun"]["submachine-gun"])
local nuclear_artillery_shell = table.deepcopy(data.raw["ammo"]["artillery-shell"])

light_machine_gun.attack_parameters = {
  type = "projectile",
  range = 35,
  cooldown = 10,
}
light_machine_gun.name = "irl-light-machine-gun"
light_machine_gun.icons = {
  {
    icon = light_machine_gun.icon,
    icon_size = light_machine_gun.icon_size,
  }
}

nuclear_artillery_shell.name = "irl-nuclear-artillery-shell"
nuclear_artillery_shell.stack_size = 5
nuclear_artillery_shell.ammo_type = {
  category = "artillery-shell",
  target_type = "position",
}
nuclear_artillery_shell.icons = {
  {
    icon = nuclear_artillery_shell.icon,
    icon_size = nuclear_artillery_shell.icon_size,
  }
}

data:extend{light_machine_gun, nuclear_artillery_shell}

-- Item Definition
local light_machine_gun_item = {
  order = "a[basic-clips]-c[light-machine-gun]",
  subgroup = "gun",
  stack_size = 10,
  icons = {
    {
      icon = light_machine_gun.icon,
      icon_size = light_machine_gun.icon_size
    },
  },
  type = "item",
  name = "irl-light-machine-gun-item",
}

local nuclear_artillery_shell_item = {
  order = "d[explosive-cannon-shell]-e[artillery]",
  subgroup = "ammo",
  stack_size = 10,
  icons = {
    {
      icon = nuclear_artillery_shell.icon,
      icon_size = nuclear_artillery_shell.icon_size
    },
  },
  type = "item",
  name = "irl-nuclear-artillery-shell-item",
}

data:extend{light_machine_gun_item, nuclear_artillery_shell_item}

-- Recipes
local light_machine_gun_recipe = {
  type = "recipe",
  name = "irl-light-machine-gun-recipe",
  icons = {
    {
      icon = placeholder,
      icon_size = 256,
    },
  },
  enabled = false,
  energy_required = 10, -- time to craft in seconds (at crafting speed 1)
  ingredients = {{"copper-plate", 10}, {"iron-plate", 20}, {"iron-gear-wheel", 20}},
  results = {{type = "item", name = "irl-light-machine-gun-item", amount = 1}}
}

local nuclear_artillery_shell_recipe = {
  type = "recipe",
  name = "irl-nuclear-artillery-shell-recipe",
  icons = {
    {
      icon = placeholder,
      icon_size = 256,
    },
  },
  enabled = false,
  energy_required = 10, -- time to craft in seconds (at crafting speed 1)
  ingredients = {{"explosive-uranium-cannon-shell", 4}, {"explosives", 12}, {"radar", 1}},
  results = {{type = "item", name = "irl-nuclear-artillery-shell-item", amount = 1}}
}

data:extend{light_machine_gun_recipe, nuclear_artillery_shell_recipe}