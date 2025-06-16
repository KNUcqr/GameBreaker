local module = {}

local UIactivate = game.ReplicatedStorage.UIactivate

local destinations = {
	workspace.Room1.Destination,
	workspace.Room2.Destination,
	workspace.Room3.Destination,
	workspace.OnlyUP.StartSwitch,
	workspace.Dropper.Start
}

local ban = {}

local function teleportToRandom(character)
	if not character then return end
	local root = character:FindFirstChild("HumanoidRootPart")
	if not root then return end
		
	local randomIndex = math.random(1, #destinations)
	local target = destinations[randomIndex]

	table.insert(ban,target)
	table.remove(destinations,randomIndex)
	if #ban > 4 then
		table.insert(destinations,ban[1])
		table.remove(ban,1)
	end
	
	if target then
		root.CFrame = target.CFrame + Vector3.new(0, 3, 0)
	end
end

function module.Teleport(hit)
	local character = hit.Parent
	if character and character:FindFirstChild("Humanoid") then
		teleportToRandom(character)
	end
end


return module
