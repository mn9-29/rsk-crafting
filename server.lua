local QRCore = exports['qr-core']:GetCoreObject()

RegisterServerEvent("rsk-crafting:server:craftitem")
AddEventHandler("rsk-crafting:server:craftitem", function(item, typx)
    local src = source
    craft(src, item, typx)
end)

function craft(src, item, typx)
    local Player = QRCore.Functions.GetPlayer(src)
    local cancraft = false
    local total = 0
    local count = 0
	local xxxitem = item + 1
    if typx == "items" then -- تصنيع الاغراض
        if Player.PlayerData.metadata["craftingrep"] >= Config.Items[xxxitem].Level then
            for k, v in pairs(Config.Items[xxxitem].Ingredients) do
                total = total + 1
                local mat = Player.Functions.GetItemByName(v.item)
                if mat ~= nil and mat.amount >= v.amount then
                    count = count + 1
                end
            end
            if total == count then
                cancraft = true
            else
                TriggerClientEvent("QRCore:Notify", src, 'You dont have enough materials', 'error')
            end

            if cancraft then
                for k, v in pairs(Config.Items[xxxitem].Ingredients) do
                    Player.Functions.RemoveItem(v.item, v.amount)
                    TriggerClientEvent('inventory:client:ItemBox', src, QRCore.Shared.Items[v.item], "remove")
                end
                Citizen.Wait(1000)
                local xiteim = Config.Items[xxxitem].item

                if QRCore.Shared.Items[xiteim].unique == true then

                    if xiteim == 'diving_gear' then

                        info = {}
                        info.oxygen = 200

                        Player.Functions.AddItem(xiteim, 1, false, Info)
                        TriggerClientEvent('inventory:client:ItemBox', src, QRCore.Shared.Items[xiteim], "add")
                        TriggerEvent("qr-log:server:CreateLog", "crafting", "لوق التصنيع", "green", "لقد قام المواطن  : "..GetPlayerName(src).."\n"..Player.PlayerData.citizenid.." \n \n بتصنيع الايتم : "..QRCore.Shared.Items[xiteim].label.." ")
                    else
                        Player.Functions.AddItem(xiteim, 1)
                        TriggerClientEvent('inventory:client:ItemBox', src, QRCore.Shared.Items[xiteim], "add")
                        TriggerEvent("qr-log:server:CreateLog", "crafting", "لوق التصنيع", "green", "لقد قام المواطن  : "..GetPlayerName(src).."\n"..Player.PlayerData.citizenid.." \n \n بتصنيع الايتم : "..QRCore.Shared.Items[xiteim].label.." ")
 
                    end
               
                else
                    Player.Functions.AddItem(xiteim, 1)
                    TriggerClientEvent('inventory:client:ItemBox', src, QRCore.Shared.Items[xiteim], "add")
                    TriggerEvent("qr-log:server:CreateLog", "crafting", "لوق التصنيع", "green", "لقد قام المواطن  : "..GetPlayerName(src).."\n"..Player.PlayerData.citizenid.." \n \n بتصنيع الايتم : "..QRCore.Shared.Items[xiteim].label.." ("..count.."x) ")
                end

                if Player.PlayerData.metadata["craftingrep"] > 200 then
                    if Player.PlayerData.metadata['specializations'] == 'expert' and Player.PlayerData.metadata["award1"] then 
                        local PlayerRobberyPoint = Player.PlayerData.metadata['missionpoint']
                        Player.Functions.SetMetaData("missionpoint", PlayerRobberyPoint + math.random(1,2))
                    end
                end

                Player.Functions.SetMetaData("craftingrep", Player.PlayerData.metadata["craftingrep"]+(Config.Items[xxxitem].ExperiancePerCraft))
                TriggerClientEvent("QRCore:Notify", src, 'The piece has been crafted', 'success')
            end
        else
            TriggerClientEvent("QRCore:Notify", src, 'You dont have enough points', 'error')
        end
    elseif typx == 'weapons' then
        if Player.PlayerData.metadata["craftingrep"] >= Config.Weapons[xxxitem].Level then
            for k, v in pairs(Config.Weapons[xxxitem].Ingredients) do
                total = total + 1
                local mat = Player.Functions.GetItemByName(v.item)
                if mat ~= nil and mat.amount >= v.amount then
                    count = count + 1
                end
            end
            if total == count then
                cancraft = true
            else
                TriggerClientEvent("QRCore:Notify", src, 'You dont have all parts', 'error')
            end

            if cancraft then
                for k, v in pairs(Config.Weapons[xxxitem].Ingredients) do
                    Player.Functions.RemoveItem(v.item, v.amount)
                    TriggerClientEvent('inventory:client:ItemBox', src, QRCore.Shared.Items[v.item], "remove")
                end
                Citizen.Wait(1000)
                local xiteim = Config.Weapons[xxxitem].item

                -- if QRCore.Shared.Items[xiteim].unique == true then
                    Player.Functions.AddItem(xiteim, 1)
                    TriggerClientEvent('inventory:client:ItemBox', src, QRCore.Shared.Items[Config.Weapons[xxxitem].item], "add")
                    TriggerEvent("qr-log:server:CreateLog", "crafting", "لوق التصنيع", "green", "لقد قام المواطن  : "..GetPlayerName(src).."\n"..Player.PlayerData.citizenid.." \n \n بتصنيع الايتم : "..QRCore.Shared.Items[xiteim].label.." ")
                -- else
                --     Player.Functions.AddItem(xiteim, count)
                --     TriggerClientEvent('inventory:client:ItemBox', src, QRCore.Shared.Items[xiteim], "add")
                --     TriggerEvent("qr-log:server:CreateLog", "crafting", "لوق التصنيع", "green", "لقد قام المواطن  : "..GetPlayerName(src).."\n"..Player.PlayerData.citizenid.." \n \n بتصنيع الايتم : "..QRCore.Shared.Items[xiteim].label.." ("..count.."x) ")
                -- end

                if Player.PlayerData.metadata["craftingrep"] > 200 then
                    if Player.PlayerData.metadata['specializations'] == 'expert' and Player.PlayerData.metadata["award1"] then 
                        local PlayerRobberyPoint = Player.PlayerData.metadata['missionpoint']
                        Player.Functions.SetMetaData("missionpoint", PlayerRobberyPoint + math.random(1,2))
                    end
                end

                Player.Functions.SetMetaData("craftingrep", Player.PlayerData.metadata["craftingrep"]+(Config.Weapons[xxxitem].ExperiancePerCraft))
                TriggerClientEvent("QRCore:Notify", src, 'The piece has been crafted', 'success')
            end
        else
            TriggerClientEvent("QRCore:Notify", src, 'You dont have enough points', 'error')
        end
    end
