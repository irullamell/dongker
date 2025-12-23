-- Create GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ProductFakerPro"
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game:GetService("CoreGui")

-- Main Container
local MainContainer = Instance.new("Frame")
MainContainer.Name = "MainContainer"
MainContainer.BackgroundTransparency = 1
MainContainer.Position = UDim2.new(0.35, 0, 0.2, 0)
MainContainer.Size = UDim2.new(0, 300, 0, 450)
MainContainer.Parent = ScreenGui

-- Title Bar
local TitleBar = Instance.new("TextButton")
TitleBar.Font = Enum.Font.GothamBold
TitleBar.Text = "  💰 Product Faker Pro"
TitleBar.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleBar.TextSize = 12
TitleBar.TextXAlignment = Enum.TextXAlignment.Left
TitleBar.AutoButtonColor = false
TitleBar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
TitleBar.BorderColor3 = Color3.fromRGB(100, 100, 100)
TitleBar.BorderSizePixel = 1
TitleBar.Size = UDim2.new(1, 0, 0, 26)
TitleBar.Parent = MainContainer

-- Window Buttons
local MinBtn = Instance.new("TextButton")
MinBtn.Font = Enum.Font.GothamBold
MinBtn.Text = "_"
MinBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MinBtn.TextSize = 12
MinBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
MinBtn.BorderSizePixel = 0
MinBtn.Position = UDim2.new(1, -52, 0, 2)
MinBtn.Size = UDim2.new(0, 22, 0, 22)
MinBtn.Parent = TitleBar

local CloseBtn = Instance.new("TextButton")
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.TextSize = 12
CloseBtn.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
CloseBtn.BorderSizePixel = 0
CloseBtn.Position = UDim2.new(1, -26, 0, 2)
CloseBtn.Size = UDim2.new(0, 22, 0, 22)
CloseBtn.Parent = TitleBar

-- Main Frame
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
MainFrame.BorderColor3 = Color3.fromRGB(80, 80, 80)
MainFrame.BorderSizePixel = 1
MainFrame.Position = UDim2.new(0, 0, 0, 26)
MainFrame.Size = UDim2.new(1, 0, 1, -26)
MainFrame.ClipsDescendants = true
MainFrame.Parent = MainContainer

-- ========== STATS BAR ==========
local StatsBar = Instance.new("Frame")
StatsBar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
StatsBar.BorderSizePixel = 0
StatsBar.Position = UDim2.new(0, 4, 0, 4)
StatsBar.Size = UDim2.new(1, -8, 0, 22)
StatsBar.Parent = MainFrame

local SpeedLabel = Instance.new("TextLabel")
SpeedLabel.Font = Enum.Font.GothamBold
SpeedLabel.Text = "⚡ 0/s"
SpeedLabel.TextColor3 = Color3.fromRGB(255, 200, 50)
SpeedLabel.TextSize = 11
SpeedLabel.BackgroundTransparency = 1
SpeedLabel.Position = UDim2.new(0, 5, 0, 0)
SpeedLabel.Size = UDim2.new(0.25, 0, 1, 0)
SpeedLabel.TextXAlignment = Enum.TextXAlignment.Left
SpeedLabel.Parent = StatsBar

local TotalLabel = Instance.new("TextLabel")
TotalLabel.Font = Enum.Font.Gotham
TotalLabel.Text = "Total: 0"
TotalLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
TotalLabel.TextSize = 10
TotalLabel.BackgroundTransparency = 1
TotalLabel.Position = UDim2.new(0.28, 0, 0, 0)
TotalLabel.Size = UDim2.new(0.25, 0, 1, 0)
TotalLabel.TextXAlignment = Enum.TextXAlignment.Left
TotalLabel.Parent = StatsBar

local ThreadLabel = Instance.new("TextLabel")
ThreadLabel.Font = Enum.Font.Gotham
ThreadLabel.Text = "Threads: 0"
ThreadLabel.TextColor3 = Color3.fromRGB(255, 100, 255)
ThreadLabel.TextSize = 10
ThreadLabel.BackgroundTransparency = 1
ProductLabel.Position = UDim2.new(0.55, 0, 0, 0)
ThreadLabel.Size = UDim2.new(0.25, 0, 1, 0)
ThreadLabel.TextXAlignment = Enum.TextXAlignment.Left
ThreadLabel.Parent = StatsBar

