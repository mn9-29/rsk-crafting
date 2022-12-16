local QRCore = exports['qr-core']:GetCoreObject()
local npcs = {}

Citizen.CreateThread(function()
    for k, v in pairs(Config.Locations["craftweapon"]) do
        exports['qr-core']:createPrompt("craftweapon", vector3(v.x, v.y, v.z), Config.PromptKey, 'Craft Weapon', {
            type = 'client',
            event = 'rsk-crafting:craftweapon',
            args = {},
        })
        local Blip = N_0x554d9d53f696d002(1664425300, v.x, v.y, v.z)
        SetBlipSprite(Blip, -758970771, 52)
        SetBlipScale(Blip, 0.1)
        Citizen.InvokeNative(0x9CB1A1623062F402, tonumber(Blip), "Craft Weapon")
    end   
    for k, v in pairs(Config.Locations["craftitems"]) do
        exports['qr-core']:createPrompt("craftitems", vector3(v.x, v.y, v.z), Config.PromptKey, 'Craft Items', {
            type = 'client',
            event = 'rsk-crafting:craftitems',
            args = {},
        })
        local Blip = N_0x554d9d53f696d002(1664425300, v.x, v.y, v.z)
        SetBlipSprite(Blip, -758970771, 52)
        SetBlipScale(Blip, 0.1)
        Citizen.InvokeNative(0x9CB1A1623062F402, tonumber(Blip), "Craft Items")
    end   
    for k, v in pairs(Config.Locations["craftammo"]) do
        exports['qr-core']:createPrompt("craftammo", vector3(v.x, v.y, v.z), Config.PromptKey, 'Craft Ammo', {
            type = 'client',
            event = 'rsk-crafting:craftammo',
            args = {},
        })
        local Blip = N_0x554d9d53f696d002(1664425300, v.x, v.y, v.z)
        SetBlipSprite(Blip, -758970771, 52)
        SetBlipScale(Blip, 0.1)
        Citizen.InvokeNative(0x9CB1A1623062F402, tonumber(Blip), "Craft Ammo")
    end   
    
    for k, v in pairs(Config.ModelSpawns) do
        while not HasModelLoaded(v.model) do
            RequestModel(v.model)
            Wait(10)
        end
        local ped = CreatePed(v.model, v.coords.x, v.coords.y, v.coords.z - 1.0, v.heading, true, true, 0, 0)
        while not DoesEntityExist(ped) do
            Wait(10)
        end
        Citizen.InvokeNative(0x283978A15512B2FE, ped, true)
        SetEntityCanBeDamaged(ped, false)
        SetEntityInvincible(ped, true)
        FreezeEntityPosition(ped, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        Wait(100)
        SetModelAsNoLongerNeeded(v.model)
        table.insert(npcs, ped)
    end 
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        for k, v in pairs(Config.Locations["craftweapon"]) do
            Citizen.InvokeNative(0x2A32FAA57B937173, 0x94FDAE17, v.x, v.y, v.z-1, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.1, 255, 255, 255, 100, 0, true, 2, 0, 0, 0, 0)
        end   
        for k, v in pairs(Config.Locations["craftitems"]) do
            Citizen.InvokeNative(0x2A32FAA57B937173, 0x94FDAE17, v.x, v.y, v.z-1, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.1, 255, 255, 255, 100, 0, true, 2, 0, 0, 0, 0)
        end   
        for k, v in pairs(Config.Locations["craftammo"]) do
            Citizen.InvokeNative(0x2A32FAA57B937173, 0x94FDAE17, v.x, v.y, v.z-1, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.1, 255, 255, 255, 100, 0, true, 2, 0, 0, 0, 0)
        end  
    end 
end)

-- ACTIONS
RegisterNUICallback('action', function(data, cb)
	if data.action == 'close' then
		SetNuiFocus(false, false)
		hasEntered = true
		EndCam()
		inMenu = false
		waitMore = false
    elseif data.action == 'closeui' then
		SetNuiFocus(false, false)
		hasEntered = true
		EndCam()
		inMenu = false
		waitMore = false
	elseif data.action == 'option' then
		SetNuiFocus(false, false)
		hasEntered = true
		inMenu = false
		waitMore = false
        if data.options[4] ~= nil then eventargs = data.options[4] else eventargs = {} end
		if data.options[3] == 'c' then
			TriggerEvent(data.options[2], eventargs)
		elseif data.options[3] == 's' then
			TriggerServerEvent(data.options[2], eventargs)
		elseif data.options[3] ~= nil then
			TriggerServerEvent(data.options[2], eventargs)
		end
	elseif data.action == 'crafting' then
        TriggerServerEvent("rsk-crafting:server:craftitem", tonumber(data.item), data.typx)
    end
end)

-- CAMERA
function StartCamW(coords, offset, rotation, model, name, head)
	ClearFocus()

    coords = coords + offset

	cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", coords, rotation, GetGameplayCamFov())

	SetCamActive(cam, true)
	RenderScriptCams(true, true, Config.CameraAnimationTime, true, false)
end

function EndCam()
    DoScreenFadeOut(300)
    Wait(500)
	ClearFocus()
	RenderScriptCams(false, true, 10, true, false)
	DestroyCam(cam, false)
	cam = nil
    Wait(30)
    DoScreenFadeIn(300)
end

RegisterNetEvent("rsk-crafting:craftweapon")
AddEventHandler("rsk-crafting:craftweapon", function()
    local options = {
        {"Craft Weapons", 'rsk-crafting:weapon', 'c'},
    }
    local cam = vector3(2928.88, 545.68, 46.41)
    inMenu = true
    waitMore = true
    StartCamW(cam, vector3(0.0, 0.0, 0.0), vector3(0.0, 0.0, 46.41), "", "", 78.787)
    Citizen.Wait(500)
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = 'openDialog',
        cardheight = '65px',
        header = "",
        name = "",
        dialog = "Craft Weapon",
        options = options,
    })
