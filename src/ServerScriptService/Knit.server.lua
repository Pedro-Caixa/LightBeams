local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")

local Knit = require(ReplicatedStorage.Packages.knit)

Knit.AddServices(ServerStorage.Storage.Services)

local Components = {}

Knit.Start({ ServicePromises = false })
    :andThen(function()
        print(string.format("✅ | Server loaded"))
        for _, component in ReplicatedStorage.Shared.Components:GetDescendants() do
            if not component:IsA("ModuleScript") then
                continue
            end

            Components[component.Name] = require(component)
        end

        Knit.Components = Components
    end)
    :catch(warn)
    :await()