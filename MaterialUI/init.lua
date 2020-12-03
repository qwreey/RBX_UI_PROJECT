--[[
	THIS IS ONLY WORKING ON Global ZIndex Behavior,
	if use this in Sibling ZIndex Behavior, this is will break
	
	Component Info (DOC)
	https://sites.google.com/view/rbx-material-ui/component
]]

-- TODO : 다중 위젯 지원

if not script then
	error("This lua module is only working on roblox")
end

-- init
do 
	local resource = script:FindFirstChild("resource")
	if resource then
		if resource:IsA("ModuleScript") then
			local Items = require(resource)
			for _,Item in pairs(Items:GetChildren()) do
				Item.Parent = script
			end
			Items:Destroy()
		end
		
		for _,Item in pairs(resource:GetChildren()) do
			Item.Parent = script
		end
		resource:Destroy()
	end
end

--[[
	Var 1.18
	
	Log : 
		1.15
			auto destroy tween
			TextField : Add error effect in Placeholder
	
	
	Todo :
	스위치 리플 형식 다시 쓰기
	
	글로벌 에니메이션 속도
	
	Tween Color 
	
	Todo : Dialog
	Todo : Steper(need?)
	Todo : DropDown Menu
	Todo : Window
	Todo : ColorPicker
	Todo : Banner
	
	Todo : Add Archivable(disable clone)
	Todo : Round ImageLabel
	Todo : 스넥바 스타일 "채우짐" 추가
	Todo : disalbed silder, update
	텍스트 크기 가져오기(택스트 바운드)
	스크롤바 다시로드 (위로 당겨서 )
	
	Destory Tween
	Use Tween.Completed:Wait()
	
	fix DockWidget ripple bug
	
	GUIOBJ:SetTheme(ThemeName)
	
	보류된 클레스
	Todo : DatePicker(need?)
	Todo : TimePicker(need?)
	Todo : Backdrop(need?)
	Todo : Appbar
	Todo : TextField style 'Infield'(need?)
	Todo : Stick Switch, 박스형, 채워진 (트렉 높이 = 슬라이더 크기)
	Todo : support button touch input
	Todo : support GamePad input
]]
local Class = require(script.Module.Class)
local GetRippleSize = require(script.Module.GetRippleSize)
local Round = require(script.Module.Round)

local UserInputService = game:GetService("UserInputService")
local Tween = game:GetService("TweenService")
local PreLoad = game:GetService("ContentProvider")
local TextService = game:GetService("TextService")
local Run = game:GetService("RunService")

local LocalPlayer = game.Players.LocalPlayer
local Mouse = LocalPlayer and LocalPlayer:GetMouse()

local PreLoadLoadingC = false
local DockWidget = false

local module = {
	script = script;
	UserInputService = UserInputService;
	Mouse = Mouse;
	TotalInstance = Class.TotalInstance;
	RemoveAll = Class.RemoveAll;
	GetIdFromInstance = Class.GetIdFromInstance;
	GetInstanceFromId = Class.GetInstanceFromId;
	Items = Class.Items;
	ClassManager = Class;
	ColorPalette = nil; -- WIP
	CEnum = {
		["IconButtonStyle"] = {
			WithBackground = "WithBackground";
			WithOutBackground = "WithOutBackground";
		};
		["TextFieldStyle"] = {
			Text = "Text";
			Outlined = "Outlined";
			Filled = "Filled";
		};
		["ButtonStyle"] = {
			Contained = "Contained";
			Outlined = "Outlined";
			Text = "Text";
		};
	};
	Icons = nil; -- WIP
	Colors = {
		TopBar = "TopBar";
		Background = "Background";
		BackgroundHighLight = "BackgroundHighLight";
		Second = "Second";
		TextColor = "TextColor";
		Deep = "Deep";
	};
	
	CurrentTheme = "Dark";
	Themes = {
		--Default value when nothing is set
		["Dark"] = {
			["TopBar"] = Color3.fromRGB(30,30,30);
			["Background"] = Color3.fromRGB(45,45,45);
			["BackgroundHighLight"] = Color3.fromRGB(30,30,30);
			["Second"] = Color3.fromRGB(80,80,80);
			["TextColor"] = Color3.fromRGB(255,255,255);
			["Deep"] = Color3.fromRGB(20,20,20);
			
			["IconButton"] = {
				RippleColor3 = Color3.fromRGB(255,255,255);
				DisabledColor3 = Color3.fromRGB(0,0,0);
				ShadowColor3 = Color3.fromRGB(0,0,0);
				IconColor3 = Color3.fromRGB(255,255,255);
				BackgroundColor3 = Color3.fromRGB(45,45,45);
				AnimationSpeed = 1;
				ToolTipBackgroundColor3 = Color3.fromRGB(45,45,45);
				ToolTipTextColor3 = Color3.fromRGB(255,255,255);
			};
			["ToolTip"] = {
				BackgroundColor3 = Color3.fromRGB(45,45,45);
				TextColor3 = Color3.fromRGB(255,255,255);
			};
			["Silder"] = {
				BackgroundColor3 = Color3.fromRGB(125,125,125);
				SilderColor3 = Color3.fromRGB(60,145,255);
				GridColor3 = Color3.fromRGB(95, 95, 95);
				ValueLabelTextColor3 = Color3.fromRGB(255,255,255);
			};
			["IndeterminateCircle"] = {
				BackgroundColor3 = Color3.fromRGB(60,145,255);
				AnimationSpeed = 1;
			};
			["Rippler"] = {
				RippleColor3 = Color3.fromRGB(255,255,255);
				AnimationSpeed = 1;
			};
			["IndeterminateProgress"] = {
				BarColor3 = Color3.fromRGB(60,145,255);
				BackgroundColor3 = Color3.fromRGB(255,255,255);
				AnimationSpeed = 1;
			};
			["LinearProgress"] = {
				BarColor3 = Color3.fromRGB(60,145,255);
				BackgroundColor3 = Color3.fromRGB(255,255,255);
				AnimationSpeed = 1;
			};
			["Shadow"] = {
				BackgroundColor3 = Color3.fromRGB(0,0,0);
				BackgroundTransparency = 0.65;
			};
			["Switch"] = {
				TrackOffColor3 = Color3.fromRGB(150, 150, 150);
				TrackOnColor3 = Color3.fromRGB(0, 120, 170);
				ThumbOffColor3 = Color3.fromRGB(255, 255, 255);
				ThumbOnColor3 = Color3.fromRGB(60,145,255);
				AnimationSpeed = 1;
			};
			["CheckBox"] = {
				OffColor3 = Color3.fromRGB(131,131,131);
				OnColor3 = Color3.fromRGB(60,145,255);
				TextColor3 = Color3.fromRGB(255,255,255);
				AnimationSpeed = 1;
			};
			["Pointing"] = {
				AnimationSpeed = 0.5;
				Delay = 1.5;
				BackgroundColor3 = Color3.fromRGB(60,145,255);
			};
			["TreeView"] = {
				TextColor3 = Color3.fromRGB(255,255,255)
			};
			["Scroll"] = {
				DragToScroll = true;
				AnimationSpeed = 1;
				BackgroundColor3 = Color3.fromRGB(255,255,255);
				BackgroundTransparency = 0;
				ScrollBarThickness = 8;
				ScrollBarImageColor3 = Color3.fromRGB(150,150,150);
				ScrollBarImageTransparency = 0.25;
				TopImage = "rbxasset://textures/ui/Scroll/scroll-top.png";
				MidImage = "rbxasset://textures/ui/Scroll/scroll-middle.png";
				BottomImage = "rbxasset://textures/ui/Scroll/scroll-bottom.png";
			};
			["Tabs"] = {
				AnimationSpeed = 1.2;
				BackgroundColor3 = Color3.fromRGB(45,45,45);
				BackgroundTransparency = 0;
				PointerColor3 = Color3.fromRGB(60,145,255);
				PointerTransparency = 0;
				TabColor3 = Color3.fromRGB(35,35,35);
				PagePadding = 20;
				TabTextColor3 = Color3.fromRGB(255,255,255);
			};
			["TextField"] = {
				FilledColor3 = Color3.fromRGB(90,90,90);
				OnColor3 = Color3.fromRGB(60,145,255);
				OffColor3 = Color3.fromRGB(156,156,156);
				ErrorColor3 = Color3.fromRGB(255,25,25);
				PlaceholderText = "Name";
				Style = "Outlined";
				AnimationSpeed = 1;
				TextColor3 = Color3.fromRGB(255,255,255)
			};
			["Button"] = {
				Style = "Contained";
				OutlineColor3 = Color3.fromRGB(163,162,165);
				BackgroundColor3 = Color3.fromRGB(0,150,136);
				ToolTipTextColor3 = Color3.fromRGB(255,255,255);
				ToolTipBackgroundColor3 = Color3.fromRGB(45,45,45);
				TextTransparency = 0;
				TextColor3 = Color3.fromRGB(255,255,255);
				TextSize = 14;
				Font = Enum.Font.Gotham;
				IconSizeOffset = 20;
				IconColor3 = Color3.fromRGB(255,255,255);
				IconTransparency = 0;
				RoundSize = 8;
				AnimationSpeed = 1.2;
				DisabledColor3 = Color3.fromRGB(0,0,0);
				RippleColor3 = Color3.fromRGB(255,255,255);
			};
			["Snackbars"] = {
				OpenTime = 4.5;
				AnimationSpeed = 1;
				TextSize = 16;
				Font = Enum.Font.Gotham;
				TextColor3 = Color3.fromRGB(255,255,255);
				ClosePosition = UDim2.new(0,8,1,56);
				Position = UDim2.new(0,8,1,-8);
				ZIndex = 1;
			};
			["RadioButton"] = {
				RippleColor3 = Color3.fromRGB(255,255,255);
				OffColor3 = Color3.fromRGB(180,180,180);
				OnColor3 = Color3.fromRGB(0,120,255);
				SortOrder = Enum.SortOrder.LayoutOrder;
				BackgroundTransparency = 0;
				BackgroundColor3 = Color3.fromRGB(45,45,45);
				AnimationSpeed = 1;
			};
		};
		
		["Light"] = {
			["TopBar"] = Color3.fromRGB(65,150,255);
			["Background"] = Color3.fromRGB(255,255,255);
			["BackgroundHighLight"] = Color3.fromRGB(250,250,250);
			["Second"] = Color3.fromRGB(57,116,255);
			["TextColor"] = Color3.fromRGB(0,0,0);
			["Deep"] = Color3.fromRGB(1,82,220);
			
			["IconButton"] = {
				RippleColor3 = Color3.fromRGB(0,0,0);
				DisabledColor3 = Color3.fromRGB(0,0,0);
				ShadowColor3 = Color3.fromRGB(0,0,0);
				IconColor3 = Color3.fromRGB(0,0,0);
				BackgroundColor3 = Color3.fromRGB(57,116,255);
				AnimationSpeed = 1;
				ToolTipBackgroundColor3 = Color3.fromRGB(45,45,45);
				ToolTipTextColor3 = Color3.fromRGB(255,255,255);
			};
			["ToolTip"] = {
				BackgroundColor3 = Color3.fromRGB(45,45,45);
				TextColor3 = Color3.fromRGB(255,255,255);
			};
			["Silder"] = {
				BackgroundColor3 = Color3.fromRGB(125,125,125);
				SilderColor3 = Color3.fromRGB(57,116,255);
				GridColor3 = Color3.fromRGB(95, 95, 95);
				ValueLabelTextColor3 = Color3.fromRGB(255,255,255);
			};
			["IndeterminateCircle"] = {
				BackgroundColor3 = Color3.fromRGB(57,116,255);
				AnimationSpeed = 1;
			};
			["Rippler"] = {
				RippleColor3 = Color3.fromRGB(0,0,0);
				AnimationSpeed = 1;
			};
			["IndeterminateProgress"] = {
				BarColor3 = Color3.fromRGB(57,116,255);
				BackgroundColor3 = Color3.fromRGB(200,200,200);
				AnimationSpeed = 1;
			};
			["LinearProgress"] = {
				BarColor3 = Color3.fromRGB(57,116,255);
				BackgroundColor3 = Color3.fromRGB(200,200,200);
				AnimationSpeed = 1;
			};
			["Shadow"] = {
				BackgroundColor3 = Color3.fromRGB(0,0,0);
				BackgroundTransparency = 0.65;
			};
			["Switch"] = {
				TrackOffColor3 = Color3.fromRGB(150, 150, 150);
				TrackOnColor3 = Color3.fromRGB(0, 120, 170);
				ThumbOffColor3 = Color3.fromRGB(255, 255, 255);
				ThumbOnColor3 = Color3.fromRGB(57,116,255);
				AnimationSpeed = 1;
			};
			["CheckBox"] = {
				OffColor3 = Color3.fromRGB(131,131,131);
				OnColor3 = Color3.fromRGB(57,116,255);
				TextColor3 = Color3.fromRGB(0,0,0);
				AnimationSpeed = 1;
			};
			["Pointing"] = {
				AnimationSpeed = 0.5;
				Delay = 1.5;
				BackgroundColor3 = Color3.fromRGB(57,116,255);
			};
			["TreeView"] = {
				TextColor3 = Color3.fromRGB(0,0,0)
			};
			["Scroll"] = {
				DragToScroll = true;
				AnimationSpeed = 1;
				BackgroundColor3 = Color3.fromRGB(255,255,255);
				BackgroundTransparency = 0;
				ScrollBarThickness = 8;
				ScrollBarImageColor3 = Color3.fromRGB(150,150,150);
				ScrollBarImageTransparency = 0.25;
				TopImage = "rbxasset://textures/ui/Scroll/scroll-top.png";
				MidImage = "rbxasset://textures/ui/Scroll/scroll-middle.png";
				BottomImage = "rbxasset://textures/ui/Scroll/scroll-bottom.png";
			};
			["Tabs"] = {
				AnimationSpeed = 1.2;
				BackgroundColor3 = Color3.fromRGB(255,255,255);
				BackgroundTransparency = 0;
				PointerColor3 = Color3.fromRGB(57,116,255);
				PointerTransparency = 0;
				TabColor3 = Color3.fromRGB(255,255,255);
				PagePadding = 20;
				TabTextColor3 = Color3.fromRGB(0,0,0);
			};
			["TextField"] = {
				FilledColor3 = Color3.fromRGB(245,245,245);
				OnColor3 = Color3.fromRGB(57,116,255);
				OffColor3 = Color3.fromRGB(156,156,156);
				ErrorColor3 = Color3.fromRGB(255,25,25);
				PlaceholderText = "Name";
				Style = "Outlined";
				AnimationSpeed = 1;
				TextColor3 = Color3.fromRGB(0,0,0)
			};
			["Button"] = {
				Style = "Contained";
				OutlineColor3 = Color3.fromRGB(163,162,165);
				BackgroundColor3 = Color3.fromRGB(0,150,136);
				ToolTipTextColor3 = Color3.fromRGB(255,255,255);
				ToolTipBackgroundColor3 = Color3.fromRGB(45,45,45);
				TextTransparency = 0;
				TextColor3 = Color3.fromRGB(255, 255, 255);
				TextSize = 14;
				Font = Enum.Font.Gotham;
				IconSizeOffset = 20;
				IconColor3 = Color3.fromRGB(255,255,255);
				IconTransparency = 0;
				RoundSize = 8;
				AnimationSpeed = 1.2;
				DisabledColor3 = Color3.fromRGB(0,0,0);
				RippleColor3 = Color3.fromRGB(0,0,0);
			};
			["Snackbars"] = {
				OpenTime = 4.5;
				AnimationSpeed = 1;
				TextSize = 16;
				Font = Enum.Font.Gotham;
				TextColor3 = Color3.fromRGB(255,255,255);
				ClosePosition = UDim2.new(0,8,1,56);
				Position = UDim2.new(0,8,1,-8);
				ZIndex = 1;
			};
			["RadioButton"] = {
				RippleColor3 = Color3.fromRGB(255,255,255);
				OffColor3 = Color3.fromRGB(180,180,180);
				OnColor3 = Color3.fromRGB(0,120,255);
				SortOrder = Enum.SortOrder.LayoutOrder;
				BackgroundTransparency = 0;
				BackgroundColor3 = Color3.fromRGB(45,45,45);
				AnimationSpeed = 1;
			};
		};
	};
	
	DockWidgetMouse = {};
}
function module:SetMouse(NewMouse)
	Mouse = NewMouse
	module.Mouse = NewMouse
end
function module:ClassTheme(Class)
	local ClassTheme = module.Themes[module.CurrentTheme][Class.ClassName]
	if ClassTheme then
		for i,v in pairs(ClassTheme) do
			Class[i] = v
		end
	end
end
function module:GetColor(ColorName)
	local ClassTheme = module.Themes[module.CurrentTheme]
	return ClassTheme[ColorName]
end
--// 위젯용 마우스
function module:GetMouseWithObject(Object)
	if #module.DockWidgetMouse == 0 then
		return Mouse
	end
	
	for _,Item in pairs(module.DockWidgetMouse) do
		if Object:IsDescendantOf(Item.DockWidget) then
			return Item.Mouse
		end
	end
	
	return Mouse
