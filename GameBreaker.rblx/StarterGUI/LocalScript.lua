-- Ŭ���̾�Ʈ LocalScript ����
local remote = game.ReplicatedStorage:WaitForChild("RemoteEvent")
local UIactivate = game.ReplicatedStorage:WaitForChild("UIactivate")
local Timer = require(game.ReplicatedStorage.TimerModule)

remote.OnClientEvent:Connect(function(time, place) -- ����Ʈ �̺�Ʈ�� �۵��ϸ�; �Ʒ� �ڵ带 �۵� ��Ű�ڴ� 
	print("�������� ���� �ð�:", time)
	local player = game.Players.LocalPlayer
	Timer.TimeClear(player, time, place)
end)

-- TimerModule.TimeClear ����

--function module.TimeClear(player, time)
--  module.LeftTime = time

--  ���� ���� ����
--  if connection then
--	  connection:Disconnect()
--  end
--end

UIactivate.OnClientEvent:Connect(function()
	local player = game.Players.LocalPlayer
	Timer.ScoreClear(player)
end)