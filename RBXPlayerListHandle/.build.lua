--local Class = require "MaterialUI.Module.Class"

-- 테스트로 렌더링 해보기 위해서 쓰여진 코드
-- 실제로 사용하면 안됩니다

local workspace = workspace;
return {
    Drow = function ()
        local UI = require(game:GetService("ReplicatedStorage"):WaitForChild("rojo"):WaitForChild("RBXPlayerListHandle"):WaitForChild("playerlist.ui"));
        local UIRender = UI:render({
            Players = {
                {
                    Name = "[CLASSIFIED]";--"Neko_Hik4ri";
                    UserID = 457565474;
                    ClassName = "Player";
                    leaderstats = {Test = 5};
                };
                {
                    Name = "[CLASSIFIED]";--"nex12002";
                    UserID = 204105561;
                    ClassName = "Player";
                    leaderstats = {Test = 2};
                };
            };
            Leaderstats = {
                [1] = {
                    Name = "Leaderstats Test";
                    Size = 32;
                    GetValue = function (Player)
                        return tostring(Player.leaderstats.Test);
                        --return Player:WaitForChild("leaderstats"):WaitForChild("Test").Value
                    end;
                    BindToChanged = function (Player,func)
                        --local Connect = Player:WaitForChild("leaderstats"):WaitForChild("Test"):GetPropertyChangedSignal("Value"):Connect(func);
                        
                        -- return unbind function
                        return function ()
                            if Connect then
                                Connect:Disconnect()
                            end
                            return true;
                        end;
                    end;
                }
            };
            Sort = nil;
        });

        for I,Render in pairs(UIRender) do
            Render.Parent = workspace;
        end
    end;
};

-- Renderlib > MaterialUI