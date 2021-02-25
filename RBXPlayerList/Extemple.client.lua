-- TODO : 헤더 부분 편집할수 있도록 API 수정

--#region Load libs
local rojo = game:GetService("ReplicatedStorage"):WaitForChild("rojo")
local MaterialUI if false then MaterialUI = require("MaterialUI.init"); end
MaterialUI = require(rojo:WaitForChild("MaterialUI"));
local EDrow = MaterialUI.Create;
--#endregion
local PlayerListSetup = require(game:GetService("ReplicatedStorage"):WaitForChild("rojo"):WaitForChild("RBXPlayerList"):WaitForChild("PlayerListSetup"));

-- move this to ReplicatedFirst
-- ReplicatedFirst 로 이 스크립트를 옮기세요

PlayerListSetup.init({
    -- 만약 플레이어 리스트를 조작(이름을 가린다던가, 리더보드를 ? 로 만든다던가)
    -- 해야하는 경우가 있다면 여기에 함수를 두세요
    -- 그러면 플레이어를 가져올 때 이 함수를 호출합니다,
    -- 함수는 플레이어 리스트를 반환하면 됩니다, 순서는 sort 가 있는경우 sort 가 실행
    -- 되기 때문에 신경쓸 필요 없습니다
    -- 다음과 같은 반환으로 완전히 커스터마이징 할 수 있습니다
    -- GetPlayerFunc = function ()
    --     return {
    --         {
    --             Name = "TestPlayer"; -- 이름
    --             UserId = 0; -- 아이디, 기본적으로 플레이어 아이콘을 불러오기 위해 사용됩니다, 소팅을 위해서도 사용되므로 모두 달라야 합니다
    --             Leaderstats = workspace.TestLeaderstats; -- 리더 스텟은 원하는데로 연결
    --         };
    --     };
    -- end;
    --
    -- 예시 : 플레이어 이름을 모두 ? 로 바꾸고 가상 플레이어 생성
    -- GetPlayerFunc = function()
    --     -- 기존 플레이어 가져와서 이름을 ???? 로 바꾸기
    --     local list = {};
    --     for Index,Player in pairs(game.Players:GetPlayers()) do
    --         list[Index] = {
    --             Name = "????";
    --             UserId = Player.UserId;
    --             leaderstats = Player:WaitForChild("leaderstats");
    --         }
    --     end
    --     -- 커스텀 플레이어 추가
    --     list[#list+1] = {
    --         Name = "Custom Player",
    --         UserId = 235968379,
    --         leaderstats = EDrow("Folder",{ },{
    --             Test = EDrow("IntValue",{
    --                 Value = 5;
    --             });
    --         });
    --     }  
    --     return list; -- 리턴
    -- end;
    GetPlayerFunc = nil;

    -- 플레이어를 어떻게 정렬할것인지 소팅 구조를 짜면 됩니다
    -- 들어오는건 플레이어들이 담긴 테이블, 리턴해야될 것은 소팅된 테이블입니다
    -- 리더보드 순으로 소팅하거나 이름순으로 소팅하거나 랭크순으로 소팅하는 등 여러가지 방법으로 정렬할 수 있습니다
    -- 아래의 기본값은 이름순으로 플레이어를 정렬합니다
    -- 자세한건 https://www.lua.org/pil/19.3.html lua 자습서를 참고하세요
    --
    -- 예시 : Test 라는 리더스텟의 값에 따라 정렬하기
    -- Sort = function (list)
    --     table.sort(list,function (a,b)
    --         return a.leaderstats.Test.Value < b.leaderstats.Test.Value;
    --     end)
    --     return list;
    -- end;
    Sort = function (list)
        table.sort(list,function (a,b)
            return a.Name < b.Name;
        end);
        return list;
    end;

    -- 리더스텟의 값이 바뀔 때 다시 소팅될지 여부입니다
    -- 기본적으로 이름순으로만 소팅을 사용하는 경우에는 최적화적인 이유로 false 로 두어도 상관 없습니다
    -- 단 리더스텟 순으로 소팅을 사용하는 경우 이 값이 true 이여야지 정상적으로 값이 바뀔 때 마다
    -- 순서가 변경됩니다
    -- 주의 : 이 설정이 true 이면 많은 리더스텟을 포함하고 많은 인원이 존제하는 게임의 경우 많은 리소스를 소비 할 수 있습니다
    --        만약 극한의 리소스 절약이 필요한 경우 메인 코드를 수정하세요
    ResortOnLeaderstatsChanged = false;

    -- 그룹 랭크에 따라 소팅하는 것 처럼
    -- 완전히 커스텀된 소팅 방법을 사용하는 경우
    -- 순서가 바뀌였을때 다시 소팅해야될 필요가 있을 수 있습니다
    -- 따라서 BindSort 함수로 소팅 주기를 마음껏 바꿀 수 있습니다
    --
    -- 예시 : 2초마다 소팅하기
    -- BindSort = function (RunSort)
    --     spawn(function()
    --         while wait(2) do
    --             RunSort()
    --         end
    --     end)
    -- end;
    BindSort = nil;

    -- 만약 플레이어 아이콘을 조작하고 싶다면 여기에 함수를 추가하세요
    -- 그러면 아이콘을 불러올때 이 함수를 호출합니다
    -- 함수에는 인자로 플레이어를 넘겨줍니다
    -- 리턴값은 string 이 된다면 바로 이미지로 적용합니다
    -- 만약 리턴값이 인스턴스인 경우에는 그걸 이미지로 사용합니다
    -- 완전히 커스터마이징 하기 위해 인스턴스를 사용하는 경우 크기를 28*28 로 맞추는것이 좋습니다
    --
    -- 예시 : 그냥 파란 원을 띄웁니다
    -- GetPlayerIcon = function (Player)
    --     return EDrow("ImageLabel",{
    --          ImageColor3 = Color3.fromRGB(80,80,255);
    --          Size = UDim2.fromOffset(28,28);
    --          BackgroundTransparency = 1;
    --          WhenCreated = function(this)
    --              MaterialUI:SetRound(this,100);
    --          end;
    --     });
    -- end;
    --
    -- 예시 : 별모양 아이콘을 띄웁니다
    -- GetPlayerIcon = function (Player)
    --     return "http://www.roblox.com/asset/?id=6031265978";
    -- end;
    --
    -- 예시 : 상체부터 머리까지 프로필 사진을 가져옵니다
    -- GetPlayerIcon = function (Player)
    --     return Players:GetUserThumbnailAsync(
    --         tonumber(Player.UserId),
    --         Enum.ThumbnailType.AvatarBust,
    --         Enum.ThumbnailSize.Size60x60
    --     );
    -- end;
    -- 이 설정란이 비어있으면 PlayerUtil.lua 에 GetPlayerIcon 함수가 자동으로 사용됩니다
    GetPlayerIcon = nil;

    -- 만약 플레이어 아이템 하나하나를 꾸미고 싶다면 (뭐 배경 사진을 넣는다던가, 기본 모양을 바꾼다던가 등등)
    -- 여기에 함수를 넣어서 바꿀 수 있습니다, 아이템 하나가 렌더된 후 호출됩니다
    -- 인자로 UI 개체,플레이어 를 넘겨줍니다
    -- [이 기능은 실험적이며 예상치 못한 결과를 불러올 수 있습니다]
    --
    -- 예시 : 프레임 하나 UI 배경으로 추가하기
    -- EditItem = function (UI,Player)
    --     EDrow("Frame",{
    --         Parent = UI;
    --         Size = UDim2.fromScale(1,1);
    --         ZIndex = -5;
    --     });
    --     return;
    -- end;
    EditItem = nil;

    -- 만약 헤더 부분 (Name 리더스탯 같이 맨 위에 있는 라벨)을 꾸미고 싶다면 (위에처럼 배경 사진을 넣는다던가, 기본 모양을 바꾼다던가)
    -- 여기에 함수를 넣어서 바꿀 수 있습니다, 헤더가 렌더 된 후 호출됩니다
    -- 인자로 UI 개체, 리더스텟 정보를 넘겨줍니다
    -- [이 기능은 실험적이며 예상치 못한 결과를 불러올 수 있습니다]
    --
    -- 예시 : 프레임 하나 UI 배경으로 추가하기
    -- EditHeader = function (UI,LeaderstatsData)
    --     EDrow("Frame",{
    --         Parent = UI;
    --         Size = UDim2.fromScale(1,1);
    --         ZIndex = -5;
    --     });
    --     return;
    -- end;
    EditHeader = nil;

    -- 리더보드를 불러오는 방법을 조정합니다, 비어있으면 리더보드가 출력되지 않습니다
    Leaderstats = {
        [1] = {
            Name = "Test"; -- 이 리더보드를 표시할 이름
            Size = 50; -- 이 리더보드가 가지는 X 크기 (너비)
            GetValue = function (Player) -- 값을 가져오는 함수
                -- 해당 값을 반환하면 됩니다
                return tostring((Player.leaderstats or Player:WaitForChild("leaderstats")):WaitForChild("Test").Value);
            end;
            BindToChanged = function (Player,func)
                -- 값이 바뀌였을때 함수를 실행해주면 됩니다
                local Connect = (Player.leaderstats or Player:WaitForChild("leaderstats")):WaitForChild("Test"):GetPropertyChangedSignal("Value"):Connect(func);
                
                -- return unbind function
                -- 그리고 이 연결을 끊어주는 함수를 반환하면 됩니다
                return function ()
                    if Connect then
                        Connect:Disconnect();
                    end
                    return true;
                end;
            end;
        };
        -- [2] = {...};
        -- [3] = {...};
        -- 개속 추가할 수 있습니다, 순서는 디스플레이에 영향을 미칩니다,
        -- 위에 있는것 부터 왼쪽에서 시작해서 아래로 내려갈수록 오른쪽에 배치됩니다
    };

    -- 유저를 클릭했을때 상호작용 창이 뜰지 결정합니다
    -- 친구추가, 아바타 보기, 블럭 등을 위해서 사용됩니다
    -- [아직 구현되지 않음]
    EnableUserMenu = true;

    -- 유저 상호작용 창에 어떤 버튼들을 표시할것인지 지정합니다
    -- [아직 구현되지 않음]
    UserMenuItems = {
        FriendButton = true; -- 친구 추가/제거 버튼
        ExamineAvatar = true; -- 아바타 정보보기 버튼
        BlockButton = true; -- 차단 추가/제거 버튼
    };

    -- 친구인 플레이어는 친구 아이콘을 띄워즘
    -- 블럭된 플레이어는 X 표시 띄워줌
    -- [아직 구현되지 않음]
    EnableInfoIcon = true;

    -- 홀더 크기, 위치에 관한 설정입니다
    -- Close 가 붙은 프로퍼티는 창이 닫힐 때 사용되는 프로퍼티입니다
    -- 닫힘 효과를 더 조정하고 싶다면 PlayerList.lua 를 편집하세요
    HolderData = {
        Size = UDim2.new(0,225,0,232);
        Position = UDim2.new(1,-8,0,6);
        AnchorPoint = Vector2.new(1,0);
        ClosePosition = UDim2.new(1,-8,0,-40);
        CloseAnchorPoint = Vector2.new(1,1);
    };
})