data:extend(
{ 
  {
    type = "item-group",
    name = "leighzersciencebottling",
    order = "y",
    inventory_order = "y",
    icon = "__leighzersciencebottling__/graphics/item-group/category.png",
	icon_size = 128,
  },
  {
    type = "item-subgroup",
    name = "leighzersciencebottling-top-row",
	group = "leighzersciencebottling",
	order = "a", 
  },
  {
    type = "item-subgroup",
    name = "leighzersciencebottling-vanilla-liquid-science",
	group = "leighzersciencebottling",
	order = "b", 
  },
  {
    type = "item-subgroup",
    name = "leighzersciencebottling-leighzerscienceores-liquid-science",
	group = "leighzersciencebottling",
	order = "c", 
  },
  {
    type = "item-subgroup",
    name = "leighzersciencebottling-liquid-science-barreling-fill",
	group = "leighzersciencebottling",
	order = "d", 
  },
  {
    type = "item-subgroup",
    name = "leighzersciencebottling-liquid-science-barreling-empty",
	group = "leighzersciencebottling",
	order = "e", 
  }
})

if mods["leighzerscienceores"] and leighzermods.leighzersciencebottling.onlyNeedToBottleScienceOres then
  data:extend(
    { 
      {
        type = "item-subgroup",
        name = "leighzersciencebottling-alt-science-pack",
        group = "intermediate-products",
        order = "ga"
      },
    })
end