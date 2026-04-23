local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Steventhedev/Venyx-UI-Library/main/source.lua"))()
local Venyx = Library.new("PK-HUB MINIV1", 5013109572)

-- [[ ตั้งค่าธีมให้ดูเข้มๆ ดุๆ ]] --
local Main = Venyx:addPage("Main", 5012544693)
local Sets = Venyx:addPage("Character", 5012544693)
local MainSection = Main:addSection("Trade Sets")
local CharSection = Sets:addSection("Special Items")

-- [[ Function ใส่ของ ]] --
local function fireItems(items)
    local remote = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("TradeRemotes"):WaitForChild("AddItemToTrade")
    for _, item in ipairs(items) do
        remote:FireServer("Items", item[1], item[2])
        task.wait(0.3) -- ปรับให้ไวขึ้นนิดนึง
    end
end

-- [[ หน้าหลัก: เซ็ตยอดฮิต ]] --
MainSection:addButton("Set Rank (17 Items)", function()
    fireItems({{"Atomic Core", 2}, {"Blood Ring", 4}, {"Cursed Flesh", 2}, {"HÅgyoku Fragment", 2}, {"Infinity Essence", 2}, {"Phantasm Core", 2}, {"Slime Core", 3}, {"Soul Flame", 3}, {"Reiatsu Core", 4}, {"Dark Ring", 5}, {"Dismantle Fang", 7}, {"Void Fragment", 5}, {"Limitless Ring", 2}, {"Azure Heart", 2}, {"Evolution Fragment", 2}, {"Path Fragment", 2}, {"Corrupt Crown", 3}})
end)

MainSection:addButton("Set Carte", function()
    fireItems({{"Celestial Mark", 1}, {"Aero Core", 3}, {"Gale Essence", 8}, {"Tide Remnant", 14}, {"Tempest Relic", 25}})
end)

MainSection:addButton("Set Shadow V2", function()
    fireItems({{"Atomic Omen", 1}, {"Eminence Essence", 3}, {"Shadow Remnant", 9}, {"Magic Shard", 16}, {"Abyss Sigil", 80}})
end)

-- [[ หน้าตัวละคร ]] --
CharSection:addButton("Set Madara", function() fireItems({{"Path Fragment", 3}, {"Eternal Core", 8}, {"Battle Sigil", 18}, {"Power Remnant", 15}}) end)
CharSection:addButton("Set Rimuru", function() fireItems({{"Slime Core", 1}, {"Slime Remnant", 3}, {"Tempest Seal", 6}, {"Sage Pulse", 9}}) end)
CharSection:addButton("Set Garo", function() fireItems({{"Monster Pulse", 20}, {"Galaxy Shard", 50}, {"Star Mark", 80}, {"Cosmic Essence", 120}}) end)

-- [[ ปุ่มเปิด/ปิด UI (เผื่อมันบังจอ) ]] --
MainSection:addKeybind("Toggle UI", Enum.KeyCode.RightControl, function()
    print("Toggled")
    Library:toggle()
end)

Venyx:SelectPage(Venyx.pages[1], true)
