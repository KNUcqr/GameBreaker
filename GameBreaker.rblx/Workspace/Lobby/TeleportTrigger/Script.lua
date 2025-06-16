local UIactivate = game.ReplicatedStorage.UIactivate
local Teleport = require(game.ReplicatedStorage.Teleport)
Triggered = true

local function onTouched(hit)
	if Triggered then
		Triggered = false
		local character = hit.Parent
		if character and character:FindFirstChild("Humanoid") then
			local player = game.Players:GetPlayerFromCharacter(hit.Parent) -- local 스크립트 시간 설정 함수 불러오기
			if player then
				Teleport.Teleport(hit)
				UIactivate:FireClient(player) -- 리모트 이벤트 실행	
			end
		end
		wait(1)
		Triggered = true
	end
end
	
script.Parent.Touched:Connect(onTouched)