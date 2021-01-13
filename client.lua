ESX = nil
print("fabryy_shops started")
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getShe4y90Hc7kzmf0TacTEM3IcLv4gWlnC26EaredObje4y90Hc7kzmf0TacTEM3IcLv4gWlnC26Eect', function(obj) ESX = obj end)
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
	Citizen.Wait(5000)
end)
RegisterNetEvent('esx:setJob2')
AddEventHandler('esx:setJob2', function(job2)
  ESX.PlayerData.job2 = job2
  Citizen.Wait(5000)
end)

Citizen.CreateThread(function()
	for k, v in pairs(Config.Negozi) do 	
		if v.blip.use then
			local blip = AddBlipForCoord(v.pos.x,v.pos.y,v.pos.z)
			SetBlipSprite (blip, v.blip.sprite)
			SetBlipDisplay(blip, 4)
			SetBlipColour (blip, v.blip.colour)
			SetBlipAsShortRange(blip, true)
			SetBlipScale(blip, v.blip.size)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString(v.blip.label)
			EndTextCommandSetBlipName(blip)
		end
	end
end)

Citizen.CreateThread(function()
	local lavoro = job
	while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local coords    = GetEntityCoords(playerPed)
	  	for k, v in pairs(Config.Negozi) do 	
		if v.job.job2 == false then lavoro = ESX.PlayerData.job else lavoro = ESX.PlayerData.job2 end
		if GetDistanceBetweenCoords(coords, v.pos, true) < 2.0 then	
			if v.job.use == true then
				if lavoro ~= nil and lavoro.name == v.job.jobname then
					if lavoro.grade >= v.job.grade then 		
						DrawMarker(v.marker.type, v.pos.x,v.pos.y,v.pos.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.marker.size.x, v.marker.size.y, v.marker.size.z, v.marker.rgba.r, v.marker.rgba.g, v.marker.rgba.b, v.marker.rgba.a, false, true, 2, nil, nil, false)
						ESX.ShowHelpNotification("Premi ~INPUT_PICKUP~ per aprire il menu")
						if IsControlJustReleased(1, 51) then
							ApriShop(v.job.society, v.job.jobname, v.items)
						end
					end
				end
			else
				DrawMarker(v.marker.type, v.pos.x,v.pos.y,v.pos.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.marker.size.x, v.marker.size.y, v.marker.size.z, v.marker.rgba.r, v.marker.rgba.g, v.marker.rgba.b, v.marker.rgba.a, false, true, 2, nil, nil, false)
				ESX.ShowHelpNotification("Premi ~INPUT_PICKUP~ per aprire il menu")
				if IsControlJustReleased(1, 51) then
					ApriShop(false, nil, v.items)
				end
			end
		  end	
		end		
	end
end)

function ApriShop(society, lavoro, data)
	local elements = {}
	for k,v in pairs(data) do
		table.insert(elements, {label = v.label, oggetto = v.item, prezzo = v.price, value = 1, type = 'slider', min = 1, max = 100})
	end
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'shop',
	{
		title    = 'Negozio',
		align    = 'bottom-right',
		elements = elements
	}, function(data, menu)
		if data.current.value then
			TriggerServerEvent('fabryy_shops', data.current.oggetto, data.current.value, data.current.prezzo, society, lavoro)
		end
	 end, function(data, menu)
		menu.close()
	end)
end