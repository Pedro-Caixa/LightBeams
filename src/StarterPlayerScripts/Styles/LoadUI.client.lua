local StarterGui = game:GetService("StarterGui")
local Players = game:GetService("Players")
local StarterPlayer = game:GetService("StarterPlayer")
local StarterPlayerScripts = StarterPlayer:WaitForChild("StarterPlayerScripts")

local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")

local UIComponents = StarterPlayerScripts.Client.Styles:WaitForChild("Components")

local components = {}

local function loadComponents()
	for _, component in ipairs(UIComponents:GetChildren()) do
		components[component.Name] = require(component)
	end
end

loadComponents()