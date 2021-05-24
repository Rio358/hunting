ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)ESX = obj end)

RegisterServerEvent('hunting:rewardShit')
AddEventHandler('hunting:rewardShit', function(Weight)
    math.randomseed(os.time())
    local xPlayer = ESX.GetPlayerFromId(source)
    local luck = math.random(1, 100)
    local luck2 = math.random(1, 100)
    local luck3 = math.random(1, 100)
    local luck4 = math.random(1, 100)
    
    if Weight >= 1 then
        if luck >= 95 then
            if xPlayer.canCarryItem('meat5star', math.random(2)) then
                xPlayer.addInventoryItem('meat5star', math.random(2))
            end
        elseif luck >= 85 and luck <= 94 then
            if xPlayer.canCarryItem('meat4star', math.random(4)) then
                xPlayer.addInventoryItem('meat4star', math.random(4))
            end
        elseif luck >= 55 and luck <= 84 then
            if xPlayer.canCarryItem('meat3star', math.random(6)) then
                xPlayer.addInventoryItem('meat3star', math.random(6))
            end
        elseif luck >= 35 and luck <= 54 then
            if xPlayer.canCarryItem('meat2star', math.random(8)) then
                xPlayer.addInventoryItem('meat2star', math.random(8))
            end
        elseif luck >= 1 and luck <= 34 then
            if xPlayer.canCarryItem('meat', math.random(10)) then
                xPlayer.addInventoryItem('meat', math.random(10))
            end
        end
    elseif Weight >= 9 then
        if luck2 >= 95 then
            if xPlayer.canCarryItem('meat5star', math.random(2)) then
                xPlayer.addInventoryItem('meat5star', math.random(2))
            end
        elseif luck2 >= 85 and luck2 <= 94 then
            if xPlayer.canCarryItem('meat4star', math.random(4)) then
                xPlayer.addInventoryItem('meat4star', math.random(4))
            end
        elseif luck2 >= 55 and luck2 <= 84 then
            if xPlayer.canCarryItem('meat3star', math.random(6)) then
                xPlayer.addInventoryItem('meat3star', math.random(6))
            end
        elseif luck2 >= 35 and luck2 <= 54 then
            if xPlayer.canCarryItem('meat2star', math.random(8)) then
                xPlayer.addInventoryItem('meat2star', math.random(8))
            end
        elseif luck2 >= 1 and luck2 <= 34 then
            if xPlayer.canCarryItem('meat', math.random(10)) then
                xPlayer.addInventoryItem('meat', math.random(10))
            end
        elseif Weight >= 15 then
            if luck3 >= 95 then
                if xPlayer.canCarryItem('meat5star', math.random(2)) then
                    xPlayer.addInventoryItem('meat5star', math.random(2))
                end
            elseif luck3 >= 85 and luck3 <= 94 then
                if xPlayer.canCarryItem('meat4star', math.random(4)) then
                    xPlayer.addInventoryItem('meat4star', math.random(4))
                end
            elseif luck3 >= 55 and luck3 <= 84 then
                if xPlayer.canCarryItem('meat3star', math.random(6)) then
                    xPlayer.addInventoryItem('meat3star', math.random(6))
                end
            elseif luck3 >= 35 and luck3 <= 54 then
                if xPlayer.canCarryItem('meat2star', math.random(8)) then
                    xPlayer.addInventoryItem('meat2star', math.random(8))
                end
            elseif luck3 >= 1 and luck3 <= 34 then
                if xPlayer.canCarryItem('meat', math.random(10)) then
                    xPlayer.addInventoryItem('meat', math.random(10))
                end
            end
        end
    end
end)

