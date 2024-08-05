-- Require/Dependancies
require("__real-life-chemicals__/prototypes/elements.lua")
require("__real-life-chemicals__/prototypes/technology.lua")
require("__real-life-chemicals__/prototypes/entities.lua")

-- ItemGroups
local periodic_table = {
  type = "item-group",
  name = "periodic-table",
  icon = "__real-life-chemicals__/graphics/icons/placeholder.png",
  icon_size = 256,
  order = "e"
}

local elements_col_1 = {
  type = "item-subgroup",
  name = "elements-col-1",
  group = "periodic-table",
  order = "a"
}

data:extend{periodic_table, elements_col_1}