end
function module:UseDockWidget(Widget,NewMouse)
	local LastMouse = NewMouse or Mouse
	
	local MouseHandle = Instance.new("TextButton",Widget)
	MouseHandle.BackgroundTransparency = 1
	MouseHandle.Size = UDim2.new(1,0,1,0)
	MouseHandle.ZIndex = -2147483648
	MouseHandle.Text = ""
	MouseHandle.Name = "DockWidgetMouseTracker"
	
	local Button1Down = Instance.new("BindableEvent")
	local Button1Up = Instance.new("BindableEvent")
	local Button2Down = Instance.new("BindableEvent")
	local Button2Up = Instance.new("BindableEvent")
	
	local PseudoMouse = {
		Move = MouseHandle.MouseMoved;
		WheelForward = MouseHandle.MouseWheelForward;
		WheelBackward = MouseHandle.MouseWheelBackward;
		Button1Down = Button1Down.Event;
		Button1Up = Button1Up.Event;
		Button2Down = Button2Down.Event;
		Button2Up = Button2Up.Event;
		X = 0;
		Y = 0;
		ViewSizeX = MouseHandle.AbsoluteSize.X;
		ViewSizeY = MouseHandle.AbsoluteSize.Y;
		IsPseudo = true;
		Obj = MouseHandle;
	}
	
	MouseHandle.MouseMoved:Connect(function(X,Y)
		PseudoMouse.X = X
		PseudoMouse.Y = Y
	end)
	
	MouseHandle:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
		PseudoMouse.ViewSizeX = MouseHandle.AbsoluteSize.X
		PseudoMouse.ViewSizeY = MouseHandle.AbsoluteSize.Y
	end)
	
	MouseHandle.MouseButton1Down:Connect(function(X,Y)
		Button1Down:Fire(X,Y)
	end)
	MouseHandle.MouseButton1Up:Connect(function(X,Y)
		Button1Up:Fire(X,Y)
	end)
	MouseHandle.MouseButton2Down:Connect(function(X,Y)
		Button2Down:Fire(X,Y)
	end)
	MouseHandle.MouseButton2Up:Connect(function(X,Y)
		Button2Up:Fire(X,Y)
	end)
	UserInputService.InputBegan:Connect(function(Input)
		if Input.UserInputType == Enum.UserInputType.MouseButton1 then
			Button1Down:Fire(Input.Position.X,Input.Position.Y)
		elseif Input.UserInputType == Enum.UserInputType.MouseButton2 then
			Button2Down:Fire(Input.Position.X,Input.Position.Y)
		end
	end)
	UserInputService.InputEnded:Connect(function(Input)
		if Input.UserInputType == Enum.UserInputType.MouseButton1 then
			Button1Up:Fire(Input.Position.X,Input.Position.Y)
		elseif Input.UserInputType == Enum.UserInputType.MouseButton2 then
			Button2Up:Fire(Input.Position.X,Input.Position.Y)
		end
	end)
	
	
	local MouseMt = {}
	local Listener = {}
	
	setmetatable(MouseMt,Listener)
	
	Listener.__newindex = function(self,Key,Value)
		if PseudoMouse[Key] then
			PseudoMouse[Key] = Value
		else
			LastMouse[Key] = Value
		end
	end
	Listener.__index = function(self,Key)
		if PseudoMouse[Key] then
			return PseudoMouse[Key]
		else
			return LastMouse[Key]
		end
	end
	
	for Index,Item in pairs(module.DockWidgetMouse) do
		if Item.DockWidget == Widget then
			table.remove(module.DockWidgetMouse,Index)
		end
	end
	module.DockWidgetMouse[#module.DockWidgetMouse+1] = {Mouse = MouseMt, DockWidget = Widget}
	
	module:SetMouse(MouseMt)

	return MouseMt
end
function module.IconButton_New(Parent)	
	local This,FireChanged
	
	local Obj = script.Class_IconButton.IconButton:Clone()
	Obj.Parent = type(Parent) == "table" and Parent.Holder or Parent
	local Data = {
		RippleColor3 = Color3.fromRGB(255,255,255);
		Disabled = false;
		ToolTipText = "";
		Speed = 1;
		Style = "WithBackground";
		ToolTipBackgroundColor3 = Color3.fromRGB(45,45,45);
		ToolTipTextColor3 = Color3.fromRGB(255,255,255);
		RightClickRipple = true;
	}
	local ToolTipIndex = 0
	
	local Ripple
	
	local function PlayRipple()
		if Obj.Parent == nil then
			return
		end
		
		Ripple = script.Class_Ripple.Ripple:Clone()
		Ripple.ZIndex = Obj.ZIndex
		Ripple.Parent = Obj
		Ripple:TweenSize(UDim2.new(1,0,1,0),Enum.EasingDirection.Out,Enum.EasingStyle.Quint,true,0.6/Data.Speed,nil)
		Ripple.ImageColor3 = Data.RippleColor3
	end
	
	local function MouseDown()
		if Data == nil or Data.Disabled or Ripple then
			return
		end
		Obj.shadow:TweenSizeAndPosition(UDim2.new(1.32,0,1.32,0),UDim2.new(0.5,0,0.55,0),Enum.EasingDirection.Out,Enum.EasingStyle.Quint,true,0.3/Data.Speed,nil)
		PlayRipple()
	end
	Obj.MouseButton1Down:Connect(MouseDown)
	Obj.MouseButton2Down:Connect(function()
		if Data.RightClickRipple then
			MouseDown()
		end
	end)
	
	local function UnRipple()
		if Obj.Parent == nil then
			return
		end
		Obj.shadow:TweenSizeAndPosition(UDim2.new(1.2,0,1.2,0),UDim2.new(0.5,0,0.53,0),Enum.EasingDirection.Out,Enum.EasingStyle.Quint,true,0.3/Data.Speed,nil)
		if Ripple then
			local This = Ripple
			Ripple = nil
			local FadeOut = Tween:Create(This,TweenInfo.new(0.6/Data.Speed,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0),
				{ImageTransparency = 1;}
			)
			FadeOut:Play()
			FadeOut.Completed:Wait()
			This:Destroy()
			FadeOut:Destroy()
		end
	end
	Obj.MouseButton1Up:Connect(UnRipple)
	Obj.MouseButton2Up:Connect(UnRipple)
	
	local function ToolTip(Visible)
		if Data == nil then
			return
		end
		local OldToolTip = Obj:FindFirstChild("ToolTip")
		if OldToolTip and (not Visible or (Data.ToolTipText ~= "")) then
			OldToolTip.TextLabel.Text = Data.ToolTipText
			OldToolTip.Size = UDim2.new(0,OldToolTip.TextLabel.TextBounds.X + 8,0,28)
			local BgFade = Tween:Create(OldToolTip,TweenInfo.new(0.15,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0),
				{ImageTransparency = Visible and 0 or 1;}
			)
			local TextFade = Tween:Create(OldToolTip.TextLabel,TweenInfo.new(0.15,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0),
				{TextTransparency = Visible and 0 or 1;}
			)
			
			BgFade:Play()
			TextFade:Play()
			
			delay(0.15,function()
				BgFade:Destroy()
				TextFade:Destroy()
			end)
		end
	end
	
	local BackButtonOn = Tween:Create(Obj.On,TweenInfo.new(0.2/Data.Speed,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0),
		{ImageTransparency = 0.85;}
	)
	local BackButtonOff = Tween:Create(Obj.On,TweenInfo.new(0.2/Data.Speed,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0),
		{ImageTransparency = 1;}
	)
	Obj.MouseEnter:Connect(function()
		if Data.Disabled then
			return
		end
		BackButtonOn:Play()
		ToolTipIndex = ToolTipIndex + 1
		local NewIndex = ToolTipIndex
		delay(0.3,function()
			if ToolTipIndex == NewIndex then
				ToolTip(true)
			end
		end)
	end)
	Obj.MouseLeave:Connect(function()
		BackButtonOff:Play()
		UnRipple()
		ToolTipIndex = ToolTipIndex + 1
		ToolTip(false)
	end)
	local Properties = Class:MakeDictionary({
		"Visible";
		"Parent";
		"Name";
		"LayoutOrder";
		"Size";
		"Position";
		"AbsolutePosition";
		"AbsoluteSize";
		"AnchorPoint";
		"ZIndex";
		"Rotation";
		"AbsoluteRotation";
		
		"RippleColor3";
		"RightClickRipple";
		"Disabled";
		"DisabledColor3";
		"ShadowColor3";
		"ShadowVisible";
		"AnimationSpeed";
		
		"Icon";
		"IconVisible";
		"IconTransparency";
		"IconColor3";
		"IconSizeScale";
		
		"ToolTipVisible";
		"ToolTipText";
		"ToolTipBackgroundColor3";
		"ToolTipTextColor3";
		
		"BackgroundColor3";
		"BackgroundTransparency";
		
		"Style";
		
		"MouseButton1Click";
		"MouseButton1Down";
		"MouseButton1Up";
		"MouseButton2Down";
		"MouseButton2Up";
		"MouseEnter";
		"MouseLeave";
		"MouseMoved";
		"MouseWheelBackward";
		"MouseWheelForward";
	})
	local ReadOnly = Class:MakeDictionary({
		"MouseButton1Click";
		"AbsolutePosition";
		"AbsoluteSize";
		"AbsoluteRotation";
		"MouseButton1Click";
		"MouseButton1Down";
		"MouseButton1Up";
		"MouseButton2Down";
		"MouseButton2Up";
		"MouseEnter";
		"MouseLeave";
		"MouseMoved";
		"MouseWheelBackward";
		"MouseWheelForward";
	})
	local Getter = {
		ZIndex = function()
			return Obj.ZIndex - 1
		end;
		RippleColor3 = function()
			return Data.RippleColor3
		end;
		RightClickRipple = function()
			return Data.RightClickRipple
		end;
		Disabled = function()
			return Data.Disabled
		end;
		DisabledColor3 = function()
			return Obj.Disabled.ImageColor3
		end;
		BackgroundColor3 = function()
			return Obj.ImageColor3
		end;
		BackgroundTransparency = function()
			return Obj.ImageTransparency
		end;
		ShadowColor3 = function()
			return Obj.shadow.ImageColor3
		end;
		ShadowVisible = function()
			return Obj.shadow.Visible
		end;
		Icon = function()
			return Obj.ButtonImage.Image
		end;
		IconVisible = function()
			return Obj.ButtonImage.Visible
		end;
		IconTransparency = function()
			return Obj.ButtonImage.ImageTransparency
		end;
		IconColor3 = function()
			return Obj.ButtonImage.ImageColor3
		end;
		IconSizeScale = function()
			return Obj.ButtonImage.Size.Y.Scale
		end;
		ToolTipVisible = function()
			return Obj:FindFirstChild("ToolTip") ~= nil
		end;
		ToolTipText = function()
			return Data.ToolTipText
		end;
		AnimationSpeed = function()
			return Data.Speed
		end;
		Style = function()
			return Data.Style
		end;
		ToolTipTextColor3 = function()
			return Data.ToolTipTextColor3
		end;
		ToolTipBackgroundColor3 = function()
			return Data.ToolTipBackgroundColor3
		end;
	}
	local Setter = {
		ZIndex = function(Value)
			Obj.ZIndex = Value + 1
			Obj.shadow.ZIndex = Value
			Obj.On.ZIndex = Value + 2
			Obj.Disabled.ZIndex = Value + 2
			Obj.ButtonImage.ZIndex = Value + 1
		end;
		RippleColor3 = function(Value)
			Data.RippleColor3 = Value
			Obj.On.ImageColor3 = Value
			if Ripple then
				Ripple.ImageColor3 = Value
			end
		end;
		RightClickRipple = function(Value)
			Data.RightClickRipple = Value
		end;
		Disabled = function(Value)
			UnRipple()
			Obj.Disabled.Visible = Value
			Obj.On.ImageTransparency = 1
			Data.Disabled = Value
		end;
		DisabledColor3 = function(Value)
			Obj.Disabled.ImageColor3 = Value
		end;
		BackgroundColor3 = function(Value)
			Obj.ImageColor3 = Value
		end;
		BackgroundTransparency = function(Value)
			Obj.ImageTransparency = Value
		end;
		ShadowColor3 = function(Value)
			Obj.shadow.ImageColor3 = Value
		end;
		ShadowVisible = function(Value)
			Obj.shadow.Visible = Value
		end;
		Icon = function(Value)
			Obj.ButtonImage.Image = Value
		end;
		IconVisible = function(Value)
			Obj.ButtonImage.Visible = Value
		end;
		IconTransparency = function(Value)
			Obj.ButtonImage.ImageTransparency = Value
		end;
		IconColor3 = function(Value)
			Obj.ButtonImage.ImageColor3 = Value
		end;
		IconSizeScale = function(Value)
			Obj.ButtonImage.Size = UDim2.new(Value,0,Value,0)
		end;
		ToolTipVisible = function(Value)
			if Value then
				local OldToolTip = Obj:FindFirstChild("ToolTip")
				if OldToolTip == nil then
					local New = script.Class_ToolTip.ToolTip:Clone()
					New.Parent = Obj
					New.ImageColor3 = Data.ToolTipBackgroundColor3
					New.TextLabel.TextColor3 = Data.ToolTipTextColor3
				end
			else
				local OldToolTip = Obj:FindFirstChild("ToolTip")
				if OldToolTip then
					OldToolTip:Destroy()
				end
			end
		end;
		ToolTipText = function(Value)
			Data.ToolTipText = Value
		end;
		AnimationSpeed = function(Value)
			Data.Speed = Value
		end;
		Style = function(Value)
			Data.Style = Value
			if Value == "WithBackground" then
				Obj.Image = "rbxassetid://1217158727"
				Obj.shadow.Image = "rbxassetid://2584395459"
			elseif Value == "WithOutBackground" then
				Obj.Image = ""
				Obj.shadow.Image = ""
			else
				error(("%s is not member of IconButtonStyle"):format(Value))
			end
		end;
		ToolTipTextColor3 = function(Value)
			Data.ToolTipTextColor3 = Value
			local OldToolTip = Obj:FindFirstChild("ToolTip")
			if OldToolTip then
				OldToolTip.TextLabel.TextColor3 = Value
			end
		end;
		ToolTipBackgroundColor3 = function(Value)
			Data.ToolTipBackgroundColor3 = Value
			local OldToolTip = Obj:FindFirstChild("ToolTip")
			if OldToolTip then
				OldToolTip.ImageColor3 = Value
			end
		end;
	}
	local Methods = {
		Clone = function(self,Parent)
			local New = module[This.ClassName .. "_New"](Parent or This.Parent)
			for i,_ in pairs(This:GetProperties()) do
				if not ReadOnly[i] and type(This[i]) ~= "function" and i ~= "ClassName" then
					New[i] = This[i]
				end
			end
			return New
		end;
		TweenSize = function(self,UDimData,EasingDirection,EasingStyle,Time,Overwriteable,EndFunction)
			Obj:TweenSize(UDimData,EasingDirection,EasingStyle,Time,Overwriteable,EndFunction)
		end;
		TweenPosition = function(self,UDimData,EasingDirection,EasingStyle,Time,Overwriteable,EndFunction)
			Obj:TweenPosition(UDimData,EasingDirection,EasingStyle,Time,Overwriteable,EndFunction)
		end;
		TweenSizeAndPosition = function(self,Size,Position,EasingDirection,EasingStyle,Time,Overwriteable,EndFunction)
			Obj:TweenSizeAndPosition(Size,Position,EasingDirection,EasingStyle,Time,Overwriteable,EndFunction)
		end;
		Ripple = function(self)
			PlayRipple()
			UnRipple()
		end;
	}
	
	This,FireChanged = Class:SetClass(Properties,Getter,Setter,Methods,"IconButton",ReadOnly,Obj,function()
		UnRipple = nil
		ToolTip = nil
		BackButtonOff = nil
		BackButtonOn = nil
		PlayRipple = nil
		MouseDown = nil
	end)
	module:ClassTheme(This)
	return This
end
function module.ToolTip_New(Parent)
	local This,FireChanged
	
	local Obj = script.Class_ToolTip.ToolTip:Clone()
	Obj.Parent = type(Parent) == "table" and Parent.Holder or Parent
	local Data = {
		Disabled = false;
		ToolTipText = "";
		Adornee = nil;
		TextFunction = nil;
	}
	local ToolTipIndex = 0
	--	local function ToolTip(Visible)
	--		if Data == nil or Data.Disabled and Visible then
	--			return
	--		end
	--		if Obj and (not Visible or (Data.ToolTipText ~= "")) then
	--			Obj.TextLabel.Text = Data.ToolTipText
	--			Obj.Size = UDim2.new(0,Obj.TextLabel.TextBounds.X + 8,0,28)
	--			Tween:Create(Obj,TweenInfo.new(0.15,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0),
	--				{ImageTransparency = Visible and 0 or 1;}
	--			):Play()
	--			Tween:Create(Obj.TextLabel,TweenInfo.new(0.15,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0),
	--				{TextTransparency = Visible and 0 or 1;}
	--			):Play()
	--		end
	--	end
	local function ToolTip(Visible)
		if Data == nil or Data.Disabled and Visible then
			return
		end
		if Data.TextFunction then
			Data.ToolTipText = Data.TextFunction()
		end
		if Obj and (not Visible or (Data.ToolTipText ~= "")) then
			Obj.TextLabel.Text = Data.ToolTipText
			Obj.Size = UDim2.new(0,Obj.TextLabel.TextBounds.X + 8,0,28)
			local BgFade = Tween:Create(Obj,TweenInfo.new(0.15,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0),
				{ImageTransparency = Visible and 0 or 1;}
			)
			local TextFade = Tween:Create(Obj.TextLabel,TweenInfo.new(0.15,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0),
				{TextTransparency = Visible and 0 or 1;}
			)
			
			BgFade:Play()
			TextFade:Play()
			
			delay(0.15,function()
				BgFade:Destroy()
				TextFade:Destroy()
			end)
		end
	end
	local MouseOnConnect
	local MouseOutConnect
	local Properties = Class:MakeDictionary({
		"Parent";
		"Name";
		"LayoutOrder";
		"Position";
		"AbsolutePosition";
		"AbsoluteSize";
		"AnchorPoint";
		"ZIndex";
		
		"Adornee";
		"Disabled";
		"Text";
		"TextColor3";
		
		"BackgroundColor3";
		"TextFunction";
	})
	local ReadOnly = Class:MakeDictionary({
		"AbsolutePosition";
		"AbsoluteSize";
	})
	local Getter = {
		ZIndex = function()
			return Obj.ZIndex
		end;
		Disabled = function()
			return Data.Disabled
		end;
		BackgroundColor3 = function()
			return Obj.ImageColor3
		end;
		Text = function()
			return Data.ToolTipText
		end;
		TextColor3 = function()
			return Obj.TextLabel.TextColor3
		end;
		Adornee = function()
			return Data.Adornee
		end;
		TextFunction = function()
			return Data.TextFunction
		end;
	}
	local Setter = {
		ZIndex = function(Value)
			Obj.ZIndex = Value
			Obj.TextLabel.ZIndex = Value
		end;
		Disabled = function(Value)
			if not Value then
				ToolTip(false)
			end
			Data.Disabled = Value
		end;
		BackgroundColor3 = function(Value)
			Obj.ImageColor3 = Value
		end;
		Adornee = function(Value)
			ToolTip(false)
			Data.Adornee = Value
			if MouseOutConnect then
				MouseOutConnect:Disconnect()
			end
			if MouseOnConnect then
				MouseOnConnect:Disconnect()
			end
			MouseOutConnect = Value.MouseLeave:Connect(function()
				ToolTipIndex = ToolTipIndex + 1
				ToolTip(false)
			end)
			MouseOnConnect = Value.MouseEnter:Connect(function()
				ToolTipIndex = ToolTipIndex + 1
				local NewIndex = ToolTipIndex
				delay(0.3,function()
					if ToolTipIndex == NewIndex then
						ToolTip(true)
					end
				end)
			end)
		end;
		Text = function(Value)
			Data.ToolTipText = Value
		end;
		TextColor3 = function(Value)
			Obj.TextLabel.TextColor3 = Value
		end;
		TextFunction = function(Value)
			Data.TextFunction = Value
		end;
	}
	local Methods = {
		Clone = function(self,Parent)
			local New = module[This.ClassName .. "_New"](Parent or This.Parent)
			for i,_ in pairs(This:GetProperties()) do
				if not ReadOnly[i] and type(This[i]) ~= "function" and i ~= "ClassName" then
					New[i] = This[i]
				end
			end
			return New
		end;
	}
	
	This,FireChanged = Class:SetClass(Properties,Getter,Setter,Methods,"ToolTip",ReadOnly,Obj,function()
		Data = nil
		ToolTip = nil
	end)
	module:ClassTheme(This)
	return This
end
function module.Silder_New(Parent)
	local This,FireChanged
	
	local ValueChanged = Instance.new("BindableEvent")
	local Obj = script.Class_Silder.Silder:Clone()
	Obj.Parent = type(Parent) == "table" and Parent.Holder or Parent
	
	local MouseMoveConnect
	local MouseisOn = false
	local Back = Obj.Back
	local Point = Obj.Point
	local MouseisDown = false
	local MouseButton = Obj.MouseButton
	local DataMT = {
		Value = 0;
		Max = 100;
		IntOnly = true;
		ValueLabelMultiply = 1;
		ValueLabel = true;
		Grid = false;
		GridColor3 = Color3.fromRGB(95, 95, 95);
		Disabled = false;
	}
	local Data = {}
	setmetatable(Data,DataMT)
	
	local GridFrame = Obj.GridFrame
	local function UpDateGrid()
		if Data.Grid == true then
			GridFrame.Visible = true
			GridFrame:ClearAllChildren()
			for i = 1,Data.Max do
				local NewGridPart = Instance.new("ImageLabel")
				NewGridPart.Image = "rbxassetid://1217158727"
				NewGridPart.AnchorPoint = Vector2.new(0.5,0.5)
				NewGridPart.Position = UDim2.new(i/Data.Max,0,0.5,0)
				NewGridPart.BackgroundTransparency = 1
				NewGridPart.ImageColor3 = Data.GridColor3
				NewGridPart.Size = UDim2.new(0,2,0,2)
				NewGridPart.ImageTransparency = 0.2
				NewGridPart.ZIndex = 3
				NewGridPart.Parent = GridFrame
			end
		else
			GridFrame.Visible = false
		end
	end
	UpDateGrid()
	MouseButton.MouseEnter:Connect(function()
		if Data == nil then
			return
		end
		MouseisOn = true
		if Data.Disabled then
			return
		end
		Point.MouseOn:TweenSize(UDim2.new(3,0,3,0),Enum.EasingDirection.Out,Enum.EasingStyle.Linear,0.12,true,nil)
	end)
	MouseButton.MouseLeave:Connect(function()
		if Data == nil then
			return
		end
		MouseisOn = false
		if MouseisDown == false then
			Point.MouseOn:TweenSize(UDim2.new(0,0,0,0),Enum.EasingDirection.Out,Enum.EasingStyle.Linear,0.12,true,nil)
		end
	end)
	local function DoChangeValue()
		if Data == nil then
			return
		end
		--TODO : Bug fix need!
		local NewValue = Data.Value
		if Obj.Parent ~= nil then
			Point:TweenPosition(UDim2.new(NewValue/Data.Max,0,0.5,0),Enum.EasingDirection.Out,Enum.EasingStyle.Quad,0.1,true,nil)
			Back:TweenSize(UDim2.new(NewValue/Data.Max,0,1,0),Enum.EasingDirection.Out,Enum.EasingStyle.Quad,0.1,true,nil)
		else
			Point.Position = UDim2.new(NewValue/Data.Max,0,0.5,0)
			Back.Size = UDim2.new(NewValue/Data.Max,0,1,0)
		end
		Point.ValueLabel.Text.Text = NewValue * Data.ValueLabelMultiply
		ValueChanged:Fire(NewValue)
		FireChanged("Value",NewValue)
	end
	local function SetValueFromMousePos()
		if Data == nil then
			return
		end
		local Pos = module:GetMouseWithObject(Obj).X - Obj.AbsolutePosition.X
		if Pos < 0 or Pos == 0 then
			Pos = 0
		end
		if Pos > Obj.AbsoluteSize.X or Pos == Obj.AbsoluteSize.X then
			Pos = Obj.AbsoluteSize.X
		end
		if Data.IntOnly then
			Data.Value = math.floor((Pos/Obj.AbsoluteSize.X)*Data.Max+0.5)
		else
			Data.Value = (Pos/Obj.AbsoluteSize.X)*Data.Max
		end
	end
	MouseButton.MouseButton1Down:Connect(function()
		if Data == nil or Data.Disabled then
			return
		end
		--if MouseisOn == true then
		MouseisDown = true
		SetValueFromMousePos()
		Point:TweenSize(UDim2.new(0,14,0,14),Enum.EasingDirection.Out,Enum.EasingStyle.Quad,0.2,true,nil)
		Point.MouseDown:TweenSize(UDim2.new(3,0,3,0),Enum.EasingDirection.Out,Enum.EasingStyle.Linear,0.12,true,nil)
		if Data.ValueLabel == true then
			Point.ValueLabel:TweenSize(UDim2.new(0, 28,0, 40),Enum.EasingDirection.Out,Enum.EasingStyle.Linear,0.12,true,nil)
		end
		--end
		local MouseMoveConnect = module:GetMouseWithObject(Obj).Move:Connect(function()
			if MouseisDown == true then
				SetValueFromMousePos()
			end
		end)
	end)
	local function Button1Up()
		if Data == nil then
			return
		end
		MouseisDown = false
		Point:TweenSize(UDim2.new(0,12,0,12),Enum.EasingDirection.Out,Enum.EasingStyle.Quad,0.2,true,nil)
		Point.MouseDown:TweenSize(UDim2.new(0,0,0,0),Enum.EasingDirection.Out,Enum.EasingStyle.Linear,0.12,true,nil)
		if Data.ValueLabel == true then
			Point.ValueLabel:TweenSize(UDim2.new(0,0,0,0),Enum.EasingDirection.Out,Enum.EasingStyle.Linear,0.12,true,nil)
		end
		if MouseisOn == false then
			Point.MouseOn:TweenSize(UDim2.new(0,0,0,0),Enum.EasingDirection.Out,Enum.EasingStyle.Linear,0.12,true,nil)
		end
		if MouseMoveConnect then
			MouseMoveConnect:Disconnect()
		end
	end
	MouseButton.MouseButton1Up:Connect(Button1Up)
	local InputEndedConnect = UserInputService.InputEnded:Connect(function(Key, GameProcessedEvent)
		if Button1Up == nil then
			return
		end
		if Key.UserInputType == Enum.UserInputType.MouseButton1 then
			Button1Up()
		end
	end)
	
	DataMT.__newindex = function(Self,Key,Value)
		DataMT[Key] = Value
		if Key == "Grid" or Key == "GridColor3" then
			UpDateGrid()
		elseif Key == "Max" then
			UpDateGrid()
			DoChangeValue()
		elseif Key == "Value" then
			DoChangeValue()
		end
	end
	DataMT.__index = function(Self,Key)
		return DataMT[Key]
	end
	
	local Properties = Class:MakeDictionary({
		"Visible";
		"Parent";
		"Name";
		"LayoutOrder";
		"Size";
		"Position";
		"AbsolutePosition";
		"AbsoluteSize";
		"AnchorPoint";
		"ZIndex";
		"Rotation";
		"AbsoluteRotation";
		
		"BackgroundColor3";
		"BackgroundTransparency";
		"SilderColor3";
		"Value";
		"Max";
		"IntOnly";
		"Grid";
		"GridColor3";
		"ValueLabelVisible";
		"ValueLabelTextColor3";
		"ValueLabelMultiply";
		
		"Disabled";
		"DisabledColor3";
		
		"ValueChanged";
	})
	local ReadOnly = Class:MakeDictionary({
		"MouseButton1Click";
		"AbsolutePosition";
		"AbsoluteSize";
		"AbsoluteRotation";
		"ValueChanged"
	})
	local Getter = {
		ZIndex = function()
			return Obj.ZIndex
		end;
		Grid = function()
			return Data.Grid
		end;
		GridColor3 = function()
			return Data.GridColor3
		end;
		ValueLabelMultiply = function()
			return Data.ValueLabelMultiply
		end;
		ValueLabelVisible = function()
			return Data.ValueLabel
		end;
		IntOnly = function()
			return Data.IntOnly
		end;
		Max = function()
			return Data.Max
		end;
		Value = function()
			return Data.Value
		end;
		ValueChanged = function()
			return ValueChanged.Event
		end;
		ValueLabelTextColor3 = function()
			return Obj.Point.ValueLabel.Text.Text
		end;
		SilderColor3 = function()
			return Obj.Point.ImageColor3
		end;
		Disabled = function()
			return Data.Disabled
		end;
		DisabledColor3 = function()
			return Obj.Disabled.BackgroundColor3
		end;
		BackgroundColor3 = function()
			return Obj.BackgroundColor3
		end;
		BackgroundTransparency = function()
			return Obj.BackgroundTransparency
		end;
	}
	local Setter = {
		ZIndex = function(Value)
			Obj.ZIndex = Value
			Obj.Back.ZIndex = Value
			Obj.Disabled.ZIndex = Value + 1
			Obj.GridFrame.ZIndex = Value + 1
			Obj.MouseButton.ZIndex = Value
			Obj.Point.ZIndex = Value + 3
			Obj.Point.MouseDown.ZIndex = Value + 3
			Obj.Point.MouseOn.ZIndex = Value + 3
			Obj.Point.Disabled.ZIndex = Value + 4
		end;
		Grid = function(Value)
			Data.Grid = Value
		end;
		GridColor3 = function(Value)
			Data.GridColor3 = Value
		end;
		ValueLabelMultiply = function(Value)
			Data.ValueLabelMultiply = Value
		end;
		ValueLabelVisible = function(Value)
			Data.ValueLabel = Value
		end;
		IntOnly = function(Value)
			Data.IntOnly = Value
		end;
		Max = function(Value)
			Data.Max = Value
		end;
		Value = function(Value)
			Data.Value = Value
		end;
		ValueLabelTextColor3 = function(Value)
			Obj.Point.ValueLabel.Text.TextColor3 = Value
		end;
		SilderColor3 = function(Value)
			Obj.Point.ImageColor3 = Value
			Obj.Point.ValueLabel.ImageColor3 = Value
			Obj.Point.MouseOn.ImageColor3 = Value
			Obj.Point.MouseDown.ImageColor3 = Value
		end;
		Disabled = function(Value)
			Data.Disabled = Value
			Obj.Disabled.Visible = Value
			Obj.Point.Disabled.Visible = Value
		end;
		DisabledColor3 = function(Value)
			Obj.Disabled.BackgroundColor3 = Value
			Obj.Point.Disabled.ImageColor3 = Value
		end;
		BackgroundColor3 = function(Value)
			Obj.BackgroundColor3 = Value
		end;
		BackgroundTransparency = function(Value)
			Obj.BackgroundTransparency = Value
			Obj.Back.BackgroundTransparency = Value
			Obj.Point.ImageTransparency = Value
			Obj.Point.ValueLabel.ImageTransparency = Value
		end;
	}
	local Methods = {
		Clone = function(self,Parent)
			local New = module[This.ClassName .. "_New"](Parent or This.Parent)
			for i,_ in pairs(This:GetProperties()) do
				if not ReadOnly[i] and type(This[i]) ~= "function" and i ~= "ClassName" then
					New[i] = This[i]
				end
			end
			return New
		end;
		Add = function(self,Value)
			This.Value = This.Value + Value
		end;
		TweenSize = function(self,UDimData,EasingDirection,EasingStyle,Time,Overwriteable,EndFunction)
			Obj:TweenSize(UDimData,EasingDirection,EasingStyle,Time,Overwriteable,EndFunction)
		end;
		TweenPosition = function(self,UDimData,EasingDirection,EasingStyle,Time,Overwriteable,EndFunction)
			Obj:TweenPosition(UDimData,EasingDirection,EasingStyle,Time,Overwriteable,EndFunction)
		end;
		TweenSizeAndPosition = function(self,Size,Position,EasingDirection,EasingStyle,Time,Overwriteable,EndFunction)
			Obj:TweenSizeAndPosition(Size,Position,EasingDirection,EasingStyle,Time,Overwriteable,EndFunction)
		end;
	}
	
	This,FireChanged = Class:SetClass(Properties,Getter,Setter,Methods,"Silder",ReadOnly,Obj,function()
		DataMT,Data = nil,nil
		if InputEndedConnect then
			InputEndedConnect:Disconnect()
		end
		Button1Up = nil
		SetValueFromMousePos = nil
		DoChangeValue = nil
		UpDateGrid = nil
		ValueChanged:Destroy()
	end)
	module:ClassTheme(This)
	return This
end
function module.IndeterminateCircle_New(Parent)	
	local This,FireChanged
	
	local Obj = script.Class_IndeterminateCircle.IndeterminateCircle:Clone()
	Obj.Parent = type(Parent) == "table" and Parent.Holder or Parent
	
	--	if not PreLoadLoadingC then
	--		PreLoadLoadingC = true
	--		coroutine.resume(coroutine.create(function()
	--			PreLoad:PreloadAsync(Obj.Holder:GetChildren())
	--		end))
	--	end
	local AnimationId = require(script.IndeterminateCircleImageIDs)
	
	local Data = {
		Disabled = false;
		Speed = 1;
	}
	
	local Holder = Obj.Holder
	local Play = false
	local function doLoading()
		if Data == nil then
			return
		end
		coroutine.resume(coroutine.create(function()
			if not Data.Disabled then
				if not Play then
					Play = true
					while Play do
						for i = 1,#AnimationId do
							Holder.Image = AnimationId[i]
							wait(0.03/Data.Speed)
							
							Holder.Rotation = Holder.Rotation + 2
							if Holder.Rotation > 360 then
								Holder.Rotation = Holder.Rotation - 360
							end
						end
					end
				end
			else
				Play = false
			end
		end))
	end
	doLoading()
	
	local Properties = Class:MakeDictionary({
		"Visible";
		"Parent";
		"Name";
		"LayoutOrder";
		"Size";
		"Position";
		"AbsolutePosition";
		"AbsoluteSize";
		"AnchorPoint";
		"ZIndex";
		"Rotation";
		"AbsoluteRotation";
		"AnimationSpeed";
		
		"BackgroundColor3";
		"BackgroundTransparency";
		
		"Disabled";
	})
	local ReadOnly = Class:MakeDictionary({
		"AbsolutePosition";
		"AbsoluteSize";
		"AbsoluteRotation";
	})
	local Getter = {
		ZIndex = function()
			return Obj.ZIndex
		end;
		Disabled = function()
			return Data.Disabled
		end;
		AnimationSpeed = function()
			return Data.Speed
		end;
		BackgroundColor3 = function()
			return Holder.ImageColor3
		end;
		BackgroundTransparency = function()
			return Holder.ImageTransparency
		end;
	}
	local Setter = {
		ZIndex = function(Value)
			Obj.ZIndex = Value
			for _,v in pairs(Holder:GetChildren()) do
				v.ZIndex = Value
			end
		end;
		Disabled = function(Value)
			Data.Disabled = Value
			doLoading()
		end;
		AnimationSpeed = function(Value)
			Data.Speed = Value
		end;
		BackgroundColor3 = function(Value)
			Holder.ImageColor3 = Value
		end;
		BackgroundTransparency = function(Value)
			Holder.ImageTransparency = Value
		end;
	}
	local Methods = {
		Clone = function(self,Parent)
			local New = module[This.ClassName .. "_New"](Parent or This.Parent)
			for i,_ in pairs(This:GetProperties()) do
				if not ReadOnly[i] and type(This[i]) ~= "function" and i ~= "ClassName" then
					New[i] = This[i]
				end
			end
			return New
		end;
		TweenSize = function(self,UDimData,EasingDirection,EasingStyle,Time,Overwriteable,EndFunction)
			Obj:TweenSize(UDimData,EasingDirection,EasingStyle,Time,Overwriteable,EndFunction)
		end;
		TweenPosition = function(self,UDimData,EasingDirection,EasingStyle,Time,Overwriteable,EndFunction)
			Obj:TweenPosition(UDimData,EasingDirection,EasingStyle,Time,Overwriteable,EndFunction)
		end;
		TweenSizeAndPosition = function(self,Size,Position,EasingDirection,EasingStyle,Time,Overwriteable,EndFunction)
			Obj:TweenSizeAndPosition(Size,Position,EasingDirection,EasingStyle,Time,Overwriteable,EndFunction)
		end;
	}
	
	This,FireChanged = Class:SetClass(Properties,Getter,Setter,Methods,"IndeterminateCircle",ReadOnly,Obj,function()
		Data = nil
		doLoading = nil
		Holder = nil
		Play = nil
	end)
	module:ClassTheme(This)
	return This
end
function module.Rippler_New(Parent)	
	local This,FireChanged
	local Obj = script.Class_Ripple.RippleHolder:Clone()
	
	local Data = {
		Disabled = false;
		Speed = 1;
		RightClickRipple = true;
	}
	local On_Obj = Tween:Create(Obj,TweenInfo.new(0.25/Data.Speed,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0),
		{BackgroundTransparency = 0.85;}
	)
	local Off_Obj = Tween:Create(Obj,TweenInfo.new(0.25/Data.Speed,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0),
		{BackgroundTransparency = 1;}
	)
	
	local MouseOnConnect
	local MouseOutConnect
	local MouseDownConnect
	local MouseUpConnect
	local Mouse2DownConnect
	local Mouse2UpConnect
	local Ripple
	
	local function MouseDown(_,_,Fix)
		if Ripple or Data.Disabled then
			return
		end
		Ripple = script.Class_Ripple.Ripple:Clone()
		Ripple.ImageColor3 = Obj.BackgroundColor3
		Ripple.ZIndex = Obj.ZIndex
		local Size,Pos = GetRippleSize:GetRippleSize(Obj,module:GetMouseWithObject(Obj))
		Size = Size + 6
		Ripple.Position = Fix and UDim2.new(0.5,0,0.5,0) or UDim2.new(0,Pos.X,0,-Pos.Y)
		Ripple.Parent = Obj
		Ripple:TweenSize(UDim2.new(0,Size,0,Size),Enum.EasingDirection.Out,Enum.EasingStyle.Quint,(Size*0.002)/Data.Speed,true,nil)
	end
	local function MouseUp()
		if Ripple == nil then
			return
		end
		local ThisRipple = Ripple
		Ripple = nil
		local FadeOut = Tween:Create(ThisRipple,TweenInfo.new(0.6/Data.Speed,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0),
			{ImageTransparency = 1;}
		)
		FadeOut:Play()
		FadeOut.Completed:Connect(function()
			if ThisRipple then
				ThisRipple:Destroy()
			end
		end)
	end
	local function MouseEnter()
		if Data.Disabled then
			return
		end
		On_Obj:Play()
	end
	local function MouseLeave()
		Off_Obj:Play()
		MouseUp()
	end
	local function SetParent(Parent)
		if MouseOnConnect then
			MouseOnConnect:Disconnect()
		end
		if MouseOutConnect then
			MouseOutConnect:Disconnect()
		end
		if MouseDownConnect then
			MouseDownConnect:Disconnect()
		end
		if MouseUpConnect then
			MouseUpConnect:Disconnect()
		end
		if Mouse2DownConnect then
			Mouse2DownConnect:Disconnect()
		end
		if Mouse2UpConnect then
			Mouse2UpConnect:Disconnect()
		end
		Obj.Parent = type(Parent) == "table" and Parent.Holder or Parent
		if Parent then
			if Parent:IsA("ImageButton") or Parent:IsA("TextButton") then
				Obj.Parent = type(Parent) == "table" and Parent.Holder or Parent
				MouseDownConnect = Parent.MouseButton1Down:Connect(MouseDown)
				MouseUpConnect = Parent.MouseButton1Up:Connect(MouseUp)
				Mouse2DownConnect = Parent.MouseButton2Down:Connect(function()
					if Data.RightClickRipple then
						MouseDown()
					end
				end)
				Mouse2UpConnect = Parent.MouseButton2Up:Connect(MouseUp)
				MouseOnConnect = Parent.MouseEnter:Connect(MouseEnter)
				MouseOutConnect = Parent.MouseLeave:Connect(MouseLeave)
			else
				warn(("Rippler Parent must be ImageButton or TexetButton, now %s.Parent is %s"):format(Obj.Name,Obj.Parent and Obj.Parent.Name or "nil"))
			end
		end
	end
	SetParent(Parent)
	
	local Properties = Class:MakeDictionary({
		"Parent";
		"Name";
		"Size";
		"Position";
		"AnchorPoint";
		"AbsolutePosition";
		"AbsoluteSize";
		"ZIndex";
		"Disabled";
		"RippleColor3";
		"RightClickRipple";
		"AnimationSpeed";
	})
	local ReadOnly = Class:MakeDictionary({
		"AbsolutePosition";
		"AbsoluteSize";
	})
	local Getter = {
		Disabled = function()
			return Data.Disabled
		end;
		RippleColor3 = function()
			return Obj.BackgroundColor3
		end;
		RightClickRipple = function()
			return Data.RightClickRipple
		end;
		AnimationSpeed = function()
			return Data.Speed
		end;
	}
	local Setter = {
		Parent = SetParent;
		Disabled = function(Value)
			Data.Disabled = Value
			if Value then
				Off_Obj:Play()
				if Ripple then
					Ripple:Destroy()
					Ripple = nil
				end
			end
		end;
		RippleColor3 = function(Value)
			Obj.BackgroundColor3 = Value
		end;
		RightClickRipple = function(Value)
			Data.RightClickRipple = Value
		end;
		AnimationSpeed = function(Value)
			Data.Speed = Value
		end;
	}
	local Methods = {
		Clone = function(self,Parent)
			local New = module[This.ClassName .. "_New"](Parent or This.Parent)
			for i,_ in pairs(This:GetProperties()) do
				if not ReadOnly[i] and type(This[i]) ~= "function" and i ~= "ClassName" then
					New[i] = This[i]
				end
			end
			return New
		end;
		Ripple = function(self)
			MouseDown(nil,nil,true)
			MouseUp()
		end;
	}
	This,FireChanged = Class:SetClass(Properties,Getter,Setter,Methods,"Rippler",ReadOnly,Obj,function()
		Off_Obj:Destroy()
		On_Obj:Destroy()
		SetParent(nil)
		Data = nil
		SetParent = nil
		MouseLeave = nil
		MouseEnter = nil
		MouseUp = nil
		MouseDown = nil
		if MouseOnConnect then
			MouseOnConnect:Disconnect()
		end
		if MouseOutConnect then
			MouseOutConnect:Disconnect()
		end
		if MouseDownConnect then
			MouseDownConnect:Disconnect()
		end
		if MouseUpConnect then
			MouseUpConnect:Disconnect()
		end
		if Mouse2DownConnect then
			Mouse2DownConnect:Disconnect()
		end
		if Mouse2UpConnect then
			Mouse2UpConnect:Disconnect()
		end
	end)
	--	Obj.AncestryChanged:Connect(function()
	--		if not Obj:IsDescendantOf(game) then
	--			print("Parent is Destroyed")
	--			This:Destroy()
	--		end
	--	end)
	module:ClassTheme(This)
	return This
end
function module.IndeterminateProgress_New(Parent)	
	local This,FireChanged
	
	local Obj = script.Class_IndeterminateProgress.IndeterminateProgress:Clone()
	Obj.Parent = type(Parent) == "table" and Parent.Holder or Parent
	
	local Data = {
		Disabled = false;
		Speed = 1;
		AnimationColor3 = Color3.fromRGB(30, 169, 255)
	}
	
	local Index = 0
	local Two = false
	local function doLoading()
		if Data == nil or Data.Disabled then
			return
		end
		if Obj.Parent == nil then
			while true do
				Obj:GetPropertyChangedSignal("Parent"):Wait()
				if Obj.Parent ~= nil then
					break
				end
			end
		end
		coroutine.resume(coroutine.create(function()
			Two = false
			Index = Index+1
			local NowIndex = Index
			while NowIndex == Index and not Data.Disabled do
				local BarClone = script.Class_IndeterminateProgress.Bar:Clone()
				BarClone.Parent = Obj
				BarClone.ZIndex = Obj.ZIndex
				BarClone.BackgroundColor3 = Data.AnimationColor3
				
				BarClone.Size = UDim2.new(0.5,0,1,0)
				BarClone.AnchorPoint = Vector2.new(0.5,0)
				BarClone:TweenPosition(UDim2.new(1.5,0,0,0),Enum.EasingDirection.InOut,Enum.EasingStyle.Quad,4 / Data.Speed,true,nil)
				
				BarClone:TweenSize(Two and UDim2.new(0.5,0,1,0) or UDim2.new(0.1,0,1,0),Enum.EasingDirection.InOut,Enum.EasingStyle.Quad,1 / Data.Speed,true,nil)
				wait(1 / Data.Speed)
				BarClone:TweenSize(Two and UDim2.new(0.2,0,1,0) or UDim2.new(0.62,0,1,0),Enum.EasingDirection.InOut,Enum.EasingStyle.Quad,(Two and 1.68 or 1) / Data.Speed,true,nil)
				BarClone.Size = Two and UDim2.new(0.5,0,1,0) or UDim2.new(0.1,0,1,0)
				
				Two = not Two
				delay(3 / Data.Speed,function()
					BarClone:Destroy()
				end)
			end
		end))
	end
	doLoading()
	
	local Properties = Class:MakeDictionary({
		"Visible";
		"Parent";
		"Name";
		"LayoutOrder";
		"Size";
		"Position";
		"AbsolutePosition";
		"AbsoluteSize";
		"AnchorPoint";
		"ZIndex";
		"Rotation";
		"AbsoluteRotation";
		"AnimationSpeed";
		"BarColor3";
		
		"BackgroundColor3";
		
		"Disabled";
	})
	local ReadOnly = Class:MakeDictionary({
		"AbsolutePosition";
		"AbsoluteSize";
		"AbsoluteRotation";
	})
	local Getter = {
		Disabled = function()
			return Data.Disabled
		end;
		AnimationSpeed = function()
			return Data.Speed
		end;
		BarColor3 = function()
			return Data.AnimationColor3
		end;
	}
	local Setter = {
		Disabled = function(Value)
			Data.Disabled = Value
			doLoading()
		end;
		AnimationSpeed = function(Value)
			Data.Speed = Value
		end;
		BarColor3 = function(Value)
			Data.AnimationColor3 = Value
		end;
	}
	local Methods = {
		Clone = function(self,Parent)
			local New = module[This.ClassName .. "_New"](Parent or This.Parent)
			for i,_ in pairs(This:GetProperties()) do
				if not ReadOnly[i] and type(This[i]) ~= "function" and i ~= "ClassName" then
					New[i] = This[i]
				end
			end
			return New
		end;
		TweenSize = function(self,UDimData,EasingDirection,EasingStyle,Time,Overwriteable,EndFunction)
			Obj:TweenSize(UDimData,EasingDirection,EasingStyle,Time,Overwriteable,EndFunction)
		end;
		TweenPosition = function(self,UDimData,EasingDirection,EasingStyle,Time,Overwriteable,EndFunction)
			Obj:TweenPosition(UDimData,EasingDirection,EasingStyle,Time,Overwriteable,EndFunction)
		end;
		TweenSizeAndPosition = function(self,Size,Position,EasingDirection,EasingStyle,Time,Overwriteable,EndFunction)
			Obj:TweenSizeAndPosition(Size,Position,EasingDirection,EasingStyle,Time,Overwriteable,EndFunction)
		end;
	}
	
	This,FireChanged = Class:SetClass(Properties,Getter,Setter,Methods,"IndeterminateProgress",ReadOnly,Obj,function()
		Data = nil
		doLoading = nil
		Two = nil
		Index = nil
	end)
	module:ClassTheme(This)
	return This
end
function module.LinearProgress_New(Parent)
	local This,FireChanged
	
	local Obj = script.Class_LinearProgress.LinearProgress:Clone()
	Obj.Parent = type(Parent) == "table" and Parent.Holder or Parent
	
	local Data = {
		Disabled = false;
		Speed = 1;
		Max = 100;
		Value = 0;
	}
	
	local function Refresh()
		if Data == nil then
			return
		end
		if Obj.Parent ~= nil then
			Obj.bar:TweenSize(UDim2.new(Data.Value / Data.Max,0,1,0),Enum.EasingDirection.Out,Enum.EasingStyle.Quart,0.3/Data.Speed,true,nil)
		else
			Obj.bar.Size = UDim2.new(Data.Value / Data.Max,0,1,0)
		end
	end
	
	local Properties = Class:MakeDictionary({
		"Visible";
		"Parent";
		"Name";
		"LayoutOrder";
		"Size";
		"Position";
		"AbsolutePosition";
		"AbsoluteSize";
		"AnchorPoint";
		"ZIndex";
		"Rotation";
		"AbsoluteRotation";
		"AnimationSpeed";
		"BarColor3";
		
		"Value";
		"Max";
		
		"BackgroundColor3";
	})
	local ReadOnly = Class:MakeDictionary({
		"AbsolutePosition";
		"AbsoluteSize";
		"AbsoluteRotation";
	})
	local Getter = {
		Disabled = function()
			return Data.Disabled
		end;
		AnimationSpeed = function()
			return Data.Speed
		end;
		BarColor3 = function()
			return Obj.bar.BackgroundColor3
		end;
		Value = function()
			return Data.Value
		end;
		Max = function()
			return Data.Max
		end;
	}
	local Setter = {
		ZIndex = function(Value)
			Obj.ZIndex = Value
			Obj.bar.ZIndex = Value
		end;
		AnimationSpeed = function(Value)
			Data.Speed = Value
		end;
		BarColor3 = function(Value)
			Obj.bar.BackgroundColor3 = Value
		end;
		Value = function(Value)
			Data.Value = Value
			Refresh()
		end;
		Max = function(Value)
			Data.Max = Value
			Refresh()
		end;
	}
	local Methods = {
		Clone = function(self,Parent)
			local New = module[This.ClassName .. "_New"](Parent or This.Parent)
			for i,_ in pairs(This:GetProperties()) do
				if not ReadOnly[i] and type(This[i]) ~= "function" and i ~= "ClassName" then
					New[i] = This[i]
				end
			end
			return New
		end;
		TweenSize = function(self,UDimData,EasingDirection,EasingStyle,Time,Overwriteable,EndFunction)
			Obj:TweenSize(UDimData,EasingDirection,EasingStyle,Time,Overwriteable,EndFunction)
		end;
		TweenPosition = function(self,UDimData,EasingDirection,EasingStyle,Time,Overwriteable,EndFunction)
			Obj:TweenPosition(UDimData,EasingDirection,EasingStyle,Time,Overwriteable,EndFunction)
		end;
		TweenSizeAndPosition = function(self,Size,Position,EasingDirection,EasingStyle,Time,Overwriteable,EndFunction)
			Obj:TweenSizeAndPosition(Size,Position,EasingDirection,EasingStyle,Time,Overwriteable,EndFunction)
		end;
	}
	
	This,FireChanged = Class:SetClass(Properties,Getter,Setter,Methods,"LinearProgress",ReadOnly,Obj,function()
		Data = nil
		Refresh = nil
	end)
	module:ClassTheme(This)
	return This
end
function module.Shadow_New(Parent)
	local This,FireChanged
	
	local Obj = script.Class_Shadow.Shadow:Clone()
	Obj.Parent = type(Parent) == "table" and Parent.Holder or Parent
	
	local Properties = Class:MakeDictionary({
		"LayoutOrder";
		"Visible";
		"Parent";
		"Name";
		"ZIndex";
		"BackgroundColor3";
		"BackgroundTransparency";
		"ShadowSize";--(Vector2 or Number)
	})
	local ReadOnly = Class:MakeDictionary({
	})
	local Getter = {
		BackgroundColor3 = function(Value)
			return Obj.LT.ImageColor3
		end;
		BackgroundTransparency = function(Value)
			return Obj.LT.ImageTransparency
		end;
		ShadowSize = function()
			return Vector2.new(Obj.LT.Size.X.Offset,Obj.LT.Size.Y)
		end;
	}
	local Setter = {
		ZIndex = function(Value)
			Obj.ZIndex = Value
			for _,v in pairs(Obj:GetChildren()) do
				if v:IsA("ImageLabel") then
					v.ZIndex = Value
				end
			end
		end;
		BackgroundColor3 = function(Value)
			for _,v in pairs(Obj:GetChildren()) do
				if v:IsA("ImageLabel") then
					v.ImageColor3 = Value
				end
			end
		end;
		BackgroundTransparency = function(Value)
			for _,v in pairs(Obj:GetChildren()) do
				if v:IsA("ImageLabel") then
					v.ImageTransparency = Value
				end
			end
		end;
		ShadowSize = function(Value)
			local Y
			local X
			if type(Value) == "number" then
				Y,X = Value,Value
			else
				Y = Value.Y
				X = Value.X
			end
			Obj.B.Size = UDim2.new(1, 0 ,0 , Y)
			Obj.L.Size = UDim2.new(0, X, 1, 0)
			Obj.LB.Size = UDim2.new(0,X,0,Y)
			Obj.LT.Size = UDim2.new(0,X,0,Y)
			Obj.R.Size = UDim2.new(0, X, 1, 0)
			Obj.RB.Size = UDim2.new(0,X,0,Y)
			Obj.RT.Size = UDim2.new(0,X,0,Y)
			Obj.T.Size = UDim2.new(1, 0 ,0 , Y)
		end;
	}
	local Methods = {
		Clone = function(self,Parent)
			local New = module[This.ClassName .. "_New"](Parent or This.Parent)
			for i,_ in pairs(This:GetProperties()) do
				if not ReadOnly[i] and type(This[i]) ~= "function" and i ~= "ClassName" then
					New[i] = This[i]
				end
			end
			return New
		end;
	}
	
	This,FireChanged = Class:SetClass(Properties,Getter,Setter,Methods,"Shadow",ReadOnly,Obj,function()
		
	end)
	module:ClassTheme(This)
	return This
end
function module.Switch_New(Parent)
	local This,FireChanged
	
	local ValueChanged = Instance.new("BindableEvent")
	local Obj = script.Class_Switch.Switch:Clone()
	Obj.Parent = type(Parent) == "table" and Parent.Holder or Parent
	
	local Data = {
		Value = false;
		TrackOffColor3 = Color3.fromRGB(150, 150, 150);
		TrackOnColor3 = Color3.fromRGB(0, 120, 170);
		ThumbOffColor3 = Color3.fromRGB(255, 255, 255);
		ThumbOnColor3 = Color3.fromRGB(0, 172, 255);
		Speed = 1
	}
	
	local function SetColorAndPos()
		if Data == nil then
			return
		end
		local ObjEffect = Tween:Create(Obj,TweenInfo.new(0.15 / Data.Speed,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0),
			{ImageColor3 = Data.Value and Data.TrackOnColor3 or Data.TrackOffColor3;}
		)
		local ThumbEffect = Tween:Create(Obj.Thumb,TweenInfo.new(0.15 / Data.Speed,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0),{
			ImageColor3 = Data.Value and Data.ThumbOnColor3 or Data.ThumbOffColor3;
			Position = UDim2.new(Data.Value and 1 or 0,0,0.5,0);
		})
		local MouseDownEffect = Tween:Create(Obj.Thumb.MouseDown,TweenInfo.new(0.15 / Data.Speed,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0),
			{ImageColor3 = Data.Value and Data.ThumbOnColor3 or Data.ThumbOffColor3;}
		)
		local MouseOnEffect = Tween:Create(Obj.Thumb.MouseOn,TweenInfo.new(0.15 / Data.Speed,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0),
			{ImageColor3 = Data.Value and Data.ThumbOnColor3 or Data.ThumbOffColor3;}
		)
		
		ObjEffect:Play()
		ThumbEffect:Play()
		MouseDownEffect:Play()
		MouseOnEffect:Play()
		
		delay(0.15 / Data.Speed + 0.1,function()
			ObjEffect:Destroy()
			ThumbEffect:Destroy()
			MouseDownEffect:Destroy()
			MouseOnEffect:Destroy()
		end)
		--Obj.Thumb:TweenPosition(UDim2.new(Data.Value and 1 or 0,0,0.5,0),Enum.EasingDirection.Out,Enum.EasingStyle.Quad,0.15 / Data.Speed,true,nil)
	end
	SetColorAndPos()
	
	local function SetValue(Value)
		if Data == nil then
			return
		end
		Data.Value = Value
		FireChanged("Value",Value)
		SetColorAndPos()
		ValueChanged:Fire(Value)
	end
	
	Obj.MouseButton1Click:Connect(function()
		SetValue(not Data.Value)
	end)
	Obj.MouseButton1Down:Connect(function()
		Obj.Thumb.MouseDown:TweenSize(UDim2.new(2,0,2,0),Enum.EasingDirection.Out,Enum.EasingStyle.Quad,0.2 / Data.Speed,true,nil)
	end)
	Obj.MouseButton1Up:Connect(function()
		Obj.Thumb.MouseDown:TweenSize(UDim2.new(0,0,0,0),Enum.EasingDirection.Out,Enum.EasingStyle.Quad,0.05 / Data.Speed,true,nil)
	end)
	Obj.MouseEnter:Connect(function()
		Obj.Thumb.MouseOn:TweenSize(UDim2.new(2,0,2,0),Enum.EasingDirection.Out,Enum.EasingStyle.Quad,0.2 / Data.Speed,true,nil)
	end)
	Obj.MouseLeave:Connect(function()
		Obj.Thumb.MouseOn:TweenSize(UDim2.new(0,0,0,0),Enum.EasingDirection.Out,Enum.EasingStyle.Quad,0.05 / Data.Speed,true,nil)
		Obj.Thumb.MouseDown:TweenSize(UDim2.new(0,0,0,0),Enum.EasingDirection.Out,Enum.EasingStyle.Quad,0.05 / Data.Speed,true,nil)
	end)
	
	local Properties = Class:MakeDictionary({
		"LayoutOrder";
		"Visible";
		"Parent";
		"Name";
		"ZIndex";
		"Size";
		"Position";
		"AbsolutePosition";
		"AbsoluteSize";
		"AnchorPoint";
		"Rotation";
		"AbsoluteRotation";
		"TrackOffColor3";
		"TrackOnColor3";
		"ThumbOffColor3";
		"ThumbOnColor3";
		"AnimationSpeed";
		"Value";
		"ValueChanged";
		"MouseButton1Click";
		"MouseButton1Down";
		"MouseButton1Up";
		"MouseButton2Down";
		"MouseButton2Up";
		"MouseEnter";
		"MouseLeave";
	})
	local ReadOnly = Class:MakeDictionary({
		"AbsolutePosition";
		"AbsoluteSize";
		"AbsoluteRotation";
		"ValueChanged";
		"MouseButton1Click";
		"MouseButton1Down";
		"MouseButton1Up";
		"MouseButton2Down";
		"MouseButton2Up";
		"MouseEnter";
		"MouseLeave";
	})
	local Getter = {
		TrackOffColor3 = function()
			return Data.TrackOffColor3
		end;
		TrackOnColor3 = function()
			return Data.TrackOnColor3
		end;
		ThumbOffColor3 = function()
			return Data.ThumbOffColor3
		end;
		ThumbOnColor3 = function()
			return Data.ThumbOnColor3
		end;
		AnimationSpeed = function()
			return Data.Speed
		end;
		Value = function()
			return Data.Value
		end;
		ValueChanged = function()
			return ValueChanged.Event
		end;
	}
	local Setter = {
		ZIndex = function(Value)
			Obj.ZIndex = Value
			Obj.Thumb.ZIndex = Value + 2
			Obj.Thumb.MouseOn.ZIndex = Value + 2
			Obj.Thumb.MouseDown.ZIndex = Value + 2
			Obj.Thumb.Shadow.ZIndex = Value + 1
		end;
		TrackOffColor3 = function(Value)
			Data.TrackOffColor3 = Value
			SetColorAndPos()
		end;
		TrackOnColor3 = function(Value)
			Data.TrackOnColor3 = Value
			SetColorAndPos()
		end;
		ThumbOffColor3 = function(Value)
			Data.ThumbOffColor3 = Value
			SetColorAndPos()
		end;
		ThumbOnColor3 = function(Value)
			Data.ThumbOnColor3 = Value
			SetColorAndPos()
		end;
		AnimationSpeed = function(Value)
			Data.Speed = Value
		end;
		Value = function(Value)
			SetValue(Value)
		end;
	}
	local Methods = {
		Clone = function(self,Parent)
			local New = module[This.ClassName .. "_New"](Parent or This.Parent)
			for i,_ in pairs(This:GetProperties()) do
				if not ReadOnly[i] and type(This[i]) ~= "function" and i ~= "ClassName" then
					New[i] = This[i]
				end
			end
			return New
		end;
		TweenPosition = function(self,UDimData,EasingDirection,EasingStyle,Time,Overwriteable,EndFunction)
			Obj:TweenPosition(UDimData,EasingDirection,EasingStyle,Time,Overwriteable,EndFunction)
		end;
	}
	
	This,FireChanged = Class:SetClass(Properties,Getter,Setter,Methods,"Switch",ReadOnly,Obj,function()
		Data = nil
		SetValue = nil
		SetColorAndPos = nil
		ValueChanged:Destroy()
	end)
	module:ClassTheme(This)
	return This
end
function module.CheckBox_New(Parent)
	local This,FireChanged
	
	local ValueChanged = Instance.new("BindableEvent")
	local Obj = script.Class_CheckBox.CheckBox:Clone()
	Obj.Parent = type(Parent) == "table" and Parent.Holder or Parent
	
	local Data = {
		Value = false;
		OffColor3 = Color3.fromRGB(131, 131, 131);
		OnColor3 = Color3.fromRGB(60, 145, 255);
		Speed = 1;
		Indeterminate = false;
	}
	
	local Ripple
	
	local function PlayRipple()
		if Obj.Parent == nil then
			return
		end
		
		Ripple = script.Class_Ripple.Ripple:Clone()
		Ripple.ZIndex = Obj.ZIndex + 1
		Ripple.Parent = Obj
		Ripple:TweenSize(UDim2.new(2,0,2,0),Enum.EasingDirection.Out,Enum.EasingStyle.Quint,true,0.6/Data.Speed,nil)
		Ripple.ImageColor3 = (Data.Value or Data.Value) and Data.OnColor3 or Data.OffColor3
	end
	local function RemoveRipple()
		if Ripple == nil then
			return
		end
		local This = Ripple
		Ripple = nil
		local FadeOut = Tween:Create(This,TweenInfo.new(0.5/Data.Speed,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0),
			{ImageTransparency = 1;}
		)
		FadeOut:Play()
		
		delay(0.5/Data.Speed+0.05,function()
			if This ~= nil then
				This:Destroy()
				This = nil
			end
			if FadeOut ~= nil then
				FadeOut:Destroy()
				FadeOut = nil
			end
		end)
	end
	
	local function SetColor(Value)
		if Data == nil then
			return
		end
		local Color = (Value or Data.Value) and Data.OnColor3 or Data.OffColor3
		Obj.MouseOn.ImageColor3 = Color
		--Obj.MouseDown.ImageColor3 = Color
		Obj.Box.ImageColor3 = Color
		Obj.ImageColor3 = Color
		Obj.ImageTransparency = Data.Value and 0 or 1
		Obj.Side.R.BackgroundColor3 = Color
		Obj.Side.L.BackgroundColor3 = Color
		Obj.Side.T.BackgroundColor3 = Color
		Obj.Side.B.BackgroundColor3 = Color
	end
	SetColor()
	
	local function SetValue(Value)
		if Data == nil or Value == Data.Value then
			return
		end
		FireChanged("Value",Value)
		SetColor(Data.Value)
		local Time = 0.15/Data.Speed
		
		if Obj.Parent ~= nil then
			Obj.Side.R:TweenSize(UDim2.new(0.4,0,1,0),Enum.EasingDirection.Out,Enum.EasingStyle.Linear,Time,true,nil)
			Obj.Side.L:TweenSize(UDim2.new(0.4,0,1,0),Enum.EasingDirection.Out,Enum.EasingStyle.Linear,Time,true,nil)
			Obj.Side.T:TweenSize(UDim2.new(1,0,0.4,0),Enum.EasingDirection.Out,Enum.EasingStyle.Linear,Time,true,nil)
			Obj.Side.B:TweenSize(UDim2.new(1,0,0.4,0),Enum.EasingDirection.Out,Enum.EasingStyle.Linear,Time,true,nil)
			Obj.Box:TweenSize(UDim2.new(1,4,1,4),Enum.EasingDirection.Out,Enum.EasingStyle.Linear,Time,true,nil)
			Data.Value = Value
			delay(Time,function()
				if Obj == nil or Obj:FindFirstChild("Side") == nil then
					return
				end
				SetColor(Value)
				Obj.Side.R:TweenSize(UDim2.new(0,0,1,0),Enum.EasingDirection.Out,Enum.EasingStyle.Linear,Time,true,nil)
				Obj.Side.L:TweenSize(UDim2.new(0,0,1,0),Enum.EasingDirection.Out,Enum.EasingStyle.Linear,Time,true,nil)
				Obj.Side.T:TweenSize(UDim2.new(1,0,0,0),Enum.EasingDirection.Out,Enum.EasingStyle.Linear,Time,true,nil)
				Obj.Side.B:TweenSize(UDim2.new(1,0,0,0),Enum.EasingDirection.Out,Enum.EasingStyle.Linear,Time,true,nil)
				Obj.Box:TweenSize(UDim2.new(1,0,1,0),Enum.EasingDirection.Out,Enum.EasingStyle.Linear,Time,true,nil)
			end)
		else
			Obj.Side.R.Size = UDim2.new(0,0,1,0)
			Obj.Side.L.Size = UDim2.new(0,0,1,0)
			Obj.Side.T.Size = UDim2.new(1,0,0,0)
			Obj.Side.B.Size = UDim2.new(1,0,0,0)
		end
		ValueChanged:Fire(Value)
	end
	local function Click()
		SetValue(not Data.Value)
	end
	Obj.MouseButton1Click:Connect(Click)
	Obj.CheckText.MouseButton1Click:Connect(Click)
	Obj.MouseButton1Down:Connect(function()
		PlayRipple()
		--Obj.MouseDown:TweenSize(UDim2.new(2,0,2,0),Enum.EasingDirection.Out,Enum.EasingStyle.Quad,0.2 / Data.Speed,true,nil)
	end)
	Obj.MouseButton1Up:Connect(function()
		RemoveRipple()
		--Obj.MouseDown:TweenSize(UDim2.new(0,0,0,0),Enum.EasingDirection.Out,Enum.EasingStyle.Quad,0.05 / Data.Speed,true,nil)
	end)
	Obj.MouseEnter:Connect(function()
		Obj.MouseOn:TweenSize(UDim2.new(2,0,2,0),Enum.EasingDirection.Out,Enum.EasingStyle.Quad,0.2 / Data.Speed,true,nil)
	end)
	Obj.MouseLeave:Connect(function()
		RemoveRipple()
		Obj.MouseOn:TweenSize(UDim2.new(0,0,0,0),Enum.EasingDirection.Out,Enum.EasingStyle.Quad,0.05 / Data.Speed,true,nil)
		--Obj.MouseDown:TweenSize(UDim2.new(0,0,0,0),Enum.EasingDirection.Out,Enum.EasingStyle.Quad,0.05 / Data.Speed,true,nil)
	end)
	local Properties = Class:MakeDictionary({
		"LayoutOrder";
		"Visible";
		"Parent";
		"Name";
		"ZIndex";
		"Size";
		"Position";
		"AbsolutePosition";
		"AbsoluteSize";
		"AnchorPoint";
		"Rotation";
		"AbsoluteRotation";
		"OffColor3";
		"OnColor3";
		"AnimationSpeed";
		"Value";
		"ValueChanged";
		"Indeterminate";
		"Text";
		"TextVisible";
		"TextColor3";
		"MouseButton1Click";
		"MouseButton1Down";
		"MouseButton1Up";
		"MouseButton2Down";
		"MouseButton2Up";
		"MouseEnter";
		"MouseLeave";
	})
	local ReadOnly = Class:MakeDictionary({
		"AbsolutePosition";
		"AbsoluteSize";
		"AbsoluteRotation";
		"ValueChanged";
		"MouseButton1Click";
		"MouseButton1Down";
		"MouseButton1Up";
		"MouseButton2Down";
		"MouseButton2Up";
		"MouseEnter";
		"MouseLeave";
	})
	local Getter = {
		ZIndex = function()
			return Obj.ZIndex - 2
		end;
		OffColor3 = function()
			return Data.OffColor3
		end;
		OnColor3 = function()
			return Data.OnColor3
		end;
		AnimationSpeed = function()
			return Data.Speed
		end;
		Value = function()
			return Data.Value
		end;
		ValueChanged = function()
			return ValueChanged.Event
		end;
		Text = function()
			return Obj.CheckText.Text
		end;
		TextVisible = function()
			return Obj.CheckText.Visible
		end;
		TextColor3 = function()
			return Obj.CheckText.TextColor3
		end;
		Indeterminate = function()
			return Data.Indeterminate
		end;
	}
	local Setter = {
		ZIndex = function(Value)
			Obj.ZIndex = Value + 2
			Obj.MouseOn.ZIndex = Value + 3
			--Obj.MouseDown.ZIndex = Value + 3
			Obj.Box.ZIndex = Value + 1
			Obj.CheckText.ZIndex = Value
			Obj.Side.B.ZIndex = Value
			Obj.Side.L.ZIndex = Value
			Obj.Side.R.ZIndex = Value
			Obj.Side.T.ZIndex = Value
		end;
		OffColor3 = function(Value)
			Data.OffColor3 = Value
			SetColor()
		end;
		OnColor3 = function(Value)
			Data.OnColor3 = Value
			SetColor()
		end;
		AnimationSpeed = function(Value)
			Data.Speed = Value
		end;
		Value = function(Value)
			SetValue(Value)
		end;
		Text = function(Value)
			Obj.CheckText.Text = Value
			Obj.CheckText.Size = UDim2.new(0,Obj.CheckText.TextBounds.X,1,0)
		end;
		TextVisible = function(Value)
			Obj.CheckText.Visible = Value
		end;
		TextColor3 = function(Value)
			Obj.CheckText.TextColor3 = Value
		end;
		Indeterminate = function(Value)
			Obj.Image = Value and "rbxassetid://1990919246" or "rbxassetid://1990905054"
		end;
	}
	local Methods = {
		Clone = function(self,Parent)
			local New = module[This.ClassName .. "_New"](Parent or This.Parent)
			for i,_ in pairs(This:GetProperties()) do
				if not ReadOnly[i] and type(This[i]) ~= "function" and i ~= "ClassName" then
					New[i] = This[i]
				end
			end
			return New
		end;
		TweenPosition = function(self,UDimData,EasingDirection,EasingStyle,Time,Overwriteable,EndFunction)
			Obj:TweenPosition(UDimData,EasingDirection,EasingStyle,Time,Overwriteable,EndFunction)
		end;
	}
	
	This,FireChanged = Class:SetClass(Properties,Getter,Setter,Methods,"CheckBox",ReadOnly,Obj,function()
		Data = nil
		Click = nil
		ValueChanged:Destroy()
		if Ripple ~= nil then
			Ripple:Destroy()
			Ripple = nil
		end
		RemoveRipple = nil
		PlayRipple = nil
	end)
	module:ClassTheme(This)
	return This
end
function module.Pointing_New(Parent)
	local This,FireChanged
	
	local Obj = script.Class_Pointing.Pointing:Clone()
	Obj.Parent = type(Parent) == "table" and Parent.Holder or Parent
	
	local Data = {
		Disabled = false;
		Speed = 1;
		Delay = 1;
	}
	local function Play()
		if Obj.Parent == nil then
			while true do
				Obj:GetPropertyChangedSignal("Parent"):Wait()
				if Obj.Parent ~= nil then
					break
				end
			end
		end
		coroutine.resume(coroutine.create(function()
			while true do
				if not Obj:FindFirstChild("Pointer") then
					return
				elseif not Data.Disabled then
					local New = script.Class_Pointing.PointerRipple:Clone()
					New.ZIndex = Obj.ZIndex
					New.ImageColor3 = Obj.Pointer.ImageColor3
					New.Parent = Obj
					New:TweenSize(UDim2.new(1,0,1,0),Enum.EasingDirection.In,Enum.EasingStyle.Quad,0.6/Data.Speed,true,nil)
					wait(0.45/Data.Speed)
					local FadeOut = Tween:Create(New,TweenInfo.new(0.35 / Data.Speed,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0),
						{ImageTransparency = 1;}
					)
					FadeOut:Play()
					FadeOut.Completed:Connect(function()
						FadeOut:Destroy()
					end)
					wait((0.2 / Data.Speed)+Data.Delay)
					New:Destroy()
				else
					break
				end
			end
		end))
	end
	Play()
	local Properties = Class:MakeDictionary({
		"Visible";
		"Parent";
		"Name";
		"LayoutOrder";
		"Size";
		"Position";
		"AbsolutePosition";
		"AbsoluteSize";
		"AnchorPoint";
		"ZIndex";
		"Rotation";
		"AbsoluteRotation";
		"AnimationSpeed";
		"Disabled";
		"BackgroundColor3";
		"Delay";
	})
	local ReadOnly = Class:MakeDictionary({
		"AbsolutePosition";
		"AbsoluteSize";
		"AbsoluteRotation";
	})
	local Getter = {
		Disabled = function()
			return Data.Disabled
		end;
		AnimationSpeed = function()
			return Data.Speed
		end;
		Disabled = function()
			return Data.Disabled
		end;
		BackgroundColor3 = function()
			return Obj.Pointer.ImageColor3
		end;
		Delay = function()
			return Data.Delay
		end;
	}
	local Setter = {
		ZIndex = function(Value)
			Obj.ZIndex = Value
			Obj.Pointer.ZIndex = Value
		end;
		AnimationSpeed = function(Value)
			Data.Speed = Value
		end;
		Disabled = function(Value)
			Data.Disabled = Value
			Obj.Pointer.Visible = not Value
			if not Value then
				Play()
			end
		end;
		BackgroundColor3 = function(Value)
			Obj.Pointer.ImageColor3 = Value
		end;
		Delay = function(Value)
			Data.Delay = Value
		end;
	}
	local Methods = {
		Clone = function(self,Parent)
			local New = module[This.ClassName .. "_New"](Parent or This.Parent)
			for i,_ in pairs(This:GetProperties()) do
				if not ReadOnly[i] and type(This[i]) ~= "function" and i ~= "ClassName" then
					New[i] = This[i]
				end
			end
			return New
		end;
	}
	
	This,FireChanged = Class:SetClass(Properties,Getter,Setter,Methods,"Pointing",ReadOnly,Obj,function()
		Data = nil
		Play = nil
	end)
	module:ClassTheme(This)
	return This
end
function module.TreeView_New(Parent)
	local This,FireChanged
	
	local Obj = script.Class_TreeView.TreeView:Clone()
	Obj.Parent = type(Parent) == "table" and Parent.Holder or Parent
	
	local Item = Obj.Item
	local LableOpen = Obj.Lable.IconOpen
	local Open = false
	local ListLayOut = Obj.Item.UIListLayout
	local IcoOn = Tween:Create(
		LableOpen,
		TweenInfo.new(
			0.25, -- time
			Enum.EasingStyle.Quint, -- style
			Enum.EasingDirection.Out, -- direction
			0,
			false,
			0
		),
		{ -- Properties
			Rotation = 0;
		}
	)
	local IcoOff = Tween:Create(
		LableOpen,
		TweenInfo.new(
			0.25, -- time
			Enum.EasingStyle.Quint, -- style
			Enum.EasingDirection.Out, -- direction
			0,
			false,
			0
		),
		{ -- Properties
			Rotation = -90;
		}
	)
	local function DoOpen()
		if Obj.Parent ~= nil then
			IcoOn:Play()
			Obj:TweenSize(UDim2.new(1, 0, 0, ListLayOut.AbsoluteContentSize.Y+Obj.Lable.Size.Y.Offset),Enum.EasingDirection.Out,Enum.EasingStyle.Linear,0.2,true,nil)
		else
			Obj.Szie = UDim2.new(1, 0, 0, ListLayOut.AbsoluteContentSize.Y+Obj.Lable.Size.Y.Offset)
			LableOpen.Rotation = 0
		end
		Open = true
	end
	local function DoClose()
		if Obj.Parent ~= nil then
			IcoOff:Play()
			Obj:TweenSize(UDim2.new(1, 0, 0, 22),Enum.EasingDirection.Out,Enum.EasingStyle.Linear,0.2,true,nil)
		else
			Obj.Szie = UDim2.new(1, 0, 0, 22)
			LableOpen.Rotation = -90
		end
		Open = false
	end
	local function ItemChange()
		if #Item:GetChildren() == 1 or #Item:GetChildren() == 0 then
			LableOpen.Visible = false
		else
			LableOpen.Visible = true
		end
	end
	
	Item.ChildAdded:Connect(ItemChange)
	Item.ChildRemoved:Connect(ItemChange)
	ItemChange()
	LableOpen.MouseButton1Click:Connect(function()
		if Open == true then
			DoClose()
		else
			DoOpen()
		end
	end)
	
	Item.Size = UDim2.new(1, Item.Size.X.Offset ,0 , ListLayOut.AbsoluteContentSize.Y)
	ListLayOut:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
		Item.Size = UDim2.new(1, Item.Size.X.Offset ,0 , ListLayOut.AbsoluteContentSize.Y)
		if Open == true then
			Obj.Size = UDim2.new(1, 0, 0, ListLayOut.AbsoluteContentSize.Y+Obj.Lable.Size.Y.Offset)
		end
	end)
	
	local Properties = Class:MakeDictionary({
		"Visible";
		"Parent";
		"Name";
		"ZIndex";
		"LayoutOrder";
		"Size";
		"Position";
		"AbsolutePosition";
		"AbsoluteSize";
		"AnchorPoint";
		"Rotation";
		"AbsoluteRotation";
		"Holder";
		"TextColor3";
		"Text";
		"Open";
	})
	local ReadOnly = Class:MakeDictionary({
		"Holder";
		"AbsoluteRotation";
		"AbsoluteSize";
		"AbsolutePosition";
	})
	local Getter = {
		Holder = function()
			return Obj.Item
		end;
		Text = function()
			return Obj.Lable.TextLabel.Text
		end;
		TextColor3 = function()
			return Obj.Lable.TextLabel.TextColor3
		end;
		Open = function()
			return Open
		end;
	}
	local Setter = {
		ZIndex = function(Value)
			Obj.ZIndex = Value
			Obj.Lable.ZIndex = Value
			Obj.Lable.IconOpen.ZIndex = Value
			Obj.Lable.TextLabel.ZIndex = Value
		end;
		Text = function(Value)
			Obj.Lable.TextLabel.Text = Value
		end;
		TextColor3 = function(Value)
			Obj.Lable.TextLabel.TextColor3 = Value
			Obj.Lable.IconOpen.ImageColor3 = Value
		end;
		Open = function(Value)
			if Value then
				DoOpen()
			else
				DoClose()
			end
		end;
	}
	local Methods = {
		Clone = function(self,Parent)
			local New = module[This.ClassName .. "_New"](Parent or This.Parent)
			for i,_ in pairs(This:GetProperties()) do
				if not ReadOnly[i] and type(This[i]) ~= "function" and i ~= "ClassName" then
					New[i] = This[i]
				end
			end
			return New
		end;
	}
	
	This,FireChanged = Class:SetClass(Properties,Getter,Setter,Methods,"TreeView",ReadOnly,Obj,function()
		Item = nil
		LableOpen = nil
		Open = nil
		ListLayOut = nil
		IcoOff:Destroy()
		IcoOn:Destroy()
		DoOpen = nil
		DoClose = nil
		ItemChange = nil
	end)
	module:ClassTheme(This)
	return This
