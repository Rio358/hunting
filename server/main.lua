ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)ESX = obj end)

RegisterServerEvent('hunting:rewardShit')
AddEventHandler('hunting:rewardShit', function(Weight)
    math.randomseed(os.time())
    local xPlayer = ESX.GetPlayerFromId(source)
    local luck = math.random(1,100)
    local luck2 = math.random(1,100)
    local luck3 = math.random(1,100)
    local luck4 = math.random(1,100)

    if Weight >= 1 then
        if luck >= 95 then
            if xPlayer.canCarryItem('meat5star', tonumber(Weight) / 2) then
                xPlayer.addInventoryItem('meat5star', tonumber(Weight) / 2)
            else
                TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer, {type = 'error', text = 'You cannot carry anymore.', length = 3000})
            end
        elseif luck >= 85 and luck <= 94 then
            if xPlayer.canCarryItem('meat4star', tonumber(Weight) / 2) then
                xPlayer.addInventoryItem('meat4star', tonumber(Weight) / 2)
            else
                TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer, {type = 'error', text = 'You cannot carry anymore.', length = 3000})
            end
        elseif luck >= 55 and luck <= 84 then
            if xPlayer.canCarryItem('meat3star', tonumber(Weight) / 2) then
                xPlayer.addInventoryItem('meat3star', tonumber(Weight) / 2)
            else
                TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer, {type = 'error', text = 'You cannot carry anymore.', length = 3000})
            end
        elseif luck >= 35 and luck <= 54 then
            if xPlayer.canCarryItem('meat2star', tonumber(Weight) / 2) then
                xPlayer.addInventoryItem('meat2star', tonumber(Weight) / 2)
            else
                TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer, {type = 'error', text = 'You cannot carry anymore.', length = 3000})
            end
        elseif luck >= 1 and luck <= 34 then
            if xPlayer.canCarryItem('meat', tonumber(Weight) / 2) then
                xPlayer.addInventoryItem('meat', tonumber(Weight) / 2)
            else
                TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer, {type = 'error', text = 'You cannot carry anymore.', length = 3000})
            end
        end
    elseif Weight >= 9 then

        if luck2 >= 95 then
            if xPlayer.canCarryItem('meat5star', tonumber(Weight) / 2) then
                xPlayer.addInventoryItem('meat5star', tonumber(Weight) / 2)
            else
                TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer, {type = 'error', text = 'You cannot carry anymore.', length = 3000})
            end
        elseif luck2 >= 85 and luck2 <= 94 then
            if xPlayer.canCarryItem('meat4star', tonumber(Weight) / 2) then
                xPlayer.addInventoryItem('meat4star', tonumber(Weight) / 2)
            else
                TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer, {type = 'error', text = 'You cannot carry anymore.', length = 3000})
            end
        elseif luck2 >= 55 and luck2 <= 84 then
            if xPlayer.canCarryItem('meat3star', tonumber(Weight) / 2) then
                xPlayer.addInventoryItem('meat3star', tonumber(Weight) / 2)
            else
                TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer, {type = 'error', text = 'You cannot carry anymore.', length = 3000})
            end
        elseif luck2 >= 35 and luck2 <= 54 then
            if xPlayer.canCarryItem('meat2star', tonumber(Weight) / 2) then
                xPlayer.addInventoryItem('meat2star', tonumber(Weight) / 2)
            else
                TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer, {type = 'error', text = 'You cannot carry anymore.', length = 3000})
            end
        elseif luck2 >= 1 and luck2 <= 34 then
            if xPlayer.canCarryItem('meat', tonumber(Weight) / 2) then
                xPlayer.addInventoryItem('meat', tonumber(Weight) / 2)
            else
                TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer, {type = 'error', text = 'You cannot carry anymore.', length = 3000})
            end
    elseif Weight >= 15 then

        if luck3 >= 95 then
            if xPlayer.canCarryItem('meat5star', tonumber(Weight) / 2) then
                xPlayer.addInventoryItem('meat5star', tonumber(Weight) / 2 )
            else
                TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer, {type = 'error', text = 'You cannot carry anymore.', length = 3000})
            end
        end
        elseif luck3 >= 85 and luck3 <= 94 then
            if xPlayer.canCarryItem('meat4star', tonumber(Weight) / 2) then
                xPlayer.addInventoryItem('meat4star', tonumber(Weight) / 2)
            else
                TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer, {type = 'error', text = 'You cannot carry anymore.', length = 3000})
            end
        elseif luck3 >= 55 and luck3 <= 84 then
            if xPlayer.canCarryItem('meat3star', tonumber(Weight) / 2) then
                xPlayer.addInventoryItem('meat3star', tonumber(Weight) / 2)
            else
                TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer, {type = 'error', text = 'You cannot carry anymore.', length = 3000})
            end
        elseif luck3 >= 35 and luck3 <= 54 then
            if xPlayer.canCarryItem('meat2star', tonumber(Weight) / 2) then
                xPlayer.addInventoryItem('meat2star', tonumber(Weight) / 2)
            else
                TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer, {type = 'error', text = 'You cannot carry anymore.', length = 3000})
            end
        elseif luck3 >= 1 and luck3 <= 34 then
            if xPlayer.canCarryItem('meat', tonumber(Weight) / 2) then
                xPlayer.addInventoryItem('meat', tonumber(Weight) / 2)
            else
                TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer, {type = 'error', text = 'You cannot carry anymore.', length = 3000})
            end
        end
    end
