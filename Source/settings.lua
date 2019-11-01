data:extend(
{  --prototypes for mod settings menu
    {
        type = "bool-setting",
        name = "isPrecursoreEnabled",
        setting_type = "startup",
        default_value = true,
        order = "a"
    }
})

if mods["leighzerscienceores"] then
data:extend(
{  --prototypes for mod settings menu
    {
        type = "bool-setting",
        name = "onlyNeedToBottleScienceOres",
        setting_type = "startup",
        default_value = true,
        order = "b"
    }
})
end







