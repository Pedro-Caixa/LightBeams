local EmitterModule = require(game.ReplicatedStorage.Shared.Utils.UI_EmitterModule)

for _,p in pairs(game.Players.LocalPlayer.PlayerGui:GetDescendants()) do
	if p:IsA("ParticleEmitter") then
		EmitterModule:AddEmitter(p, 1)
	end
end

game.Players.LocalPlayer.PlayerGui.DescendantAdded:Connect(function(Child)
	if Child:IsA("ParticleEmitter") then
		EmitterModule:AddEmitter(Child, 1)
	end
end)


game.Players.LocalPlayer.PlayerGui.DescendantRemoving:Connect(function(Child)
	if Child:IsA("ParticleEmitter") then
		EmitterModule:RemoveEmitter(Child)
	end
end)