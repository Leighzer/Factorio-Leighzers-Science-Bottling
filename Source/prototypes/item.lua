data:extend(
{ 
  {
    type = "item",
    name = "sand",
    icon = "__leighzersciencebottling__/graphics/icons/sand.png",
    icon_size = 64,            
    subgroup = "leighzersciencebottling-top-row",
    order = "a-a",
    stack_size = 100,
  },
  {
    type = "item",
    name = "glass-bottle",
    icon = "__leighzersciencebottling__/graphics/icons/glass-bottle.png",
    icon_size = 32,            
    subgroup = "leighzersciencebottling-top-row",
    order = "a-b",
    stack_size = 100,
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
    order = "y-a",
    stack_size = 50,
  }
})
end
