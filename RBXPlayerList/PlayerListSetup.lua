local module = {};

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

local PlayerList = require(script.Parent.PlayerList);
local PlayerUtil = require(script.Parent.PlayerUtil);

function module.init(Data)
    -- 초기화
    PlayerList:init(Data);

    -- 렌더 함수 만들기
    local function Render()
        Data.Players = Data.GetPlayerFunc and Data.GetPlayerFunc() or PlayerUtil:GetPlayers();
        PlayerList:render(Data);
        return nil;
    end
    
    -- 렌더하기
    PlayerUtil:BindToPlayerChanged(Render);
    Render();

    -- 기본 플레이어 리스트 지우기, 맨 뒤에 놔둔 이유는 렌더중 오류가 발생하면
    -- 기본 플레이어 리스트가 살아 있도록 하기 위함
    game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList,false);
end;

return module