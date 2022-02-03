local ox_inventory = exports.ox_inventory

RegisterServerEvent('hunting:rewardShit')
AddEventHandler('hunting:rewardShit', function(weight,hash,animalid)
	-- weight is in kg
	math.randomseed(os.time())
	local xPlayer = ESX.GetPlayerFromId(source)
	local luck = math.random(1, 100)
	local grade = 0
	local meatAmount = math.ceil(weight / Config.MeatWeight * randomFloat(0.8,1.5))
	local usableSkin = math.random(1,5)
	local skinAmount = math.ceil(meatAmount / 5)
	local weight = weight
	
	if luck >= 95 then grade = 5 elseif luck >= 87 then grade = 4 elseif luck >= 59 then grade = 3 elseif luck >= 46 then grade = 2 else grade = 1 end
	local playerPed = GetPlayerPed(xPlayer.source)
	local playerCoords = GetEntityCoords(playerPed)
	local entity = NetworkGetEntityFromNetworkId(animalid)
	if entity and entity ~= playerPed then
		local coords = GetEntityCoords(entity)
		if #(playerCoords - coords) <= 10 then
			local meatData = " A grade " ..grade.. " Cut of meat from a " ..Config.Animals[hash].label
			local leatherData = "A grade " ..grade.. "pelt from a " ..Config.Animals[hash].label
			ox_inventory:CustomDrop('Carcass', {
				{'meat', meatAmount, { grade = grade, description ="Grade " ..grade.. " Cut from a "..Config.Animals[hash].label, weight = math.ceil(weight / meatAmount) , type=Config.Animals[hash].label} },
				{'leather', usableSkin, { grade = grade, description ="Grade " ..grade.. " Pelt from a "..Config.Animals[hash].label , weight = math.ceil(weight / meatAmount), type=Config.Animals[hash].label}}
			}, playerCoords)
			TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, {type = 'inform', text = 'You have slaughtered an animal yielding a total of ' ..meatAmount.. 'pieces of meat.'})
		end
	end
end)

RegisterServerEvent('hunting:registerStateBag')
AddEventHandler('hunting:registerStateBag', function(carcass)
	carcass = NetworkGetEntityFromNetworkId(carcass)
	Entity(carcass).state.skinning = true
end)

RegisterServerEvent('hunting:sellMeat')
AddEventHandler('hunting:sellMeat', function(playerId)
	math.randomseed(os.time())
	local xPlayer = ESX.GetPlayerFromId(source)
	local MeatPrice = math.random(16, 25)
	local payOut = 0 
	local quantity = 0
	for k,v in pairs(xPlayer.getInventory()) do
		if v.name == 'meat' then
			if v.metadata and v.metadata.grade then 
				local price = math.ceil(MeatPrice * v.metadata.grade)
				payOut = payOut + price * v.count
				quantity = quantity + 1
				xPlayer.removeInventoryItem('meat', v.count)
			else
				payOut = math.floor(MeatPrice)
				quantity = quantity + 1 * v.count
				xPlayer.removeInventoryItem('meat', v.count)
			end
			TriggerClientEvent('ox_inventory:notify', source, {type = "success", text = "You have sold " .. v.count .. " meat and earned $" .. payOut * v.count })
			xPlayer.addInventoryItem('money', (payOut * quantity))
		else
			if xPlayer.getInventoryItem('meat').count == 0 then
			end
		end
	end
end)

RegisterServerEvent('hunting:sellLeather')
AddEventHandler('hunting:sellLeather', function()
	math.randomseed(os.time())
	local xPlayer = ESX.GetPlayerFromId(source)
	local leatherPrice = math.random(21, 39)
	local payOut = 0 
	local quantity = 0
	local leatherquantity = 0

	for k,v in pairs(xPlayer.getInventory()) do
		if v.name == 'leather' then
			if v.metadata and v.metadata.grade then 
				local price = math.ceil(leatherPrice * v.metadata.grade)
				payOut = payOut + price * v.count
				quantity = quantity + 1
				xPlayer.removeInventoryItem('leather', v.count)
			else 
				payOut = math.floor(payOut + leatherPrice)
				quantity = quantity + 1 * v.count
				xPlayer.removeInventoryItem('leather', v.count)
			end
			xPlayer.addInventoryItem('money',payOut * v.count)
			TriggerClientEvent('mythic_notify:client:DoLongHudText', xPlayer.source, {type = 'success', text = 'You have sold ' .. v.count .. ' leather and earned $' .. payOut * v.count .. '.', length = 3000})
			else
				if xPlayer.getInventoryItem('leather').count == 0 then
			end
		end
	end
end)

function randomFloat(lower, greater)
	return lower + math.random() * (greater - lower);
end