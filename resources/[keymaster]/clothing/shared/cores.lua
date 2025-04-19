Cores = {
    -- { -- New ESX
    --     Name = "ESX",
    --     ResourceName = "frwk",
    --     ConstantName = "esx",
    --     GetFramework = function() return exports["frwk"]:getSharedObject() end
    -- },
    { -- Old ESX
        Name = "ESX",
        ResourceName = "frwk",
        ConstantName = "esx",
        GetFramework = function() ESX = nil while ESX == nil do TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end) end return ESX end
    },
    {
        Name = "QBCore",
        ResourceName = "qb-core",
        ConstantName = "qb",
        GetFramework = function() return exports["qb-core"]:GetCoreObject() end
    },
    {
        Name = "QBXCore",
        ResourceName = "qbx_core",
        ConstantName = "qb",
        GetFramework = function() return exports["qb-core"]:GetCoreObject() end
    }
}