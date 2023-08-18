local QBCore = exports['qb-core']:GetCoreObject()



CreateThread(function()
    exports['qb-target']:AddGlobalPlayer({
        options = {
            { 
                action = function()
                    cashMenu()
                end,
                icon = "fas fa-money",
                label = "Give Cash",
            },
        },
        distance = 3.0 
    })
end)