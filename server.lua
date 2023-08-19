local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('razed-givecash:server:chargerecipient', function(input[1], input[2])
    local payee = QBCore.Functions.GetPlayer(source)
    local recipient = QBCore.Functions.GetPlayer(tonumber(input[1]))
    local recipientPed = GetPlayerPed(tonumber(input[1]))
    local payeePed = GetPlayerPed(source)

    if not payee or not recipient then return end
        local checkRangeOfRecip = #(GetEntityCoords(recipientPed) - GetEntityCoords(payeePed))
        if checkRangeOfRecip < Config.RangeOfRecipient then
            if tonumber(input[2]) > 0 then
                if payee.Functions.RemoveMoney('cash', tonumber(input[2])) then
                    recipient.Functions.AddMoney('cash', tonumber(input[2]))
                    TriggerClientEvent('ox_lib:notify', source, 'Sent $'..tonumber(input[2]).." to"..input[1], 'success')
                        TriggerClientEvent('ox_lib:notify', input[1], 'You have been given $'..tonumber(input[2]).., 'success')
                end
        else
            TriggerClientEvent('ox_lib:notify', source, 'Too far from recipient.', 'error')
        end
end)