local ProductCountLabel = Instance.new("TextLabel")
ProductCountLabel.Font = Enum.Font.Gotham
ProductCountLabel.Text = "📦 0"
ProductCountLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
ProductCountLabel.TextSize = 10
ProductCountLabel.BackgroundTransparency = 1
ProductCountLabel.Position = UDim2.new(0.78, 0, 0, 0)
ProductCountLabel.Size = UDim2.new(0.2, 0, 1, 0)
ProductCountLabel.TextXAlignment = Enum.TextXAlignment.Right
ProductCountLabel.Parent = StatsBar

-- ========== COMBO PRESETS (EASY MODE) ==========
local ComboSection = Instance.new("Frame")
ComboSection.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
ComboSection.BorderColor3 = Color3.fromRGB(60, 60, 60)
ComboSection.BorderSizePixel = 1
ComboSection.Position = UDim2.new(0, 4, 0, 30)
ComboSection.Size = UDim2.new(1, -8, 0, 70)
ComboSection.Parent = MainFrame

local ComboTitle = Instance.new("TextLabel")
ComboTitle.Font = Enum.Font.GothamBold
ComboTitle.Text = "🎮 COMBO PRESETS (1-Click)"
ComboTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
ComboTitle.TextSize = 10
ComboTitle.BackgroundTransparency = 1
ComboTitle.Position = UDim2.new(0, 5, 0, 2)
ComboTitle.Size = UDim2.new(1, -10, 0, 14)
ComboTitle.TextXAlignment = Enum.TextXAlignment.Left
ComboTitle.Parent = ComboSection

-- Combo Buttons Row 1
local NormalCombo = Instance.new("TextButton")
NormalCombo.Font = Enum.Font.GothamBold
NormalCombo.Text = "🟢 Normal"
NormalCombo.TextColor3 = Color3.fromRGB(255, 255, 255)
NormalCombo.TextSize = 9
NormalCombo.BackgroundColor3 = Color3.fromRGB(50, 150, 50)
NormalCombo.BorderSizePixel = 0
NormalCombo.Position = UDim2.new(0, 4, 0, 18)
NormalCombo.Size = UDim2.new(0.32, -3, 0, 22)
NormalCombo.Parent = ComboSection

local FastCombo = Instance.new("TextButton")
FastCombo.Font = Enum.Font.GothamBold
FastCombo.Text = "🟡 Fast"
FastCombo.TextColor3 = Color3.fromRGB(255, 255, 255)
FastCombo.TextSize = 9
FastCombo.BackgroundColor3 = Color3.fromRGB(200, 150, 50)
FastCombo.BorderSizePixel = 0
FastCombo.Position = UDim2.new(0.34, 0, 0, 18)
FastCombo.Size = UDim2.new(0.32, -2, 0, 22)
FastCombo.Parent = ComboSection

local UltraCombo = Instance.new("TextButton")
UltraCombo.Font = Enum.Font.GothamBold
UltraCombo.Text = "🔴 Ultra"
UltraCombo.TextColor3 = Color3.fromRGB(255, 255, 255)
UltraCombo.TextSize = 9
UltraCombo.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
UltraCombo.BorderSizePixel = 0
UltraCombo.Position = UDim2.new(0.66, 2, 0, 18)
UltraCombo.Size = UDim2.new(0.32, -4, 0, 22)
UltraCombo.Parent = ComboSection

-- Combo Buttons Row 2
local MaxCombo = Instance.new("TextButton")
MaxCombo.Font = Enum.Font.GothamBold
MaxCombo.Text = "💥 MAX POWER"
MaxCombo.TextColor3 = Color3.fromRGB(255, 255, 255)
MaxCombo.TextSize = 9
MaxCombo.BackgroundColor3 = Color3.fromRGB(255, 100, 0)
MaxCombo.BorderSizePixel = 0
MaxCombo.Position = UDim2.new(0, 4, 0, 44)
MaxCombo.Size = UDim2.new(0.48, -3, 0, 22)
MaxCombo.Parent = ComboSection

