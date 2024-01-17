local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")
local TweenService = game:GetService("TweenService")

local Knit = require(ReplicatedStorage.Packages.knit)
local Component = require(ReplicatedStorage.Packages.component)

local EffectService = Knit.GetService("EffectService")

local LightBeam = Component.new({
    Tag = "Lightbeam",
	Ancestors = {workspace},
})

function LightBeam:Construct()
    self.Group = self.Instance:GetAttribute("Group") or 1
    self.Color = Color3.new(0.105882, 0.105882, 0.105882)

    self.Head = self.Instance.Head
end

function LightBeam:Start()
    print(self.Head)
end

return LightBeam
