local remote = game.ReplicatedStorage.RemoteEvent -- ����Ʈ �̺�Ʈ�� ������ ����
local Restart = game.ReplicatedStorage.Restart
local Teleport = require(game.ReplicatedStorage.Teleport)

local Room = workspace.Boss.Room1

local Start = Room.Destination

local YellowFloor = Room.YellowFloor

local Already = {true,true,true,true,true,true,true,true}

local Parts ={
	Room.Part1,
	Room.Part2,
	Room.Part3,
	Room.Part4,
	Room.Part5,
	Room.Part6,
	Room.Part7,
	Room.Part8
}

local Texts ={
	Parts[1].SurfaceGui.TextLabel,
	Parts[2].SurfaceGui.TextLabel,
	Parts[3].SurfaceGui.TextLabel,
	Parts[4].SurfaceGui.TextLabel,
	Parts[5].SurfaceGui.TextLabel,
	Parts[6].SurfaceGui.TextLabel,
	Parts[7].SurfaceGui.TextLabel,
	Parts[8].SurfaceGui.TextLabel
}

local TV = Room.TargetValue.SurfaceGui.TextLabel
local Tv = 0

local CV = Room.CurrentValue.SurfaceGui.TextLabel
local Cv = 0

local End = Room.End

local V = {0,0,0,0,0,0,0,0}

local LeftTime = 0

local Triggered = true

local EndTriggered = true

