local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Product | denxxila",
    LoadingTitle = "Loading...",
    LoadingSubtitle = "Product Loop",
    ConfigurationSaving = {
        Enabled = false,
        FolderName = nil, 
        FileName = "ProductFaker"
    },
    KeySystem = false, 
})

local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

getgenv().ProductLoops = {}

local ProductTab = Window:CreateTab("Products", 4483362458)

local function FakePurchase(productId)
    MarketplaceService:SignalPromptProductPurchaseFinished(LocalPlayer.UserId, productId, true)
end

local success, developerProducts = pcall(function()
    return MarketplaceService:GetDeveloperProductsAsync():GetCurrentPage()
end)

if not success then
    developerProducts = {}
end

ProductTab:CreateSection("Global Controls")

ProductTab:CreateButton({
    Name = "Buy ALL Products Once",
    Callback = function()
        for _, product in pairs(developerProducts) do
            FakePurchase(product.ProductId)
        end
        Rayfield:Notify({
            Title = "System",
            Content = "Bought all products once",
            Duration = 2,
            Image = 4483362458,
        })
    end,
})

ProductTab:CreateButton({
    Name = "START ALL LOOPS",
    Callback = function()
        for _, product in pairs(developerProducts) do
            local id = product.ProductId
            if not getgenv().ProductLoops[id] then
                getgenv().ProductLoops[id] = true
                task.spawn(function()
                    while getgenv().ProductLoops[id] do
                        FakePurchase(id)
                        task.wait()
                    end
                end)
            end
        end
        Rayfield:Notify({
            Title = "System",
            Content = "All loops started",
            Duration = 2,
            Image = 4483362458,
        })
    end,
})

ProductTab:CreateButton({
    Name = "STOP ALL LOOPS",
    Callback = function()
        for _, product in pairs(developerProducts) do
            getgenv().ProductLoops[product.ProductId] = false
        end
        Rayfield:Notify({
            Title = "System",
            Content = "All loops stopped",
            Duration = 2,
            Image = 4483362458,
        })
    end,
})

if #developerProducts > 0 then
    ProductTab:CreateSection("Product List")
    
    for _, product in pairs(developerProducts) do
        local prodName = product.Name or "No Name"
        local prodId = product.ProductId
        local prodPrice = product.PriceInRobux or 0
        
        ProductTab:CreateParagraph({
            Title = prodName,
            Content = "ID: " .. tostring(prodId) .. " | Price: " .. tostring(prodPrice)
        })
        
        ProductTab:CreateButton({
            Name = "Buy Once [" .. prodName .. "]",
            Callback = function()
                FakePurchase(prodId)
            end,
        })

        ProductTab:CreateToggle({
            Name = "Auto Buy Loop [" .. prodName .. "]",
            CurrentValue = false,
            Flag = "AutoBuy_" .. prodId, 
            Callback = function(Value)
                getgenv().ProductLoops[prodId] = Value
                
                if Value then
                    task.spawn(function()
                        while getgenv().ProductLoops[prodId] do
                            FakePurchase(prodId)
                            task.wait()
                        end
                    end)
                end
            end,
        })

        ProductTab:CreateButton({
            Name = "Copy ID [" .. prodId .. "]",
            Callback = function()
                setclipboard(tostring(prodId))
                Rayfield:Notify({
                    Title = "System",
                    Content = "ID Copied",
                    Duration = 1,
                    Image = 4483362458,
                })
            end,
        })
        
        ProductTab:CreateLabel("-------------------------------------------------")
    end
end

Rayfield:LoadConfiguration()
