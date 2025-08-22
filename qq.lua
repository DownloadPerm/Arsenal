local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Silent Aim",
    Text = "Script successfully loaded!",
    Duration = 3
})

-- Discord
local discordInvite = "https://discord.gg/n99CyYESPZ"

wait(3) 

local http_request = (syn and syn.request) or (http and http.request) or request
if http_request then
    http_request({
        Url = "http://127.0.0.1:6463/rpc?v=1",
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json",
            ["Origin"] = "https://discord.com"
        },
        Body = game:GetService("HttpService"):JSONEncode({
            cmd = "INVITE_BROWSER",
            args = {code = string.match(discordInvite, "discord%.gg/(%w+)")},
            nonce = game:GetService("HttpService"):GenerateGUID(false)
        })
    })
else
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Executor Not Supported",
        Text = "Join manually: "..discordInvite,
        Duration = 5
    })
end

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
