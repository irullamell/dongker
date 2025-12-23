-- Create GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ProductFakerGui"
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = game:GetService("CoreGui")

-- Main Container (Compact Size)
local MainContainer = Instance.new("Frame")
MainContainer.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
MainContainer.BorderSizePixel = 0
MainContainer.Position = UDim2.new(1, -320, 0, 20) -- Top right corner
MainContainer.Size = UDim2.new(0, 300, 0, 500)
MainContainer.Parent = ScreenGui

local ContainerCorner = Instance.new("UICorner")
ContainerCorner.CornerRadius = UDim.new(0, 10)
ContainerCorner.Parent = MainContainer

local ContainerStroke = Instance.new("UIStroke")
ContainerStroke.Color = Color3.fromRGB(60, 60, 60)
ContainerStroke.Thickness = 1.5
ContainerStroke.Parent = MainContainer

-- Add Shadow Effect
local Shadow = Instance.new("ImageLabel")
Shadow.Name = "Shadow"
Shadow.BackgroundTransparency = 1
Shadow.Position = UDim2.new(0, -15, 0, -15)
Shadow.Size = UDim2.new(1, 30, 1, 30)
Shadow.ZIndex = 0
Shadow.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
Shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
Shadow.ImageTransparency = 0.5
Shadow.ScaleType = Enum.ScaleType.Slice
Shadow.SliceCenter = Rect.new(10, 10, 118, 118)
Shadow.Parent = MainContainer

-- Title Bar
local TitleBar = Instance.new("Frame")
TitleBar.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
TitleBar.BorderSizePixel = 0
TitleBar.Size = UDim2.new(1, 0, 0, 45)
TitleBar.Parent = MainContainer

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 10)
TitleCorner.Parent = TitleBar

-- Title Text
local TitleLabel = Instance.new("TextLabel")
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.Text = "Product Faker"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextSize = 16
TitleLabel.BackgroundTransparency = 1
TitleLabel.Position = UDim2.new(0, 15, 0, 0)
TitleLabel.Size = UDim2.new(0, 150, 1, 0)
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Parent = TitleBar

-- Close Button
local CloseButton = Instance.new("TextButton")
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Text = "×"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 20
CloseButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
CloseButton.BorderSizePixel = 0
CloseButton.Position = UDim2.new(1, -35, 0, 7.5)
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Parent = TitleBar

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 6)
CloseCorner.Parent = CloseButton

-- Minimize Button
local MinButton = Instance.new("TextButton")
MinButton.Font = Enum.Font.GothamBold
MinButton.Text = "−"
MinButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinButton.TextSize = 16
MinButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
MinButton.BorderSizePixel = 0
MinButton.Position = UDim2.new(1, -70, 0, 7.5)
MinButton.Size = UDim2.new(0, 30, 0, 30)
MinButton.Parent = TitleBar

local MinCorner = Instance.new("UICorner")
MinCorner.CornerRadius = UDim.new(0, 6)
MinCorner.Parent = MinButton

-- Content Frame
local ContentFrame = Instance.new("Frame")
ContentFrame.BackgroundTransparency = 1
ContentFrame.Position = UDim2.new(0, 0, 0, 45)
ContentFrame.Size = UDim2.new(1, 0, 1, -45)
ContentFrame.Parent = MainContainer

-- Info Bar
local InfoBar = Instance.new("Frame")
InfoBar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
InfoBar.BorderSizePixel = 0
InfoBar.Position = UDim2.new(0, 10, 0, 10)
InfoBar.Size = UDim2.new(1, -20, 0, 40)
InfoBar.Parent = ContentFrame

local InfoCorner = Instance.new("UICorner")
InfoCorner.CornerRadius = UDim.new(0, 8)
InfoCorner.Parent = InfoBar

local InfoLabel = Instance.new("TextLabel")
InfoLabel.Font = Enum.Font.Gotham
InfoLabel.Text = "Loading products..."
InfoLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
InfoLabel.TextSize = 13
InfoLabel.BackgroundTransparency = 1
InfoLabel.Size = UDim2.new(1, 0, 1, 0)
InfoLabel.Parent = InfoBar

