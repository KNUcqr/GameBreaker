local UIactivate = game.ReplicatedStorage.UIactivate --시작 발판 밟을 때 UI 생성

UIactivate.OnClientEvent:Connect(function()
	local player = game.Players.LocalPlayer
	local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
	screenGui.Name = "MyHUD"

	local TimeUI = Instance.new("TextLabel", screenGui)
	TimeUI.Name = "TimeLabel"
	TimeUI.Size = UDim2.new(0, 200, 0, 50)
	TimeUI.Position = UDim2.new(0.5, -100, -0.1, 0)
	TimeUI.BackgroundTransparency = 1 
	TimeUI.Text = "시간"
	TimeUI.TextColor3 = Color3.new(1, 1, 1)
	TimeUI.TextSize = 30

	local ScoreUI = Instance.new("TextLabel", screenGui)
	ScoreUI.Name = "ScoreLabel"
	ScoreUI.Size = UDim2.new(0, 200, 0, 50)
	ScoreUI.Position = UDim2.new(0.9, -100, -0.1, 0)
	ScoreUI.BackgroundTransparency = 1 
	ScoreUI.Text = "점수"
	ScoreUI.TextColor3 = Color3.new(1, 1, 1)
	ScoreUI.TextSize = 30
	
	local PlaceUI = Instance.new("TextLabel", screenGui)
	PlaceUI.Name = "PlaceLabel"
	PlaceUI.Size = UDim2.new(0, 200, 0, 50)
	PlaceUI.Position = UDim2.new(0.1, -100, -0.1, 0)
	PlaceUI.BackgroundTransparency = 1 
	PlaceUI.Text = "장소"
	PlaceUI.TextColor3 = Color3.new(1, 1, 1)
	PlaceUI.TextSize = 30
end)