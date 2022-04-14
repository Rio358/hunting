local animal = {
	`a_c_deer`,
	`a_c_boar`,
	`a_c_coyote`,
	`a_c_mtlion`,
	`a_c_pig`,
	`a_c_rabbit_01`,
	`a_c_rat`,
	`a_c_cow`,
	`a_c_cat`,
	`a_c_chickenhawk`,
	`a_c_chimp`,
	`a_c_chop`,
	`a_c_cormorant`,
	`a_c_crow`,
	`a_c_dolphin`,
	`a_c_fish`,
	`a_c_hen`,
	`a_c_humpback`,
	`a_c_husky`,
	`a_c_killerwhale`,
	`a_c_pigeon`,
	`a_c_poodle`,
	`a_c_pug`,
	`a_c_retriever`,
	`a_c_rhesus`,
	`a_c_rottweiler`,
	`a_c_seagull`,
	`a_c_sharkhammer`,
	`a_c_sharktiger`,
	`a_c_shepherd`,
	`a_c_stingray`,
	`a_c_westy`,
}

exports.qtarget:AddTargetModel(animal, {
	options = {
		{
			event = "hunting:butcherCreature",
			icon = "fa-solid fa-steak",
			label = "Harvest Carcass",
			item = "WEAPON_KNIFE",
		},
	},
	distance = 3.5
})

exports.qtarget:AddBoxZone("Paleto hunting-seller", vector3(-70.23, 6256.43, 31.09), 0.8, 0.8, {
	name= "Paleto hunting-seller",
	heading= 33.75,
	debugPoly= false,
	minZ= 29.59,
	maxZ= 32.09
	}, {
		options = {
		{
			event = 'hunting:SellMeat',
			icon = "fas fa-store",
			label = "Sell your meats.",
			item = "meat",
		},
		{
			event = 'hunting:SellLeather',
			icon = "fas fa-store",
			label = "Sell your Leathers.",
			item = "leather",
		},
	},
	distance = 2.5
})
 --`a_c_cow`,`a_c_deer`,`a_c_boar`,`a_c_coyote`,`a_c_mtlion`,`a_c_pig`,`a_c_rabbit_01`,`a_c_rat`,`a_c_cat`,`a_c_chickenhawk`,`a_c_chimp`,`a_c_chop`,`a_c_cormorant`,`a_c_crow`,`a_c_dolphin`,`a_c_fish`,`a_c_hen`,`a_c_humpback`,`a_c_husky`,`a_c_killerwhale`,`a_c_pigeon`,`a_c_poodle`,`a_c_pug`,`a_c_retriever`,`a_c_rhesus`,`a_c_rottweiler`,`a_c_seagull`,`a_c_sharkhammer`,`a_c_sharktiger`,`a_c_shepherd`,`a_c_stingray`,`a_c_westy` <- all model hashes, If needbe you can probably attach these their own events, messy but workable.

