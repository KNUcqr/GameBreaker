local remote = game.ReplicatedStorage.RemoteEvent -- 리모트 이벤트를 변수에 저장
local Restart = game.ReplicatedStorage.Restart
local Teleport = require(game.ReplicatedStorage.Teleport)

local onlyUpFolder = workspace.Boss.OnlyUP
local endactivated = false
local finishPart = onlyUpFolder.ClearZone

local function onFinishTouched(hit) -- 플레이어가 시작 파트에 닿았을 때if not activated then
	if not endactivated then
		endactivated = true
		local character=hit.Parent
		local root = character:FindFirstChild("HumanoidRootPart")
		root.CFrame = workspace.Folder.SpawnLocation.CFrame + Vector3.new(0, 3, 0)
		wait(1)
		endactivated = false
	end
end

Restart.OnServerEvent:Connect(function() -- 리턴 이벤트가 작동하면; 아래 코드를 작동 시키겠다 
	wait(3)
	endactivated = false	
end)

finishPart.Touched:Connect(onFinishTouched)