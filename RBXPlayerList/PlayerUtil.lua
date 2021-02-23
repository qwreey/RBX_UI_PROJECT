-- 플레이어 들어옴, 플레이어 나감 감지
-- 플레이어 가져오기
-- 등의 플레이어 핸들링을 위한 라이브러리

local module = {}
local Players = game:GetService("Players")

-- 기본 플레이어 가져오기
function module:GetPlayers()
    return Players:GetPlayers();
    --return Players:GetChildren();
end

-- 플레이어 나감, 들어옴을 감지하기
function module:BindToPlayerChanged(func)
    local BindRemoving = Players.PlayerRemoving:Connect(function ()
        -- 플레이어가 나가고 플레이어가 Players 서비스에서 제거되려면
        -- worker 가 한번 돌 수 있도록 양보해야함
        wait();
        func();
    end);
    local BindAdded = Players.PlayerAdded:Connect(func);
    return function () -- unbind
        if BindRemoving then
            BindRemoving:Disconnect();
            BindRemoving = nil;
        end
        if BindAdded then
            BindAdded:Disconnect();
            BindAdded = nil;
        end
    end;
end

-- 기본 플레이어 아이콘 가져오기
function module.GetPlayerIcon(id)
    return Players:GetUserThumbnailAsync(
        tonumber(id),
        Enum.ThumbnailType.HeadShot,
        Enum.ThumbnailSize.Size60x60
    );
end

return module;