end
function module.Scroll_New(Parent)
	local This,FireChanged
	
	local Moved = Instance.new("BindableEvent")
	
	local Obj = script.Class_Scroll.Scroll:Clone()
	Obj.Parent = type(Parent) == "table" and Parent.Holder or Parent
	
	local InputFrame
	local Data = {
		Speed = 1;
		DragToScroll = true;
	}
	
	local function RefreshCanvasSize()
		do
			local ContentSize = Obj.Holder.UIListLayout.AbsoluteContentSize
			Obj.Holder.CanvasSize = UDim2.new(0,ContentSize.X,0,ContentSize.Y)
			if InputFrame then
				InputFrame.CanvasSize = Obj.Holder.CanvasSize
			end
		end
	end
	RefreshCanvasSize()
	Obj.Holder.UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(RefreshCanvasSize)
	
	if not UserInputService.TouchEnabled then
		InputFrame = script.Class_Scroll.InputFrame:Clone()
		InputFrame.ZIndex = Obj.ZIndex + 1
		InputFrame.Parent = Obj
		InputFrame.Active = true
		
		Obj.Holder.ScrollingEnabled = false
		Obj.Holder.Size = UDim2.new(1,-Obj.Holder.ScrollBarThickness,1,0)
		InputFrame.ScrollBarThickness = Obj.Holder.ScrollBarThickness
		Obj.Holder.ScrollBarThickness = 0
		
		local MouseOn = false
		local MouseClickedPositionY = 0
		local MousePositionY = 0
		local CanvasPositionY = 0
		local MouseClickedPositionX = 0
		local MousePositionX = 0
		local CanvasPositionX = 0
		local MouseClicking = false
		
		Mouse.Move:Connect(function()
			if MouseClicking and Data.DragToScroll then
				MousePositionY = Mouse.Y-Obj.Holder.AbsolutePosition.Y
				MousePositionX = Mouse.X-Obj.Holder.AbsolutePosition.X
				InputFrame.CanvasPosition = Vector2.new(CanvasPositionX + MouseClickedPositionX - MousePositionX,CanvasPositionY + MouseClickedPositionY - MousePositionY)
			end
		end)
		UserInputService.InputBegan:Connect(function(Key, GameProcessedEvent)
			if Key.UserInputType == Enum.UserInputType.MouseButton1 or Key.UserInputType == Enum.UserInputType.MouseButton2 then
				if MouseOn then
					MouseClickedPositionY = Mouse.Y-Obj.Holder.AbsolutePosition.Y
					CanvasPositionY = InputFrame.CanvasPosition.Y
					MouseClickedPositionX = Mouse.X-Obj.Holder.AbsolutePosition.X
					CanvasPositionX = InputFrame.CanvasPosition.X
					MouseClicking = true
				end
			end
		end)
		UserInputService.InputEnded:Connect(function(Key, GameProcessedEvent)
			if Key.UserInputType == Enum.UserInputType.MouseButton1 or Key.UserInputType == Enum.UserInputType.MouseButton2 then
				if MouseOn then
					MouseClicking = false
				end
			end
		end)
		Obj.Holder.MouseEnter:Connect(function()
			MouseOn = true
		end)
		Obj.Holder.MouseLeave:Connect(function()
			MouseOn = false
			MouseClicking = false
		end)
		local SmoothConnection
		InputFrame:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
			Moved:Fire(InputFrame.CanvasPosition)
			if SmoothConnection then
				return
			end
			RefreshCanvasSize()
			SmoothConnection = game:GetService("RunService").RenderStepped:Connect(function()
				if Obj.Holder.CanvasPosition == InputFrame.CanvasPosition then
					SmoothConnection:Disconnect()
					SmoothConnection = nil
					return
				end
				local a = Obj.Holder.CanvasPosition
				local b = InputFrame.CanvasPosition
				local c = 0.2 * Data.Speed
				local d = (b - a) * c + a
				Obj.Holder.CanvasPosition = Vector2.new(math.floor(d.X+0.5) , math.floor(d.Y+0.5))				
			end)
		end)
	end
	local Properties = Class:MakeDictionary({
		"Visible";
		"Parent";
		"Name";
		"LayoutOrder";
		"Size";
		"Position";
		"AbsolutePosition";
		"AbsoluteSize";
		"AnchorPoint";
		"ZIndex";
		"Rotation";
		"AbsoluteRotation";
		"DragToScroll";
		"AnimationSpeed";
		"Holder";
		"BackgroundColor3";
		"BackgroundTransparency";
		"ScrollBarThickness";
		"ScrollBarImageColor3";
		"ScrollBarImageTransparency";
		"TopImage";
		"MidImage";
		"BottomImage";
		"Moved";
		"Padding";
	})
	local ReadOnly = Class:MakeDictionary({
		"AbsolutePosition";
		"AbsoluteSize";
		"AbsoluteRotation";
		"Holder";
		"Moved";
	})
	local Getter = {
		Padding = function()
			if Obj.Holder:FindFirstChild("UIListLayout") == nil then
				error("Couldn't find UIListLayout in Holder!")
			end
			return Obj.Holder.UIListLayout.Padding
		end;
		Holder = function()
			return Obj.Holder
		end;
		Moved = function()
			return Moved.Event
		end;
		DragToScroll = function()
			return Data.DragToScroll
		end;
		AnimationSpeed = function()
			return Data.Speed
		end;
		ScrollBarThickness = function()
			return InputFrame and InputFrame.ScrollBarThickness or Obj.Holder.ScrollBarThickness
		end;
		BottomImage = function()
			return InputFrame and InputFrame.BottomImage or Obj.Holder.BottomImage
		end;
		MidImage = function()
			return InputFrame and InputFrame.MidImage or Obj.Holder.MidImage
		end;
		TopImage = function()
			return InputFrame and InputFrame.TopImage or Obj.Holder.TopImage
		end;
		ScrollBarImageTransparency = function()
			return InputFrame and InputFrame.ScrollBarImageTransparency or Obj.Holder.ScrollBarImageTransparency
		end;
		ScrollBarImageColor3 = function()
			return InputFrame and InputFrame.ScrollBarImageColor3 or Obj.Holder.ScrollBarImageColor3
		end;
	}
	local Setter = {
		Padding = function(Value)
			if Obj.Holder:FindFirstChild("UIListLayout") == nil then
				error("Couldn't find UIListLayout in Holder!")
			end
			Obj.Holder.UIListLayout.Padding = Value
		end;
		ZIndex = function(Value)
			Obj.ZIndex = Value
			Obj.Holder.ZIndex = Value
			if InputFrame then
				InputFrame.ZIndex = Value
			end
		end;
		DragToScroll = function(Value)
			Data.DragToScroll = Value
		end;
		AnimationSpeed = function(Value)
			Data.Speed = Value
		end;
		ScrollBarThickness = function(Value)
			if InputFrame then
				Obj.Holder.Size = UDim2.new(1,-Value,1,0)
				InputFrame.ScrollBarThickness = Value
			else
				Obj.Holder.ScrollBarThickness = Value
			end
		end;
		BottomImage = function(Value)
			(InputFrame or Obj.Holder).BottomImage = Value
		end;
		MidImage = function(Value)
			(InputFrame or Obj.Holder).MidImage = Value
		end;
		TopImage = function(Value)
			(InputFrame or Obj.Holder).TopImage = Value
		end;
		ScrollBarImageTransparency = function(Value)
			(InputFrame or Obj.Holder).ScrollBarImageTransparency = Value
		end;
		ScrollBarImageColor3 = function(Value)
			(InputFrame or Obj.Holder).ScrollBarImageColor3 = Value
		end;
	}
	local Methods = {
		Clone = function(self,Parent)
			local New = module[This.ClassName .. "_New"](Parent or This.Parent)
			for i,_ in pairs(This:GetProperties()) do
				if not ReadOnly[i] and type(This[i]) ~= "function" and i ~= "ClassName" then
					New[i] = This[i]
				end
			end
			return New
		end;
	}
	This,FireChanged = Class:SetClass(Properties,Getter,Setter,Methods,"Scroll",ReadOnly,Obj,function()
		RefreshCanvasSize = nil
		Moved:Destroy()
	end)
	module:ClassTheme(This)
	return This
