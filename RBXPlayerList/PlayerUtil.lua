-- 플레이어 들어옴, 플레이어 나감 감지
-- 플레이어 가져오기
-- 등의 플레이어 핸들링을 위한 라이브러리

local module = {}
local Players = game:GetService("Players")

function module:GetPlayers()
    return Players:GetChildren();
end

function module:BindToPlayerChanged(func)
    local BindRemoving = Players.PlayerRemoving:Connect(func);
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

function module.GetPlayerIcon(id)
    return Players:GetUserThumbnailAsync(
        tonumber(id),
        Enum.ThumbnailType.HeadShot,
        Enum.ThumbnailSize.Size60x60
    );
end

return module;