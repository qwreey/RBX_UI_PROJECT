-- Gui to Lua
-- Version: 3.2

-- Instances:

local Gui = {
	resource = Instance.new("Folder"),
	Class_Button = Instance.new("Folder"),
	RoundSize = Instance.new("Folder"),
	_2 = Instance.new("Folder"),
	Img = Instance.new("ImageLabel"),
	RippleContainer = Instance.new("Frame"),
	_0699 = Instance.new("ImageLabel"),
	_0699_2 = Instance.new("ImageLabel"),
	_0699_3 = Instance.new("ImageLabel"),
	_0699_4 = Instance.new("ImageLabel"),
	_0699_5 = Instance.new("ImageLabel"),
	_0885 = Instance.new("ImageLabel"),
	_0885_2 = Instance.new("ImageLabel"),
	_0885_3 = Instance.new("ImageLabel"),
	_0885_4 = Instance.new("ImageLabel"),
	_0724 = Instance.new("ImageLabel"),
	_0724_2 = Instance.new("ImageLabel"),
	_0724_3 = Instance.new("ImageLabel"),
	_0724_4 = Instance.new("ImageLabel"),
	_0724_5 = Instance.new("ImageLabel"),
	_0724_6 = Instance.new("ImageLabel"),
	_0724_7 = Instance.new("ImageLabel"),
	_0724_8 = Instance.new("ImageLabel"),
	Outline = Instance.new("ImageLabel"),
	_4 = Instance.new("Folder"),
	RippleContainer_2 = Instance.new("Frame"),
	_0699_6 = Instance.new("ImageLabel"),
	_0699_7 = Instance.new("ImageLabel"),
	_0699_8 = Instance.new("ImageLabel"),
	_0699_9 = Instance.new("ImageLabel"),
	_0699_10 = Instance.new("ImageLabel"),
	_0699_11 = Instance.new("ImageLabel"),
	_0699_12 = Instance.new("ImageLabel"),
	_0699_13 = Instance.new("ImageLabel"),
	_0699_14 = Instance.new("ImageLabel"),
	_0939 = Instance.new("ImageLabel"),
	_0939_2 = Instance.new("ImageLabel"),
	_0939_3 = Instance.new("ImageLabel"),
	_0939_4 = Instance.new("ImageLabel"),
	_0792 = Instance.new("ImageLabel"),
	_0792_2 = Instance.new("ImageLabel"),
	_0792_3 = Instance.new("ImageLabel"),
	_0792_4 = Instance.new("ImageLabel"),
	_071 = Instance.new("ImageLabel"),
	_071_2 = Instance.new("ImageLabel"),
	_071_3 = Instance.new("ImageLabel"),
	_071_4 = Instance.new("ImageLabel"),
	_0939_5 = Instance.new("ImageLabel"),
	_0939_6 = Instance.new("ImageLabel"),
	_0939_7 = Instance.new("ImageLabel"),
	_0939_8 = Instance.new("ImageLabel"),
	_071_5 = Instance.new("ImageLabel"),
	_071_6 = Instance.new("ImageLabel"),
	_071_7 = Instance.new("ImageLabel"),
	_071_8 = Instance.new("ImageLabel"),
	_0792_5 = Instance.new("ImageLabel"),
	_0792_6 = Instance.new("ImageLabel"),
	_0792_7 = Instance.new("ImageLabel"),
	_0792_8 = Instance.new("ImageLabel"),
	_071_9 = Instance.new("ImageLabel"),
	_071_10 = Instance.new("ImageLabel"),
	_071_11 = Instance.new("ImageLabel"),
	_071_12 = Instance.new("ImageLabel"),
	Img_2 = Instance.new("ImageLabel"),
	Outline_2 = Instance.new("ImageLabel"),
	_8 = Instance.new("Folder"),
	Img_3 = Instance.new("ImageLabel"),
	RippleContainer_3 = Instance.new("Frame"),
	_0699_15 = Instance.new("ImageLabel"),
	_0699_16 = Instance.new("ImageLabel"),
	_0699_17 = Instance.new("ImageLabel"),
	_0699_18 = Instance.new("ImageLabel"),
	_0699_19 = Instance.new("ImageLabel"),
	_0699_20 = Instance.new("ImageLabel"),
	_0699_21 = Instance.new("ImageLabel"),
	_0699_22 = Instance.new("ImageLabel"),
	_0699_23 = Instance.new("ImageLabel"),
	_0699_24 = Instance.new("ImageLabel"),
	_0699_25 = Instance.new("ImageLabel"),
	_0699_26 = Instance.new("ImageLabel"),
	_0699_27 = Instance.new("ImageLabel"),
	_0932 = Instance.new("ImageLabel"),
	_0932_2 = Instance.new("ImageLabel"),
	_0932_3 = Instance.new("ImageLabel"),
	_0932_4 = Instance.new("ImageLabel"),
	_0821 = Instance.new("ImageLabel"),
	_0821_2 = Instance.new("ImageLabel"),
	_0821_3 = Instance.new("ImageLabel"),
	_0821_4 = Instance.new("ImageLabel"),
	_0744 = Instance.new("ImageLabel"),
	_0744_2 = Instance.new("ImageLabel"),
	_0744_3 = Instance.new("ImageLabel"),
	_0744_4 = Instance.new("ImageLabel"),
	_0704 = Instance.new("ImageLabel"),
	_0704_2 = Instance.new("ImageLabel"),
	_0704_3 = Instance.new("ImageLabel"),
	_0704_4 = Instance.new("ImageLabel"),
	_0821_5 = Instance.new("ImageLabel"),
	_0821_6 = Instance.new("ImageLabel"),
	_0821_7 = Instance.new("ImageLabel"),
	_0821_8 = Instance.new("ImageLabel"),
	_0783 = Instance.new("ImageLabel"),
	_0783_2 = Instance.new("ImageLabel"),
	_0783_3 = Instance.new("ImageLabel"),
	_0783_4 = Instance.new("ImageLabel"),
	_0821_9 = Instance.new("ImageLabel"),
	_0821_10 = Instance.new("ImageLabel"),
	_0821_11 = Instance.new("ImageLabel"),
	_0821_12 = Instance.new("ImageLabel"),
	_0932_5 = Instance.new("ImageLabel"),
	_0932_6 = Instance.new("ImageLabel"),
	_0932_7 = Instance.new("ImageLabel"),
	_0932_8 = Instance.new("ImageLabel"),
	_0821_13 = Instance.new("ImageLabel"),
	_0821_14 = Instance.new("ImageLabel"),
	_0821_15 = Instance.new("ImageLabel"),
	_0821_16 = Instance.new("ImageLabel"),
	_0744_5 = Instance.new("ImageLabel"),
	_0744_6 = Instance.new("ImageLabel"),
	_0744_7 = Instance.new("ImageLabel"),
	_0744_8 = Instance.new("ImageLabel"),
	_0704_5 = Instance.new("ImageLabel"),
	_0704_6 = Instance.new("ImageLabel"),
	_0704_7 = Instance.new("ImageLabel"),
	_0704_8 = Instance.new("ImageLabel"),
	Outline_3 = Instance.new("ImageLabel"),
	Button = Instance.new("ImageButton"),
	AmbientShadow = Instance.new("ImageLabel"),
	PenumbraShadow = Instance.new("ImageLabel"),
	UmbraShadow = Instance.new("ImageLabel"),
	Outline_4 = Instance.new("ImageLabel"),
	On = Instance.new("ImageLabel"),
	Holder = Instance.new("Frame"),
	Text = Instance.new("TextLabel"),
	UIListLayout = Instance.new("UIListLayout"),
	ImageLabel = Instance.new("ImageLabel"),
	UIPadding = Instance.new("UIPadding"),
	RippleContainer_4 = Instance.new("Frame"),
	_0699_28 = Instance.new("ImageLabel"),
	_0699_29 = Instance.new("ImageLabel"),
	_0699_30 = Instance.new("ImageLabel"),
	_0699_31 = Instance.new("ImageLabel"),
	_0699_32 = Instance.new("ImageLabel"),
	_0699_33 = Instance.new("ImageLabel"),
	_0699_34 = Instance.new("ImageLabel"),
	_0699_35 = Instance.new("ImageLabel"),
	_0699_36 = Instance.new("ImageLabel"),
	_0699_37 = Instance.new("ImageLabel"),
	_0699_38 = Instance.new("ImageLabel"),
	_0699_39 = Instance.new("ImageLabel"),
	_0699_40 = Instance.new("ImageLabel"),
	_0932_9 = Instance.new("ImageLabel"),
	_0932_10 = Instance.new("ImageLabel"),
	_0932_11 = Instance.new("ImageLabel"),
	_0932_12 = Instance.new("ImageLabel"),
	_0821_17 = Instance.new("ImageLabel"),
	_0821_18 = Instance.new("ImageLabel"),
	_0821_19 = Instance.new("ImageLabel"),
	_0821_20 = Instance.new("ImageLabel"),
	_0744_9 = Instance.new("ImageLabel"),
	_0744_10 = Instance.new("ImageLabel"),
	_0744_11 = Instance.new("ImageLabel"),
	_0744_12 = Instance.new("ImageLabel"),
	_0704_9 = Instance.new("ImageLabel"),
	_0704_10 = Instance.new("ImageLabel"),
	_0704_11 = Instance.new("ImageLabel"),
	_0704_12 = Instance.new("ImageLabel"),
	_0821_21 = Instance.new("ImageLabel"),
	_0821_22 = Instance.new("ImageLabel"),
	_0821_23 = Instance.new("ImageLabel"),
	_0821_24 = Instance.new("ImageLabel"),
	_0783_5 = Instance.new("ImageLabel"),
	_0783_6 = Instance.new("ImageLabel"),
	_0783_7 = Instance.new("ImageLabel"),
	_0783_8 = Instance.new("ImageLabel"),
	_0821_25 = Instance.new("ImageLabel"),
	_0821_26 = Instance.new("ImageLabel"),
	_0821_27 = Instance.new("ImageLabel"),
	_0821_28 = Instance.new("ImageLabel"),
	_0932_13 = Instance.new("ImageLabel"),
	_0932_14 = Instance.new("ImageLabel"),
	_0932_15 = Instance.new("ImageLabel"),
	_0932_16 = Instance.new("ImageLabel"),
	_0821_29 = Instance.new("ImageLabel"),
	_0821_30 = Instance.new("ImageLabel"),
	_0821_31 = Instance.new("ImageLabel"),
	_0821_32 = Instance.new("ImageLabel"),
	_0744_13 = Instance.new("ImageLabel"),
	_0744_14 = Instance.new("ImageLabel"),
	_0744_15 = Instance.new("ImageLabel"),
	_0744_16 = Instance.new("ImageLabel"),
	_0704_13 = Instance.new("ImageLabel"),
	_0704_14 = Instance.new("ImageLabel"),
	_0704_15 = Instance.new("ImageLabel"),
	_0704_16 = Instance.new("ImageLabel"),
	Disabled = Instance.new("ImageLabel"),
	Class_CheckBox = Instance.new("Folder"),
	CheckBox = Instance.new("ImageButton"),
	Box = Instance.new("ImageLabel"),
	CheckText = Instance.new("TextButton"),
	MouseOn = Instance.new("ImageLabel"),
	Side = Instance.new("Frame"),
	L = Instance.new("Frame"),
	R = Instance.new("Frame"),
	T = Instance.new("Frame"),
	B = Instance.new("Frame"),
	MouseDown = Instance.new("ImageLabel"),
	Class_IconButton = Instance.new("Folder"),
	IconButton = Instance.new("ImageButton"),
	ButtonImage = Instance.new("ImageLabel"),
	On_2 = Instance.new("ImageLabel"),
	Disabled_2 = Instance.new("ImageLabel"),
	shadow = Instance.new("ImageLabel"),
	Class_IndeterminateCircle = Instance.new("Folder"),
	IndeterminateCircle = Instance.new("Frame"),
	Holder_2 = Instance.new("ImageLabel"),
	Class_IndeterminateProgress = Instance.new("Folder"),
	IndeterminateProgress = Instance.new("Frame"),
	Bar = Instance.new("Frame"),
	Class_LinearProgress = Instance.new("Folder"),
	LinearProgress = Instance.new("Frame"),
	bar = Instance.new("Frame"),
	Class_Pointing = Instance.new("Folder"),
	Pointing = Instance.new("Frame"),
	Pointer = Instance.new("ImageLabel"),
	PointerRipple = Instance.new("ImageLabel"),
	Class_RadioButton = Instance.new("Folder"),
	RadioHolder = Instance.new("Frame"),
	UIListLayout_2 = Instance.new("UIListLayout"),
	RadioButton = Instance.new("TextButton"),
	RadioIcon = Instance.new("ImageButton"),
	MouseOn_2 = Instance.new("ImageLabel"),
	UIPadding_2 = Instance.new("UIPadding"),
	Class_Ripple = Instance.new("Folder"),
	Ripple = Instance.new("ImageLabel"),
	RippleHolder = Instance.new("Frame"),
	Class_Scroll = Instance.new("Folder"),
	Scroll = Instance.new("Frame"),
	Holder_3 = Instance.new("ScrollingFrame"),
	UIListLayout_3 = Instance.new("UIListLayout"),
	InputFrame = Instance.new("ScrollingFrame"),
	Class_Shadow = Instance.new("Folder"),
	Shadow = Instance.new("Frame"),
	B_2 = Instance.new("ImageLabel"),
	L_2 = Instance.new("ImageLabel"),
	LB = Instance.new("ImageLabel"),
	LT = Instance.new("ImageLabel"),
	R_2 = Instance.new("ImageLabel"),
	RB = Instance.new("ImageLabel"),
	RT = Instance.new("ImageLabel"),
	T_2 = Instance.new("ImageLabel"),
	Class_Silder = Instance.new("Folder"),
	Silder = Instance.new("Frame"),
	Point = Instance.new("ImageLabel"),
	MouseOn_3 = Instance.new("ImageLabel"),
	MouseDown_2 = Instance.new("ImageLabel"),
	ValueLabel = Instance.new("ImageLabel"),
	Text_2 = Instance.new("TextLabel"),
	Disabled_3 = Instance.new("ImageLabel"),
	Back = Instance.new("Frame"),
	MouseButton = Instance.new("TextButton"),
	GridFrame = Instance.new("Frame"),
	Disabled_4 = Instance.new("Frame"),
	Class_Snackbar = Instance.new("Folder"),
	Snackbars = Instance.new("ImageLabel"),
	TextLabel = Instance.new("TextLabel"),
	Shadow_2 = Instance.new("ImageLabel"),
	Holder_4 = Instance.new("Frame"),
	UIListLayout_4 = Instance.new("UIListLayout"),
	UIPadding_3 = Instance.new("UIPadding"),
	Class_Switch = Instance.new("Folder"),
	Switch = Instance.new("ImageButton"),
	Thumb = Instance.new("ImageLabel"),
	Shadow_3 = Instance.new("ImageLabel"),
	MouseOn_4 = Instance.new("ImageLabel"),
	MouseDown_3 = Instance.new("ImageLabel"),
	UIPadding_4 = Instance.new("UIPadding"),
	Class_Tabs = Instance.new("Folder"),
	Tabs = Instance.new("Frame"),
	Pages = Instance.new("Frame"),
	PageLayout = Instance.new("UIPageLayout"),
	Bar_2 = Instance.new("Frame"),
	Point_2 = Instance.new("Frame"),
	Shadow_4 = Instance.new("ImageLabel"),
	Buttons = Instance.new("ScrollingFrame"),
	ListLayout = Instance.new("UIListLayout"),
	InputFrame_2 = Instance.new("ScrollingFrame"),
	TabFrame = Instance.new("Frame"),
	TabButton = Instance.new("TextButton"),
	Holder_5 = Instance.new("Frame"),
	Icon = Instance.new("ImageLabel"),
	TextLabel_2 = Instance.new("TextLabel"),
	UIListLayout_5 = Instance.new("UIListLayout"),
	Class_TextField = Instance.new("Folder"),
	TextField = Instance.new("TextBox"),
	Placeholder = Instance.new("TextLabel"),
	Style = Instance.new("Folder"),
	Filled = Instance.new("Folder"),
	Bar_3 = Instance.new("Frame"),
	Padding = Instance.new("UIPadding"),
	Filled_2 = Instance.new("ImageLabel"),
	ErrorText = Instance.new("TextLabel"),
	MouseOn_5 = Instance.new("ImageLabel"),
	HelperText = Instance.new("TextLabel"),
	Text_3 = Instance.new("Folder"),
	Bar_4 = Instance.new("Frame"),
	ErrorText_2 = Instance.new("TextLabel"),
	HelperText_2 = Instance.new("TextLabel"),
	Outlined = Instance.new("Folder"),
	LBar = Instance.new("Frame"),
	RBar = Instance.new("Frame"),
	TopBarL = Instance.new("Frame"),
	TopBarR = Instance.new("Frame"),
	Bar_5 = Instance.new("Frame"),
	ErrorText_3 = Instance.new("TextLabel"),
	Padding_2 = Instance.new("UIPadding"),
	HelperText_3 = Instance.new("TextLabel"),
	ErrorEffect = Instance.new("UIPadding"),
	Class_ToolTip = Instance.new("Folder"),
	ToolTip = Instance.new("ImageLabel"),
	TextLabel_3 = Instance.new("TextLabel"),
	Class_TreeView = Instance.new("Folder"),
	TreeView = Instance.new("Frame"),
	Lable = Instance.new("Frame"),
	TextLabel_4 = Instance.new("TextLabel"),
	IconOpen = Instance.new("ImageButton"),
	Item = Instance.new("Frame"),
	UIListLayout_6 = Instance.new("UIListLayout"),
	RoundShadow = Instance.new("ImageLabel"),
}

--Properties:

Gui.resource.Name = "resource"
--Gui.resource.Parent = game.Workspace.MaterialUI

Gui.Class_Button.Name = "Class_Button"
Gui.Class_Button.Parent = Gui.resource

Gui.RoundSize.Name = "RoundSize"
Gui.RoundSize.Parent = Gui.Class_Button

Gui._2.Name = "2"
Gui._2.Parent = Gui.RoundSize

Gui.Img.Name = "Img"
Gui.Img.Parent = Gui._2
Gui.Img.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.Img.Size = UDim2.new(0, 100, 0, 100)
Gui.Img.Image = "rbxassetid://1934672242"
Gui.Img.ScaleType = Enum.ScaleType.Slice
Gui.Img.SliceCenter = Rect.new(2, 2, 254, 254)

Gui.RippleContainer.Name = "RippleContainer"
Gui.RippleContainer.Parent = Gui._2
Gui.RippleContainer.AnchorPoint = Vector2.new(0.5, 0.5)
Gui.RippleContainer.BackgroundTransparency = 1.000
Gui.RippleContainer.BorderSizePixel = 0
Gui.RippleContainer.ClipsDescendants = true
Gui.RippleContainer.Position = UDim2.new(0.5, 0, 0.5, 0)
Gui.RippleContainer.Size = UDim2.new(1, 0, 1, 0)
Gui.RippleContainer.ZIndex = 3

Gui._0699.Name = "0.699"
Gui._0699.Parent = Gui.RippleContainer
Gui._0699.BackgroundTransparency = 1.000
Gui._0699.ClipsDescendants = true
Gui._0699.Position = UDim2.new(0, 2, 0, 0)
Gui._0699.Size = UDim2.new(1, -4, 0, 1)

Gui._0699_2.Name = "0.699"
Gui._0699_2.Parent = Gui.RippleContainer
Gui._0699_2.BackgroundTransparency = 1.000
Gui._0699_2.ClipsDescendants = true
Gui._0699_2.Position = UDim2.new(0, 2, 1, -1)
Gui._0699_2.Size = UDim2.new(1, -4, 0, 1)

