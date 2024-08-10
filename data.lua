-- Requires
require("__real-life-mod__/prototypes/technology.lua")
require("__real-life-mod__/prototypes/base.lua")
require("__real-life-mod__/prototypes/irl-chemicals.lua")
require("__real-life-mod__/prototypes/irl-weapons.lua")

-- ItemGroups
local periodic_table = {
  type = "item-group",
  name = "irl-periodic-table",
  icon = "__real-life-mod__/graphics/icons/placeholder.png",
  icon_size = 256,
  order = "e"
}

local elements_col_1 = {
  type = "item-subgroup",
  name = "irl-elements-col-1",
  group = "irl-periodic-table",
  order = "a"
}

data:extend({periodic_table, elements_col_1})

-- Additions to Vanilla prototypes/entities
table.insert(data.raw['recipe']['automation-science-pack'].ingredients, {"irl-flask", 1})
table.insert(data.raw['recipe']['logistic-science-pack'].ingredients, {"irl-flask", 1})
table.insert(data.raw['recipe']['military-science-pack'].ingredients, {"irl-flask", 1})
table.insert(data.raw['recipe']['chemical-science-pack'].ingredients, {"irl-flask", 1})
table.insert(data.raw['recipe']['production-science-pack'].ingredients, {"irl-flask", 1})
table.insert(data.raw['recipe']['utility-science-pack'].ingredients, {"irl-flask", 1})
table.insert(data.raw['recipe']['solar-panel'].ingredients, {"irl-glass", 20})
table.insert(data.raw['recipe']['lab'].ingredients, {"irl-glass", 10})
table.insert(data.raw['recipe']['solar-panel-equipment'].ingredients, {"irl-glass", 10})
table.insert(data.raw['recipe']['laser-turret'].ingredients, {"irl-glass", 10})
table.insert(data.raw['recipe']['chemical-plant'].ingredients, {"irl-glass", 10})
table.insert(data.raw['recipe']['oil-refinery'].ingredients, {"irl-glass", 20})
table.insert(data.raw['recipe']['small-lamp'].ingredients, {"irl-glass", 2})
table.insert(data.raw['recipe']['poison-capsule'].ingredients, {"irl-glass", 2})
table.insert(data.raw['recipe']['night-vision-equipment'].ingredients, {"irl-glass", 5})
table.insert(data.raw['recipe']['slowdown-capsule'].ingredients, {"irl-glass", 2})
table.insert(data.raw['recipe']['satellite'].ingredients, {"irl-glass", 200})
table.insert(data.raw['technology']['military-2'].effects, {type = "unlock-recipe", recipe = "irl-light-machine-gun-recipe"})
table.insert(data.raw['technology']['artillery'].effects, {type = "unlock-recipe", recipe = "irl-nuclear-artillery-shell-recipe"})
table.insert(data.raw['technology']['logistics'].effects, {type = "unlock-recipe", recipe = "irl-small-iron-electric-pole-recipe"})
data.raw['ammo']['artillery-shell'].stack_size = 5