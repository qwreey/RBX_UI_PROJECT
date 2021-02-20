local module = {}
local Players = game:GetService("Players")

function module:GetPlayers()
    return Players:GetChildren()
end

function module:BindToPlayerLeave(func)
    Players.PlayerRemoving()
end

function module.GetPlayerIcon(id)
    return Players:GetUserThumbnailAsync(
        tonumber(id),
        Enum.ThumbnailType.HeadShot,
        Enum.ThumbnailSize.Size60x60
    );
end

return module;