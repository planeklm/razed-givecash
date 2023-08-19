local QBCore = exports['qb-core']:GetCoreObject()
local TestTarget = Config.TestTarget

local function moneyMenu()
    if Config.Menu == 'ox' then
            local input = lib.inputDialog('Money Menu', {
            {type = 'number', label = 'ID of recipent', description = 'The ID of the recipent.', default = 1, min = '1', required = true, icon = 'user'},
            {type = 'number', label = '$ Amount', description = 'The amount of money to send to the recipent.', default = 10, minimun = '1', required = true, icon = 'dollar-sign'},
            {type = 'input', label = 'Message For Recipient', description = 'The message to send with the money to the recipent.', default = 'Here, have some cash.', minimun = '0', required = false, icon = 'message'}
        })

    if not input[1] or not input[2] then return end
        if not input then return end
             TriggerServerEvent("razed-givecash:server:chargerecipientOX", input[1], input[2], input[3])
    end

if Config.Menu == 'qb' then
    local inputqb = exports['qb-input']:ShowInput({
        header = "Money Menu",
        submitText = "Confirm",
        inputs = {
            {
                type = 'number',
                isRequired = true,
                name = 'idrecipient',
                text = 'ID of recipent'
            },
            {
                type = 'number',
                isRequired = true,
                name = 'mular',
                text = '$ Amount'
            }
        }
    })
    if inputqb then
        if not inputqb.id or not inputqb.amount then return end
        TriggerServerEvent("razed-givecash:server:chargerecipientQB", inputqb.id, inputqb.amount)
        end
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
            distance = Config.TargetDistance
        })
    --[[exports['qb-target']:AddTargetModel(TestTarget, {
        options = {
        {
            action = function()
                moneyMenu()
            end,
            icon = "fas fa-money",
            label = "Give Recipient Cash",
        }
      },
      distance = 3.0,
    })]]--
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
        distance = 3.0
    })
    end
end
end)

