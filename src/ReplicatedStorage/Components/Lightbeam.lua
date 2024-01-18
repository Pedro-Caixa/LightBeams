local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

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
    self.CurrentPosition = nil

    self.Arms = self.Instance.Arm
    self.Head = self.Instance.Head
    self.Gobo = self.Head.Gobo

end

function LightBeam:Start()
    print('[FOUND] New Lightbeam found: '..self.Instance.Name)


end


return LightBeam
