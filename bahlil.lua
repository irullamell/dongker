-- Services
local MarketplaceService = game:GetService("MarketplaceService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Create GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ProductFakerResponsive"
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = game:GetService("CoreGui")

-- MAIN CONTAINER (Wadah Utama yang bisa digeser & diresize)
local MainContainer = Instance.new("Frame")
MainContainer.Name = "MainContainer"
MainContainer.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
MainContainer.BorderSizePixel = 0
MainContainer.Position = UDim2.new(0.3, 0, 0.3, 0)
MainContainer.Size = UDim2.new(0, 300, 0, 450) -- Ukuran Awal
MainContainer.ClipsDescendants = true
MainContainer.Parent = ScreenGui

local ContainerCorner = Instance.new("UICorner")
ContainerCorner.CornerRadius = UDim.new(0, 6)
ContainerCorner.Parent = MainContainer

local ContainerStroke = Instance.new("UIStroke")
ContainerStroke.Color = Color3.fromRGB(80, 80, 80)
ContainerStroke.Thickness = 1
ContainerStroke.Parent = MainContainer

-- TITLE BAR (Bagian Atas)
local TitleBar = Instance.new("TextButton")
TitleBar.Name = "TitleBar"
TitleBar.Font = Enum.Font.GothamBold
TitleBar.Text = "  Product Faker"
TitleBar.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleBar.TextSize = 14
TitleBar.TextXAlignment = Enum.TextXAlignment.Left
TitleBar.AutoButtonColor = false
TitleBar.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
TitleBar.BorderSizePixel = 0
TitleBar.Size = UDim2.new(1, 0, 0, 35) -- Lebar 100%, Tinggi 35px
TitleBar.Parent = MainContainer

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 6)
TitleCorner.Parent = TitleBar

-- Fix sudut bawah TitleBar agar tidak melengkung (visual fix)
local TitleFix = Instance.new("Frame")
TitleFix.BorderSizePixel = 0
TitleFix.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
TitleFix.Size = UDim2.new(1, 0, 0, 10)
TitleFix.Position = UDim2.new(0, 0, 1, -10)
TitleFix.Parent = TitleBar

-- Control Buttons (Minimize / Close)
local function createTitleBtn(text, color, posOffset)
    local btn = Instance.new("TextButton")
    btn.Font = Enum.Font.GothamBold
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 14
    btn.BackgroundColor3 = color
    btn.AnchorPoint = Vector2.new(1, 0.5) -- Anchor di kanan tengah
    btn.Position = UDim2.new(1, posOffset, 0.5, 0)
    btn.Size = UDim2.new(0, 25, 0, 25)
    btn.Parent = TitleBar
    
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 4)
    c.Parent = btn
    return btn
end

local CloseButton = createTitleBtn("X", Color3.fromRGB(200, 50, 50), -5)
local MinButton = createTitleBtn("-", Color3.fromRGB(70, 70, 70), -35)

-- CONTENT FRAME (Wadah isi di bawah TitleBar)
local ContentFrame = Instance.new("Frame")
ContentFrame.Name = "ContentFrame"
ContentFrame.BackgroundTransparency = 1
ContentFrame.Position = UDim2.new(0, 0, 0, 35)
ContentFrame.Size = UDim2.new(1, 0, 1, -35) -- Mengisi sisa ruang
ContentFrame.Parent = MainContainer

-- Global Buy Button
local GlobalBuyButton = Instance.new("TextButton")
GlobalBuyButton.Font = Enum.Font.GothamBold
GlobalBuyButton.Text = "Load Products..."
GlobalBuyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
GlobalBuyButton.TextSize = 12
GlobalBuyButton.BackgroundColor3 = Color3.fromRGB(150, 50, 50)
GlobalBuyButton.BorderSizePixel = 0
GlobalBuyButton.AnchorPoint = Vector2.new(0.5, 0)
GlobalBuyButton.Position = UDim2.new(0.5, 0, 0.02, 0)
GlobalBuyButton.Size = UDim2.new(0.95, 0, 0, 30) -- Lebar 95%
GlobalBuyButton.Parent = ContentFrame

local GlobalCorner = Instance.new("UICorner")
GlobalCorner.CornerRadius = UDim.new(0, 6)
GlobalCorner.Parent = GlobalBuyButton