Gui._0699_3.Name = "0.699"
Gui._0699_3.Parent = Gui.RippleContainer
Gui._0699_3.BackgroundTransparency = 1.000
Gui._0699_3.ClipsDescendants = true
Gui._0699_3.Position = UDim2.new(0, 0, 0, 2)
Gui._0699_3.Size = UDim2.new(0, 1, 1, -4)

Gui._0699_4.Name = "0.699"
Gui._0699_4.Parent = Gui.RippleContainer
Gui._0699_4.BackgroundTransparency = 1.000
Gui._0699_4.ClipsDescendants = true
Gui._0699_4.Position = UDim2.new(1, -1, 0, 2)
Gui._0699_4.Size = UDim2.new(0, 1, 1, -4)

Gui._0699_5.Name = "0.699"
Gui._0699_5.Parent = Gui.RippleContainer
Gui._0699_5.BackgroundTransparency = 1.000
Gui._0699_5.ClipsDescendants = true
Gui._0699_5.Position = UDim2.new(0, 1, 0, 1)
Gui._0699_5.Size = UDim2.new(1, -2, 1, -2)

Gui._0885.Name = "0.885"
Gui._0885.Parent = Gui.RippleContainer
Gui._0885.BackgroundTransparency = 1.000
Gui._0885.ClipsDescendants = true
Gui._0885.Size = UDim2.new(0, 1, 0, 1)
Gui._0885.ImageTransparency = 0.620

Gui._0885_2.Name = "0.885"
Gui._0885_2.Parent = Gui.RippleContainer
Gui._0885_2.BackgroundTransparency = 1.000
Gui._0885_2.ClipsDescendants = true
Gui._0885_2.Position = UDim2.new(0, 0, 1, -1)
Gui._0885_2.Size = UDim2.new(0, 1, 0, 1)
Gui._0885_2.ImageTransparency = 0.620

Gui._0885_3.Name = "0.885"
Gui._0885_3.Parent = Gui.RippleContainer
Gui._0885_3.BackgroundTransparency = 1.000
Gui._0885_3.ClipsDescendants = true
Gui._0885_3.Position = UDim2.new(1, -1, 0, 0)
Gui._0885_3.Size = UDim2.new(0, 1, 0, 1)
Gui._0885_3.ImageTransparency = 0.620

Gui._0885_4.Name = "0.885"
Gui._0885_4.Parent = Gui.RippleContainer
Gui._0885_4.BackgroundTransparency = 1.000
Gui._0885_4.ClipsDescendants = true
Gui._0885_4.Position = UDim2.new(1, -1, 1, -1)
Gui._0885_4.Size = UDim2.new(0, 1, 0, 1)
Gui._0885_4.ImageTransparency = 0.620

Gui._0724.Name = "0.724"
Gui._0724.Parent = Gui.RippleContainer
Gui._0724.BackgroundTransparency = 1.000
Gui._0724.ClipsDescendants = true
Gui._0724.Position = UDim2.new(0, 1, 0, 0)
Gui._0724.Size = UDim2.new(0, 1, 0, 1)
Gui._0724.ImageTransparency = 0.082

Gui._0724_2.Name = "0.724"
Gui._0724_2.Parent = Gui.RippleContainer
Gui._0724_2.BackgroundTransparency = 1.000
Gui._0724_2.ClipsDescendants = true
Gui._0724_2.Position = UDim2.new(0, 1, 1, -1)
Gui._0724_2.Size = UDim2.new(0, 1, 0, 1)
Gui._0724_2.ImageTransparency = 0.082

Gui._0724_3.Name = "0.724"
Gui._0724_3.Parent = Gui.RippleContainer
Gui._0724_3.BackgroundTransparency = 1.000
Gui._0724_3.ClipsDescendants = true
Gui._0724_3.Position = UDim2.new(1, -2, 0, 0)
Gui._0724_3.Size = UDim2.new(0, 1, 0, 1)
Gui._0724_3.ImageTransparency = 0.082

Gui._0724_4.Name = "0.724"
Gui._0724_4.Parent = Gui.RippleContainer
Gui._0724_4.BackgroundTransparency = 1.000
Gui._0724_4.ClipsDescendants = true
Gui._0724_4.Position = UDim2.new(1, -2, 1, -1)
Gui._0724_4.Size = UDim2.new(0, 1, 0, 1)
Gui._0724_4.ImageTransparency = 0.082

Gui._0724_5.Name = "0.724"
Gui._0724_5.Parent = Gui.RippleContainer
Gui._0724_5.BackgroundTransparency = 1.000
Gui._0724_5.ClipsDescendants = true
Gui._0724_5.Position = UDim2.new(0, 0, 0, 1)
Gui._0724_5.Size = UDim2.new(0, 1, 0, 1)
Gui._0724_5.ImageTransparency = 0.082

Gui._0724_6.Name = "0.724"
Gui._0724_6.Parent = Gui.RippleContainer
Gui._0724_6.BackgroundTransparency = 1.000
Gui._0724_6.ClipsDescendants = true
Gui._0724_6.Position = UDim2.new(0, 0, 1, -2)
Gui._0724_6.Size = UDim2.new(0, 1, 0, 1)
Gui._0724_6.ImageTransparency = 0.082

Gui._0724_7.Name = "0.724"
Gui._0724_7.Parent = Gui.RippleContainer
Gui._0724_7.BackgroundTransparency = 1.000
Gui._0724_7.ClipsDescendants = true
Gui._0724_7.Position = UDim2.new(1, -1, 0, 1)
Gui._0724_7.Size = UDim2.new(0, 1, 0, 1)
Gui._0724_7.ImageTransparency = 0.082

Gui._0724_8.Name = "0.724"
Gui._0724_8.Parent = Gui.RippleContainer
Gui._0724_8.BackgroundTransparency = 1.000
Gui._0724_8.ClipsDescendants = true
Gui._0724_8.Position = UDim2.new(1, -1, 1, -2)
Gui._0724_8.Size = UDim2.new(0, 1, 0, 1)
Gui._0724_8.ImageTransparency = 0.082

Gui.Outline.Name = "Outline"
Gui.Outline.Parent = Gui._2
Gui.Outline.BackgroundTransparency = 1.000
Gui.Outline.Size = UDim2.new(1, 0, 1, 0)
Gui.Outline.ZIndex = 3
Gui.Outline.Image = "rbxassetid://1981015282"
Gui.Outline.ImageColor3 = Color3.fromRGB(0, 0, 0)
Gui.Outline.ImageTransparency = 0.880
Gui.Outline.ScaleType = Enum.ScaleType.Slice
Gui.Outline.SliceCenter = Rect.new(2, 2, 254, 254)

Gui._4.Name = "4"
Gui._4.Parent = Gui.RoundSize

Gui.RippleContainer_2.Name = "RippleContainer"
Gui.RippleContainer_2.Parent = Gui._4
Gui.RippleContainer_2.AnchorPoint = Vector2.new(0.5, 0.5)
Gui.RippleContainer_2.BackgroundTransparency = 1.000
Gui.RippleContainer_2.BorderSizePixel = 0
Gui.RippleContainer_2.Position = UDim2.new(0.5, 0, 0.5, 0)
Gui.RippleContainer_2.Size = UDim2.new(1, 0, 1, 0)
Gui.RippleContainer_2.ZIndex = 3

Gui._0699_6.Name = "0.699"
Gui._0699_6.Parent = Gui.RippleContainer_2
Gui._0699_6.BackgroundTransparency = 1.000
Gui._0699_6.ClipsDescendants = true
Gui._0699_6.Position = UDim2.new(0, 4, 0, 0)
Gui._0699_6.Size = UDim2.new(1, -8, 0, 1)

Gui._0699_7.Name = "0.699"
Gui._0699_7.Parent = Gui.RippleContainer_2
Gui._0699_7.BackgroundTransparency = 1.000
Gui._0699_7.ClipsDescendants = true
Gui._0699_7.Position = UDim2.new(0, 4, 1, -1)
Gui._0699_7.Size = UDim2.new(1, -8, 0, 1)

Gui._0699_8.Name = "0.699"
Gui._0699_8.Parent = Gui.RippleContainer_2
Gui._0699_8.BackgroundTransparency = 1.000
Gui._0699_8.ClipsDescendants = true
Gui._0699_8.Position = UDim2.new(0, 0, 0, 4)
Gui._0699_8.Size = UDim2.new(0, 1, 1, -8)

Gui._0699_9.Name = "0.699"
Gui._0699_9.Parent = Gui.RippleContainer_2
Gui._0699_9.BackgroundTransparency = 1.000
Gui._0699_9.ClipsDescendants = true
Gui._0699_9.Position = UDim2.new(1, -1, 0, 4)
Gui._0699_9.Size = UDim2.new(0, 1, 1, -8)

Gui._0699_10.Name = "0.699"
Gui._0699_10.Parent = Gui.RippleContainer_2
Gui._0699_10.BackgroundTransparency = 1.000
Gui._0699_10.ClipsDescendants = true
Gui._0699_10.Position = UDim2.new(0, 2, 0, 2)
Gui._0699_10.Size = UDim2.new(1, -4, 1, -4)

Gui._0699_11.Name = "0.699"
Gui._0699_11.Parent = Gui.RippleContainer_2
Gui._0699_11.BackgroundTransparency = 1.000
Gui._0699_11.ClipsDescendants = true
Gui._0699_11.Position = UDim2.new(0, 2, 0, 1)
Gui._0699_11.Size = UDim2.new(1, -4, 0, 1)

Gui._0699_12.Name = "0.699"
Gui._0699_12.Parent = Gui.RippleContainer_2
Gui._0699_12.BackgroundTransparency = 1.000
Gui._0699_12.ClipsDescendants = true
Gui._0699_12.Position = UDim2.new(0, 2, 1, -2)
Gui._0699_12.Size = UDim2.new(1, -4, 0, 1)

Gui._0699_13.Name = "0.699"
Gui._0699_13.Parent = Gui.RippleContainer_2
Gui._0699_13.BackgroundTransparency = 1.000
Gui._0699_13.ClipsDescendants = true
Gui._0699_13.Position = UDim2.new(0, 1, 0, 2)
Gui._0699_13.Size = UDim2.new(0, 1, 1, -4)

Gui._0699_14.Name = "0.699"
Gui._0699_14.Parent = Gui.RippleContainer_2
Gui._0699_14.BackgroundTransparency = 1.000
Gui._0699_14.ClipsDescendants = true
Gui._0699_14.Position = UDim2.new(1, -2, 0, 2)
Gui._0699_14.Size = UDim2.new(0, 1, 1, -4)

Gui._0939.Name = "0.939"
Gui._0939.Parent = Gui.RippleContainer_2
Gui._0939.BackgroundTransparency = 1.000
Gui._0939.ClipsDescendants = true
Gui._0939.Position = UDim2.new(0, 1, 0, 0)
Gui._0939.Size = UDim2.new(0, 1, 0, 1)
Gui._0939.ImageTransparency = 0.800

Gui._0939_2.Name = "0.939"
Gui._0939_2.Parent = Gui.RippleContainer_2
Gui._0939_2.BackgroundTransparency = 1.000
Gui._0939_2.ClipsDescendants = true
Gui._0939_2.Position = UDim2.new(0, 1, 1, -1)
Gui._0939_2.Size = UDim2.new(0, 1, 0, 1)
Gui._0939_2.ImageTransparency = 0.800

Gui._0939_3.Name = "0.939"
Gui._0939_3.Parent = Gui.RippleContainer_2
Gui._0939_3.BackgroundTransparency = 1.000
Gui._0939_3.ClipsDescendants = true
Gui._0939_3.Position = UDim2.new(1, -2, 0, 0)
Gui._0939_3.Size = UDim2.new(0, 1, 0, 1)
Gui._0939_3.ImageTransparency = 0.800

Gui._0939_4.Name = "0.939"
Gui._0939_4.Parent = Gui.RippleContainer_2
Gui._0939_4.BackgroundTransparency = 1.000
Gui._0939_4.ClipsDescendants = true
Gui._0939_4.Position = UDim2.new(1, -2, 1, -1)
Gui._0939_4.Size = UDim2.new(0, 1, 0, 1)
Gui._0939_4.ImageTransparency = 0.800

Gui._0792.Name = "0.792"
Gui._0792.Parent = Gui.RippleContainer_2
Gui._0792.BackgroundTransparency = 1.000
Gui._0792.ClipsDescendants = true
Gui._0792.Position = UDim2.new(0, 2, 0, 0)
Gui._0792.Size = UDim2.new(0, 1, 0, 1)
Gui._0792.ImageTransparency = 0.310

Gui._0792_2.Name = "0.792"
Gui._0792_2.Parent = Gui.RippleContainer_2
Gui._0792_2.BackgroundTransparency = 1.000
Gui._0792_2.ClipsDescendants = true
Gui._0792_2.Position = UDim2.new(0, 2, 1, -1)
Gui._0792_2.Size = UDim2.new(0, 1, 0, 1)
Gui._0792_2.ImageTransparency = 0.310

Gui._0792_3.Name = "0.792"
Gui._0792_3.Parent = Gui.RippleContainer_2
Gui._0792_3.BackgroundTransparency = 1.000
Gui._0792_3.ClipsDescendants = true
Gui._0792_3.Position = UDim2.new(1, -3, 0, 0)
Gui._0792_3.Size = UDim2.new(0, 1, 0, 1)
Gui._0792_3.ImageTransparency = 0.310

Gui._0792_4.Name = "0.792"
Gui._0792_4.Parent = Gui.RippleContainer_2
Gui._0792_4.BackgroundTransparency = 1.000
Gui._0792_4.ClipsDescendants = true
Gui._0792_4.Position = UDim2.new(1, -3, 1, -1)
Gui._0792_4.Size = UDim2.new(0, 1, 0, 1)
Gui._0792_4.ImageTransparency = 0.310

Gui._071.Name = "0.71"
Gui._071.Parent = Gui.RippleContainer_2
Gui._071.BackgroundTransparency = 1.000
Gui._071.ClipsDescendants = true
Gui._071.Position = UDim2.new(0, 3, 0, 0)
Gui._071.Size = UDim2.new(0, 1, 0, 1)
Gui._071.ImageTransparency = 0.035

Gui._071_2.Name = "0.71"
Gui._071_2.Parent = Gui.RippleContainer_2
Gui._071_2.BackgroundTransparency = 1.000
Gui._071_2.ClipsDescendants = true
Gui._071_2.Position = UDim2.new(0, 3, 1, -1)
Gui._071_2.Size = UDim2.new(0, 1, 0, 1)
Gui._071_2.ImageTransparency = 0.035

Gui._071_3.Name = "0.71"
Gui._071_3.Parent = Gui.RippleContainer_2
Gui._071_3.BackgroundTransparency = 1.000
Gui._071_3.ClipsDescendants = true
Gui._071_3.Position = UDim2.new(1, -4, 0, 0)
Gui._071_3.Size = UDim2.new(0, 1, 0, 1)
Gui._071_3.ImageTransparency = 0.035

Gui._071_4.Name = "0.71"
Gui._071_4.Parent = Gui.RippleContainer_2
Gui._071_4.BackgroundTransparency = 1.000
Gui._071_4.ClipsDescendants = true
Gui._071_4.Position = UDim2.new(1, -4, 1, -1)
Gui._071_4.Size = UDim2.new(0, 1, 0, 1)
Gui._071_4.ImageTransparency = 0.035

Gui._0939_5.Name = "0.939"
Gui._0939_5.Parent = Gui.RippleContainer_2
Gui._0939_5.BackgroundTransparency = 1.000
Gui._0939_5.ClipsDescendants = true
Gui._0939_5.Position = UDim2.new(0, 0, 0, 1)
Gui._0939_5.Size = UDim2.new(0, 1, 0, 1)
Gui._0939_5.ImageTransparency = 0.800

Gui._0939_6.Name = "0.939"
Gui._0939_6.Parent = Gui.RippleContainer_2
Gui._0939_6.BackgroundTransparency = 1.000
Gui._0939_6.ClipsDescendants = true
Gui._0939_6.Position = UDim2.new(0, 0, 1, -2)
Gui._0939_6.Size = UDim2.new(0, 1, 0, 1)
Gui._0939_6.ImageTransparency = 0.800

Gui._0939_7.Name = "0.939"
Gui._0939_7.Parent = Gui.RippleContainer_2
Gui._0939_7.BackgroundTransparency = 1.000
Gui._0939_7.ClipsDescendants = true
Gui._0939_7.Position = UDim2.new(1, -1, 0, 1)
Gui._0939_7.Size = UDim2.new(0, 1, 0, 1)
Gui._0939_7.ImageTransparency = 0.800

Gui._0939_8.Name = "0.939"
Gui._0939_8.Parent = Gui.RippleContainer_2
Gui._0939_8.BackgroundTransparency = 1.000
Gui._0939_8.ClipsDescendants = true
Gui._0939_8.Position = UDim2.new(1, -1, 1, -2)
Gui._0939_8.Size = UDim2.new(0, 1, 0, 1)
Gui._0939_8.ImageTransparency = 0.800

Gui._071_5.Name = "0.71"
Gui._071_5.Parent = Gui.RippleContainer_2
Gui._071_5.BackgroundTransparency = 1.000
Gui._071_5.ClipsDescendants = true
Gui._071_5.Position = UDim2.new(0, 1, 0, 1)
Gui._071_5.Size = UDim2.new(0, 1, 0, 1)
Gui._071_5.ImageTransparency = 0.035

Gui._071_6.Name = "0.71"
Gui._071_6.Parent = Gui.RippleContainer_2
Gui._071_6.BackgroundTransparency = 1.000
Gui._071_6.ClipsDescendants = true
Gui._071_6.Position = UDim2.new(0, 1, 1, -2)
Gui._071_6.Size = UDim2.new(0, 1, 0, 1)
Gui._071_6.ImageTransparency = 0.035

Gui._071_7.Name = "0.71"
Gui._071_7.Parent = Gui.RippleContainer_2
Gui._071_7.BackgroundTransparency = 1.000
Gui._071_7.ClipsDescendants = true
Gui._071_7.Position = UDim2.new(1, -2, 0, 1)
Gui._071_7.Size = UDim2.new(0, 1, 0, 1)
Gui._071_7.ImageTransparency = 0.035

Gui._071_8.Name = "0.71"
Gui._071_8.Parent = Gui.RippleContainer_2
Gui._071_8.BackgroundTransparency = 1.000
Gui._071_8.ClipsDescendants = true
Gui._071_8.Position = UDim2.new(1, -2, 1, -2)
Gui._071_8.Size = UDim2.new(0, 1, 0, 1)
Gui._071_8.ImageTransparency = 0.035

Gui._0792_5.Name = "0.792"
Gui._0792_5.Parent = Gui.RippleContainer_2
Gui._0792_5.BackgroundTransparency = 1.000
Gui._0792_5.ClipsDescendants = true
Gui._0792_5.Position = UDim2.new(0, 0, 0, 2)
Gui._0792_5.Size = UDim2.new(0, 1, 0, 1)
Gui._0792_5.ImageTransparency = 0.310

Gui._0792_6.Name = "0.792"
Gui._0792_6.Parent = Gui.RippleContainer_2
Gui._0792_6.BackgroundTransparency = 1.000
Gui._0792_6.ClipsDescendants = true
Gui._0792_6.Position = UDim2.new(0, 0, 1, -3)
Gui._0792_6.Size = UDim2.new(0, 1, 0, 1)
Gui._0792_6.ImageTransparency = 0.310

Gui._0792_7.Name = "0.792"
Gui._0792_7.Parent = Gui.RippleContainer_2
Gui._0792_7.BackgroundTransparency = 1.000
Gui._0792_7.ClipsDescendants = true
Gui._0792_7.Position = UDim2.new(1, -1, 0, 2)
Gui._0792_7.Size = UDim2.new(0, 1, 0, 1)
Gui._0792_7.ImageTransparency = 0.310

