data:extend(
{

    {--autoplace-control = new game mapgen menu item to toggle ore generation options (frequency,size,richness,etc.)
        type = "autoplace-control",
        name = "sand-ore",
        richness = true,
        order = "y-a",
        category="resource"
    },
    {
    type = "noise-layer",
    name = "sand-ore"
    }   

})

if leighzermods.leighzersciencebottling.isPrecursoreEnabled then
    data:extend({
        {
            type = "autoplace-control",
            name = "precursore-ore",
            richness = true,
            order = "y-b",
            category="resource"
            },
            {
            type = "noise-layer",
            name = "precursore-ore"
            }
    })
end