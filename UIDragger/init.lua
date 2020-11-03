local module = {}

local MouseTracker = game.Players.LocalPlayer.PlayerGui:FindFirstChild("MouseTracker") or Instance.new("ScreenGui",game.Players.LocalPlayer.PlayerGui)
MouseTracker.Name = "MouseTracker"
MouseTracker.ResetOnSpawn = false
MouseTracker.DisplayOrder = 2147483647

function module:SetDragger(Drager,Main,CheckDraggable)
	
	------------------------
	-- Arg Check
	------------------------
	if typeof(Drager) ~= "Instance" then
		error(("Dragger.SetDragger : Arg 1(Drager) is must be GuiButton(Instance), got %s"):format(typeof(Drager)))
	elseif (not Drager:IsA("GuiButton")) then
		error(("Dragger.SetDragger : Arg 1(Drager) is must be GuiButton(Instance), got %s"):format(tostring(Drager.ClassName)))
	end
	if typeof(Main) ~= "Instance" then
		error(("Dragger.SetDragger : Arg 2(Main) is must be GuiObject(Instance), got %s"):format(typeof(Main)))
	elseif (not Main:IsA("GuiObject")) then
		error(("Dragger.SetDragger : Arg 2(Main) is must be GuiObject(Instance), got %s"):format(tostring(Main.ClassName)))
	end
	if not (typeof(CheckDraggable) == "function" or typeof(CheckDraggable) == "nil") then
		error(("Dragger.SetDragger : Arg 3(CheckDraggable) is must be function, got %s"):format(typeof(CheckDraggable)))
	end
	
    local ReturnTable = {}
    local Connection = {}
	local DragStarted = Instance.new("BindableEvent",script)
	local DragEnded = Instance.new("BindableEvent",script)
	
	ReturnTable.DragStarted = DragStarted.Event
	ReturnTable.DragEnded = DragEnded.Event
	
	local Releaser = Instance.new("TextButton")
	Releaser.Text = ""
	Releaser.Name = "MoveTracker"
	Releaser.Size = UDim2.new(1,6500,1,6500)
	Releaser.Position = UDim2.new(0.5,0,0.5,0)
	Releaser.AnchorPoint = Vector2.new(0.5,0.5)
	Releaser.BackgroundTransparency = 1
	--Releaser.Visible = true
	Releaser.ZIndex = 999999999
	local MouseDownPosition = nil
	Connection[#Connection+1] = Releaser.MouseMoved:Connect(function(x,y)
		if MouseDownPosition == nil then
			Releaser.Parent = script
		else
			local AbsX,AbsY = 0,0
			local AbsSizeX,AbsSizeY = 1,1
			if Main.Parent and Main.Parent:IsA("GuiObject") then
				AbsX = Main.Parent.AbsolutePosition.X
				AbsY = Main.Parent.AbsolutePosition.Y
			end
			if Main.Parent and Main.Parent:IsA("GuiObject") or Main.Parent:IsA("ScreenGui") then
				AbsSizeX = Main.Parent.AbsoluteSize.X
				AbsSizeY = Main.Parent.AbsoluteSize.Y
			end
			
			Main.Position = UDim2.new(
				(x-MouseDownPosition.X-AbsX)/AbsSizeX,
				0,
				(y-MouseDownPosition.Y-AbsY)/AbsSizeY,
				0
			)
		end
	end)
	local function UnDrag()
		MouseDownPosition = nil
		Releaser.Parent = script
		DragEnded:Fire()
	end
	Connection[#Connection+1] = Releaser.MouseButton1Up:Connect(UnDrag)
	Connection[#Connection+1] = Drager.MouseButton1Up:Connect(UnDrag)
	
	Connection[#Connection+1] = Drager.MouseButton1Down:Connect(function(x,y)
		if CheckDraggable then
			if not CheckDraggable() then
				return
			end
		end
		
		MouseDownPosition = Vector2.new(x-Drager.AbsolutePosition.X,y-Drager.AbsolutePosition.Y)
		DragStarted:Fire()
		Releaser.Parent = MouseTracker
	end)
	
    function ReturnTable:Destroy()
        for _,Connect in pairs(Connection) do
            if Connect then
                Connect:Disconnect()
            end
        end
        Connection = nil
        
		DragStarted:Destroy()
		DragEnded:Destroy()
		if Releaser then
			Releaser:Destroy()
		end
		
		MouseDownPosition = nil
		ReturnTable = nil
	end
	
	function ReturnTable:IsDragging()
		return MouseDownPosition ~= nil
	end
	
	return ReturnTable
end

return module