Gui._0792_8.Name = "0.792"
Gui._0792_8.Parent = Gui.RippleContainer_2
Gui._0792_8.BackgroundTransparency = 1.000
Gui._0792_8.ClipsDescendants = true
Gui._0792_8.Position = UDim2.new(1, -1, 1, -3)
Gui._0792_8.Size = UDim2.new(0, 1, 0, 1)
Gui._0792_8.ImageTransparency = 0.310

Gui._071_9.Name = "0.71"
Gui._071_9.Parent = Gui.RippleContainer_2
Gui._071_9.BackgroundTransparency = 1.000
Gui._071_9.ClipsDescendants = true
Gui._071_9.Position = UDim2.new(0, 0, 0, 3)
Gui._071_9.Size = UDim2.new(0, 1, 0, 1)
Gui._071_9.ImageTransparency = 0.035

Gui._071_10.Name = "0.71"
Gui._071_10.Parent = Gui.RippleContainer_2
Gui._071_10.BackgroundTransparency = 1.000
Gui._071_10.ClipsDescendants = true
Gui._071_10.Position = UDim2.new(0, 0, 1, -4)
Gui._071_10.Size = UDim2.new(0, 1, 0, 1)
Gui._071_10.ImageTransparency = 0.035

Gui._071_11.Name = "0.71"
Gui._071_11.Parent = Gui.RippleContainer_2
Gui._071_11.BackgroundTransparency = 1.000
Gui._071_11.ClipsDescendants = true
Gui._071_11.Position = UDim2.new(1, -1, 0, 3)
Gui._071_11.Size = UDim2.new(0, 1, 0, 1)
Gui._071_11.ImageTransparency = 0.035

Gui._071_12.Name = "0.71"
Gui._071_12.Parent = Gui.RippleContainer_2
Gui._071_12.BackgroundTransparency = 1.000
Gui._071_12.ClipsDescendants = true
Gui._071_12.Position = UDim2.new(1, -1, 1, -4)
Gui._071_12.Size = UDim2.new(0, 1, 0, 1)
Gui._071_12.ImageTransparency = 0.035

Gui.Img_2.Name = "Img"
Gui.Img_2.Parent = Gui._4
Gui.Img_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.Img_2.Size = UDim2.new(0, 100, 0, 100)
Gui.Img_2.Image = "rbxassetid://1934624205"
Gui.Img_2.ScaleType = Enum.ScaleType.Slice
Gui.Img_2.SliceCenter = Rect.new(4, 4, 252, 252)

Gui.Outline_2.Name = "Outline"
Gui.Outline_2.Parent = Gui._4
Gui.Outline_2.BackgroundTransparency = 1.000
Gui.Outline_2.Size = UDim2.new(1, 0, 1, 0)
Gui.Outline_2.Visible = false
Gui.Outline_2.ZIndex = 3
Gui.Outline_2.Image = "rbxassetid://1981015668"
Gui.Outline_2.ImageColor3 = Color3.fromRGB(0, 0, 0)
Gui.Outline_2.ImageTransparency = 0.880
Gui.Outline_2.ScaleType = Enum.ScaleType.Slice
Gui.Outline_2.SliceCenter = Rect.new(4, 4, 252, 252)

Gui._8.Name = "8"
Gui._8.Parent = Gui.RoundSize

Gui.Img_3.Name = "Img"
Gui.Img_3.Parent = Gui._8
Gui.Img_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.Img_3.Size = UDim2.new(0, 100, 0, 100)
Gui.Img_3.Image = "rbxassetid://1935044829"
Gui.Img_3.ScaleType = Enum.ScaleType.Slice
Gui.Img_3.SliceCenter = Rect.new(8, 8, 248, 248)

Gui.RippleContainer_3.Name = "RippleContainer"
Gui.RippleContainer_3.Parent = Gui._8
Gui.RippleContainer_3.AnchorPoint = Vector2.new(0.5, 0.5)
Gui.RippleContainer_3.BackgroundTransparency = 1.000
Gui.RippleContainer_3.BorderSizePixel = 0
Gui.RippleContainer_3.ClipsDescendants = true
Gui.RippleContainer_3.Position = UDim2.new(0.5, 0, 0.5, 0)
Gui.RippleContainer_3.Size = UDim2.new(1, 0, 1, 0)
Gui.RippleContainer_3.ZIndex = 3

Gui._0699_15.Name = "0.699"
Gui._0699_15.Parent = Gui.RippleContainer_3
Gui._0699_15.BackgroundTransparency = 1.000
Gui._0699_15.ClipsDescendants = true
Gui._0699_15.Position = UDim2.new(0, 8, 0, 0)
Gui._0699_15.Size = UDim2.new(1, -16, 0, 1)

Gui._0699_16.Name = "0.699"
Gui._0699_16.Parent = Gui.RippleContainer_3
Gui._0699_16.BackgroundTransparency = 1.000
Gui._0699_16.ClipsDescendants = true
Gui._0699_16.Position = UDim2.new(0, 8, 1, -1)
Gui._0699_16.Size = UDim2.new(1, -16, 0, 1)

Gui._0699_17.Name = "0.699"
Gui._0699_17.Parent = Gui.RippleContainer_3
Gui._0699_17.BackgroundTransparency = 1.000
Gui._0699_17.ClipsDescendants = true
Gui._0699_17.Position = UDim2.new(0, 0, 0, 8)
Gui._0699_17.Size = UDim2.new(0, 1, 1, -16)

Gui._0699_18.Name = "0.699"
Gui._0699_18.Parent = Gui.RippleContainer_3
Gui._0699_18.BackgroundTransparency = 1.000
Gui._0699_18.ClipsDescendants = true
Gui._0699_18.Position = UDim2.new(1, -1, 0, 8)
Gui._0699_18.Size = UDim2.new(0, 1, 1, -16)

Gui._0699_19.Name = "0.699"
Gui._0699_19.Parent = Gui.RippleContainer_3
Gui._0699_19.BackgroundTransparency = 1.000
Gui._0699_19.ClipsDescendants = true
Gui._0699_19.Position = UDim2.new(0, 3, 0, 3)
Gui._0699_19.Size = UDim2.new(1, -6, 1, -6)

Gui._0699_20.Name = "0.699"
Gui._0699_20.Parent = Gui.RippleContainer_3
Gui._0699_20.BackgroundTransparency = 1.000
Gui._0699_20.ClipsDescendants = true
Gui._0699_20.Position = UDim2.new(0, 3, 0, 2)
Gui._0699_20.Size = UDim2.new(1, -6, 0, 1)

Gui._0699_21.Name = "0.699"
Gui._0699_21.Parent = Gui.RippleContainer_3
Gui._0699_21.BackgroundTransparency = 1.000
Gui._0699_21.ClipsDescendants = true
Gui._0699_21.Position = UDim2.new(0, 3, 1, -3)
Gui._0699_21.Size = UDim2.new(1, -6, 0, 1)

Gui._0699_22.Name = "0.699"
Gui._0699_22.Parent = Gui.RippleContainer_3
Gui._0699_22.BackgroundTransparency = 1.000
Gui._0699_22.ClipsDescendants = true
Gui._0699_22.Position = UDim2.new(0, 2, 0, 3)
Gui._0699_22.Size = UDim2.new(0, 1, 1, -6)

Gui._0699_23.Name = "0.699"
Gui._0699_23.Parent = Gui.RippleContainer_3
Gui._0699_23.BackgroundTransparency = 1.000
Gui._0699_23.ClipsDescendants = true
Gui._0699_23.Position = UDim2.new(1, -3, 0, 3)
Gui._0699_23.Size = UDim2.new(0, 1, 1, -6)

Gui._0699_24.Name = "0.699"
Gui._0699_24.Parent = Gui.RippleContainer_3
Gui._0699_24.BackgroundTransparency = 1.000
Gui._0699_24.ClipsDescendants = true
Gui._0699_24.Position = UDim2.new(0, 4, 0, 1)
Gui._0699_24.Size = UDim2.new(1, -8, 0, 1)

Gui._0699_25.Name = "0.699"
Gui._0699_25.Parent = Gui.RippleContainer_3
Gui._0699_25.BackgroundTransparency = 1.000
Gui._0699_25.ClipsDescendants = true
Gui._0699_25.Position = UDim2.new(0, 4, 1, -2)
Gui._0699_25.Size = UDim2.new(1, -8, 0, 1)

Gui._0699_26.Name = "0.699"
Gui._0699_26.Parent = Gui.RippleContainer_3
Gui._0699_26.BackgroundTransparency = 1.000
Gui._0699_26.ClipsDescendants = true
Gui._0699_26.Position = UDim2.new(0, 1, 0, 4)
Gui._0699_26.Size = UDim2.new(0, 1, 1, -8)

Gui._0699_27.Name = "0.699"
Gui._0699_27.Parent = Gui.RippleContainer_3
Gui._0699_27.BackgroundTransparency = 1.000
Gui._0699_27.ClipsDescendants = true
Gui._0699_27.Position = UDim2.new(1, -2, 0, 4)
Gui._0699_27.Size = UDim2.new(0, 1, 1, -8)

Gui._0932.Name = "0.932"
Gui._0932.Parent = Gui.RippleContainer_3
Gui._0932.BackgroundTransparency = 1.000
Gui._0932.ClipsDescendants = true
Gui._0932.Position = UDim2.new(0, 4, 0, 0)
Gui._0932.Size = UDim2.new(0, 1, 0, 1)
Gui._0932.ImageTransparency = 0.776

Gui._0932_2.Name = "0.932"
Gui._0932_2.Parent = Gui.RippleContainer_3
Gui._0932_2.BackgroundTransparency = 1.000
Gui._0932_2.ClipsDescendants = true
Gui._0932_2.Position = UDim2.new(0, 4, 1, -1)
Gui._0932_2.Size = UDim2.new(0, 1, 0, 1)
Gui._0932_2.ImageTransparency = 0.776

Gui._0932_3.Name = "0.932"
Gui._0932_3.Parent = Gui.RippleContainer_3
Gui._0932_3.BackgroundTransparency = 1.000
Gui._0932_3.ClipsDescendants = true
Gui._0932_3.Position = UDim2.new(1, -5, 0, 0)
Gui._0932_3.Size = UDim2.new(0, 1, 0, 1)
Gui._0932_3.ImageTransparency = 0.776

Gui._0932_4.Name = "0.932"
Gui._0932_4.Parent = Gui.RippleContainer_3
Gui._0932_4.BackgroundTransparency = 1.000
Gui._0932_4.ClipsDescendants = true
Gui._0932_4.Position = UDim2.new(1, -5, 1, -1)
Gui._0932_4.Size = UDim2.new(0, 1, 0, 1)
Gui._0932_4.ImageTransparency = 0.776

Gui._0821.Name = "0.821"
Gui._0821.Parent = Gui.RippleContainer_3
Gui._0821.BackgroundTransparency = 1.000
Gui._0821.ClipsDescendants = true
Gui._0821.Position = UDim2.new(0, 5, 0, 0)
Gui._0821.Size = UDim2.new(0, 1, 0, 1)
Gui._0821.ImageTransparency = 0.404

Gui._0821_2.Name = "0.821"
Gui._0821_2.Parent = Gui.RippleContainer_3
Gui._0821_2.BackgroundTransparency = 1.000
Gui._0821_2.ClipsDescendants = true
Gui._0821_2.Position = UDim2.new(0, 5, 1, -1)
Gui._0821_2.Size = UDim2.new(0, 1, 0, 1)
Gui._0821_2.ImageTransparency = 0.404

Gui._0821_3.Name = "0.821"
Gui._0821_3.Parent = Gui.RippleContainer_3
Gui._0821_3.BackgroundTransparency = 1.000
Gui._0821_3.ClipsDescendants = true
Gui._0821_3.Position = UDim2.new(1, -6, 0, 0)
Gui._0821_3.Size = UDim2.new(0, 1, 0, 1)
Gui._0821_3.ImageTransparency = 0.404

Gui._0821_4.Name = "0.821"
Gui._0821_4.Parent = Gui.RippleContainer_3
Gui._0821_4.BackgroundTransparency = 1.000
Gui._0821_4.ClipsDescendants = true
Gui._0821_4.Position = UDim2.new(1, -6, 1, -1)
Gui._0821_4.Size = UDim2.new(0, 1, 0, 1)
Gui._0821_4.ImageTransparency = 0.404

Gui._0744.Name = "0.744"
Gui._0744.Parent = Gui.RippleContainer_3
Gui._0744.BackgroundTransparency = 1.000
Gui._0744.ClipsDescendants = true
Gui._0744.Position = UDim2.new(0, 6, 0, 0)
Gui._0744.Size = UDim2.new(0, 1, 0, 1)
Gui._0744.ImageTransparency = 0.149

Gui._0744_2.Name = "0.744"
Gui._0744_2.Parent = Gui.RippleContainer_3
Gui._0744_2.BackgroundTransparency = 1.000
Gui._0744_2.ClipsDescendants = true
Gui._0744_2.Position = UDim2.new(0, 6, 1, -1)
Gui._0744_2.Size = UDim2.new(0, 1, 0, 1)
Gui._0744_2.ImageTransparency = 0.149

Gui._0744_3.Name = "0.744"
Gui._0744_3.Parent = Gui.RippleContainer_3
Gui._0744_3.BackgroundTransparency = 1.000
Gui._0744_3.ClipsDescendants = true
Gui._0744_3.Position = UDim2.new(1, -7, 0, 0)
Gui._0744_3.Size = UDim2.new(0, 1, 0, 1)
Gui._0744_3.ImageTransparency = 0.149

Gui._0744_4.Name = "0.744"
Gui._0744_4.Parent = Gui.RippleContainer_3
Gui._0744_4.BackgroundTransparency = 1.000
Gui._0744_4.ClipsDescendants = true
Gui._0744_4.Position = UDim2.new(1, -7, 1, -1)
Gui._0744_4.Size = UDim2.new(0, 1, 0, 1)
Gui._0744_4.ImageTransparency = 0.149

Gui._0704.Name = "0.704"
Gui._0704.Parent = Gui.RippleContainer_3
Gui._0704.BackgroundTransparency = 1.000
Gui._0704.ClipsDescendants = true
Gui._0704.Position = UDim2.new(0, 7, 0, 0)
Gui._0704.Size = UDim2.new(0, 1, 0, 1)
Gui._0704.ImageTransparency = 0.016

Gui._0704_2.Name = "0.704"
Gui._0704_2.Parent = Gui.RippleContainer_3
Gui._0704_2.BackgroundTransparency = 1.000
Gui._0704_2.ClipsDescendants = true
Gui._0704_2.Position = UDim2.new(0, 7, 1, -1)
Gui._0704_2.Size = UDim2.new(0, 1, 0, 1)
Gui._0704_2.ImageTransparency = 0.016

Gui._0704_3.Name = "0.704"
Gui._0704_3.Parent = Gui.RippleContainer_3
Gui._0704_3.BackgroundTransparency = 1.000
Gui._0704_3.ClipsDescendants = true
Gui._0704_3.Position = UDim2.new(1, -8, 0, 0)
Gui._0704_3.Size = UDim2.new(0, 1, 0, 1)
Gui._0704_3.ImageTransparency = 0.016

Gui._0704_4.Name = "0.704"
Gui._0704_4.Parent = Gui.RippleContainer_3
Gui._0704_4.BackgroundTransparency = 1.000
Gui._0704_4.ClipsDescendants = true
Gui._0704_4.Position = UDim2.new(1, -8, 1, -1)
Gui._0704_4.Size = UDim2.new(0, 1, 0, 1)
Gui._0704_4.ImageTransparency = 0.016

Gui._0821_5.Name = "0.821"
Gui._0821_5.Parent = Gui.RippleContainer_3
Gui._0821_5.BackgroundTransparency = 1.000
Gui._0821_5.ClipsDescendants = true
Gui._0821_5.Position = UDim2.new(0, 3, 0, 1)
Gui._0821_5.Size = UDim2.new(0, 1, 0, 1)
Gui._0821_5.ImageTransparency = 0.404

Gui._0821_6.Name = "0.821"
Gui._0821_6.Parent = Gui.RippleContainer_3
Gui._0821_6.BackgroundTransparency = 1.000
Gui._0821_6.ClipsDescendants = true
Gui._0821_6.Position = UDim2.new(0, 3, 1, -2)
Gui._0821_6.Size = UDim2.new(0, 1, 0, 1)
Gui._0821_6.ImageTransparency = 0.404

Gui._0821_7.Name = "0.821"
Gui._0821_7.Parent = Gui.RippleContainer_3
Gui._0821_7.BackgroundTransparency = 1.000
Gui._0821_7.ClipsDescendants = true
Gui._0821_7.Position = UDim2.new(1, -4, 0, 1)
Gui._0821_7.Size = UDim2.new(0, 1, 0, 1)
Gui._0821_7.ImageTransparency = 0.404

Gui._0821_8.Name = "0.821"
Gui._0821_8.Parent = Gui.RippleContainer_3
Gui._0821_8.BackgroundTransparency = 1.000
Gui._0821_8.ClipsDescendants = true
Gui._0821_8.Position = UDim2.new(1, -4, 1, -2)
Gui._0821_8.Size = UDim2.new(0, 1, 0, 1)
Gui._0821_8.ImageTransparency = 0.404

Gui._0783.Name = "0.783"
Gui._0783.Parent = Gui.RippleContainer_3
Gui._0783.BackgroundTransparency = 1.000
Gui._0783.ClipsDescendants = true
Gui._0783.Position = UDim2.new(0, 2, 0, 2)
Gui._0783.Size = UDim2.new(0, 1, 0, 1)
Gui._0783.ImageTransparency = 0.278

Gui._0783_2.Name = "0.783"
Gui._0783_2.Parent = Gui.RippleContainer_3
Gui._0783_2.BackgroundTransparency = 1.000
Gui._0783_2.ClipsDescendants = true
Gui._0783_2.Position = UDim2.new(0, 2, 1, -3)
Gui._0783_2.Size = UDim2.new(0, 1, 0, 1)
Gui._0783_2.ImageTransparency = 0.278

Gui._0783_3.Name = "0.783"
Gui._0783_3.Parent = Gui.RippleContainer_3
Gui._0783_3.BackgroundTransparency = 1.000
Gui._0783_3.ClipsDescendants = true
Gui._0783_3.Position = UDim2.new(1, -3, 0, 2)
Gui._0783_3.Size = UDim2.new(0, 1, 0, 1)
Gui._0783_3.ImageTransparency = 0.278

Gui._0783_4.Name = "0.783"
Gui._0783_4.Parent = Gui.RippleContainer_3
Gui._0783_4.BackgroundTransparency = 1.000
Gui._0783_4.ClipsDescendants = true
Gui._0783_4.Position = UDim2.new(1, -3, 1, -3)
Gui._0783_4.Size = UDim2.new(0, 1, 0, 1)
Gui._0783_4.ImageTransparency = 0.278

Gui._0821_9.Name = "0.821"
Gui._0821_9.Parent = Gui.RippleContainer_3
Gui._0821_9.BackgroundTransparency = 1.000
Gui._0821_9.ClipsDescendants = true
Gui._0821_9.Position = UDim2.new(0, 1, 0, 3)
Gui._0821_9.Size = UDim2.new(0, 1, 0, 1)
Gui._0821_9.ImageTransparency = 0.404

Gui._0821_10.Name = "0.821"
Gui._0821_10.Parent = Gui.RippleContainer_3
Gui._0821_10.BackgroundTransparency = 1.000
Gui._0821_10.ClipsDescendants = true
Gui._0821_10.Position = UDim2.new(0, 1, 1, -4)
Gui._0821_10.Size = UDim2.new(0, 1, 0, 1)
Gui._0821_10.ImageTransparency = 0.404

Gui._0821_11.Name = "0.821"
Gui._0821_11.Parent = Gui.RippleContainer_3
Gui._0821_11.BackgroundTransparency = 1.000
Gui._0821_11.ClipsDescendants = true
Gui._0821_11.Position = UDim2.new(1, -2, 0, 3)
Gui._0821_11.Size = UDim2.new(0, 1, 0, 1)
Gui._0821_11.ImageTransparency = 0.404

