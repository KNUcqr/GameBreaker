local remote = game.ReplicatedStorage.RemoteEvent -- 리모트 이벤트를 변수에 저장
local Restart = game.ReplicatedStorage.Restart
local Teleport = require(game.ReplicatedStorage.Teleport)

local DrooperFolder = workspace.Boss.Dropper
local activated = false
local endactivated = false

local RedFloor = DrooperFolder.RedFloor

local startPart = DrooperFolder.Start
local finishPart = DrooperFolder.End

local function onFinishTouched(hit) -- 플레이어가 시작 파트에 닿았을 때if not activated then
	if not endactivated then
		endactivated = true
		RedFloor.Transparency = 0
		RedFloor.CanCollide = true
	end
end

local function onStartTouched(hit) -- 플레이어가 시작 파트에 닿았을 때
	if not activated then
		local character = hit.Parent
		if character and character:FindFirstChild("Humanoid") then
			activated = true
			local player = game.Players:GetPlayerFromCharacter(hit.Parent) -- local 스크립트 시간 설정 함수 불러오기
			if player then
				remote:FireClient(player, 10800, "보스전") -- 리모트 이벤트 실행	
			end
		end
	end
end

Restart.OnServerEvent:Connect(function() -- 리턴 이벤트가 작동하면; 아래 코드를 작동 시키겠다 
	wait(3)
	activated = false
	endactivated = false	
	RedFloor.CanCollide = false
	RedFloor.Transparency = 0.9
end)

startPart.Touched:Connect(onStartTouched)
finishPart.Touched:Connect(onFinishTouched)