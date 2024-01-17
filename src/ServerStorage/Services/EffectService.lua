local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Knit = require(ReplicatedStorage.Packages.knit)

local EffectService = Knit.CreateService {
    Name = "EffectService",
    Client = {},
}

function EffectService.Client:CreateNewSound(Data)
    return self.Server:CreateNewSound(Data)
end


function EffectService:CreateNewSound(Data)
    local Sound = Instance.new("Sound")
    Sound.Name = Data.Name or "GenericSound"
    Sound.SoundId = "rbxassetid://"..Data.SoundId
    Sound.RollOffMinDistance = 4.7
    Sound.RollOffMaxDistance = Data.MaxDistance or 100
    Sound.Volume = Data.Volume or 1
    Sound.Looped = Data.Looped or false

    Sound.Parent = Data.Parent
    Sound:Play()
    game.Debris:AddItem(Sound, Data.Time or 5)
end



function EffectService:KnitStart()
    print("EffectService Started")
end

function EffectService:KnitInit()
    print("EffectService Initialized")
end


return EffectService