Gui._0821_12.Name = "0.821"
Gui._0821_12.Parent = Gui.RippleContainer_3
Gui._0821_12.BackgroundTransparency = 1.000
Gui._0821_12.ClipsDescendants = true
Gui._0821_12.Position = UDim2.new(1, -2, 1, -4)
Gui._0821_12.Size = UDim2.new(0, 1, 0, 1)
Gui._0821_12.ImageTransparency = 0.404

Gui._0932_5.Name = "0.932"
Gui._0932_5.Parent = Gui.RippleContainer_3
Gui._0932_5.BackgroundTransparency = 1.000
Gui._0932_5.ClipsDescendants = true
Gui._0932_5.Position = UDim2.new(0, 0, 0, 4)
Gui._0932_5.Size = UDim2.new(0, 1, 0, 1)
Gui._0932_5.ImageTransparency = 0.776

Gui._0932_6.Name = "0.932"
Gui._0932_6.Parent = Gui.RippleContainer_3
Gui._0932_6.BackgroundTransparency = 1.000
Gui._0932_6.ClipsDescendants = true
Gui._0932_6.Position = UDim2.new(0, 0, 1, -5)
Gui._0932_6.Size = UDim2.new(0, 1, 0, 1)
Gui._0932_6.ImageTransparency = 0.776

Gui._0932_7.Name = "0.932"
Gui._0932_7.Parent = Gui.RippleContainer_3
Gui._0932_7.BackgroundTransparency = 1.000
Gui._0932_7.ClipsDescendants = true
Gui._0932_7.Position = UDim2.new(1, -1, 0, 4)
Gui._0932_7.Size = UDim2.new(0, 1, 0, 1)
Gui._0932_7.ImageTransparency = 0.776

Gui._0932_8.Name = "0.932"
Gui._0932_8.Parent = Gui.RippleContainer_3
Gui._0932_8.BackgroundTransparency = 1.000
Gui._0932_8.ClipsDescendants = true
Gui._0932_8.Position = UDim2.new(1, -1, 1, -5)
Gui._0932_8.Size = UDim2.new(0, 1, 0, 1)
Gui._0932_8.ImageTransparency = 0.776

Gui._0821_13.Name = "0.821"
Gui._0821_13.Parent = Gui.RippleContainer_3
Gui._0821_13.BackgroundTransparency = 1.000
Gui._0821_13.ClipsDescendants = true
Gui._0821_13.Position = UDim2.new(0, 0, 0, 5)
Gui._0821_13.Size = UDim2.new(0, 1, 0, 1)
Gui._0821_13.ImageTransparency = 0.404

Gui._0821_14.Name = "0.821"
Gui._0821_14.Parent = Gui.RippleContainer_3
Gui._0821_14.BackgroundTransparency = 1.000
Gui._0821_14.ClipsDescendants = true
Gui._0821_14.Position = UDim2.new(0, 0, 1, -6)
Gui._0821_14.Size = UDim2.new(0, 1, 0, 1)
Gui._0821_14.ImageTransparency = 0.404

Gui._0821_15.Name = "0.821"
Gui._0821_15.Parent = Gui.RippleContainer_3
Gui._0821_15.BackgroundTransparency = 1.000
Gui._0821_15.ClipsDescendants = true
Gui._0821_15.Position = UDim2.new(1, -1, 0, 5)
Gui._0821_15.Size = UDim2.new(0, 1, 0, 1)
Gui._0821_15.ImageTransparency = 0.404

Gui._0821_16.Name = "0.821"
Gui._0821_16.Parent = Gui.RippleContainer_3
Gui._0821_16.BackgroundTransparency = 1.000
Gui._0821_16.ClipsDescendants = true
Gui._0821_16.Position = UDim2.new(1, -1, 1, -6)
Gui._0821_16.Size = UDim2.new(0, 1, 0, 1)
Gui._0821_16.ImageTransparency = 0.404

Gui._0744_5.Name = "0.744"
Gui._0744_5.Parent = Gui.RippleContainer_3
Gui._0744_5.BackgroundTransparency = 1.000
Gui._0744_5.ClipsDescendants = true
Gui._0744_5.Position = UDim2.new(0, 0, 0, 6)
Gui._0744_5.Size = UDim2.new(0, 1, 0, 1)
Gui._0744_5.ImageTransparency = 0.149

Gui._0744_6.Name = "0.744"
Gui._0744_6.Parent = Gui.RippleContainer_3
Gui._0744_6.BackgroundTransparency = 1.000
Gui._0744_6.ClipsDescendants = true
Gui._0744_6.Position = UDim2.new(0, 0, 1, -7)
Gui._0744_6.Size = UDim2.new(0, 1, 0, 1)
Gui._0744_6.ImageTransparency = 0.149

Gui._0744_7.Name = "0.744"
Gui._0744_7.Parent = Gui.RippleContainer_3
Gui._0744_7.BackgroundTransparency = 1.000
Gui._0744_7.ClipsDescendants = true
Gui._0744_7.Position = UDim2.new(1, -1, 0, 6)
Gui._0744_7.Size = UDim2.new(0, 1, 0, 1)
Gui._0744_7.ImageTransparency = 0.149

Gui._0744_8.Name = "0.744"
Gui._0744_8.Parent = Gui.RippleContainer_3
Gui._0744_8.BackgroundTransparency = 1.000
Gui._0744_8.ClipsDescendants = true
Gui._0744_8.Position = UDim2.new(1, -1, 1, -7)
Gui._0744_8.Size = UDim2.new(0, 1, 0, 1)
Gui._0744_8.ImageTransparency = 0.149

Gui._0704_5.Name = "0.704"
Gui._0704_5.Parent = Gui.RippleContainer_3
Gui._0704_5.BackgroundTransparency = 1.000
Gui._0704_5.ClipsDescendants = true
Gui._0704_5.Position = UDim2.new(0, 0, 0, 7)
Gui._0704_5.Size = UDim2.new(0, 1, 0, 1)
Gui._0704_5.ImageTransparency = 0.016

Gui._0704_6.Name = "0.704"
Gui._0704_6.Parent = Gui.RippleContainer_3
Gui._0704_6.BackgroundTransparency = 1.000
Gui._0704_6.ClipsDescendants = true
Gui._0704_6.Position = UDim2.new(0, 0, 1, -8)
Gui._0704_6.Size = UDim2.new(0, 1, 0, 1)
Gui._0704_6.ImageTransparency = 0.016

Gui._0704_7.Name = "0.704"
Gui._0704_7.Parent = Gui.RippleContainer_3
Gui._0704_7.BackgroundTransparency = 1.000
Gui._0704_7.ClipsDescendants = true
Gui._0704_7.Position = UDim2.new(1, -1, 0, 7)
Gui._0704_7.Size = UDim2.new(0, 1, 0, 1)
Gui._0704_7.ImageTransparency = 0.016

Gui._0704_8.Name = "0.704"
Gui._0704_8.Parent = Gui.RippleContainer_3
Gui._0704_8.BackgroundTransparency = 1.000
Gui._0704_8.ClipsDescendants = true
Gui._0704_8.Position = UDim2.new(1, -1, 1, -8)
Gui._0704_8.Size = UDim2.new(0, 1, 0, 1)
Gui._0704_8.ImageTransparency = 0.016

Gui.Outline_3.Name = "Outline"
Gui.Outline_3.Parent = Gui._8
Gui.Outline_3.BackgroundTransparency = 1.000
Gui.Outline_3.Size = UDim2.new(1, 0, 1, 0)
Gui.Outline_3.ZIndex = 3
Gui.Outline_3.Image = "rbxassetid://1981285569"
Gui.Outline_3.ImageColor3 = Color3.fromRGB(0, 0, 0)
Gui.Outline_3.ImageTransparency = 0.880
Gui.Outline_3.ScaleType = Enum.ScaleType.Slice
Gui.Outline_3.SliceCenter = Rect.new(8, 8, 248, 248)

Gui.Button.Name = "Button"
Gui.Button.Parent = Gui.Class_Button
Gui.Button.BackgroundTransparency = 1.000
Gui.Button.Size = UDim2.new(0, 83, 0, 36)
Gui.Button.ZIndex = 2
Gui.Button.AutoButtonColor = false
Gui.Button.Image = "rbxassetid://1935044829"
Gui.Button.ImageColor3 = Color3.fromRGB(0, 150, 136)
Gui.Button.ScaleType = Enum.ScaleType.Slice
Gui.Button.SliceCenter = Rect.new(8, 8, 248, 248)

Gui.AmbientShadow.Name = "AmbientShadow"
Gui.AmbientShadow.Parent = Gui.Button
Gui.AmbientShadow.AnchorPoint = Vector2.new(0.5, 0.5)
Gui.AmbientShadow.BackgroundTransparency = 1.000
Gui.AmbientShadow.Position = UDim2.new(0.5, 0, 0.5, 1)
Gui.AmbientShadow.Size = UDim2.new(1, 8, 1, 8)
Gui.AmbientShadow.Image = "rbxassetid://1316045217"
Gui.AmbientShadow.ImageColor3 = Color3.fromRGB(0, 150, 136)
Gui.AmbientShadow.ImageTransparency = 0.800
Gui.AmbientShadow.ScaleType = Enum.ScaleType.Slice
Gui.AmbientShadow.SliceCenter = Rect.new(10, 10, 118, 118)

Gui.PenumbraShadow.Name = "PenumbraShadow"
Gui.PenumbraShadow.Parent = Gui.Button
Gui.PenumbraShadow.AnchorPoint = Vector2.new(0.5, 0.5)
Gui.PenumbraShadow.BackgroundTransparency = 1.000
Gui.PenumbraShadow.Position = UDim2.new(0.5, 0, 0.5, 3)
Gui.PenumbraShadow.Size = UDim2.new(1, 4, 1, 4)
Gui.PenumbraShadow.Image = "rbxassetid://1316045217"
Gui.PenumbraShadow.ImageColor3 = Color3.fromRGB(0, 150, 136)
Gui.PenumbraShadow.ImageTransparency = 0.880
Gui.PenumbraShadow.ScaleType = Enum.ScaleType.Slice
Gui.PenumbraShadow.SliceCenter = Rect.new(10, 10, 118, 118)

Gui.UmbraShadow.Name = "UmbraShadow"
Gui.UmbraShadow.Parent = Gui.Button
Gui.UmbraShadow.AnchorPoint = Vector2.new(0.5, 0.5)
Gui.UmbraShadow.BackgroundTransparency = 1.000
Gui.UmbraShadow.Position = UDim2.new(0.5, 0, 0.5, 3)
Gui.UmbraShadow.Size = UDim2.new(1, 3, 1, 3)
Gui.UmbraShadow.Image = "rbxassetid://1316045217"
Gui.UmbraShadow.ImageColor3 = Color3.fromRGB(0, 150, 136)
Gui.UmbraShadow.ImageTransparency = 0.860
Gui.UmbraShadow.ScaleType = Enum.ScaleType.Slice
Gui.UmbraShadow.SliceCenter = Rect.new(10, 10, 118, 118)

Gui.Outline_4.Name = "Outline"
Gui.Outline_4.Parent = Gui.Button
Gui.Outline_4.BackgroundTransparency = 1.000
Gui.Outline_4.Size = UDim2.new(1, 0, 1, 0)
Gui.Outline_4.Visible = false
Gui.Outline_4.ZIndex = 3
Gui.Outline_4.Image = "rbxassetid://1981285569"
Gui.Outline_4.ImageColor3 = Color3.fromRGB(0, 0, 0)
Gui.Outline_4.ImageTransparency = 0.880
Gui.Outline_4.ScaleType = Enum.ScaleType.Slice
Gui.Outline_4.SliceCenter = Rect.new(8, 8, 248, 248)

Gui.On.Name = "On"
Gui.On.Parent = Gui.Button
Gui.On.AnchorPoint = Vector2.new(0.5, 0.5)
Gui.On.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.On.BackgroundTransparency = 1.000
Gui.On.BorderSizePixel = 0
Gui.On.Position = UDim2.new(0.5, 0, 0.5, 0)
Gui.On.Size = UDim2.new(1, 0, 1, 0)
Gui.On.ZIndex = 3
Gui.On.Image = "rbxassetid://1935044829"
Gui.On.ImageTransparency = 1.000
Gui.On.ScaleType = Enum.ScaleType.Slice
Gui.On.SliceCenter = Rect.new(8, 8, 248, 248)

Gui.Holder.Name = "Holder"
Gui.Holder.Parent = Gui.Button
Gui.Holder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.Holder.BackgroundTransparency = 1.000
Gui.Holder.Size = UDim2.new(1, 0, 1, 0)

Gui.Text.Name = "Text"
Gui.Text.Parent = Gui.Holder
Gui.Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.Text.BackgroundTransparency = 1.000
Gui.Text.LayoutOrder = 1
Gui.Text.Size = UDim2.new(0, 44, 1, 0)
Gui.Text.ZIndex = 3
Gui.Text.Font = Enum.Font.Gotham
Gui.Text.Text = "Button"
Gui.Text.TextColor3 = Color3.fromRGB(255, 255, 255)
Gui.Text.TextSize = 14.000

Gui.UIListLayout.Parent = Gui.Holder
Gui.UIListLayout.FillDirection = Enum.FillDirection.Horizontal
Gui.UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
Gui.UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
Gui.UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
Gui.UIListLayout.Padding = UDim.new(0, 8)

Gui.ImageLabel.Parent = Gui.Holder
Gui.ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.ImageLabel.BackgroundTransparency = 1.000
Gui.ImageLabel.BorderSizePixel = 0
Gui.ImageLabel.Size = UDim2.new(0, 20, 0, 20)
Gui.ImageLabel.SizeConstraint = Enum.SizeConstraint.RelativeYY
Gui.ImageLabel.Visible = false
Gui.ImageLabel.ZIndex = 3
Gui.ImageLabel.Image = "rbxassetid://3944675151"

Gui.UIPadding.Parent = Gui.Holder
Gui.UIPadding.PaddingLeft = UDim.new(0, 6)
Gui.UIPadding.PaddingRight = UDim.new(0, 6)

Gui.RippleContainer_4.Name = "RippleContainer"
Gui.RippleContainer_4.Parent = Gui.Button
Gui.RippleContainer_4.AnchorPoint = Vector2.new(0.5, 0.5)
Gui.RippleContainer_4.BackgroundTransparency = 1.000
Gui.RippleContainer_4.BorderSizePixel = 0
Gui.RippleContainer_4.ClipsDescendants = true
Gui.RippleContainer_4.Position = UDim2.new(0.5, 0, 0.5, 0)
Gui.RippleContainer_4.Size = UDim2.new(1, 0, 1, 0)
Gui.RippleContainer_4.ZIndex = 3

Gui._0699_28.Name = "0.699"
Gui._0699_28.Parent = Gui.RippleContainer_4
Gui._0699_28.BackgroundTransparency = 1.000
Gui._0699_28.ClipsDescendants = true
Gui._0699_28.Position = UDim2.new(0, 8, 0, 0)
Gui._0699_28.Size = UDim2.new(1, -16, 0, 1)

Gui._0699_29.Name = "0.699"
Gui._0699_29.Parent = Gui.RippleContainer_4
Gui._0699_29.BackgroundTransparency = 1.000
Gui._0699_29.ClipsDescendants = true
Gui._0699_29.Position = UDim2.new(0, 8, 1, -1)
Gui._0699_29.Size = UDim2.new(1, -16, 0, 1)

Gui._0699_30.Name = "0.699"
Gui._0699_30.Parent = Gui.RippleContainer_4
Gui._0699_30.BackgroundTransparency = 1.000
Gui._0699_30.ClipsDescendants = true
Gui._0699_30.Position = UDim2.new(0, 0, 0, 8)
Gui._0699_30.Size = UDim2.new(0, 1, 1, -16)

Gui._0699_31.Name = "0.699"
Gui._0699_31.Parent = Gui.RippleContainer_4
Gui._0699_31.BackgroundTransparency = 1.000
Gui._0699_31.ClipsDescendants = true
Gui._0699_31.Position = UDim2.new(1, -1, 0, 8)
Gui._0699_31.Size = UDim2.new(0, 1, 1, -16)

Gui._0699_32.Name = "0.699"
Gui._0699_32.Parent = Gui.RippleContainer_4
Gui._0699_32.BackgroundTransparency = 1.000
Gui._0699_32.ClipsDescendants = true
Gui._0699_32.Position = UDim2.new(0, 3, 0, 3)
Gui._0699_32.Size = UDim2.new(1, -6, 1, -6)

Gui._0699_33.Name = "0.699"
Gui._0699_33.Parent = Gui.RippleContainer_4
Gui._0699_33.BackgroundTransparency = 1.000
Gui._0699_33.ClipsDescendants = true
Gui._0699_33.Position = UDim2.new(0, 3, 0, 2)
Gui._0699_33.Size = UDim2.new(1, -6, 0, 1)

Gui._0699_34.Name = "0.699"
Gui._0699_34.Parent = Gui.RippleContainer_4
Gui._0699_34.BackgroundTransparency = 1.000
Gui._0699_34.ClipsDescendants = true
Gui._0699_34.Position = UDim2.new(0, 3, 1, -3)
Gui._0699_34.Size = UDim2.new(1, -6, 0, 1)

Gui._0699_35.Name = "0.699"
Gui._0699_35.Parent = Gui.RippleContainer_4
Gui._0699_35.BackgroundTransparency = 1.000
Gui._0699_35.ClipsDescendants = true
Gui._0699_35.Position = UDim2.new(0, 2, 0, 3)
Gui._0699_35.Size = UDim2.new(0, 1, 1, -6)

Gui._0699_36.Name = "0.699"
Gui._0699_36.Parent = Gui.RippleContainer_4
Gui._0699_36.BackgroundTransparency = 1.000
Gui._0699_36.ClipsDescendants = true
Gui._0699_36.Position = UDim2.new(1, -3, 0, 3)
Gui._0699_36.Size = UDim2.new(0, 1, 1, -6)

Gui._0699_37.Name = "0.699"
Gui._0699_37.Parent = Gui.RippleContainer_4
Gui._0699_37.BackgroundTransparency = 1.000
Gui._0699_37.ClipsDescendants = true
Gui._0699_37.Position = UDim2.new(0, 4, 0, 1)
Gui._0699_37.Size = UDim2.new(1, -8, 0, 1)

Gui._0699_38.Name = "0.699"
Gui._0699_38.Parent = Gui.RippleContainer_4
Gui._0699_38.BackgroundTransparency = 1.000
Gui._0699_38.ClipsDescendants = true
Gui._0699_38.Position = UDim2.new(0, 4, 1, -2)
Gui._0699_38.Size = UDim2.new(1, -8, 0, 1)

Gui._0699_39.Name = "0.699"
Gui._0699_39.Parent = Gui.RippleContainer_4
Gui._0699_39.BackgroundTransparency = 1.000
Gui._0699_39.ClipsDescendants = true
Gui._0699_39.Position = UDim2.new(0, 1, 0, 4)
Gui._0699_39.Size = UDim2.new(0, 1, 1, -8)

Gui._0699_40.Name = "0.699"
Gui._0699_40.Parent = Gui.RippleContainer_4
Gui._0699_40.BackgroundTransparency = 1.000
Gui._0699_40.ClipsDescendants = true
Gui._0699_40.Position = UDim2.new(1, -2, 0, 4)
Gui._0699_40.Size = UDim2.new(0, 1, 1, -8)

Gui._0932_9.Name = "0.932"
Gui._0932_9.Parent = Gui.RippleContainer_4
Gui._0932_9.BackgroundTransparency = 1.000
Gui._0932_9.ClipsDescendants = true
Gui._0932_9.Position = UDim2.new(0, 4, 0, 0)
Gui._0932_9.Size = UDim2.new(0, 1, 0, 1)
Gui._0932_9.ImageTransparency = 0.776

