-- Credit to DRKM43 for his contribution and beautiful face.

Config = {}

Config.Invincible = true
Config.Frozen = true
Config.Stoic = true
Config.FadeIn = true
Config.DistanceSpawn = 20.0
Config.Stress = false

-- Actual Harvest time is the animals weight + this
Config.HarvestTime = 7500
Config.MeatWeight = 450 -- equiv of 1lb of meat per piece --make sure to set this to the same weight of the item in your inventory

Config.MinusOne = true

Config.GenderNumbers = {
	['male'] = 4,
	['female'] = 5
}

Config.PedList = {
	{
		model = `s_m_y_autopsy_01`, -- place holder, find a suitable ped and apply it here, adjust model flag in qtargeting to relfect the new chosen model as well, there is a safety backup right behind the ped just incase.
		coords = vector4(-69.77,6255.8,31.09, 208.48), -- Cluckin' Bell Factory Paleto Office.
		gender = 'male' -- he's got balls.
	},
}

Config.Animals = {
	[-832573324] = 	{	ModNam = 'a_c_boar', 			label = "Boar", 		minWeight = 4000, 	maxWeight = 16000},
	[1462895032] = 	{ 	ModNam = 'a_c_cat_01', 			label = "Cat", 			minWeight = 800, 	maxWeight = 2000},
	[-1430839454] = { 	ModNam = 'a_c_chickenhawk', 	label = "Chicken", 		minWeight = 1000, 	maxWeight = 2000},
	[-1469565163] = { 	ModNam = 'a_c_chimp', 			label = "Monkey", 		minWeight = 600, 	maxWeight = 2200},
	[351016938] = 	{ 	ModNam = 'a_c_chop', 			label = "Dog", 			minWeight = 1000, 	maxWeight = 2200},
	[1457690978] = 	{ 	ModNam = 'a_c_cormorant', 		label = "Cormorant", 	minWeight = 800, 	maxWeight = 1600},
	[-50684386] = 	{ 	ModNam = 'a_c_cow', 			label = "Cow", 			minWeight = 4000, 	maxWeight = 36000},
	[1682622302] = 	{ 	ModNam = 'a_c_coyote', 			label = "Coyote", 		minWeight = 600, 	maxWeight = 1200},
	[402729631] = 	{ 	ModNam = 'a_c_crow', 			label = "Crow", 		minWeight = 800, 	maxWeight = 1600},
	[-664053099] = 	{ 	ModNam = 'a_c_deer', 			label = "Deer", 		minWeight = 4000, 	maxWeight = 18000},
	[-1950698411] = { 	ModNam = 'a_c_dolphin', 		label = "Dolphin", 		minWeight = 4000, 	maxWeight = 6000},
	[802685111] = 	{ 	ModNam = 'a_c_fish', 			label = "Fish", 		minWeight = 200, 	maxWeight = 1600},
	[1794449327] = 	{ 	ModNam = 'a_c_hen', 			label = "Chicken", 		minWeight = 1000, 	maxWeight = 2000},
	[1193010354] = 	{ 	ModNam = 'a_c_humpback', 		label = "Whale", 		minWeight = 20000, 	maxWeight = 25000},
	[1318032802] = 	{ 	ModNam = 'a_c_husky', 			label = "Dog", 			minWeight = 2000, 	maxWeight = 4000},
	[-1920284487] = { 	ModNam = 'a_c_killerwhale',		label = "Whale", 		minWeight = 10000, 	maxWeight = 48000},
	[307287994] = 	{ 	ModNam = 'a_c_mtlion', 			label = "Cougar", 		minWeight = 4000, 	maxWeight = 1200},
	[-1323586730] = { 	ModNam = 'a_c_pig', 			label = "Pig", 			minWeight = 4000, 	maxWeight = 12000},
	[111281960] = 	{ 	ModNam = 'a_c_pigeon', 			label = "Pigeon", 		minWeight = 200, 	maxWeight = 1000},
	[1125994524] = 	{ 	ModNam = 'a_c_poodle', 			label = "Dog", 			minWeight = 500, 	maxWeight = 1500},
	[1832265812] = 	{ 	ModNam = 'a_c_pug', 			label = "Dog", 			minWeight = 500, 	maxWeight = 1500},
	[-541762431] = 	{ 	ModNam = 'a_c_rabbit_01', 		label = "Rabbit", 		minWeight = 400, 	maxWeight = 1200},
	[-1011537562] = { 	ModNam = 'a_c_rat', 			label = "Rat", 			minWeight = 200, 	maxWeight = 1000},
	[882848737] = 	{ 	ModNam = 'a_c_retriever', 		label = "Dog", 			minWeight = 2000, 	maxWeight = 4000},
	[-1026527405] = { 	ModNam = 'a_c_rhesus', 			label = "Monkey", 		minWeight = 500, 	maxWeight = 1500},
	[-1788665315] = { 	ModNam = 'a_c_rottweiler', 		label = "Dog", 			minWeight = 2500, 	maxWeight = 5000},
	[-745300483] = 	{ 	ModNam = 'a_c_seagull', 		label = "Seagull", 		minWeight = 800, 	maxWeight = 1600},
	[1015224100] = 	{ 	ModNam = 'a_c_sharkhammer', 	label = "Shark", 		minWeight = 4000, 	maxWeight = 16000},
	[113504370] = 	{	ModNam = 'a_c_sharktiger', 		label = "Shark", 		minWeight = 4000, 	maxWeight = 16000},
	[1126154828] = 	{ 	ModNam = 'a_c_shepherd', 		label = "Dog", 			minWeight = 2000, 	maxWeight = 4000},
	[-1589092019] = { 	ModNam = 'a_c_stingray', 		label = "Stingray", 	minWeight = 800, 	maxWeight = 1800},
	[-1384627013] = { 	ModNam = 'a_c_westy', 			label = "Dog", 			minWeight = 2000, 	maxWeight = 4000},
}

--[[
If your version of mythic_notify did not include SendAlert you may add it by doing the following. Locate the folder mythic_notify/client. Edit the main.lua to include the following

RegisterNetEvent('mythic_notify:client:SendAlert')
AddEventHandler('mythic_notify:client:SendAlert', function(data)
	SendAlert(data.type, data.text, data.length, data.style)
end)

function SendAlert(type, text, length, style)
	SendNUIMessage({
		type = type,
		text = text,
		length = length,
		style = style
	})
end

now, back to the root folder to locate either your resource__.lua or fxmanifest.lua and attach 

exports {
	'SendAlert',


the exports table will end up looking something like this

exports {
	'SendAlert',
	'SendUniqueAlert',
	'PersistentAlert',
	'DoLongHudText',
	'DoShortHudText',
	'DoHudText',
	'DoCustomHudText'
}

]]
