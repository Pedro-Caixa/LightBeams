local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Knit = require(ReplicatedStorage.Packages.knit)

local Components = {}

Knit.Start({ ServicePromises = false })
    :andThen(function()
        print(string.format("✅ | Client loaded"))
    end)
    :catch(warn)
    :await()