Gui._0932_10.Name = "0.932"
Gui._0932_10.Parent = Gui.RippleContainer_4
Gui._0932_10.BackgroundTransparency = 1.000
Gui._0932_10.ClipsDescendants = true
Gui._0932_10.Position = UDim2.new(0, 4, 1, -1)
Gui._0932_10.Size = UDim2.new(0, 1, 0, 1)
Gui._0932_10.ImageTransparency = 0.776

Gui._0932_11.Name = "0.932"
Gui._0932_11.Parent = Gui.RippleContainer_4
Gui._0932_11.BackgroundTransparency = 1.000
Gui._0932_11.ClipsDescendants = true
Gui._0932_11.Position = UDim2.new(1, -5, 0, 0)
Gui._0932_11.Size = UDim2.new(0, 1, 0, 1)
Gui._0932_11.ImageTransparency = 0.776

Gui._0932_12.Name = "0.932"
Gui._0932_12.Parent = Gui.RippleContainer_4
Gui._0932_12.BackgroundTransparency = 1.000
Gui._0932_12.ClipsDescendants = true
Gui._0932_12.Position = UDim2.new(1, -5, 1, -1)
Gui._0932_12.Size = UDim2.new(0, 1, 0, 1)
Gui._0932_12.ImageTransparency = 0.776

Gui._0821_17.Name = "0.821"
Gui._0821_17.Parent = Gui.RippleContainer_4
Gui._0821_17.BackgroundTransparency = 1.000
Gui._0821_17.ClipsDescendants = true
Gui._0821_17.Position = UDim2.new(0, 5, 0, 0)
Gui._0821_17.Size = UDim2.new(0, 1, 0, 1)
Gui._0821_17.ImageTransparency = 0.404

Gui._0821_18.Name = "0.821"
Gui._0821_18.Parent = Gui.RippleContainer_4
Gui._0821_18.BackgroundTransparency = 1.000
Gui._0821_18.ClipsDescendants = true
Gui._0821_18.Position = UDim2.new(0, 5, 1, -1)
Gui._0821_18.Size = UDim2.new(0, 1, 0, 1)
Gui._0821_18.ImageTransparency = 0.404

Gui._0821_19.Name = "0.821"
Gui._0821_19.Parent = Gui.RippleContainer_4
Gui._0821_19.BackgroundTransparency = 1.000
Gui._0821_19.ClipsDescendants = true
Gui._0821_19.Position = UDim2.new(1, -6, 0, 0)
Gui._0821_19.Size = UDim2.new(0, 1, 0, 1)
Gui._0821_19.ImageTransparency = 0.404

Gui._0821_20.Name = "0.821"
Gui._0821_20.Parent = Gui.RippleContainer_4
Gui._0821_20.BackgroundTransparency = 1.000
Gui._0821_20.ClipsDescendants = true
Gui._0821_20.Position = UDim2.new(1, -6, 1, -1)
Gui._0821_20.Size = UDim2.new(0, 1, 0, 1)
Gui._0821_20.ImageTransparency = 0.404

Gui._0744_9.Name = "0.744"
Gui._0744_9.Parent = Gui.RippleContainer_4
Gui._0744_9.BackgroundTransparency = 1.000
Gui._0744_9.ClipsDescendants = true
Gui._0744_9.Position = UDim2.new(0, 6, 0, 0)
Gui._0744_9.Size = UDim2.new(0, 1, 0, 1)
Gui._0744_9.ImageTransparency = 0.149

Gui._0744_10.Name = "0.744"
Gui._0744_10.Parent = Gui.RippleContainer_4
Gui._0744_10.BackgroundTransparency = 1.000
Gui._0744_10.ClipsDescendants = true
Gui._0744_10.Position = UDim2.new(0, 6, 1, -1)
Gui._0744_10.Size = UDim2.new(0, 1, 0, 1)
Gui._0744_10.ImageTransparency = 0.149

Gui._0744_11.Name = "0.744"
Gui._0744_11.Parent = Gui.RippleContainer_4
Gui._0744_11.BackgroundTransparency = 1.000
Gui._0744_11.ClipsDescendants = true
Gui._0744_11.Position = UDim2.new(1, -7, 0, 0)
Gui._0744_11.Size = UDim2.new(0, 1, 0, 1)
Gui._0744_11.ImageTransparency = 0.149

Gui._0744_12.Name = "0.744"
Gui._0744_12.Parent = Gui.RippleContainer_4
Gui._0744_12.BackgroundTransparency = 1.000
Gui._0744_12.ClipsDescendants = true
Gui._0744_12.Position = UDim2.new(1, -7, 1, -1)
Gui._0744_12.Size = UDim2.new(0, 1, 0, 1)
Gui._0744_12.ImageTransparency = 0.149

Gui._0704_9.Name = "0.704"
Gui._0704_9.Parent = Gui.RippleContainer_4
Gui._0704_9.BackgroundTransparency = 1.000
Gui._0704_9.ClipsDescendants = true
Gui._0704_9.Position = UDim2.new(0, 7, 0, 0)
Gui._0704_9.Size = UDim2.new(0, 1, 0, 1)
Gui._0704_9.ImageTransparency = 0.016

Gui._0704_10.Name = "0.704"
Gui._0704_10.Parent = Gui.RippleContainer_4
Gui._0704_10.BackgroundTransparency = 1.000
Gui._0704_10.ClipsDescendants = true
Gui._0704_10.Position = UDim2.new(0, 7, 1, -1)
Gui._0704_10.Size = UDim2.new(0, 1, 0, 1)
Gui._0704_10.ImageTransparency = 0.016

Gui._0704_11.Name = "0.704"
Gui._0704_11.Parent = Gui.RippleContainer_4
Gui._0704_11.BackgroundTransparency = 1.000
Gui._0704_11.ClipsDescendants = true
Gui._0704_11.Position = UDim2.new(1, -8, 0, 0)
Gui._0704_11.Size = UDim2.new(0, 1, 0, 1)
Gui._0704_11.ImageTransparency = 0.016

Gui._0704_12.Name = "0.704"
Gui._0704_12.Parent = Gui.RippleContainer_4
Gui._0704_12.BackgroundTransparency = 1.000
Gui._0704_12.ClipsDescendants = true
Gui._0704_12.Position = UDim2.new(1, -8, 1, -1)
Gui._0704_12.Size = UDim2.new(0, 1, 0, 1)
Gui._0704_12.ImageTransparency = 0.016

Gui._0821_21.Name = "0.821"
Gui._0821_21.Parent = Gui.RippleContainer_4
Gui._0821_21.BackgroundTransparency = 1.000
Gui._0821_21.ClipsDescendants = true
Gui._0821_21.Position = UDim2.new(0, 3, 0, 1)
Gui._0821_21.Size = UDim2.new(0, 1, 0, 1)
Gui._0821_21.ImageTransparency = 0.404

Gui._0821_22.Name = "0.821"
Gui._0821_22.Parent = Gui.RippleContainer_4
Gui._0821_22.BackgroundTransparency = 1.000
Gui._0821_22.ClipsDescendants = true
Gui._0821_22.Position = UDim2.new(0, 3, 1, -2)
Gui._0821_22.Size = UDim2.new(0, 1, 0, 1)
Gui._0821_22.ImageTransparency = 0.404

Gui._0821_23.Name = "0.821"
Gui._0821_23.Parent = Gui.RippleContainer_4
Gui._0821_23.BackgroundTransparency = 1.000
Gui._0821_23.ClipsDescendants = true
Gui._0821_23.Position = UDim2.new(1, -4, 0, 1)
Gui._0821_23.Size = UDim2.new(0, 1, 0, 1)
Gui._0821_23.ImageTransparency = 0.404

Gui._0821_24.Name = "0.821"
Gui._0821_24.Parent = Gui.RippleContainer_4
Gui._0821_24.BackgroundTransparency = 1.000
Gui._0821_24.ClipsDescendants = true
Gui._0821_24.Position = UDim2.new(1, -4, 1, -2)
Gui._0821_24.Size = UDim2.new(0, 1, 0, 1)
Gui._0821_24.ImageTransparency = 0.404

Gui._0783_5.Name = "0.783"
Gui._0783_5.Parent = Gui.RippleContainer_4
Gui._0783_5.BackgroundTransparency = 1.000
Gui._0783_5.ClipsDescendants = true
Gui._0783_5.Position = UDim2.new(0, 2, 0, 2)
Gui._0783_5.Size = UDim2.new(0, 1, 0, 1)
Gui._0783_5.ImageTransparency = 0.278

Gui._0783_6.Name = "0.783"
Gui._0783_6.Parent = Gui.RippleContainer_4
Gui._0783_6.BackgroundTransparency = 1.000
Gui._0783_6.ClipsDescendants = true
Gui._0783_6.Position = UDim2.new(0, 2, 1, -3)
Gui._0783_6.Size = UDim2.new(0, 1, 0, 1)
Gui._0783_6.ImageTransparency = 0.278

Gui._0783_7.Name = "0.783"
Gui._0783_7.Parent = Gui.RippleContainer_4
Gui._0783_7.BackgroundTransparency = 1.000
Gui._0783_7.ClipsDescendants = true
Gui._0783_7.Position = UDim2.new(1, -3, 0, 2)
Gui._0783_7.Size = UDim2.new(0, 1, 0, 1)
Gui._0783_7.ImageTransparency = 0.278

Gui._0783_8.Name = "0.783"
Gui._0783_8.Parent = Gui.RippleContainer_4
Gui._0783_8.BackgroundTransparency = 1.000
Gui._0783_8.ClipsDescendants = true
Gui._0783_8.Position = UDim2.new(1, -3, 1, -3)
Gui._0783_8.Size = UDim2.new(0, 1, 0, 1)
Gui._0783_8.ImageTransparency = 0.278

Gui._0821_25.Name = "0.821"
Gui._0821_25.Parent = Gui.RippleContainer_4
Gui._0821_25.BackgroundTransparency = 1.000
Gui._0821_25.ClipsDescendants = true
Gui._0821_25.Position = UDim2.new(0, 1, 0, 3)
Gui._0821_25.Size = UDim2.new(0, 1, 0, 1)
Gui._0821_25.ImageTransparency = 0.404

Gui._0821_26.Name = "0.821"
Gui._0821_26.Parent = Gui.RippleContainer_4
Gui._0821_26.BackgroundTransparency = 1.000
Gui._0821_26.ClipsDescendants = true
Gui._0821_26.Position = UDim2.new(0, 1, 1, -4)
Gui._0821_26.Size = UDim2.new(0, 1, 0, 1)
Gui._0821_26.ImageTransparency = 0.404

Gui._0821_27.Name = "0.821"
Gui._0821_27.Parent = Gui.RippleContainer_4
Gui._0821_27.BackgroundTransparency = 1.000
Gui._0821_27.ClipsDescendants = true
Gui._0821_27.Position = UDim2.new(1, -2, 0, 3)
Gui._0821_27.Size = UDim2.new(0, 1, 0, 1)
Gui._0821_27.ImageTransparency = 0.404

Gui._0821_28.Name = "0.821"
Gui._0821_28.Parent = Gui.RippleContainer_4
Gui._0821_28.BackgroundTransparency = 1.000
Gui._0821_28.ClipsDescendants = true
Gui._0821_28.Position = UDim2.new(1, -2, 1, -4)
Gui._0821_28.Size = UDim2.new(0, 1, 0, 1)
Gui._0821_28.ImageTransparency = 0.404

Gui._0932_13.Name = "0.932"
Gui._0932_13.Parent = Gui.RippleContainer_4
Gui._0932_13.BackgroundTransparency = 1.000
Gui._0932_13.ClipsDescendants = true
Gui._0932_13.Position = UDim2.new(0, 0, 0, 4)
Gui._0932_13.Size = UDim2.new(0, 1, 0, 1)
Gui._0932_13.ImageTransparency = 0.776

Gui._0932_14.Name = "0.932"
Gui._0932_14.Parent = Gui.RippleContainer_4
Gui._0932_14.BackgroundTransparency = 1.000
Gui._0932_14.ClipsDescendants = true
Gui._0932_14.Position = UDim2.new(0, 0, 1, -5)
Gui._0932_14.Size = UDim2.new(0, 1, 0, 1)
Gui._0932_14.ImageTransparency = 0.776

Gui._0932_15.Name = "0.932"
Gui._0932_15.Parent = Gui.RippleContainer_4
Gui._0932_15.BackgroundTransparency = 1.000
Gui._0932_15.ClipsDescendants = true
Gui._0932_15.Position = UDim2.new(1, -1, 0, 4)
Gui._0932_15.Size = UDim2.new(0, 1, 0, 1)
Gui._0932_15.ImageTransparency = 0.776

Gui._0932_16.Name = "0.932"
Gui._0932_16.Parent = Gui.RippleContainer_4
Gui._0932_16.BackgroundTransparency = 1.000
Gui._0932_16.ClipsDescendants = true
Gui._0932_16.Position = UDim2.new(1, -1, 1, -5)
Gui._0932_16.Size = UDim2.new(0, 1, 0, 1)
Gui._0932_16.ImageTransparency = 0.776

Gui._0821_29.Name = "0.821"
Gui._0821_29.Parent = Gui.RippleContainer_4
Gui._0821_29.BackgroundTransparency = 1.000
Gui._0821_29.ClipsDescendants = true
Gui._0821_29.Position = UDim2.new(0, 0, 0, 5)
Gui._0821_29.Size = UDim2.new(0, 1, 0, 1)
Gui._0821_29.ImageTransparency = 0.404

Gui._0821_30.Name = "0.821"
Gui._0821_30.Parent = Gui.RippleContainer_4
Gui._0821_30.BackgroundTransparency = 1.000
Gui._0821_30.ClipsDescendants = true
Gui._0821_30.Position = UDim2.new(0, 0, 1, -6)
Gui._0821_30.Size = UDim2.new(0, 1, 0, 1)
Gui._0821_30.ImageTransparency = 0.404

Gui._0821_31.Name = "0.821"
Gui._0821_31.Parent = Gui.RippleContainer_4
Gui._0821_31.BackgroundTransparency = 1.000
Gui._0821_31.ClipsDescendants = true
Gui._0821_31.Position = UDim2.new(1, -1, 0, 5)
Gui._0821_31.Size = UDim2.new(0, 1, 0, 1)
Gui._0821_31.ImageTransparency = 0.404

Gui._0821_32.Name = "0.821"
Gui._0821_32.Parent = Gui.RippleContainer_4
Gui._0821_32.BackgroundTransparency = 1.000
Gui._0821_32.ClipsDescendants = true
Gui._0821_32.Position = UDim2.new(1, -1, 1, -6)
Gui._0821_32.Size = UDim2.new(0, 1, 0, 1)
Gui._0821_32.ImageTransparency = 0.404

Gui._0744_13.Name = "0.744"
Gui._0744_13.Parent = Gui.RippleContainer_4
Gui._0744_13.BackgroundTransparency = 1.000
Gui._0744_13.ClipsDescendants = true
Gui._0744_13.Position = UDim2.new(0, 0, 0, 6)
Gui._0744_13.Size = UDim2.new(0, 1, 0, 1)
Gui._0744_13.ImageTransparency = 0.149

Gui._0744_14.Name = "0.744"
Gui._0744_14.Parent = Gui.RippleContainer_4
Gui._0744_14.BackgroundTransparency = 1.000
Gui._0744_14.ClipsDescendants = true
Gui._0744_14.Position = UDim2.new(0, 0, 1, -7)
Gui._0744_14.Size = UDim2.new(0, 1, 0, 1)
Gui._0744_14.ImageTransparency = 0.149

Gui._0744_15.Name = "0.744"
Gui._0744_15.Parent = Gui.RippleContainer_4
Gui._0744_15.BackgroundTransparency = 1.000
Gui._0744_15.ClipsDescendants = true
Gui._0744_15.Position = UDim2.new(1, -1, 0, 6)
Gui._0744_15.Size = UDim2.new(0, 1, 0, 1)
Gui._0744_15.ImageTransparency = 0.149

Gui._0744_16.Name = "0.744"
Gui._0744_16.Parent = Gui.RippleContainer_4
Gui._0744_16.BackgroundTransparency = 1.000
Gui._0744_16.ClipsDescendants = true
Gui._0744_16.Position = UDim2.new(1, -1, 1, -7)
Gui._0744_16.Size = UDim2.new(0, 1, 0, 1)
Gui._0744_16.ImageTransparency = 0.149

Gui._0704_13.Name = "0.704"
Gui._0704_13.Parent = Gui.RippleContainer_4
Gui._0704_13.BackgroundTransparency = 1.000
Gui._0704_13.ClipsDescendants = true
Gui._0704_13.Position = UDim2.new(0, 0, 0, 7)
Gui._0704_13.Size = UDim2.new(0, 1, 0, 1)
Gui._0704_13.ImageTransparency = 0.016

Gui._0704_14.Name = "0.704"
Gui._0704_14.Parent = Gui.RippleContainer_4
Gui._0704_14.BackgroundTransparency = 1.000
Gui._0704_14.ClipsDescendants = true
Gui._0704_14.Position = UDim2.new(0, 0, 1, -8)
Gui._0704_14.Size = UDim2.new(0, 1, 0, 1)
Gui._0704_14.ImageTransparency = 0.016

Gui._0704_15.Name = "0.704"
Gui._0704_15.Parent = Gui.RippleContainer_4
Gui._0704_15.BackgroundTransparency = 1.000
Gui._0704_15.ClipsDescendants = true
Gui._0704_15.Position = UDim2.new(1, -1, 0, 7)
Gui._0704_15.Size = UDim2.new(0, 1, 0, 1)
Gui._0704_15.ImageTransparency = 0.016

Gui._0704_16.Name = "0.704"
Gui._0704_16.Parent = Gui.RippleContainer_4
Gui._0704_16.BackgroundTransparency = 1.000
Gui._0704_16.ClipsDescendants = true
Gui._0704_16.Position = UDim2.new(1, -1, 1, -8)
Gui._0704_16.Size = UDim2.new(0, 1, 0, 1)
Gui._0704_16.ImageTransparency = 0.016

Gui.Disabled.Name = "Disabled"
Gui.Disabled.Parent = Gui.Button
Gui.Disabled.AnchorPoint = Vector2.new(0.5, 0.5)
Gui.Disabled.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.Disabled.BackgroundTransparency = 1.000
Gui.Disabled.BorderSizePixel = 0
Gui.Disabled.Position = UDim2.new(0.5, 0, 0.5, 0)
Gui.Disabled.Size = UDim2.new(1, 0, 1, 0)
Gui.Disabled.ZIndex = 3
Gui.Disabled.Image = "rbxassetid://1935044829"
Gui.Disabled.ImageColor3 = Color3.fromRGB(0, 0, 0)
Gui.Disabled.ImageTransparency = 1.000
Gui.Disabled.ScaleType = Enum.ScaleType.Slice
Gui.Disabled.SliceCenter = Rect.new(8, 8, 248, 248)

Gui.Class_CheckBox.Name = "Class_CheckBox"
Gui.Class_CheckBox.Parent = Gui.resource

Gui.CheckBox.Name = "CheckBox"
Gui.CheckBox.Parent = Gui.Class_CheckBox
Gui.CheckBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.CheckBox.BackgroundTransparency = 1.000
Gui.CheckBox.Size = UDim2.new(0, 24, 0, 24)
Gui.CheckBox.ZIndex = 3
Gui.CheckBox.Image = "rbxassetid://1990905054"
Gui.CheckBox.ImageColor3 = Color3.fromRGB(60, 145, 255)

Gui.Box.Name = "Box"
Gui.Box.Parent = Gui.CheckBox
Gui.Box.AnchorPoint = Vector2.new(0.5, 0.5)
Gui.Box.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.Box.BackgroundTransparency = 1.000
Gui.Box.Position = UDim2.new(0.5, 0, 0.5, 0)
Gui.Box.Size = UDim2.new(1, 0, 1, 0)
Gui.Box.ZIndex = 2
Gui.Box.Image = "rbxassetid://1990916223"
Gui.Box.ImageColor3 = Color3.fromRGB(60, 145, 255)
Gui.Box.ScaleType = Enum.ScaleType.Fit
Gui.Box.SliceCenter = Rect.new(50, 50, 80, 80)

