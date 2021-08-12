QBCore = nil
TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

RegisterServerEvent('cui_character:save')
AddEventHandler('cui_character:save', function(model, data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if model ~= nil and data ~= nil then 
        exports['ghmattimysql']:execute("DELETE FROM `playerskins` WHERE `citizenid` = '"..Player.PlayerData.citizenid.."'", function()
            exports['ghmattimysql']:execute("INSERT INTO `playerskins` (`citizenid`, `model`, `skin`, `active`) VALUES ('"..Player.PlayerData.citizenid.."', '"..model.."', '"..json.encode(data).."', 1)")
        end)
    end
end)

RegisterServerEvent('cui_character:requestPlayerData')
AddEventHandler('cui_character:requestPlayerData', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    exports['ghmattimysql']:execute("SELECT `skin` FROM `playerskins` WHERE `citizenid` = '"..Player.PlayerData.citizenid.."'", function(users)
        local playerData = { skin = nil, newPlayer = true}
        if users and users[1] ~= nil and users[1].skin ~= nil then
            playerData.skin = json.decode(users[1].skin)
            playerData.newPlayer = false
        end
        TriggerClientEvent('cui_character:recievePlayerData', src, playerData)
    end)
end)

RegisterCommand("character", function(source, args, rawCommand)
    if (source > 0) then
        TriggerClientEvent('cui_character:open', source, { 'features', 'style', 'apparel' })
    end
end, true)

RegisterCommand("features", function(source, args, rawCommand)
    if (source > 0) then
        TriggerClientEvent('cui_character:open', source, { 'features' })
    end
end, true)

RegisterCommand("style", function(source, args, rawCommand)
    if (source > 0) then
        TriggerClientEvent('cui_character:open', source, { 'style' })
    end
end, true)

RegisterCommand("apparel", function(source, args, rawCommand)
    if (source > 0) then
        TriggerClientEvent('cui_character:open', source, { 'apparel' })
    end
end, true)