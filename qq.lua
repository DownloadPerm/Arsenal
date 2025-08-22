local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()


game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Silent Aim",
    Text = "Script successfully loaded!",
    Duration = 3
})

-- Silent Aim
function enableSilentAim()
    coroutine.resume(coroutine.create(function()
        while wait(1) do
            coroutine.resume(coroutine.create(function()
                for _, v in pairs(Players:GetPlayers()) do
                    if v.Name ~= LocalPlayer.Name and v.Character then
                        if v.Character:FindFirstChild("RightUpperLeg") then
                            v.Character.RightUpperLeg.CanCollide = false
                            v.Character.RightUpperLeg.Transparency = 10
                            v.Character.RightUpperLeg.Size = Vector3.new(13, 13, 13)
                        end
                        
                        if v.Character:FindFirstChild("LeftUpperLeg") then
                            v.Character.LeftUpperLeg.CanCollide = false
                            v.Character.LeftUpperLeg.Transparency = 10
                            v.Character.LeftUpperLeg.Size = Vector3.new(13, 13, 13)
                        end
                        
                        if v.Character:FindFirstChild("HeadHB") then
                            v.Character.HeadHB.CanCollide = false
                            v.Character.HeadHB.Transparency = 10
                            v.Character.HeadHB.Size = Vector3.new(13, 13, 13)
                        end
                        
                        if v.Character:FindFirstChild("HumanoidRootPart") then
                            v.Character.HumanoidRootPart.CanCollide = false
                            v.Character.HumanoidRootPart.Transparency = 10
                            v.Character.HumanoidRootPart.Size = Vector3.new(13, 13, 13)
                        end
                    end
                end
            end))
        end
    end))
end

enableSilentAim()
