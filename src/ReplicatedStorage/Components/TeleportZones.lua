local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Knit = require(ReplicatedStorage.Packages.knit)
local Component = require(ReplicatedStorage.Packages.component)
local EffectService = Knit.GetService("EffectService")

local LoadingEvent = ReplicatedStorage.Events.LoadingScreenActivate

local Teleporter = Component.new({
    Tag = "Teleporter",
	Ancestors = {workspace},
})

function Teleporter:Construct()
    self.TeleporterID = self.Instance:GetAttribute("TeleporterID")
    self.Prompt = self.Instance.ProximityPrompt
    self.Name = self.Instance.Name
end

function Teleporter:Teleport(player)
    local destinationTeleporter = nil
    for _, tele in pairs(workspace.Teleporters:GetChildren()) do
        if tele:IsA("Part") and tele:GetAttribute("TeleporterID") then
            if tele:GetAttribute("TeleporterID") == self.TeleporterID and tele.Name ~= self.Name then
                destinationTeleporter = tele
                player.PlayerGui.Main.cLoadingScreens.LoadingFrame.Visible = true
                break
            end
        end
    end
    if destinationTeleporter then
        local destinationPosition = destinationTeleporter.CFrame.Position
        player.Character:SetPrimaryPartCFrame(CFrame.new(destinationPosition + Vector3.new(0, -1, 0)))
        wait(1)
        player.PlayerGui.Main.cLoadingScreens.LoadingFrame.Visible = false
    else
        warn("Destination teleporter not found.")
    end
end

function Teleporter:Start()

    self.Prompt.Triggered:Connect(function(player)
        self:Teleport(player)
    end)
end

return Teleporter