RegisterServerEvent('hunting:SkinIt')
AddEventHandler('hunting:SkinIt', function()
    math.randomseed(os.time())
    local xPlayer = ESX.GetPlayerFromId(source)
    local luck4 = math.random(100)
    
    if luck4 >= 96 then
        if xPlayer.canCarryItem('leather5star', math.random(2)) then
            xPlayer.addInventoryItem('leather5star', math.random(2))
        end
    elseif luck4 <= 95 and luck4 >= 86 then
        if xPlayer.canCarryItem('leather4star', math.random(2)) then
            xPlayer.addInventoryItem('leather4star', math.random(2))
        end
    elseif luck4 <= 85 and luck4 >= 65 then
        if xPlayer.canCarryItem('leather3star', math.random(2)) then
            xPlayer.addInventoryItem('leather3star', math.random(2))
        end
    elseif luck4 <= 64 and luck4 >= 34 then
        if xPlayer.canCarryItem('leather2star', math.random(4)) then
            xPlayer.addInventoryItem('leather2star', math.random(4))
        end
    elseif luck4 <= 33 and luck4 >= 1 then
        if xPlayer.canCarryItem('leather', math.random(4)) then
            xPlayer.addInventoryItem('leather', math.random(4))
        end
    end
end)

RegisterServerEvent('hunting:sellMeat')
AddEventHandler('hunting:sellMeat', function()
    math.randomseed(os.time())
    local xPlayer = ESX.GetPlayerFromId(source)
    local MeatPrice = math.random(27, 54)
    local MeatQuantity = xPlayer.getInventoryItem('meat').count
    local MeatQuantity2 = xPlayer.getInventoryItem('meat2star').count
    local MeatQuantity3 = xPlayer.getInventoryItem('meat3star').count
    local MeatQuantity4 = xPlayer.getInventoryItem('meat4star').count
    local MeatQuantity5 = xPlayer.getInventoryItem('meat5star').count
    
    if MeatQuantity >= 1 then
        local quality = 1
        
        xPlayer.addMoney(quality * MeatPrice * MeatQuantity)
        xPlayer.removeInventoryItem('meat', MeatQuantity)
        TriggerClientEvent('mythic_notify:client:DoLongHudText', xPlayer.source, {type = 'inform', text = 'You have sold ' .. MeatQuantity .. ' 1 star Meats and earned $' .. MeatPrice * MeatQuantity .. '.', length = 12500})
    
    elseif MeatQuantity2 >= 1 then
        local quality = 2
        
        xPlayer.addMoney(math.ceil(quality * MeatPrice) * 1.25 * MeatQuantity2)
        xPlayer.removeInventoryItem('meat2star', MeatQuantity2)
        TriggerClientEvent('mythic_notify:client:DoLongHudText', xPlayer.source, {type = 'inform', text = 'You have sold ' .. MeatQuantity2 .. ' 2 star Meats and earned $' .. MeatPrice * 1.25 * quality * MeatQuantity2 .. '.', length = 12500})
    
    elseif MeatQuantity3 >= 1 then
        local quality = 3
        
        xPlayer.addMoney(math.ceil(quality * MeatPrice) * 1.5 * MeatQuantity3)
        xPlayer.removeInventoryItem('meat3star', MeatQuantity3)
        TriggerClientEvent('mythic_notify:client:DoLongHudText', xPlayer.source, {type = 'inform', text = 'You have sold ' .. MeatQuantity3 .. ' 3 star Meats and earned $' .. MeatPrice * 1.5 * quality * MeatQuantity3 .. '.', length = 12500})
    
    elseif MeatQuantity4 >= 1 then
        local quality = 4
        
        xPlayer.addMoney(math.ceil(quality * MeatPrice) * 2 * MeatQuantity4)
        xPlayer.removeInventoryItem('meat4star', MeatQuantity4)
        TriggerClientEvent('mythic_notify:client:DoLongHudText', xPlayer.source, {type = 'inform', text = 'You have sold ' .. MeatQuantity4 .. ' 4 star Meats and earned $' .. MeatPrice * 2 * quality * MeatQuantity4 .. '.', length = 12500})
    
    elseif MeatQuantity5 >= 1 then
        local quality = 5
        
        xPlayer.addMoney(math.ceil(quality * MeatPrice) * 2.5 * MeatQuantity5)
        xPlayer.removeInventoryItem('meat5star', MeatQuantity5)
        TriggerClientEvent('mythic_notify:client:DoLongHudText', xPlayer.source, {type = 'inform', text = 'You have sold ' .. MeatQuantity5 .. ' 5 star Meats and earned $' .. MeatPrice * 2.5 * quality * MeatQuantity5 .. '.', length = 12500})
    else
        TriggerClientEvent('mythic_notify:client:DoLongHudText', xPlayer.source, {type = 'inform', text = 'You don\'t have any meat to sell?', length = 3000})
    end
end)

