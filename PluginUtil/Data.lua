--// 로블록스 플러그인 설정 저장소의 자동 캐싱버전

local module = {Plugin = nil}

local DataCache = {}
function module:SetUp(Plugin)
	module.Plugin = Plugin
	
	local Data = {}
	
	function Data:Save(Key,Data)
		DataCache[Key] = Data
		module.Plugin:SetSetting(Key,Data)
	end
	function Data:Load(Key)
		if DataCache[Key] then
			return DataCache[Key]
		else
			local Data = module.Plugin:GetSetting(Key)
			DataCache[Key] = Data
			return Data
		end
	end
	function Data:ForceLoad(Key)
		local Data = module.Plugin:GetSetting(Key)
		DataCache[Key] = Data
		return Data
	end
	
	return Data
end

return module
