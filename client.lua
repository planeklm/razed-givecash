local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('moneyMenu', function()
    lib.inputDialog('Money Menu', {
        {type = 'number', label = 'ID of recipent', description = 'The ID of the recipent.', default = '1', required = true, icon = 'user'},
        {type = 'number', label = '$ Amount', description = 'The amount of money to send to the recipent.', default = '10', required = true, icon = 'money'}
    })
    
    if not input then return end

end)


CreateThread(function()
    if Config.Target == 'qb' then
    exports['qb-target']:AddGlobalPlayer({
        options = {
            { 
                action = function()
                    moneyMenu()
                end,
                icon = "fas fa-money",
                label = "Give Money",
            },
        },
        distance = 3.0 
    })
else
    exports.ox_target:addGlobalPlayer({
        options = {
            {
                onSelect = function()
                    moneyMenu()
                end,
                icon = "fas fa-money",
                label = "Give Money",
            },
        },
        distance = 2.0
    })
end)