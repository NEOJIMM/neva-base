Core = nil
CoreName = nil
CoreReady = false
Citizen.CreateThread(function()
    for k, v in pairs(Cores) do
        if GetResourceState(v.ResourceName) == "starting" or GetResourceState(v.ResourceName) == "started" then
            CoreName = v.ConstantName
            Core = v.GetFramework()
            CoreReady = true
            PlayerData = GetPlayerData()
        end
    end
end)

Config.ServerCallbacks = {}
function TriggerCallback(name, cb, ...)
    Config.ServerCallbacks[name] = cb
    TriggerServerEvent('clothing:server:triggerCallback', name, ...)
end

RegisterNetEvent('clothing:client:triggerCallback', function(name, ...)
    if Config.ServerCallbacks[name] then
        Config.ServerCallbacks[name](...)
        Config.ServerCallbacks[name] = nil
    end
end)

function Notify(text, type, length)
    length = length or 5000
    if CoreName == "qb" then
        Core.Functions.Notify(text, type, length)
    elseif CoreName == "esx" then
        Core.ShowNotification(text)
    end
end

function GetPlayerData()
    if CoreName == "qb" then
        local player = Core.Functions.GetPlayerData()
        return player
    elseif CoreName == "esx" then
        local player = Core.GetPlayerData()
        return player
    end
end

Citizen.CreateThread(function()
    for k, _ in pairs (Config.Stores) do
        if Config.Stores[k].shopType == "clothing" then
            local clothingShop = AddBlipForCoord(Config.Stores[k].coords)
            SetBlipSprite(clothingShop, 73)
            SetBlipColour(clothingShop, 47)
            SetBlipScale (clothingShop, 0.5)
            SetBlipAsShortRange(clothingShop, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(Lang:t("store.clothing"))
            EndTextCommandSetBlipName(clothingShop)
        end
        if Config.Stores[k].shopType == "barber" then
            local barberShop = AddBlipForCoord(Config.Stores[k].coords)
            SetBlipSprite(barberShop, 71)
            SetBlipColour(barberShop, 0)
            SetBlipScale (barberShop, 0.5)
            SetBlipAsShortRange(barberShop, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(Lang:t("store.barber"))
            EndTextCommandSetBlipName(barberShop)
        end
        if Config.Stores[k].shopType == "tattoo" then
            local tatooShop = AddBlipForCoord(Config.Stores[k].coords)
            SetBlipSprite(tatooShop, 75)
            SetBlipColour(tatooShop, 4)
            SetBlipScale (tatooShop, 0.5)
            SetBlipAsShortRange(tatooShop, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(Lang:t("store.tattoo"))
            EndTextCommandSetBlipName(tatooShop)
        end
        if Config.Stores[k].shopType == "surgeon" then
            local surgeonShop = AddBlipForCoord(Config.Stores[k].coords)
            SetBlipSprite(surgeonShop, 71)
            SetBlipColour(surgeonShop, 0)
            SetBlipScale  (surgeonShop, 0.5)
            SetBlipAsShortRange(surgeonShop, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(Lang:t("store.surgeon"))
            EndTextCommandSetBlipName(surgeonShop)
        end
    end
end)