ESX = nil
local loaded = false
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	ESX.PlayerData = ESX.GetPlayerData()
end)


RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    ESX.PlayerData = xPlayer
    loaded = true
end)

RegisterNUICallback('exit', function(data, cb)
    SetNuiFocus(false, false)
end)
  

Citizen.CreateThread(function()
    while true do
        local wait = 500

        local ped = PlayerPedId()
        local pedC = GetEntityCoords(ped)
    
            if loaded then 
                for k,v in pairs(Roda.Jobs) do
                    if v.job == ESX.PlayerData.job.name or v.offjob == ESX.PlayerData.job.name then 
                        local dist = #(pedC - v.coords)
                        if dist < 10 then
                            wait = 0
                            DrawMarker(2, v.coords.x, v.coords.y, v.coords.z + 0.20, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 255, 0, 0, 100, false, true, 2, true, nil, nil, false) -- Create marker on coords
                            if dist < 3 then
                                ESX.ShowFloatingHelpNotification('Press ~r~E~w~ to check your service.', vector3(v.coords.x, v.coords.y, v.coords.z + 0.50))
                                if dist < 2 then
                                    if IsControlJustPressed(0, 38) then
                                        OpenUi(v.job, v.title, v.offjob, v.img, ESX.PlayerData.job.grade)
                                    end
                                end
                            end
                        end
                    end
                end
            end
        Wait(wait)
    end
end)
