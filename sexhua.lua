-- PersianScript's Dev Hub (Safe Demo UI)
-- این UI فقط ظاهر و کنترل‌ها رو می‌سازه. عملکردها placeholder هستن.
-- قبل از قرار دادن هر عملکرد اتوماتیک روی سرور زنده،
-- حتماً منطق سمت سرور و سیاست‌های بازی رو رعایت کن.

local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "PersianScriptsHub"
gui.Parent = player:WaitForChild("PlayerGui")
gui.ResetOnSpawn = false

-- Theme colors
local BACK = Color3.fromRGB(10,10,12)
local PANEL = Color3.fromRGB(20,20,28)
local ACCENT = Color3.fromRGB(180,60,60) -- red accent
local TEXT = Color3.fromRGB(240,240,240)
local OUTLINE = Color3.fromRGB(60,20,20)

-- Main panel
local main = Instance.new("Frame")
main.Size = UDim2.new(0, 760, 0, 420)
main.Position = UDim2.new(0.5, -380, 0.5, -210)
main.BackgroundColor3 = PANEL
main.BorderSizePixel = 0
main.Parent = gui

local mainCorner = Instance.new("UICorner", main)
mainCorner.CornerRadius = UDim.new(0,12)

-- left sidebar
local sidebar = Instance.new("Frame")
sidebar.Size = UDim2.new(0, 200, 1, 0)
sidebar.Position = UDim2.new(0, 10, 0, 10)
sidebar.BackgroundTransparency = 1
sidebar.Parent = main

local logoFrame = Instance.new("Frame")
logoFrame.Size = UDim2.new(1, -20, 0, 110)
logoFrame.Position = UDim2.new(0, 10, 0, 10)
logoFrame.BackgroundColor3 = BACK
logoFrame.BorderSizePixel = 0
logoFrame.Parent = sidebar
local logoCorner = Instance.new("UICorner", logoFrame); logoCorner.CornerRadius = UDim.new(0,10)

-- Logo image (use your asset id)
local logoImg = Instance.new("ImageLabel")
logoImg.Size = UDim2.new(0, 80, 0, 80)
logoImg.Position = UDim2.new(0, 12, 0, 12)
logoImg.BackgroundTransparency = 1
logoImg.Image = "rbxassetid://76555629219158" -- می‌تونی آیدی لوگوی خودت بذاری
logoImg.Parent = logoFrame

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -110, 0, 40)
title.Position = UDim2.new(0, 100, 0, 18)
title.BackgroundTransparency = 1
title.Text = "PersianScript's"
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.TextColor3 = TEXT
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = logoFrame

-- sidebar buttons (tabs)
local tabs = {"Information","Main","Item","Stats","Fun"}
local tabButtons = {}
for i, name in ipairs(tabs) do
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(1, -20, 0, 40)
	btn.Position = UDim2.new(0, 10, 0, 130 + (i-1)*50)
	btn.BackgroundColor3 = BACK
	btn.BorderSizePixel = 0
	btn.Text = "  "..name
	btn.Font = Enum.Font.Gotham
	btn.TextSize = 18
	btn.TextColor3 = TEXT
	btn.TextXAlignment = Enum.TextXAlignment.Left
	btn.Parent = sidebar
	local corner = Instance.new("UICorner", btn); corner.CornerRadius = UDim.new(0,8)
	
	-- left radio circle
	local dot = Instance.new("Frame", btn)
	dot.Size = UDim2.new(0, 14, 0, 14)
	dot.Position = UDim2.new(0, 8, 0, 13)
	dot.BackgroundColor3 = BACK
	dot.BorderSizePixel = 2
	dot.BorderColor3 = ACCENT
	local dotCorner = Instance.new("UICorner", dot); dotCorner.CornerRadius = UDim.new(1,0)
	
	tabButtons[name] = btn
end

-- right content area
local content = Instance.new("Frame")
content.Size = UDim2.new(1, -230, 1, -20)
content.Position = UDim2.new(0, 220, 0, 10)
content.BackgroundTransparency = 1
content.Parent = main

