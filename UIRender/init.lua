local renderClass = {};
renderClass.__index = {};

function renderClass.new(settings)
  settings = settings or {};
  local this = {};
  this.storage = settings.storage or {};
  this.uiHolder = settings.uiHolder;
  this.class = settings.class or {};

  setmetatable(this,renderClass);
end

local function newObject(ClassName,prop)
	local class = self.class[ClassName];
  local new = class and class() or Instance.new(ClassName);
	for index,value in pairs(prop) do
		local valueType = typeof(value);
		local indexType = typeof(index);

		-- child
		if indexType ~= "string" and valueType == "Instance" then
			value.Parent = new;
		elseif valueType == "function" then
			-- connect event
			if index ~= "whenCreated" then
				new[index]:Connect(value);
			end
		elseif indexType == "string" then
			-- property
			new[index] = value
		end
	end
	local whenCreated = prop["whenCreated"];
	if whenCreated then
		whenCreated(new);
	end
	return new;
end

function renderClass:newObject(...)
  newObject(...);
end

function renderClass:getObject(name)
	return self.storage[name];
end

function renderClass:addClass(newClassFunction)
  table.insert(self.class,newClassFunction);
end

function renderClass:import(ClassName)
	return function (prop)
		if type(prop) == "string" then
			local lastName = prop;
			return function (nprop)
				nprop.Name = lastName;
				local item = newObject(ClassName,nprop);
				self.storage[lastName] = item;
				return item;
			end;
		end
		return newObject(ClassName,prop);
	end;
end

function renderClass:draw(thing)
  if type(thing) == "table" then
    for _,nthing in pairs(thing) do
      self:draw(thing);
    end
  else
    if thing:IsA("ScreenGui") then
      thing.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui");
    elseif self.uiHolder then
      thing.Parent = self.uiHolder;
    else
      local drawROOT = self.drawROOT or new("ScreenGui",{
        ResetOnSpawn = false;
        ZIndexBehavior = Enum.ZIndexBehavior.Global;
        Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui");
      });
      self.drawROOT = drawROOT;
    end
  end
  self.drawROOT = nil;
end

return renderClass.new(),renderClass;
