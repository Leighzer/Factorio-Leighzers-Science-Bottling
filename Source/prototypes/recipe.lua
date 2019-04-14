
data:extend({
        {
    type = "recipe",
    name = "sand-ore-to-glass-bottle",
    energy_required = data.raw["recipe"]["iron-plate"].energy_required, --same time to craft as vanilla iron plate
    enabled = true,
    category = "smelting",
    ingredients = {{"sand-ore", 2}},
    result = "glass-bottle",
    result_count = 1,
    subgroup = "leighzersciencebottling-top-row",
    order = "a-b"
    }
})
table.insert(leighzermods.leighzersciencebottling.productivityEnabledRecipes,'sand-ore-to-glass-pane')


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
    order = "a-a"
    }
})
table.insert(leighzermods.leighzersciencebottling.productivityEnabledRecipes,'liquify-precursore')
end

data:extend({
  {
type = "recipe",
name = "bottling-plant",
energy_required = 3,
enabled = true,
category = "crafting",
ingredients = {{"iron-plate", 2},{"iron-gear-wheel", 2},{"electronic-circuit", 3},{"pipe", 3}},
result = "bottling-plant",
result_count = 1,
subgroup = "leighzersciencebottling-top-row",
order = "a-c"
}
})
table.insert(leighzermods.leighzersciencebottling.productivityEnabledRecipes,'bottling-plant')