-- helper: create section box with header
local function CreateSection(titleText, y)
	local sect = Instance.new("Frame")
	sect.Size = UDim2.new(1, -20, 0, 60)
	sect.Position = UDim2.new(0, 10, 0, y)
	sect.BackgroundColor3 = BACK
	sect.Parent = content
	local c1 = Instance.new("UICorner", sect); c1.CornerRadius = UDim.new(0,8)
	local header = Instance.new("TextLabel", sect)
	header.Size = UDim2.new(1, -20, 0, 24)
	header.Position = UDim2.new(0,10,0,6)
	header.BackgroundTransparency = 1
	header.Text = titleText
	header.Font = Enum.Font.GothamBold
	header.TextSize = 16
	header.TextColor3 = TEXT
	header.TextXAlignment = Enum.TextXAlignment.Left
	return sect
end

-- pages content tables
local pages = {}

-- Information page
pages["Information"] = Instance.new("Frame", content)
pages["Information"].Size = UDim2.new(1,0,1,0)
pages["Information"].BackgroundTransparency = 1

local infoText = Instance.new("TextLabel", pages["Information"])
infoText.Size = UDim2.new(1, -40, 0, 120)
infoText.Position = UDim2.new(0,20,0,20)
infoText.BackgroundTransparency = 1
infoText.TextWrapped = true
infoText.TextColor3 = TEXT
infoText.Font = Enum.Font.Gotham
infoText.TextSize = 16
infoText.Text = "Welcome to PersianScript's Hub!\n\nThis UI is a demo-styled hub for your channel. Controls are placeholders for safe testing and dev automation. Do not use on live servers for cheating."
infoText.Parent = pages["Information"]

-- Main page (with AutoFarm/AutoQuest toggles as placeholders)
pages["Main"] = Instance.new("Frame", content)
pages["Main"].Size = UDim2.new(1,0,1,0)
pages["Main"].BackgroundTransparency = 1
pages["Main"].Visible = false

local sec1 = CreateSection("Main - Automations (Demo)", 10)
sec1.Parent = pages["Main"]

local function CreateCheckbox(parent, x, y, labelText)
	local row = Instance.new("Frame", parent)
	row.Size = UDim2.new(1, -20, 0, 30)
	row.Position = UDim2.new(0, 10, 0, 30 + y)
	row.BackgroundTransparency = 1
	local cb = Instance.new("TextButton", row)
	cb.Size = UDim2.new(0, 24, 0, 24)
	cb.Position = UDim2.new(0, 0, 0, 3)
	cb.Text = ""
	cb.BackgroundColor3 = BACK
	cb.BorderSizePixel = 2
	cb.BorderColor3 = OUTLINE
	local corner = Instance.new("UICorner", cb); corner.CornerRadius = UDim.new(0,4)
	local lab = Instance.new("TextLabel", row)
	lab.Size = UDim2.new(1, -40, 1, 0)
	lab.Position = UDim2.new(0, 36, 0, 0)
	lab.BackgroundTransparency = 1
	lab.Text = labelText
	lab.Font = Enum.Font.Gotham
	lab.TextSize = 16
	lab.TextColor3 = TEXT
	return cb
end

local cbAutoFarm = CreateCheckbox(sec1, 0, 0, "AutoFarm (Demo)")
local cbAutoQuest = CreateCheckbox(sec1, 0, 40, "AutoQuest (Demo)")
local cbRemoveHitSound = CreateCheckbox(sec1, 0, 80, "Remove Hit Sound (Demo)")

-- small functions (placeholders)
local function notify(msg)
	-- small popup
	local popup = Instance.new("Frame", gui)
	popup.Size = UDim2.new(0, 300, 0, 50)
	popup.Position = UDim2.new(0.5, -150, 0.9, 0)
	popup.BackgroundColor3 = Color3.fromRGB(30,30,38)
	popup.AnchorPoint = Vector2.new(0.5,0)
	local pc = Instance.new("UICorner", popup); pc.CornerRadius = UDim.new(0,8)
	local txt = Instance.new("TextLabel", popup)
	txt.Size = UDim2.new(1, -20, 1, -10)
	txt.Position = UDim2.new(0,10,0,5)
	txt.BackgroundTransparency = 1
	txt.Text = msg
	txt.Font = Enum.Font.Gotham
	txt.TextSize = 16
	txt.TextColor3 = TEXT
	delay(2, function()
		popup:Destroy()
	end)
