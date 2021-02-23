local render = {}

--#region Load libs
local rojo = game:GetService("ReplicatedStorage"):WaitForChild("rojo")
local MaterialUI if false then MaterialUI = require("MaterialUI.init"); end
MaterialUI = require(rojo:WaitForChild("MaterialUI"));
local EDrow = MaterialUI.Create;
local try if false then AdvancedTween = require("try"); end
try = require(script.Parent.try);
local PlayerUtil if false then AdvancedTween = require("PlayerUtil"); end
PlayerUtil = require(script.Parent.PlayerUtil);
--#endregion
--#region Get RBX Items
local UDim2 = UDim2;
local Enum = Enum;
local Vector2 = Vector2;
--#endregion

--#region Settings / Global
local GlobalFont = Enum.Font.Gotham;
--#endregion

--#region EDrow 대충 설명
-- EDrow 함수는 인자로 3개 받음(보통의 경우)
-- 1번째는 클래스명, 2번째는 프로퍼티들, 3번째는 자식 개체 담은 테이블
-- 1번째는 함수나 테이블로도 쓰일 수 있고 Button 이나 CheckBox 같이 커스텀 클래스도 존재함
-- 2번째 프로퍼티 테이블에 WhenCreated 에 함수 넣으면 해당 개체가 만들어질때 self 넘겨줌
-- 3번째는 {Name = Child;} 로 이루워짐
-- 이걸 스텍 쌓을수도 있음
-- EDrow("Frame",{
--     BackgroundTransparency = 1;   
-- },{
--     EDrow("Frame",{
--         BackgroundTransparency = 1;   
--     },{
--         ...
--     });
-- });
-- 자세한건 MaterialUI 에 Create 를 참고 바람...
--#endregion

local Connection = {}; -- 나중에 이걸로 바인딩 지움
local LastRender = {}; -- 나중에 이걸로 UI 지움

