local QBCore = exports['qb-core']:GetCoreObject()
local id1 = 'input[1]'
local id2 = 'input[2]'
local id3 = 'input[3]'


RegisterNetEvent('razed-givecash:server:chargerecipientOX', function(id1, id2, id3)
    local payee = QBCore.Functions.GetPlayer(source)
    local recipient = QBCore.Functions.GetPlayer(tonumber(id1))
    local recipientPed = GetPlayerPed(tonumber(id1))

    local payeePed = GetPlayerPed(source)
    local src = source
    local notif1 = {
        title = 'Payment Success',
        description = 'You have sent $'..tonumber(id2).. '.',
        type = 'success'
    }
    local notif2 = {
        title = 'Payment Success',
        description = 'You have recieved $'..tonumber(id2).. '.',
        type = 'success'
    }
    local notif3 = {
        title = 'Message',
        description = tostring(id3),
        type = 'info',
        duration = 10000
    }


    if not payee or not recipient then return end
        local checkRangeOfRecip = #(GetEntityCoords(recipientPed) - GetEntityCoords(payeePed))
        if checkRangeOfRecip < 10.0 then
            if tonumber(id2) > 0 then
                if payee.Functions.RemoveMoney('cash', tonumber(id2)) then
                    recipient.Functions.AddMoney('cash', tonumber(id2))
                    TriggerClientEvent("ox_lib:notify", src, notif1)
                        TriggerClientEvent("ox_lib:notify", id1, notif2)
                        TriggerClientEvent("ox_lib:notify", id1, notif3)
                end
        else
            TriggerClientEvent("ox_lib:notify", src, notif2)
        end
    end
end)
