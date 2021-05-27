
ESX                             = nil


-- This is a less secure, but servicable alternative if your ESX does not handle ESX.Game.GetClosestPed() correctly, and returns a nil value, or identifies the target entity as the player.

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
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
	distance = 2.5
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
 --`a_c_cow`,`a_c_deer`,`a_c_boar`,`a_c_coyote`,`a_c_mtlion`,`a_c_pig`,`a_c_rabbit_01`,`a_c_rat`,`a_c_cat`,`a_c_chickenhawk`,`a_c_chimp`,`a_c_chop`,`a_c_cormorant`,`a_c_crow`,`a_c_dolphin`,`a_c_fish`,`a_c_hen`,`a_c_humpback`,`a_c_husky`,`a_c_killerwhale`,`a_c_pigeon`,`a_c_poodle`,`a_c_pug`,`a_c_retriever`,`a_c_rhesus`,`a_c_rottweiler`,`a_c_seagull`,`a_c_sharkhammer`,`a_c_sharktiger`,`a_c_shepherd`,`a_c_stingray`,`a_c_westy` <- all model hashes, If needbe you can probably attach these their own events, messy but workable.

RegisterNetEvent("hunting:butcherCreature")
AddEventHandler("hunting:butcherCreature", function()
	local dead = false
	local plyCoords = GetEntityCoords(PlayerPedId())
	local animal = `a_c_cow`,`a_c_deer`,`a_c_boar`,`a_c_coyote`,`a_c_mtlion`,`a_c_pig`,`a_c_rabbit_01`,`a_c_rat`,`a_c_cat`,`a_c_chickenhawk`,`a_c_chimp`,`a_c_chop`,`a_c_cormorant`,`a_c_crow`,`a_c_dolphin`,`a_c_fish`,`a_c_hen`,`a_c_humpback`,`a_c_husky`,`a_c_killerwhale`,`a_c_pigeon`,`a_c_poodle`,`a_c_pug`,`a_c_retriever`,`a_c_rhesus`,`a_c_rottweiler`,`a_c_seagull`,`a_c_sharkhammer`,`a_c_sharktiger`,`a_c_stingray`,`a_c_westy` --dunno why but this seems to make it all work?
	local aniCoords = GetEntityCoords(GetHashKey(animal))
	local closestAnimal, closestDistance = ESX.Game.GetClosestPed(plyCoords) -- This might as well not be called in this case, however leaving in just on the offchance.
	if closestAnimal ~= -1 and closestDistance <= 3.0 then 
		if IsPedArmed(PlayerPedId(), 1) then -- Condensed logic to circumvent the networking issue when either not running OneSync, or not using Infinity?
			dead = true
			 if GetSelectedPedWeapon(PlayerPedId()) == GetHashKey('WEAPON_KNIFE') then
				if DoesEntityExist(closestAnimal) then
					-- harvest this sonofa thnx thelindat
					TaskPlayAnim(PlayerPedId(), "amb@medic@standing@kneel@base" ,"base" ,8.0, -8.0, -1, 1, 0, false, false, false )
					TriggerEvent("mythic_progbar:client:progress", { -- MUCHO IMPORTANTE FOR THE TARGETING SYSTEM TO PREVENT TRIGGER SPAM DO NOT REMOVE UNLESS YOU ARE TRYINNA PATCH THAT ISH YOURSELF
						name = "skinning",
						duration = 7500,
						label = "Skinning Animal",
						useWhileDead = false,
						canCancel = true,
						controlDisables = {
							disableMovement = false,
							disableCarMovement = false,
							disableMouse = false,
							disableCombat = false,
						},
						animation = {
							animDict = "anim@gangops@facility@servers@bodysearch@",
							anim = "player_search"
						},
					}, function(status)
						if not status then
							Citizen.Wait(500)
							ClearPedTasksImmediately(PlayerPedId())
							local AnimalWeight = math.random(200) / 10
							exports['mythic_notify']:SendAlert('inform', 'You have slaughtered an animal yielding a total of ' ..AnimalWeight.. 'kg of meat and leather.', 6500)
							TriggerServerEvent('hunting:rewardShit', AnimalWeight) -- Thnx Qalle!
							Citizen.Wait(1000)
							SetEntityAsNoLongerNeeded(closestAnimal)
							ClearAreaOfPeds(plyCoords.x,plyCoords.y,plyCoords.z, 5.00, 28)
							--exports['utk_stress']:AddStress('instant', 10000) insert stress here.
						end
					end)
				end
			 else
			 	exports['mythic_notify']:SendAlert('inform', 'This is the wrong tool for that activity, use a knife.', 3000)
			 end
		elseif not netid then
			exports['mythic_notify']:SendAlert('inform', 'This animal is not dead or this is not your kill.', 3000)
		end
	end
end)

