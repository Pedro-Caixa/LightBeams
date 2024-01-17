local ReplicatedStorage = game:GetService("ReplicatedStorage")

local FireworkFireRemote = ReplicatedStorage.Events:WaitForChild('Fire')

local Debris = game:GetService("Debris")

local FireworksModule = {}

function FireworksModule:CreateFireworkParams(fireworks)
	--/Variables
	local Start, Finish = fireworks:WaitForChild("Start"), fireworks:WaitForChild("Finish")
	
	Start.Transparency = 1
	Finish.Transparency = 1
	
	local Firework = fireworks.Parent:WaitForChild("Firework")
	
	local Parent1 = fireworks.Parent
	local DebrisFolder = Parent1:WaitForChild("FireworkDebris")


	local Lighting = game:GetService("Lighting")

	---/Attributes

	local FireworkLength = 	workspace.Fireworks.Configuration:WaitForChild("FireworkLength").Value
	local ExplosionDetail = workspace.Fireworks.Configuration:WaitForChild("ExplosionDetail").Value
	
	local TrailOffsetYMin = workspace.Fireworks.Configuration:WaitForChild("TrailOffsetYMin").Value
	local TrailOffsetYMax = workspace.Fireworks.Configuration:WaitForChild("TrailOffsetYMax").Value
	
	local TrailOffsetXZMin = workspace.Fireworks.Configuration:WaitForChild("TrailOffsetXZMin").Value
	local TrailOffsetXZMax = workspace.Fireworks.Configuration:WaitForChild("TrailOffsetXZMax").Value
	
	--/Colorization
	local Color1 = Color3.fromRGB(math.random(0,255),math.random(0,255),math.random(0,255))
	local Color2 = Color3.fromRGB(math.random(0,255),math.random(0,255),math.random(0,255))

	local ColorPoints = {
		ColorSequenceKeypoint.new(0, Color1),
		ColorSequenceKeypoint.new(1, Color2)
	}
	
	
	local Middle = Instance.new("Part")
	Middle.Anchored = true
	Middle.Transparency = 1
	Middle.Parent = DebrisFolder

	

	local FireworkClone = Firework:Clone()
	FireworkClone.Anchored = true
	FireworkClone.Parent = DebrisFolder

	local Trail = FireworkClone:WaitForChild("Trail")
	Trail.Color = ColorSequence.new(ColorPoints)
	FireworkClone:WaitForChild("Attachment"):WaitForChild("Shine").Enabled = true
	FireworkClone:WaitForChild("Attachment"):WaitForChild("Shine").Color = ColorSequence.new(ColorPoints)
	local Dst = math.abs((Finish.Position - Start.Position).Magnitude)
	Middle.CFrame = CFrame.new(Start.Position, Finish.Position) * CFrame.new(0, 0, -Dst/2) 
	Middle.Position = Middle.Position + Vector3.new(math.random(TrailOffsetXZMin, TrailOffsetXZMax),math.random(TrailOffsetYMin, TrailOffsetYMax),math.random(TrailOffsetXZMin, TrailOffsetXZMax))
	
	--/ Let client do the rest to save space on server
	FireworkFireRemote:FireAllClients(Start, Middle, Finish, FireworkLength, FireworkClone, ColorPoints, ExplosionDetail)
end

return FireworksModule
