local remote = game.ReplicatedStorage.RemoteEvent -- ����Ʈ �̺�Ʈ�� ������ ����
local Restart = game.ReplicatedStorage.Restart
local Teleport = require(game.ReplicatedStorage.Teleport)

local onlyUpFolder = workspace.Boss.OnlyUP
local endactivated = false
local finishPart = onlyUpFolder.ClearZone

local function onFinishTouched(hit) -- �÷��̾ ���� ��Ʈ�� ����� ��if not activated then
	if not endactivated then
		endactivated = true
		local character=hit.Parent
		local root = character:FindFirstChild("HumanoidRootPart")
		root.CFrame = workspace.Folder.SpawnLocation.CFrame + Vector3.new(0, 3, 0)
		wait(1)
		endactivated = false
	end
end

Restart.OnServerEvent:Connect(function() -- ���� �̺�Ʈ�� �۵��ϸ�; �Ʒ� �ڵ带 �۵� ��Ű�ڴ� 
	wait(3)
	endactivated = false	
end)

finishPart.Touched:Connect(onFinishTouched)