-- ##################### VARIABLES ####################

local display = false

function Draw3DText(x,y,z,textInput,fontId,scaleX,scaleY)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)    
    local scale = (1/dist)*20
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov   
    SetTextScale(scaleX*scale, scaleY*scale)
    SetTextFont(fontId)
    SetTextProportional(1)
    SetTextColour(250, 250, 250, 255)        -- You can change the text color here
    SetTextDropshadow(1, 1, 1, 1, 255)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(textInput)
    SetDrawOrigin(x,y,z+2, 0)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()
end

-- ##################### FUNCIONES ####################

function SetDisplay(bool, key, text)
    display = bool
    SendNUIMessage({
        type = "ui",
        status = bool, 
        key = key,
        text = text
    })
end

-- ##################### CALLBACKS ####################

RegisterNUICallback("exit", function(data)
    SetDisplay(false)
end)


-- ##################### COMANDOS ####################


RegisterNetEvent("bit-interact:Start")
AddEventHandler("bit-interact:Start", function(key, text)
    if not display then
        SetDisplay(true, key, text)
        Citizen.Wait(2000)
        SetDisplay(false)
    end
end)

--[[RegisterNetEvent("bit-interact:Stop")
AddEventHandler("bit-interact:Stop", function(key, text)
    if display then
        print ("cerrar")
        
    end
end)]]