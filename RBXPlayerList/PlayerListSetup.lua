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
    local function Render()
        Data.Players = PlayerUtil:GetPlayers();
        PlayerList:render(Data);
        return nil;
    end
    
    -- 렌더하기
    PlayerUtil:BindToPlayerChanged(Render);
    Render();

    -- 기본 플레이어 리스트 지우기
    game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList,false);
end;

return module