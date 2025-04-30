local QBCore = exports['qb-core']:GetCoreObject()

-- License kontrol fonksiyonu
local function CheckLicense(source)
    local license = QBCore.Functions.GetIdentifier(source, 'license')
    return license == Config.AllowedLicense
end

-- Paket verme fonksiyonu
local function GivePackage(source, packageId, targetId)
    local src = source
    local target = QBCore.Functions.GetPlayer(targetId)

    if not target then
        TriggerClientEvent('QBCore:Notify', src, Config.Messages.invalid_player, 'error')
        return false
    end

    local package = Config.Packages[packageId]
    if not package then
        TriggerClientEvent('QBCore:Notify', src, Config.Messages.invalid_package, 'error')
        return false
    end

    for _, content in ipairs(package) do
        if content.type == 'item' then
            exports.ox_inventory:AddItem(targetId, content.name, content.amount)
        elseif content.type == 'weapon' then
            exports.ox_inventory:AddItem(targetId, content.name, 1, { ammo = content.ammo })
        elseif content.type == 'money' then
            target.Functions.AddMoney(content.moneyType, content.amount, "Admin Paketi")
        end
    end

    -- Bildirimler
    TriggerClientEvent('QBCore:Notify', src, Config.Messages.success_admin..packageId, 'success')
    TriggerClientEvent('QBCore:Notify', targetId, Config.Messages.success_target, 'success')
    return true
end

-- Komut işleyici
RegisterCommand('givepackage', function(source, args)
    local src = source

    -- Yetki kontrolü
    if not CheckLicense(src) then
        TriggerClientEvent('QBCore:Notify', src, Config.Messages.no_permission, 'error')
        return
    end

    -- Argüman kontrolü
    if #args < 2 then
        TriggerClientEvent('QBCore:Notify', src, Config.Messages.invalid_args, 'error')
        return
    end

    local packageId = args[1]
    local targetId = tonumber(args[2])

    -- Paket verme işlemi
    GivePackage(src, packageId, targetId)
end, false)