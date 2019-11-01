for _,force in pairs(game.forces) do    
    if game.entity_prototypes["logistic-science-ore"] then
        force.recipes["liquid-logistic-science-by-ore"].enabled = force.technologies["logistic-science-pack"].researched
    end
    if game.entity_prototypes["military-science-ore"] then
        force.recipes["liquid-military-science-by-ore"].enabled = force.technologies["military-science-pack"].researched
    end
    if game.entity_prototypes["chemical-science-ore"] then
        force.recipes["liquid-chemical-science-by-ore"].enabled = force.technologies["chemical-science-pack"].researched
    end
    if game.entity_prototypes["production-science-ore"] then
        force.recipes["liquid-production-science-by-ore"].enabled = force.technologies["production-science-pack"].researched
    end
    if game.entity_prototypes["utility-science-ore"] then
        force.recipes["liquid-utility-science-by-ore"].enabled = force.technologies["utility-science-pack"].researched
    end
    if game.entity_prototypes["space-science-ore"] then
        force.recipes["liquid-space-science-by-ore"].enabled = force.technologies["space-science-pack"].researched    
    end
    if game.entity_prototypes["advanced-logistic-science-ore"] then
        force.recipes["liquid-advanced-logistic-science-by-ore"].enabled = force.technologies["advanced-logistic-science-pack"].researched    
    end
end