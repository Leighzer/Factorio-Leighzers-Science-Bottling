function CreateLiquidScienceRecipeVanilla(scienceName, sortOrder, isEnabled)  
    data:extend({        
        {
        type = "recipe",
        name = "liquid-" .. scienceName,
        energy_required = data.raw["recipe"][scienceName .. "-pack"].energy_required, 
        enabled = isEnabled,
        category = "chemistry",
        ingredients = {},
        results = {{type="fluid",name="liquid-" .. scienceName,amount=10}},        
        subgroup = "leighzersciencebottling-vanilla-liquid-science",
        order = sortOrder
        }
    })
    data.raw["recipe"]["liquid-" .. scienceName].ingredients = util.table.deepcopy(data.raw["recipe"][scienceName .. "-pack"].ingredients) --get normal ingredients
    table.insert(data.raw["recipe"]["liquid-" .. scienceName].ingredients, {type="fluid",name="water",amount=50}) -- add water as ingredient
    if leighzermods.leighzersciencebottling.isPrecursoreEnabled then
        table.insert(data.raw["recipe"]["liquid-" .. scienceName].ingredients, {type="fluid",name="liquid-precursore",amount=50}) --add precursore as ingredient
    end
    if not isEnabled then --if not enabled
        table.insert(data.raw["technology"][scienceName .. "-pack"].effects, {type = "unlock-recipe",recipe = "liquid-" .. scienceName})--add it as an unlock when pack is researched
    end
    table.insert(leighzermods.leighzersciencebottling.productivityEnabledRecipes,"liquid-" .. scienceName)
end

function CreateLiquidScienceRecipeScienceOre(scienceName,sortOrder,isEnabled)
    
    data:extend({        
        {
        type = "recipe",
        name = "liquid-" .. scienceName.."-science-by-ore",
        energy_required = data.raw["recipe"][scienceName .. "-science-ore-to-science"].energy_required, 
        enabled = isEnabled,
        category = "chemistry",
        ingredients = {},
        results = {{type="fluid",name="liquid-" .. scienceName.."-science",amount=10}},        
        subgroup = "leighzersciencebottling-leighzerscienceores-liquid-science",
        order = sortOrder
        }
    })
    table.insert(data.raw["recipe"]["liquid-" .. scienceName.."-science-by-ore"].ingredients, {scienceName.."-science-ore",leighzermods.leighzerscienceores[scienceName.."Requirement"]})-- add science ore
    table.insert(data.raw["recipe"]["liquid-" .. scienceName.."-science-by-ore"].ingredients, {type="fluid",name="water",amount=50}) -- add water as ingredient
    if leighzermods.leighzersciencebottling.isPrecursoreEnabled then
        table.insert(data.raw["recipe"]["liquid-" .. scienceName.."-science-by-ore"].ingredients, {type="fluid",name="liquid-precursore",amount=50}) --add liquid precursore as ingredient
    end
    if not isEnabled then --if not enabled
        table.insert(data.raw["technology"][scienceName .. "-science-pack"].effects, {type = "unlock-recipe",recipe = "liquid-" .. scienceName .. "-science-by-ore"})--add it as an unlock when pack is researched
    end
    table.insert(leighzermods.leighzersciencebottling.productivityEnabledRecipes,"liquid-" .. scienceName.."-science-by-ore")
end

function VanillaLiquidScienceRecipes()--create vanilla item to liquid science recipes
    --create vanilla to liquid science recipes
    CreateLiquidScienceRecipeVanilla("automation-science",0,true)
    CreateLiquidScienceRecipeVanilla("logistic-science",1,false)
    CreateLiquidScienceRecipeVanilla("military-science",2,false)
    CreateLiquidScienceRecipeVanilla("chemical-science",3,false)
    CreateLiquidScienceRecipeVanilla("production-science",4,false)
    CreateLiquidScienceRecipeVanilla("utility-science",5,false)    
end

