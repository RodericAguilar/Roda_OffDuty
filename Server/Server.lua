ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('Roda_OffDuty:SetJob')
AddEventHandler('Roda_OffDuty:SetJob', function (job, grade)
    local src = source 
    local xPlayer = ESX.GetPlayerFromId(src)
    xPlayer.setJob(job, tonumber(grade) or 0)
    xPlayer.showNotification('Your job status was change')
end)