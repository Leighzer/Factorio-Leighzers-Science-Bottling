--regular science ingredients => science liquid
function CreateLiquidScienceRecipeVanilla(scienceName, sortOrder, isEnabled)  
    data:extend({        
        {
        type = "recipe",
        name = "liquid-" .. scienceName .. "-science",
        energy_required = data.raw["recipe"][scienceName .. "-science-pack"].energy_required, 
        enabled = isEnabled,
        category = "chemistry",
        ingredients = {},
        results = {{type="fluid",name="liquid-" .. scienceName .. "-science",amount=10}},        
        subgroup = "leighzersciencebottling-vanilla-liquid-science",
        order = sortOrder,
        crafting_machine_tint = {
                                primary = leighzermods.leighzersciencebottling.tints[scienceName],
                                secondary = leighzermods.leighzersciencebottling.tints[scienceName],
                                tertiary = leighzermods.leighzersciencebottling.tints[scienceName],
                                quaternary = leighzermods.leighzersciencebottling.tints[scienceName],
                                }
        }
    })
    data.raw["recipe"]["liquid-" .. scienceName .. "-science"].ingredients = util.table.deepcopy(data.raw["recipe"][scienceName .. "-science-pack"].ingredients) --get normal ingredients
    table.insert(data.raw["recipe"]["liquid-" .. scienceName .. "-science"].ingredients, {type="fluid",name="water",amount=50}) -- add water as ingredient
    if leighzermods.leighzersciencebottling.isPrecursoreEnabled then
        table.insert(data.raw["recipe"]["liquid-" .. scienceName .. "-science"].ingredients, {type="fluid",name="liquid-precursore",amount=50}) --add precursore as ingredient
    end
    if not isEnabled then --if not enabled
        table.insert(data.raw["technology"][scienceName .. "-science-pack"].effects, {type = "unlock-recipe",recipe = "liquid-" .. scienceName .. "-science"})--add it as an unlock when pack is researched
    end
    table.insert(leighzermods.leighzersciencebottling.productivityEnabledRecipes,"liquid-" .. scienceName .. "-science")
end

--science ore => science liquid
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
        order = sortOrder,
        crafting_machine_tint = {
                                primary = leighzermods.leighzersciencebottling.tints[scienceName],
                                secondary = leighzermods.leighzersciencebottling.tints[scienceName],
                                tertiary = leighzermods.leighzersciencebottling.tints[scienceName],
                                quaternary = leighzermods.leighzersciencebottling.tints[scienceName],
                                }
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
    CreateLiquidScienceRecipeVanilla("automation",0,true)
    CreateLiquidScienceRecipeVanilla("logistic",1,false)
    CreateLiquidScienceRecipeVanilla("military",2,false)
    CreateLiquidScienceRecipeVanilla("chemical",3,false)
    CreateLiquidScienceRecipeVanilla("production",4,false)
    CreateLiquidScienceRecipeVanilla("utility",5,false)    
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
    local recipe = data.raw["recipe"][scienceName .. "-science-pack"]          
    recipe.category = "chemistry"
    recipe.ingredients = {{type="fluid",name="liquid-"..scienceName.."-science",amount=10},{"glass-bottle",1}}
    local amnt = recipe.result_count
    if not amnt then
        amnt = 1
    end
    recipe.result = nil
    recipe.results = {{scienceName .. "-science-pack",amnt}}
    recipe.crafting_machine_tint = {
                                    primary = leighzermods.leighzersciencebottling.tints[scienceName],
                                    secondary = leighzermods.leighzersciencebottling.tints[scienceName],
                                    tertiary = leighzermods.leighzersciencebottling.tints[scienceName],
                                    quaternary = leighzermods.leighzersciencebottling.tints[scienceName],
                                    }
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
    recipe.hidden = false
    recipe.crafting_machine_tint = {
                                    primary = leighzermods.leighzersciencebottling.tints[scienceName],
                                    secondary = leighzermods.leighzersciencebottling.tints[scienceName],
                                    tertiary = leighzermods.leighzersciencebottling.tints[scienceName],
                                    quaternary = leighzermods.leighzersciencebottling.tints[scienceName],
                                    }
end

function MoveSpaceScienceSubGroup()
    local recipe = data.raw["recipe"]["space-science-ore-to-science"]
    recipe.subgroup = "leighzersciencebottling-alt-science-pack"
end

function MakeSciencePacksRequireLiquid()
    MakeSciencePackRequireLiquid("automation")
    MakeSciencePackRequireLiquid("logistic")
    MakeSciencePackRequireLiquid("military")
    MakeSciencePackRequireLiquid("chemical")
    MakeSciencePackRequireLiquid("production")
    MakeSciencePackRequireLiquid("utility")
    if mods["leighzerscienceores"]then
        if leighzermods.leighzerscienceores.spaceEnabled then
            MakeSpaceSciencePackRequireLiquid()
        end
    end
end

function HideScienceOreToPackRecipe(scienceName)
    data.raw.recipe[scienceName.. "-science-ore-to-science"].hidden= true
end

