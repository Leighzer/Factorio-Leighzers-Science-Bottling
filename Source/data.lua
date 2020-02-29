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

    leighzermods.leighzersciencebottling.tints.automation = {r=219/255, g=50/255, b=50/255, a = 1} -- 219, 50, 50 these commented values are what I used for making the graphics mostly for my own reference
    leighzermods.leighzersciencebottling.tints.logistic = {r=149/255, g=206/255, b=129/255, a = 1} --37.1, 64.1, 27.6
    leighzermods.leighzersciencebottling.tints.military = {r=135/255, g=146/255, b=155/255, a = 1} --47.9, 51.3, 54.0
    leighzermods.leighzersciencebottling.tints.chemical = {r=97/255, g=216/255, b=234/255, a = 1} --8.6,64.2,76.5
    leighzermods.leighzersciencebottling.tints.production = {r=152/255, g=26/255, b=202/255, a = 1}--71.6,0.0,100
    leighzermods.leighzersciencebottling.tints.utility = {r=208/255, g=177/255, b=20/255, a = 1}--71.6,60.9,6.9
    leighzermods.leighzersciencebottling.tints.space = {r=222/255, g=222/255, b=222/255, a = 1}--57.3,57.3,57.3
    --leighzermods.leighzersciencebottling.tints.advancedLogistic = {r=1,g=0.1,b=1, a=1}--100, 0, 66.7

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