-- Global Buy Button
local GlobalBuyButton = Instance.new("TextButton")
GlobalBuyButton.Font = Enum.Font.GothamBold
GlobalBuyButton.Text = "Buy All Products"
GlobalBuyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
GlobalBuyButton.TextSize = 13
GlobalBuyButton.BackgroundColor3 = Color3.fromRGB(220, 60, 60)
GlobalBuyButton.BorderSizePixel = 0
GlobalBuyButton.Position = UDim2.new(0, 10, 0, 60)
GlobalBuyButton.Size = UDim2.new(1, -20, 0, 35)
GlobalBuyButton.Parent = ContentFrame

local GlobalCorner = Instance.new("UICorner")
GlobalCorner.CornerRadius = UDim.new(0, 8)
GlobalCorner.Parent = GlobalBuyButton

-- Scrolling Frame
local ScrollingFrame = Instance.new("ScrollingFrame")
ScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
ScrollingFrame.ScrollBarThickness = 4
ScrollingFrame.Active = true
ScrollingFrame.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
ScrollingFrame.BorderSizePixel = 0
ScrollingFrame.Position = UDim2.new(0, 10, 0, 105)
ScrollingFrame.Size = UDim2.new(1, -20, 1, -115)
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(100, 100, 100)
ScrollingFrame.Parent = ContentFrame

local ScrollCorner = Instance.new("UICorner")
ScrollCorner.CornerRadius = UDim.new(0, 8)
ScrollCorner.Parent = ScrollingFrame

local ListLayout = Instance.new("UIListLayout")
ListLayout.SortOrder = Enum.SortOrder.LayoutOrder
ListLayout.Padding = UDim.new(0, 8)
ListLayout.Parent = ScrollingFrame

local ListPadding = Instance.new("UIPadding")
ListPadding.PaddingTop = UDim.new(0, 8)
ListPadding.PaddingBottom = UDim.new(0, 8)
ListPadding.PaddingLeft = UDim.new(0, 8)
ListPadding.PaddingRight = UDim.new(0, 8)
ListPadding.Parent = ScrollingFrame

-- Product Item Template
local ProductTemplate = Instance.new("Frame")
ProductTemplate.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
ProductTemplate.BorderSizePixel = 0
ProductTemplate.Size = UDim2.new(1, -16, 0, 130)
ProductTemplate.Visible = false
ProductTemplate.Name = "ProductTemplate"
ProductTemplate.Parent = ScrollingFrame

local ProductCorner = Instance.new("UICorner")
ProductCorner.CornerRadius = UDim.new(0, 8)
ProductCorner.Parent = ProductTemplate

-- Product Name
local NameLabel = Instance.new("TextLabel")
NameLabel.Font = Enum.Font.GothamBold
NameLabel.Text = "Product Name"
NameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
NameLabel.TextSize = 13
NameLabel.TextXAlignment = Enum.TextXAlignment.Left
NameLabel.TextTruncate = Enum.TextTruncate.AtEnd
NameLabel.BackgroundTransparency = 1
NameLabel.Position = UDim2.new(0, 10, 0, 8)
NameLabel.Size = UDim2.new(1, -20, 0, 18)
NameLabel.Name = "NameLabel"
NameLabel.Parent = ProductTemplate

-- Product Info Container
local InfoContainer = Instance.new("Frame")
InfoContainer.BackgroundTransparency = 1
InfoContainer.Position = UDim2.new(0, 10, 0, 30)
InfoContainer.Size = UDim2.new(1, -20, 0, 18)
InfoContainer.Parent = ProductTemplate

local IDLabel = Instance.new("TextLabel")
IDLabel.Font = Enum.Font.Gotham
IDLabel.Text = "ID: 000000"
IDLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
IDLabel.TextSize = 11
IDLabel.TextXAlignment = Enum.TextXAlignment.Left
IDLabel.BackgroundTransparency = 1
IDLabel.Size = UDim2.new(0.5, 0, 1, 0)
IDLabel.Name = "IDLabel"
IDLabel.Parent = InfoContainer

local PriceLabel = Instance.new("TextLabel")
PriceLabel.Font = Enum.Font.GothamBold
PriceLabel.Text = "💎 0 R$"
PriceLabel.TextColor3 = Color3.fromRGB(100, 200, 255)
PriceLabel.TextSize = 11
PriceLabel.TextXAlignment = Enum.TextXAlignment.Right
PriceLabel.BackgroundTransparency = 1
PriceLabel.Position = UDim2.new(0.5, 0, 0, 0)
PriceLabel.Size = UDim2.new(0.5, 0, 1, 0)
PriceLabel.Name = "PriceLabel"
PriceLabel.Parent = InfoContainer

