local render = {};

--#region Load libs
local MaterialUI if false then MaterialUI = require("MaterialUI.init"); end
MaterialUI = require(game:GetService("ReplicatedStorage"):WaitForChild("rojo"):WaitForChild("MaterialUI"));
local EDrow = MaterialUI.Create;
local AdvancedTween if false then AdvancedTween = require("AdvancedTween.init"); end
AdvancedTween = require(game:GetService("ReplicatedStorage"):WaitForChild("rojo"):WaitForChild("MaterialUI"));
local try if false then AdvancedTween = require("try"); end
try = require(script.Parent.try);
local PlayerUtil if false then AdvancedTween = require("PlayerUtil"); end
PlayerUtil = require(script.Parent.PlayerUtil);
--#endregion

--#region Get RBX Items
local UDim2 = UDim2;
local Enum = Enum;
local Vector2 = Vector2;
local type = type;
local typeof = typeof;
local print = print or function (...)
    local arg = {...};

    for Index,Str in pairs(arg) do
        arg[Index] = Str .. "\t";
    end

    io.write(table.unpack(arg));
    return nil;
end;
--#endregion

function render:render(Data)
    local Size = Data.Size or UDim2.new(0,225,0,240);
    local Position = Data.Position or UDim2.new(1,-8,0,0);
    local AnchorPoint = Data.AnchorPoint or Vector2.new(1,0);

    local Scroll;
    return EDrow("ScrollingFrame",{
        Size = Size;
        Position = Position;
        AnchorPoint = AnchorPoint;
        BackgroundTransparency = 1;
        WhenCreated = function (this)
            Scroll = this;
        end
    },{
        ListLayout = EDrow("UIListLayout",{
            SortOrder = Enum.SortOrder.LayoutOrder;
        });
    });
end