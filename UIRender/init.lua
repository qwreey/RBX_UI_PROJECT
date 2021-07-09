local renderClass = {};
renderClass.__index = renderClass;

function renderClass.new(settings)
    if settings == renderClass then
        error("do not call new function with ':'! using '.' for fix this error (or using this on inited class?)");
    end
    settings = settings or {};
    local this = {};
    this.objects = {};
    this.storage = {};
    this.uiHolder = settings.uiHolder;
    this.class = settings.class or {};
    this.debug = settings.debug or warn or print;
    this.frameRequest = settings.frameRequest or function (func)
        local run = game:GetService("RunService");
        local c = run.Heartbeat:Connect(func);
        return function () c:Disconnect(); end
    end;

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
            new[index] = value;
        end
    end
    local whenCreated = prop["whenCreated"];
    if whenCreated then
        whenCreated(new);
    end
    table.insert(self.objects,new);
    return new;
end

function renderClass:getObject(name)
    if renderClass == self or (not self) then
        error("you can't use this function on none inited class, using className.new() for using this function");
    end
    return self.storage[name];
end

function renderClass:addClass(className,newClassFunction)
    if renderClass == self or (not self) then
        error("you can't use this function on none inited class, using className.new() for using this function");
    end
    self.class[className] = newClassFunction;
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
    if thing == nil then
        error("thing must be not nil!");
    end
    if type(thing) == "table" then
        for _,nthing in pairs(thing) do
            self:draw(nthing);
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

local c = os.clock;
local animationClass = {};
animationClass.__index = animationClass;

function animationClass:play()
    if self:isPlaying() then
        self.render.debug("[WARN] render : something try to play already running animation. ignore this call");
    end
    local st = c();
    self.isPlaying = self.render.frameRequest(function ()
        self.func(c() - st);
    end);
    self.setTimeFunction = function (t)
        st = c() - t;
    end;
end

function animationClass:isPlaying()
    return self.isPlaying ~= nil;
end

function animationClass:stop()
    local unbind = self.isPlaying;
    if unbind then
        self.isPlaying = nil;
        self.setTime = nil;
        return unbind();
    else
        self.render.debug("[WARN] render : something try to stop already non-running animation. ignore this call");
        return nil;
    end
end

function animationClass:setTime(t)
    local set = self.setTimeFunction;
    if not set then
        self.render.debug("[WARN] render : something try to set animation running time for non-running animation. ignore this call");
        return;
    end
    set(t);
end

function animationClass:destroy()
    if self:isPlaying() then
        self:stop();
    end
    self.setTime = nil;
    self.render = nil;
    self.func = nil;
    self.isPlaying = nil;
    setmetatable(self,nil);
end
function animationClass:Destroy()
    self:destroy();
end

function animationClass.new(func,render)
    local this = {};

    this.func = func;
    this.render = render;
    this.isPlaying = nil;

    setmetatable(this,animationClass);
    return this;
end

function renderClass:makeAnimation(func)
    return animationClass.new(func,self);
end

function renderClass:cleanup()
    for _,v in pairs(self.objects) do
        pcall(v.Destroy,v);
    end
end

return renderClass;
