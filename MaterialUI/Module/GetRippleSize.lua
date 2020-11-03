local module = {}

function module:GetRippleSize(Obj,Mouse)
	local Size
	local MousePosOfButton
	do
		local x,y = Mouse.X,Mouse.Y
		MousePosOfButton = Vector2.new((x - Obj.AbsolutePosition.X),-(y - Obj.AbsolutePosition.Y))
		local LB = ( MousePosOfButton - Vector2.new(0,0) ).Magnitude
		local RB = ( MousePosOfButton - Vector2.new(Obj.AbsoluteSize.X,0) ).Magnitude
		local LT = ( MousePosOfButton - Vector2.new(0,-Obj.AbsoluteSize.Y) ).Magnitude
		local RT = ( MousePosOfButton - Vector2.new(Obj.AbsoluteSize.X,-Obj.AbsoluteSize.Y) ).Magnitude
		Size = LT*2
		if LT > RT and LT > LB and LT > RB then -- LT
			Size = LT*2
		end
		if RT > LT and RT > LB and RT > RB then -- RT
			Size = RT*2
		end
		if LB > RT and LB > LT and LB > RB then -- LB
			Size = LB*2
		end
		if RB > LT and RB > RT and RB > LB then -- LT
			Size = RB*2
		end
	end
	return Size,MousePosOfButton
end

return module
