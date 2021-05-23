
ESX                             = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(10)
	end
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
}

-- create interactive animal ped models
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

-- Inside of the Base IPL Chicken Factory, add a blip or don't

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


RegisterNetEvent("hunting:butcherCreature")
AddEventHandler("hunting:butcherCreature", function()
	local dead = false
	local closestAnimal, closestDistance = ESX.Game.GetClosestPed(coords)
	local animal = `a_c_cow`, `a_c_deer`, `a_c_boar`, `a_c_coyote`, `a_c_mtlion`, `a_c_pig`, `a_c_rabbit_01`, `a_c_rat`
	local plyCoords = GetEntityCoords(PlayerPedId())
	local coords = GetEntityCoords(animal)
	if closestAnimal ~= -1 and closestDistance <= 3.0 then
		if GetPedType(closestAnimal) == 28 and GetEntityHealth(closestAnimal) == 0 then
			dead = true
			 if GetSelectedPedWeapon(PlayerPedId()) == GetHashKey('WEAPON_KNIFE')  then

				TaskPlayAnim(PlayerPedId(), "amb@medic@standing@kneel@base" ,"base" ,8.0, -8.0, -1, 1, 0, false, false, false )
				TaskPlayAnim(PlayerPedId(), "anim@gangops@facility@servers@bodysearch@" ,"player_search" ,8.0, -8.0, -1, 48, 0, false, false, false )
				Citizen.Wait(10000)
				ClearPedTasksImmediately(PlayerPedId())
				local random = math.random(300)
				local AnimalWeight = tonumber(ESX.Math.Round(random,1)) / 10
				exports['mythic_notify']:DoLongHudText('inform', 'You have slaughtered an animal yielding a total of ' ..AnimalWeight.. 'kg of meat and leather.', 6500)
				TriggerServerEvent('hunting:rewardShit', AnimalWeight)
				Citizen.Wait(150)
				TriggerServerEvent('hunting:SkinIt')
				SetEntityAsNoLongerNeeded(closestAnimal)
				DeleteEntity(closestAnimal)
			 else
			 	exports['mythic_notify']:DoShortHudText('inform', 'This is the wrong tool for that activity, use a knife.', 3000)
			 end
			--print('yep it ded')
		elseif dead == false then
			exports['mythic_notify']:DoShortHudText('inform', 'This animal is not dead.', 3000)
		end
	end
end)

RegisterNetEvent('hunting:SellMeat')
AddEventHandler('hunting:SellMeat', function()
	local coords = GetEntityCoords(PlayerPedId())
	local seller = vector3(-70.23,6256.43,31.09)
	if #(coords - seller) < 3 then
		TriggerServerEvent('hunting:sellMeat')
	else
		exports['mythic_notify']:SendAlert('inform', 'No.')
	end
end)

RegisterNetEvent('hunting:SellLeather')
AddEventHandler('hunting:SellLeather', function()
	local coords = GetEntityCoords(PlayerPedId())
	local seller = vector3(-70.23,6256.43,31.09)
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
