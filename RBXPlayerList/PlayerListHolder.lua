local render = {};

--#region Load libs
local rojo = game:GetService("ReplicatedStorage"):WaitForChild("rojo")
local MaterialUI if false then MaterialUI = require("MaterialUI.init"); end
MaterialUI = require(rojo:WaitForChild("MaterialUI"));
local EDrow = MaterialUI.Create;
--#endregion
--#region Get RBX Items
local UDim2 = UDim2;
local Enum = Enum;
local Vector2 = Vector2;
--#endregion

---@see 플레이어 리스트 담는 스크롤 렌더
function render:render(Data)
    local Data = Data or {}
    local Size = Data.Size or UDim2.new(0,225,0,232);
    local Position = Data.Position or UDim2.new(1,-8,0,6);
    local AnchorPoint = Data.AnchorPoint or Vector2.new(1,0);

    local Scroll;
    return EDrow("ScrollingFrame",{
        Size = Size;
        Position = Position;
        AnchorPoint = AnchorPoint;
        BackgroundTransparency = 1;
        ScrollBarThickness = 6;
        ScrollingDirection = Enum.ScrollingDirection.Y;
        ScrollBarImageTransparency = 0.4;
        WhenCreated = function (this)
            Scroll = this;
        end;
    },{
        ListLayout = EDrow("UIListLayout",{
            SortOrder = Enum.SortOrder.LayoutOrder;
            Padding = UDim.new(0,2);
            WhenCreated = function (this)
                this:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function ()
                    Scroll.CanvasSize = UDim2.new(0,0,0,this.AbsoluteContentSize.Y);
                end);
            end;
        });
        Padding = EDrow("UIPadding",{
            PaddingRight = UDim.new(0,8);
        });
    });
end

return render;