Gui.CheckText.Name = "CheckText"
Gui.CheckText.Parent = Gui.CheckBox
Gui.CheckText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.CheckText.BackgroundTransparency = 1.000
Gui.CheckText.BorderSizePixel = 0
Gui.CheckText.Position = UDim2.new(1, 12, 0, 0)
Gui.CheckText.Size = UDim2.new(0, 57, 1, 0)
Gui.CheckText.Font = Enum.Font.SourceSans
Gui.CheckText.Text = "CheckBox"
Gui.CheckText.TextColor3 = Color3.fromRGB(255, 255, 255)
Gui.CheckText.TextSize = 16.000
Gui.CheckText.TextXAlignment = Enum.TextXAlignment.Left

Gui.MouseOn.Name = "MouseOn"
Gui.MouseOn.Parent = Gui.CheckBox
Gui.MouseOn.AnchorPoint = Vector2.new(0.5, 0.5)
Gui.MouseOn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.MouseOn.BackgroundTransparency = 1.000
Gui.MouseOn.Position = UDim2.new(0.5, 0, 0.5, 0)
Gui.MouseOn.ZIndex = 4
Gui.MouseOn.Image = "rbxassetid://1217158727"
Gui.MouseOn.ImageColor3 = Color3.fromRGB(60, 145, 255)
Gui.MouseOn.ImageTransparency = 0.850

Gui.Side.Name = "Side"
Gui.Side.Parent = Gui.CheckBox
Gui.Side.AnchorPoint = Vector2.new(0.5, 0.5)
Gui.Side.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.Side.BackgroundTransparency = 1.000
Gui.Side.Position = UDim2.new(0.5, 0, 0.5, 0)
Gui.Side.Size = UDim2.new(1, -6, 1, -6)

Gui.L.Name = "L"
Gui.L.Parent = Gui.Side
Gui.L.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.L.BorderSizePixel = 0
Gui.L.Size = UDim2.new(0, 0, 1, 0)

Gui.R.Name = "R"
Gui.R.Parent = Gui.Side
Gui.R.AnchorPoint = Vector2.new(1, 0)
Gui.R.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.R.BorderSizePixel = 0
Gui.R.Position = UDim2.new(1, 0, 0, 0)
Gui.R.Size = UDim2.new(0, 0, 1, 0)

Gui.T.Name = "T"
Gui.T.Parent = Gui.Side
Gui.T.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.T.BorderSizePixel = 0
Gui.T.Size = UDim2.new(1, 0, 0, 0)

Gui.B.Name = "B"
Gui.B.Parent = Gui.Side
Gui.B.AnchorPoint = Vector2.new(0, 1)
Gui.B.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.B.BorderSizePixel = 0
Gui.B.Position = UDim2.new(0, 0, 1, 0)
Gui.B.Size = UDim2.new(1, 0, 0, 0)

Gui.MouseDown.Name = "MouseDown"
Gui.MouseDown.Parent = Gui.Class_CheckBox
Gui.MouseDown.AnchorPoint = Vector2.new(0.5, 0.5)
Gui.MouseDown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.MouseDown.BackgroundTransparency = 1.000
Gui.MouseDown.Position = UDim2.new(0.5, 0, 0.5, 0)
Gui.MouseDown.ZIndex = 4
Gui.MouseDown.Image = "rbxassetid://1217158727"
Gui.MouseDown.ImageColor3 = Color3.fromRGB(60, 145, 255)
Gui.MouseDown.ImageTransparency = 0.850

Gui.Class_IconButton.Name = "Class_IconButton"
Gui.Class_IconButton.Parent = Gui.resource

Gui.IconButton.Name = "IconButton"
Gui.IconButton.Parent = Gui.Class_IconButton
Gui.IconButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.IconButton.BackgroundTransparency = 1.000
Gui.IconButton.Size = UDim2.new(0, 50, 0, 50)
Gui.IconButton.ZIndex = 2
Gui.IconButton.AutoButtonColor = false
Gui.IconButton.Image = "rbxassetid://1217158727"
Gui.IconButton.ImageColor3 = Color3.fromRGB(45, 45, 45)

Gui.ButtonImage.Name = "ButtonImage"
Gui.ButtonImage.Parent = Gui.IconButton
Gui.ButtonImage.AnchorPoint = Vector2.new(0.5, 0.5)
Gui.ButtonImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.ButtonImage.BackgroundTransparency = 1.000
Gui.ButtonImage.BorderSizePixel = 0
Gui.ButtonImage.Position = UDim2.new(0.5, 0, 0.5, 0)
Gui.ButtonImage.Size = UDim2.new(0.800000012, 0, 0.800000012, 0)
Gui.ButtonImage.ZIndex = 2
Gui.ButtonImage.Image = "rbxassetid://3944675151"

Gui.On_2.Name = "On"
Gui.On_2.Parent = Gui.IconButton
Gui.On_2.AnchorPoint = Vector2.new(0.5, 0.5)
Gui.On_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.On_2.BackgroundTransparency = 1.000
Gui.On_2.BorderSizePixel = 0
Gui.On_2.Position = UDim2.new(0.5, 0, 0.5, 0)
Gui.On_2.Size = UDim2.new(1, 0, 1, 0)
Gui.On_2.ZIndex = 3
Gui.On_2.Image = "rbxassetid://1217158727"
Gui.On_2.ImageTransparency = 1.000

Gui.Disabled_2.Name = "Disabled"
Gui.Disabled_2.Parent = Gui.IconButton
Gui.Disabled_2.AnchorPoint = Vector2.new(0.5, 0.5)
Gui.Disabled_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.Disabled_2.BackgroundTransparency = 1.000
Gui.Disabled_2.BorderSizePixel = 0
Gui.Disabled_2.Position = UDim2.new(0.5, 0, 0.5, 0)
Gui.Disabled_2.Size = UDim2.new(1, 0, 1, 0)
Gui.Disabled_2.Visible = false
Gui.Disabled_2.ZIndex = 3
Gui.Disabled_2.Image = "rbxassetid://1217158727"
Gui.Disabled_2.ImageColor3 = Color3.fromRGB(0, 0, 0)
Gui.Disabled_2.ImageTransparency = 0.750

Gui.shadow.Name = "shadow"
Gui.shadow.Parent = Gui.IconButton
Gui.shadow.AnchorPoint = Vector2.new(0.5, 0.5)
Gui.shadow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.shadow.BackgroundTransparency = 1.000
Gui.shadow.LayoutOrder = 1
Gui.shadow.Position = UDim2.new(0.5, 0, 0.529999971, 0)
Gui.shadow.Size = UDim2.new(1.20000005, 0, 1.20000005, 0)
Gui.shadow.Image = "rbxassetid://2584395459"
Gui.shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
Gui.shadow.SliceCenter = Rect.new(500, 500, 500, 500)

Gui.Class_IndeterminateCircle.Name = "Class_IndeterminateCircle"
Gui.Class_IndeterminateCircle.Parent = Gui.resource

Gui.IndeterminateCircle.Name = "IndeterminateCircle"
Gui.IndeterminateCircle.Parent = Gui.Class_IndeterminateCircle
Gui.IndeterminateCircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.IndeterminateCircle.BackgroundTransparency = 1.000
Gui.IndeterminateCircle.Size = UDim2.new(0, 50, 0, 50)

Gui.Holder_2.Name = "Holder"
Gui.Holder_2.Parent = Gui.IndeterminateCircle
Gui.Holder_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.Holder_2.BackgroundTransparency = 1.000
Gui.Holder_2.BorderSizePixel = 0
Gui.Holder_2.Size = UDim2.new(1, 0, 1, 0)
Gui.Holder_2.Image = "http://www.roblox.com/asset/?id=3952960164"
Gui.Holder_2.ImageColor3 = Color3.fromRGB(0, 157, 255)

Gui.Class_IndeterminateProgress.Name = "Class_IndeterminateProgress"
Gui.Class_IndeterminateProgress.Parent = Gui.resource

Gui.IndeterminateProgress.Name = "IndeterminateProgress"
Gui.IndeterminateProgress.Parent = Gui.Class_IndeterminateProgress
Gui.IndeterminateProgress.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.IndeterminateProgress.BorderSizePixel = 0
Gui.IndeterminateProgress.ClipsDescendants = true
Gui.IndeterminateProgress.Size = UDim2.new(0, 350, 0, 5)

Gui.Bar.Name = "Bar"
Gui.Bar.Parent = Gui.Class_IndeterminateProgress
Gui.Bar.AnchorPoint = Vector2.new(0.5, 0)
Gui.Bar.BackgroundColor3 = Color3.fromRGB(30, 169, 255)
Gui.Bar.BorderSizePixel = 0
Gui.Bar.Position = UDim2.new(-0.5, 0, 0, 0)
Gui.Bar.Size = UDim2.new(0.100000001, 0, 1, 0)

Gui.Class_LinearProgress.Name = "Class_LinearProgress"
Gui.Class_LinearProgress.Parent = Gui.resource

Gui.LinearProgress.Name = "LinearProgress"
Gui.LinearProgress.Parent = Gui.Class_LinearProgress
Gui.LinearProgress.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.LinearProgress.BorderSizePixel = 0
Gui.LinearProgress.Size = UDim2.new(0, 350, 0, 5)

Gui.bar.Name = "bar"
Gui.bar.Parent = Gui.LinearProgress
Gui.bar.BackgroundColor3 = Color3.fromRGB(30, 169, 255)
Gui.bar.BorderSizePixel = 0
Gui.bar.Size = UDim2.new(0, 0, 1, 0)
Gui.bar.ZIndex = 2

Gui.Class_Pointing.Name = "Class_Pointing"
Gui.Class_Pointing.Parent = Gui.resource

Gui.Pointing.Name = "Pointing"
Gui.Pointing.Parent = Gui.Class_Pointing
Gui.Pointing.AnchorPoint = Vector2.new(0.5, 0.5)
Gui.Pointing.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.Pointing.BackgroundTransparency = 1.000
Gui.Pointing.BorderSizePixel = 0
Gui.Pointing.Position = UDim2.new(0.5, 0, 0.5, 0)
Gui.Pointing.Size = UDim2.new(0, 340, 0, 340)

Gui.Pointer.Name = "Pointer"
Gui.Pointer.Parent = Gui.Pointing
Gui.Pointer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.Pointer.BackgroundTransparency = 1.000
Gui.Pointer.BorderSizePixel = 0
Gui.Pointer.Size = UDim2.new(1, 0, 1, 0)
Gui.Pointer.Image = "rbxassetid://4030304084"
Gui.Pointer.ImageColor3 = Color3.fromRGB(70, 184, 255)
Gui.Pointer.ImageTransparency = 0.450

Gui.PointerRipple.Name = "PointerRipple"
Gui.PointerRipple.Parent = Gui.Class_Pointing
Gui.PointerRipple.AnchorPoint = Vector2.new(0.5, 0.5)
Gui.PointerRipple.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.PointerRipple.BackgroundTransparency = 1.000
Gui.PointerRipple.BorderSizePixel = 0
Gui.PointerRipple.Position = UDim2.new(0.5, 0, 0.5, 0)
Gui.PointerRipple.Size = UDim2.new(0.5, 0, 0.5, 0)
Gui.PointerRipple.Image = "rbxassetid://4030329127"
Gui.PointerRipple.ImageColor3 = Color3.fromRGB(70, 184, 255)
Gui.PointerRipple.ImageTransparency = 0.550

Gui.Class_RadioButton.Name = "Class_RadioButton"
Gui.Class_RadioButton.Parent = Gui.resource

Gui.RadioHolder.Name = "RadioHolder"
Gui.RadioHolder.Parent = Gui.Class_RadioButton
Gui.RadioHolder.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Gui.RadioHolder.BorderSizePixel = 0
Gui.RadioHolder.Size = UDim2.new(0, 200, 0, 200)

Gui.UIListLayout_2.Parent = Gui.RadioHolder
Gui.UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder

Gui.RadioButton.Name = "RadioButton"
Gui.RadioButton.Parent = Gui.Class_RadioButton
Gui.RadioButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.RadioButton.BackgroundTransparency = 1.000
Gui.RadioButton.BorderSizePixel = 0
Gui.RadioButton.Size = UDim2.new(0, 200, 0, 40)
Gui.RadioButton.ZIndex = 2
Gui.RadioButton.AutoButtonColor = false
Gui.RadioButton.Font = Enum.Font.Gotham
Gui.RadioButton.Text = "RadioButton"
Gui.RadioButton.TextColor3 = Color3.fromRGB(255, 255, 255)
Gui.RadioButton.TextSize = 14.000
Gui.RadioButton.TextXAlignment = Enum.TextXAlignment.Left

Gui.RadioIcon.Name = "RadioIcon"
Gui.RadioIcon.Parent = Gui.RadioButton
Gui.RadioIcon.AnchorPoint = Vector2.new(0, 0.5)
Gui.RadioIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.RadioIcon.BackgroundTransparency = 1.000
Gui.RadioIcon.Position = UDim2.new(0, -35, 0.5, 0)
Gui.RadioIcon.Size = UDim2.new(0, 20, 0, 20)
Gui.RadioIcon.AutoButtonColor = false
Gui.RadioIcon.Image = "http://www.roblox.com/asset/?id=4667411351"
Gui.RadioIcon.ImageColor3 = Color3.fromRGB(180, 180, 180)
Gui.RadioIcon.ImageRectSize = Vector2.new(40, 40)

Gui.MouseOn_2.Name = "MouseOn"
Gui.MouseOn_2.Parent = Gui.RadioIcon
Gui.MouseOn_2.AnchorPoint = Vector2.new(0.5, 0.5)
Gui.MouseOn_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.MouseOn_2.BackgroundTransparency = 1.000
Gui.MouseOn_2.BorderSizePixel = 0
Gui.MouseOn_2.Position = UDim2.new(0.5, 0, 0.5, 0)
Gui.MouseOn_2.ZIndex = 3
Gui.MouseOn_2.Image = "rbxassetid://1217158727"
Gui.MouseOn_2.ImageTransparency = 0.850

Gui.UIPadding_2.Parent = Gui.RadioButton
Gui.UIPadding_2.PaddingLeft = UDim.new(0, 45)

Gui.Class_Ripple.Name = "Class_Ripple"
Gui.Class_Ripple.Parent = Gui.resource

Gui.Ripple.Name = "Ripple"
Gui.Ripple.Parent = Gui.Class_Ripple
Gui.Ripple.AnchorPoint = Vector2.new(0.5, 0.5)
Gui.Ripple.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.Ripple.BackgroundTransparency = 1.000
Gui.Ripple.BorderSizePixel = 0
Gui.Ripple.Position = UDim2.new(0.5, 0, 0.5, 0)
Gui.Ripple.ZIndex = 3
Gui.Ripple.Image = "rbxassetid://1217158727"
Gui.Ripple.ImageTransparency = 0.700

Gui.RippleHolder.Name = "RippleHolder"
Gui.RippleHolder.Parent = Gui.Class_Ripple
Gui.RippleHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.RippleHolder.BackgroundTransparency = 1.000
Gui.RippleHolder.BorderSizePixel = 0
Gui.RippleHolder.ClipsDescendants = true
Gui.RippleHolder.Size = UDim2.new(1, 0, 1, 0)

Gui.Class_Scroll.Name = "Class_Scroll"
Gui.Class_Scroll.Parent = Gui.resource

Gui.Scroll.Name = "Scroll"
Gui.Scroll.Parent = Gui.Class_Scroll
Gui.Scroll.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Gui.Scroll.BorderSizePixel = 0
Gui.Scroll.Size = UDim2.new(0, 200, 0, 200)

Gui.Holder_3.Name = "Holder"
Gui.Holder_3.Parent = Gui.Scroll
Gui.Holder_3.Active = true
Gui.Holder_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.Holder_3.BackgroundTransparency = 1.000
Gui.Holder_3.BorderSizePixel = 0
Gui.Holder_3.Size = UDim2.new(1, 0, 1, 0)
Gui.Holder_3.CanvasSize = UDim2.new(0, 0, 0, 1600)

Gui.UIListLayout_3.Parent = Gui.Holder_3
Gui.UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder

Gui.InputFrame.Name = "InputFrame"
Gui.InputFrame.Parent = Gui.Class_Scroll
Gui.InputFrame.BackgroundTransparency = 1.000
Gui.InputFrame.BorderSizePixel = 0
Gui.InputFrame.Size = UDim2.new(1, 0, 1, 0)

Gui.Class_Shadow.Name = "Class_Shadow"
Gui.Class_Shadow.Parent = Gui.resource

Gui.Shadow.Name = "Shadow"
Gui.Shadow.Parent = Gui.Class_Shadow
Gui.Shadow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.Shadow.BackgroundTransparency = 1.000
Gui.Shadow.BorderSizePixel = 0
Gui.Shadow.Size = UDim2.new(1, 0, 1, 0)

Gui.B_2.Name = "B"
Gui.B_2.Parent = Gui.Shadow
Gui.B_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.B_2.BackgroundTransparency = 1.000
Gui.B_2.BorderSizePixel = 0
Gui.B_2.Position = UDim2.new(0, 0, 1, 0)
Gui.B_2.Size = UDim2.new(1, 0, 0, 8)
Gui.B_2.Image = "rbxassetid://2715137474"
Gui.B_2.ImageColor3 = Color3.fromRGB(0, 0, 0)
Gui.B_2.ImageTransparency = 0.650

Gui.L_2.Name = "L"
Gui.L_2.Parent = Gui.Shadow
Gui.L_2.AnchorPoint = Vector2.new(1, 0)
Gui.L_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.L_2.BackgroundTransparency = 1.000
Gui.L_2.BorderSizePixel = 0
Gui.L_2.Size = UDim2.new(0, 8, 1, 0)
Gui.L_2.Image = "rbxassetid://2715140280"
Gui.L_2.ImageColor3 = Color3.fromRGB(0, 0, 0)
Gui.L_2.ImageTransparency = 0.650

Gui.LB.Name = "LB"
Gui.LB.Parent = Gui.Shadow
Gui.LB.AnchorPoint = Vector2.new(1, 0)
Gui.LB.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.LB.BackgroundTransparency = 1.000
Gui.LB.BorderSizePixel = 0
Gui.LB.Position = UDim2.new(0, 0, 1, 0)
Gui.LB.Size = UDim2.new(0, 8, 0, 8)
Gui.LB.Image = "rbxassetid://2715199828"
Gui.LB.ImageColor3 = Color3.fromRGB(0, 0, 0)
Gui.LB.ImageTransparency = 0.650

Gui.LT.Name = "LT"
Gui.LT.Parent = Gui.Shadow
Gui.LT.AnchorPoint = Vector2.new(1, 1)
Gui.LT.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.LT.BackgroundTransparency = 1.000
Gui.LT.BorderSizePixel = 0
Gui.LT.Size = UDim2.new(0, 8, 0, 8)
Gui.LT.Image = "rbxassetid://2715200507"
Gui.LT.ImageColor3 = Color3.fromRGB(0, 0, 0)
Gui.LT.ImageTransparency = 0.650

Gui.R_2.Name = "R"
Gui.R_2.Parent = Gui.Shadow
Gui.R_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.R_2.BackgroundTransparency = 1.000
Gui.R_2.BorderSizePixel = 0
Gui.R_2.Position = UDim2.new(1, 0, 0, 0)
Gui.R_2.Size = UDim2.new(0, 8, 1, 0)
Gui.R_2.Image = "rbxassetid://2715141619"
Gui.R_2.ImageColor3 = Color3.fromRGB(0, 0, 0)
Gui.R_2.ImageTransparency = 0.650

