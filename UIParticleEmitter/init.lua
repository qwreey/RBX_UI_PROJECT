if not script then
	warn("this module is only working on roblox lua")
end

local module = {}
local Run = game:GetService("RunService")

function module:GetVec(Ang,Force)
	-- Ang   = 앵글 값(각도 값) , 1분면의 X 축을 0도로 함(1 사분면에서 그려지는 직각 삼각형에 대해서)
	-- Force = 힘 값(날라가는 정도)
	
	local X = math.cos(math.rad(Ang)) * Force
	local Y = math.sin(math.rad(Ang)) * Force
	
	return Vector2.new(X,Y)
end

function module:GetVecByYLine(Ang,Force)
	-- Ang   = 앵글 값(각도 값) , 1분면의 X 축을 0도로 함(1 사분면에서 그려지는 직각 삼각형에 대해서)
	-- Force = 힘 값(날라가는 정도)
	local Ang = Ang + 90
	local X = math.cos(math.rad(Ang)) * Force
	local Y = math.sin(math.rad(Ang)) * Force
	
	return Vector2.new(X,Y)
end

function module:Craft_2DParticleEmitter(InfoData)
	
	--The infoData have...
	-- InfoData.OnUDim   = Udim 을 사용하는지에 대한 여부(Y 축 뒤집기)
	-- InfoData.Inertia  = 관성 , 높으면 높을수록 VEC 방향으로 멈추지 않음 (1 인 경우 멈추지 않음,중력 상수값에는 변화를 줄수 없음 , 기본 0.6) [받는 값 Number]
	-- InfoData.Gravity  = 중력 가속도 상수(높으면 높을수록 바닥으로 더 빠르게 떨어짐 , 기본 0.98) [받는 값 Number]
	-- InfoData.Vector   = X 값과 Y 값을 가지는 백터값(방향과 빠르기를 동시에 나타냄) [받는 값 Vector2]
	-- InfoData.Position = 이 파티클이 시작될 위치 [받는 값 Vector2]
	-- InfoData.Function = 파티클 위치가 변경되었을때 실행할 함수[무조건 포함해야됨, 받는 값 Function]
	--  | 입력 값 : 
	--  |  |  1 : POS (현재 위치)
	--  |  |  2 : VEC (백터 값,움직임 예측용(백터값에 움직일 프레임 수 만큼 곱해주고 POS 에 더하기) )
	
	--The return data have...
	-- Destroy()         = 더이상 이 개채에 대해 물리 연산을 하지 않도록 만듬
	
	local POS = InfoData.Position or Vector2.new(0,0)
	local VEC = InfoData.Vector   or Vector2.new(1,1)
	local GA  = InfoData.Gravity  or 0.98
	local IA  = InfoData.Inertia  or 0.6
	local FNC = InfoData.Function or function()end
	
	local Dim = InfoData.OnUDim
	VEC = VEC * Vector2.new(1,Dim and -1 or 1)
	GA = GA * (Dim and -1 or 1)
	
	local StepConnect
	StepConnect = Run.Stepped:Connect(function()
		POS = POS + VEC
		
		VEC = VEC - Vector2.new(0,GA) * Vector2.new(IA,1)
		
		FNC(POS,VEC)
	end)
	
	local ReturnData = {}
	function ReturnData:Destroy()
		StepConnect:Disconnect()
	end
	
	return ReturnData
end

return module