end)

RegisterServerEvent('hunting:SkinIt')
AddEventHandler('hunting:SkinIt', function()
    math.randomseed(os.time())
    local xPlayer = ESX.GetPlayerFromId(source)
    local luck4 = math.random(100)

    if luck4 >= 95 then 
        if xPlayer.canCarryItem('leather5star', math.random(4)) then
            xPlayer.addInventoryItem('leather5star', math.random(4))
        else
            TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer, {type = 'error', text = 'You cannot carry anymore.', length = 3000})
        end
    elseif luck4 < 95 and luck4 > 86 then
        if xPlayer.canCarryItem('leather4star', math.random(4)) then
            xPlayer.addInventoryItem('leather4star', math.random(4))
        else
            TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer, {type = 'error', text = 'You cannot carry anymore.', length = 3000})
        end
    elseif luck4 <= 85 and luck4 > 65 then
        if xPlayer.canCarryItem('leather3star', math.random(4)) then
            xPlayer.addInventoryItem('leather3star', math.random(4))
        else
            TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer, {type = 'error', text = 'You cannot carry anymore.', length = 3000})
        end
    elseif luck4 <= 64 and luck4 > 34 then
        if xPlayer.canCarryItem('leather2star', math.random(4)) then
            xPlayer.addInventoryItem('leather2star', math.random(4))
        else
            TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer, {type = 'error', text = 'You cannot carry anymore.', length = 3000})
        end
    elseif luck4 <= 33 and luck4 > 1 then
        if xPlayer.canCarryItem('leather', math.random(4)) then
            xPlayer.addInventoryItem('leather', math.random(4))
        else
            TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer, {type = 'error', text = 'You cannot carry anymore.', length = 3000})
        end
    end
end)

RegisterServerEvent('hunting:sellMeat')
AddEventHandler('hunting:sellMeat', function()
    math.randomseed(os.time())
    local xPlayer = ESX.GetPlayerFromId(source)
    --local quality = math.random(1,5)
    local MeatPrice = math.random(27, 54)
    local MeatQuantity = xPlayer.getInventoryItem('meat').count
    local MeatQuantity2 = xPlayer.getInventoryItem('meat2star').count
    local MeatQuantity3 = xPlayer.getInventoryItem('meat3star').count
    local MeatQuantity4 = xPlayer.getInventoryItem('meat4star').count
    local MeatQuantity5 = xPlayer.getInventoryItem('meat5star').count
    
    if MeatQuantity >= 1 then
        local quality = 1
        local amount = math.random(5)
        if MeatQuantity >= amount then
            xPlayer.addMoney(quality * MeatPrice * amount)
            xPlayer.removeInventoryItem('meat', amount)
            TriggerClientEvent('mythic_notify:client:DoLongHudText', xPlayer.source, {type = 'inform', text = 'You have sold ' .. amount .. ' 1 star Meats and earned $' .. MeatPrice * amount .. '.', length = 12500})
        end
    
    elseif MeatQuantity2 >= 1 then
        local quality = 2
        local amount2star = math.random(5)
        if MeatQuantity2 >= amount2star then
            xPlayer.addMoney(math.ceil(quality * MeatPrice) * 1.25 * amount2star)
            xPlayer.removeInventoryItem('meat2star', amount2star)
            TriggerClientEvent('mythic_notify:client:DoLongHudText', xPlayer.source, {type = 'inform', text = 'You have sold ' .. amount2star .. ' 2 star Meats and earned $' .. MeatPrice * 1.25 * quality * amount2star .. '.', length = 12500})
        end
    
    elseif MeatQuantity3 >= 1 then
        local quality = 3
        local amount3star = math.random(5)
        if MeatQuantity3 >= amount3star then
            xPlayer.addMoney(math.ceil(quality * MeatPrice) * 1.5 * amount3star)
            xPlayer.removeInventoryItem('meat3star', amount3star)
            TriggerClientEvent('mythic_notify:client:DoLongHudText', xPlayer.source, {type = 'inform', text = 'You have sold ' .. amount3star .. ' 3 star Meats and earned $' .. MeatPrice * 1.5 * quality * amount3star .. '.', length = 12500})
        end
    
    elseif MeatQuantity4 >= 1 then
        local quality = 4
        local amount4star = math.random(5)
        if MeatQuantity4 >= amount4star then
            xPlayer.addMoney(math.ceil(quality * MeatPrice) * 2 * amount4star)
            xPlayer.removeInventoryItem('meat4star', amount4star)
            TriggerClientEvent('mythic_notify:client:DoLongHudText', xPlayer.source, {type = 'inform', text = 'You have sold ' .. amount4star .. ' 4 star Meats and earned $' .. MeatPrice * 2 * quality * amount4star .. '.', length = 12500})
        end
    
    elseif MeatQuantity5 >= 1 then
        local quality = 5
        local amount5star = math.random(5)
        if MeatQuantity5 >= amount5star then
            xPlayer.addMoney(math.ceil(quality * MeatPrice) * 2.5 * amount5star)
            xPlayer.removeInventoryItem('meat5star', amount5star)
            TriggerClientEvent('mythic_notify:client:DoLongHudText', xPlayer.source, {type = 'inform', text = 'You have sold ' .. amount5star .. ' 5 star Meats and earned $' .. MeatPrice * 2.5 * quality * amount5star .. '.', length = 12500})
        end
    else
        TriggerClientEvent('mythic_notify:client:DoLongHudText', xPlayer.source, {type = 'inform', text = 'You don\'t have any meat to sell?', length = 3000})
    end
end)

