local UIactivate = game.ReplicatedStorage.UIactivate
local Teleport = require(game.ReplicatedStorage.Teleport)
Triggered = true

local function onTouched(hit)
	if Triggered then
		Triggered = false
		local character = hit.Parent
		if character and character:FindFirstChild("Humanoid") then
			local player = game.Players:GetPlayerFromCharacter(hit.Parent) -- local ��ũ��Ʈ �ð� ���� �Լ� �ҷ�����
			if player then
				Teleport.Teleport(hit)
				UIactivate:FireClient(player) -- ����Ʈ �̺�Ʈ ����	
			end
		end
		wait(1)
		Triggered = true
	end
end
	
script.Parent.Touched:Connect(onTouched)