Gui.RB.Name = "RB"
Gui.RB.Parent = Gui.Shadow
Gui.RB.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.RB.BackgroundTransparency = 1.000
Gui.RB.BorderSizePixel = 0
Gui.RB.Position = UDim2.new(1, 0, 1, 0)
Gui.RB.Size = UDim2.new(0, 8, 0, 8)
Gui.RB.Image = "rbxassetid://2715200973"
Gui.RB.ImageColor3 = Color3.fromRGB(0, 0, 0)
Gui.RB.ImageTransparency = 0.650

Gui.RT.Name = "RT"
Gui.RT.Parent = Gui.Shadow
Gui.RT.AnchorPoint = Vector2.new(0, 1)
Gui.RT.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.RT.BackgroundTransparency = 1.000
Gui.RT.BorderSizePixel = 0
Gui.RT.Position = UDim2.new(1, 0, 0, 0)
Gui.RT.Size = UDim2.new(0, 8, 0, 8)
Gui.RT.Image = "rbxassetid://2715201545"
Gui.RT.ImageColor3 = Color3.fromRGB(0, 0, 0)
Gui.RT.ImageTransparency = 0.650

Gui.T_2.Name = "T"
Gui.T_2.Parent = Gui.Shadow
Gui.T_2.AnchorPoint = Vector2.new(0, 1)
Gui.T_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.T_2.BackgroundTransparency = 1.000
Gui.T_2.BorderSizePixel = 0
Gui.T_2.Size = UDim2.new(1, 0, 0, 8)
Gui.T_2.Image = "rbxassetid://2715138063"
Gui.T_2.ImageColor3 = Color3.fromRGB(0, 0, 0)
Gui.T_2.ImageTransparency = 0.650

Gui.Class_Silder.Name = "Class_Silder"
Gui.Class_Silder.Parent = Gui.resource

Gui.Silder.Name = "Silder"
Gui.Silder.Parent = Gui.Class_Silder
Gui.Silder.BackgroundColor3 = Color3.fromRGB(125, 125, 125)
Gui.Silder.BorderSizePixel = 0
Gui.Silder.Size = UDim2.new(0, 160, 0, 2)

Gui.Point.Name = "Point"
Gui.Point.Parent = Gui.Silder
Gui.Point.AnchorPoint = Vector2.new(0.5, 0.5)
Gui.Point.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.Point.BackgroundTransparency = 1.000
Gui.Point.Position = UDim2.new(0, 0, 0.5, 0)
Gui.Point.Size = UDim2.new(0, 12, 0, 12)
Gui.Point.ZIndex = 4
Gui.Point.Image = "rbxassetid://1217158727"
Gui.Point.ImageColor3 = Color3.fromRGB(0, 172, 255)

Gui.MouseOn_3.Name = "MouseOn"
Gui.MouseOn_3.Parent = Gui.Point
Gui.MouseOn_3.AnchorPoint = Vector2.new(0.5, 0.5)
Gui.MouseOn_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.MouseOn_3.BackgroundTransparency = 1.000
Gui.MouseOn_3.Position = UDim2.new(0.5, 0, 0.5, 0)
Gui.MouseOn_3.ZIndex = 4
Gui.MouseOn_3.Image = "rbxassetid://1217158727"
Gui.MouseOn_3.ImageColor3 = Color3.fromRGB(0, 172, 255)
Gui.MouseOn_3.ImageTransparency = 0.850

Gui.MouseDown_2.Name = "MouseDown"
Gui.MouseDown_2.Parent = Gui.Point
Gui.MouseDown_2.AnchorPoint = Vector2.new(0.5, 0.5)
Gui.MouseDown_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.MouseDown_2.BackgroundTransparency = 1.000
Gui.MouseDown_2.Position = UDim2.new(0.5, 0, 0.5, 0)
Gui.MouseDown_2.ZIndex = 4
Gui.MouseDown_2.Image = "rbxassetid://1217158727"
Gui.MouseDown_2.ImageColor3 = Color3.fromRGB(0, 172, 255)
Gui.MouseDown_2.ImageTransparency = 0.850

Gui.ValueLabel.Name = "ValueLabel"
Gui.ValueLabel.Parent = Gui.Point
Gui.ValueLabel.AnchorPoint = Vector2.new(0.5, 1)
Gui.ValueLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.ValueLabel.BackgroundTransparency = 1.000
Gui.ValueLabel.BorderSizePixel = 0
Gui.ValueLabel.ClipsDescendants = true
Gui.ValueLabel.Position = UDim2.new(0.5, 0, 0, 2)
Gui.ValueLabel.ZIndex = 1000000
Gui.ValueLabel.Image = "http://www.roblox.com/asset/?id=4638062084"
Gui.ValueLabel.ImageColor3 = Color3.fromRGB(0, 172, 255)

Gui.Text_2.Name = "Text"
Gui.Text_2.Parent = Gui.ValueLabel
Gui.Text_2.AnchorPoint = Vector2.new(0.5, 0)
Gui.Text_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.Text_2.BackgroundTransparency = 1.000
Gui.Text_2.Position = UDim2.new(0.5, 0, 0, 0)
Gui.Text_2.Size = UDim2.new(0.800000012, 0, 0, 28)
Gui.Text_2.ZIndex = 1000000
Gui.Text_2.Font = Enum.Font.SourceSans
Gui.Text_2.Text = "1"
Gui.Text_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Gui.Text_2.TextSize = 14.000

Gui.Disabled_3.Name = "Disabled"
Gui.Disabled_3.Parent = Gui.Point
Gui.Disabled_3.AnchorPoint = Vector2.new(0.5, 0.5)
Gui.Disabled_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.Disabled_3.BackgroundTransparency = 1.000
Gui.Disabled_3.Position = UDim2.new(0.5, 0, 0.5, 0)
Gui.Disabled_3.Size = UDim2.new(1, 2, 1, 2)
Gui.Disabled_3.Visible = false
Gui.Disabled_3.ZIndex = 5
Gui.Disabled_3.Image = "rbxassetid://1217158727"
Gui.Disabled_3.ImageColor3 = Color3.fromRGB(125, 125, 125)

Gui.Back.Name = "Back"
Gui.Back.Parent = Gui.Silder
Gui.Back.BackgroundColor3 = Color3.fromRGB(0, 170, 210)
Gui.Back.BorderSizePixel = 0
Gui.Back.Size = UDim2.new(0, 0, 1, 0)

Gui.MouseButton.Name = "MouseButton"
Gui.MouseButton.Parent = Gui.Silder
Gui.MouseButton.AnchorPoint = Vector2.new(0, 0.5)
Gui.MouseButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.MouseButton.BackgroundTransparency = 1.000
Gui.MouseButton.BorderSizePixel = 0
Gui.MouseButton.Position = UDim2.new(0, 0, 0.5, 0)
Gui.MouseButton.Size = UDim2.new(1, 0, 1, 10)
Gui.MouseButton.Font = Enum.Font.SourceSans
Gui.MouseButton.Text = ""
Gui.MouseButton.TextColor3 = Color3.fromRGB(0, 0, 0)
Gui.MouseButton.TextSize = 14.000
Gui.MouseButton.TextTransparency = 1.000

Gui.GridFrame.Name = "GridFrame"
Gui.GridFrame.Parent = Gui.Silder
Gui.GridFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.GridFrame.BackgroundTransparency = 1.000
Gui.GridFrame.BorderSizePixel = 0
Gui.GridFrame.Size = UDim2.new(1, 0, 0, 2)
Gui.GridFrame.ZIndex = 2

Gui.Disabled_4.Name = "Disabled"
Gui.Disabled_4.Parent = Gui.Silder
Gui.Disabled_4.BackgroundColor3 = Color3.fromRGB(125, 125, 125)
Gui.Disabled_4.BorderSizePixel = 0
Gui.Disabled_4.Size = UDim2.new(1, 0, 1, 0)
Gui.Disabled_4.Visible = false
Gui.Disabled_4.ZIndex = 2

Gui.Class_Snackbar.Name = "Class_Snackbar"
Gui.Class_Snackbar.Parent = Gui.resource

Gui.Snackbars.Name = "Snackbars"
Gui.Snackbars.Parent = Gui.Class_Snackbar
Gui.Snackbars.AnchorPoint = Vector2.new(0, 1)
Gui.Snackbars.BackgroundTransparency = 1.000
Gui.Snackbars.BorderSizePixel = 0
Gui.Snackbars.Position = UDim2.new(0, 8, 1, 56)
Gui.Snackbars.Size = UDim2.new(0, 300, 0, 50)
Gui.Snackbars.ZIndex = 2
Gui.Snackbars.Image = "rbxassetid://1307995459"
Gui.Snackbars.ImageColor3 = Color3.fromRGB(45, 45, 45)
Gui.Snackbars.ScaleType = Enum.ScaleType.Slice
Gui.Snackbars.SliceCenter = Rect.new(12, 12, 254, 254)

Gui.TextLabel.Parent = Gui.Snackbars
Gui.TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.TextLabel.BackgroundTransparency = 1.000
Gui.TextLabel.BorderSizePixel = 0
Gui.TextLabel.Size = UDim2.new(1, -80, 1, 0)
Gui.TextLabel.ZIndex = 2
Gui.TextLabel.Font = Enum.Font.Gotham
Gui.TextLabel.Text = "Saved"
Gui.TextLabel.TextColor3 = Color3.fromRGB(241, 241, 241)
Gui.TextLabel.TextSize = 16.000
Gui.TextLabel.TextXAlignment = Enum.TextXAlignment.Left

Gui.Shadow_2.Name = "Shadow"
Gui.Shadow_2.Parent = Gui.Snackbars
Gui.Shadow_2.AnchorPoint = Vector2.new(0.5, 0.5)
Gui.Shadow_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.Shadow_2.BackgroundTransparency = 1.000
Gui.Shadow_2.Position = UDim2.new(0.5, -5, 0.5, 0)
Gui.Shadow_2.Size = UDim2.new(1, 34, 1, 24)
Gui.Shadow_2.Image = "rbxassetid://1542279314"
Gui.Shadow_2.ImageColor3 = Color3.fromRGB(0, 0, 0)
Gui.Shadow_2.ScaleType = Enum.ScaleType.Slice
Gui.Shadow_2.SliceCenter = Rect.new(500, 500, 500, 500)

Gui.Holder_4.Name = "Holder"
Gui.Holder_4.Parent = Gui.Snackbars
Gui.Holder_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.Holder_4.BackgroundTransparency = 1.000
Gui.Holder_4.Size = UDim2.new(1, 0, 1, 0)

Gui.UIListLayout_4.Parent = Gui.Holder_4
Gui.UIListLayout_4.FillDirection = Enum.FillDirection.Horizontal
Gui.UIListLayout_4.HorizontalAlignment = Enum.HorizontalAlignment.Right
Gui.UIListLayout_4.SortOrder = Enum.SortOrder.LayoutOrder
Gui.UIListLayout_4.VerticalAlignment = Enum.VerticalAlignment.Center

Gui.UIPadding_3.Parent = Gui.Snackbars
Gui.UIPadding_3.PaddingBottom = UDim.new(0, 6)
Gui.UIPadding_3.PaddingLeft = UDim.new(0, 16)
Gui.UIPadding_3.PaddingRight = UDim.new(0, 6)
Gui.UIPadding_3.PaddingTop = UDim.new(0, 6)

Gui.Class_Switch.Name = "Class_Switch"
Gui.Class_Switch.Parent = Gui.resource

Gui.Switch.Name = "Switch"
Gui.Switch.Parent = Gui.Class_Switch
Gui.Switch.BackgroundTransparency = 1.000
Gui.Switch.Size = UDim2.new(0, 36, 0, 16)
Gui.Switch.Image = "rbxassetid://1935044829"
Gui.Switch.ImageColor3 = Color3.fromRGB(150, 150, 150)
Gui.Switch.ScaleType = Enum.ScaleType.Slice
Gui.Switch.SliceCenter = Rect.new(8, 8, 248, 248)

Gui.Thumb.Name = "Thumb"
Gui.Thumb.Parent = Gui.Switch
Gui.Thumb.AnchorPoint = Vector2.new(0.5, 0.5)
Gui.Thumb.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.Thumb.BackgroundTransparency = 1.000
Gui.Thumb.BorderSizePixel = 0
Gui.Thumb.Position = UDim2.new(0, 0, 0.5, 0)
Gui.Thumb.Size = UDim2.new(0, 20, 0, 20)
Gui.Thumb.ZIndex = 3
Gui.Thumb.Image = "rbxassetid://1217158727"

Gui.Shadow_3.Name = "Shadow"
Gui.Shadow_3.Parent = Gui.Thumb
Gui.Shadow_3.AnchorPoint = Vector2.new(0.5, 0.5)
Gui.Shadow_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.Shadow_3.BackgroundTransparency = 1.000
Gui.Shadow_3.LayoutOrder = 1
Gui.Shadow_3.Position = UDim2.new(0.5, 0, 0.529999971, 0)
Gui.Shadow_3.Size = UDim2.new(1.14999998, 0, 1.20000005, 0)
Gui.Shadow_3.ZIndex = 2
Gui.Shadow_3.Image = "rbxassetid://2584395459"
Gui.Shadow_3.ImageColor3 = Color3.fromRGB(0, 0, 0)
Gui.Shadow_3.SliceCenter = Rect.new(500, 500, 500, 500)

Gui.MouseOn_4.Name = "MouseOn"
Gui.MouseOn_4.Parent = Gui.Thumb
Gui.MouseOn_4.AnchorPoint = Vector2.new(0.5, 0.5)
Gui.MouseOn_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.MouseOn_4.BackgroundTransparency = 1.000
Gui.MouseOn_4.Position = UDim2.new(0.5, 0, 0.5, 0)
Gui.MouseOn_4.ZIndex = 3
Gui.MouseOn_4.Image = "rbxassetid://1217158727"
Gui.MouseOn_4.ImageColor3 = Color3.fromRGB(0, 172, 255)
Gui.MouseOn_4.ImageTransparency = 0.850

Gui.MouseDown_3.Name = "MouseDown"
Gui.MouseDown_3.Parent = Gui.Thumb
Gui.MouseDown_3.AnchorPoint = Vector2.new(0.5, 0.5)
Gui.MouseDown_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.MouseDown_3.BackgroundTransparency = 1.000
Gui.MouseDown_3.Position = UDim2.new(0.5, 0, 0.5, 0)
Gui.MouseDown_3.ZIndex = 3
Gui.MouseDown_3.Image = "rbxassetid://1217158727"
Gui.MouseDown_3.ImageColor3 = Color3.fromRGB(0, 172, 255)
Gui.MouseDown_3.ImageTransparency = 0.850

Gui.UIPadding_4.Parent = Gui.Switch
Gui.UIPadding_4.PaddingLeft = UDim.new(0, 8)
Gui.UIPadding_4.PaddingRight = UDim.new(0, 8)

Gui.Class_Tabs.Name = "Class_Tabs"
Gui.Class_Tabs.Parent = Gui.resource

Gui.Tabs.Name = "Tabs"
Gui.Tabs.Parent = Gui.Class_Tabs
Gui.Tabs.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.Tabs.BorderSizePixel = 0
Gui.Tabs.ClipsDescendants = true
Gui.Tabs.Size = UDim2.new(0, 100, 0, 100)

Gui.Pages.Name = "Pages"
Gui.Pages.Parent = Gui.Tabs
Gui.Pages.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Gui.Pages.BackgroundTransparency = 1.000
Gui.Pages.BorderSizePixel = 0
Gui.Pages.ClipsDescendants = true
Gui.Pages.Position = UDim2.new(0, 0, 0, 35)
Gui.Pages.Size = UDim2.new(1, 0, 1, -35)

Gui.PageLayout.Name = "PageLayout"
Gui.PageLayout.Parent = Gui.Pages
Gui.PageLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
Gui.PageLayout.SortOrder = Enum.SortOrder.LayoutOrder
Gui.PageLayout.VerticalAlignment = Enum.VerticalAlignment.Center
Gui.PageLayout.EasingDirection = Enum.EasingDirection.In
Gui.PageLayout.EasingStyle = Enum.EasingStyle.Quad
Gui.PageLayout.GamepadInputEnabled = false
Gui.PageLayout.Padding = UDim.new(0, 12)
Gui.PageLayout.ScrollWheelInputEnabled = false
Gui.PageLayout.TouchInputEnabled = false
Gui.PageLayout.TweenTime = 0.300

Gui.Bar_2.Name = "Bar"
Gui.Bar_2.Parent = Gui.Tabs
Gui.Bar_2.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Gui.Bar_2.BorderSizePixel = 0
Gui.Bar_2.Size = UDim2.new(1, 0, 0, 35)

Gui.Point_2.Name = "Point"
Gui.Point_2.Parent = Gui.Bar_2
Gui.Point_2.BackgroundColor3 = Color3.fromRGB(60, 145, 255)
Gui.Point_2.BorderSizePixel = 0
Gui.Point_2.Position = UDim2.new(0, 0, 1, -3)
Gui.Point_2.Size = UDim2.new(0, 0, 0, 3)

Gui.Shadow_4.Name = "Shadow"
Gui.Shadow_4.Parent = Gui.Bar_2
Gui.Shadow_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.Shadow_4.BackgroundTransparency = 1.000
Gui.Shadow_4.BorderSizePixel = 0
Gui.Shadow_4.Position = UDim2.new(0, 0, 1, 0)
Gui.Shadow_4.Size = UDim2.new(1, 0, 0, 6)
Gui.Shadow_4.Image = "rbxassetid://2715137474"
Gui.Shadow_4.ImageColor3 = Color3.fromRGB(0, 0, 0)
Gui.Shadow_4.ImageTransparency = 0.800

Gui.Buttons.Name = "Buttons"
Gui.Buttons.Parent = Gui.Bar_2
Gui.Buttons.Active = true
Gui.Buttons.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.Buttons.BackgroundTransparency = 1.000
Gui.Buttons.BorderSizePixel = 0
Gui.Buttons.Size = UDim2.new(1, 0, 1, -3)
Gui.Buttons.CanvasSize = UDim2.new(0, 0, 0, 0)
Gui.Buttons.ScrollBarThickness = 0

Gui.ListLayout.Name = "ListLayout"
Gui.ListLayout.Parent = Gui.Buttons
Gui.ListLayout.FillDirection = Enum.FillDirection.Horizontal
Gui.ListLayout.SortOrder = Enum.SortOrder.LayoutOrder

Gui.InputFrame_2.Name = "InputFrame"
Gui.InputFrame_2.Parent = Gui.Class_Tabs
Gui.InputFrame_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.InputFrame_2.BackgroundTransparency = 1.000
Gui.InputFrame_2.BorderSizePixel = 0
Gui.InputFrame_2.Size = UDim2.new(1, 0, 1, -3)
Gui.InputFrame_2.CanvasSize = UDim2.new(0, 0, 0, 400)
Gui.InputFrame_2.ScrollBarThickness = 0

Gui.TabFrame.Name = "TabFrame"
Gui.TabFrame.Parent = Gui.Class_Tabs
Gui.TabFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.TabFrame.BackgroundTransparency = 1.000
Gui.TabFrame.BorderSizePixel = 0
Gui.TabFrame.Size = UDim2.new(1, 0, 1, 0)

Gui.TabButton.Name = "TabButton"
Gui.TabButton.Parent = Gui.Class_Tabs
Gui.TabButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.TabButton.BackgroundTransparency = 1.000
Gui.TabButton.ClipsDescendants = true
Gui.TabButton.Size = UDim2.new(0, 100, 1, 0)
Gui.TabButton.AutoButtonColor = false
Gui.TabButton.Font = Enum.Font.SourceSans
Gui.TabButton.Text = ""
Gui.TabButton.TextColor3 = Color3.fromRGB(0, 0, 0)
Gui.TabButton.TextSize = 14.000

Gui.Holder_5.Name = "Holder"
Gui.Holder_5.Parent = Gui.TabButton
Gui.Holder_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.Holder_5.BackgroundTransparency = 1.000
Gui.Holder_5.Size = UDim2.new(1, 0, 1, 0)

