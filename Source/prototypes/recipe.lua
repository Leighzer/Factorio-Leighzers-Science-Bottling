data:extend({
  {
type = "recipe",
name = "stone-to-sand",
enabled = true,
category = "advanced-crafting",
ingredients = {{"stone", 2}},
result = "sand",
result_count = 2,
subgroup = "leighzersciencebottling-top-row",
order = "a-a"
}
})
table.insert(leighzermods.leighzersciencebottling.productivityEnabledRecipes,'stone-to-sand')

data:extend({
        {
    type = "recipe",
    name = "sand-to-glass-bottle",
    energy_required = data.raw["recipe"]["iron-plate"].energy_required, --same time to craft as vanilla iron plate
    enabled = true,
    category = "smelting",
    ingredients = {{"sand", 2}},
    result = "glass-bottle",
    result_count = 1,
    subgroup = "leighzersciencebottling-top-row",
    order = "a-c"
    }
})
table.insert(leighzermods.leighzersciencebottling.productivityEnabledRecipes,'sand-to-glass-bottle')


if leighzermods.leighzersciencebottling.isPrecursoreEnabled then
    data:extend({
        {
    type = "recipe",
    name = "liquify-precursore",
    energy_required = 5, 
    enabled = true,
    category = "chemistry",
    ingredients = {{"precursore-ore", 5},{type="fluid",name="water",amount=50}},
    results = {{type="fluid", name="liquid-precursore",amount=50}},
    subgroup = "leighzersciencebottling-top-row",
    order = "a-a",
    crafting_machine_tint =
    {
      primary = leighzermods.leighzersciencebottling.tints["precursore"],
      secondary = leighzermods.leighzersciencebottling.tints["precursore"],
      tertiary = leighzermods.leighzersciencebottling.tints["precursore"],
      quaternary = leighzermods.leighzersciencebottling.tints["precursore"],
    }
    }
})
table.insert(leighzermods.leighzersciencebottling.productivityEnabledRecipes,'liquify-precursore')
end