-- Button Container
local ButtonContainer = Instance.new("Frame")
ButtonContainer.BackgroundTransparency = 1
ButtonContainer.Position = UDim2.new(0, 10, 0, 55)
ButtonContainer.Size = UDim2.new(1, -20, 0, 28)
ButtonContainer.Parent = ProductTemplate

-- Copy ID Button
local CopyButton = Instance.new("TextButton")
CopyButton.Font = Enum.Font.GothamBold
CopyButton.Text = "📋"
CopyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CopyButton.TextSize = 14
CopyButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
CopyButton.BorderSizePixel = 0
CopyButton.Size = UDim2.new(0, 28, 1, 0)
CopyButton.Name = "CopyButton"
CopyButton.Parent = ButtonContainer

local CopyCorner = Instance.new("UICorner")
CopyCorner.CornerRadius = UDim.new(0, 6)
CopyCorner.Parent = CopyButton

-- Auto Buy Button
local AutoBuyButton = Instance.new("TextButton")
AutoBuyButton.Font = Enum.Font.GothamBold
AutoBuyButton.Text = "Auto"
AutoBuyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoBuyButton.TextSize = 11
AutoBuyButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
AutoBuyButton.BorderSizePixel = 0
AutoBuyButton.Position = UDim2.new(0, 36, 0, 0)
AutoBuyButton.Size = UDim2.new(0.3, -18, 1, 0)
AutoBuyButton.Name = "AutoBuyButton"
AutoBuyButton.Parent = ButtonContainer

local AutoCorner = Instance.new("UICorner")
AutoCorner.CornerRadius = UDim.new(0, 6)
AutoCorner.Parent = AutoBuyButton

-- Buy Button
local BuyButton = Instance.new("TextButton")
BuyButton.Font = Enum.Font.GothamBold
BuyButton.Text = "Buy Now"
BuyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
BuyButton.TextSize = 11
BuyButton.BackgroundColor3 = Color3.fromRGB(220, 60, 60)
BuyButton.BorderSizePixel = 0
BuyButton.Position = UDim2.new(0.3, 24, 0, 0)
BuyButton.Size = UDim2.new(0.7, -24, 1, 0)
BuyButton.Name = "BuyButton"
BuyButton.Parent = ButtonContainer

local BuyCorner = Instance.new("UICorner")
BuyCorner.CornerRadius = UDim.new(0, 6)
BuyCorner.Parent = BuyButton

-- Repeat Purchase Container
local RepeatContainer = Instance.new("Frame")
RepeatContainer.BackgroundTransparency = 1
RepeatContainer.Position = UDim2.new(0, 10, 0, 91)
RepeatContainer.Size = UDim2.new(1, -20, 0, 28)
RepeatContainer.Parent = ProductTemplate

-- Repeat Label
local RepeatLabel = Instance.new("TextLabel")
RepeatLabel.Font = Enum.Font.Gotham
RepeatLabel.Text = "Repeat:"
RepeatLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
RepeatLabel.TextSize = 11
RepeatLabel.TextXAlignment = Enum.TextXAlignment.Left
RepeatLabel.BackgroundTransparency = 1
RepeatLabel.Size = UDim2.new(0, 50, 1, 0)
RepeatLabel.Parent = RepeatContainer

-- Repeat Input Box
local RepeatInput = Instance.new("TextBox")
RepeatInput.Font = Enum.Font.GothamBold
RepeatInput.Text = "10"
RepeatInput.PlaceholderText = "Times"
RepeatInput.TextColor3 = Color3.fromRGB(255, 255, 255)
RepeatInput.PlaceholderColor3 = Color3.fromRGB(120, 120, 120)
RepeatInput.TextSize = 11
RepeatInput.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
RepeatInput.BorderSizePixel = 0
RepeatInput.Position = UDim2.new(0, 55, 0, 0)
RepeatInput.Size = UDim2.new(0, 60, 1, 0)
RepeatInput.TextXAlignment = Enum.TextXAlignment.Center
RepeatInput.ClearTextOnFocus = false
RepeatInput.Name = "RepeatInput"
RepeatInput.Parent = RepeatContainer

local InputCorner = Instance.new("UICorner")
InputCorner.CornerRadius = UDim.new(0, 6)
InputCorner.Parent = RepeatInput