end

QRCore.Commands.Add("givecraftrep", "Give Crafting Rep", {{name="id", help="ID of player"}, {name="amount", help="Amount of Rep"}}, false, function(source, args)

    local Player = QRCore.Functions.GetPlayer(tonumber(args[1]))

   if Player ~= nil then 
    if args[1] ~= nil and args[2] ~= nil then
        local x = tonumber(args[1])
        local y = tonumber(args[2])

            local newrep = y + Player.PlayerData.metadata['craftingrep']
            Player.Functions.SetMetaData("craftingrep", newrep)
            TriggerClientEvent('chatMessage', Player, "System", "error", "Added Rep Done")

            TriggerEvent("qr-log:server:CreateLog", "craftingrep", "اضافة خبرات", "red", "** لقد قام "..GetPlayerName(source).." باضافة "..y.." نقاط تصنيع من اللاعب : "..GetPlayerName(tonumber(args[1])).." ")
        
    else
        TriggerClientEvent('chatMessage', source, "System", "error", "Please fill in all the args")
    end

  else 
   TriggerClientEvent('chatMessage', source, "System", "error", "Player is offline")
end
end, "god")

function CreatePhoneNumber()
    local UniqueFound = false
    local PhoneNumber = nil
    while not UniqueFound do
        PhoneNumber =  "06" .. math.random(1000000,9999999)
        local query = '%' .. PhoneNumber .. '%'
        local result = MySQL.prepare.await('SELECT COUNT(*) as count FROM players WHERE charinfo LIKE ?', { query })
        if result == 0 then
            UniqueFound = true
        end
    end
    return PhoneNumber
end

CreateThread(function()
    for k,v in pairs(Config.Items) do
        
        if QRCore.Shared.Items[v.item] then 

            for n,m in pairs(v.Ingredients) do
                if QRCore.Shared.Items[m.item] then
                else
                    print('sorry ['..m.item..'] item not founded , say thanks to mazen : )')
                end
            end
        else
            for n,m in pairs(v.Ingredients) do
                
                if QRCore.Shared.Items[m.item] then

                else
                    print('sorry ['..m.item..'] item not founded , say thanks to mazen : )')
                end

            end
            print('sorry ['..v.item..'] item not founded, say thanks to mazen : ) ')
        end
    end
end)