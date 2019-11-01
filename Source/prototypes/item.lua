data:extend(
{ 
  {
    type = "item",
    name = "sand-ore",
    icon = "__leighzersciencebottling__/graphics/icons/sand-ore.png",
    icon_size = 32,            
    subgroup = "raw-resource",
    order = "a-d-b",
    stack_size = 50,
  },
  {
    type = "item",
    name = "glass-bottle",
    icon = "__leighzersciencebottling__/graphics/icons/glass-bottle.png",
    icon_size = 32,            
    subgroup = "leighzersciencebottling-top-row",
    order = "a-a",
    stack_size = 100,
  },
  {
    type = "item",
    name = "slowncheap-chemical-plant",
    icon = "__leighzersciencebottling__/graphics/icons/slowncheap-chemical-plant.png",
    icon_size = 32,            
    subgroup = "leighzersciencebottling-top-row",
    order = "a-b",
    place_result = "slowncheap-chemical-plant",
    stack_size = 10,
  }
})



if leighzermods.leighzersciencebottling.isPrecursoreEnabled then
  data:extend(
{ 
  {
    type = "item",
    name = "precursore-ore",
    icons = {{icon = "__leighzersciencebottling__/graphics/icons/precursore-ore.png"}},
    icon_size = 32,            
    subgroup = "raw-resource",
    order = "a-d-c",
    stack_size = 50,
  }
})
end
