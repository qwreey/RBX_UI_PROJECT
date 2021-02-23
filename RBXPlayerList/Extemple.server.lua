local Players = game:GetService("Players");

-- move this to ServerScriptService
-- ServerScriptService 로 이 스크립트를 옮기세요

Players.PlayerAdded:Connect(function (Player)
    local Leaderstats = Instance.new("Folder");
    Leaderstats.Name = "leaderstats";

    local TestValue = Instance.new("IntValue");
    TestValue.Name = "Test";
    TestValue.Parent = Leaderstats;

    spawn(function ()
        while wait(1) do
            TestValue.Value = TestValue.Value + 1;
        end
    end);

    Leaderstats.Parent = Player;
    return;
end);