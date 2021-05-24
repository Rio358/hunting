
ESX                             = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(10)
	end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(100)
    end
	PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer
end)

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

-- Aminauls
exports['bt-target']:AddTargetModel(animal, {
	options = {
		{
			event = "hunting:butcherCreature",
			icon = "fas fa-cut",
			label = "Butcher Creature",
		},
	},
	job = {"all"},
	distance = 3.5
})

exports['bt-target']:AddBoxZone("Paleto hunting-seller", vector3(-70.23, 6256.43, 31.09), 0.8, 0.8, {
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
	},
	{
	event = 'hunting:SellLeather',
	icon = "fas fa-store",
	label = "Sell your Leathers.",
	},
},
	job = {"all"},
	distance = 2.5
})
 --`a_c_deer`, `a_c_boar`, `a_c_coyote`, `a_c_mtlion`, `a_c_pig`, `a_c_rabbit_01`, `a_c_rat` If needbe you can probably attach these their own events, messy but workable.

RegisterNetEvent("hunting:butcherCreature")
AddEventHandler("hunting:butcherCreature", function()
	local dead = false
	local closestAnimal, closestDistance = ESX.Game.GetClosestPed(plyCoords)
	local animal = `a_c_cow`,`a_c_deer`,`a_c_boar`,`a_c_coyote`,`a_c_mtlion`,`a_c_pig`,`a_c_rabbit_01`,`a_c_rat`,`a_c_cat`,`a_c_chickenhawk`,`a_c_chimp`,`a_c_chop`,`a_c_cormorant`,`a_c_crow`,`a_c_dolphin`,`a_c_fish`,`a_c_hen`,`a_c_humpback`,`a_c_husky`,`a_c_killerwhale`,`a_c_pigeon`,`a_c_poodle`,`a_c_pug`,`a_c_retriever`,`a_c_rhesus`,`a_c_rottweiler`,`a_c_seagull`,`a_c_sharkhammer`,`a_c_sharktiger`,`a_c_shepherd`,`a_c_stingray`,`a_c_westy` --dunno why but this seems to make it all work?
	local plyCoords = GetEntityCoords(PlayerPedId())
	if closestAnimal ~= -1 and closestDistance <= 3.0 then
		if GetPedType(closestAnimal) == 28 and GetEntityHealth(closestAnimal) == 0 and GetPedSourceOfDeath(closestAnimal) == PlayerPedId() then
			dead = true
			while not NetworkHasControlOfEntity(closestAnimal) and attempt < 10 and DoesEntityExist(closestAnimal) do
				Citizen.Wait(100)
				NetworkRequestControlOfEntity(closestAnimal)
				attempt = attempt + 1
			end
			 if GetSelectedPedWeapon(PlayerPedId()) == GetHashKey('WEAPON_KNIFE') then
				if DoesEntityExist(closestAnimal) and NetworkHasControlOfEntity(closestAnimal) then
					local netid = NetworkGetNetworkIdFromEntity(closestAnimal)
					SetNetworkIdCanMigrate(netid, false)
					print(netid)
					-- harvest this sonofa thnx thelindat
					isButchering = true
					TaskPlayAnim(PlayerPedId(), "amb@medic@standing@kneel@base" ,"base" ,8.0, -8.0, -1, 1, 0, false, false, false )
					TriggerEvent("mythic_progbar:client:progress", {
						name = "skinning",
						duration = 7500,
						label = "Skinning Animal",
						useWhileDead = false,
						canCancel = true,
						controlDisables = {
							disableMovement = true,
							disableCarMovement = true,
							disableMouse = true,
							disableCombat = true,
						},
						animation = {
							animDict = "anim@gangops@facility@servers@bodysearch@",
							anim = "player_search"
						},
					  }, function(status)
						  if not status then
							Citizen.Wait(500)
							local AnimalWeight = math.random(200) / 10
							exports['mythic_notify']:DoLongHudText('inform', 'You have slaughtered an animal yielding a total of ' ..AnimalWeight.. 'kg of meat and leather.', 6500)
							isButchering = false
							TriggerServerEvent('hunting:rewardShit', AnimalWeight)
							Citizen.Wait(150)
							TriggerServerEvent('hunting:SkinIt')
							SetEntityAsMissionEntity(closestAnimal, true, true)
							SetEntityAsNoLongerNeeded(closestAnimal)
							DeleteEntity(closestAnimal)
							if math.random(1,10) < 6 then
							  exports['utk_stress']:AddStress('instant', 10000) -- or your stress event here
							end
						end
					end)
				end
			 else
			 	exports['mythic_notify']:DoShortHudText('inform', 'This is the wrong tool for that activity, use a knife.', 3000)
			 end
		elseif dead == false or GetPedCauseOfDeath(closestAnimal) ~= PlayerPedId() then
			exports['mythic_notify']:DoShortHudText('inform', 'This animal is not dead or this is not your kill.', 3000)
			dead = false
		end
	end
end)

RegisterNetEvent('hunting:SellMeat')
AddEventHandler('hunting:SellMeat', function()
	local coords = GetEntityCoords(PlayerPedId())
	local seller = vector3(-70.23,6256.43,31.09) -- or config this bitch w/e you'll need to adjust the bt-target location to sell, or add items to however you deal with the like.
	if #(coords - seller) < 3 then
		TriggerServerEvent('hunting:sellMeat')
	else
		exports['mythic_notify']:SendAlert('inform', 'No.')
	end
end)

RegisterNetEvent('hunting:SellLeather')
AddEventHandler('hunting:SellLeather', function()
	local coords = GetEntityCoords(PlayerPedId())
	local seller = vector3(-70.23,6256.43,31.09) -- or config this bitch w/e you'll need to adjust the bt-target location to sell, or add items to however you deal with the like.
	if #(coords - seller) < 3 then
		TriggerServerEvent('hunting:sellLeather')
	else
		exports['mythic_notify']:SendAlert('inform', 'No.')
	end
end)

Citizen.CreateThread(function()
	LoadAnimDict('amb@medic@standing@kneel@base')
	LoadAnimDict('anim@gangops@facility@servers@bodysearch@')
end)

function LoadAnimDict(dict)
     while (not HasAnimDictLoaded(dict)) do
         RequestAnimDict(dict)
         Citizen.Wait(10)
     end    
end
