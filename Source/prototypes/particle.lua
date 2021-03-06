function AddParticle(particleName)
  data:extend(
  {
    {--prototype for particles that fly out when you hand mine the ore in the ground
      type = "optimized-particle",
      name = particleName .. "-ore-particle",
      flags = {"not-on-map"},
      life_time = 180,
      pictures =
      {
        {
          filename = "__leighzersciencebottling__/graphics/entity/ore-particle/"..particleName.."-ore-particle-1.png",          
          priority = "extra-high",
          width = 16,
          height = 16,
          frame_count = 1
        },
        {
          filename = "__leighzersciencebottling__/graphics/entity/ore-particle/"..particleName.."-ore-particle-2.png",          
          priority = "extra-high",
          width = 16,
          height = 16,
          frame_count = 1
        },
        {
          filename = "__leighzersciencebottling__/graphics/entity/ore-particle/"..particleName.."-ore-particle-3.png",          
          priority = "extra-high",
          width = 16,
          height = 16,
          frame_count = 1
        },
        {
          filename = "__leighzersciencebottling__/graphics/entity/ore-particle/"..particleName.."-ore-particle-4.png",          
          priority = "extra-high",
          width = 16,
          height = 16,
          frame_count = 1
        }
      },
      shadows =
      {
        {
          filename = "__leighzersciencebottling__/graphics/entity/ore-particle/ore-particle-shadow-1.png",
          priority = "extra-high",
          width = 16,
          height = 16,
          frame_count = 1
        },
        {
          filename = "__leighzersciencebottling__/graphics/entity/ore-particle/ore-particle-shadow-2.png",
          priority = "extra-high",
          width = 16,
          height = 16,
          frame_count = 1
        },
        {
          filename = "__leighzersciencebottling__/graphics/entity/ore-particle/ore-particle-shadow-3.png",
          priority = "extra-high",
          width = 16,
          height = 16,
          frame_count = 1
        },
        {
          filename = "__leighzersciencebottling__/graphics/entity/ore-particle/ore-particle-shadow-4.png",
          priority = "extra-high",
          width = 16,
          height = 16,
          frame_count = 1
        }
      }
    }
  })
end

AddParticle('sand')

if leighzermods.leighzersciencebottling.isPrecursoreEnabled then
  AddParticle('precursore')
end
