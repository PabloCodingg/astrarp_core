---@author Pablo Z.
---@version 1.0
--[[
  This file is part of Astra RolePlay.
  
  File [main] created at [26/04/2021 19:16]

  Copyright (c) Astra RolePlay - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

local busy = false

Astra.netRegisterAndHandle("playScenario", function(scenario, ms, instant)
    if busy then return end
    busy = true
    TaskStartScenarioInPlace(PlayerPedId(), scenario, 0, instant or false)
    Astra.newWaitingThread(ms, function()
        print("Clear")
        if instant then
            ClearPedTasksImmediately(PlayerPedId())
        else
            ClearPedTasks(PlayerPedId())
        end
        busy = false
    end)
end)