function ScienceOreLiquidScienceRecipes()-- create science ores to liquid science recipes
    --create science ore to liquid science recipes
    if leighzermods.leighzerscienceores.automationEnabled then
        CreateLiquidScienceRecipeScienceOre("automation",0,true)
    end
    if leighzermods.leighzerscienceores.logisticEnabled then
        CreateLiquidScienceRecipeScienceOre("logistic",1,false)
    end
    if leighzermods.leighzerscienceores.militaryEnabled then
        CreateLiquidScienceRecipeScienceOre("military",2,false)
    end
    if leighzermods.leighzerscienceores.chemicalEnabled then
        CreateLiquidScienceRecipeScienceOre("chemical",3,false)
    end
    if leighzermods.leighzerscienceores.productionEnabled then
        CreateLiquidScienceRecipeScienceOre("production",4,false)
    end
    if leighzermods.leighzerscienceores.utilityEnabled then
        CreateLiquidScienceRecipeScienceOre("utility",5,false)
    end
    if leighzermods.leighzerscienceores.spaceEnabled then
        CreateLiquidScienceRecipeScienceOre("space",6,false)    
    end
end

function MakeSciencePackRequireLiquid(scienceName)
    local recipe = data.raw["recipe"][scienceName .. "-pack"]          
    recipe.category = "chemistry"
    recipe.ingredients = {{type="fluid",name="liquid-"..scienceName,amount=10},{"glass-bottle",1}}
    recipe.result = nil
    recipe.result_count = nil
    recipe.results = {{scienceName .. "-pack",1}}    
end

function MakeSpaceSciencePackRequireLiquid()
    local recipe = data.raw["recipe"]["space-science-ore-to-science"]
    recipe.category = "chemistry"
    recipe.ingredients = {{type="fluid",name="liquid-space-science",amount=10},{"glass-bottle",1}}
    recipe.result = nil
    recipe.result_count = nil
    recipe.results = {{"space-science-pack",1}}  
    recipe.subgroup = "science-pack" 
    recipe.order = "z"
end

function MakeSciencePacksRequireLiquid()
    MakeSciencePackRequireLiquid("automation-science")
    MakeSciencePackRequireLiquid("logistic-science")
    MakeSciencePackRequireLiquid("military-science")
    MakeSciencePackRequireLiquid("chemical-science")
    MakeSciencePackRequireLiquid("production-science")
    MakeSciencePackRequireLiquid("utility-science")
    if mods["leighzerscienceores"]then
        if leighzermods.leighzerscienceores.spaceEnabled then
            MakeSpaceSciencePackRequireLiquid()
        end
    end
end

function HideScienceOreToPackRecipe(scienceName)
    data.raw.recipe[scienceName.. "-ore-to-science"].hidden= true
end

function HideScienceOreToPackRecipes()
    if leighzermods.leighzerscienceores.automationEnabled then
        HideScienceOreToPackRecipe("automation-science")
    end
    if leighzermods.leighzerscienceores.logisticEnabled then
        HideScienceOreToPackRecipe("logistic-science")
    end
    if leighzermods.leighzerscienceores.militaryEnabled then
        HideScienceOreToPackRecipe("military-science")
    end
    if leighzermods.leighzerscienceores.chemicalEnabled then
        HideScienceOreToPackRecipe("chemical-science")
    end
    if leighzermods.leighzerscienceores.productionEnabled then
        HideScienceOreToPackRecipe("production-science")
    end
    if leighzermods.leighzerscienceores.utilityEnabled then
        HideScienceOreToPackRecipe("utility-science")
    end
    --HideScienceOreToPackRecipe("space-science")
end

function FillInVanillaLiquidScienceRecipesWhereOresIsDisabled()--enable vanilla to liquid science where the ore is disabled so a game is possible with disabling certain ores
    if not leighzermods.leighzerscienceores.automationEnabled then
        CreateLiquidScienceRecipeVanilla("automation-science",0,true)
    end
    if not leighzermods.leighzerscienceores.logisticEnabled then
        CreateLiquidScienceRecipeVanilla("logistic-science",1,false)
    end
    if not leighzermods.leighzerscienceores.militaryEnabled then
        CreateLiquidScienceRecipeVanilla("military-science",2,false)
    end
    if not leighzermods.leighzerscienceores.chemicalEnabled then
        CreateLiquidScienceRecipeVanilla("chemical-science",3,false)
    end
    if not leighzermods.leighzerscienceores.productionEnabled then
        CreateLiquidScienceRecipeVanilla("production-science",4,false)
    end
    if not leighzermods.leighzerscienceores.utilityEnabled then
        CreateLiquidScienceRecipeVanilla("utility-science",5,false)
    end    
end

