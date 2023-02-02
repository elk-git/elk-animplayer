


CreateThread(function()
    RegisterCommand(
        "animplayer",
        function()
            SendNUIMessage({
                action = "show"
            
            })
            SetNuiFocus(
                true,
                true
            )
        end,
        false
    )
    RegisterNUICallback('close', function()
        SetNuiFocus(
            false,
            false
        )
    end)
    RegisterNUICallback('playAnim', function(data)
        spelaAnim(data.dict, data.name, data.flag)
    end)


    function spelaAnim(animDict, animName, animFlag)
        ClearPedTasks(PlayerPedId())
        RequestAnimDict(animDict)
        TaskPlayAnim(PlayerPedId(), animDict, animName, 5.0, 1.5, -1, tonumber(animFlag), 0.0, 0, 0, 0)
        -- Citizen.InvokeNative(0x5AB552C6, PlayerPedId(), animDict, animName, 8.0, 8.0, 20000, 0, 1, false, false, false)
    end
end)
