function OpenUi(job, title, offjob, img, grado)
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = 'OpenMenu',
        job = job,
        title = title,
        offjob = offjob,
        img = img,
        name = GetPlayerName(PlayerId()),
        grado = grado
    })
end

RegisterNUICallback('setJob', function(data, cb)
        TriggerServerEvent('Roda_OffDuty:SetJob', data.job, tonumber(data.grade))
end)