-- Scrolling Frame
local ScrollingFrame = Instance.new("ScrollingFrame")
ScrollingFrame.Active = true
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.BorderSizePixel = 0
ScrollingFrame.Position = UDim2.new(0, 0, 0, 40)
ScrollingFrame.Size = UDim2.new(1, 0, 1, -45) -- Menyesuaikan tinggi otomatis
ScrollingFrame.ScrollBarThickness = 4
ScrollingFrame.Parent = ContentFrame

local ListLayout = Instance.new("UIListLayout")
ListLayout.SortOrder = Enum.SortOrder.LayoutOrder
ListLayout.Padding = UDim.new(0, 5)
ListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
ListLayout.Parent = ScrollingFrame

-- RESIZE HANDLE (Pojok Kanan Bawah untuk Mengatur Ukuran)
local ResizeHandle = Instance.new("ImageButton")
ResizeHandle.Name = "ResizeHandle"
ResizeHandle.BackgroundTransparency = 1
ResizeHandle.Image = "rbxassetid://13476903209" -- Icon drag/resize
ResizeHandle.ImageColor3 = Color3.fromRGB(150, 150, 150)
ResizeHandle.Position = UDim2.new(1, -15, 1, -15)
ResizeHandle.Size = UDim2.new(0, 15, 0, 15)
ResizeHandle.ZIndex = 5
ResizeHandle.Parent = MainContainer

-- TEMPLATE ITEM (Untuk Produk)
-- Kita buat function agar bisa dipanggil ulang
local function createProductFrame(productData)
    local Frame = Instance.new("Frame")
    Frame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    Frame.BackgroundTransparency = 0.5
    Frame.Size = UDim2.new(0.95, 0, 0, 85) -- Lebar 95% mengikuti parent
    Frame.Parent = ScrollingFrame
    
    local FCorner = Instance.new("UICorner")
    FCorner.CornerRadius = UDim.new(0, 6)
    FCorner.Parent = Frame

    -- Labels
    local NameLbl = Instance.new("TextLabel")
    NameLbl.Text = productData.Name
    NameLbl.Font = Enum.Font.GothamSemibold
    NameLbl.TextColor3 = Color3.fromRGB(255, 255, 255)
    NameLbl.TextSize = 13
    NameLbl.TextXAlignment = Enum.TextXAlignment.Left
    NameLbl.BackgroundTransparency = 1
    NameLbl.Position = UDim2.new(0.03, 0, 0.1, 0)
    NameLbl.Size = UDim2.new(0.6, 0, 0, 20)
    NameLbl.TextTruncate = Enum.TextTruncate.AtEnd
    NameLbl.Parent = Frame

    local IDLbl = Instance.new("TextLabel")
    IDLbl.Text = "ID: " .. productData.ProductId
    IDLbl.Font = Enum.Font.Gotham
    IDLbl.TextColor3 = Color3.fromRGB(200, 200, 200)
    IDLbl.TextSize = 11
    IDLbl.TextXAlignment = Enum.TextXAlignment.Left
    IDLbl.BackgroundTransparency = 1
    IDLbl.Position = UDim2.new(0.03, 0, 0.35, 0)
    IDLbl.Size = UDim2.new(0.5, 0, 0, 20)
    IDLbl.Parent = Frame
    
    local PriceLbl = Instance.new("TextLabel")
    PriceLbl.Text = "R$: " .. productData.PriceInRobux
    PriceLbl.Font = Enum.Font.GothamBold
    PriceLbl.TextColor3 = Color3.fromRGB(100, 255, 100)
    PriceLbl.TextSize = 12
    PriceLbl.TextXAlignment = Enum.TextXAlignment.Left
    PriceLbl.BackgroundTransparency = 1
    PriceLbl.Position = UDim2.new(0.03, 0, 0.65, 0)
    PriceLbl.Size = UDim2.new(0.5, 0, 0, 20)
    PriceLbl.Parent = Frame

    -- Buttons (Menggunakan Scale X agar menempel di kanan saat diresize)
    local function mkBtn(txt, col, yPos)
        local b = Instance.new("TextButton")
        b.Text = txt
        b.Font = Enum.Font.GothamBold
        b.TextColor3 = Color3.fromRGB(255, 255, 255)
        b.TextSize = 10
        b.BackgroundColor3 = col
        b.AnchorPoint = Vector2.new(1, 0) -- Anchor Kanan
        b.Position = UDim2.new(0.97, 0, yPos, 0) -- Selalu 97% dari kiri (menempel kanan)
        b.Size = UDim2.new(0, 70, 0, 20)
        b.Parent = Frame
        Instance.new("UICorner", b).CornerRadius = UDim.new(0, 4)
        return b
    end

    local CopyBtn = mkBtn("Copy ID", Color3.fromRGB(80, 80, 80), 0.12)
    local AutoBtn = mkBtn("Auto Buy", Color3.fromRGB(80, 80, 80), 0.41)
    local BuyBtn = mkBtn("Buy", Color3.fromRGB(180, 60, 60), 0.70)

    -- Logic
    CopyBtn.MouseButton1Click:Connect(function()
        setclipboard(tostring(productData.ProductId))
        CopyBtn.Text = "Copied!"
        task.wait(1)
        CopyBtn.Text = "Copy ID"
    end)

    BuyBtn.MouseButton1Click:Connect(function()
        MarketplaceService:SignalPromptProductPurchaseFinished(LocalPlayer.UserId, productData.ProductId, true)
    end)

    -- NO COOLDOWN AUTO BUY
    local auto = false
    AutoBtn.MouseButton1Click:Connect(function()
        auto = not auto
        if auto then
            AutoBtn.Text = "STOP"
            AutoBtn.BackgroundColor3 = Color3.fromRGB(40, 180, 40)
            task.spawn(function()
                while auto and Frame.Parent do
                    -- Spam 10 kali per frame
                    for i = 1, 10 do
                        if not auto then break end
                        MarketplaceService:SignalPromptProductPurchaseFinished(LocalPlayer.UserId, productData.ProductId, true)
                    end
                    task.wait() -- Ultra fast loop
                end
            end)
        else
            AutoBtn.Text = "Auto Buy"
            AutoBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
        end
    end)