if mods["leighzerscienceores"] then
    if leighzermods.leighzersciencebottling.onlyNeedToBottleScienceOres then
        ScienceOreLiquidScienceRecipes()--create science liquid from science ores
        FillInVanillaLiquidScienceRecipesWhereOresIsDisabled()--enable vanilla to liquid science where the ore is disabled so a game is possible with disabling certain ores
    else
        ScienceOreLiquidScienceRecipes()--create science liquid from science ores
        VanillaLiquidScienceRecipes()--create science liquid from
    end
    HideScienceOreToPackRecipes()
else
    VanillaLiquidScienceRecipes()--create science liquid only by vanilla
end

MakeSciencePacksRequireLiquid()--update science pack recipes to require bottling of liquid

--this function doesn't work
--function RemoveRecipeUnlock(technologyName,recipe)
--    if data.raw.technology[technologyName] and data.raw.technology[technologyName].effects then
--        for i, effect in pairs(data.raw.technology[technologyName].effects) do
--          if effect.type == "unlock-recipe" and effect.recipe == recipe then
--            table.remove(data.raw.technology[technologyName].effects,i)
--          end
--        end
--      end
--end

function MoveBarrelRecipe(scienceName,sortOrder,isEnabled)
    local item = data.raw["item"]["liquid-"..scienceName.."-barrel"]
    item.subgroup = "leighzersciencebottling-liquid-science-barreling-fill"
    item.order = sortOrder
    local fill = data.raw["recipe"]["fill-liquid-"..scienceName.."-barrel"]
    fill.subgroup = "leighzersciencebottling-liquid-science-barreling-fill"
    fill.order = sortOrder
    --RemoveRecipeUnlock("fluid-handling",fill) --actually we are fine with leaving unlock effect under flui
    local empty = data.raw["recipe"]["empty-liquid-"..scienceName.."-barrel"]
    empty.subgroup = "leighzersciencebottling-liquid-science-barreling-empty"
    empty.order = sortOrder
    --RemoveRecipeUnlock("fluid-handling",empty)
    --logic for either moving unlock effect of barrel recipe to somewhere else, or that if it should be unlocked straight away
    --if not isEnabled then 
    --    table.insert(data.raw["technology"][scienceName .. "-pack"].effects,{type="unlock-recipe",recipe=fill.name})--add barreling recipe to unlock when pack does
    --    table.insert(data.raw["technology"][scienceName .. "-pack"].effects,{type="unlock-recipe",recipe=empty.name})
    --else
    --    fill.enabled = isEnabled -- enable the recipe
    --    empty.enabled = isEnabled
    --end
end

function MovePrecursoreBarrelRecipe(liquidName,sortOrder,isEnabled)
    local item = data.raw["item"][liquidName.."-barrel"]
    item.subgroup = "leighzersciencebottling-liquid-science-barreling-fill"
    item.order = sortOrder
    local fill = data.raw["recipe"]["fill-"..liquidName.."-barrel"]
    fill.subgroup = "leighzersciencebottling-liquid-science-barreling-fill"
    fill.order = sortOrder    
    local empty = data.raw["recipe"]["empty-"..liquidName.."-barrel"]
    empty.subgroup = "leighzersciencebottling-liquid-science-barreling-empty"
    empty.order = sortOrder    
end

function MoveBarrelRecipes()
    if leighzermods.leighzersciencebottling.isPrecursoreEnabled then
        MovePrecursoreBarrelRecipe("liquid-precursore",0,true)
    end
    MoveBarrelRecipe("automation-science",1,true)
    MoveBarrelRecipe("logistic-science",2,false)
    MoveBarrelRecipe("military-science",3,false)
    MoveBarrelRecipe("chemical-science",4,false)
    MoveBarrelRecipe("production-science",5,false)
    MoveBarrelRecipe("utility-science",6,false)    
    if mods["leighzerscienceores"] then
        if leighzermods.leighzerscienceores.spaceEnabled then
            MoveBarrelRecipe("space-science",7,false)
        end
    end
end
MoveBarrelRecipes()--move barreling recipes under leighzersciencebottling menu

--update table add recipes we want to be able to PROD module
--leighzermods.leighzersciencebottling.productivityEnabledRecipes is the list of recipe names we want to allow the use of productivity modules with
for k, v in pairs(data.raw.module) do
    if v.name:find("productivity%-module") and v.limitation then
      for _, recipe in ipairs(leighzermods.leighzersciencebottling.productivityEnabledRecipes) do
        if data.raw["recipe"][recipe] then
          table.insert(v.limitation, recipe)
        end
      end
    end
  end