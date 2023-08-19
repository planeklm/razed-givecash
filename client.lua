local QBCore = exports['qb-core']:GetCoreObject()

local function moneyMenu()
if Config.Menu == 'ox' then
        local input = lib.inputDialog('Money Menu', {
        {type = 'number', label = 'ID of recipent', description = 'The ID of the recipent.', default = '1', required = true, icon = 'user'},
        {type = 'number', label = '$ Amount', description = 'The amount of money to send to the recipent.', default = '10', required = true, icon = 'money'}
    })

    if not input[1] or not input[2] then return end
        TriggerServerEvent("razed-givecash:server:chargerecipient", input[1], input[2])
    end
else if Config.Target == 'qb' then
    local input = exports['qb-input']:ShowInput({
        header = "Money Menu",
        submitText = "Confirm",
        inputs = {
            {
                type = 'number',
                isRequired = true,
                name = 'input[1]',
                text = 'ID of recipent'
            },
            {
                type = 'number',
                isRequired = true,
                name = 'input[2]',
                text = '$ Amount'
            }
        }
    })
    if input then
        if not input.id or not input.amount then return end
        TriggerServerEvent("tc-giveCash:server:charge", input.id, input.amount)
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