-- Repeat Buy Button
local RepeatButton = Instance.new("TextButton")
RepeatButton.Font = Enum.Font.GothamBold
RepeatButton.Text = "🔁 Start Repeat"
RepeatButton.TextColor3 = Color3.fromRGB(255, 255, 255)
RepeatButton.TextSize = 11
RepeatButton.BackgroundColor3 = Color3.fromRGB(100, 60, 200)
RepeatButton.BorderSizePixel = 0
RepeatButton.Position = UDim2.new(0, 123, 0, 0)
RepeatButton.Size = UDim2.new(1, -123, 1, 0)
RepeatButton.Name = "RepeatButton"
RepeatButton.Parent = RepeatContainer

local RepeatCorner = Instance.new("UICorner")
RepeatCorner.CornerRadius = UDim.new(0, 6)
RepeatCorner.Parent = RepeatButton

-- Services
local MarketplaceService = game:GetService("MarketplaceService")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Load Developer Products
local success, developerProducts = pcall(function()
	return MarketplaceService:GetDeveloperProductsAsync():GetCurrentPage()
end)

if not success then developerProducts = {} end

-- Update Info
InfoLabel.Text = #developerProducts .. " products available"
GlobalBuyButton.Text = "Buy All Products (" .. #developerProducts .. ")"

-- Button Hover Effect Function
local function addButtonHover(button, hoverColor)
	local originalColor = button.BackgroundColor3
	button.MouseEnter:Connect(function()
		TweenService:Create(button, TweenInfo.new(0.15), {BackgroundColor3 = hoverColor}):Play()
	end)
	button.MouseLeave:Connect(function()
		TweenService:Create(button, TweenInfo.new(0.15), {BackgroundColor3 = originalColor}):Play()
	end)
end

-- Add hover to global buttons
addButtonHover(CloseButton, Color3.fromRGB(240, 70, 70))
addButtonHover(MinButton, Color3.fromRGB(90, 90, 90))
addButtonHover(GlobalBuyButton, Color3.fromRGB(240, 80, 80))

