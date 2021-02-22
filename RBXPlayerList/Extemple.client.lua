local PlayerListSetup = require(game:GetService("ReplicatedStorage"):WaitForChild("rojo"):WaitForChild("RBXPlayerList"):WaitForChild("PlayerListSetup"));

-- move this to ReplicatedFirst
-- ReplicatedFirst 로 이 스크립트를 옮기세요

PlayerListSetup.init({
    Leaderstats = {
        [1] = {
            Name = "Leaderstats Test";
            Size = 32;
            GetValue = function (Player)
                return tostring(0);
                --return Player:WaitForChild("leaderstats"):WaitForChild("Test").Value
            end;
            BindToChanged = function (Player,func)
                --local Connect = Player:WaitForChild("leaderstats"):WaitForChild("Test"):GetPropertyChangedSignal("Value"):Connect(func);
                
                -- return unbind function
                return function ()
                    --if Connect then
                    --    Connect:Disconnect()
                    --end
                    return true;
                end;
            end;
        }
    };
    Sort = nil;
    HolderData = {
        Size = UDim2.new(0,225,0,232);
        Position = UDim2.new(1,-8,0,6);
        AnchorPoint = Vector2.new(1,0);
        ClosePosition = UDim2.new(1,-8,0,-40);
        CloseAnchorPoint = Vector2.new(1,1);
    };
})