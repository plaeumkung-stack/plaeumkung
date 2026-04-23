local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("SAILOR HUB v1.0", "DarkTheme")
local Tab = Window:NewTab("Auto Trade")
local Section = Tab:NewSection("Trade Settings")

local targetID = 0
local itemName = ""
local amount = 1

Section:NewTextBox("Target UserID", "ID คนรับของ", function(t)
    targetID = tonumber(t) or 0
end)

Section:NewTextBox("Item Name", "ชื่อไอเทม (Case Sensitive)", function(t)
    itemName = t
end)

Section:NewTextBox("Amount", "จำนวน", function(t)
    amount = tonumber(t) or 1
end)

Section:NewButton("🚀 Start Fast Trade", "ส่งของทันที", function()
    local R = game:GetService("ReplicatedStorage").Remotes.TradeRemotes
    if targetID ~= 0 and itemName ~= "" then
        R.SendTradeRequest:FireServer(targetID)
        task.wait(1.5)
        R.AddItemToTrade:FireServer("Items", itemName, amount)
        task.wait(0.5)
        R.ConfirmTrade:FireServer()
        print("Trade Sent Successfully!")
    else
        print("Error: Missing ID or Item Name")
    end
end)

Section:NewKeybind("Toggle UI", "ปุ่มเปิด/ปิดเมนู", Enum.KeyCode.RightControl, function()
	Library:ToggleUI()
end)
