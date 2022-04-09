local MarkerPos = { X = -260.0196, Y = -2038.8641, Z = 29.9460}
local playerPed = GetPlayerPed(-1)
local isatmarker = false



Citizen.CreateThread(function()
    while true do
        DrawMarker(27, MarkerPos.X, MarkerPos.Y, MarkerPos.Z - 1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 2.0, 2.0, 2.0, 255, 0, 0, 255, false, false, 2, true, nil, nil, false)
        Citizen.Wait(1)
    end
end)

Citizen.CreateThread(function()
    while true do
        DrawMarker(43, 57.9989 + 10, 3714.8745 - 20, 39.7549 - 10, 0.0, 0.0, 0.0, 0.0, 0.0, 100.0, 150.0, 145.0, 100.0, 255, 0, 0, 50, false, false, 2, false, nil, nil, false)
        Citizen.Wait(1)
    end
end)











Citizen.CreateThread(function()
    while true do 
      local playerCoords = GetEntityCoords(playerPed)
      local MarkerCoords = { x = -260.0196, y = -2038.8641, z = 29.9460}
      local distance = GetDistanceBetweenCoords(MarkerCoords.x, MarkerCoords.y, MarkerCoords.z, playerCoords)
      isatmarker = false

        if distance < 2.0 then
         isatmarker = true
        elseif distance > 2.0 then
            isatmarker = false
        end

     Citizen.Wait(1)
    end
end)



Citizen.CreateThread(function()
    while true do
        if isatmarker then
           showInfobar("Drücke ~INPUT_PICKUP~ um die FFA Zone zu betreten!")
        end
        
        if IsControlJustReleased(0, 38) then
            SetEntityCoords(playerPed, 57.9989, 3714.8745, 39.7549, 0.0, 0.0, 0.0, false)
            giveweapon("weapon_assaultrifle")
            giveweapon("weapon_gusenberg")
            giveweapon("weapon_heavysniper")
        

        end


        Citizen.Wait(1)
    end
end)

function giveweapon(hash)
    GiveWeaponToPed(playerPed, hash, 999, false, true)
end




RegisterCommand("quitffa", function()
    SetEntityCoords(playerPed, -255.1169, -2044.7456, 29.9446, 0.0, 0.0, 0.0, false)
    clearweapon("weapon_assaultrifle")
    clearweapon("weapon_gusenberg")
    clearweapon("weapon_heavysniper")
end)

function clearweapon(hash)
    RemoveWeaponFromPed(playerPed, hash)
end


function showInfobar(msg)

    CurrentActionMsg  = msg
    SetTextComponentFormat('STRING')
    AddTextComponentString(CurrentActionMsg)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
   
end


RegisterCommand("pistol", function()
    GiveWeaponToPed(playerPed, "weapon_pistol", 999, false, true)
end)