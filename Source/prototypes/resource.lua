
function AddResource(resourceName)
  data:extend({   
    {
    type = "resource",
    name = resourceName .. "-ore",
    icons = {{icon = "__leighzersciencebottling__/graphics/icons/"..resourceName.."-ore.png"}},
    icon_size = 32,
    flags = {"placeable-neutral"},
    order="h",
    map_color = leighzermods.leighzersciencebottling.tints[resourceName],--color used for ore patch when viewed from mini map
    minable =
    {     
      mining_particle = resourceName.."-ore-particle",
      mining_time = 1,
      result = resourceName.."-ore"
    },
    collision_box = {{ -0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{ -0.5, -0.5}, {0.5, 0.5}},
    autoplace = resource_autoplace.resource_autoplace_settings{
      name = resourceName.."-ore",
      order = "y",
      base_density = 10,
      has_starting_area_placement = hasStartingAreaPlacement,
      resource_index = resource_autoplace.get_next_resource_index() + 80,
      regular_rq_factor_multiplier = 1.10,
      starting_rq_factor_multiplier = 1.5
    },
    stage_counts = {15000, 8000, 4000, 2000, 1000, 500, 200, 80},
    stages =
      {
        sheet =
        {
          filename = "__leighzersciencebottling__/graphics/entity/ore/"..resourceName.."-ore.png",          
          priority = "extra-high",
          width = 64,
          height = 64,
          frame_count = 8,
          variation_count = 8,        
        }
      },
    }
  })
end

AddResource('sand')

if leighzermods.leighzersciencebottling.isPrecursoreEnabled then
  AddResource('precursore')
end