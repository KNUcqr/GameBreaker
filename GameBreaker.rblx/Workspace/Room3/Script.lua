local remote = game.ReplicatedStorage.RemoteEvent
local Restart = game.ReplicatedStorage.Restart
local Teleport = require(game.ReplicatedStorage.Teleport)

local Room = workspace.Room3

local Start = Room.Destination

local Walls = {
	Room.FrontWall.SurfaceGui,
	Room.LeftWall.SurfaceGui,
	Room.RightWall.SurfaceGui,
	Room.BackWall.SurfaceGui
}

local ExitButton = Room.ExitButton

local Triggered = true
local ExitTriggered = false

-- 벽에 있는 버튼 개수 세기
local function countAllButtons()
	local count = 0
	for _, gui in ipairs(Walls) do
		for _, child in ipairs(gui:GetChildren()) do
			if child:IsA("ImageButton") then
				count = count + 1
			end
		end
	end
	return count
end

local function OnExitTouched(hit)
	if ExitTriggered then
		ExitTriggered = false
		Triggered = true
		Teleport.Teleport(hit)
	end
end

local function updateExitButton()
	if countAllButtons() == 0 then
		ExitButton.Transparency = 0
		ExitButton.CanCollide = true
		ExitTriggered = true
	end
end

local function onStartTouched(hit)
	if Triggered then
		local character = hit.Parent
		if character and character:FindFirstChild("Humanoid") then
			Triggered = false
			ExitButton.Transparency = 1
			ExitButton.CanCollide = false

			local player = game.Players:GetPlayerFromCharacter(hit.Parent)
			if player then
				remote:FireClient(player, 1500, "지워라")
			end
			
			for i = 1, 20 do
				local gui = Walls[math.random(1, #Walls)]
				local button = Instance.new("ImageButton")
				button.Size = UDim2.new(0, 200, 0, 200)
				button.Position = UDim2.new(math.random(1, 9) / 10, 0, math.random(1, 9) / 10, 0)
				button.AnchorPoint = Vector2.new(0.5, 0.5)
				button.Image = "rbxassetid://78435411178976"
				button.Parent = gui

				button.MouseButton1Click:Connect(function()
					button:Destroy()
					updateExitButton()
				end)
			end
			updateExitButton()
		end
	end
end

Restart.OnServerEvent:Connect(function() -- 리턴 이벤트가 작동하면; 아래 코드를 작동 시키겠다 
	wait(3)
	Triggered = true
	for i = 1, 4 do
		for _, child in ipairs(Walls[i]:GetChildren()) do
			child:Destroy()
		end
	end
end)


Start.Touched:Connect(onStartTouched)
ExitButton.Touched:Connect(OnExitTouched)