end
function module.Tabs_New(Parent)
	local This,FireChanged
	
	local Moved = Instance.new("BindableEvent")
	
	local Obj = script.Class_Tabs.Tabs:Clone()
	Obj.Parent = type(Parent) == "table" and Parent.Holder or Parent
	
	local InputFrame
	local Data = {
		Speed = 1;
		Tab = 0;
		Index = 1;
		TabTextColor3 = Color3.fromRGB(255,255,255)
	}
	
	local Pointer = Obj.Bar.Point
	local Bar = Obj.Bar
	local Pages = Obj.Pages
	local PageLayout = Obj.Pages.PageLayout
	local ButtonListLayout = Obj.Bar.Buttons.ListLayout
	local ScrollInput
	
	local function SetPointerPos(IgnoreEffect)
		local Button = Bar.Buttons:FindFirstChild("Tab_" .. tostring(Data.Tab))
		if Button == nil then
			return
		end
		Pointer:TweenSizeAndPosition(
			UDim2.new(
				0,
				Button.Size.X.Offset,
				Pointer.Size.Y.Scale,
				Pointer.Size.Y.Offset
			),
			UDim2.new(
				0,
				Button.AbsolutePosition.X-Bar.AbsolutePosition.X,
				Pointer.Position.Y.Scale,
				Pointer.Position.Y.Offset
			),
			Enum.EasingDirection.In,
			Enum.EasingStyle.Quad,
			IgnoreEffect and 0 or (0.2/Data.Speed),
			true,
			nil
		)
	end
	
	local function SetTab(TabIndex)
		Data.Tab = TabIndex
		Obj.Pages.PageLayout:JumpToIndex(TabIndex-1)
		SetPointerPos()
		Moved:Fire()
		FireChanged("Tab",TabIndex)
	end
	
	local function SetCanvasPos()
		if ScrollInput and ScrollInput.CanvasPosition ~= Vector2.new(0,200) then
			local Pos = Vector2.new(Bar.Buttons.CanvasPosition.X + ((ScrollInput.CanvasPosition.Y - 200) > 0 and 80 or -80),0)
			ScrollInput.CanvasPosition = Vector2.new(0,200)
			local Scroll = Tween:Create(Bar.Buttons,TweenInfo.new(0.3/Data.Speed,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0),
				{CanvasPosition = Pos;}
			)
			Scroll:Play()
			Scroll.Completed:Connect(function()
				Scroll:Destroy()
			end)
		end
		--/Data.Speed
		SetPointerPos(true)
	end
	
	if not UserInputService.TouchEnabled then
		ScrollInput = script.Class_Tabs.InputFrame:Clone()
		ScrollInput.Active = true
		ScrollInput.Parent = Bar
		Bar.Buttons.ScrollingEnabled = false
		ScrollInput:GetPropertyChangedSignal("CanvasPosition"):Connect(SetCanvasPos)
		Bar.Buttons:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
			SetPointerPos(true)
		end)
	else
		Bar.Buttons:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
			local PosX = Bar.Buttons.CanvasPosition.X
			local SizeX = Bar.Buttons.CanvasSize.X.Offset
			local WindowSizeX = Bar.Buttons.AbsoluteSize.X
			if PosX >= 0 and PosX + WindowSizeX <= SizeX then
				SetPointerPos(true)
			end
			wait(0.65)
			SetPointerPos(true)
		end)
	end
	
	local function RefreshCanvasSize()
		do
			local SizeX = ButtonListLayout.AbsoluteContentSize.X
			Bar.Buttons.CanvasSize = UDim2.new(0,SizeX,0,0)
		end
	end
	RefreshCanvasSize()
	ButtonListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(RefreshCanvasSize)
	Bar.Buttons:GetPropertyChangedSignal("Size"):Connect(SetCanvasPos)
	
	local Properties = Class:MakeDictionary({
		"Visible";
		"Parent";
		"Name";
		"LayoutOrder";
		"Size";
		"Position";
		"AbsolutePosition";
		"AbsoluteSize";
		"AnchorPoint";
		
		"ZIndex";
		
		"Rotation";
		"AbsoluteRotation";
		
		"AnimationSpeed";
		"PagePadding";
		
		"BackgroundColor3";
		"BackgroundTransparency";
		"PointerColor3";
		"PointerTransparency";
		"TabColor3";
		"TabTextColor3";
		"Tab";
		"Moved";
	})
	local ReadOnly = Class:MakeDictionary({
		"AbsolutePosition";
		"AbsoluteSize";
		"AbsoluteRotation";
		"Moved";
	})
	local Getter = {
		TabTextColor3 = function()
			return Data.TabTextColor3
		end;
		Holder = function()
			return Obj.Holder
		end;
		Moved = function()
			return Moved.Event
		end;
		AnimationSpeed = function()
			return Data.Speed
		end;
		PagePadding = function()
			return PageLayout.Padding.Offset
		end;
		PointerColor3 = function()
			return Pointer.BackgroundColor3
		end;
		PointerTransparency = function()
			return Pointer.BackgroundTransparency
		end;
		Tab = function()
			return Data.Tab
		end;
		TabColor3 = function()
			return Bar.BackgroundColor3
		end;
	}
	local Setter = {
		TabTextColor3 = function(Value)
			Data.TabTextColor3 = Value
			for _,v in pairs(Bar.Buttons:GetChildren()) do
				if v:IsA("TextButton") then
					v.Holder.TextLabel.TextColor3 = Value
				end
			end
		end;
		ZIndex = function(Value)
			Obj.ZIndex = Value
			Bar.Shadow.ZIndex = Value
			Bar.Point.ZIndex = Value
			if InputFrame then
				InputFrame.ZIndex = Value + 1
			end
			Bar.Buttons.ZIndex = Value
			for _,v in pairs(Bar.Buttons:GetChildren()) do
				if v:IsA("TextButton") then
					v.ZIndex = Value + 2
					v.Holder.Icon.ZIndex = Value + 2
					v.Holder.TextLabel.ZIndex = Value + 2
				end
			end
		end;
		AnimationSpeed = function(Value)
			PageLayout.TweenTime = 0.3/Value
			Data.Speed = Value
		end;
		PagePadding = function(Value)
			PageLayout.Padding = UDim.new(0,Value,0,0)
		end;
		PointerColor3 = function(Value)
			Pointer.BackgroundColor3 = Value
		end;
		PointerTransparency = function(Value)
			Pointer.BackgroundTransparency = Value
		end;
		Tab = function(Value)
			SetTab(Value)
		end;
		TabColor3 = function(Value)
			Bar.BackgroundColor3 = Value
		end;
	}
	local Methods = {
		Clone = function(self,Parent)
			local New = module[This.ClassName .. "_New"](Parent or This.Parent)
			for i,_ in pairs(This:GetProperties()) do
				if not ReadOnly[i] and type(This[i]) ~= "function" and i ~= "ClassName" then
					New[i] = This[i]
				end
			end
			return New
		end;
		TweenSize = function(self,UDimData,EasingDirection,EasingStyle,Time,Overwriteable,EndFunction)
			Obj:TweenSize(UDimData,EasingDirection,EasingStyle,Time,Overwriteable,EndFunction)
		end;
		TweenPosition = function(self,UDimData,EasingDirection,EasingStyle,Time,Overwriteable,EndFunction)
			Obj:TweenPosition(UDimData,EasingDirection,EasingStyle,Time,Overwriteable,EndFunction)
		end;
		TweenSizeAndPosition = function(self,Size,Position,EasingDirection,EasingStyle,Time,Overwriteable,EndFunction)
			Obj:TweenSizeAndPosition(Size,Position,EasingDirection,EasingStyle,Time,Overwriteable,EndFunction)
		end;
		AddTab = function(self,TabName,TabIndex,TabButtonSizeX,TabIcon,TabIconColor3)
			local TabIndex = TabIndex or Data.Index
			
			local TabFrame = script.Class_Tabs.TabFrame:Clone()
			local TabButton = script.Class_Tabs.TabButton:Clone()
			
			TabButton.Name = "Tab_" .. tostring(TabIndex)
			TabButton.Holder.TextLabel.Text = TabName
			TabButton.Holder.TextLabel.TextColor3 = Data.TabTextColor3
			--			TabButton.Holder.TextLabel.TextXAlignment = (TabIcon and
			--				Enum.TextXAlignment.Left
			--				or Enum.TextXAlignment.Center
			--			)
			
			TabButton.Holder.Icon.Visible = TabIcon and true or false
			TabButton.Holder.Icon.Image = TabIcon or ""
			TabButton.Holder.Icon.ImageColor3 = TabIconColor3 or Color3.fromRGB(255,255,255)
			TabButton.LayoutOrder = TabIndex
			TabButton.Size = UDim2.new(0,TabButtonSizeX or 100,1,0)
			local Rippler = module.Rippler_New(TabButton)
			TabButton.AncestryChanged:connect(function()
				if not TabButton:IsDescendantOf(game) then
					Rippler:Destroy()
				end
			end)
			
			TabButton.Parent = Bar.Buttons
			TabButton.Holder.TextLabel.Size = UDim2.new(
				0,
				TabButton.Holder.TextLabel.TextBounds.X,
				1,
				0
			)
			
			TabButton.ZIndex = Obj.ZIndex + 2
			TabButton.Holder.Icon.ZIndex = Obj.ZIndex + 2
			TabButton.Holder.TextLabel.ZIndex = Obj.ZIndex + 2
			
			TabButton.MouseButton1Click:Connect(function()
				SetTab(TabIndex)
			end)
			
			TabFrame.LayoutOrder = TabIndex
			TabFrame.Parent = Pages
			TabFrame.Name = "Tab_" .. tostring(TabIndex)
			
			TabFrame.AncestryChanged:connect(function()
				if not TabFrame:IsDescendantOf(game) then
					TabButton:Destroy()
				end
			end)
			
			Data.Index = Data.Index + 1
			RefreshCanvasSize()
			return TabFrame
		end;
		RemoveTab = function(self,TabIndex)
			local TabPage = Pages:FindFirstChild("Tab_" .. tostring(TabIndex))
			if TabPage then
				if PageLayout.CurrentPage == TabPage then
					SetTab(0)
				end
				TabPage:Destroy()
			end
			local TabButton = Bar.Buttons:FindFirstChild("Tab_" .. tostring(TabIndex))
			if TabButton then
				TabButton:Destroy()
			end
		end;
		GetTabs = function(self)
			local Tabs = {}
			for _,v in pairs(Pages:GetChildren()) do
				if v:IsA("Frame") then
					Tabs[#Tabs+1] = v
				end
			end
			return Tabs
		end;
		GetTab = function(self,TabIndex)
			return Pages:FindFirstChild("Tab_" .. tostring(TabIndex))
		end;
	}
	This,FireChanged = Class:SetClass(Properties,Getter,Setter,Methods,"Tabs",ReadOnly,Obj,function()
		Moved:Destroy()
		InputFrame = nil
		Data = nil
		Pointer = nil
		Bar = nil
		Pages = nil
		PageLayout = nil
		ButtonListLayout = nil
		ScrollInput = nil
		SetPointerPos = nil
		RefreshCanvasSize = nil
	end)
	module:ClassTheme(This)
	return This
end
function module.TextField_New(Parent)
	local This,FireChanged
	local TextChanged = Instance.new("BindableEvent")
	local Obj = script.Class_TextField.TextField:Clone()
	Obj.Parent = type(Parent) == "table" and Parent.Holder or Parent
	
	local Data = {
		Speed = 1;
		Error = false;
		ErrorColor = Color3.fromRGB(255,25,25);
		ErrorText = "Error";
		OnColor = Color3.fromRGB(60,145,255);
		OffColor = Color3.fromRGB(156,156,156);
		Style = "Text";
		FilledColor = Color3.fromRGB(245,245,245);
		TextSize = Obj.TextSize
	}
	local OutlinedBars = {"LBar","RBar","TopBarL","TopBarR"}
	
	local Ripple
	local function GetRipple()
		Ripple = Ripple or Instance.new("Frame")
		--Ripple.Size = Data.Error and Ripple.Size or UDim2.new(0,0,1,1)
		Ripple.Position = UDim2.new(0.5,0,0,0)
		Ripple.AnchorPoint = Vector2.new(0.5,0)
		Ripple.BorderSizePixel = 0
		Ripple.BackgroundColor3 = Data.OnColor
		Ripple.Parent = Obj.Bar
		Ripple.ZIndex = Obj.ZIndex + 2
		
		local BgColor = Tween:Create(Ripple,TweenInfo.new(0.2/Data.Speed,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0),
			{BackgroundColor3 = Data.Error and Data.ErrorColor or Data.OnColor;}
		)
		BgColor:Play()
		BgColor.Completed:Connect(function()
			BgColor:Destroy()
		end)
		return Ripple
	end
	
	local function SetStyle(Value)
		local StyleFolder = script.Class_TextField.Style:FindFirstChild(Value)
		if StyleFolder == nil then
			error(("%s is not member of TextFieldStyle"):format(Value))
		end
		Data.Style = Value
		local HelperText = Obj:FindFirstChild("HelperText") and Obj.HelperText.Text or ""
		for _,v in pairs(Obj:GetChildren()) do
			if v.Name ~= "Placeholder" then
				if v.Name == "Bar" then
					v.Parent = nil
				else
					v:Destroy()
				end
			end
		end
		
		for _,StyleObj in pairs(StyleFolder:GetChildren()) do
			local New = StyleObj:Clone()
			if New:IsA("Frame") or New:IsA("ImageLabel") or New:IsA("TextLabel") then
				New.ZIndex = New.ZIndex + Obj.ZIndex - 2
			end
			New.Parent = Obj
			if New.Name == "Filled" then
				New.ImageColor3 = Data.FilledColor
			elseif New.Name == "Bar" then
				New.BackgroundColor3 = Data.OffColor
			elseif New.Name == "HelperText" then
				New.TextColor3 = Data.OffColor
				New.TextStrokeColor3 = Data.OffColor
				New.Text = HelperText
			end
		end
		Obj.ErrorText.Font = Obj.Font
	end
	SetStyle("Text")
	
	local function FocuseChanged()
		local Focused = Obj:IsFocused()
		local OnText = Obj.Text ~= ""
		local Open = (Focused or OnText)
		local Outlined = Data.Style == "Outlined"
		local PlaceholderSize = TextService:GetTextSize(Obj.Placeholder.Text,Data.TextSize - 4,Obj.Font,Vector2.new(1,1)*math.huge)
		
		--Placeholder
		local PlaceholderEffect = Tween:Create(Obj.Placeholder,TweenInfo.new(0.2/Data.Speed,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0),{
			TextColor3 = Data.Error and Data.ErrorColor or (Focused and Data.OnColor or Data.OffColor);
			Position = Open and UDim2.new(0,0,0,-2) or UDim2.new(0,0,0.5,0);
			TextSize = Open and Data.TextSize - 4 or Data.TextSize;
		}
		)
		PlaceholderEffect:Play()
		
		--Ripple
		local Ripple = GetRipple()
		if Obj.Parent ~= nil then
			Ripple:TweenSize(UDim2.new(Data.Error and 1 or (Focused and 1 or 0),0,1,1),Enum.EasingDirection.Out,Enum.EasingStyle.Quart,Outlined and 0 or(0.2/Data.Speed),true,nil)
		else
			Ripple.Size = UDim2.new(Data.Error and 1 or (Focused and 1 or 0),0,1,1)
		end
		
		Ripple.BackgroundColor3 = Data.Error and Data.ErrorColor or (Outlined and Data.OffColor or Data.OnColor)
		local RippleEffect = Tween:Create(Ripple,TweenInfo.new(0.2/Data.Speed,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0),
			{BackgroundColor3 = Data.Error and Data.ErrorColor or (Focused and Data.OnColor or Data.OffColor);}
		)
		RippleEffect:Play()
		
		--Outline
		if Outlined then
			for _,BarName in pairs(OutlinedBars) do
				local BarEffect = Tween:Create(Obj[BarName],TweenInfo.new(0.2/Data.Speed,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0),
					{BackgroundColor3 = Data.Error and Data.ErrorColor or (Focused and Data.OnColor or Data.OffColor);}
				)
				BarEffect:Play()
				BarEffect.Completed:Connect(function()
					BarEffect:Destroy()
				end)
			end
			if Obj.Parent ~= nil then
				Obj.TopBarR:TweenSize(UDim2.new(1,Open and -PlaceholderSize.X or 8,0,2),Enum.EasingDirection.Out,Enum.EasingStyle.Quart,(0.2/Data.Speed)-0.05,true,nil)
			else
				Obj.TopBarR.Size = UDim2.new(1,Open and -PlaceholderSize.X or 8,0,2)
			end
		end
		
		delay(0.2/Data.Speed,function()
			PlaceholderEffect:Destroy()
			RippleEffect:Destroy()
		end)
	end
	Obj.Focused:Connect(FocuseChanged)
	Obj.FocusLost:Connect(FocuseChanged)
	Obj:GetPropertyChangedSignal("Text"):Connect(function()
		TextChanged:Fire(Obj.Text)
		FireChanged("Text",Obj.Text)
		if not Obj:IsFocused() then
			FocuseChanged()
		end
	end)
	FocuseChanged()
	
	Obj:GetPropertyChangedSignal("SelectionStart"):Connect(function()
		FireChanged("SelectionStart",Obj.SelectionStart)
	end)
	Obj:GetPropertyChangedSignal("CursorPosition"):Connect(function()
		FireChanged("CursorPosition",Obj.CursorPosition)
	end)
	Obj.MouseEnter:Connect(function()
		if Data.Style == "Filled" then
			local FilledMouseOn = Tween:Create(Obj.MouseOn,TweenInfo.new(0.3/Data.Speed,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0),
				{ImageTransparency = 0.9;}
			)
			FilledMouseOn:Play()
			FilledMouseOn.Completed:Connect(function()
				FilledMouseOn:Destroy()
			end)
		end
	end)
	Obj.MouseLeave:Connect(function()
		if Data.Style == "Filled" then
			local FilledMouseOff = Tween:Create(Obj.MouseOn,TweenInfo.new(0.3/Data.Speed,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0),
				{ImageTransparency = 1;}
			)
			FilledMouseOff:Play()
			FilledMouseOff.Completed:Connect(function()
				FilledMouseOff:Destroy()
			end)
		end
	end)
	
	
	local function ErrorEffect()
		if Obj.Placeholder:FindFirstChild("ErrorEffect") then
			return
		end
		local EffectTime = 0.05
		
		local Effect = script.Class_TextField.ErrorEffect:Clone()
		Effect.Parent = Obj.Placeholder--.ErrorText
		local ToLeft = Tween:Create(Effect,TweenInfo.new(EffectTime/Data.Speed,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0),
			{PaddingLeft = UDim.new(0,4);}
		)
		local ToRight = Tween:Create(Effect,TweenInfo.new(EffectTime/Data.Speed,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0),
			{PaddingLeft = UDim.new(0,-4);}
		)
		local ToMiddle = Tween:Create(Effect,TweenInfo.new(EffectTime/Data.Speed,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0),{
			PaddingLeft = UDim.new(0,0);
		})
		
		local Left = false
		for i = 1,5 do
			ToMiddle:Play()
			ToMiddle.Completed:Wait()
			local Last = Left and ToLeft or ToRight
			Last:Play()
			Last.Completed:Wait()
			Left = not Left
		end
		
		ToMiddle:Play()
		ToMiddle.Completed:Wait()
		Effect:Destroy()
		ToLeft:Destroy()
		ToRight:Destroy()
		ToMiddle:Destroy()
	end
	
	
	local function SetError(Value)
		if Value == Data.Error then
			return
		end
		Obj.HelperText.Visible = not Value
		Data.Error = Value
		GetRipple()
		Obj.ErrorText.TextColor3 = Data.ErrorColor
		Obj.ErrorText.TextStrokeColor3 = Data.ErrorColor
		Obj.ErrorText.Text = Data.ErrorText
		Obj.ErrorText.Visible = Value
		FocuseChanged()
		if Value then
			coroutine.resume(coroutine.create(ErrorEffect))
		end
	end
	
	
	local Properties = Class:MakeDictionary({
		"Visible";
		"Parent";
		"Name";
		"LayoutOrder";
		"Size";
		"Position";
		"AbsolutePosition";
		"AbsoluteSize";
		"AnchorPoint";
		"ZIndex";
		"Rotation";
		"AbsoluteRotation";
		
		--"IntOnly";
		
		"PlaceholderText";
		"OffColor3";
		"OnColor3";
		"ErrorText";
		"ErrorColor3";
		"Error";
		"HelperText";
		"Style";
		
		"Text";
		"TextSize";
		"Font";
		"TextColor3";
		"TextEditable";
		"MultiLine";
		"ClearTextOnFocus";
		
		"AnimationSpeed";
		"FilledColor3";
		"TextChanged";
		
		"LineHeight";
		"CursorPosition";
		"SelectionStart";
		
		"FocusLost";
		"Focused";
	})
	local ReadOnly = Class:MakeDictionary({
		"AbsolutePosition";
		"AbsoluteSize";
		"TextChanged";
		"AbsoluteRotation";
		"FocusLost";
		"Focused";
	})
	local Getter = {
		ZIndex = function(Value)
			return Obj.ZIndex - 1
		end;
		Holder = function()
			return Obj.Holder
		end;
		TextChanged = function()
			return TextChanged.Event
		end;
		AnimationSpeed = function()
			return Data.Speed
		end;
		FilledColor3 = function()
			return Data.FilledColor
		end;
		PlaceholderText = function()
			return Obj.Placeholder.Text
		end;
		OffColor3 = function()
			return Data.OffColor
		end;
		OnColor3 = function()
			return Data.OnColor
		end;
		ErrorText = function()
			return Data.ErrorText
		end;
		ErrorColor3 = function()
			return Data.ErrorColor
		end;
		Error = function()
			return Data.Error
		end;
		Style = function()
			return Data.Style
		end;
		HelperText = function()
			return Obj.HelperText.Text
		end;
	}
	local Setter = {
		ZIndex = function(Value)
			Obj.ZIndex = Value + 1
			Obj.Placeholder.ZIndex = Value + 1
			Obj.Bar.ZIndex = Value + 2
			Obj.ErrorText.ZIndex = Value
			if Data.Style == "Filled" then
				Obj.Filled.ZIndex = Value
				Obj.MouseOn.ZIndex = Value + 1
			elseif Data.Style == "Outlined" then
				Obj.LBar.ZIndex = Value + 2
				Obj.RBar.ZIndex = Value + 2
				Obj.TopBarL.ZIndex = Value + 2
				Obj.TopBarR.ZIndex = Value + 2
			end
			GetRipple()
		end;
		AnimationSpeed = function(Value)
			Data.Speed = Value
		end;
		FilledColor3 = function(Value)
			Data.FilledColor = Value
			if Data.Style == "Filled" then
				Obj.Filled.ImageColor3 = Value
			end
		end;
		PlaceholderText = function(Value)
			Obj.Placeholder.Text = Value
		end;
		OffColor3 = function(Value)
			if Data.OffColor == Value then
				return
			end
			Data.OffColor = Value
			if Obj:FindFirstChild("Bar") then
				Obj.Bar.BackgroundColor3 = Value
			end
			FocuseChanged()
		end;
		OnColor3 = function(Value)
			if Data.OnColor == Value then
				return
			end
			Data.OnColor = Value
			FocuseChanged()
		end;
		ErrorText = function(Value)
			if Data.ErrorText == Value then
				return
			end
			Data.ErrorText = Value
			Obj.ErrorText.Text = Value
			FocuseChanged()
		end;
		ErrorColor3 = function(Value)
			if Data.ErrorColor == Value then
				return
			end
			Data.ErrorColor = Value
			Obj.ErrorText.TextColor3 = Value
			FocuseChanged()
		end;
		TextSize = function(Value)
			if Obj.TextSize == Value then
				return
			end
			Obj.TextSize = Value
			Obj.ErrorText.TextSize = Value - 2
			FocuseChanged()
		end;
		Font = function(Value)
			if Obj.Font == Value then
				return
			end
			Obj.ErrorText.Font = Value
			Obj.Font = Value
			Obj.Placeholder.Font = Value
			if Data.Style == "Outlined" then
				FocuseChanged()
			end
		end;
		Error = SetError;
		Style = SetStyle;
		HelperText = function(Value)
			Obj.HelperText.Text = Value
		end;
	}
	local Methods = {
		Clone = function(self,Parent)
			local New = module[This.ClassName .. "_New"](Parent or This.Parent)
			for i,_ in pairs(This:GetProperties()) do
				if not ReadOnly[i] and type(This[i]) ~= "function" and i ~= "ClassName" then
					New[i] = This[i]
				end
			end
			return New
		end;
		TweenSize = function(self,UDimData,EasingDirection,EasingStyle,Time,Overwriteable,EndFunction)
			Obj:TweenSize(UDimData,EasingDirection,EasingStyle,Time,Overwriteable,EndFunction)
		end;
		TweenPosition = function(self,UDimData,EasingDirection,EasingStyle,Time,Overwriteable,EndFunction)
			Obj:TweenPosition(UDimData,EasingDirection,EasingStyle,Time,Overwriteable,EndFunction)
		end;
		TweenSizeAndPosition = function(self,Size,Position,EasingDirection,EasingStyle,Time,Overwriteable,EndFunction)
			Obj:TweenSizeAndPosition(Size,Position,EasingDirection,EasingStyle,Time,Overwriteable,EndFunction)
		end;
		CaptureFocus = function()
			Obj:CaptureFocus()
		end;
		ReleaseFocus = function(Submitted)
			Obj:ReleaseFocus(Submitted)
		end;
		IsFocused = function()
			return Obj:IsFocused()
		end;
	}
	This,FireChanged = Class:SetClass(Properties,Getter,Setter,Methods,"TextField",ReadOnly,Obj,function()
		TextChanged:Destroy()
		if Ripple then
			Ripple:Destroy()
		end
		Ripple = nil
		Data = nil
		GetRipple = nil
		SetError = nil
		SetStyle = nil
		FocuseChanged = nil
		ErrorEffect = nil
	end)
	module:ClassTheme(This)
	return This
end
function module.Button_New(Parent)
	local This,FireChanged
	
	local Obj = script.Class_Button.Button:Clone()
	Obj.Parent = type(Parent) == "table" and Parent.Holder or Parent
	local Data = {
		RippleColor3 = Color3.fromRGB(255,255,255);
		Disabled = false;
		ToolTipText = "";
		Speed = 1;
		Style = "Contained";
		ToolTipBackgroundColor3 = Color3.fromRGB(45,45,45);
		ToolTipTextColor3 = Color3.fromRGB(255,255,255);
		RoundSize = 8;
		RightClickRipple = true;
	}
	local ToolTipIndex = 0
	
	local RippleOff = Instance.new("BindableEvent")
	
	local function SetStyle(Style)
		if Style == Data.Style then
			return
		elseif Style == "Contained" then
			Obj.ImageTransparency = 0
			Obj.Outline.Visible = false
			Obj.AmbientShadow.Visible = true
			Obj.PenumbraShadow.Visible = true
			Obj.UmbraShadow.Visible = true
		elseif Style == "Outlined" then
			Obj.ImageTransparency = 1
			Obj.Outline.Visible = true
			Obj.AmbientShadow.Visible = false
			Obj.PenumbraShadow.Visible = false
			Obj.UmbraShadow.Visible = false
		elseif Style == "Text" then
			Obj.ImageTransparency = 1
			Obj.Outline.Visible = false
			Obj.AmbientShadow.Visible = false
			Obj.PenumbraShadow.Visible = false
			Obj.UmbraShadow.Visible = false
		end
	end
	
	local function SetRoundSize(Size)
		if Data.RoundSize == Size then
			return
		end
		Data.RoundSize = Size
		Obj.RippleContainer:Destroy()
		local New = script.Class_Button.RoundSize:FindFirstChild(tostring(Size))
		if New then
			New.RippleContainer:Clone().Parent = Obj
			Obj.Image = New.Img.Image
			Obj.SliceCenter = New.Img.SliceCenter
			Obj.SliceScale = New.Img.SliceScale
			Obj.On.Image = New.Img.Image
			Obj.On.SliceCenter = New.Img.SliceCenter
			Obj.On.SliceScale = New.Img.SliceScale
			Obj.Disabled.Image = New.Img.Image
			Obj.Disabled.SliceCenter = New.Img.SliceCenter
			Obj.Disabled.SliceScale = New.Img.SliceScale
			Obj.Outline.Image = New.Outline.Image
			Obj.Outline.SliceCenter = New.Outline.SliceCenter
			Obj.Outline.SliceScale = New.Outline.SliceScale
		else
			--i made Round Calculation algorithm module
			Round:RippleContainer(Size).Parent = Obj
			Round:SetRound(Obj.Disabled,Size)
			Round:SetRound(Obj.On,Size)
			Round:SetRound(Obj,Size)
			Round:SetOutline(Obj.Outline,Size)
			--error("Couldn't find RoundSize.%s, Unsupported size")
		end
		Obj.AmbientShadow.SliceScale = 0.125 * Size
		Obj.PenumbraShadow.SliceScale = 0.125 * Size
		Obj.UmbraShadow.SliceScale = 0.125 * Size
	end
	
	local function SetShadow(On)
		Obj.AmbientShadow:TweenSizeAndPosition(
			On and UDim2.new(1, 15,1, 15) or UDim2.new(1, 8,1, 8),
			On and UDim2.new(0.5, 0,0.5, 4) or UDim2.new(0.5, 0,0.5, 1),
			Enum.EasingDirection.Out,Enum.EasingStyle.Quint,0.2/Data.Speed,true,nil
		)
		Obj.PenumbraShadow:TweenSizeAndPosition(
			On and UDim2.new(1, 14,1, 14) or UDim2.new(1, 4,1, 4),
			On and UDim2.new(0.5, 0,0.5, 3) or UDim2.new(0.5, 0,0.5, 3),
			Enum.EasingDirection.Out,Enum.EasingStyle.Quint,0.2/Data.Speed,true,nil
		)
		Obj.UmbraShadow:TweenSizeAndPosition(
			On and UDim2.new(1, 10,1, 10) or UDim2.new(1, 3,1, 3),
			On and UDim2.new(0.5, 0,0.5, 8) or UDim2.new(0.5, 0,0.5, 3),
			Enum.EasingDirection.Out,Enum.EasingStyle.Quint,0.2/Data.Speed,true,nil
		)
	end
	
	local function Ripple(Position)
		if Obj.Parent == nil then
			return
		end
		
		local Mouse = module:GetMouseWithObject(Obj)
		local Size--[[,Pos]] = GetRippleSize:GetRippleSize(Obj,Mouse)
		Size = Size + 4
		local Time = (Size*0.006)/Data.Speed
		local X,Y = Position and Position.X or Mouse.X,Position and Position.Y or Mouse.Y
		
		for _,v in pairs(Obj.RippleContainer:GetChildren()) do
			coroutine.resume(coroutine.create(function()
				local PosX = X - (v.AbsolutePosition.X)
				local PosY = Y - (v.AbsolutePosition.Y)
				
				local Ripple = script.Class_Ripple.Ripple:Clone()
				Ripple.Position = UDim2.new(0,PosX,0,PosY)
				Ripple.ImageTransparency = tonumber(v.Name)
				Ripple.Parent = v
				Ripple.ImageColor3 = Data.RippleColor3
				Ripple.ZIndex = Obj.ZIndex + 1
				Ripple:TweenSize(UDim2.new(0,Size,0,Size),Enum.EasingDirection.Out,Enum.EasingStyle.Quint,Time,true,nil)
				
				RippleOff.Event:Wait()
				
				local FadeOut = Tween:Create(Ripple,TweenInfo.new(0.6/Data.Speed,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0),
					{ImageTransparency = 1;}
				)
				FadeOut:Play()
				FadeOut.Completed:Wait()
				
				FadeOut:Destroy()
				Ripple:Destroy()
			end))
		end
	end
	local MouseIsDown = false
	local function MouseDown()
		if Data == nil or Data.Disabled or MouseIsDown then
			return
		end
		SetShadow(true)
		Ripple()
		MouseIsDown = true
	end
	Obj.MouseButton1Down:Connect(MouseDown)
	Obj.MouseButton2Down:Connect(function()
		if not Data.RightClickRipple then
			return
		end
		MouseDown()
	end)
	
	local function UnRipple()
		if Data == nil or Obj.Parent == nil then
			return
		end
		SetShadow(false)
		RippleOff:Fire()
		MouseIsDown = false
	end
	Obj.MouseButton1Up:Connect(UnRipple)
	Obj.MouseButton2Up:Connect(UnRipple)
	
	local function ToolTip(Visible)
		if Data == nil then
			return
		end
		local OldToolTip = Obj:FindFirstChild("ToolTip")
		if OldToolTip and (not Visible or (Data.ToolTipText ~= "")) then
			OldToolTip.TextLabel.Text = Data.ToolTipText
			OldToolTip.Size = UDim2.new(0,OldToolTip.TextLabel.TextBounds.X + 8,0,28)
			local BgFade = Tween:Create(OldToolTip,TweenInfo.new(0.15,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0),
				{ImageTransparency = Visible and 0 or 1;}
			)
			local TextFade = Tween:Create(OldToolTip.TextLabel,TweenInfo.new(0.15,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0),
				{TextTransparency = Visible and 0 or 1;}
			)
			
			BgFade:Play()
			TextFade:Play()
			
			delay(0.15,function()
				BgFade:Destroy()
				TextFade:Destroy()
			end)
		end
	end
	
	local BackButtonOn = Tween:Create(Obj.On,TweenInfo.new(0.2/Data.Speed,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0),
		{ImageTransparency = 0.85;}
	)
	local BackButtonOff = Tween:Create(Obj.On,TweenInfo.new(0.2/Data.Speed,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0),
		{ImageTransparency = 1;}
	)
	Obj.MouseEnter:Connect(function()
		if Data.Disabled then
			return
		end
		BackButtonOn:Play()
		ToolTipIndex = ToolTipIndex + 1
		local NewIndex = ToolTipIndex
		delay(0.3,function()
			if ToolTipIndex == NewIndex then
				ToolTip(true)
			end
		end)
	end)
	Obj.MouseLeave:Connect(function()
		BackButtonOff:Play()
		UnRipple()
		ToolTipIndex = ToolTipIndex + 1
		ToolTip(false)
	end)
	
	local Properties = Class:MakeDictionary({
		"Visible";
		"Parent";
		"Name";
		"LayoutOrder";
		"Size";
		"Position";
		"AbsolutePosition";
		"AbsoluteSize";
		"AnchorPoint";
		"ZIndex";
		"Rotation";
		"AbsoluteRotation";
		
		"RippleColor3";
		"RightClickRipple";
		"Disabled";
		"DisabledColor3";
		"ShadowColor3";
		"ShadowVisible";
		"AnimationSpeed";
		"RoundSize";
		
		"HorizontalAlignment";
		
		"Icon";
		"IconVisible";
		"IconTransparency";
		"IconColor3";
		"IconSizeOffset";
		
		"Text";
		"TextColor3";
		"TextTransparency";
		"TextSize";
		"Font";
		
		"ToolTipVisible";
		"ToolTipText";
		"ToolTipBackgroundColor3";
		"ToolTipTextColor3";
		
		"BackgroundColor3";
		
		"OutlineColor3";
		
		"Style";
		
		"MouseButton1Click";
		"MouseButton1Down";
		"MouseButton1Up";
		"MouseButton2Down";
		"MouseButton2Up";
		"MouseEnter";
		"MouseLeave";
		"MouseMoved";
		"MouseWheelBackward";
		"MouseWheelForward";
	})
	local ReadOnly = Class:MakeDictionary({
		"MouseButton1Click";
		"AbsolutePosition";
		"AbsoluteSize";
		"AbsoluteRotation";
		"MouseButton1Click";
		"MouseButton1Down";
		"MouseButton1Up";
		"MouseButton2Down";
		"MouseButton2Up";
		"MouseEnter";
		"MouseLeave";
		"MouseMoved";
		"MouseWheelBackward";
		"MouseWheelForward";
	})
	local Getter = {
		ZIndex = function()
			return Obj.ZIndex - 1
		end;
		RippleColor3 = function()
			return Data.RippleColor3
		end;
		RightClickRipple = function()
			return Data.RightClickRipple
		end;
		Disabled = function()
			return Data.Disabled
		end;
		DisabledColor3 = function()
			return Obj.Disabled.ImageColor3
		end;
		BackgroundColor3 = function()
			return Obj.ImageColor3
		end;
		ShadowColor3 = function(Value)
			return Obj.PenumbraShadow.ImageColor3
		end;
		ShadowVisible = function(Value)
			return Obj.PenumbraShadow.ImageTransparency == 0
		end;
		Icon = function()
			return Obj.Holder.ImageLabel.Image
		end;
		IconVisible = function()
			return Obj.Holder.ImageLabel.Visible
		end;
		IconTransparency = function()
			return Obj.Holder.ImageLabel.ImageTransparency
		end;
		IconColor3 = function()
			return Obj.Holder.ImageLabel.ImageColor3
		end;
		IconSizeOffset = function()
			return Obj.Holder.ImageLabel.Size.X.Offset
		end;
		ToolTipVisible = function()
			return Obj:FindFirstChild("ToolTip") ~= nil
		end;
		ToolTipText = function()
			return Data.ToolTipText
		end;
		AnimationSpeed = function()
			return Data.Speed
		end;
		Style = function()
			return Data.Style
		end;
		ToolTipTextColor3 = function()
			return Data.ToolTipTextColor3
		end;
		ToolTipBackgroundColor3 = function()
			return Data.ToolTipBackgroundColor3
		end;
		OutlineColor3 = function()
			return Obj.Outline.ImageColor3
		end;
		TextTransparency = function()
			return Obj.Holder.Text.TextTransparency
		end;
		TextColor3 = function()
			return Obj.Holder.Text.TextColor3
		end;
		Text = function()
			return Obj.Holder.Text.Text
		end;
		Font = function()
			return Obj.Holder.Text.Font
		end;
		TextSize = function()
			return Obj.Holder.Text.TextSize
		end;
		RoundSize = function()
			return Data.RoundSize
		end;
		HorizontalAlignment = function()
			return Obj.Holder.UIListLayout.HorizontalAlignment
		end;
	}
	local Setter = {
		ZIndex = function(Value)
			Obj.ZIndex = Value + 1
			Obj.AmbientShadow.ZIndex = Value
			Obj.PenumbraShadow.ZIndex = Value
			Obj.UmbraShadow.ZIndex = Value
			Obj.On.ZIndex = Value + 2
			Obj.Disabled.ZIndex = Value + 2
			Obj.Holder.ImageLabel.ZIndex = Value + 1
			Obj.Holder.Text.ZIndex = Value + 1
			Obj.Outline.ZIndex = Value + 1
		end;
		RippleColor3 = function(Value)
			Data.RippleColor3 = Value
			Obj.On.ImageColor3 = Value
		end;
		RightClickRipple = function(Value)
			Data.RightClickRipple = Value
		end;
		Disabled = function(Value)
			Obj.Disabled.Visible = Value
			Obj.On.ImageTransparency = 1
			Data.Disabled = Value
		end;
		DisabledColor3 = function(Value)
			Obj.Disabled.ImageColor3 = Value
		end;
		BackgroundColor3 = function(Value)
			Obj.ImageColor3 = Value
		end;
		ShadowColor3 = function(Value)
			Obj.PenumbraShadow.ImageColor3 = Value
			Obj.AmbientShadow.ImageColor3 = Value
			Obj.UmbraShadow.ImageColor3 = Value
		end;
		ShadowVisible = function(Value)
			Obj.PenumbraShadow.ImageTransparency = Value and 0 or 1
			Obj.AmbientShadow.ImageTransparency = Value and 0 or 1
			Obj.UmbraShadow.ImageTransparency = Value and 0 or 1
		end;
		Icon = function(Value)
			Obj.Holder.ImageLabel.Image = Value
		end;
		IconVisible = function(Value)
			Obj.Holder.ImageLabel.Visible = Value
		end;
		IconTransparency = function(Value)
			Obj.Holder.ImageLabel.ImageTransparency = Value
		end;
		IconColor3 = function(Value)
			Obj.Holder.ImageLabel.ImageColor3 = Value
		end;
		IconSizeOffset = function(Value)
			Obj.Holder.ImageLabel.Size = UDim2.new(0,Value,0,Value)
		end;
		ToolTipVisible = function(Value)
			if Value then
				local OldToolTip = Obj:FindFirstChild("ToolTip")
				if OldToolTip == nil then
					local New = script.Class_ToolTip.ToolTip:Clone()
					New.Parent = Obj
					New.ImageColor3 = Data.ToolTipBackgroundColor3
					New.TextLabel.TextColor3 = Data.ToolTipTextColor3
				end
			else
				local OldToolTip = Obj:FindFirstChild("ToolTip")
				if OldToolTip then
					OldToolTip:Destroy()
				end
			end
		end;
		ToolTipText = function(Value)
			Data.ToolTipText = Value
		end;
		AnimationSpeed = function(Value)
			Data.Speed = Value
		end;
		Style = SetStyle;
		ToolTipTextColor3 = function(Value)
			Data.ToolTipTextColor3 = Value
			local OldToolTip = Obj:FindFirstChild("ToolTip")
			if OldToolTip then
				OldToolTip.TextLabel.TextColor3 = Value
			end
		end;
		ToolTipBackgroundColor3 = function(Value)
			Data.ToolTipBackgroundColor3 = Value
			local OldToolTip = Obj:FindFirstChild("ToolTip")
			if OldToolTip then
				OldToolTip.ImageColor3 = Value
			end
		end;
		OutlineColor3 = function(Value)
			Obj.Outline.ImageColor3 = Value
		end;
		TextTransparency = function(Value)
			Obj.Holder.Text.TextTransparency = Value
		end;
		TextColor3 = function(Value)
			Obj.Holder.Text.TextColor3 = Value
		end;
		Text = function(Value)
			Obj.Holder.Text.Text = Value
		end;
		Font = function(Value)
			Obj.Holder.Text.Font = Value
		end;
		TextSize = function(Value)
			Obj.Holder.Text.TextSize = Value
		end;
		RoundSize = SetRoundSize;
		HorizontalAlignment = function(Value)
			Obj.Holder.UIListLayout.HorizontalAlignment = Value
		end;
	}
	local Methods = {
		Clone = function(self,Parent)
			local New = module[This.ClassName .. "_New"](Parent or This.Parent)
			for i,_ in pairs(This:GetProperties()) do
				if not ReadOnly[i] and type(This[i]) ~= "function" and i ~= "ClassName" then
					New[i] = This[i]
				end
			end
			return New
		end;
		TweenSize = function(self,UDimData,EasingDirection,EasingStyle,Time,Overwriteable,EndFunction)
			Obj:TweenSize(UDimData,EasingDirection,EasingStyle,Time,Overwriteable,EndFunction)
		end;
		TweenPosition = function(self,UDimData,EasingDirection,EasingStyle,Time,Overwriteable,EndFunction)
			Obj:TweenPosition(UDimData,EasingDirection,EasingStyle,Time,Overwriteable,EndFunction)
		end;
		TweenSizeAndPosition = function(self,Size,Position,EasingDirection,EasingStyle,Time,Overwriteable,EndFunction)
			Obj:TweenSizeAndPosition(Size,Position,EasingDirection,EasingStyle,Time,Overwriteable,EndFunction)
		end;
		Ripple = function(self,Position)
			Ripple(Position)
			UnRipple()
		end;
	}
	
	This,FireChanged = Class:SetClass(Properties,Getter,Setter,Methods,"Button",ReadOnly,Obj,function()
		Data = nil
		RippleOff:Destroy()
		SetStyle = nil
		SetRoundSize = nil
		SetShadow = nil
		Ripple = nil
		UnRipple = nil
		ToolTip = nil
		BackButtonOn:Destroy()
		BackButtonOff:Destroy()
		MouseDown = nil
	end)
	module:ClassTheme(This)
	return This
end
function module.Snackbars_New(Parent)
	local This,FireChanged
	
	local Obj = script.Class_Snackbar.Snackbars:Clone()
	Obj.Parent = type(Parent) == "table" and Parent.Holder or Parent
	
	local Index = 0
	local Data = {
		OpenTime = 4.5;
		OpenPos = UDim2.new(0,8,1,-8);
		ClosePos = UDim2.new(0,8,1,56);
		Speed = 1;
	}
	
	local function Close()
		Index = Index + 1
		if not Obj:IsDescendantOf(game) then
			Obj.Position = Data.ClosePos
			return
		end
		Obj:TweenPosition(Data.ClosePos,Enum.EasingDirection.Out,Enum.EasingStyle.Quart,0.25/Data.Speed,true,nil)
	end
	
	local function Open()
		do
			Index = Index + 1
			local NowIndex = Index
			Obj:TweenPosition(Data.OpenPos,Enum.EasingDirection.Out,Enum.EasingStyle.Quart,0.25/Data.Speed,true,nil)
			delay(Data.OpenTime,function()
				if NowIndex == Index then
					Close()
				end
			end)
		end
	end
	
	local Properties = Class:MakeDictionary({
		"Visible";
		"Parent";
		"Name";
		"ZIndex";
		"LayoutOrder";
		"Size";
		
		"AbsolutePosition";
		"AbsoluteSize";
		"AnchorPoint";
		"Rotation";
		"AbsoluteRotation";
		
		"Position";
		"ClosePosition";
		
		"TextColor3";
		"Text";
		"Font";
		"TextSize";
		
		"AnimationSpeed";
		"OpenTime";
		
		"Holder";
	})
	local ReadOnly = Class:MakeDictionary({
		"AbsoluteRotation";
		"AbsoluteSize";
		"AbsolutePosition";
		"Holder";
	})
	local Getter = {
		ZIndex = function()
			return Obj.ZIndex - 1
		end;
		Holder = function()
			return Obj.Holder
		end;
		TextSize = function()
			return Obj.TextLabel.TextSize
		end;
		Font = function()
			return Obj.TextLabel.Font
		end;
		TextColor3 = function()
			return Obj.TextLabel.TextColor3
		end;
		Text = function()
			return Obj.TextLabel.Text
		end;
		ClosePosition = function()
			return Data.ClosePos
		end;
		Position = function()
			return Data.OpenPos
		end;
		AnimationSpeed = function()
			return Data.Speed
		end;
		OpenTime = function()
			return Data.OpenTime
		end;
	}
	local Setter = {
		ZIndex = function(Value)
			Obj.ZIndex = Value + 1
			Obj.TextLabel.ZIndex = Value + 1
			Obj.Shadow.ZIndex = Value
		end;
		TextSize = function(Value)
			Obj.TextLabel.TextSize = Value
		end;
		Font = function(Value)
			Obj.TextLabel.Font = Value
		end;
		TextColor3 = function(Value)
			Obj.TextLabel.TextColor3 = Value
		end;
		Text = function(Value)
			Obj.TextLabel.Text = Value
		end;
		ClosePosition = function(Value)
			Data.ClosePos = Value
			Close()
		end;
		Position = function(Value)
			Data.OpenPos = Value
			Close()
		end;
		AnimationSpeed = function(Value)
			Data.Speed = Value
		end;
		OpenTime = function(Value)
			Data.OpenTime = Value
		end;
	}
	local Methods = {
		Clone = function(self,Parent)
			local New = module[This.ClassName .. "_New"](Parent or This.Parent)
			for i,_ in pairs(This:GetProperties()) do
				if not ReadOnly[i] and type(This[i]) ~= "function" and i ~= "ClassName" then
					New[i] = This[i]
				end
			end
			return New
		end;
		Open = Open;
		Close = Close;
	}
	
	This,FireChanged = Class:SetClass(Properties,Getter,Setter,Methods,"Snackbars",ReadOnly,Obj,function()
		Open = nil
		Close = nil
		Data = nil
		Index = nil
	end)
	module:ClassTheme(This)
	return This
end
function module.RadioButton_New(Parent)
	local This,FireChanged
	
	local ValueChanged = Instance.new("BindableEvent")
	local IndexChanged = Instance.new("BindableEvent")
	local SetIndexEvent = Instance.new("BindableEvent")
	local SetValueEvent = Instance.new("BindableEvent")
	local Items = {}
	
	local Obj = script.Class_RadioButton.RadioHolder:Clone()
	Obj.Parent = type(Parent) == "table" and Parent.Holder or Parent
	
	local Data = {
		Speed = 1;
		Value = "";
		Index = 1;
		OnColor = Color3.fromRGB(0,120,255);
		OffColor = Color3.fromRGB(180,180,180);
		RippleColor3 = Color3.fromRGB(255,255,255)
	}
	
	local SetColor = Instance.new("BindableEvent")
	SetColor.Event:Connect(function(ColorName,Color)
		Data[ColorName] = Color
	end)
	
	local Properties = Class:MakeDictionary({
		"Visible";
		"Parent";
		"Name";
		"LayoutOrder";
		"Size";
		"Position";
		"AbsolutePosition";
		"AbsoluteSize";
		"AnchorPoint";
		
		"ZIndex";
		
		"Rotation";
		"AbsoluteRotation";
		
		"AnimationSpeed";
		
		"BackgroundColor3";
		"BackgroundTransparency";
		
		"ValueChanged";
		"IndexChanged";
		"Value";
		"Index";
		
		"SortOrder";
		
		"OnColor3";
		"OffColor3";
		
		"RippleColor3";
	})
	local ReadOnly = Class:MakeDictionary({
		"AbsolutePosition";
		"AbsoluteSize";
		"AbsoluteRotation";
		"ValueChanged";
		"IndexChanged"
	})
	local Getter = {
		AnimationSpeed = function()
			return Data.Speed
		end;
		ValueChanged = function()
			return ValueChanged.Event
		end;
		IndexChanged = function()
			return IndexChanged.Event
		end;
		SortOrder = function()
			return Obj.UIListLayout.SortOrder
		end;
		Index = function()
			return Data.Index
		end;
		Value = function()
			return Data.Value
		end;
		OnColor3 = function()
			return Data.OnColor
		end;
		OffColor3 = function()
			return Data.OffColor
		end;
		RippleColor3 = function()
			return Data.RippleColor3
		end;
	}
	local Setter = {
		ZIndex = function(Value)
			Obj.ZIndex = Value
			for _,v in pairs(Obj:GetChildren()) do
				if v:IsA("TextButton") and v:FindFirstChild("RadioIcon") then
					v.ZIndex = Value + 1
					v.RadioIcon.ZIndex = Value
					v.RippleHolder.ZIndex = Value + 1
					v.MouseOn.ZIndex = Value + 1
				end
			end
		end;
		AnimationSpeed = function(Value)
			Data.Speed = Value
		end;
		SortOrder = function(Value)
			Obj.UIListLayout.SortOrder = Value
		end;
		Index = function(Value)
			SetIndexEvent:Fire(Value)
		end;
		Value = function(Value)
			SetValueEvent:Fire(Value)
		end;
		OnColor3 = function(Value)
			SetColor:Fire("OnColor",Value)
		end;
		OffColor3 = function(Value)
			SetColor:Fire("OffColor",Value)
		end;
		RippleColor3 = function(Value)
			SetColor:Fire("RippleColor3",Value)
		end;
	}
	local Methods = {
		Clone = function(self,Parent)
			local New = module[This.ClassName .. "_New"](Parent or This.Parent)
			for i,_ in pairs(This:GetProperties()) do
				if not ReadOnly[i] and type(This[i]) ~= "function" and i ~= "ClassName" then
					New[i] = This[i]
				end
			end
			return New
		end;
		AddItem = function(self,Index,Name,Text,TextColor3,SizeY)
			local New = script.Class_RadioButton.RadioButton:Clone()
			local SelectChanged = Instance.new("BindableEvent",New)
			
			local ItemObj = {
				IsSelected = false;
				SelectChanged = SelectChanged.Event;
			}
			
			New.Parent = Obj
			New.Name = Name
			New.Text = Text or Name
			New.LayoutOrder = Index
			New.TextColor3 = TextColor3 or module:GetColor("TextColor")
			New.ZIndex = Obj.ZIndex + 1
			New.RadioIcon.ZIndex = Obj.ZIndex
			New.RadioIcon.MouseOn.ZIndex = Obj.ZIndex + 1
			New.Size = UDim2.new(1,0,0,SizeY or 40)
			New.RadioIcon.MouseOn.ImageColor3 = Data.RippleColor3
			--New.RadioIcon.Ripple.ImageColor3 = Data.RippleColor3
			
			local Rippler = module.Rippler_New(New)
			Rippler.Position = UDim2.new(0,-45,0,0)
			Rippler.Size = UDim2.new(1,45,1,0)
			Rippler.RippleColor3 = Data.RippleColor3
			Rippler.ZIndex = Obj.ZIndex + 1
			
			local ImgPage = Instance.new("IntValue",New)
			local OnPage = Tween:Create(ImgPage,TweenInfo.new(0.2/Data.Speed,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0),
				{Value = 9;}
			)
			local OffPage = Tween:Create(ImgPage,TweenInfo.new(0.2/Data.Speed,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0),
				{Value = 0;}
			)
			local OnColor = Tween:Create(New.RadioIcon,TweenInfo.new(0.15/Data.Speed,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0),
				{ImageColor3 = Data.OnColor;}
			)
			local OffColor = Tween:Create(New.RadioIcon,TweenInfo.new(0.15/Data.Speed,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0),
				{ImageColor3 = Data.OffColor;}
			)
			
			local RectOffset = Vector2.new(40,0)
			ImgPage:GetPropertyChangedSignal("Value"):Connect(function()
				New.RadioIcon.ImageRectOffset = RectOffset * ImgPage.Value
			end)
			
			local function SetSelectThis(IsSelected)
				if IsSelected then
					ValueChanged:Fire(Name,Index)
					IndexChanged:Fire(Index,Name)
					FireChanged("Index",Index)
					FireChanged("Value",Name)
					
					OnPage:Play()
					OnColor:Play()
				else
					OffPage:Play()
					OffColor:Play()
				end
				SelectChanged:Fire(IsSelected)
				ItemObj.IsSelected = IsSelected
			end
			
			local ValueEvC = SetValueEvent.Event:Connect(function(CallName)
				local IsSelected = Name == CallName
				SetSelectThis(IsSelected)
			end)
			local IndexEvC = SetIndexEvent.Event:Connect(function(CallIndex)
				local IsSelected = Index == CallIndex
				SetSelectThis(IsSelected)
			end)
			
			local ItemObj = {
				IsSelected = false;
				SelectChanged = SelectChanged.Event;
				Destroy = nil;
				Index = nil;
				Name = nil;
				Text = nil;
				TextColor3 = nil;
			}
			local ItemReadOnly = Class:MakeDictionary({
				"IsSelected","SelectChanged","Destroy"
			})
			local ItemProperties = Class:MakeDictionary({
				"IsSelected";
				"SelectChanged";
				"Destroy";
				"Index";
				"Name";
				"Text";
				"TextColor3";
				"SizeY";
				"Visible";
			})
			
			local ItemMeta = {}
			ItemObj.__newindex = function(self,Key,Value)
				if ItemProperties[Key] == nil then
					error(("%s is not member of RadioItem"))
				elseif ItemReadOnly[Key] then
					error(("%s is ReadOnly"):format(Key))
				elseif Key == "Index" then
					New.LayoutOrder = Value
				elseif Key == "Name" then
					New.Name = Value
				elseif Key == "Text" then
					New.Text = Value
				elseif Key == "TextColor3" then
					New.TextColor3 = Value
				elseif Key == "SizeY" then
					New.Size = UDim2.new(1,0,0,Value or 40)
				elseif Key == "Visible" then
					New.Visible = Value
				else
					ItemObj[Key] = Value
				end
			end
			ItemObj.__index = function(self,Key)
				if ItemProperties[Key] == nil then
					error(("%s is not member of RadioItem"))
				elseif Key == "Index" then
					return New.LayoutOrder
				elseif Key == "Name" then
					return New.Name
				elseif Key == "Text" then
					return New.Text
				elseif Key == "TextColor3" then
					return New.TextColor3
				elseif Key == "SizeY" then
					return New.Size.Offset
				elseif Key == "Visible" then
					return New.Visible
				else
					return ItemObj[Key]
				end
			end
			setmetatable(ItemMeta,ItemObj)
			--New
			
			local SetColorEvC = SetColor.Event:Connect(function(ColorName,Value)
				if ColorName == "OffColor" then
					local Last = OffColor
					OffColor = Tween:Create(New.RadioIcon,TweenInfo.new(0.15/Data.Speed,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0),
						{ImageColor3 = Value;}
					)
					Last:Destroy()
				elseif ColorName == "OnColor" then
					local Last = OnColor
					OnColor = Tween:Create(New.RadioIcon,TweenInfo.new(0.15/Data.Speed,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0),
						{ImageColor3 = Value;}
					)
					Last:Destroy()
				elseif ColorName == "RippleColor3" then
					New.RadioIcon.MouseOn.ImageColor3 = Value
					--New.RadioIcon.Ripple.ImageColor3 = Value
					Rippler.RippleColor3 = Value
				end
				local ChangeColor = ItemMeta.Index == Data.Index and OnColor or OffColor
				ChangeColor:Play()
			end)
			New.MouseButton1Click:Connect(function()
				SetIndexEvent:Fire(ItemMeta.Index)
			end)
			New.MouseEnter:Connect(function()
				New.RadioIcon.MouseOn:TweenSize(UDim2.new(1.7,0,1.7,0),Enum.EasingDirection.Out,Enum.EasingStyle.Quad,0.2/Data.Speed,true,nil)
			end)
			New.MouseLeave:Connect(function()
				New.RadioIcon.MouseOn:TweenSize(UDim2.new(0,0,0,0),Enum.EasingDirection.Out,Enum.EasingStyle.Quad,0.2/Data.Speed,true,nil)
			end)
			
			ItemObj.Destroy = function()
				New:Destroy()
				RectOffset = nil
				OffColor:Destroy()
				OnColor:Destroy()
				OffPage:Destroy()
				OnPage:Destroy()
				SetSelectThis = nil
				ItemProperties = nil
				IndexEvC:Disconnect()
				ValueEvC:Disconnect()
				SetColorEvC:Disconnect()
			end
			
			Items[tostring(Index) .. "_" .. tostring(math.random(1000,9999))] = ItemMeta
			return ItemMeta
		end;
		GetItem = function(self,Index)
			for i,v in pairs(Items) do
				if string.find(i,tostring(Index) .. "_") and v then
					return v
				end
			end;
		end;
		RemoveItem = function(self,Index)
			for i,v in pairs(Items) do
				if string.find(i,tostring(Index) .. "_") and v then
					v:Destroy()
					Items[i] = nil
				end
			end;
		end;
		RemoveAllItems = function(self)
			for i,v in pairs(Items) do
				if v then
					v:Destroy()
					Items[i] = nil
				end
			end;
		end;
		TweenSize = function(self,UDimData,EasingDirection,EasingStyle,Time,Overwriteable,EndFunction)
			Obj:TweenSize(UDimData,EasingDirection,EasingStyle,Time,Overwriteable,EndFunction)
		end;
		TweenPosition = function(self,UDimData,EasingDirection,EasingStyle,Time,Overwriteable,EndFunction)
			Obj:TweenPosition(UDimData,EasingDirection,EasingStyle,Time,Overwriteable,EndFunction)
		end;
		TweenSizeAndPosition = function(self,Size,Position,EasingDirection,EasingStyle,Time,Overwriteable,EndFunction)
			Obj:TweenSizeAndPosition(Size,Position,EasingDirection,EasingStyle,Time,Overwriteable,EndFunction)
		end;
	}
	This,FireChanged = Class:SetClass(Properties,Getter,Setter,Methods,"RadioButton",ReadOnly,Obj,function()
		Data = nil
		Items = nil
		SetValueEvent:Destroy()
		SetIndexEvent:Destroy()
		ValueChanged:Destroy()
		IndexChanged:Destroy()
		SetColor:Destroy()
		Methods.RemoveAllItems()
	end)
	module:ClassTheme(This)
	return This
end

function module:SetRound(ImageLabel,RoundSize)
	Round:SetRound(ImageLabel,RoundSize)
end
function module:SetOutline(ImageLabel,RoundSize)
	Round:SetRound(ImageLabel,RoundSize)
end

function module:GetShadowImage(Size,Index,Parent)
	local New = script.RoundShadow:Clone()
	New.Size = UDim2.new(1,Size or 40,1,Size or 40)
	New.ZIndex = Index or 1
	New.Parent = Parent
	return New
end

local Global_Items = {}
local AliasProperties = {}
local AliasClass = {}
local DefaultPropertyOverwrite = {
	["Frame"] = {
		BorderSizePixel = 0;
	};
	["TextLabel"] = {
		BorderSizePixel = 0;
	};
	["TextBox"] = {
		BorderSizePixel = 0;
	};
	["TextButton"] = {
		BorderSizePixel = 0;
	};
	["ImageLabel"] = {
		BorderSizePixel = 0;
	};
	["ImageButton"] = {
		BorderSizePixel = 0;
	};
	["ScrollingFrame"] = {
		BorderSizePixel = 0;
		CanvasSize = UDim2.new(0,0,0,0);
	};
}
function module:SetDefaultPropertyOverwrite(Table)
	DefaultPropertyOverwrite = Table
end
function module:GetDefaultPropertyOverwrite()
	return DefaultPropertyOverwrite
end

function module:SetClassAlias(Table)-- => table
	if type(Table) ~= "table" then
		error("the Table must be table data!")
	end
	--AliasClass = Table
	AliasClass = Table
end
function module:GetClassAlias()
	return AliasClass
end

function module:SetPropertiesAlias(Table)-- => table
	if type(Table) ~= "table" then
		error("the Table must be table data!")
	end
	--AliasClass = Table
	AliasProperties = Table
end
function module:GetPropertiesAlias()
	return AliasProperties
end

function module:GetGlobalItemsList()
	return Global_Items
end
function module:AddToGlobalItemsList(Item)
	Global_Items[#Global_Items + 1] = Item
end

local ImageItemColorProperties = {
	BackgroundColor3 = true,
	ImageColor3 = true,
	BorderColor3 = true
}
local FrameItemColorProperties = {
	BackgroundColor3 = true,
	BorderColor3 = true
}
local TextItemColorProperties = {
	BackgroundColor3 = true,
	BorderColor3 = true,
	TextColor3 = true
}

function SetByColors(ColorData,Item,Properties)
	for ProPer,_ in pairs(Properties or (module.Themes[module.CurrentTheme][Item.ClassName])) do
		local v = Item[ProPer]
		if typeof(v) == "Color3" --and
			--			(not (Item.ClassName == "ImageLabel" or Item.ClassName == "ImageButton")) or v ~= Color3.fromRGB(255,255,255)
		then	
			local ColorName = ColorData[("%s,%s,%s"):format(tostring(math.floor(v.r*255)),tostring(math.floor(v.g*255)),tostring(math.floor(v.b*255)))]
			local NewColor = module.Themes[module.CurrentTheme][ColorName]
			if NewColor then
				Item[ProPer] = NewColor
			end
			--			for ColorName,OldColor in pairs(ColorData) do
			--				if Item[ProPer] == OldColor then
			--					Item[ProPer] = ColorName
			--				end
			--			end
		end
	end
end
function module:SetGlobalTheme(NewTheme)
	local CurrentTheme = module.CurrentTheme
	module.CurrentTheme = NewTheme
	
	local ColorData = {}
	for i,v in pairs(module.Themes[CurrentTheme]) do
		if typeof(v) == "Color3" then
			--ColorData[i] = v
			ColorData[("%s,%s,%s"):format(tostring(math.floor(v.r*255)),tostring(math.floor(v.g*255)),tostring(math.floor(v.b*255)))] = i
		end
	end
	
	for _,Item in pairs(Global_Items) do
		if Item then
			local ItemTheme = module.Themes[CurrentTheme][Item.ClassName]
			if ItemTheme then
				if type(Item) == "table" then
					for ProPer,Value in pairs(ItemTheme) do
						if Item[ProPer] == Value and module.Themes[NewTheme][Item.ClassName][ProPer] then
							Item[ProPer] = module.Themes[NewTheme][Item.ClassName][ProPer]
						end
					end
					SetByColors(ColorData,Item)
				end
			else
				if Item.ClassName == "ImageLabel" or Item.ClassName == "ImageButton" then
					SetByColors(ColorData,Item,ImageItemColorProperties)
				elseif Item.ClassName == "TextLabel" or Item.ClassName == "TextButton" or Item.ClassName == "TextBox" then
					SetByColors(ColorData,Item,TextItemColorProperties)
				elseif Item.ClassName == "Frame" then
					SetByColors(ColorData,Item,FrameItemColorProperties)
				end
			end
			Run.Stepped:Wait()
		end
	end
	print("MaterialUI : ThemeSetting End!")
end

function module:CleanUp()
	local GlobalItems = module:GetGlobalItemsList()
	for Index,Item in pairs(GlobalItems) do
		if Item and Item.Destroy then
			Item:Destroy()
		end
		GlobalItems[Index] = nil
	end
end

function module.Create(ClassName,Properties,Children,Created)
	local CustomClass
	if type(ClassName) == "function" then
		CustomClass = ClassName(Properties)
	elseif type(ClassName) == "table" then
		CustomClass = ClassName.new or ClassName.New
		CustomClass = CustomClass(Properties)
	end
	
	local CreateFn
	local ClassName = ClassName
	
	if not CustomClass then
		CreateFn = module[ClassName.."_New"]
		ClassName = AliasClass[ClassName] or ClassName
	end
	
	local Obj = CustomClass or (CreateFn == nil and Instance.new(ClassName) or CreateFn())
	
	if DefaultPropertyOverwrite[ClassName] then
		for PropertyName,Value in pairs(DefaultPropertyOverwrite[ClassName]) do
			if Properties == nil or Properties[PropertyName] == nil then
				Obj[PropertyName] = Value
			end
		end
	end
	
	if Properties ~= nil and (not CustomClass) then
		for i,v in pairs(Properties) do
			if i == "WhenCreated" or i == "NotTagging" then
				-- bypass
			elseif typeof(Obj[i]) == "RBXScriptSignal" then
				Obj[i]:Connect(v)
			elseif i == "Parent" then
				Obj[i] = type(v) == "table" and v.Holder or v
			elseif AliasProperties[i] then
				Obj[AliasProperties[i]] = v
			else
				Obj[i] = v
			end
		end
	end
	if Children ~= nil then
		for i,v in pairs(Children) do
			if type(i) == "string" then
				v.Name = i
			end
			v.Parent = type(Obj) == "table" and Obj.Holder or Obj
		end
	end
	if Created then
		coroutine.resume(coroutine.create(function()
			Created(Obj)
		end))
	end
	if Properties and Properties.WhenCreated then
		Properties.WhenCreated(Obj)
	end
	if (not Properties) or (not Properties.NotTagging) then
		Global_Items[#Global_Items + 1] = Obj
	end
	return Obj
end
function module:Draw(GUI)
	GUI.Parent = LocalPlayer:WaitForChild("PlayerGui")
	return GUI
end
--function 
return module