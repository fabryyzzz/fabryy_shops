ESX = nil
print("fabryy_shops started")

TriggerEvent('esx:getShe4y90Hc7kzmf0TacTEM3IcLv4gWlnC26EaredObje4y90Hc7kzmf0TacTEM3IcLv4gWlnC26Eect', function(obj) ESX = obj end)

RegisterServerEvent('fabryy_shops')
AddEventHandler('fabryy_shops', function(item, quanti, prezzo, society, lavoro)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xItem = xPlayer.getInventoryItem(item)
	local prezzofin = tonumber(prezzo) * tonumber(quanti)
	if society == true then
		TriggerEvent('esx_addonaccount:getSharedAccount', 'society_' .. lavoro, function(account)
			if account.money > prezzofin then
				if math.floor(xItem.count * quanti) < xItem.limit then
					account.removeMoney(prezzofin)
					xPlayer.addInventoryItem(item, quanti)
				else
					TriggerClientEvent('esx:showNotification', _source, 'Non hai abbastanza spazio nell\'inventario')
				end
			else
				TriggerClientEvent('esx:showNotification', _source, 'Non ci sono abbastanza soldi nella società')	
			end
		end)
	elseif society == false then
		if xPlayer.getMoney() >= prezzofin then
			if math.floor(xItem.count * quanti) < xItem.limit then
				xPlayer.removeMoney(prezzofin)
				xPlayer.addInventoryItem(item, quanti)
			else
				TriggerClientEvent('esx:showNotification', _source, 'Non hai abbastanza spazio nell\'inventario')
			end
		else
			TriggerClientEvent('esx:showNotification', _source, 'Non hai abbastanza soldi in contanti')
		end
	end
end)