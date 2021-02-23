local render = {};

--#region Load libs
local rojo = game:GetService("ReplicatedStorage"):WaitForChild("rojo")
local MaterialUI if false then MaterialUI = require("MaterialUI.init"); end
MaterialUI = require(rojo:WaitForChild("MaterialUI"));
local EDrow = MaterialUI.Create;
local AdvancedTween if false then AdvancedTween = require("AdvancedTween.init"); end
AdvancedTween = require(rojo:WaitForChild("AdvancedTween"));
--#endregion
--#region Get RBX Items
local UDim2 = UDim2;
local Enum = Enum;
local Vector2 = Vector2;
--#endregion

local PlayerListItem = require(script.Parent.PlayerListItem);
local PlayerListHolder = require(script.Parent.PlayerListHolder);
local PlayerListTopbarBtn = require(script.Parent.PlayerListTopbarBtn);

local app;
local RenderPlayerListHolder;

-- 원래 초기화 과정까지 만들려 했는데
-- 귀찮아서 그냥 render 에서 자동으로 초기화 돌림
-- 그래서 init 함수 없음

local RenderPlayerListTopbarBtn;
local IsOpen = true;
function render.MakeToggleButton(Data)
    local Button = PlayerListTopbarBtn:render(app);

    Button.MouseButton1Click:Connect(function ()
        IsOpen = not IsOpen
        AdvancedTween:RunTween(RenderPlayerListHolder,{
            Easing = AdvancedTween.EasingFunctions.Exp2;
            Direction = AdvancedTween.EasingDirection.Out;
            Time = 0.6;
        },{
            Position = (IsOpen
                and (Data.HolderData.Position or UDim2.new(1,-8,0,6))
                or (Data.HolderData.ClosePosition or UDim2.new(1,-8,0,-40))
            );
            AnchorPoint = (IsOpen
                and (Data.HolderData.AnchorPoint or Vector2.new(1,0))
                or (Data.HolderData.CloseAnchorPoint or Vector2.new(1,1))
            );
        });
    end)

    return Button;
end

function render:render(Data)
    -- 플레이어 리스트 담는 스크롤 그리기
    RenderPlayerListHolder = RenderPlayerListHolder or PlayerListHolder:render(Data.HolderData);

    -- ScreenGui 만들기
    app = app or EDrow("ScreenGui",{
        Name = "QPlayerList";
        ResetOnSpawn = false;
        ZIndexBehavior = Enum.ZIndexBehavior.Global;
        WhenCreated = function (this)
            MaterialUI:Draw(this);
        end;
    },{
        PlayerListHolder = RenderPlayerListHolder;
    });

    -- 열고 닫는 버튼 만들기
    RenderPlayerListTopbarBtn = RenderPlayerListTopbarBtn or self.MakeToggleButton(Data);

    -- 플레이어 리스트 아이템 만들기
    local ScrollPosX = RenderPlayerListHolder.CanvasPosition; -- 스크롤 위치 저장
    local Items = PlayerListItem:render(Data); -- 아이템 그리기
    for I,Render in pairs(Items) do
        Render.Parent = RenderPlayerListHolder;
    end
    PlayerListHolder.RefreshLayout(); -- 리스트 길이 리프레시
    RenderPlayerListHolder.CanvasPosition = ScrollPosX; -- 스크롤 위치 불러오기
    
    return true; -- 오류 없이 넘김
end

return render;