end

-- === LOGIC UTAMA ===

-- 1. Load Products
task.spawn(function()
    local success, pages = pcall(function()
        return MarketplaceService:GetDeveloperProductsAsync():GetCurrentPage()
    end)
    if success then
        GlobalBuyButton.Text = "Buy All (" .. #pages .. ")"
        for _, prod in pairs(pages) do
            createProductFrame(prod)
        end
        
        -- Global Buy Logic
        GlobalBuyButton.MouseButton1Click:Connect(function()
            local t = GlobalBuyButton.Text
            GlobalBuyButton.Text = "Spamming..."
            for _, prod in pairs(pages) do
                MarketplaceService:SignalPromptProductPurchaseFinished(LocalPlayer.UserId, prod.ProductId, true)
            end
            task.wait(1)
            GlobalBuyButton.Text = t
        end)
    else
        GlobalBuyButton.Text = "Error Loading"
    end
end)

-- 2. Drag Logic (Menggeser Window)
local dragging, dragInput, dragStart, startPos
TitleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MainContainer.Position
        
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
        local delta = input.Position - dragStart
        MainContainer.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

-- 3. Resize Logic (Mengubah Ukuran Window)
local resizing, resizeStart, startSize
ResizeHandle.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        resizing = true
        resizeStart = input.Position
        startSize = MainContainer.Size
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                resizing = false
            end
        end)
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if resizing and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - resizeStart
        local newX = math.max(250, startSize.X.Offset + delta.X) -- Min width 250
        local newY = math.max(150, startSize.Y.Offset + delta.Y) -- Min height 150
        MainContainer.Size = UDim2.new(0, newX, 0, newY)
    end
end)

-- 4. Minimize & Close Logic
local isMin = false
local savedSize = MainContainer.Size

MinButton.MouseButton1Click:Connect(function()
    isMin = not isMin
    if isMin then
        savedSize = MainContainer.Size
        ContentFrame.Visible = false
        ResizeHandle.Visible = false
        MainContainer:TweenSize(UDim2.new(0, 250, 0, 35), "Out", "Quad", 0.3, true)
        MinButton.Text = "+"
    else
        ContentFrame.Visible = true
        ResizeHandle.Visible = true
        MainContainer:TweenSize(savedSize, "Out", "Quad", 0.3, true)
        MinButton.Text = "-"
    end
end)

CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)