-- Create Product Items
for _, developerProduct in pairs(developerProducts) do
	local newItem = ProductTemplate:Clone()
	newItem.Parent = ScrollingFrame
	newItem.Visible = true
	
	newItem.NameLabel.Text = developerProduct.Name or "Unknown Product"
	newItem.IDLabel.Text = "ID: " .. (developerProduct.ProductId or "N/A")
	newItem.PriceLabel.Text = "💎 " .. (developerProduct.PriceInRobux or "0") .. " R$"
	
	-- Add button hovers
	addButtonHover(newItem.CopyButton, Color3.fromRGB(80, 80, 80))
	addButtonHover(newItem.AutoBuyButton, Color3.fromRGB(80, 80, 80))
	addButtonHover(newItem.BuyButton, Color3.fromRGB(240, 80, 80))
	addButtonHover(newItem.RepeatButton, Color3.fromRGB(120, 80, 220))
	
	-- Only allow numbers in repeat input
	newItem.RepeatInput.FocusLost:Connect(function()
		local value = tonumber(newItem.RepeatInput.Text)
		if not value or value < 1 then
			newItem.RepeatInput.Text = "1"
		elseif value > 1000 then
			newItem.RepeatInput.Text = "1000"
		else
			newItem.RepeatInput.Text = tostring(math.floor(value))
		end
	end)
	
	-- Copy ID Function
	newItem.CopyButton.MouseButton1Click:Connect(function()
		setclipboard(tostring(developerProduct.ProductId))
		local oldText = newItem.CopyButton.Text
		newItem.CopyButton.Text = "✓"
		newItem.CopyButton.BackgroundColor3 = Color3.fromRGB(50, 200, 80)
		task.wait(1)
		newItem.CopyButton.Text = oldText
		newItem.CopyButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
	end)
	
	-- Buy Function
	newItem.BuyButton.MouseButton1Click:Connect(function()
		local oldText = newItem.BuyButton.Text
		newItem.BuyButton.Text = "Buying..."
		MarketplaceService:SignalPromptProductPurchaseFinished(LocalPlayer.UserId, developerProduct.ProductId, true)
		task.wait(1)
		newItem.BuyButton.Text = oldText
	end)
	
	-- Auto Buy Toggle
	local autoActive = false
	newItem.AutoBuyButton.MouseButton1Click:Connect(function()
		autoActive = not autoActive
		
		if autoActive then
			newItem.AutoBuyButton.Text = "ON"
			newItem.AutoBuyButton.BackgroundColor3 = Color3.fromRGB(50, 200, 80)
			
			task.spawn(function()
				while autoActive and newItem.Parent do
					MarketplaceService:SignalPromptProductPurchaseFinished(LocalPlayer.UserId, developerProduct.ProductId, true)
					task.wait(0.1)
				end
			end)
		else
			newItem.AutoBuyButton.Text = "Auto"
			newItem.AutoBuyButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
		end
	end)
	
	-- Repeat Purchase
	local repeatActive = false
	local repeatCount = 0
	
	newItem.RepeatButton.MouseButton1Click:Connect(function()
		repeatActive = not repeatActive
		
		if repeatActive then
			local timesToRepeat = tonumber(newItem.RepeatInput.Text) or 10
			repeatCount = 0
			
			newItem.RepeatButton.Text = "⏸️ Stop (0/" .. timesToRepeat .. ")"
			newItem.RepeatButton.BackgroundColor3 = Color3.fromRGB(200, 80, 60)
			newItem.RepeatInput.TextEditable = false
			
			task.spawn(function()
				while repeatActive and repeatCount < timesToRepeat and newItem.Parent do
					MarketplaceService:SignalPromptProductPurchaseFinished(LocalPlayer.UserId, developerProduct.ProductId, true)
					repeatCount = repeatCount + 1
					newItem.RepeatButton.Text = "⏸️ Stop (" .. repeatCount .. "/" .. timesToRepeat .. ")"
					task.wait(0.05)
				end
				
				if repeatCount >= timesToRepeat then
					repeatActive = false
					newItem.RepeatButton.Text = "✓ Completed!"
					newItem.RepeatButton.BackgroundColor3 = Color3.fromRGB(50, 200, 80)
					task.wait(2)
				end
				
				newItem.RepeatButton.Text = "🔁 Start Repeat"
				newItem.RepeatButton.BackgroundColor3 = Color3.fromRGB(100, 60, 200)
				newItem.RepeatInput.TextEditable = true
				repeatActive = false
			end)
		else
			newItem.RepeatButton.Text = "🔁 Start Repeat"
			newItem.RepeatButton.BackgroundColor3 = Color3.fromRGB(100, 60, 200)
			newItem.RepeatInput.TextEditable = true
		end
	end)
end

-- Global Buy All
GlobalBuyButton.MouseButton1Click:Connect(function()
	local oldText = GlobalBuyButton.Text
	GlobalBuyButton.Text = "Processing..."
	
	for _, developerProduct in pairs(developerProducts) do
		MarketplaceService:SignalPromptProductPurchaseFinished(LocalPlayer.UserId, developerProduct.ProductId, true)
		task.wait(0.01)
	end
	
	GlobalBuyButton.Text = "Done! ✓"
	task.wait(2)
	GlobalBuyButton.Text = oldText
end)

-- Minimize Function
MinButton.MouseButton1Click:Connect(function()
	ContentFrame.Visible = not ContentFrame.Visible
	MinButton.Text = ContentFrame.Visible and "−" or "+"
	
	if ContentFrame.Visible then
		MainContainer:TweenSize(UDim2.new(0, 300, 0, 500), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true)
	else
		MainContainer:TweenSize(UDim2.new(0, 300, 0, 45), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true)
	end
end)

-- Close Function
CloseButton.MouseButton1Click:Connect(function()
	TweenService:Create(MainContainer, TweenInfo.new(0.3), {
		Size = UDim2.new(0, 0, 0, 0),
		Position = UDim2.new(1, 0, 0, 20)
	}):Play()
	task.wait(0.3)
	ScreenGui:Destroy()
end)

-- Dragging
local dragging = false
local dragInput, mousePos, framePos

TitleBar.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		mousePos = input.Position
		framePos = MainContainer.Position
		
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

TitleBar.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement then
		dragInput = input
	end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		local delta = input.Position - mousePos
		MainContainer.Position = UDim2.new(
			framePos.X.Scale,
			framePos.X.Offset + delta.X,
			framePos.Y.Scale,
			framePos.Y.Offset + delta.Y
		)
	end
end)
