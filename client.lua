local QBCore = exports['qb-core']:GetCoreObject()

local function moneyMenu()
    lib.inputDialog('Money Menu', {
        {type = 'number', label = 'ID of recipent', description = 'The ID of the recipent.', default = '1', required = true, icon = 'user'},
        {type = 'number', label = '$ Amount', description = 'The amount of money to send to the recipent.', default = '10', required = true, icon = 'money'}
    })

    if not input[1] or not input[2] then return end
    TriggerServerEvent("razed-givecash:server:chargerecipient", input[1], input[2])
    end
end

CreateThread(function()
    if Config.Target == 'qb' then
    exports['qb-target']:AddGlobalPlayer({
        options = {
            { 
                action = function()
                    moneyMenu()
                end,
                icon = "fas fa-money",
                label = "Give Recipient Cash",
            },
        },
        distance = 3.0 
    })
else if Config.Target == 'ox' then
    exports.ox_target:addGlobalPlayer({
        options = {
            {
                onSelect = function()
                    moneyMenu()
                end,
                icon = "fas fa-money",
                label = "Give Recipient Cash",
            },
        },
        distance = 2.0
    })
end)