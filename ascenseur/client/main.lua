ESX = exports["es_extended"]:getSharedObject()

local takeTp = false
CreateThread(function()
    while true do 
        local interval = 500
        local posPlayer = GetEntityCoords(PlayerPedId())
        for _,v in pairs(Config.tpSimple) do 
            local dest = v.posEntre
            local dist = #(dest-posPlayer)
            if dist <= distMarker then 
                interval = 0
                DrawMarker(27, dest.x, dest.y, dest.z-1, 0.0, 0.0, 0.0, 0, 0, 0, 0.5, 0.5, 0.5, 249, 130, 42, 55555, false, false, 2, false, false, false, false)
                if dist <= dist3D then 
                    DrawName3D(dest.x, dest.y, dest.z, v.textEntre, 255, 255, 255)
                    if IsControlJustPressed(1, 51) then 
                        SetEntityCoords(PlayerPedId(), v.posSortie)
                        takeTp = true
                    end
                end
            end
        end
        if takeTp then 
            for _,v in pairs(Config.tpSimple) do 
                local dest = v.posSortie
                local dist = #(dest-posPlayer)
                if dist <= distMarker then 
                    interval = 0
                    DrawMarker(27, dest.x, dest.y, dest.z-1, 0.0, 0.0, 0.0, 0, 0, 0, 0.5, 0.5, 0.5, 249, 130, 42, 55555, false, false, 2, false, false, false, false)
                    if dist <= dist3D then 
                        DrawName3D(dest.x, dest.y, dest.z, v.textSortir, 255, 255, 255)
                        if IsControlJustPressed(1, 51) then 
                            SetEntityCoords(PlayerPedId(), v.posEntre)
                            takeTp = false
                        end
                    end
                end
            end
        end
        for _,v in pairs(Config.tpEtage) do 
            local dest = v.pos
            local dist = #(dest-posPlayer)
            if dist <= distMarker then 
                interval = 0
                DrawMarker(27, dest.x, dest.y, dest.z-1, 0.0, 0.0, 0.0, 0, 0, 0, 0.5, 0.5, 0.5, 249, 130, 42, 55555, false, false, 2, false, false, false, false)
                if dist <= dist3D then 
                    DrawName3D(dest.x, dest.y, dest.z, v.text, 255, 255, 255)
                    if IsControlJustPressed(1, 51) then 
                        openMenuEtage()
                    end
                end
            end
        end
        Wait(interval)
    end
end)