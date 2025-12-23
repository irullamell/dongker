-- [[ SERVICES ]]
local UserInputService = game:GetService("UserInputService")
local MarketplaceService = game:GetService("MarketplaceService")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")

-- [[ CONFIGURATION ]]
local MIN_WIDTH = 280   -- Lebar minimal
local MIN_HEIGHT = 180  -- Tinggi minimal

-- [[ GUI CREATION ]]
-- Menghapus GUI lama jika ada agar tidak menumpuk
for _, v in pairs(CoreGui:GetChildren()) do
    if v.Name == "UltraFakerMobile" then v:Destroy() end
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "UltraFakerMobile"
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = CoreGui

-- 1. MAIN FRAME (Wadah Utama)
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.5, -160, 0.4, -200) -- Tengah Layar
MainFrame.Size = UDim2.new(0, 320, 0, 450) -- Ukuran Awal
MainFrame.ClipsDescendants = true
MainFrame.Parent = ScreenGui

-- Hiasan Garis Pinggir & Sudut Tumpul
local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(80, 80, 80)
UIStroke.Thickness = 1
UIStroke.Parent = MainFrame

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = MainFrame

-- 2. TITLE BAR (AREA GESER / DRAG)
local TitleBar = Instance.new("TextButton")
TitleBar.Name = "TitleBar"
TitleBar.Text = "  Product Faker (Drag)"
TitleBar.Font = Enum.Font.GothamBold
TitleBar.TextSize = 14
TitleBar.TextColor3 = Color3.fromRGB(220, 220, 220)
TitleBar.TextXAlignment = Enum.TextXAlignment.Left
TitleBar.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
TitleBar.BorderSizePixel = 0
TitleBar.Size = UDim2.new(1, 0, 0, 40) -- Sedikit lebih tinggi untuk jari
TitleBar.AutoButtonColor = false
TitleBar.Parent = MainFrame

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 8)
TitleCorner.Parent = TitleBar

-- Fix visual bawah TitleBar (agar rata dengan konten)
local TitleFix = Instance.new("Frame")
TitleFix.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
TitleFix.BorderSizePixel = 0
TitleFix.Size = UDim2.new(1, 0, 0, 10)
TitleFix.Position = UDim2.new(0, 0, 1, -10)
TitleFix.Parent = TitleBar

-- Tombol Close (Besar agar mudah ditekan di HP)
local CloseBtn = Instance.new("TextButton")
CloseBtn.Text = "X"
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextColor3 = Color3.WHITE
CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 60, 60)
CloseBtn.AnchorPoint = Vector2.new(1, 0.5)
CloseBtn.Position = UDim2.new(1, -10, 0.5, 0)
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Parent = TitleBar
Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(0, 6)

CloseBtn.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

-- 3. CONTENT AREA
local ContentFrame = Instance.new("Frame")
ContentFrame.Name = "Content"
ContentFrame.BackgroundTransparency = 1
ContentFrame.Position = UDim2.new(0, 0, 0, 40)
ContentFrame.Size = UDim2.new(1, 0, 1, -40)
ContentFrame.Parent = MainFrame

-- Tombol Load Produk
local LoadBtn = Instance.new("TextButton")
LoadBtn.Text = "Load Products"
LoadBtn.Font = Enum.Font.GothamBold
LoadBtn.TextColor3 = Color3.WHITE
LoadBtn.BackgroundColor3 = Color3.fromRGB(60, 140, 60)
LoadBtn.AnchorPoint = Vector2.new(0.5, 0)
LoadBtn.Position = UDim2.new(0.5, 0, 0.02, 0)
LoadBtn.Size = UDim2.new(0.95, 0, 0, 35)
LoadBtn.Parent = ContentFrame
Instance.new("UICorner", LoadBtn).CornerRadius = UDim.new(0, 6)

-- List Scroll
local ScrollingFrame = Instance.new("ScrollingFrame")
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.BorderSizePixel = 0
ScrollingFrame.Position = UDim2.new(0, 0, 0, 45)
ScrollingFrame.Size = UDim2.new(1, 0, 1, -50)
ScrollingFrame.ScrollBarThickness = 6 -- Lebih tebal untuk HP
ScrollingFrame.Parent = ContentFrame

local ListLayout = Instance.new("UIListLayout")
ListLayout.SortOrder = Enum.SortOrder.LayoutOrder
ListLayout.Padding = UDim.new(0, 5)
ListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
ListLayout.Parent = ScrollingFrame