local StopAllBtn = Instance.new("TextButton")
StopAllBtn.Font = Enum.Font.GothamBold
StopAllBtn.Text = "🛑 STOP ALL"
StopAllBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
StopAllBtn.TextSize = 9
StopAllBtn.BackgroundColor3 = Color3.fromRGB(100, 40, 40)
StopAllBtn.BorderSizePixel = 0
StopAllBtn.Position = UDim2.new(0.5, 1, 0, 44)
StopAllBtn.Size = UDim2.new(0.48, -3, 0, 22)
StopAllBtn.Parent = ComboSection

-- ========== MANUAL CONTROLS ==========
local ControlSection = Instance.new("Frame")
ControlSection.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
ControlSection.BorderColor3 = Color3.fromRGB(60, 60, 60)
ControlSection.BorderSizePixel = 1
ControlSection.Position = UDim2.new(0, 4, 0, 104)
ControlSection.Size = UDim2.new(1, -8, 0, 50)
ControlSection.Parent = MainFrame

local ControlTitle = Instance.new("TextLabel")
ControlTitle.Font = Enum.Font.GothamBold
ControlTitle.Text = "⚙️ MANUAL CONTROLS"
ControlTitle.TextColor3 = Color3.fromRGB(200, 200, 200)
ControlTitle.TextSize = 9
ControlTitle.BackgroundTransparency = 1
ControlTitle.Position = UDim2.new(0, 5, 0, 2)
ControlTitle.Size = UDim2.new(0.5, 0, 0, 12)
ControlTitle.TextXAlignment = Enum.TextXAlignment.Left
ControlTitle.Parent = ControlSection

-- Thread Input
local ThreadInput = Instance.new("TextBox")
ThreadInput.Font = Enum.Font.GothamBold
ThreadInput.Text = "10"
ThreadInput.PlaceholderText = "10"
ThreadInput.TextColor3 = Color3.fromRGB(255, 255, 255)
ThreadInput.TextSize = 10
ThreadInput.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ThreadInput.BorderColor3 = Color3.fromRGB(100, 100, 100)
ThreadInput.BorderSizePixel = 1
ThreadInput.Position = UDim2.new(0.7, 0, 0, 1)
ThreadInput.Size = UDim2.new(0, 35, 0, 14)
ThreadInput.Parent = ControlSection

local ThreadInputLabel = Instance.new("TextLabel")
ThreadInputLabel.Font = Enum.Font.Gotham
ThreadInputLabel.Text = "Threads"
ThreadInputLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
ThreadInputLabel.TextSize = 8
ThreadInputLabel.BackgroundTransparency = 1
ThreadInputLabel.Position = UDim2.new(0.7, 38, 0, 1)
ThreadInputLabel.Size = UDim2.new(0, 50, 0, 14)
ThreadInputLabel.TextXAlignment = Enum.TextXAlignment.Left
ThreadInputLabel.Parent = ControlSection

-- Toggle Buttons Row
local LoopToggle = Instance.new("TextButton")
LoopToggle.Font = Enum.Font.GothamBold
LoopToggle.Text = "Loop"
LoopToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
LoopToggle.TextSize = 9
LoopToggle.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
LoopToggle.BorderSizePixel = 0
LoopToggle.Position = UDim2.new(0, 4, 0, 17)
LoopToggle.Size = UDim2.new(0.24, -2, 0, 28)
LoopToggle.Parent = ControlSection

local NoCDToggle = Instance.new("TextButton")
NoCDToggle.Font = Enum.Font.GothamBold
NoCDToggle.Text = "No CD"
NoCDToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
NoCDToggle.TextSize = 9
NoCDToggle.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
NoCDToggle.BorderSizePixel = 0
NoCDToggle.Position = UDim2.new(0.25, 2, 0, 17)
NoCDToggle.Size = UDim2.new(0.24, -2, 0, 28)
NoCDToggle.Parent = ControlSection

