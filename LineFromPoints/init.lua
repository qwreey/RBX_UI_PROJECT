if not script then
	warn("this module is only working on roblox lua")
	return
end

local module = {}

--// 라인 그리기 함수(두 점을 주고 그 점을 이을때 나오는 선의 길이와 각도와 위치를 얻기)
function module:GetLineFromPoints(Point1, Point2, Thickness)
	local AbsPoint = Point2 - Point1 --// 포인트 1이 0,0 일때 Point 2의 위치를 가져옴
	local LineLen = (AbsPoint.X^2 + AbsPoint.Y^2)^0.5 --// 피타고라스의 정리를 이용한 라인 길이 얻기
	local Rotation = math.deg(math.atan2(AbsPoint.Y,AbsPoint.X)) --// 삼각함수를(역 삼각함수) 이용한 각도 얻기
	local RotVec = AbsPoint.Unit --// 기울기 값이 담긴 백터(유닛 백터)
	local MidPoint = Point1 + (RotVec * (LineLen/2)) --// 포인트 두개의 중앙점
	
	local UISize = UDim2.new(0,LineLen,0,Thickness or 1)
	local UIPosition = UDim2.new(0,MidPoint.X-(LineLen/2),0,MidPoint.Y-0.5)
	
	return UISize,UIPosition,Rotation
end

return module