local function onStartTouched(hit) -- �÷��̾ ���� ��Ʈ�� ����� ��
	if Triggered then
		local character = hit.Parent
		if character and character:FindFirstChild("Humanoid") then

			Triggered = false
			
			-- ��ư �ѹ��� ���� ���� ����
			Already = {true,true,true,true,true,true,true,true}
			
			-- ���� ��
			Cv=0
			
			-- ��갪 ���� (%5 +1�� �� //5�� ��ȣ)
			for i = 1, 8 do
				V[i] = math.random(0,14)
			end

			-- ��� �� ������� �� ����
			Tv = Cv
			
			
			for i = 1, 8 do
				if V[i]//5 == 0 then
					Tv = Tv + (V[i]%5+1)
				elseif V[i]//5 == 1 then
					Tv = Tv - (V[i]%5+1)
				else
					Tv = Tv * (V[i]%5+1)
				end
			end


			--���� ��� ��� �� ���� �𸣰�
			for i = #V,2,-1 do
				local j=math.random(1,i)
				V[i],V[j]=V[j],V[i]
			end


			-- ��ư�� ���� ����
			for i =1, 8 do
				if V[i]//5 == 0 then
					Texts[i].Text = "+"..(V[i]%5+1)
				elseif V[i]//5 == 1 then
					Texts[i].Text = "-"..(V[i]%5+1)
				else
					Texts[i].Text = "*"..(V[i]%5+1)
				end
			end
			
			TV.Text=Tv
			CV.Text=Cv
			
		end
	end	
end

local function onEndTouched(hit)
	if EndTriggered then
		EndTriggered = false
		if Tv == Cv then	
			YellowFloor.CanCollide = true
			YellowFloor.Transparency = 0			
		else
			local player = game.Players:GetPlayerFromCharacter(hit.Parent) -- local ��ũ��Ʈ �ð� ���� �Լ� �ҷ�����
			if player then
				remote:FireClient(player, 1, "����")  -- ����Ʈ �̺�Ʈ ����
			end
		end	
	end
end

--������� ��� �� ��ư ��ġ ������ �ڵ�
local function onPart1Touched(hit)
	local character = hit.Parent
	if  Already[1] then
		Already[1] = false

		if character and character:FindFirstChild("Humanoid") then
			if V[1]//5 == 0 then
				Cv = Cv + (V[1]%5+1)
			elseif V[1]//5 == 1 then
				Cv = Cv - (V[1]%5+1)
			else
				Cv = Cv * (V[1]%5+1)
			end

			Texts[1].Text = "."

			CV.Text=Cv

		end
	end	
end

local function onPart2Touched(hit)
	local character = hit.Parent
	if Already[2] then
		Already[2] = false
		if character and character:FindFirstChild("Humanoid") then
			if V[2] // 5 == 0 then
				Cv = Cv + (V[2] % 5 + 1)
			elseif V[2] // 5 == 1 then
				Cv = Cv - (V[2] % 5 + 1)
			else
				Cv = Cv * (V[2] % 5 + 1)
			end

			Texts[2].Text = "."

			CV.Text = tostring(Cv)

		end
	end	
end

local function onPart3Touched(hit)
	local character = hit.Parent
	if Already[3] then
		Already[3] = false
		if character and character:FindFirstChild("Humanoid") then
			if V[3] // 5 == 0 then
				Cv = Cv + (V[3] % 5 + 1)
			elseif V[3] // 5 == 1 then
				Cv = Cv - (V[3] % 5 + 1)
			else
				Cv = Cv * (V[3] % 5 + 1)
			end

			Texts[3].Text = "."

			CV.Text = tostring(Cv)


		end
	end	
end

local function onPart4Touched(hit)
	local character = hit.Parent
	if Already[4] then
		Already[4] = false
		if character and character:FindFirstChild("Humanoid") then
			if V[4] // 5 == 0 then
				Cv = Cv + (V[4] % 5 + 1)
			elseif V[4] // 5 == 1 then
				Cv = Cv - (V[4] % 5 + 1)
			else
				Cv = Cv * (V[4] % 5 + 1)
			end

			Texts[4].Text = "."

			CV.Text = tostring(Cv)

		end
	end	
end

local function onPart5Touched(hit)
	local character = hit.Parent
	if Already[5] then
		Already[5] = false
		if character and character:FindFirstChild("Humanoid") then
			if V[5] // 5 == 0 then
				Cv = Cv + (V[5] % 5 + 1)
			elseif V[5] // 5 == 1 then
				Cv = Cv - (V[5] % 5 + 1)
			else
				Cv = Cv * (V[5] % 5 + 1)
			end

			Texts[5].Text = "."

			CV.Text = tostring(Cv)

		end
	end	
end

local function onPart6Touched(hit)
	local character = hit.Parent
	if Already[6] then
		Already[6] = false
		if character and character:FindFirstChild("Humanoid") then
			if V[6] // 5 == 0 then
				Cv = Cv + (V[6] % 5 + 1)
			elseif V[6] // 5 == 1 then
				Cv = Cv - (V[6] % 5 + 1)
			else
				Cv = Cv * (V[6] % 5 + 1)
			end

			Texts[6].Text = "."

			CV.Text = tostring(Cv)

		end
	end	
end

local function onPart7Touched(hit)
	local character = hit.Parent
	if Already[7] then
		Already[7] = false
		if character and character:FindFirstChild("Humanoid") then
			if V[7] // 5 == 0 then
				Cv = Cv + (V[7] % 5 + 1)
			elseif V[7] // 5 == 1 then
				Cv = Cv - (V[7] % 5 + 1)
			else
				Cv = Cv * (V[7] % 5 + 1)
			end

			Texts[7].Text = "."

			CV.Text = tostring(Cv)

		end
	end	
end

local function onPart8Touched(hit)
	local character = hit.Parent
	if Already[8] then
		Already[8] = false
		if character and character:FindFirstChild("Humanoid") then
			if V[8] // 5 == 0 then
				Cv = Cv + (V[8] % 5 + 1)
			elseif V[8] // 5 == 1 then
				Cv = Cv - (V[8] % 5 + 1)
			else
				Cv = Cv * (V[8] % 5 + 1)
			end

			Texts[8].Text = "."

			CV.Text = tostring(Cv)

		end
	end	
end
Restart.OnServerEvent:Connect(function() -- ���� �̺�Ʈ�� �۵��ϸ�; �Ʒ� �ڵ带 �۵� ��Ű�ڴ� 
	wait(3)
	Triggered = true
	EndTriggered = true
	YellowFloor.CanCollide = false
	YellowFloor.Transparency = 0.9
end)

Start.Touched:Connect(onStartTouched)
End.Touched:Connect(onEndTouched)

Parts[1].Touched:Connect(onPart1Touched)
Parts[2].Touched:Connect(onPart2Touched)
Parts[3].Touched:Connect(onPart3Touched)
Parts[4].Touched:Connect(onPart4Touched)
Parts[5].Touched:Connect(onPart5Touched)
Parts[6].Touched:Connect(onPart6Touched)
Parts[7].Touched:Connect(onPart7Touched)
Parts[8].Touched:Connect(onPart8Touched)