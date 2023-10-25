local openTpEtage = false 
menuTpEtage = RageUI.CreateMenu("Tp etage", " ")
menuTpEtage.Closed = function()
    openTpEtage = false
end


function openMenuEtage(valeur)
    if openTpEtage then 
        openTpEtage = false 
        RageUI.Visible(menuTpEtage, false)
        return
    else 
        openTpEtage = true
        RageUI.Visible(menuTpEtage, true)
        CreateThread(function()
            while openTpEtage do 
                RageUI.IsVisible(menuTpEtage, function()
                    RageUI.Separator("↓ ~b~Ascenseur~s~ ↓")
                    RageUI.Line()
                    for _,v in pairs(Config.tpEtage) do 
                        RageUI.Button(v.label, nil, {}, true, {
                            onSelected = function()
                                SetEntityCoords(PlayerPedId(), v.pos)
                                openTpEtage = false
                                RageUI.CloseAll()
                            end
                        })
                    end
                end)
                Wait(0)
            end
        end)
    end
end