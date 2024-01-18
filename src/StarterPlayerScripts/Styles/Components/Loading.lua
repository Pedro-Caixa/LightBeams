local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local Gui = game:GetService("StarterGui")

local LoadingEvent = ReplicatedStorage.Events.LoadingScreenActivate
local SoundLibrary = Gui.Sounds

local Component = require(ReplicatedStorage.Packages.component)
local Signal = require(ReplicatedStorage.Packages.goodsignal)
local Knit = require(ReplicatedStorage.Packages.knit)

local EffectService = Knit.GetService("EffectService")

local ROTATE_SPEED = 200

local Loading = Component.new({
	Tag = "LoadingFrameCircle",
	Extensions = {},
})

function Loading:RenderSteppedUpdate(dt)
	self.Instance.Loading.Rotation += ROTATE_SPEED * dt    
end

return Loading