function HideScienceOreToPackRecipes()
    if leighzermods.leighzerscienceores.automationEnabled then
        HideScienceOreToPackRecipe("automation")
    end
    if leighzermods.leighzerscienceores.logisticEnabled then
        HideScienceOreToPackRecipe("logistic")
    end
    if leighzermods.leighzerscienceores.militaryEnabled then
        HideScienceOreToPackRecipe("military")
    end
    if leighzermods.leighzerscienceores.chemicalEnabled then
        HideScienceOreToPackRecipe("chemical")
    end
    if leighzermods.leighzerscienceores.productionEnabled then
        HideScienceOreToPackRecipe("production")
    end
    if leighzermods.leighzerscienceores.utilityEnabled then
        HideScienceOreToPackRecipe("utility")
    end        
    --if leighzermods.leighzerscienceores.spaceEnabled and not(mods["leighzerscienceores"] and leighzermods.leighzersciencebottling.onlyNeedToBottleScienceOres) then
    --    HideScienceOreToPackRecipe("space")
    --end    
end

function AddLiquidToScienceRecipe(scienceName,isEnabled)
    local energy_required
    local order
    if data.raw["recipe"][scienceName.. "-science-pack"] and data.raw["recipe"][scienceName.. "-science-pack"].energy_required then
        energy_required = data.raw["recipe"][scienceName .. "-science-pack"].energy_required
        order = data.raw["recipe"][scienceName .. "-science-pack"].order
    else
        energy_required = 50
        order = z
    end
    
    data:extend({
        {
            type = "recipe",
            enabled = isEnabled,
            name = "alt-"..scienceName.."-science-pack",
            energy_required = energy_required,
            category = "chemistry",
            subgroup = "leighzersciencebottling-alt-science-pack",
            order = order,
            crafting_machine_tint = {
                                    primary = leighzermods.leighzersciencebottling.tints[scienceName],
                                    secondary = leighzermods.leighzersciencebottling.tints[scienceName],
                                    tertiary = leighzermods.leighzersciencebottling.tints[scienceName],
                                    quaternary = leighzermods.leighzersciencebottling.tints[scienceName],
                                    },
            ingredients =
            {
                {type="fluid",name="liquid-"..scienceName.."-science",amount=10},{"glass-bottle",1}
            },
            results = {{scienceName.."-science-pack",1}}
          },
    })

    if not isEnabled then --if not enabled
        table.insert(data.raw["technology"][scienceName .. "-science-pack"].effects, {type = "unlock-recipe",recipe = "alt-"..scienceName.."-science-pack"})--add it as an unlock when pack is researched
    end
    table.insert(leighzermods.leighzersciencebottling.productivityEnabledRecipes,"alt-"..scienceName.."-science-pack")

end

function AddLiquidToScienceRecipes()
    if leighzermods.leighzerscienceores.automationEnabled then
        AddLiquidToScienceRecipe("automation",true)
    end
    if leighzermods.leighzerscienceores.logisticEnabled then
        AddLiquidToScienceRecipe("logistic",false)
    end
    if leighzermods.leighzerscienceores.militaryEnabled then
        AddLiquidToScienceRecipe("military",false)
    end
    if leighzermods.leighzerscienceores.chemicalEnabled then
        AddLiquidToScienceRecipe("chemical",false)
    end
    if leighzermods.leighzerscienceores.productionEnabled then
        AddLiquidToScienceRecipe("production",false)
    end
    if leighzermods.leighzerscienceores.utilityEnabled then
        AddLiquidToScienceRecipe("utility",false)
    end        
    --if leighzermods.leighzerscienceores.spaceEnabled then
    --    AddLiquidToScienceRecipe("space",false)
    --end
end


if mods["leighzerscienceores"] then
    ScienceOreLiquidScienceRecipes()--create science liquid from science ores
    if leighzermods.leighzersciencebottling.onlyNeedToBottleScienceOres then        
        AddLiquidToScienceRecipes()--adds duplicate science pack recipes that take liquid, so folks can liquify ores to make science or make science the good old fashioned way
        if leighzermods.leighzerscienceores.spaceEnabled then
            MakeSpaceSciencePackRequireLiquid()
            MoveSpaceScienceSubGroup()
        end
    else            
        VanillaLiquidScienceRecipes()--create science liquid from regular vanilla ingredients
        MakeSciencePacksRequireLiquid()--update science pack recipes to require bottling of liquid
        if leighzermods.leighzerscienceores.spaceEnabled then
            MakeSpaceSciencePackRequireLiquid()        
        end
    end
    HideScienceOreToPackRecipes()
else
    VanillaLiquidScienceRecipes()--create science liquid only by vanilla
    MakeSciencePacksRequireLiquid()--update science pack recipes to require bottling of liquid
end

function MoveBarrelRecipe(scienceName,sortOrder)
    local item = data.raw["item"]["liquid-"..scienceName.."-science-barrel"]
    item.subgroup = "leighzersciencebottling-liquid-science-barreling-fill"
    item.order = sortOrder
    local fill = data.raw["recipe"]["fill-liquid-"..scienceName.."-science-barrel"]
    fill.subgroup = "leighzersciencebottling-liquid-science-barreling-fill"
    fill.order = sortOrder    
    local empty = data.raw["recipe"]["empty-liquid-"..scienceName.."-science-barrel"]
    empty.subgroup = "leighzersciencebottling-liquid-science-barreling-empty"
    empty.order = sortOrder    
end

function MovePrecursoreBarrelRecipe(liquidName,sortOrder)
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
        MovePrecursoreBarrelRecipe("liquid-precursore",0)
    end
    MoveBarrelRecipe("automation",1)
    MoveBarrelRecipe("logistic",2)
    MoveBarrelRecipe("military",3)
    MoveBarrelRecipe("chemical",4)
    MoveBarrelRecipe("production",5)
    MoveBarrelRecipe("utility",6)    
    if mods["leighzerscienceores"] then
        if leighzermods.leighzerscienceores.spaceEnabled then
            MoveBarrelRecipe("space",7)
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

