local renderClass = {};
renderClass.__index = {};

function renderClass.new(settings)
    if settings == renderClass then
        error("do not call new function with ':'! using '.' for fix this error (or using this on inited class?)");
    end
    settings = settings or {};
    local this = {};
    this.storage = settings.storage or {};
    this.uiHolder = settings.uiHolder;
    this.class = settings.class or {};

    setmetatable(this,renderClass);
    return this;
end

function renderClass:newObject(ClassName,prop)
    if renderClass == self or (not self) then
        error("you can't use this function on none inited class, using className.new() for using this function");
    end
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

function renderClass:getObject(name)
    if renderClass == self or (not self) then
        error("you can't use this function on none inited class, using className.new() for using this function");
    end
    return self.storage[name];
end

function renderClass:addClass(newClassFunction)
    if renderClass == self or (not self) then
        error("you can't use this function on none inited class, using className.new() for using this function");
    end
    table.insert(self.class,newClassFunction);
end

function renderClass:import(ClassName)
    if renderClass == self or (not self) then
        error("you can't use this function on none inited class, using className.new() for using this function");
    end
    return function (prop)
        if type(prop) == "string" then
            local lastName = prop;
            return function (nprop)
                nprop.Name = lastName;
                local item = self:newObject(ClassName,nprop);
                self.storage[lastName] = item;
                return item;
            end;
        end
        return self:newObject(ClassName,prop);
    end;
end

function renderClass:draw(thing)
    if renderClass == self or (not self) then
        error("you can't use this function on none inited class, using className.new() for using this function");
    end
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
            local drawROOT = self.drawROOT or self:newObject("ScreenGui",{
                ResetOnSpawn = false;
                ZIndexBehavior = Enum.ZIndexBehavior.Global;
                Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui");
            });
            self.drawROOT = drawROOT;
        end
    end
    self.drawROOT = nil;
end

return renderClass;
