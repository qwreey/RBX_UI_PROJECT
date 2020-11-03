local module = {}
function module:RippleContainer(RoundSize)
	if type(RoundSize) ~= "number" then
		error(("RoundSize is must be number, got %s"):format(type(RoundSize)))
	end
	
	local Data = script:FindFirstChild(tostring(RoundSize))
	if Data then
		return Data.RippleContainer:Clone()
	end
	local Data = Instance.new("Folder",script)
	Data.Name = tostring(RoundSize)
	
	local R = RoundSize == 1 and RoundSize or (RoundSize - 1)
	local Last = 0
	-- circle by R, x = math.sqrt((r^2)-(y^2))
	local NewRippleContainer = Instance.new("Frame",Data)
	NewRippleContainer.Name = "RippleContainer"
	NewRippleContainer.Size = UDim2.new(1,0,1,0)
	NewRippleContainer.BackgroundTransparency = 1
	
	local ClipFrame = Instance.new("ImageLabel")
	ClipFrame.BorderSizePixel = 0
	ClipFrame.Image = ""
	ClipFrame.ImageTransparency = 1
	ClipFrame.Size = UDim2.new(0,1,0,1)
	ClipFrame.BackgroundTransparency = 1
	ClipFrame.ClipsDescendants = true
	ClipFrame.Name = "0.7"
	for i = 1,R do -- Top
		local SizeX = math.floor( ( (R^2)-(i^2) )^0.5+0.5 )
		local ReSizeX = (-R*2)+(SizeX*2)
		local New = ClipFrame:Clone()
		New.Size = UDim2.new(1,ReSizeX,0,1)
		New.Position = UDim2.new(0,R-SizeX,0,R-i-1)
		New.Parent = NewRippleContainer
		
		local New2 = ClipFrame:Clone()
		New2.Size = UDim2.new(1,ReSizeX,0,1)
		New2.Position = UDim2.new(0,R-SizeX,1,-(R-i))
		New2.Parent = NewRippleContainer
		if ReSizeX ~= 0 then
			local EdgeL = ClipFrame:Clone()
			EdgeL.Name = "0.92"
			EdgeL.Position = UDim2.new(0,R-SizeX-1,0,R-i-1)
			EdgeL.Parent = NewRippleContainer
			
			local EdgeR = ClipFrame:Clone()
			EdgeR.Name = "0.92"
			EdgeR.Position = UDim2.new(1,-(R-SizeX),0,R-i-1)
			EdgeR.Parent = NewRippleContainer
			
			local EdgeL2 = ClipFrame:Clone()
			EdgeL2.Name = "0.92"
			EdgeL2.Position = UDim2.new(0,R-SizeX-1,1,-(R-i))
			EdgeL2.Parent = NewRippleContainer
			
			local EdgeR2 = ClipFrame:Clone()
			EdgeR2.Name = "0.92"
			EdgeR2.Position = UDim2.new(1,-(R-SizeX),1,-(R-i))
			EdgeR2.Parent = NewRippleContainer
		end
--		if R-SizeX ~= R and Last ~= SizeX then
--			Last = SizeX
--			local EdgeL = ClipFrame:Clone()
--			EdgeL.Name = "0.92"
--			EdgeL.Position = UDim2.new(0,R-i,0,R-Last)--UDim2.new(0,R-i-1,0,R-SizeX-1)
--			EdgeL.Parent = workspace.Frame--NewRippleContainer
			
--			local EdgeR = ClipFrame:Clone()
--			EdgeR.Name = "0.92"
--			EdgeR.Position = UDim2.new()--UDim2.new(0,R-i-1,1,-(R-SizeX))
--			EdgeR.Parent = NewRippleContainer
--			
--			local EdgeL2 = ClipFrame:Clone()
--			EdgeL2.Name = "0.92"
--			EdgeL2.Position = UDim2.new()--UDim2.new(1,-(R-i),0,R-SizeX-1)
--			EdgeL2.Parent = NewRippleContainer
--			
--			local EdgeR2 = ClipFrame:Clone()
--			EdgeR2.Name = "0.92"
--			EdgeR2.Position = UDim2.new()--UDim2.new(1,-(R-i),1,-(R-SizeX))
--			EdgeR2.Parent = NewRippleContainer
--		end
	end
	
	local Middle = ClipFrame:Clone()
	Middle.Position = UDim2.new(0,0,0,R-1)
	Middle.Size = UDim2.new(1,0,1,-R*2+2)
	Middle.Parent = NewRippleContainer
	ClipFrame:Destroy()
	
	return Data.RippleContainer:Clone()
end
function module:SetRound(ImageFrame,RoundSize)
	ImageFrame.Image = script.Round.Image
	ImageFrame.ScaleType = script.Round.ScaleType
	ImageFrame.SliceCenter = script.Round.SliceCenter
	ImageFrame.SliceScale = 0.0019166666666667 * RoundSize
end
function module:SetOutline(ImageFrame,RoundSize)
	ImageFrame.Image = script.Outline.Image
	ImageFrame.ScaleType = script.Outline.ScaleType
	ImageFrame.SliceCenter = script.Outline.SliceCenter
	ImageFrame.SliceScale = 0.00208 * RoundSize
end
return module