end

-- state toggles
local state = {
	AutoFarm = false,
	AutoQuest = false,
	RemoveHit = false,
}

local function toggleState(name, btn)
	state[name] = not state[name]
	if state[name] then
		btn.BackgroundColor3 = ACCENT
		btn.BorderColor3 = ACCENT
		notify(name.." enabled (demo)")
		print(name.." enabled")
		-- TODO: جای مناسب برای قرار دادن منطق ایمن تست یا فراخوانی سرور
		-- مثال: game.ReplicatedStorage:WaitForChild("DevRun"):FireServer("AutoFarmToggle", true)
	else
		btn.BackgroundColor3 = BACK
		btn.BorderColor3 = OUTLINE
		notify(name.." disabled")
		print(name.." disabled")
		-- TODO: قطع منطق تست
	end
end

cbAutoFarm.MouseButton1Click:Connect(function() toggleState("AutoFarm", cbAutoFarm) end)
cbAutoQuest.MouseButton1Click:Connect(function() toggleState("AutoQuest", cbAutoQuest) end)
cbRemoveHitSound.MouseButton1Click:Connect(function() toggleState("RemoveHitSound", cbRemoveHitSound) end)

-- Example Item/Stats/Fun pages (placeholders)
for _,pName in ipairs({"Item","Stats","Fun"}) do
	pages[pName] = Instance.new("Frame", content)
	pages[pName].Size = UDim2.new(1,0,1,0)
	pages[pName].BackgroundTransparency = 1
	pages[pName].Visible = false
	local lbl = Instance.new("TextLabel", pages[pName])
	lbl.Size = UDim2.new(1, -40, 0, 40)
	lbl.Position = UDim2.new(0,20,0,20)
	lbl.BackgroundTransparency = 1
	lbl.Text = pName.." - Demo Controls"
	lbl.Font = Enum.Font.GothamBold
	lbl.TextSize = 18
	lbl.TextColor3 = TEXT
end

-- tab switching
for name, btn in pairs(tabButtons) do
	btn.MouseButton1Click:Connect(function()
		for k,v in pairs(pages) do v.Visible = false end
		if pages[name] then pages[name].Visible = true end
		-- visual active state
		for n,b in pairs(tabButtons) do
			b.BackgroundColor3 = BACK
			b.TextColor3 = TEXT
		end
		btn.BackgroundColor3 = Color3.fromRGB(30,10,10)
		btn.TextColor3 = ACCENT
	end)
end

-- default active tab
tabButtons["Main"].BackgroundColor3 = Color3.fromRGB(30,10,10)
tabButtons["Main"].TextColor3 = ACCENT
pages["Main"].Visible = true

-- Drag the whole main (touch + mouse)
local dragging = false
local dragInput, startPos, startMouse
main.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		startMouse = input.Position
		startPos = main.Position
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)
main.InputChanged:Connect(function(input)
	if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
		dragInput = input
	end
end)
game:GetService("UserInputService").InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		local delta = input.Position - startMouse
		main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
end)

-- small footer with channel name
local footer = Instance.new("TextLabel", main)
footer.Size = UDim2.new(0, 300, 0, 24)
footer.Position = UDim2.new(1, -310, 1, -34)
footer.BackgroundTransparency = 1
footer.Text = "Channel: PersianScript's  •  Demo Hub"
footer.Font = Enum.Font.Gotham
footer.TextSize = 14
footer.TextColor3 = Color3.fromRGB(180,180,180)
footer.TextXAlignment = Enum.TextXAlignment.Right

print("PersianScript's Hub loaded (demo). Edit placeholder functions to add safe dev/test logic.")
