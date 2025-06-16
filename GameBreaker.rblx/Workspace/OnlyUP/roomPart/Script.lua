local roomPart = script.Parent

local light = Instance.new("PointLight")
light.Brightness = 5
light.Range = 15
light.Color = Color3.fromRGB(255,255, 200)
light.Shadows = true
light.Parent = roomPart