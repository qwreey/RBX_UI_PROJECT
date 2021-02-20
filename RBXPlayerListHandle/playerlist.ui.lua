local render = {}

--#region Load libs
local MaterialUI if false then MaterialUI = require("MaterialUI.init"); end
MaterialUI = require(game:GetService("ReplicatedStorage"):WaitForChild("rojo"):WaitForChild("MaterialUI"));
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

local EDrow = MaterialUI.Create

local function getPImage()
    return ""
end

--@param PClass userdata Player Instance
--@param DisplayIndex integer Display Order
--@return userdata Instance RUI-Render Object
--@see Player => RUI
function render.PlayerItem(PClass,DisplayIndex)
    return EDrow("ImageLabel",{
        BackgroundTransparency = 1;
        Size = UDim2.new(0,170,0,28); --<< Layout;
        --Position = << Layout;
        LayoutOrder = DisplayIndex or 1;
        ImageColor3 = Color3.fromRGB(0,0,0);
        ImageTransparency = 0.5;
        WhenCreated = function (self)
            MaterialUI:SetRound(self,50)
        end;
    },{
        -- 텍스트 렌더링
        PlayerNameLabel = EDrow("TextLabel",{
            Text = PClass.Name;
            TextSize = 14;
            Font = Enum.Font.Gotham;
            TextColor3 = Color3.fromRGB(255,255,255);
            BackgroundTransparency = 1;
            Size = UDim2.fromScale(1,1);
            Position = UDim2.fromOffset(32,0);
            TextXAlignment = Enum.TextXAlignment.Left;
        });
        -- 썸네일 렌더링
        PlayerImage = EDrow("ImageLabel",{
            Image = try(PlayerUtil.GetPlayerIcon,PClass.UserID):err(function (errinfo)
                warn("an error occurred on loading ");
                warn(errinfo);
                return ""; -- error 잡히면 일단 이미지 비움
            end):getreturn();
            Size = UDim2.new(1,0,1,0);
            SizeConstraint = Enum.SizeConstraint.RelativeYY;
            Position = UDim2.new(0,0,0,0);
            BackgroundTransparency = 1;
            -- 귀찮으니깐 크기는 그냥...
        },{
            EDrow("UICorner",{
                CornerRadius = UDim.new(1,0)
            });
        });
    });
end

--@param PData table Player Data array
--@return table Array RUI-Render Object Array
--@see render player list
function render:render(PData)
    local list = {};

    for I,PClass in pairs(PData) do
        list[I] = self.PlayerItem(PClass);
    end

    return list;
end

return render;