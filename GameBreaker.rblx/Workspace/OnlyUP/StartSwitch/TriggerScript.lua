local remote = game.ReplicatedStorage.RemoteEvent -- ����Ʈ �̺�Ʈ�� ������ ����
local Restart = game.ReplicatedStorage.Restart
local Teleport = require(game.ReplicatedStorage.Teleport)

local switch = script.Parent -- StartSwitch
local onlyUpFolder = workspace.OnlyUP
local activated = false
local endactivated = false
local finishPart = onlyUpFolder.ClearZone

local function onFinishTouched(hit) -- �÷��̾ ���� ��Ʈ�� ����� ��if not activated then
	if not endactivated then
		endactivated = true
		activated = false
		Teleport.Teleport(hit)
		wait(1)
		endactivated = false
	end
end

local function onStartTouched(hit) -- �÷��̾ ���� ��Ʈ�� ����� ��
	if not activated then
		local character = hit.Parent
		if character and character:FindFirstChild("Humanoid") then
			activated = true

			local player = game.Players:GetPlayerFromCharacter(hit.Parent) -- local ��ũ��Ʈ �ð� ���� �Լ� �ҷ�����
			if player then
				remote:FireClient(player, 1800, "�ö󰡶�") -- ����Ʈ �̺�Ʈ ����	
			end
		end
	end
end

Restart.OnServerEvent:Connect(function() -- ���� �̺�Ʈ�� �۵��ϸ�; �Ʒ� �ڵ带 �۵� ��Ű�ڴ� 
	wait(3)
	activated = false	
end)

switch.Touched:Connect(onStartTouched)
finishPart.Touched:Connect(onFinishTouched)