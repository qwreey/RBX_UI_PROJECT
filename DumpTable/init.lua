local module = {}

local NumberIndex = '%s\n%s	[%s] = %s;'
local OtherIndex = '%s\n%s	["%s"] = %s;'

local ByPassDumpItem = {
	["number"] = true;
	["boolean"] = true;
	["table"] = true;
}
function DumpItem(Item,ItemType)
	if ByPassDumpItem[ItemType] then
		return tostring(Item)
	elseif ItemType == "string" then
		return ('"%s"'):format(Item)
	else
		return ('"%s"'):format(tostring(Item))
	end
end

function module:DumpTable(T,Deep)
	local Deep = Deep or 0
	
	local Tap = ""
	for i = 1,Deep do
		Tap = Tap .. "	"
	end
	
	local StrSpace = "{"
	
	for Index,Value in pairs(T) do
		local ValueType = type(Value)
		if ValueType == "table" then
			Value = module:DumpTable(Value,Deep + 1)
		end
		
		StrSpace = (type(Index) == "number" and NumberIndex or OtherIndex):format(StrSpace,Tap,tostring(Index),DumpItem(Value,ValueType)) 
	end
	
	StrSpace = StrSpace .. "\n".. Tap .."}"
	
	return StrSpace
end

return module