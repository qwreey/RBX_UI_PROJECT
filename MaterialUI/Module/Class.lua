local module = {}

function module:MakeDictionary(Old,IsProperties)
	if IsProperties then
		local New = {}
		for i,_ in pairs(Old) do
			New[i] = true
		end
		return New
	else
		local New = {}
		for _,v in pairs(Old) do
			New[v] = true
		end
		return New
	end
end
function module:CloneTable(Old,New)
	local New = New or {}
	for i,v in pairs(Old) do
		New[i] = v
	end
	return New
end

local Id = 0
module.Items = {}
function module:AddId(This)
	Id = Id + 1
	module.Items[Id] = This
end
function module:GetIdFromInstance(Inst)
	for i,v in pairs(module.Items) do
		if v == Inst then
			return i	
		end
	end
end
function module:GetInstanceFromId(Id)
	return module.Items[Id]
end
function module:RemoveAll()
	for _,v in pairs(module.Items) do
		if v ~= nil then
			v:Destroy()
		end
	end
end
function module:TotalInstance()
	local Index = 0
	for _,v in pairs(module.Items) do
		if v ~= nil then
			Index = Index + 1
		end
	end
	return Index
end
function module:SetClass(Properties,Getter,Setter,Methods,ClassName,ReadOnly,Obj,OnRemoveFunction)
	--Make Obj
	Properties.ClassName = true
	ReadOnly.ClassName = true
	
	Properties.Destroyed = true
	ReadOnly.Destroyed = true
	
	local Meta,Ins = {},{}
	local Methods = Methods or {}
	local OnRemoving
	local Changed
	local PropertyChanged = {}
	
	setmetatable(Ins,Meta)
	
	local function CallChanged(Key,Value)
		if Ins == nil then
			return
		elseif Ins[Key] ~= Value then
			if PropertyChanged[Key] then
				PropertyChanged[Key]:Fire(Value)
			end
			if Changed then
				Changed:Fire(Key,Value)
			end
		end
	end
	
	Meta.__index = function(self,Key)
		if Key == "ClassName" then
			return ClassName
		elseif Properties[Key] then
			if Getter[Key] then
				return Getter[Key]()
			else
				return Obj[Key]
			end
		elseif Key == "Destroyed" then
			OnRemoving = OnRemoving or Instance.new("BindableEvent")
			return OnRemoving.Event
		elseif Key == "Changed" then
			Changed = Changed or Instance.new("BindableEvent")
			return Changed.Event
		elseif Methods[Key] then
			return Methods[Key]
		else
			error(("%s is not member of %s"):format(Key,ClassName))
		end
	end
	Meta.__newindex = function(self,Key,Value)
		if Properties[Key] then
			if ReadOnly[Key] then
				error(("%s is read only property"):format(Key))
			else
				--Fire Changed Event
				CallChanged(Key,Value)
				
				--Set by Setter Fn
				if Setter[Key] then
					Setter[Key](Value)
				elseif Key == "Parent" and type(Value) == "table" then
					Obj.Parent = Value.Holder
				else
					Obj[Key] = Value
				end
			end
		else
			error(("%s is not member of %s"):format(Key,ClassName))
		end
	end
	
	--Make Default Methods
	function Methods:Destroy()
		Meta,Ins = nil,nil --Remove
		Obj:Destroy()
		Properties,Getter,Setter,Methods,ClassName,ReadOnly,Obj,OnRemoveFunction,CallChanged = nil
		if OnRemoveFunction then
			OnRemoveFunction()
		end
		
		if OnRemoving then
			OnRemoving:Fire()
			delay(1,function()
				OnRemoving:Destroy()
			end)
		end
	end
	function Methods:GetProperties()
		return module:CloneTable(Properties)
	end
	function Methods:GetReadOnly()
		return module:CloneTable(ReadOnly)
	end
	function Methods:GetRealInstance()
		return Obj
	end
	function Methods:GetMethods()
		local NewMethods = {"GetProperties","GetReadOnly","GetRealInstance","IsA","GetFullName"}
		for i,_ in pairs(Methods) do
			NewMethods[#NewMethods+1] = i
		end
		return NewMethods
	end
	function Methods:IsA(Name)
		return Name == ClassName
	end
	function Methods:GetFullName()
		return Obj:GetFullName()
	end
	function Methods:GetPropertyChangedSignal(Property)
		if not Properties[Property] then
			error(("%s is not member of %s"):format(Property))
		end
		local Signal = PropertyChanged[Property] or Instance.new("BindableEvent")
		PropertyChanged[Property] = Signal
		return Signal.Event
	end
	
	module:AddId(Ins)
	return Ins,CallChanged--PropertyChangedSignal Fire
end

return module