local ParallelToggle = Instance.new("TextButton")
ParallelToggle.Font = Enum.Font.GothamBold
ParallelToggle.Text = "Parallel"
ParallelToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
ParallelToggle.TextSize = 9
ParallelToggle.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
ParallelToggle.BorderSizePixel = 0
ParallelToggle.Position = UDim2.new(0.5, 2, 0, 17)
ParallelToggle.Size = UDim2.new(0.24, -2, 0, 28)
ParallelToggle.Parent = ControlSection

local BurstBtn = Instance.new("TextButton")
BurstBtn.Font = Enum.Font.GothamBold
BurstBtn.Text = "💥Burst"
BurstBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
BurstBtn.TextSize = 9
BurstBtn.BackgroundColor3 = Color3.fromRGB(255, 100, 0)
BurstBtn.BorderSizePixel = 0
BurstBtn.Position = UDim2.new(0.75, 2, 0, 17)
BurstBtn.Size = UDim2.new(0.24, -4, 0, 28)
BurstBtn.Parent = ControlSection

-- ========== PRODUCT LIST ==========
local ScrollingFrame = Instance.new("ScrollingFrame")
ScrollingFrame.Name = "ProductList"
ScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollingFrame.ScrollBarThickness = 4
ScrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(100, 100, 100)
ScrollingFrame.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
ScrollingFrame.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
ScrollingFrame.MidImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
ScrollingFrame.Active = true
ScrollingFrame.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
ScrollingFrame.BorderColor3 = Color3.fromRGB(50, 50, 50)
ScrollingFrame.BorderSizePixel = 1
ScrollingFrame.Position = UDim2.new(0, 4, 0, 158)
ScrollingFrame.Size = UDim2.new(1, -8, 1, -162)
ScrollingFrame.Parent = MainFrame

local ListLayout = Instance.new("UIListLayout")
ListLayout.SortOrder = Enum.SortOrder.LayoutOrder
ListLayout.Padding = UDim.new(0, 2)
ListLayout.Parent = ScrollingFrame

local ListPadding = Instance.new("UIPadding")
ListPadding.PaddingTop = UDim.new(0, 2)
ListPadding.PaddingBottom = UDim.new(0, 2)
ListPadding.PaddingLeft = UDim.new(0, 2)
ListPadding.PaddingRight = UDim.new(0, 2)
ListPadding.Parent = ScrollingFrame

-- ========== PRODUCT TEMPLATE ==========
local ProductTemplate = Instance.new("Frame")
ProductTemplate.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
ProductTemplate.BorderColor3 = Color3.fromRGB(55, 55, 55)
ProductTemplate.BorderSizePixel = 1
ProductTemplate.Size = UDim2.new(1, -4, 0, 50)
ProductTemplate.Visible = false
ProductTemplate.Name = "ProductTemplate"
ProductTemplate.Parent = ScrollingFrame

local ProdName = Instance.new("TextLabel")
ProdName.Font = Enum.Font.GothamBold
ProdName.Text = "Product Name"
ProdName.TextColor3 = Color3.fromRGB(255, 255, 255)
ProdName.TextSize = 10
ProdName.TextXAlignment = Enum.TextXAlignment.Left
ProdName.TextTruncate = Enum.TextTruncate.AtEnd
ProdName.BackgroundTransparency = 1
ProdName.Position = UDim2.new(0, 6, 0, 4)
ProdName.Size = UDim2.new(0.5, 0, 0, 12)
ProdName.Name = "ProdName"
ProdName.Parent = ProductTemplate

local ProdID = Instance.new("TextLabel")
ProdID.Font = Enum.Font.Gotham
ProdID.Text = "ID: 0"
ProdID.TextColor3 = Color3.fromRGB(150, 150, 150)
ProdID.TextSize = 9
ProdID.TextXAlignment = Enum.TextXAlignment.Left
ProdID.BackgroundTransparency = 1
ProdID.Position = UDim2.new(0, 6, 0, 16)
ProdID.Size = UDim2.new(0.3, 0, 0, 10)
ProdID.Name = "ProdID"
ProdID.Parent = ProductTemplate

