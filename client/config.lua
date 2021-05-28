-- Credit to DRKM43 for his contribution and beautiful face.

Config = {}

Config.Invincible = true
Config.Frozen = true
Config.Stoic = true
Config.FadeIn = true
Config.DistanceSpawn = 20.0
Config.Stress = false

Config.MinusOne = true

Config.GenderNumbers = {
	['male'] = 4,
	['female'] = 5
}

Config.PedList = {
	{
		model = `s_m_y_autopsy_01`, -- place holder, find a suitable ped and apply it here, adjust model flag in bt-targeting to relfect the new chosen model as well, there is a safety backup right behind the ped just incase.
		coords = vector4(-69.77,6255.8,31.09, 208.48), -- Cluckin' Bell Factory Paleto Office.
		gender = 'male' -- he's got balls.
	},
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
