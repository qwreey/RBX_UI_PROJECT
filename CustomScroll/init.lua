local module = {}

local Run = game:GetService("RunService")
local RepSt = game:GetService("ReplicatedStorage")
local deps = RepSt:WaitForChild("rojo")

local DefaultXMaxOverScroll = 80
local DefaultYMaxOverScroll = 80

local AdvancedTween = require(deps:WaitForChild("AdvancedTween"))
local UserInputService = game:GetService("UserInputService")

function module.new(Obj)
	local XMaxOverScroll = DefaultXMaxOverScroll
	local YMaxOverScroll = DefaultYMaxOverScroll
	
	-- 오버스크롤을 포함한 위치를 TmpPos 라고 함
	local TmpPosX
	local TmpPosY
	-- 오버스크롤 없이 홀더 크기에 맞게 잘라낸 위치를 CutPos 라고 함
	local CutPosX
	local CutPosY
	
	local Frame = Obj or script.SpringScrollingFrame:Clone() -- 프레임(창)
	local Holder = Frame.Holder -- 홀더(내부)
	local MouseMoveConnect = nil -- 마우스 움직이는중인지 감지하기 위함, 근데 안씀
	
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
	
	Frame.MouseWheelBackward:Connect(function()
		local XScroll = UserInputService:IsKeyDown(Enum.KeyCode.LeftShift)
		Scroll(
			XScroll and -50,
			(not XScroll) and -50
		)
	end)
	Frame.MouseWheelForward:Connect(function()
		local XScroll = UserInputService:IsKeyDown(Enum.KeyCode.LeftShift)
		Scroll(
			XScroll and 50,
			(not XScroll) and 50
		)
	end)
	Holder:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
		Scroll(0,0)
	end)
	
	
	local function DisconnectMoveMoveConnect()
		if MouseMoveConnect then
			MouseMoveConnect:Disconnect()
		end
		MouseMoveConnect = nil
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
	local LastMovePosX = 0
	local LastMovePosY = 0
	local IsMoving = false
	local function MouseMove(x,y)
		if IsMoving then
			return
		end
		IsMoving = true
		Scroll((x-LastMovePosX)*1.2,(y-LastMovePosY)*1.2,true)
		LastMovePosX = x
		LastMovePosY = y
		Run.Heartbeat:Wait()
		IsMoving = false
	end
	Frame.MouseLeave:Connect(DisconnectMoveMoveConnect)
	Frame.MouseButton1Up:Connect(DisconnectMoveMoveConnect)
	Frame.MouseButton1Down:Connect(function(x,y)
		LastMovePosX = x
		LastMovePosY = y
		MouseMoveConnect = UserInputService.Mouse.Move:Connect(MouseMove)
	end)
	
	return Frame
end

return module