local ProdPrice = Instance.new("TextLabel")
ProdPrice.Font = Enum.Font.GothamBold
ProdPrice.Text = "R$ 0"
ProdPrice.TextColor3 = Color3.fromRGB(100, 255, 100)
ProdPrice.TextSize = 10
ProdPrice.TextXAlignment = Enum.TextXAlignment.Left
ProdPrice.BackgroundTransparency = 1
ProdPrice.Position = UDim2.new(0, 6, 0, 28)
ProdPrice.Size = UDim2.new(0.3, 0, 0, 12)
ProdPrice.Name = "ProdPrice"
ProdPrice.Parent = ProductTemplate

local ProdStatus = Instance.new("TextLabel")
ProdStatus.Font = Enum.Font.Gotham
ProdStatus.Text = ""
ProdStatus.TextColor3 = Color3.fromRGB(255, 200, 100)
ProdStatus.TextSize = 9
ProdStatus.TextXAlignment = Enum.TextXAlignment.Left
ProdStatus.BackgroundTransparency = 1
ProdStatus.Position = UDim2.new(0, 6, 0, 38)
ProdStatus.Size = UDim2.new(0.45, 0, 0, 10)
ProdStatus.Name = "ProdStatus"
ProdStatus.Parent = ProductTemplate

-- Product Buttons (Simplified)
local ProdActive = Instance.new("TextButton")
ProdActive.Font = Enum.Font.GothamBold
ProdActive.Text = "▶ START"
ProdActive.TextColor3 = Color3.fromRGB(255, 255, 255)
ProdActive.TextSize = 9
ProdActive.BackgroundColor3 = Color3.fromRGB(50, 150, 50)
ProdActive.BorderSizePixel = 0
ProdActive.Position = UDim2.new(0.52, 0, 0, 5)
ProdActive.Size = UDim2.new(0.22, 0, 0, 18)
ProdActive.Name = "ProdActive"
ProdActive.Parent = ProductTemplate

local ProdBurst = Instance.new("TextButton")
ProdBurst.Font = Enum.Font.GothamBold
ProdBurst.Text = "💥"
ProdBurst.TextColor3 = Color3.fromRGB(255, 255, 255)
ProdBurst.TextSize = 10
ProdBurst.BackgroundColor3 = Color3.fromRGB(255, 100, 0)
ProdBurst.BorderSizePixel = 0
ProdBurst.Position = UDim2.new(0.76, 0, 0, 5)
ProdBurst.Size = UDim2.new(0.22, -4, 0, 18)
ProdBurst.Name = "ProdBurst"
ProdBurst.Parent = ProductTemplate

local ProdCopy = Instance.new("TextButton")
ProdCopy.Font = Enum.Font.GothamBold
ProdCopy.Text = "Copy ID"
ProdCopy.TextColor3 = Color3.fromRGB(255, 255, 255)
ProdCopy.TextSize = 8
ProdCopy.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
ProdCopy.BorderSizePixel = 0
ProdCopy.Position = UDim2.new(0.52, 0, 0, 27)
ProdCopy.Size = UDim2.new(0.46, -4, 0, 16)
ProdCopy.Name = "ProdCopy"
ProdCopy.Parent = ProductTemplate