RegisterNetEvent("hunting:butcherCreature")
AddEventHandler("hunting:butcherCreature", function()
	local dead = false
	local isButchering = false
	local playerPed = PlayerPedId()
	local plyCoords = GetEntityCoords(playerPed)
	local closestAnimal, closestDistance = ESX.Game.GetClosestPed(plyCoords)
	local animal = `a_c_cow`,`a_c_deer`,`a_c_boar`,`a_c_coyote`,`a_c_mtlion`,`a_c_pig`,`a_c_rabbit_01`,`a_c_rat`,`a_c_cat`,`a_c_chickenhawk`,`a_c_chimp`,`a_c_chop`,`a_c_cormorant`,`a_c_crow`,`a_c_dolphin`,`a_c_fish`,`a_c_hen`,`a_c_humpback`,`a_c_husky`,`a_c_killerwhale`,`a_c_pigeon`,`a_c_poodle`,`a_c_pug`,`a_c_retriever`,`a_c_rhesus`,`a_c_rottweiler`,`a_c_seagull`,`a_c_sharkhammer`,`a_c_sharktiger`,`a_c_shepherd`,`a_c_stingray`,`a_c_westy` --dunno why but this seems to make it all work?
	if closestAnimal ~= -1 and closestDistance <= 3.0 then
		if GetPedType(closestAnimal) == 28 and GetEntityHealth(closestAnimal) == 0 and not Entity(closestAnimal).state.skinning == true and not isButchering  then
			dead = true
			local attempt = 0
			while not NetworkHasControlOfEntity(closestAnimal) and attempt < 10 and DoesEntityExist(closestAnimal) do
				Wait(100)
				NetworkRequestControlOfEntity(closestAnimal)
				attempt = attempt + 1
			end
			local netid = NetworkGetNetworkIdFromEntity(closestAnimal)
			if GetSelectedPedWeapon(playerPed) == `WEAPON_KNIFE` then
				if DoesEntityExist(closestAnimal) and NetworkHasControlOfNetworkId(netid) then
					TriggerServerEvent('hunting:registerStateBag',NetworkGetNetworkIdFromEntity(closestAnimal))
					local ent = Entity(NetworkGetEntityFromNetworkId(netid))
					ent.state:set('skinning', true, true)
					isButchering = true
					local animalHash = GetEntityModel(closestAnimal)
					local animalWeight = math.random(Config.Animals[animalHash].minWeight,Config.Animals[animalHash].maxWeight)
					local skinTime = Config.HarvestTime + animalWeight 
					TaskPlayAnim(playerPed, "amb@medic@standing@kneel@base" ,"base" ,8.0, -8.0, -1, 1, 0, false, false, false )
					Wait(500)
					TriggerEvent("mythic_progbar:client:progress", {name = "skinning",duration = skinTime,label = "Harvesting Carcass",
						useWhileDead = false, canCancel = true,
						controlDisables = { disableMovement = false, disableCarMovement = false, disableMouse = false, disableCombat = false,},
						animation = {animDict = "anim@gangops@facility@servers@bodysearch@",anim = "player_search",flags = 49,},
					}, function(status)
						if not status then
							ClearPedTasksImmediately(PlayerPedId())
							isButchering = false
							TriggerServerEvent('hunting:rewardShit', animalWeight, animalHash, netid)
							Wait(150)
							SetEntityAsMissionEntity(closestAnimal, true, true)
							SetEntityAsNoLongerNeeded(closestAnimal)
							DeleteEntity(closestAnimal)
							if Config.Stress then
								if math.random(1,10) < 6 then
									TriggerEvent('esx_status:add', 'stress', 50000)
								end
							end
						else 
							ent.state:set('skinning',false,true)
						end
					end)
				end
			 else
				exports.mythic_notify:SendAlert("error","This is the wrong tool for this activity, try using a knife",3000)
			 	--exports.mythic_notify:SendAlert('inform', 'This is the wrong tool for that activity, use a knife.', 3000)
			 end
		elseif dead == false or netid == nil then
			--exports.mythic_notify:SendAlert('inform', 'This animal is not dead or this is not your kill.', 3000)
			exports.mythic_notify:SendAlert("error","This animal is not dead or this is not your kill.",3000)
			dead = false
		end
	end
end)

RegisterNetEvent('hunting:SellMeat')
AddEventHandler('hunting:SellMeat', function()
	local playerId = PlayerId()
	TriggerServerEvent('hunting:sellMeat',playerId)
end)

RegisterNetEvent('hunting:SellLeather')
AddEventHandler('hunting:SellLeather', function()
	local playerId = PlayerId()
	TriggerServerEvent('hunting:sellLeather',playerId)
end)

CreateThread(function()
	LoadAnimDict('amb@medic@standing@kneel@base')
	LoadAnimDict('anim@gangops@facility@servers@bodysearch@')
end)

function LoadAnimDict(dict)
     while (not HasAnimDictLoaded(dict)) do
         RequestAnimDict(dict)
         Wait(10)
     end    
end