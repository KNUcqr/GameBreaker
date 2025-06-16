local remote = game.ReplicatedStorage.RemoteEvent
local Restart = game.ReplicatedStorage.Restart
local Teleport = require(game.ReplicatedStorage.Teleport)

local Room = workspace.Boss.Room2

local Start = Room.Destination

local Correct = Room.Correct
local False = Room.False

local original = {
	Room.Earth1,
	Room.Earth11,
	Room.Truss1,
	Room.Truss11,
	Room.RealisticTree1,
	Room.RealisticTree11,
	Room.Maxwell1,
	Room.happiRock1
}

local clone = {
	Room.Earth2,
	Room.Earth22,
	Room.Truss2,
	Room.Truss22,
	Room.RealisticTree2,
	Room.RealisticTree22,
	Room.Maxwell2,
	Room.happiRock2
}

local TF = true -- 두 방이 같은 지 아닌지 확인.

local Triggered = true -- 방에 들어갈 때 한 번만 작동.
local CorrectTriggered = true
local FalseTriggered = true

local BlueFloor = Room.BlueFloor

local function onStartTouched(hit)
	if Triggered then
		local character = hit.Parent
		if character and character:FindFirstChild("Humanoid") then
			Triggered = false

			local ON = math.random(1,(2^#original)-1)
			TF = math.random(0,1) == 1
			print(TF)
			
			local CN
			if TF then
				CN=ON		
			else
				CN = bit32.bxor(ON, 2 ^ math.random(0, 4))
			end
			print(CN,ON)
			for i = 1, #original do
				local OriginalisOn = ON%2==1
				local CloneisOn = CN%2==1
				ON=ON//2
				CN=CN//2

				original[i].Transparency = OriginalisOn and 0 or 1
				original[i].CanCollide = OriginalisOn

				clone[i].Transparency = CloneisOn and 0 or 1
				clone[i].CanCollide = CloneisOn
			end
			
		end	
	end	
end

local function Correcttouched(hit)
	if CorrectTriggered then
		local character = hit.Parent
		if character and character:FindFirstChild("Humanoid") then
			CorrectTriggered = false
			if TF then
				BlueFloor.Transparency = 0
				BlueFloor.CanCollide = true
			else
				local player = game.Players:GetPlayerFromCharacter(hit.Parent)
				if player then
					remote:FireClient(player,1,"Dead")
				end
			end
		end
	end
end

local function Falsetouched(hit)
	if FalseTriggered then
		local character = hit.Parent
		if character and character:FindFirstChild("Humanoid") then
			FalseTriggered = false
			Triggered = true
			if not TF then
				BlueFloor.Transparency = 0
				BlueFloor.CanCollide = true
			else
				local player = game.Players:GetPlayerFromCharacter(hit.Parent)
				if player then
					remote:FireClient(player, 1,"Dead")
				end	
			end
		end
	end
end

Restart.OnServerEvent:Connect(function() -- 리턴 이벤트가 작동하면; 아래 코드를 작동 시키겠다 
	wait(3)
	Triggered = true
	CorrectTriggered = true
	FalseTriggered = true
	BlueFloor.Transparency = 0.9
	BlueFloor.CanCollide = false
end)

Start.Touched:Connect(onStartTouched)
Correct.Touched:Connect(Correcttouched)
False.Touched:Connect(Falsetouched)