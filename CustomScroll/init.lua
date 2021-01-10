local module = {}

-- Roblox service load
local UserInputService = game:GetService("UserInputService")
local Run = game:GetService("RunService")
local RepSt = game:GetService("ReplicatedStorage")

-- default settings
local DefaultXMaxOverScroll = 80
local DefaultYMaxOverScroll = 80

-- module load
local deps = RepSt:WaitForChild("rojo")
local AdvancedTween = require(deps:WaitForChild("AdvancedTween"))

-- player
local LocalPlayer = game.Players.LocalPlayer
local Mouse = LocalPlayer and LocalPlayer:GetMouse()

-- input types
local InputTypes = {
	[Enum.UserInputType.Touch] = true;
	[Enum.UserInputType.MouseButton1] = true;
}

function module.new(Data)
	local Data = Data or {}
	
	-- 얼마나 오버스크롤 될 지 결정,
	-- 만약 X 오버스크롤이 0 이면 옆으로는 통통 튀는 효과가 없어짐
	-- = ios 스크롤 같은 효과 낼 수 있음
	local XMaxOverScroll = Data.XMaxOverScroll or DefaultXMaxOverScroll
	local YMaxOverScroll = Data.YMaxOverScroll or DefaultYMaxOverScroll
	
	-- 드래그 불가능한지 결정
	local DragToScrollDisabled = Data.DragToScrollDisabled
	-- 휠 사용 불가능한지 결정
	local MouseWheelDisabled = Data.MouseWheelDisabled
	
	-- 오버스크롤을 포함한 위치
	local TmpPosX
	local TmpPosY
	-- 오버스크롤 없이 홀더 크기에 맞게 잘라낸 위치
	local CutPosX
	local CutPosY
	
	-- 오브젝트 가져옴
	local Frame = Data.Obj or script.SpringScrollingFrame:Clone() -- 프레임(창)
	local Holder = Frame.Holder -- 홀더(내부)
	
	-- 스크롤 함수 (방향만큼 감)
	local function Scroll(DirectionX,DirectionY,IsMouse)
		DirectionX = DirectionX or 0
		DirectionY = DirectionY or 0
		
		local Frame_AbsoluteSize = Frame.AbsoluteSize
		local Holder_AbsoluteSize = Holder.AbsoluteSize
		
		local MinScrollPosX = Frame_AbsoluteSize.X - Holder_AbsoluteSize.X
		local MinScrollPosY = Frame_AbsoluteSize.Y - Holder_AbsoluteSize.Y
		
		-- 홀더 사이즈가 창 사이즈보다 작은 특수한 경우
		local SubX = MinScrollPosX > XMaxOverScroll and (MinScrollPosX/2) or 0
		local SubY = MinScrollPosY > YMaxOverScroll and (MinScrollPosY/2) or 0
		MinScrollPosX = math.min(0,MinScrollPosX) + SubX
		MinScrollPosY = math.min(0,MinScrollPosY) + SubY
 		
		-- 오버스크롤을 포함한 위치
		TmpPosX = math.clamp(
			(TmpPosX or Holder.Position.X.Offset) + DirectionX,
			MinScrollPosX - XMaxOverScroll,
			XMaxOverScroll + SubX
		)
		TmpPosY = math.clamp(
			(TmpPosY or Holder.Position.Y.Offset) + DirectionY,
			MinScrollPosY - YMaxOverScroll,
			YMaxOverScroll + SubY
		)
		-- 완전히 들어맞는 위치
		CutPosX = math.clamp(TmpPosX,MinScrollPosX,SubX)
		CutPosY = math.clamp(TmpPosY,MinScrollPosY,SubY)
		
		local TweenData = {
			Time = 0.4;
			Easing = AdvancedTween.EasingFunctions.Exp2;
			Direction = AdvancedTween.EasingDirection.Out;
		}
		if not IsMouse then
			TweenData.CallBack = {
				[0.4] = function()
					if CutPosX and CutPosY and (TmpPosX ~= CutPosX or TmpPosY ~= CutPosY) then
						AdvancedTween:RunTween(Holder,{
							Time = 0.85;
							Easing = AdvancedTween.EasingFunctions.Exp2;
							Direction = AdvancedTween.EasingDirection.Out;
						},{
							Position = UDim2.fromOffset(CutPosX,CutPosY);
						})
						TmpPosX = nil
						TmpPosY = nil
					end
				end;
			}
		end
		
		AdvancedTween:RunTween(Holder,TweenData,{
			Position = UDim2.fromOffset(TmpPosX,TmpPosY);
		})
	end
	
	-- 마우스 휠 앞/뒤 이벤트 연결
	-- (차피 RBX 인스턴트들은 Destroy() 호출시 연결된 이벤트가 자동으로 끊김)
	-- = 따로 연결 끊을 필요 없음
	Frame.MouseWheelBackward:Connect(function()
		if MouseWheelDisabled then
			return
		end
		if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
			-- 나중에 확대/축소 같은거 만들게 되면 편하라고 컨트롤키는 뺌
			return
		end
		local XScroll = UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) -- 쉬프트 눌러서 좌우로 움직이는거
		Scroll(
			XScroll and -50,
			(not XScroll) and -50
		)
	end)
	Frame.MouseWheelForward:Connect(function()
		if MouseWheelDisabled then
			return
		end
		if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
			-- 나중에 확대/축소 같은거 만들게 되면 편하라고 컨트롤키는 뺌
			return
		end
		local XScroll = UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) -- 쉬프트 눌러서 좌우로 움직이는거
		Scroll(
			XScroll and 50,
			(not XScroll) and 50
		)
	end)
	
	-- 홀더 크기 변경됨 (위치 조정)
	Holder:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
		Scroll(0,0)
	end)
	
	-- 마우스가 나갔거나 마우스 드래그가 취소됨
	-- 이 경우 그냥 Moved 연결 끊어서 멈춤(최적화 이득)
	local CheckInputEndedConnect
	local MouseMoveConnect
	local function DisconnectMoveConnect()
		if MouseMoveConnect then
			-- 오버스크롤 없는 위치로 돌아감
			AdvancedTween:RunTween(Holder,{
				Time = 0.85;
				Easing = AdvancedTween.EasingFunctions.Exp2;
				Direction = AdvancedTween.EasingDirection.Out;
			},{
				Position = UDim2.fromOffset(CutPosX,CutPosY);
			})
			TmpPosX = nil
			TmpPosY = nil
			MouseMoveConnect:Disconnect()
		end
		MouseMoveConnect = nil
		if CheckInputEndedConnect then
			CheckInputEndedConnect:Disconnect()
		end
		CheckInputEndedConnect = nil
	end
	
	-- 마우스 움직임 감지 함수
	-- 기존 위치에서 변화량을 가져와서 전체 값에 합산함
	local LastMovePosX = 0
	local LastMovePosY = 0
	local IsMoving = false
	local function MouseMove(x,y)
		if IsMoving then
			return
		end
		
		x = x or (Mouse.X + 36)
		y = y or (Mouse.Y + 36)
		
		IsMoving = true
		Scroll((x-LastMovePosX)*1.2,(y-LastMovePosY)*1.2,true)
		LastMovePosX = x
		LastMovePosY = y
		Run.Heartbeat:Wait() -- Tween 을 기다리기 위함
		IsMoving = false
	end
	
	-- 마우스 나감
	Frame.MouseLeave:Connect(DisconnectMoveConnect)
	--Frame.MouseButton1Up:Connect(DisconnectMoveConnect)
	-- 드래깅 취소
	local function CheckInputEnded(Input)
		-- gameProcessedEvent 안 받아도 됨, 그러면 버튼 위에서 떨어져 나간
		-- 인풋을 먹어버려서 안됨
		
		if InputTypes[Input.UserInputType] or Frame.Parent == nil then
			DisconnectMoveConnect()
		end
	end
	-- 드래깅 시작
	Frame.MouseButton1Down:Connect(function(x,y)
		if DragToScrollDisabled then
			return
		end
		LastMovePosX = x
		LastMovePosY = y
		-- 플긴 서비스를 위해 UserInputService.Mouse 를 남겨둠(내 모듈중 PluginGuiInputService 가 있다는 점 고려)
		MouseMoveConnect = (Mouse and Mouse.Move or UserInputService.Mouse.Move):Connect(MouseMove)
		-- 인풋 끝남과 연결
		CheckInputEndedConnect = UserInputService.InputEnded:Connect(CheckInputEnded)
	end)
	
	return Frame,setmetatable({},{
		__index = function(self,Key)
			if Key == "XMaxOverScroll" then
				return XMaxOverScroll
			elseif Key == "YMaxOverScroll" then
				return YMaxOverScroll
			elseif Key == "DragToScrollDisabled" then
				return DragToScrollDisabled
			elseif Key == "MouseWheelDisabled" then
				return MouseWheelDisabled
			end
		end;
		__newindex = function(self,Key,Value)
			if Key == "XMaxOverScroll" then
				XMaxOverScroll = Value
			elseif Key == "YMaxOverScroll" then
				YMaxOverScroll = Value
			elseif Key == "DragToScrollDisabled" then
				DragToScrollDisabled = Value
			elseif Key == "MouseWheelDisabled" then
				MouseWheelDisabled = Value
			end
		end;
	})
end

-- 끝ㅌㅌㅌㅌㅌ
return module