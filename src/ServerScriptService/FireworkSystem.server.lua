local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerScriptService = game:GetService("ServerScriptService")

script.Parent.Name = "FireworkScripts"
local NightToggle = script:GetAttribute("NightToggle")
local MinWait = script:GetAttribute("MinWait")
local MaxWait = script:GetAttribute("MaxWait")
local FireworkModule = require(ReplicatedStorage.Shared.Utils.Fireworks)
local NightTime = false
for _, fireworks in pairs(workspace:WaitForChild("Fireworks", math.huge):GetChildren()) do
	if fireworks.Name == "FireworkLauncher" then
		spawn(function()
			if NightToggle == true then
				while wait(math.random(MinWait, MaxWait))do
					
					if NightTime == false then
						
					else
						FireworkModule:CreateFireworkParams(fireworks)
					end
				end
			else
				while wait(math.random(MinWait, MaxWait))do
					FireworkModule:CreateFireworkParams(fireworks)
				end
			end
		end)
		
		for _, parts in pairs(fireworks:GetChildren())do
			if parts.Name == "Start" or parts.Name == "Finish" then
				parts.Transparency = 1
			end
		end
	end
end
game.Players.PlayerAdded:Connect(function(plr)
	if game.Lighting.ClockTime >= 23 or game.Lighting.ClockTime <= 3 then
		NightTime = true
	else
		NightTime = false

	end
end)
game.Lighting:GetPropertyChangedSignal("ClockTime"):Connect(function()
	if game.Lighting.ClockTime >= 23 or game.Lighting.ClockTime <= 3 then
		NightTime = true
	else
		NightTime = false
	end
end)

game.Lighting:GetPropertyChangedSignal("ClockTime"):Connect(function()
	if game.Lighting.ClockTime >= 23 or game.Lighting.ClockTime <= 3 then
		NightTime = true
	else
		NightTime = false
	end
end)