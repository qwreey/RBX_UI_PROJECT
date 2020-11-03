--local Run = game:GetService("RunService")

local module = {}
local EasingFunctions = require(script and script.EasingFunctions or "EasingFunctions")
local Stepped = require(script and script.Stepped or "Stepped")
local BindedFunctions = {}

function reverse(Index)
	-- 1 - 변환
	-- out , in 구현을 위해 사용됨
	return 1 - Index
end

function module:Lerp(start,goal,alpha)
	-- 이중 선형 보간법, Alpha 를 받아서 값을 구해옴 (목표값과 시작값 에 알파만큼의 사이의 값을 구해옴)
	return start + ((goal - start) * alpha)
end

-- 애니메이션 실행 스택 저장하기, 기본적으로 1 부터 시작하고 0 인 경우는 아에 멈춰있는 상태
-- 스택은 각각 속성마다 저장되며, PlayIndex 에 해당하는 개채를 KEY 로 지정하여 그 KEY 에 속성당 인덱스가 담긴
-- 태이블을 담음
-- 즉, PlayIndex[Item][PropertyName] 과 같은 형태로 스택을 보관함,
-- 기본적으로 KEY 인 개채가 사라지면, 더이상 접근할수 없게 되기 때문에 알아서
-- gc 가 수거해감
module.PlayIndex = {}

-- 값의 변화량을 가져오기 위한 함수들 지정, 그리고 그 방향을 지정하기 위한 Enum 정의
module.EasingFunctions = EasingFunctions
module.EasingDirection = {
	Out = "Out";
	In  = "In" ;
}

-- 기본적으로 로블록스에 있는 클래스중, + - * / 과 같은 연산자 처리 메타 인덱스가 있는것들
-- typeof 에서 다음 값과 같은경우 따로 확인 없이 바로 이중선형보간 함수로 넘어감
local DefaultItems = {
	["Vector2"] = true;
	["Vector3"] = true;
	["CFrame" ] = true;
	["number" ] = true;
}

-- 예전 값,목표 값,알파를 주고 각각 해당하는 속성에 입력해줌
-- 기본적으로 모든 속성값 적용은 여기에서 이루워짐
function module:LerpProperties(Item,Old,New,Alpha)
	for Property,OldValue in pairs(Old) do
		local NewValue = New[Property]
		if NewValue == nil then
			continue
		end
		
		if DefaultItems[typeof(OldValue)] then
			Item[Property] = module:Lerp(OldValue,NewValue,Alpha)
		elseif typeof(OldValue) == "UDim2" then
			Item[Property] = UDim2.new(
				module:Lerp(OldValue.X.Scale ,NewValue.X.Scale ,Alpha),
				module:Lerp(OldValue.X.Offset,NewValue.X.Offset,Alpha),
				module:Lerp(OldValue.Y.Scale ,NewValue.Y.Scale ,Alpha),
				module:Lerp(OldValue.Y.Offset,NewValue.Y.Offset,Alpha)
			)
		elseif typeof(OldValue) == "UDim" then
			Item[Property] = UDim.new(
				module:Lerp(OldValue.Scale ,NewValue.Scale ),
				module:Lerp(OldValue.Offset,NewValue.Offset)
			)
		end
	end
end

