-- Memuat Library Rayfield
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Membuat Window Utama
local Window = Rayfield:CreateWindow({
    Name = "Product Faker | Rayfield",
    LoadingTitle = "Memuat Produk...",
    LoadingSubtitle = "by AI Assistant",
    ConfigurationSaving = {
        Enabled = false,
        FolderName = nil, 
        FileName = "ProductFaker"
    },
    Discord = {
        Enabled = false,
        Invite = "", 
        RememberJoins = true 
    },
    KeySystem = false, 
})

-- Layanan Roblox
local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Tabel global untuk menyimpan status Auto Buy agar tidak error saat toggle
getgenv().AutoBuyStates = {}

-- Membuat Tab Utama
local ProductTab = Window:CreateTab("Products", 4483362458) -- Ikon generik

-- Fungsi Utama: Fake Purchase (Client Side Only)
local function FakePurchase(productId)
    -- Fungsi ini menipu client agar berpikir pembelian berhasil
    MarketplaceService:SignalPromptProductPurchaseFinished(LocalPlayer.UserId, productId, true)
end

-- Mengambil Data Developer Products dari Game
local success, developerProducts = pcall(function()
    return MarketplaceService:GetDeveloperProductsAsync():GetCurrentPage()
end)

-- Jika gagal atau tidak ada produk
if not success or #developerProducts == 0 then
    Rayfield:Notify({
        Title = "Oups!",
        Content = "Tidak ada Developer Products ditemukan di game ini.",
        Duration = 5,
        Image = 4483362458,
    })
    developerProducts = {}
end

-- ==============================
-- BAGIAN: KONTROL GLOBAL
-- ==============================

ProductTab:CreateSection("Global Controls")

ProductTab:CreateButton({
    Name = "Buy ALL Products (Beli Semua - " .. #developerProducts .. ")",
    Callback = function()
        Rayfield:Notify({
            Title = "Processing",
            Content = "Sedang membeli semua produk...",
            Duration = 2,
            Image = 4483362458,
        })
        
        for _, product in pairs(developerProducts) do
            FakePurchase(product.ProductId)
            task.wait(0.05) -- Delay kecil agar tidak crash
        end
        
        Rayfield:Notify({
            Title = "Selesai",
            Content = "Semua produk telah dibeli (Fake).",
            Duration = 3,
            Image = 4483362458,
        })
    end,
})

-- ==============================
-- BAGIAN: LIST PRODUK INDIVIDU
-- ==============================

if #developerProducts > 0 then
    ProductTab:CreateSection("Product List")
    
    for _, product in pairs(developerProducts) do
        local prodName = product.Name or "Tanpa Nama"
        local prodId = product.ProductId
        local prodPrice = product.PriceInRobux or 0
        
        -- Menampilkan Info Produk
        ProductTab:CreateParagraph({
            Title = prodName,
            Content = "ID: " .. tostring(prodId) .. " | Harga: " .. tostring(prodPrice) .. " Robux"
        })
        
        -- Tombol Beli Sekali
        ProductTab:CreateButton({
            Name = "Beli Sekali [" .. prodName .. "]",
            Callback = function()
                FakePurchase(prodId)
            end,
        })

        -- Toggle Auto Buy
        ProductTab:CreateToggle({
            Name = "Auto Buy (Loop) [" .. prodName .. "]",
            CurrentValue = false,
            Flag = "AutoBuy_" .. prodId, 
            Callback = function(Value)
                -- Simpan status toggle ke variabel global
                getgenv().AutoBuyStates[prodId] = Value
                
                if Value then
                    task.spawn(function()
                        while getgenv().AutoBuyStates[prodId] do
                            FakePurchase(prodId)
                            task.wait(0.1) -- Kecepatan Auto Buy (detik)
                        end
                    end)
                end
            end,
        })

        -- Tombol Copy ID
        ProductTab:CreateButton({
            Name = "Copy ID [" .. prodId .. "]",
            Callback = function()
                setclipboard(tostring(prodId))
                Rayfield:Notify({
                    Title = "Disalin!",
                    Content = "ID Produk telah disalin ke clipboard.",
                    Duration = 2,
                    Image = 4483362458,
                })
            end,
        })
        
        -- Pemisah Visual
        ProductTab:CreateLabel("-------------------------------------------------")
    end
end

-- Memuat konfigurasi (wajib untuk Rayfield)
Rayfield:LoadConfiguration()