Gui.Icon.Name = "Icon"
Gui.Icon.Parent = Gui.Holder_5
Gui.Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.Icon.BackgroundTransparency = 1.000
Gui.Icon.BorderSizePixel = 0
Gui.Icon.Size = UDim2.new(0.800000012, 0, 0.800000012, 0)
Gui.Icon.SizeConstraint = Enum.SizeConstraint.RelativeYY
Gui.Icon.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"

Gui.TextLabel_2.Parent = Gui.Holder_5
Gui.TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.TextLabel_2.BackgroundTransparency = 1.000
Gui.TextLabel_2.BorderSizePixel = 0
Gui.TextLabel_2.Size = UDim2.new(0, 200, 0, 50)
Gui.TextLabel_2.Font = Enum.Font.Gotham
Gui.TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Gui.TextLabel_2.TextSize = 14.000
Gui.TextLabel_2.TextXAlignment = Enum.TextXAlignment.Left

Gui.UIListLayout_5.Parent = Gui.Holder_5
Gui.UIListLayout_5.FillDirection = Enum.FillDirection.Horizontal
Gui.UIListLayout_5.HorizontalAlignment = Enum.HorizontalAlignment.Center
Gui.UIListLayout_5.SortOrder = Enum.SortOrder.LayoutOrder
Gui.UIListLayout_5.VerticalAlignment = Enum.VerticalAlignment.Center
Gui.UIListLayout_5.Padding = UDim.new(0, 6)

Gui.Class_TextField.Name = "Class_TextField"
Gui.Class_TextField.Parent = Gui.resource

Gui.TextField.Name = "TextField"
Gui.TextField.Parent = Gui.Class_TextField
Gui.TextField.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.TextField.BackgroundTransparency = 1.000
Gui.TextField.Size = UDim2.new(0, 200, 0, 28)
Gui.TextField.ZIndex = 2
Gui.TextField.ClearTextOnFocus = false
Gui.TextField.Font = Enum.Font.Gotham
Gui.TextField.PlaceholderColor3 = Color3.fromRGB(156, 156, 156)
Gui.TextField.Text = ""
Gui.TextField.TextColor3 = Color3.fromRGB(0, 0, 0)
Gui.TextField.TextSize = 14.000
Gui.TextField.TextXAlignment = Enum.TextXAlignment.Left

Gui.Placeholder.Name = "Placeholder"
Gui.Placeholder.Parent = Gui.TextField
Gui.Placeholder.AnchorPoint = Vector2.new(0, 0.5)
Gui.Placeholder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.Placeholder.BackgroundTransparency = 1.000
Gui.Placeholder.Position = UDim2.new(0, 0, 0.5, 0)
Gui.Placeholder.Size = UDim2.new(1, 0, 1, 0)
Gui.Placeholder.ZIndex = 2
Gui.Placeholder.Font = Enum.Font.Gotham
Gui.Placeholder.Text = "Name"
Gui.Placeholder.TextColor3 = Color3.fromRGB(156, 156, 156)
Gui.Placeholder.TextSize = 14.000
Gui.Placeholder.TextWrapped = true
Gui.Placeholder.TextXAlignment = Enum.TextXAlignment.Left

Gui.Style.Name = "Style"
Gui.Style.Parent = Gui.Class_TextField

Gui.Filled.Name = "Filled"
Gui.Filled.Parent = Gui.Style

Gui.Bar_3.Name = "Bar"
Gui.Bar_3.Parent = Gui.Filled
Gui.Bar_3.BackgroundColor3 = Color3.fromRGB(182, 182, 182)
Gui.Bar_3.BorderSizePixel = 0
Gui.Bar_3.Position = UDim2.new(0, -6, 1, 0)
Gui.Bar_3.Selectable = true
Gui.Bar_3.Size = UDim2.new(1, 12, 0, 2)
Gui.Bar_3.ZIndex = 3

Gui.Padding.Name = "Padding"
Gui.Padding.Parent = Gui.Filled
Gui.Padding.PaddingLeft = UDim.new(0, 6)
Gui.Padding.PaddingRight = UDim.new(0, 6)

Gui.Filled_2.Name = "Filled"
Gui.Filled_2.Parent = Gui.Filled
Gui.Filled_2.BackgroundTransparency = 1.000
Gui.Filled_2.BorderSizePixel = 0
Gui.Filled_2.Position = UDim2.new(0, -6, 0, -8)
Gui.Filled_2.Size = UDim2.new(1, 12, 1, 10)
Gui.Filled_2.Image = "rbxassetid://1307995459"
Gui.Filled_2.ImageColor3 = Color3.fromRGB(245, 245, 245)
Gui.Filled_2.ScaleType = Enum.ScaleType.Slice
Gui.Filled_2.SliceCenter = Rect.new(2, 2, 254, 254)

Gui.ErrorText.Name = "ErrorText"
Gui.ErrorText.Parent = Gui.Filled
Gui.ErrorText.AnchorPoint = Vector2.new(1, 0)
Gui.ErrorText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.ErrorText.BackgroundTransparency = 1.000
Gui.ErrorText.BorderSizePixel = 0
Gui.ErrorText.Position = UDim2.new(1, 6, 1, 2)
Gui.ErrorText.Size = UDim2.new(1, -4, 0, 18)
Gui.ErrorText.Visible = false
Gui.ErrorText.Font = Enum.Font.Gotham
Gui.ErrorText.Text = "Error"
Gui.ErrorText.TextColor3 = Color3.fromRGB(255, 33, 33)
Gui.ErrorText.TextSize = 12.000
Gui.ErrorText.TextStrokeColor3 = Color3.fromRGB(255, 33, 33)
Gui.ErrorText.TextStrokeTransparency = 0.940
Gui.ErrorText.TextXAlignment = Enum.TextXAlignment.Right

Gui.MouseOn_5.Name = "MouseOn"
Gui.MouseOn_5.Parent = Gui.Filled
Gui.MouseOn_5.BackgroundTransparency = 1.000
Gui.MouseOn_5.BorderSizePixel = 0
Gui.MouseOn_5.Position = UDim2.new(0, -6, 0, -8)
Gui.MouseOn_5.Size = UDim2.new(1, 12, 1, 10)
Gui.MouseOn_5.ZIndex = 2
Gui.MouseOn_5.Image = "rbxassetid://1307995459"
Gui.MouseOn_5.ImageColor3 = Color3.fromRGB(245, 245, 245)
Gui.MouseOn_5.ImageTransparency = 1.000
Gui.MouseOn_5.ScaleType = Enum.ScaleType.Slice
Gui.MouseOn_5.SliceCenter = Rect.new(2, 2, 254, 254)

Gui.HelperText.Name = "HelperText"
Gui.HelperText.Parent = Gui.Filled
Gui.HelperText.AnchorPoint = Vector2.new(1, 0)
Gui.HelperText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.HelperText.BackgroundTransparency = 1.000
Gui.HelperText.BorderSizePixel = 0
Gui.HelperText.Position = UDim2.new(1, 0, 1, 2)
Gui.HelperText.Size = UDim2.new(1, 0, 0, 18)
Gui.HelperText.Font = Enum.Font.Gotham
Gui.HelperText.Text = ""
Gui.HelperText.TextColor3 = Color3.fromRGB(156, 156, 156)
Gui.HelperText.TextSize = 12.000
Gui.HelperText.TextStrokeColor3 = Color3.fromRGB(156, 156, 156)
Gui.HelperText.TextStrokeTransparency = 0.940
Gui.HelperText.TextXAlignment = Enum.TextXAlignment.Left

Gui.Text_3.Name = "Text"
Gui.Text_3.Parent = Gui.Style

Gui.Bar_4.Name = "Bar"
Gui.Bar_4.Parent = Gui.Text_3
Gui.Bar_4.BackgroundColor3 = Color3.fromRGB(182, 182, 182)
Gui.Bar_4.BorderSizePixel = 0
Gui.Bar_4.Position = UDim2.new(0, 0, 1, 0)
Gui.Bar_4.Selectable = true
Gui.Bar_4.Size = UDim2.new(1, 0, 0, 2)

Gui.ErrorText_2.Name = "ErrorText"
Gui.ErrorText_2.Parent = Gui.Text_3
Gui.ErrorText_2.AnchorPoint = Vector2.new(1, 0)
Gui.ErrorText_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.ErrorText_2.BackgroundTransparency = 1.000
Gui.ErrorText_2.BorderSizePixel = 0
Gui.ErrorText_2.Position = UDim2.new(1, 0, 1, 2)
Gui.ErrorText_2.Size = UDim2.new(1, -16, 0, 18)
Gui.ErrorText_2.Visible = false
Gui.ErrorText_2.Font = Enum.Font.Gotham
Gui.ErrorText_2.Text = "Error"
Gui.ErrorText_2.TextColor3 = Color3.fromRGB(255, 33, 33)
Gui.ErrorText_2.TextSize = 12.000
Gui.ErrorText_2.TextStrokeColor3 = Color3.fromRGB(255, 33, 33)
Gui.ErrorText_2.TextStrokeTransparency = 0.940
Gui.ErrorText_2.TextXAlignment = Enum.TextXAlignment.Right

Gui.HelperText_2.Name = "HelperText"
Gui.HelperText_2.Parent = Gui.Text_3
Gui.HelperText_2.AnchorPoint = Vector2.new(1, 0)
Gui.HelperText_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.HelperText_2.BackgroundTransparency = 1.000
Gui.HelperText_2.BorderSizePixel = 0
Gui.HelperText_2.Position = UDim2.new(1, 0, 1, 2)
Gui.HelperText_2.Size = UDim2.new(1, -6, 0, 18)
Gui.HelperText_2.Font = Enum.Font.Gotham
Gui.HelperText_2.Text = ""
Gui.HelperText_2.TextColor3 = Color3.fromRGB(156, 156, 156)
Gui.HelperText_2.TextSize = 12.000
Gui.HelperText_2.TextStrokeColor3 = Color3.fromRGB(156, 156, 156)
Gui.HelperText_2.TextStrokeTransparency = 0.940
Gui.HelperText_2.TextXAlignment = Enum.TextXAlignment.Left

Gui.Outlined.Name = "Outlined"
Gui.Outlined.Parent = Gui.Style

Gui.LBar.Name = "LBar"
Gui.LBar.Parent = Gui.Outlined
Gui.LBar.BackgroundColor3 = Color3.fromRGB(182, 182, 182)
Gui.LBar.BorderSizePixel = 0
Gui.LBar.Position = UDim2.new(0, -7, 0, -1)
Gui.LBar.Selectable = true
Gui.LBar.Size = UDim2.new(0, 2, 1, 2)
Gui.LBar.ZIndex = 2

Gui.RBar.Name = "RBar"
Gui.RBar.Parent = Gui.Outlined
Gui.RBar.AnchorPoint = Vector2.new(1, 0)
Gui.RBar.BackgroundColor3 = Color3.fromRGB(182, 182, 182)
Gui.RBar.BorderSizePixel = 0
Gui.RBar.Position = UDim2.new(1, 7, 0, -1)
Gui.RBar.Selectable = true
Gui.RBar.Size = UDim2.new(0, 2, 1, 2)
Gui.RBar.ZIndex = 2

Gui.TopBarL.Name = "TopBarL"
Gui.TopBarL.Parent = Gui.Outlined
Gui.TopBarL.BackgroundColor3 = Color3.fromRGB(182, 182, 182)
Gui.TopBarL.BorderSizePixel = 0
Gui.TopBarL.Position = UDim2.new(0, -6, 0, -2)
Gui.TopBarL.Selectable = true
Gui.TopBarL.Size = UDim2.new(0, 4, 0, 2)
Gui.TopBarL.ZIndex = 2

Gui.TopBarR.Name = "TopBarR"
Gui.TopBarR.Parent = Gui.Outlined
Gui.TopBarR.AnchorPoint = Vector2.new(1, 0)
Gui.TopBarR.BackgroundColor3 = Color3.fromRGB(182, 182, 182)
Gui.TopBarR.BorderSizePixel = 0
Gui.TopBarR.Position = UDim2.new(1, 6, 0, -2)
Gui.TopBarR.Selectable = true
Gui.TopBarR.Size = UDim2.new(1, 8, 0, 2)
Gui.TopBarR.ZIndex = 2

Gui.Bar_5.Name = "Bar"
Gui.Bar_5.Parent = Gui.Outlined
Gui.Bar_5.BackgroundColor3 = Color3.fromRGB(182, 182, 182)
Gui.Bar_5.BorderSizePixel = 0
Gui.Bar_5.ClipsDescendants = true
Gui.Bar_5.Position = UDim2.new(0, -6, 1, 0)
Gui.Bar_5.Selectable = true
Gui.Bar_5.Size = UDim2.new(1, 12, 0, 2)
Gui.Bar_5.ZIndex = 2

Gui.ErrorText_3.Name = "ErrorText"
Gui.ErrorText_3.Parent = Gui.Outlined
Gui.ErrorText_3.AnchorPoint = Vector2.new(1, 0)
Gui.ErrorText_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.ErrorText_3.BackgroundTransparency = 1.000
Gui.ErrorText_3.BorderSizePixel = 0
Gui.ErrorText_3.Position = UDim2.new(1, 6, 1, 2)
Gui.ErrorText_3.Size = UDim2.new(1, -4, 0, 18)
Gui.ErrorText_3.Visible = false
Gui.ErrorText_3.Font = Enum.Font.Gotham
Gui.ErrorText_3.Text = "Error"
Gui.ErrorText_3.TextColor3 = Color3.fromRGB(255, 33, 33)
Gui.ErrorText_3.TextSize = 12.000
Gui.ErrorText_3.TextStrokeColor3 = Color3.fromRGB(255, 33, 33)
Gui.ErrorText_3.TextStrokeTransparency = 0.940
Gui.ErrorText_3.TextXAlignment = Enum.TextXAlignment.Right

Gui.Padding_2.Name = "Padding"
Gui.Padding_2.Parent = Gui.Outlined
Gui.Padding_2.PaddingLeft = UDim.new(0, 6)
Gui.Padding_2.PaddingRight = UDim.new(0, 6)

Gui.HelperText_3.Name = "HelperText"
Gui.HelperText_3.Parent = Gui.Outlined
Gui.HelperText_3.AnchorPoint = Vector2.new(1, 0)
Gui.HelperText_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.HelperText_3.BackgroundTransparency = 1.000
Gui.HelperText_3.BorderSizePixel = 0
Gui.HelperText_3.Position = UDim2.new(1, 0, 1, 2)
Gui.HelperText_3.Size = UDim2.new(1, 0, 0, 18)
Gui.HelperText_3.Font = Enum.Font.Gotham
Gui.HelperText_3.Text = ""
Gui.HelperText_3.TextColor3 = Color3.fromRGB(156, 156, 156)
Gui.HelperText_3.TextSize = 12.000
Gui.HelperText_3.TextStrokeColor3 = Color3.fromRGB(156, 156, 156)
Gui.HelperText_3.TextStrokeTransparency = 0.940
Gui.HelperText_3.TextXAlignment = Enum.TextXAlignment.Left

Gui.ErrorEffect.Name = "ErrorEffect"
Gui.ErrorEffect.Parent = Gui.Class_TextField

Gui.Class_ToolTip.Name = "Class_ToolTip"
Gui.Class_ToolTip.Parent = Gui.resource

Gui.ToolTip.Name = "ToolTip"
Gui.ToolTip.Parent = Gui.Class_ToolTip
Gui.ToolTip.AnchorPoint = Vector2.new(0.5, 0)
Gui.ToolTip.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.ToolTip.BackgroundTransparency = 1.000
Gui.ToolTip.Position = UDim2.new(0.5, 0, 1, 6)
Gui.ToolTip.Size = UDim2.new(0, 80, 0, 28)
Gui.ToolTip.ZIndex = 100000
Gui.ToolTip.Image = "rbxassetid://1934624205"
Gui.ToolTip.ImageColor3 = Color3.fromRGB(45, 45, 45)
Gui.ToolTip.ImageTransparency = 1.000
Gui.ToolTip.ScaleType = Enum.ScaleType.Slice
Gui.ToolTip.SliceCenter = Rect.new(4, 4, 252, 252)

Gui.TextLabel_3.Parent = Gui.ToolTip
Gui.TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.TextLabel_3.BackgroundTransparency = 1.000
Gui.TextLabel_3.Size = UDim2.new(1, 0, 1, 0)
Gui.TextLabel_3.ZIndex = 100000
Gui.TextLabel_3.Font = Enum.Font.SourceSans
Gui.TextLabel_3.TextColor3 = Color3.fromRGB(255, 255, 255)
Gui.TextLabel_3.TextSize = 14.000
Gui.TextLabel_3.TextTransparency = 1.000

Gui.Class_TreeView.Name = "Class_TreeView"
Gui.Class_TreeView.Parent = Gui.resource

Gui.TreeView.Name = "TreeView"
Gui.TreeView.Parent = Gui.Class_TreeView
Gui.TreeView.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.TreeView.BackgroundTransparency = 1.000
Gui.TreeView.BorderSizePixel = 0
Gui.TreeView.ClipsDescendants = true
Gui.TreeView.Size = UDim2.new(1, 0, 0, 22)

Gui.Lable.Name = "Lable"
Gui.Lable.Parent = Gui.TreeView
Gui.Lable.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.Lable.BackgroundTransparency = 1.000
Gui.Lable.BorderSizePixel = 0
Gui.Lable.Size = UDim2.new(1, 0, 0, 22)

Gui.TextLabel_4.Parent = Gui.Lable
Gui.TextLabel_4.AnchorPoint = Vector2.new(1, 0)
Gui.TextLabel_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.TextLabel_4.BackgroundTransparency = 1.000
Gui.TextLabel_4.BorderSizePixel = 0
Gui.TextLabel_4.Position = UDim2.new(1, 0, 0, 0)
Gui.TextLabel_4.Size = UDim2.new(1, -26, 0, 22)
Gui.TextLabel_4.Font = Enum.Font.SourceSans
Gui.TextLabel_4.TextColor3 = Color3.fromRGB(255, 255, 255)
Gui.TextLabel_4.TextSize = 14.000
Gui.TextLabel_4.TextXAlignment = Enum.TextXAlignment.Left

Gui.IconOpen.Name = "IconOpen"
Gui.IconOpen.Parent = Gui.Lable
Gui.IconOpen.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.IconOpen.BackgroundTransparency = 1.000
Gui.IconOpen.BorderSizePixel = 0
Gui.IconOpen.Rotation = -90.000
Gui.IconOpen.Size = UDim2.new(1, 0, 1, 0)
Gui.IconOpen.SizeConstraint = Enum.SizeConstraint.RelativeYY
Gui.IconOpen.Image = "rbxassetid://2777862738"

Gui.Item.Name = "Item"
Gui.Item.Parent = Gui.TreeView
Gui.Item.AnchorPoint = Vector2.new(1, 0)
Gui.Item.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.Item.BackgroundTransparency = 1.000
Gui.Item.BorderSizePixel = 0
Gui.Item.Position = UDim2.new(1, 0, 0, 22)
Gui.Item.Size = UDim2.new(1, -18, 0, 0)

Gui.UIListLayout_6.Parent = Gui.Item
Gui.UIListLayout_6.SortOrder = Enum.SortOrder.LayoutOrder

Gui.RoundShadow.Name = "RoundShadow"
Gui.RoundShadow.Parent = Gui.resource
Gui.RoundShadow.AnchorPoint = Vector2.new(0.5, 0.5)
Gui.RoundShadow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.RoundShadow.BackgroundTransparency = 1.000
Gui.RoundShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
Gui.RoundShadow.Size = UDim2.new(1, 60, 1, 60)
Gui.RoundShadow.Image = "rbxassetid://1113384364"
Gui.RoundShadow.ImageTransparency = 0.500
Gui.RoundShadow.ScaleType = Enum.ScaleType.Slice
Gui.RoundShadow.SliceCenter = Rect.new(50, 50, 50, 50)

return Gui.resource