end)

RegisterNetEvent("rsk-crafting:weapon")
AddEventHandler("rsk-crafting:weapon", function()
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = 'openCrafting',
        cardheight = '65px',
        header = "",
        name = "",
        dialog = "",
        options = "",
        items = Config.Weapons,
        typx = "weapons",
        imagesize1 = Config.imagesize1,
        imagesize2 = Config.imagesize2,
        color1 = Config.color1,
        color2 = Config.color2,
        craftpoint = QRCore.Functions.GetPlayerData().metadata['craftingrep'],
        shared = QRCore.Shared.Items,
        expert = QRCore.Functions.GetPlayerData().metadata["award10"] and QRCore.Functions.GetPlayerData().metadata["specializations"] == 'expert' ,
    })
end)

-------------------------------------------------------------

RegisterNetEvent("rsk-crafting:craftitems")
AddEventHandler("rsk-crafting:craftitems", function()
    local options = {
        {"Craft items", 'rsk-crafting:items', 'c'},
    }
    local cam = vector3(-3675.52, -2590.61, -13.36)
    inMenu = true
    waitMore = true
    StartCamW(cam, vector3(0.0, 0.0, 0.0), vector3(0.0, 0.0, -13.36), "", "", 172.576)
    Citizen.Wait(500)
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = 'openDialog',
        cardheight = '65px',
        header = "",
        name = "",
        dialog = "Craft Items",
        options = options,
    })
end)


RegisterNetEvent("rsk-crafting:items")
AddEventHandler("rsk-crafting:items", function()
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = 'openCrafting',
        cardheight = '65px',
        header = "",
        name = "",
        dialog = "",
        options = "",
        items = Config.Items,
        typx = "items",
        imagesize1 = Config.imagesize1,
        imagesize2 = Config.imagesize2,
        color1 = Config.color1,
        color2 = Config.color2,
        craftpoint = QRCore.Functions.GetPlayerData().metadata['craftingrep'],
        shared = QRCore.Shared.Items,
        expert = QRCore.Functions.GetPlayerData().metadata["award10"] and QRCore.Functions.GetPlayerData().metadata["specializations"] == 'expert' ,
    })
end)

-------------------------------------------------------------------------
RegisterNetEvent("rsk-crafting:craftammo")
AddEventHandler("rsk-crafting:craftammo", function()
    local options = {
        {"Craft Ammo", 'rsk-crafting:ammo', 'c'},
    }
    local cam = vector3(2934.65, 526.32, 45.82)
    inMenu = true
    waitMore = true
    StartCamW(cam, vector3(0.0, 0.0, 0.0), vector3(0.0, 0.0, 45.82), "", "", 261.088)
    Citizen.Wait(500)
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = 'openDialog',
        cardheight = '65px',
        header = "",
        name = "",
        dialog = "Craft Ammo",
        options = options,
    })
end)

RegisterNetEvent("rsk-crafting:ammo")
AddEventHandler("rsk-crafting:ammo", function()
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = 'openCrafting',
        cardheight = '65px',
        header = "",
        name = "",
        dialog = "",
        options = "",
        items = Config.ammo,
        typx = "ammo",
        imagesize1 = Config.imagesize1,
        imagesize2 = Config.imagesize2,
        color1 = Config.color1,
        color2 = Config.color2,
        craftpoint = QRCore.Functions.GetPlayerData().metadata['craftingrep'],
        shared = QRCore.Shared.Items,
        expert = QRCore.Functions.GetPlayerData().metadata["award10"] and QRCore.Functions.GetPlayerData().metadata["specializations"] == 'expert' ,
    })
end)