-- 트윈 메서드 지정, 트윈을 만들게 됨
function module:RunTween(Item,Data,Properties,Ended)
	-- Item : 트윈할 인스턴트
	-- Data : 트윈 정보들 (태이블)
		--Data.Time (in seconds, you can use 0.5 .. etc)
		--Data.Easing (function)
		--Data.Direction ("Out" , "In")
		--Data.CallBack 콜백 함수들(태이블), 예시 : 
		--Data.CallBack[0.5] = function() end 다음과 같이 쓰면 인덱스가 정확히 0.5 가 되는 순간(시간이 아니라 이징 함수에 의해 나온 값이 같아지는 순간)
		--해당 함수가 실행됨
	--Properties : 트윈할 속성과 목표값 예시 : 
	--Data.Properties.Position = UDim2.new(1,0,1,0) 처럼 하면 Position 속성의 목표를 1,0,1,0 으로 지정
	
	
	local Time      = Data.Time == nil and 1 or Data.Time
	local Direction = Data.Direction or "Out"
	
	if not module.PlayIndex[Item] then
		module.PlayIndex[Item] = {}
	end
	--module.ItemCount[Item] = module.ItemCount[Item] + 1
	--local AnimationCount = module.ItemCount[Item]
	
	local NowAnimationIndex = {}
	local LastProperties = {}
	for Property,_ in pairs(Properties) do
		LastProperties[Property] = Item[Property]
		if not module.PlayIndex[Item][Property] then
			module.PlayIndex[Item][Property] = 0
		end
		module.PlayIndex[Item][Property] = module.PlayIndex[Item][Property] + 1
		NowAnimationIndex[Property] = module.PlayIndex[Item][Property]
	end
	
	local Easing = (type(Data.Easing) == "function" and Data.Easing or EasingFunctions[Data.Easing]) or EasingFunctions.Exp2
	local EndTime = tick() + Time
	
	if Easing.Reverse then
		Direction = Direction == "Out" and "In" or "Out"
	end
    
    local StepIndex = #BindedFunctions + 1
    BindedFunctions[StepIndex] = function()
		-- 아에 멈추게 되는 경우
		if module.PlayIndex[Item] == nil then
			table.remove(BindedFunctions,StepIndex)
			return
		end
		
		-- 다른 트윈이 속성을 바꾸고 있다면(이후 트윈이) 그 속성을 건들지 않도록 없엠
		local Len = 0
		for Property,Index in pairs(NowAnimationIndex) do
			if Index ~= module.PlayIndex[Item][Property] then
				LastProperties[Property] = nil
				Properties[Property] = nil
				NowAnimationIndex[Property] = nil
			else
				Len = Len + 1
			end
		end
		-- 만약 다른 트윈이 지금 트윈하고 있는 속성을 모두 먹은경우 현재 트윈을 삭제함
		if Len == 0 then
			table.remove(BindedFunctions,StepIndex)
			return
		end
		
		local Now = tick()
		
		local Index = 1 - (EndTime - Now) / Time
		if Now >= EndTime then
			for Property,_ in pairs(Properties) do
				module.PlayIndex[Item][Property] = 0
			end
			table.remove(BindedFunctions,StepIndex)
			Index = 1
			if Ended then
				Ended()
			end
		end
		
		if Direction == "Out" then
			module:LerpProperties(
				Item,
				LastProperties,
				Properties,
				Easing:Run(Index)
			)
		else
			module:LerpProperties(
				Item,
				LastProperties,
				Properties,
				1 - Easing:Run(1 - Index)
			)
		end
		
		if Data.CallBack then
			for FncIndex,Fnc in pairs(Data.CallBack) do
				if type(Fnc) ~= "function" then
					Data.CallBack[FncIndex] = nil
					continue
				end
				
				if tonumber(FncIndex) <= Index then
					Fnc()
					Data.CallBack[FncIndex] = nil
				end
			end
		end
	end
	--local Step
	--Step = Run.Stepped:Connect()
end

function module:StopTween(Item)
	module.PlayIndex[Item] = nil
end

function module:IsTweening(Item)
	if module.PlayIndex[Item] == nil then
		return false
	end
	
	for Property,Index in pairs(module.PlayIndex[Item]) do
		if Index ~= 0 then
			return true
		end
	end
	return false
	--return module.ItemCount[Item] ~= 0
end

function module:IsPropertyTweening(Item,PropertyName)
	if module.PlayIndex[Item] == nil then
		return false
	end
	
	if module.PlayIndex[Item][PropertyName] == nil then
		return false
	end
	
	return module.PlayIndex[Item][PropertyName] ~= 0
end

function module:Stepped()
    for _,Function in pairs(BindedFunctions) do
        Function()
    end
end
Stepped:BindStep(module.Stepped)

return module