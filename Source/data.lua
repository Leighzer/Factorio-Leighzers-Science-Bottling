if not leighzermods then --generic mod variable to store information that may be needed later
    leighzermods = {}
end

if not leighzermods.leighzersciencebottling then
    leighzermods.leighzersciencebottling = {} 
    leighzermods.leighzersciencebottling.isPrecursoreEnabled = settings.startup["isPrecursoreEnabled"].value
    if mods["leighzerscienceores"] then
        leighzermods.leighzersciencebottling.onlyNeedToBottleScienceOres = settings.startup["onlyNeedToBottleScienceOres"].value
    end
end

if not leighzermods.leighzersciencebottling.productivityEnabledRecipes then --list of recipe names that are going to get productivity modules enabled
    leighzermods.leighzersciencebottling.productivityEnabledRecipes = {}
end

if not leighzermods.leighzersciencebottling.tints then
    leighzermods.leighzersciencebottling.tints = {}
    leighzermods.leighzersciencebottling.tints["precursore"] = {r=68/255, g=225/255, b=253/255, a = 1} 
    leighzermods.leighzersciencebottling.tints["sand"] = {r=230/255, g=224/255, b=194/255, a = 1} --70.7 63.0 28.5
end

require("prototypes.entity")
require("prototypes.fluid")
require("prototypes.category")

require("prototypes.particle")
require("prototypes.mapgen")
require("prototypes.resource")


require("prototypes.item")
require("prototypes.recipe")