RegisterServerEvent('hunting:sellLeather')
AddEventHandler('hunting:sellLeather', function()
    math.randomseed(os.time())
    local xPlayer = ESX.GetPlayerFromId(source)
    local LeatherPrice = math.random(54, 87)
    local LeatherQuantity = xPlayer.getInventoryItem('leather').count
    local LeatherQuantity2 = xPlayer.getInventoryItem('leather2star').count
    local LeatherQuantity3 = xPlayer.getInventoryItem('leather3star').count
    local LeatherQuantity4 = xPlayer.getInventoryItem('leather4star').count
    local LeatherQuantity5 = xPlayer.getInventoryItem('leather5star').count
    
    if LeatherQuantity >= 1 then
        local quality = 1
        
        xPlayer.addMoney(quality * LeatherPrice * LeatherQuantity)
        xPlayer.removeInventoryItem('leather', LeatherQuantity)
        TriggerClientEvent('mythic_notify:client:DoLongHudText', xPlayer.source, {type = 'inform', text = 'You have sold ' .. LeatherQuantity .. ' 1 star Leathers and earned $' .. LeatherPrice * LeatherQuantity .. '.', length = 12500})
    
    elseif LeatherQuantity2 >= 1 then
        local quality = 2
        
        
        xPlayer.addMoney(math.ceil(quality * LeatherPrice) * 1.25 * LeatherQuantity2)
        xPlayer.removeInventoryItem('leather2star', LeatherQuantity2)
        TriggerClientEvent('mythic_notify:client:DoLongHudText', xPlayer.source, {type = 'inform', text = 'You have sold ' .. LeatherQuantity2 .. ' 2 star Leathers and earned $' .. LeatherPrice * 1.25 * quality * LeatherQuantity2 .. '.', length = 12500})
    
    elseif LeatherQuantity3 >= 1 then
        local quality = 3
        
        xPlayer.addMoney(math.ceil(quality * LeatherPrice) * 1.5 * LeatherQuantity3)
        xPlayer.removeInventoryItem('leather3star', LeatherQuantity3)
        TriggerClientEvent('mythic_notify:client:DoLongHudText', xPlayer.source, {type = 'inform', text = 'You have sold ' .. LeatherQuantity3 .. ' 3 star Leathers and earned $' .. LeatherPrice * 1.5 * quality * LeatherQuantity3 .. '.', length = 12500})
    
    elseif LeatherQuantity4 >= 1 then
        local quality = 4
        
        xPlayer.addMoney(math.ceil(quality * LeatherPrice) * 2 * LeatherQuantity4)
        xPlayer.removeInventoryItem('leather4star', LeatherQuantity4)
        TriggerClientEvent('mythic_notify:client:DoLongHudText', xPlayer.source, {type = 'inform', text = 'You have sold ' .. LeatherQuantity4 .. ' 4 star Leathers and earned $' .. LeatherPrice * 2 * quality * LeatherQuantity4 .. '.', length = 12500})
    
    elseif LeatherQuantity5 >= 1 then
        local quality = 5
        xPlayer.addMoney(math.ceil(quality * LeatherPrice) * 2.5 * LeatherQuantity5)
        xPlayer.removeInventoryItem('leather5star', LeatherQuantity5)
        TriggerClientEvent('mythic_notify:client:DoLongHudText', xPlayer.source, {type = 'inform', text = 'You have sold ' .. LeatherQuantity5 .. ' 5 star Leathers and earned $' .. LeatherPrice * 2.5 * quality * LeatherQuantity5 .. '.', length = 12500})
    
    else
        TriggerClientEvent('mythic_notify:client:DoLongHudText', xPlayer.source, {type = 'inform', text = 'You don\'t have any meat or leather to sell?', length = 3000})
    end
end)
