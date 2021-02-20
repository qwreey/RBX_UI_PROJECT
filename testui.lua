--
-- lcoal MaterialUI = require(game:GetService("ReplicatedStorage"):WaitForChild("rojo"):WaitForChild("MaterialUI"));
-- setfenv(require(this),getfenv())
--

return function ()
    --local MaterialUI = require(game:GetService("ReplicatedStorage"):WaitForChild("rojo"):WaitForChild("MaterialUI"));
    --local MaterialUI = require("MaterialUI/init");
    local MaterialUI if false then MaterialUI = require("MaterialUI.init"); end
    MaterialUI = require(game:GetService("ReplicatedStorage"):WaitForChild("rojo"):WaitForChild("MaterialUI"));
    
    local AdvancedTween if false then AdvancedTween = require("AdvancedTween.init"); end
    AdvancedTween = require(game:GetService("ReplicatedStorage"):WaitForChild("rojo"):WaitForChild("MaterialUI"));

    local Store = {};

    local Render = MaterialUI.Create("ScreenGui",{
        ResetOnSpawn = false;
        Name = "FireworksLiveDemo";
    },{
        UIHolder = MaterialUI.Create("Frame",{
            BackgroundColor3 = Color3.fromRGB(45,45,45);
            Size = UDim2.new(1,0,1,0);
        },{
            Sidebar = MaterialUI.Create("Frame",{
                BackgroundColor3 = Color3.fromRGB(35,35,35);
                Size = UDim2.new(0,200,1,0);
                Position = UDim2.new(1,0,0,0);
                AnchorPoint = Vector2.new(1,0);
                WhenCreated = function(self)
                    Store.Sidebar = self;
                    return nil;
                end;
            },{
                Holder = MaterialUI.Create("Frame",{
                    ClipsDescendants = true;
                    Size = UDim2.new(1,0,1,-42);
                    Position = UDim2.new(0,0,0,42);
                    BackgroundTransparency = 1;
                    WhenCreated = function (self)
                        Store.SidebarItemsHolder = self;
                        return nil;
                    end;
                },{
                    ColorPicker = MaterialUI.Create("Frame",{
                        BackgroundTransparency = 1;
                        Size = 
                    });
                });
                Shadow = MaterialUI.Create("Shadow");
                Titlebar = MaterialUI.Create("Frame",{
                    Size = UDim2.new(1,0,0,42);
                    BackgroundColor3 = Color3.fromRGB(20,20,20);
                },{
                    Title = MaterialUI.Create("TextLabel",{
                        Text = "Fireworks";
                        BackgroundTransparency = 1;
                        TextColor3 = Color3.fromRGB(255,255,255);
                        Position = UDim2.new(0,42,0,0);
                        Size = UDim2.new(1,0,1,0);
                        TextSize = 14;
                        TextXAlignment = Enum.TextXAlignment.Left;
                    });
                    Shadow = MaterialUI.Create("Shadow");
                });
            });
        });
    });

    --MaterialUI:Draw(Render);
    Render.Parent = game:GetService("StarterGui");

    print("Load Ended!");

    return true;
end