---@param PClass userdata Player Instance
---@param DisplayIndex integer Display Order
---@param Leaderstats table Leaderstats data
---@return userdata Instance RUI-Render Object
---@see 플레이어 리스트 아이템 하나 그리기
function render.PlayerItem(PlayerClass,DisplayIndex,Leaderstats)
    local Store = {}
    return EDrow("ImageLabel",{
        BackgroundTransparency = 1;
        Size = UDim2.new(1,0,0,28);
        LayoutOrder = DisplayIndex or 1;
        ImageColor3 = Color3.fromRGB(0,0,0);
        ImageTransparency = 0.5;
        WhenCreated = function (this)
            MaterialUI:SetRound(this,50);
        end;
    },{
        -- 텍스트 렌더링
        PlayerNameLabel = EDrow("TextLabel",{
            Text = PlayerClass.Name;
            TextSize = 14;
            Font = GlobalFont;
            TextColor3 = Color3.fromRGB(255,255,255);
            BackgroundTransparency = 1;
            Size = UDim2.new(1,-32,1,0);
            Position = UDim2.fromOffset(32,0);
            TextXAlignment = Enum.TextXAlignment.Left;
            TextTruncate = Enum.TextTruncate.AtEnd;
            WhenCreated = function (this)
                Store.NameText = this;
            end
        });
        -- 썸네일 렌더링 (캐릭터 프필 가져옴)
        PlayerImage = EDrow("ImageLabel",{
            Image = try(PlayerUtil.GetPlayerIcon,PlayerClass.UserId):err(function (errinfo)
                warn("an error occurred on loading player image");
                warn(errinfo);
                return ""; -- error 잡히면 일단 이미지 비움
            end):getreturn();
            Size = UDim2.new(1,0,1,0);
            SizeConstraint = Enum.SizeConstraint.RelativeYY;
            Position = UDim2.new(0,0,0,0);
            BackgroundTransparency = 1;
            -- 귀찮으니깐 크기는 그냥...
        },{
            -- 둥글게 적용
            EDrow("UICorner",{
                CornerRadius = UDim.new(1,0);
            });
        });
        -- 리더보드 렌더링
        Leaderstats = EDrow("Frame",{
            Size = UDim2.fromScale(1,1);
            BackgroundTransparency = 1;
            WhenCreated = function (this)
                if not Leaderstats then
                    return nil;
                end
                
                -- 리더스텟을 그림
                local TotalLeaderstatsSize = 0;
                for Index,Stats in pairs(Leaderstats) do
                    TotalLeaderstatsSize = TotalLeaderstatsSize + (Stats.Size or 50);
                    local Label = EDrow("TextLabel",{
                        Size = UDim2.new(0,Stats.Size or 50,1,0);
                        LayoutOrder = Index;
                        Parent = this;
                        Font = GlobalFont;
                        TextSize = 11;
                        Text = "";
                        ClipsDescendants = true;
                        BackgroundTransparency = 1;
                        TextColor3 = Color3.fromRGB(255,255,255);
                    },{
                        -- 경계선
                        Div = EDrow("Frame",{
                            BackgroundColor3 = Color3.fromRGB(190,190,190);
                            BackgroundTransparency = 0.4;
                            Size = UDim2.new(0,1,0.7,0);
                            AnchorPoint = Vector2.new(0,0.5);
                            Position = UDim2.fromScale(0,0.5);
                        });
                    });

                    local function Refresh()
                        Label.Text = Stats.GetValue(PlayerClass);
                    end
                    
                    Connection[#Connection+1] = Stats.BindToChanged(PlayerClass,Refresh);
                    Refresh();
                end
                
                -- 이름 크기지정
                Store.NameText.Size = UDim2.new(1,-Store.NameText.Position.X.Offset - TotalLeaderstatsSize,1,0);

                return true;
            end;
        },{
            ListLayOut = EDrow("UIListLayout",{
                SortOrder = Enum.SortOrder.LayoutOrder;
                FillDirection = Enum.FillDirection.Horizontal;
                HorizontalAlignment = Enum.HorizontalAlignment.Right;
            });
        });
    });
end

---@see 맨 위에 Name | Leaderstats 같이 라벨 쓰는 함수
function render.Header(Leaderstats)
    return EDrow("Frame",{
        BackgroundTransparency = 1;
        Size = UDim2.new(1,0,0,20);
        --Size = UDim2.new(0,170,0,28); --<< Layout;
        --Position = << Layout;
        LayoutOrder = -255;
    },{
        -- 분리선
        Div = EDrow("Frame",{
            Size = UDim2.new(1,-18,0,1);
            Position = UDim2.new(0.5,0,1,-1);
            AnchorPoint = Vector2.new(0.5,0);
            BackgroundColor3 = Color3.fromRGB(150,150,150);
            BackgroundTransparency = 0.1;
        });
        -- 텍스트 렌더링
        PlayerNameLabel = EDrow("TextLabel",{
            Text = "Name";
            TextSize = 13;
            Font = GlobalFont;
            TextColor3 = Color3.fromRGB(0,0,0);
            BackgroundTransparency = 1;
            Size = UDim2.fromScale(1,1);
            Position = UDim2.fromOffset(8,0);
            TextXAlignment = Enum.TextXAlignment.Left;
        });
        -- 리더보드 렌더링
        Leaderstats = EDrow("Frame",{
            Size = UDim2.fromScale(1,1);
            BackgroundTransparency = 1;
            WhenCreated = function (this)
                if not Leaderstats then
                    return nil;
                end
                
                -- 리더스텟을 그림
                for Index,Stats in pairs(Leaderstats) do
                    local Label = EDrow("TextLabel",{
                        Size = UDim2.new(0,Stats.Size or 50,1,0);
                        LayoutOrder = Index;
                        Text = Stats.Name;
                        Font = GlobalFont;
                        TextSize = 13;
                        TextColor3 = Color3.fromRGB(0,0,0);
                        BackgroundTransparency = 1;
                        Parent = this;
                    });
                end
            end;
        },{
            ListLayOut = EDrow("UIListLayout",{
                SortOrder = Enum.SortOrder.LayoutOrder;
                FillDirection = Enum.FillDirection.Horizontal;
                HorizontalAlignment = Enum.HorizontalAlignment.Right;
            });
        });
    });
end

--@param PData table Player Data array
--@return table Array RUI-Render Object Array
--@see render player list
function render:render(Data)
    -- 렌더 초기화
    local OldConnection = Connection;
    Connection = {};

    local PlayerData = Data.Players; -- 플레이어가 담긴 테이블
    local Leaderstats = Data.Leaderstats; -- 플레이어에 대해서 리더스텟 그리기
    local Sort = Data.Sort; -- 플레이어를 정렬하는 함수

    -- 정렬하는 함수 있으면 정렬
    if Sort then
        PlayerData = Sort(PlayerData);
    end

    -- 그리기
    local list = {};
    list[1] = self.Header(Leaderstats); -- 헤더 그리기
    for DisplayOrder,PlayerClass in pairs(PlayerData) do
        list[DisplayOrder + 1] = self.PlayerItem(PlayerClass,DisplayOrder,Leaderstats);
    end

    -- 이전 커넥션 제거 (리더스텟 바뀜 트래킹이라던가)
    for Index,Unbind in pairs(OldConnection) do
        if Unbind then
            Unbind()
        end
        Connection[Index] = nil;
    end
    -- 이전 UI 제거
    for Index,Item in pairs(LastRender) do
        Item:Destroy();
        LastRender[Index] = nil;
    end

    LastRender = list; -- 나중에 지울 수 있게 만들기
    return list;
end

return render;