-- ========== SERVICES ==========
local MarketplaceService = game:GetService("MarketplaceService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- ========== VARIABLES ==========
local isRunning = true
local loopEnabled = false
local noCDEnabled = false
local parallelEnabled = false
local purchasePerSec = 0
local totalPurchases = 0
local activeThreads = 0
local productData = {}

-- ========== HELPER FUNCTIONS ==========
local function getThreadCount()
	local n = tonumber(ThreadInput.Text) or 10
	return math.clamp(math.floor(n), 1, 200)
end

local function addHover(btn, hoverColor)
	local orig = btn.BackgroundColor3
	btn.MouseEnter:Connect(function()
		TweenService:Create(btn, TweenInfo.new(0.1), {BackgroundColor3 = hoverColor}):Play()
	end)
	btn.MouseLeave:Connect(function()
		TweenService:Create(btn, TweenInfo.new(0.1), {BackgroundColor3 = orig}):Play()
	end)
end

local function setButtonState(btn, active, onColor, offColor, onText, offText)
	if active then
		btn.BackgroundColor3 = onColor
		btn.Text = onText
	else
		btn.BackgroundColor3 = offColor
		btn.Text = offText
	end
end

local function doPurchase(productId)
	if not isRunning then return end
	pcall(function()
		MarketplaceService:SignalPromptProductPurchaseFinished(LocalPlayer.UserId, productId, true)
	end)
	purchasePerSec = purchasePerSec + 1
	totalPurchases = totalPurchases + 1
end

local function doBurst(productId, count)
	for i = 1, count do
		task.spawn(function()
			activeThreads = activeThreads + 1
			doPurchase(productId)
			activeThreads = activeThreads - 1
		end)
	end
end

local function stopAll()
	loopEnabled = false
	parallelEnabled = false
	
	setButtonState(LoopToggle, false, nil, Color3.fromRGB(60, 60, 60), nil, "Loop")
	setButtonState(ParallelToggle, false, nil, Color3.fromRGB(60, 60, 60), nil, "Parallel")
	
	for _, data in pairs(productData) do
		data.active = false
		data.parallel = false
		data.frame.ProdActive.Text = "▶ START"
		data.frame.ProdActive.BackgroundColor3 = Color3.fromRGB(50, 150, 50)
		data.frame.ProdStatus.Text = "Stopped"
	end
end

local function startProduct(data, useParallel, useNoCD)
	if data.active then return end
	data.active = true
	data.loopCount = 0
	
	data.frame.ProdActive.Text = "⏹ STOP"
	data.frame.ProdActive.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
	
	local threads = useParallel and getThreadCount() or 1
	
	for t = 1, threads do
		task.spawn(function()
			activeThreads = activeThreads + 1
			while data.active and isRunning and data.frame.Parent do
				doPurchase(data.product.ProductId)
				data.loopCount = data.loopCount + 1
				data.frame.ProdStatus.Text = "🔄 " .. data.loopCount .. (threads > 1 and " (x"..threads..")" or "")
				
				if useNoCD then
					task.wait()
				else
					task.wait(0.1)
				end
			end
			activeThreads = activeThreads - 1
		end)
	end
end

local function stopProduct(data)
	data.active = false
	data.parallel = false
	data.frame.ProdActive.Text = "▶ START"
	data.frame.ProdActive.BackgroundColor3 = Color3.fromRGB(50, 150, 50)
end

-- ========== STATS UPDATER ==========
task.spawn(function()
	while isRunning and ScreenGui.Parent do
		SpeedLabel.Text = "⚡ " .. purchasePerSec .. "/s"
		TotalLabel.Text = "Total: " .. totalPurchases
		ThreadLabel.Text = "Threads: " .. activeThreads
		purchasePerSec = 0
		task.wait(1)
	end
end)

-- ========== LOAD PRODUCTS ==========
local success, products = pcall(function()
	return MarketplaceService:GetDeveloperProductsAsync():GetCurrentPage()
end)
if not success then products = {} end

ProductCountLabel.Text = "📦 " .. #products

-- ========== CREATE PRODUCT FRAMES ==========
for i, prod in pairs(products) do
	local frame = ProductTemplate:Clone()
	frame.Parent = ScrollingFrame
	frame.Visible = true
	frame.LayoutOrder = i
	
	frame.ProdName.Text = prod.Name or "Unknown"
	frame.ProdID.Text = "ID: " .. (prod.ProductId or "?")
	frame.ProdPrice.Text = "R$ " .. (prod.PriceInRobux or 0)
	
	local data = {
		frame = frame,
		product = prod,
		active = false,
		parallel = false,
		loopCount = 0
	}
	table.insert(productData, data)
	
	-- Hover effects
	addHover(frame.ProdActive, Color3.fromRGB(70, 180, 70))
	addHover(frame.ProdBurst, Color3.fromRGB(255, 130, 30))
	addHover(frame.ProdCopy, Color3.fromRGB(90, 90, 90))
	
	-- Start/Stop per product
	frame.ProdActive.MouseButton1Click:Connect(function()
		if data.active then
			stopProduct(data)
		else
			startProduct(data, parallelEnabled, noCDEnabled)
		end
	end)
	
	-- Burst per product
	frame.ProdBurst.MouseButton1Click:Connect(function()
		local count = getThreadCount()
		doBurst(prod.ProductId, count)
		frame.ProdStatus.Text = "💥 +" .. count
		task.delay(0.5, function()
			if not data.active then
				frame.ProdStatus.Text = ""
			end
		end)
	end)
	
	-- Copy ID
	frame.ProdCopy.MouseButton1Click:Connect(function()
		if setclipboard then setclipboard(tostring(prod.ProductId)) end
		frame.ProdCopy.Text = "✓ Copied"
		task.delay(0.8, function() frame.ProdCopy.Text = "Copy ID" end)
	end)
end

-- ========== COMBO PRESETS ==========
-- 🟢 Normal: Loop only
NormalCombo.MouseButton1Click:Connect(function()
	stopAll()
	task.wait(0.1)
	
	noCDEnabled = false
	parallelEnabled = false
	loopEnabled = true
	
	setButtonState(LoopToggle, true, Color3.fromRGB(50, 180, 50), nil, "Loop ✓", nil)
	setButtonState(NoCDToggle, false, nil, Color3.fromRGB(60, 60, 60), nil, "No CD")
	setButtonState(ParallelToggle, false, nil, Color3.fromRGB(60, 60, 60), nil, "Parallel")
	
	for _, data in pairs(productData) do
		startProduct(data, false, false)
	end
	
	NormalCombo.Text = "🟢 Active!"
	task.delay(1, function() NormalCombo.Text = "🟢 Normal" end)
end)

-- 🟡 Fast: Loop + No Cooldown
FastCombo.MouseButton1Click:Connect(function()
	stopAll()
	task.wait(0.1)
	
	noCDEnabled = true
	parallelEnabled = false
	loopEnabled = true
	
	setButtonState(LoopToggle, true, Color3.fromRGB(50, 180, 50), nil, "Loop ✓", nil)
	setButtonState(NoCDToggle, true, Color3.fromRGB(255, 150, 50), nil, "No CD ✓", nil)
	setButtonState(ParallelToggle, false, nil, Color3.fromRGB(60, 60, 60), nil, "Parallel")
	
	for _, data in pairs(productData) do
		startProduct(data, false, true)
	end
	
	FastCombo.Text = "🟡 Active!"
	task.delay(1, function() FastCombo.Text = "🟡 Fast" end)
end)

-- 🔴 Ultra: Loop + No CD + Parallel
UltraCombo.MouseButton1Click:Connect(function()
	stopAll()
	task.wait(0.1)
	
	noCDEnabled = true
	parallelEnabled = true
	loopEnabled = true
	
	setButtonState(LoopToggle, true, Color3.fromRGB(50, 180, 50), nil, "Loop ✓", nil)
	setButtonState(NoCDToggle, true, Color3.fromRGB(255, 150, 50), nil, "No CD ✓", nil)
	setButtonState(ParallelToggle, true, Color3.fromRGB(150, 50, 255), nil, "Para ✓", nil)
	
	for _, data in pairs(productData) do
		startProduct(data, true, true)
	end
	
	UltraCombo.Text = "🔴 Active!"
	task.delay(1, function() UltraCombo.Text = "🔴 Ultra" end)
end)

-- 💥 MAX POWER: Ultra + Extra burst
MaxCombo.MouseButton1Click:Connect(function()
	stopAll()
	task.wait(0.1)
	
	noCDEnabled = true
	parallelEnabled = true
	loopEnabled = true
	
	local threads = getThreadCount()
	ThreadInput.Text = tostring(math.min(threads * 2, 100))
	
	setButtonState(LoopToggle, true, Color3.fromRGB(50, 180, 50), nil, "Loop ✓", nil)
	setButtonState(NoCDToggle, true, Color3.fromRGB(255, 150, 50), nil, "No CD ✓", nil)
	setButtonState(ParallelToggle, true, Color3.fromRGB(150, 50, 255), nil, "Para ✓", nil)
	
	for _, data in pairs(productData) do
		startProduct(data, true, true)
		doBurst(data.product.ProductId, threads)
	end
	
	MaxCombo.Text = "💥 RUNNING!"
	MaxCombo.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
	task.delay(1, function()
		MaxCombo.Text = "💥 MAX POWER"
		MaxCombo.BackgroundColor3 = Color3.fromRGB(255, 100, 0)
	end)
end)

-- 🛑 Stop All
StopAllBtn.MouseButton1Click:Connect(function()
	stopAll()
	StopAllBtn.Text = "✓ Stopped"
	task.delay(1, function() StopAllBtn.Text = "🛑 STOP ALL" end)
end)

-- ========== MANUAL TOGGLES ==========
addHover(LoopToggle, Color3.fromRGB(90, 90, 90))
addHover(NoCDToggle, Color3.fromRGB(90, 90, 90))
addHover(ParallelToggle, Color3.fromRGB(90, 90, 90))
addHover(BurstBtn, Color3.fromRGB(255, 130, 30))

LoopToggle.MouseButton1Click:Connect(function()
	loopEnabled = not loopEnabled
	setButtonState(LoopToggle, loopEnabled, 
		Color3.fromRGB(50, 180, 50), Color3.fromRGB(60, 60, 60),
		"Loop ✓", "Loop")
	
	if loopEnabled then
		for _, data in pairs(productData) do
			if not data.active then
				startProduct(data, parallelEnabled, noCDEnabled)
			end
		end
	else
		for _, data in pairs(productData) do
			stopProduct(data)
		end
	end
end)

NoCDToggle.MouseButton1Click:Connect(function()
	noCDEnabled = not noCDEnabled
	setButtonState(NoCDToggle, noCDEnabled,
		Color3.fromRGB(255, 150, 50), Color3.fromRGB(60, 60, 60),
		"No CD ✓", "No CD")
end)

ParallelToggle.MouseButton1Click:Connect(function()
	parallelEnabled = not parallelEnabled
	setButtonState(ParallelToggle, parallelEnabled,
		Color3.fromRGB(150, 50, 255), Color3.fromRGB(60, 60, 60),
		"Para ✓", "Parallel")
end)

BurstBtn.MouseButton1Click:Connect(function()
	local count = getThreadCount()
	for _, data in pairs(productData) do
		doBurst(data.product.ProductId, count)
	end
	BurstBtn.Text = "💥 " .. (#productData * count)
	task.delay(0.5, function() BurstBtn.Text = "💥Burst" end)
end)

-- ========== WINDOW CONTROLS ==========
addHover(MinBtn, Color3.fromRGB(80, 80, 80))
addHover(CloseBtn, Color3.fromRGB(220, 60, 60))

MinBtn.MouseButton1Click:Connect(function()
	MainFrame.Visible = not MainFrame.Visible
	MinBtn.Text = MainFrame.Visible and "_" or "+"
	MainContainer.Size = MainFrame.Visible 
		and UDim2.new(0, 300, 0, 450) 
		or UDim2.new(0, 300, 0, 26)
end)

CloseBtn.MouseButton1Click:Connect(function()
	isRunning = false
	stopAll()
	task.wait(0.1)
	ScreenGui:Destroy()
end)

-- ========== DRAGGING ==========
local dragging, dragStart, startPos = false, nil, nil

TitleBar.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = MainContainer.Position
	end
end)

TitleBar.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = false
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
		local delta = input.Position - dragStart
		MainContainer.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
end)

print("✅ Product Faker Pro Loaded!")
print("📦 Products Found: " .. #products)
print("💡 Use COMBO PRESETS for easy 1-click activation!")
