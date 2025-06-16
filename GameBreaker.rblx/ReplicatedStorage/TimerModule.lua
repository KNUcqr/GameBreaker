-- ReplicatedStorage.TimerModule
local module = {}

local Restart = game.ReplicatedStorage.Restart

local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local score = -1
module.LeftTime = -1

local connection = nil

-- UI ������Ʈ �Լ� (�ʿ� �� Ŀ���͸�����)
local function updateUI(player, time, place)
	local gui = player:FindFirstChild("PlayerGui")
	if not gui then return end

	local screen = gui:FindFirstChild("MyHUD")
	if not screen then return end

	local label = screen:FindFirstChild("TimeLabel")
	if label and label:IsA("TextLabel") then
		label.Text = time > 0 and ("���� �ð�: " .. time//60) or "����!"
	end
	
	local ScoreLabel = screen:FindFirstChild("ScoreLabel")
	ScoreLabel.Text = ("����: " .. score)
	

	local PlaceLabel = screen:FindFirstChild("PlaceLabel")
	PlaceLabel.Text = (place)

	
end

function module.TimeClear(player, time, place)
	module.LeftTime = time
	score = score + 1

	if score > 4 then -- ���� ���� �ٲٴ� �κ�
		local character = player.Character
		if character and character:FindFirstChild("Humanoid") then
			local root = character:FindFirstChild("HumanoidRootPart")
			root.CFrame = workspace.Boss.Dropper.Start.CFrame + Vector3.new(0, 3, 0)
		end
	end

	-- ���� ���� ����
	if connection then
		connection:Disconnect()
	end
	
	connection = RunService.Heartbeat:Connect(function(dt)
		if module.LeftTime >= 0 then
			updateUI(player, module.LeftTime, place)
			module.LeftTime -= 1

			if module.LeftTime == 0 then
			-- ���� ó��
				if player and player.Character then
					player.Character:BreakJoints()
					Restart:FireServer(player)
				end
			end
		end
	end)
end


function module.ScoreClear()
	score = -1
end

return module