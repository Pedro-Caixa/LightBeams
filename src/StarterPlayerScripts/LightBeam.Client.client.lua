local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

function InputB(Ip,GP)
	if Ip.KeyCode == Enum.UserInputType.MouseButton1 then
        print("Clicked he")
	end
end

function InputE(Ip)
    if Ip.KeyCode == Enum.UserInputType.MouseButton1 then
        print("End click... ")
    end
end

UserInputService.InputBegan:Connect(InputB)
UserInputService.InputEnded:Connect(InputE)