RegisterNetEvent('hunting:SellMeat')
AddEventHandler('hunting:SellMeat', function()
	local coords = GetEntityCoords(PlayerPedId())
	local seller = vector3(-70.23,6256.43,31.09) -- or config this bitch w/e you'll need to adjust the bt-target location to sell, or add items to however you deal with the like.
	if #(coords - seller) < 5 then
		TriggerServerEvent('hunting:sellMeat')
	else
		exports['mythic_notify']:SendAlert('inform', 'No.')
	end
end)


-- Thanx u DRKM43 you beautiful bastard for this ped spawning handler 
local spawnedPeds = {}

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(500)
		for k,v in pairs(Config.PedList) do
			local playerCoords = GetEntityCoords(PlayerPedId())
			local distance = #(playerCoords - v.coords.xyz)
			if distance < Config.DistanceSpawn and not spawnedPeds[k] then
				local spawnedPed = NearPed(v.model, v.coords, v.gender, v.animDict, v.animName, v.scenario)
				spawnedPeds[k] = { spawnedPed = spawnedPed }
			end
			if distance >= Config.DistanceSpawn and spawnedPeds[k] then
				if Config.FadeIn then
					for i = 255, 0, -51 do
						Citizen.Wait(50)
						SetEntityAlpha(spawnedPeds[k].spawnedPed, i, false)
					end
				end
				DeletePed(spawnedPeds[k].spawnedPed)
				spawnedPeds[k] = nil
			end
		end
	end
end)

function NearPed(model, coords, gender, animDict, animName, scenario)
	RequestModel(model)
	while not HasModelLoaded(model) do
		Citizen.Wait(50)
	end
	if Config.MinusOne then
		spawnedPed = CreatePed(Config.GenderNumbers[gender], model, coords.x, coords.y, coords.z - 1.0, coords.w, false, true)
	else
		spawnedPed = CreatePed(Config.GenderNumbers[gender], model, coords.x, coords.y, coords.z, coords.w, false, true)
	end
	SetEntityAlpha(spawnedPed, 0, false)
	if Config.Frozen then
		FreezeEntityPosition(spawnedPed, true)
	end
	if Config.Invincible then
		SetEntityInvincible(spawnedPed, true)
	end
	if Config.Stoic then
		SetBlockingOfNonTemporaryEvents(spawnedPed, true)
	end
	if animDict and animName then
		RequestAnimDict(animDict)
		while not HasAnimDictLoaded(animDict) do
			Citizen.Wait(50)
		end
		TaskPlayAnim(spawnedPed, animDict, animName, 8.0, 0, -1, 1, 0, 0, 0)
	end
    if scenario then
        TaskStartScenarioInPlace(spawnedPed, scenario, 0, true)
    end
	if Config.FadeIn then
		for i = 0, 255, 51 do
			Citizen.Wait(50)
			SetEntityAlpha(spawnedPed, i, false)
		end
	end
	return spawnedPed
end

local model ={
	`s_m_y_autopsy_01` --if wishing to use a different model place the model hash or modelID here.
}

exports['bt-target']:AddTargetModel(model, {
	options = {
		{
			event = "hunting:SellMeat",
			icon = "fas fa-store",
			label = "Sell Meats",
		},
		{
			event = "hunting:SellLeather",
			icon = "fas fa-store",
			label = "Sell Leathers",
		},
	},
	job = {"all"},
	distance = 3.0
})

RegisterNetEvent('hunting:SellLeather')
AddEventHandler('hunting:SellLeather', function()
	local coords = GetEntityCoords(PlayerPedId())
	local seller = vector3(-70.23,6256.43,31.09) -- or config this bitch w/e you'll need to adjust the bt-target location to sell, or add items to however you deal with the like.
	if #(coords - seller) < 5 then -- if you trust your clients you can remove this.
		TriggerServerEvent('hunting:sellLeather')
	else
		exports['mythic_notify']:SendAlert('inform', 'No.') -- if your mythic_notify does not have the SendAlert export, replace with any of the others i.e DoShortHudText, DoLongHudText, etc.
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