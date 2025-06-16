-- 클라이언트 LocalScript 예시
local remote = game.ReplicatedStorage:WaitForChild("RemoteEvent")
local UIactivate = game.ReplicatedStorage:WaitForChild("UIactivate")
local Timer = require(game.ReplicatedStorage.TimerModule)

remote.OnClientEvent:Connect(function(time, place) -- 리모트 이벤트가 작동하면; 아래 코드를 작동 시키겠다 
	print("서버에서 받은 시간:", time)
	local player = game.Players.LocalPlayer
	Timer.TimeClear(player, time, place)
end)

-- TimerModule.TimeClear 내용

--function module.TimeClear(player, time)
--  module.LeftTime = time

--  이전 루프 종료
--  if connection then
--	  connection:Disconnect()
--  end
--end

UIactivate.OnClientEvent:Connect(function()
	local player = game.Players.LocalPlayer
	Timer.ScoreClear(player)
end)