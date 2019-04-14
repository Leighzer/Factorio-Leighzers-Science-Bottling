function AddFluid(fluidName, base_color, flow_color)
data:extend({
  {
    type = "fluid",
    name = "liquid-" .. fluidName,
    default_temperature = 25,
    heat_capacity = "0.1KJ",
    base_color = base_color,
    flow_color = flow_color,
    max_temperature = 100,
    icon = "__leighzersciencebottling__/graphics/icons/liquid-"..fluidName..".png",
    icon_size = 32,
    order = "a[fluid]-c"
  }
})
end

if leighzermods.leighzersciencebottling.isPrecursoreEnabled then
  AddFluid('precursore',{r=0, g=0, b=0},leighzermods.leighzersciencebottling.tints["precursore"])  
end
  
AddFluid('automation-science',{r=165/255, g=37.5/255, b=37.5/255},{r=1, g=1, b=1})--good
AddFluid('logistic-science',{r=113/255, g=154/255, b=97/255},{r=1, g=1, b=1})--good
AddFluid('military-science',{r=90/255, g=96/255, b=102/255},{r=1, g=1, b=1})--good
AddFluid('chemical-science',{r=48/255, g=108/255, b=117/255},{r=1, g=1, b=1})--good
AddFluid('production-science',{r=152/255, g=26/255, b=202/255},{r=1, g=1, b=1})--good
AddFluid('utility-science',{r=104/255, g=88/255, b=10/255},{r=1, g=1, b=1})--good
AddFluid('space-science',{r=150/255, g=150/255, b=150/255},{r=1, g=1, b=1})--good


