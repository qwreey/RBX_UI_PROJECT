if not script then
	warn("this module is only working on roblox lua")
	return
end

local module = {}

--// qwreey's custom wait lib
local Run = game:GetService("RunService")

local function spawn(Fnc,...)
	local args = ...
	spawn(function()
		Fnc(args)
	end)
end

function module:Wait(Time,Function)
	local EndTime = tick() + Time
	while true do
		local Now = tick()
		if EndTime <= Now then
			break
		end
		
		if Function then
			Function(EndTime - Now)
		end
		Run.Heartbeat:Wait()
	end
	Function(0)
end

function module:Delay(Time,Function)
	spawn(module.Wait,Time,Function)
end


return module
