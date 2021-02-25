local render = {};

--#region Load libs
local MaterialUI if false then MaterialUI = require("MaterialUI.init"); end
MaterialUI = require(game:GetService("ReplicatedStorage"):WaitForChild("rojo"):WaitForChild("MaterialUI"));
local EDrow = MaterialUI.Create;
--#endregion
--#region Get RBX Items
local UDim2 = UDim2;
local Enum = Enum;
local Vector2 = Vector2;
--#endregion

function render:render(app)
    local Down;
    local Hover;
    return EDrow("ImageButton",{
        Parent = app;
        BackgroundTransparency = 1;
        Image = "rbxasset://textures/ui/TopBar/iconBase.png";
        ZIndex = -5;
        Size = UDim2.fromOffset(32,32);
        AnchorPoint = Vector2.new(1,0);
        Position = UDim2.new(1,-60,0,-32);
        MouseEnter = function ()
            Hover.Visible = true;
        end;
        MouseLeave = function ()
            Hover.Visible = false;
            Down.Visible = false;
        end;
        MouseButton1Down = function ()
            Down.Visible = true;
            Hover.Visible = false;
        end;
        MouseButton1Up = function ()
            Hover.Visible = true;
            Down.Visible = false;
        end
    },{
        Icon = EDrow("ImageLabel",{
            BackgroundTransparency = 1;
            Image = "http://www.roblox.com/asset/?id=6026568216";
            ZIndex = -4;
            AnchorPoint = Vector2.new(0.5,0.5);
            Position = UDim2.fromScale(0.5,0.5);
            Size = UDim2.fromScale(0.7,0.7);
        });
        Down = EDrow("ImageLabel",{
            Size = UDim2.fromScale(1,1);
            BackgroundTransparency = 1;
            ImageTransparency = 0.4;
            Image = "rbxasset://textures/ui/TopBar/iconBase.png";
            ZIndex = -3;
            Visible = false;
            WhenCreated = function (this)
                Down = this;
                return;
            end;
        });
        Hover = EDrow("ImageLabel",{
            Size = UDim2.fromScale(1,1);
            BackgroundTransparency = 1;
            ImageTransparency = 0.9;
            Image = "rbxasset://textures/ui/RoundedRect8px.png";
            ZIndex = -3;
            Visible = false;
            WhenCreated = function (this)
                Hover = this;
                return;
            end;
        });
    });
end

return render;