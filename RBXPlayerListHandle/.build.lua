--local Class = require "MaterialUI.Module.Class"
local workspace = workspace;
return {
    Drow = function ()
        local UI = require(game:GetService("ReplicatedStorage"):WaitForChild("rojo"):WaitForChild("RBXPlayerListHandle"):WaitForChild("playerlist.ui"));
        local UIRender = UI:render({
            {
                Name = "Neko_Hik4ri";
                UserID = 457565474;
                ClassName = "Player";
            };
            {
                Name = "nex12002";
                UserID = 204105561;
                ClassName = "Player";
            };
        });

        for I,Render in pairs(UIRender) do
            Render.Parent = workspace;
        end
    end;
};

-- Renderlib > MaterialUI