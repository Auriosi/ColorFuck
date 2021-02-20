--[[

Go away skid!

....................../´¯/) 
....................,/¯../ 
.................../..../ 
............./´¯/'...'/´¯¯`·¸ 
........../'/.../..../......./¨¯\ 
........('(...´...´.... ¯~/'...') 
.........\.................'...../ 
..........''...\.......... _.·´ 
............\..............( 
..............\.............\...

--]]

local gamemt = getrawmetatable(game)
setreadonly(gamemt, false)
local oldgamemt = gamemt.__namecall
gamemt.__namecall = newcclosure(function(self, ...)
    local method = getnamecallmethod()
    if method == "Kick" then
        warn("Tried kicking!")
        game:GetService("StarterGui"):SetCore("SendNotification", {Title = "Color Fuck", Text = "A client kick was attempted!"})
    end
    return oldgamemt(self, ...)
end)
setreadonly(gamemt, true)

local UILib = loadstring(game:HttpGet("https://pastebin.com/raw/npYdYVkB", true))()
local Main = UILib:CreateSection("Main")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = game:GetService("Players").LocalPlayer

Main:Slider("Walk Speed", {min = 0, max = 250, precise = false}, function(value)
    if not LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.CharacterAdded:Wait()
    end
    LocalPlayer.Character.Humanoid.WalkSpeed = value
    game:GetService("StarterGui"):SetCore("SendNotification", {Title = "Color Fuck", Text = "WalkSpeed has been set to "..tostring(value).."!"})
end)
Main:Slider("Jump Power", {min = 0, max = 350, precise = false}, function(value)
    if not LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.CharacterAdded:Wait() 
    end
    LocalPlayer.Character.Humanoid.JumpPower = value
    game:GetService("StarterGui"):SetCore("SendNotification", {Title = "Color Fuck", Text = "JumpPower has been set to "..tostring(value).."!"})
end)
Main:Button("Teleport to Spawn", function()
    if not LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        LocalPlayer.CharacterAdded:Wait()
    end
    print(LocalPlayer.Character.HumanoidRootPart.Position)
    LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(-93, 1588, -149))
    game:GetService("StarterGui"):SetCore("SendNotification", {Title = "Color Fuck", Text = "Teleported to spawn!"})
end)
UserInputService.JumpRequest:Connect(function()
    if InfiniteJump then
        if not LocalPlayer.Character:FindFirstChild("Humanoid") then return end
        LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)
Main:Toggle("Infinite Jump", function(value)
    if value then
        InfiniteJump = true
    else
        InfiniteJump = false
    end
end)

UILib:Ready()
print("Color Fuck loaded!")
game:GetService("StarterGui"):SetCore("SendNotification", {Title = "Color Fuck", Text = "Color Fuck is loaded!"})
