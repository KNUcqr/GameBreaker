local remote = game.ReplicatedStorage.RemoteEvent -- ����Ʈ �̺�Ʈ�� ������ ����
local Restart = game.ReplicatedStorage.Restart
local Teleport = require(game.ReplicatedStorage.Teleport)

local DrooperFolder = workspace.Dropper
local activated = false
local endactivated = false

local startPart = DrooperFolder.Start
local finishPart = DrooperFolder.End

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
				remote:FireClient(player, 1200, "��������") -- ����Ʈ �̺�Ʈ ����	
			end
		end
	end
end

Restart.OnServerEvent:Connect(function() -- ���� �̺�Ʈ�� �۵��ϸ�; �Ʒ� �ڵ带 �۵� ��Ű�ڴ� 
	wait(3)
	activated = false		
end)

startPart.Touched:Connect(onStartTouched)
finishPart.Touched:Connect(onFinishTouched)