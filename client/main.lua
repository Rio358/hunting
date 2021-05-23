
ESX                             = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(10)
	end
    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(100)
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
	local dead = false -- for posterity's sake we'll assign a status to the ped in question
	local closestAnimal, closestDistance = ESX.Game.GetClosestPed(coords) -- the magic happens here, also this native seems to be tempermental
	local animal = `a_c_cow`,`a_c_deer`, `a_c_boar`, `a_c_coyote`, `a_c_mtlion`, `a_c_pig`, `a_c_rabbit_01`, `a_c_rat` --dunno why but this seems to make it all work?
	local plyCoords = GetEntityCoords(PlayerPedId()) -- this is you
	local coords = GetEntityCoords(animal) -- this is the animal allegedly?
	if closestAnimal ~= -1 and closestDistance <= 3.0 then -- This is some distance checking
		if GetPedType(closestAnimal) == 28 and GetEntityHealth(closestAnimal) == 0 then -- this asks very specifically if the ped is an animal and if that animal is dead as shit
			dead = true
			 if GetSelectedPedWeapon(PlayerPedId()) == GetHashKey('WEAPON_KNIFE')  then -- weapon check for knife in-hand, remove it if you don't care, but it's immersive

				TaskPlayAnim(PlayerPedId(), "amb@medic@standing@kneel@base" ,"base" ,8.0, -8.0, -1, 1, 0, false, false, false ) -- this was a good animation to yoink
				TaskPlayAnim(PlayerPedId(), "anim@gangops@facility@servers@bodysearch@" ,"player_search" ,8.0, -8.0, -1, 48, 0, false, false, false ) -- as was this, credits to qalle
				Citizen.Wait(10000) -- adjust how long it takes to perform the skinning 
				ClearPedTasksImmediately(PlayerPedId()) 
				local AnimalWeight = math.random(200) / 10 -- to do, better rounding for this? sorta makes things fucked on the server side you'll have less than whole number items, but someone can address it someday
				exports['mythic_notify']:DoLongHudText('inform', 'You have slaughtered an animal yielding a total of ' ..AnimalWeight.. 'kg of meat and leather.', 6500)
				TriggerServerEvent('hunting:rewardShit', AnimalWeight) -- adds the meat selection
				Citizen.Wait(150)
				TriggerServerEvent('hunting:SkinIt') -- adds leather selection
				SetEntityAsNoLongerNeeded(closestAnimal) -- default cleanup activities
				DeleteEntity(closestAnimal) -- destroy object when we're done (animal)
			 else
			 	exports['mythic_notify']:DoShortHudText('inform', 'This is the wrong tool for that activity, use a knife.', 3000) --help text, use whatever you want
			 end
			--print('yep it ded')
		elseif dead == false then
			exports['mythic_notify']:DoShortHudText('inform', 'This animal is not dead.', 3000)
			dead = false
		end
	end
end)

RegisterNetEvent('hunting:SellMeat')
AddEventHandler('hunting:SellMeat', function()
	local coords = GetEntityCoords(PlayerPedId())
	local seller = vector3(-70.23,6256.43,31.09) -- or config this bitch w/e you'll need to adjust the bt-target location to sell, or add items to however you deal with the like.
	if #(coords - seller) < 3 then -- distance check, sort of redundant but there if you want
		TriggerServerEvent('hunting:sellMeat') -- indexes all the meat you have on your persons, and goes through them one by oen
	else
		exports['mythic_notify']:SendAlert('inform', 'No.')
	end
end)

RegisterNetEvent('hunting:SellLeather')
AddEventHandler('hunting:SellLeather', function()
	local coords = GetEntityCoords(PlayerPedId())
	local seller = vector3(-70.23,6256.43,31.09) -- or config this bitch w/e you'll need to adjust the bt-target location to sell, or add items to however you deal with the like.
	if #(coords - seller) < 3 then
		TriggerServerEvent('hunting:sellLeather') -- same as meat, but for leather!
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
