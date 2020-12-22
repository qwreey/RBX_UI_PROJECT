-- PluginGui 에 대해서 인풋(키보드 인풋, 마우스 인풋 등등)
-- 을 담당하는 모듈

-- GuiObject 의 InputBegan 을 이용

local module = {}

function module:init(PluginGui,DebugEnabled)
	
	local InputTracker
	local MousePosX = 0
	local MousePosY = 0
	local IsMouseEnter = false
	local IsFocused = false
	local IsKeyDownTable = {}
	
	-- 이벤트 받는자
	local InputBeganEvent = Instance.new("BindableEvent",script)
	local InputEndedEvent = Instance.new("BindableEvent",script)
	local InputChangedEvent = Instance.new("BindableEvent",script)
	local MouseEnterEvent = Instance.new("BindableEvent",script)
	local MouseLeaveEvent = Instance.new("BindableEvent",script)
	
	local Mouse_MoveEvent = Instance.new("BindableEvent",script)
	local Mouse_Button1DownEvent = Instance.new("BindableEvent",script)
	local Mouse_Button1UpEvent = Instance.new("BindableEvent",script)
	local Mouse_Button2DownEvent = Instance.new("BindableEvent",script)
	local Mouse_Button2UpEvent = Instance.new("BindableEvent",script)
	local Mouse_WheelForwardEvent = Instance.new("BindableEvent",script)
	local Mouse_WheelBackwardEvent = Instance.new("BindableEvent",script)
	
	local ViewSizeChangedEvent = Instance.new("BindableEvent",script)
	
	-- 마우스 meta 가 self 에 값이 존재하지 않을때 이 테이블에서 해당 키로 호출
	local Mouse_Getter = {
		X = function()
			return MousePosX
		end;
		Y = function()
			return MousePosY
		end;
		ViewSizeX = function()
			return InputTracker.AbsoluteSizeX
		end;
		ViewSizeY = function()
			return InputTracker.AbsoluteSizeY
		end;
	}
	
	local New = {
		Mouse = setmetatable({
			ClassName = "PluginGuiMouse";
			Move = Mouse_MoveEvent.Event;
			WheelForward = Mouse_WheelForwardEvent.Event;
			WheelBackward = Mouse_WheelBackwardEvent.Event;
			Button1Down = Mouse_Button1DownEvent.Event;
			Button1Up = Mouse_Button1UpEvent.Event;
			Button2Down = Mouse_Button2DownEvent.Event;
			Button2Up = Mouse_Button2UpEvent.Event;
			X = nil;
			Y = nil;
			ViewSizeX = nil;
			ViewSizeY = nil;
			ViewSizeChanged = ViewSizeChangedEvent.Event;
			IsPseudo = true;
		},{
			-- 메타테이블
			__index = function(self,key)
				local Getter = Mouse_Getter[key]
				
				if not Getter then
					error(tostring(key) .. " is not member of 'PluginGuiMouse'")
				end
				
				return Getter(self)
			end;
			__newindex = function(self,key,value)
				error(tostring(key) .. " is locked property!")
			end;
			__metatable = function()
				error("metatable is locked!")
			end;
		});
		InputBegan = InputBeganEvent.Event;
		InputEnded = InputEndedEvent.Event;
		InputChanged = InputChangedEvent.Event;
		MouseEnter = MouseEnterEvent.Event;
		MouseLeave = MouseLeaveEvent.Event;
		IsMouseEnter = function()
			return IsMouseEnter
		end;
		WhenFocused = PluginGui.WindowFocused;
		WhenUnfocused = PluginGui.WindowFocusReleased;
		IsFocused = function()
			return IsFocused
		end;
	}
	
	-- InputTracker 생성-연동
	local function SetupInputTracker()
		InputTracker = Instance.new("TextButton")
		InputTracker.BackgroundTransparency = 1
		InputTracker.Text = ""
		InputTracker.Size = UDim2.fromScale(1,1)
		InputTracker.Name = "InputTracker"
		InputTracker.ZIndex = -2147483647
		InputTracker.Parent = PluginGui
		
		-- IsFocused
		PluginGui.WindowFocused:Connect(function()
			IsFocused = true
		end)
		PluginGui.WindowFocusReleased:Connect(function()
			IsFocused = false
		end)
		
		-- Input 트래킹,마우스 버튼
		InputTracker.InputBegan:Connect(function(Input,...)
			if Input.UserInputType == Enum.UserInputType.MouseButton1 then
				Mouse_Button1DownEvent:Fire(MousePosX,MousePosY)
			elseif Input.UserInputType == Enum.UserInputType.MouseButton2 then
				Mouse_Button2DownEvent:Fire(MousePosX,MousePosY)
			end
			InputBeganEvent:Fire(Input,...)
		end)
		InputTracker.InputEnded:Connect(function(Input,...)
			if Input.UserInputType == Enum.UserInputType.MouseButton1 then
				Mouse_Button1UpEvent:Fire(MousePosX,MousePosY)
			elseif Input.UserInputType == Enum.UserInputType.MouseButton2 then
				Mouse_Button2UpEvent:Fire(MousePosX,MousePosY)
			end
			InputEndedEvent:Fire(Input,...)
		end)
		InputTracker.InputChanged:Connect(function(...)
			InputChangedEvent:Fire(...)
		end)
		
		-- 마우스 들어옴/나감
		InputTracker.MouseEnter:Connect(function(...)
			IsMouseEnter = true
			MouseEnterEvent:Fire(...)
		end)
		InputTracker.MouseLeave:Connect(function(...)
			IsMouseEnter = false
			MouseLeaveEvent:Fire(...)
		end)
		
		-- 마우스 움직임
		InputTracker.MouseMoved:Connect(function(x,y)
			MousePosX = x
			MousePosY = y
			Mouse_MoveEvent:Fire(x,y)
		end)
		
		-- 마우스 스크롤
		InputTracker.MouseWheelForward:Connect(function(...)
			Mouse_WheelForwardEvent:Fire(...)
		end)
		InputTracker.MouseWheelBackward:Connect(function(...)
			Mouse_WheelBackwardEvent:Fire(...)
		end)
		
		-- ViewSizeChanged 연결
		InputTracker:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
			ViewSizeChangedEvent:Fire(InputTracker.AbsoluteSize.X,InputTracker.AbsoluteSize.Y)
		end)
		
		-- 강제 Visible (인풋 받아오려면 무조건 Visible 이 true 이여야됨)
		InputTracker:GetPropertyChangedSignal("Visible"):Connect(function()
			if InputTracker.Visible then
				return
			end
			InputTracker.Visible = true
		end)
		
		-- 강제 Parent (삭제되면 바로 다시 생성시킴)
		InputTracker:GetPropertyChangedSignal("Parent"):Connect(function()
			if InputTracker.Parent == nil then
				pcall(function()
					InputTracker:Destroy()
				end)
				InputTracker = nil
				SetupInputTracker()
			elseif InputTracker.Parent ~= PluginGui then
				InputTracker.Parent = PluginGui
			end
		end)
		
		if DebugEnabled then
			print("InputTracker added")
			ViewSizeChangedEvent.Event:Connect(function()
				print("Window size changed")
			end)
			Mouse_WheelForwardEvent.Event:Connect(function()
				print("Event : Mouse.MouseWheelForward")
			end)
			Mouse_WheelBackwardEvent.Event:Connect(function()
				print("Event : Mouse.MouseWheelBackward")
			end)
			Mouse_MoveEvent.Event:Connect(function(x,y)
				print(("Event : Mouse.Move : x=%s y=%s"):format(tostring(x),tostring(y)))
			end)
			MouseEnterEvent.Event:Connect(function(x,y)
				print(("Event : PluginGuiUserInputService.MouseEnter : x=%s y=%s"):format(tostring(x),tostring(y)))
			end)
			MouseLeaveEvent.Event:Connect(function(x,y)
				print(("Event : PluginGuiUserInputService.MouseLeave : x=%s y=%s"):format(tostring(x),tostring(y)))
			end)
			InputChangedEvent.Event:Connect(function()
				print("Event : Mouse.InputChanged")
			end)
			InputEndedEvent.Event:Connect(function()
				print("Event : Mouse.InputEnded")
			end)
			InputBeganEvent.Event:Connect(function()
				print("Event : Mouse.InputBegan")
			end)
			PluginGui.WindowFocusReleased:Connect(function()
				print("Event : PluginGui.WindowFocusReleased")
			end)
			PluginGui.WindowFocused:Connect(function()
				print("Event : PluginGui.WindowFocused")
			end)
			Mouse_Button1DownEvent.Event:Connect(function(x,y)
				print(("Event : Mouse.Button1Down : x=%s y=%s"):format(tostring(x),tostring(y)))
			end)
			Mouse_Button1UpEvent.Event:Connect(function(x,y)
				print(("Event : Mouse.Button1Up : x=%s y=%s"):format(tostring(x),tostring(y)))
			end)
			Mouse_Button2DownEvent.Event:Connect(function(x,y)
				print(("Event : Mouse.Button2Down : x=%s y=%s"):format(tostring(x),tostring(y)))
			end)
			Mouse_Button2UpEvent.Event:Connect(function(x,y)
				print(("Event : Mouse.Button2Up : x=%s y=%s"):format(tostring(x),tostring(y)))
			end)
		end
	end
	SetupInputTracker()
	
end

return module