-- [[ FUNCTION: MEMBUAT ITEM PRODUK ]]
local function createProductItem(product)
    local ItemFrame = Instance.new("Frame")
    ItemFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    -- Lebar 95% agar responsif mengikuti lebar GUI
    ItemFrame.Size = UDim2.new(0.95, 0, 0, 90) 
    ItemFrame.Parent = ScrollingFrame
    Instance.new("UICorner", ItemFrame).CornerRadius = UDim.new(0, 6)

    -- Container Info Teks
    local InfoFrame = Instance.new("Frame")
    InfoFrame.BackgroundTransparency = 1
    InfoFrame.Size = UDim2.new(0.6, 0, 1, 0)
    InfoFrame.Parent = ItemFrame

    local function createLabel(text, yPos, col)
        local lbl = Instance.new("TextLabel")
        lbl.Text = text
        lbl.Font = Enum.Font.GothamSemibold
        lbl.TextColor3 = col
        lbl.TextSize = 12
        lbl.TextXAlignment = Enum.TextXAlignment.Left
        lbl.BackgroundTransparency = 1
        lbl.Position = UDim2.new(0.05, 0, yPos, 0)
        lbl.Size = UDim2.new(0.95, 0, 0, 20)
        lbl.TextTruncate = Enum.TextTruncate.AtEnd
        lbl.Parent = InfoFrame
    end

    createLabel(product.Name, 0.1, Color3.WHITE)
    createLabel("ID: " .. product.ProductId, 0.4, Color3.fromRGB(180, 180, 180))
    createLabel("R$: " .. product.PriceInRobux, 0.7, Color3.fromRGB(100, 255, 100))

    -- Tombol Aksi (Kanan)
    -- Menggunakan AnchorPoint agar selalu menempel di kanan saat diresize
    local function createBtn(text, color, yPos)
        local btn = Instance.new("TextButton")
        btn.Text = text
        btn.Font = Enum.Font.GothamBold
        btn.TextSize = 11
        btn.TextColor3 = Color3.WHITE
        btn.BackgroundColor3 = color
        btn.AnchorPoint = Vector2.new(1, 0)
        btn.Position = UDim2.new(0.98, 0, yPos, 0)
        btn.Size = UDim2.new(0, 80, 0, 24) -- Sedikit lebih lebar untuk jari
        btn.Parent = ItemFrame
        Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 4)
        return btn
    end

    local CopyBtn = createBtn("Copy ID", Color3.fromRGB(80, 80, 80), 0.12)
    local AutoBtn = createBtn("Auto Buy", Color3.fromRGB(80, 80, 80), 0.42)
    local BuyBtn = createBtn("Buy", Color3.fromRGB(180, 60, 60), 0.72)

    -- Logic Copy
    CopyBtn.MouseButton1Click:Connect(function()
        setclipboard(tostring(product.ProductId))
        CopyBtn.Text = "Copied!"
        task.wait(1)
        CopyBtn.Text = "Copy ID"
    end)

    -- Logic Buy Sekali
    BuyBtn.MouseButton1Click:Connect(function()
        MarketplaceService:SignalPromptProductPurchaseFinished(LocalPlayer.UserId, product.ProductId, true)
    end)

    -- Logic Auto Buy (NO COOLDOWN & LOOP CEPAT)
    local autoActive = false
    AutoBtn.MouseButton1Click:Connect(function()
        autoActive = not autoActive
        if autoActive then
            AutoBtn.Text = "STOP"
            AutoBtn.BackgroundColor3 = Color3.fromRGB(40, 180, 40)
            
            task.spawn(function()
                while autoActive and ItemFrame.Parent do
                    -- Spam 5x per frame render (Sangat Cepat)
                    for i = 1, 5 do
                        if not autoActive then break end
                        MarketplaceService:SignalPromptProductPurchaseFinished(LocalPlayer.UserId, product.ProductId, true)
                    end
                    task.wait() -- Tunggu 1 frame
                end
            end)
        else
            AutoBtn.Text = "Auto Buy"
            AutoBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
        end
    end)
end

-- Logic Load Products
LoadBtn.MouseButton1Click:Connect(function()
    LoadBtn.Text = "Loading..."
    for _, child in pairs(ScrollingFrame:GetChildren()) do
        if child:IsA("Frame") then child:Destroy() end
    end

    local success, page = pcall(function()
        return MarketplaceService:GetDeveloperProductsAsync():GetCurrentPage()
    end)

    if success then
        for _, product in pairs(page) do
            createProductItem(product)
        end
        LoadBtn.Text = "Reload Products (" .. #page .. ")"
    else
        LoadBtn.Text = "Failed to Load"
        task.wait(1)
        LoadBtn.Text = "Load Products"
    end
end)

-- [[ 4. LOGIKA DRAG (MOBILE & PC) ]]
-- Mendukung input 'Touch' (Sentuhan) dan 'MouseButton1' (Klik Kiri)
local dragging, dragInput, dragStart, startPos

local function updateDrag(input)
    local delta = input.Position - dragStart
    MainFrame.Position = UDim2.new(
        startPos.X.Scale, startPos.X.Offset + delta.X,
        startPos.Y.Scale, startPos.Y.Offset + delta.Y
    )
end

TitleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

TitleBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        updateDrag(input)
    end
end)

-- [[ 5. LOGIKA RESIZE (MOBILE & PC) ]]
-- Tombol Resize di pojok kanan bawah
local ResizeHandle = Instance.new("ImageButton")
ResizeHandle.Name = "ResizeHandle"
ResizeHandle.BackgroundTransparency = 1
ResizeHandle.Image = "rbxassetid://9606145214" -- Icon Grip
ResizeHandle.ImageColor3 = Color3.fromRGB(180, 180, 180)
ResizeHandle.Position = UDim2.new(1, -30, 1, -30) -- Posisi pojok
ResizeHandle.Size = UDim2.new(0, 30, 0, 30) -- Ukuran hitbox besar agar mudah disentuh
ResizeHandle.ZIndex = 10
ResizeHandle.Parent = MainFrame

local resizing, resizeStart, startSize

ResizeHandle.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        resizing = true
        resizeStart = input.Position
        startSize = MainFrame.AbsoluteSize

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                resizing = false
            end
        end)
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if resizing and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - resizeStart
        local newX = math.max(MIN_WIDTH, startSize.X + delta.X)
        local newY = math.max(MIN_HEIGHT, startSize.Y + delta.Y)
        
        MainFrame.Size = UDim2.new(0, newX, 0, newY)
    end
end)
