RegisterNetEvent('razed-givecash:server:chargerecipient', function(id, amount)
    local src = source
    local payee = QBCore.Functions.GetPlayer(src)
    local recipient = QBCore.Functions.GetPlayer(tonumber(id))
    local recipientPed = GetPlayerPed(tonumber(id))
    local payeePed = GetPlayerPed(src)
    if not payee or not recipient then return end
    if not payee.PlayerData.metadata["isdead"] then
        local checkRangeOfRecip = #(GetEntityCoords(recipientPed) - GetEntityCoords(payeePed))

        if checkRangeOfRecip < 10.0 then
            if tonumber(amount) > 0 then
                if payee.Functions.RemoveMoney('cash', tonumber(amount)) then
                    recipient.Functions.AddMoney('cash', tonumber(amount))
                    TriggerClientEvent('ox_lib:notify', src, 'Sent $'..tonumber(amount).." to"..id, 'success')
                        TriggerClientEvent('ox_lib:notify', id, 'you received $'..tonumber(amount).." in cash from ID: #"..src, 'success')
                end
            else
                TriggerClientEvent('ox_lib:notify', src, 'Can\'t Send $0', 'error')
            end
        else
            TriggerClientEvent('ox_lib:notify', src, 'Too far', 'error')
        end
    else
        TriggerClientEvent('ox_lib:notify', src, 'Can\'t Send Money When Dead.', 'error')
    end
end)