RegisterServerEvent('hunting:sellLeather')
AddEventHandler('hunting:sellLeather', function()
    math.randomseed(os.time())
    local xPlayer = ESX.GetPlayerFromId(source)
    --local quality = math.random(1,5)
    local LeatherPrice = math.random(65, 84)
    local LeatherQuantity = xPlayer.getInventoryItem('leather').count
    local LeatherQuantity2 = xPlayer.getInventoryItem('leather2star').count
    local LeatherQuantity3 = xPlayer.getInventoryItem('leather3star').count
    local LeatherQuantity4 = xPlayer.getInventoryItem('leather4star').count
    local LeatherQuantity5 = xPlayer.getInventoryItem('leather5star').count
    
    if LeatherQuantity >= 1 then
        local quality = 1
        local amount = math.random(5)
        if LeatherQuantity >= amount then
            xPlayer.addMoney(quality * LeatherPrice * amount)
            xPlayer.removeInventoryItem('leather', amount)
            TriggerClientEvent('mythic_notify:client:DoLongHudText', xPlayer.source, {type = 'inform', text = 'You have sold ' .. amount .. ' 1 star Leathers and earned $' .. LeatherPrice * amount .. '.', length = 12500})
        end
    
    elseif LeatherQuantity2 >= 1 then
        local quality = 2
        local amount2star = math.random(5)
        if LeatherQuantity2 >= amount2star then
            xPlayer.addMoney(math.ceil(quality * LeatherPrice) * 1.25 * amount2star)
            xPlayer.removeInventoryItem('leather2star', amount2star)
            TriggerClientEvent('mythic_notify:client:DoLongHudText', xPlayer.source, {type = 'inform', text = 'You have sold ' .. amount2star .. ' 2 star Leathers and earned $' .. LeatherPrice * 1.25 * quality * amount2star .. '.', length = 12500})
        end
    
    elseif LeatherQuantity3 >= 1 then
        local quality = 3
        local amount3star = math.random(5)
        if LeatherQuantity3 >= amount3star then
            xPlayer.addMoney(math.ceil(quality * LeatherPrice) * 1.5 * amount3star)
            xPlayer.removeInventoryItem('leather3star', amount3star)
            TriggerClientEvent('mythic_notify:client:DoLongHudText', xPlayer.source, {type = 'inform', text = 'You have sold ' .. amount3star .. ' 3 star Leathers and earned $' .. LeatherPrice * 1.5 * quality * amount3star .. '.', length = 12500})
        end
    
    elseif LeatherQuantity4 >= 1 then
        local quality = 4
        local amount4star = math.random(5)
        if LeatherQuantity4 >= amount4star then
            xPlayer.addMoney(math.ceil(quality * LeatherPrice) * 2 * amount4star)
            xPlayer.removeInventoryItem('leather4star', amount4star)
            TriggerClientEvent('mythic_notify:client:DoLongHudText', xPlayer.source, {type = 'inform', text = 'You have sold ' .. amount4star .. ' 4 star Leathers and earned $' .. LeatherPrice * 2 * quality * amount4star .. '.', length = 12500})
        end
    
    elseif LeatherQuantity5 >= 1 then
        local quality = 5
        local amount5star = math.random(5)
        if LeatherQuantity5 >= amount5star then
            xPlayer.addMoney(math.ceil(quality * LeatherPrice) * 2.5 * amount5star)
            xPlayer.removeInventoryItem('leather5star', amount5star)
            TriggerClientEvent('mythic_notify:client:DoLongHudText', xPlayer.source, {type = 'inform', text = 'You have sold ' .. amount5star .. ' 5 star Leathers and earned $' .. LeatherPrice * 2.5 * quality * amount5star .. '.', length = 12500})
        end
    else
        TriggerClientEvent('mythic_notify:client:DoLongHudText', xPlayer.source, {type = 'inform', text = 'You don\'t have any meat or leather to sell?', length = 3000})
    end
end)
