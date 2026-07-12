local P = game:GetService("Players"); local TS = game:GetService("TweenService"); local TCS = game:GetService("TextChatService"); local RS = game:GetService("ReplicatedStorage"); local lp = P.LocalPlayer; local pg = lp:WaitForChild("PlayerGui"); if pg:FindFirstChild("AccChat") then pg.AccChat:Destroy() end; local function send(msg) if msg == "" then return end; if TCS.ChatVersion == Enum.ChatVersion.TextChatService then local ch = TCS:FindFirstChild("TextChannels") and TCS.TextChannels:FindFirstChild("RBXGeneral"); if ch then ch:SendAsync(msg) return end end; local r1 = RS:FindFirstChild("DefaultChatSystemChatEvents") and RS.DefaultChatSystemChatEvents:FindFirstChild("SayMessageRequest"); if r1 and r1:IsA("RemoteEvent") then r1:FireServer(msg, "All") return end; local r2 = RS:FindFirstChild("Chat") or RS:FindFirstChild("ChatEvent"); if r2 and r2:IsA("RemoteEvent") then r2:FireServer(msg) end end; local sg = Instance.new("ScreenGui"); sg.Name = "AccChat"; sg.ResetOnSpawn = false; sg.Parent = pg; local mf = Instance.new("Frame"); mf.Size = UDim2.new(0, 310, 0, 180); mf.Position = UDim2.new(0.5, -155, 0.4, -90); mf.BackgroundColor3 = Color3.fromRGB(25, 25, 30); mf.BackgroundTransparency = 0.25; mf.Active = true; mf.Draggable = true; mf.Parent = sg; local mc = Instance.new("UICorner"); mc.CornerRadius = UDim.new(0, 8); mc.Parent = mf; local tl = Instance.new("TextLabel"); tl.Size = UDim2.new(0, 120, 0, 25); tl.Position = UDim2.new(0, 8, 0, 0); tl.BackgroundTransparency = 1; tl.Text = "Accessible Chat"; tl.TextColor3 = Color3.fromRGB(255, 255, 255); tl.TextSize = 13; tl.Font = Enum.Font.SourceSansBold; tl.TextXAlignment = Enum.TextXAlignment.Left; tl.Parent = mf; local auth = Instance.new("TextLabel"); auth.Size = UDim2.new(0, 100, 0, 25); auth.Position = UDim2.new(1, -150, 0, 0); auth.BackgroundTransparency = 1; auth.Text = "By: FaiZi_UwU"; auth.TextColor3 = Color3.fromRGB(136, 136, 136); auth.TextSize = 12; auth.Font = Enum.Font.SourceSans; auth.TextXAlignment = Enum.TextXAlignment.Right; auth.Parent = mf; local mb = Instance.new("TextButton"); mb.Size = UDim2.new(0, 20, 0, 20); mb.Position = UDim2.new(1, -44, 0, 3); mb.BackgroundTransparency = 1; mb.Text = "_"; mb.TextColor3 = Color3.fromRGB(150, 150, 150); mb.TextSize = 14; mb.Font = Enum.Font.SourceSansBold; mb.Parent = mf; local cb = Instance.new("TextButton"); cb.Size = UDim2.new(0, 20, 0, 20); cb.Position = UDim2.new(1, -22, 0, 3); cb.BackgroundTransparency = 1; cb.Text = "×"; cb.TextColor3 = Color3.fromRGB(150, 150, 150); cb.TextSize = 16; cb.Font = Enum.Font.SourceSansBold; cb.Parent = mf; local ob = Instance.new("TextButton"); ob.Size = UDim2.new(0, 32, 0, 32); ob.Position = UDim2.new(0.5, -16, 0.4, -16); ob.BackgroundColor3 = Color3.fromRGB(25, 25, 30); ob.BackgroundTransparency = 0.25; ob.Text = "💬"; ob.TextColor3 = Color3.fromRGB(0, 180, 160); ob.TextSize = 16; ob.Font = Enum.Font.SourceSansBold; ob.Visible = false; ob.Draggable = true; ob.Parent = sg; local oc = Instance.new("UICorner"); oc.CornerRadius = UDim.new(0, 8); oc.Parent = ob; local lb = Instance.new("ScrollingFrame"); lb.Size = UDim2.new(1, -16, 0, 110); lb.Position = UDim2.new(0, 8, 0, 28); lb.BackgroundColor3 = Color3.fromRGB(35, 35, 40); lb.BackgroundTransparency = 0.3; lb.BorderSizePixel = 0; lb.CanvasSize = UDim2.new(0, 0, 0, 0); lb.ScrollBarThickness = 3; lb.Parent = mf; local lc = Instance.new("UICorner"); lc.CornerRadius = UDim.new(0, 4); lc.Parent = lb; local ll = Instance.new("UIListLayout"); ll.SortOrder = Enum.SortOrder.LayoutOrder; ll.Padding = UDim.new(0, 4); ll.Parent = lb; local function add(name, text) local l = Instance.new("TextLabel"); l.Size = UDim2.new(1, -10, 0, 0); l.AutomaticSize = Enum.AutomaticSize.Y; l.BackgroundTransparency = 1; l.Text = "<b>[" .. name .. "]:</b> " .. text; l.TextColor3 = Color3.fromRGB(240, 240, 240); l.TextSize = 13; l.Font = Enum.Font.SourceSans; l.RichText = true; l.TextWrapped = true; l.TextXAlignment = Enum.TextXAlignment.Left; l.Parent = lb; lb.CanvasSize = UDim2.new(0, 0, 0, ll.AbsoluteContentSize.Y + 10); lb.CanvasPosition = Vector2.new(0, ll.AbsoluteContentSize.Y) end; local tb = Instance.new("TextBox"); tb.Size = UDim2.new(1, -85, 0, 26); tb.Position = UDim2.new(0, 8, 0, 146); tb.BackgroundColor3 = Color3.fromRGB(45, 45, 50); tb.BackgroundTransparency = 0.2; tb.Text = ""; tb.PlaceholderText = "Напишите сообщение..."; tb.TextColor3 = Color3.fromRGB(255, 255, 255); tb.PlaceholderColor3 = Color3.fromRGB(120, 120, 120); tb.TextSize = 13; tb.Font = Enum.Font.SourceSans; tb.Parent = mf; local tc = Instance.new("UICorner"); tc.CornerRadius = UDim.new(0, 4); tc.Parent = tb; local sb = Instance.new("TextButton"); sb.Size = UDim2.new(0, 70, 0, 26); sb.Position = UDim2.new(1, -78, 0, 146); sb.BackgroundColor3 = Color3.fromRGB(0, 130, 115); sb.Text = "ОТПРАВИТЬ"; sb.TextColor3 = Color3.fromRGB(255, 255, 255); sb.TextSize = 11; sb.Font = Enum.Font.SourceSansBold; sb.Parent = mf; local bc = Instance.new("UICorner"); bc.CornerRadius = UDim.new(0, 4); bc.Parent = sb; local cf = Instance.new("Frame"); cf.Size = UDim2.new(0, 250, 0, 90); cf.Position = UDim2.new(0.5, -125, 0.5, -45); cf.BackgroundColor3 = Color3.fromRGB(30, 30, 35); cf.Visible = false; cf.ZIndex = 5; cf.Parent = sg; local cc = Instance.new("UICorner"); cc.CornerRadius = UDim.new(0, 8); cc.Parent = cf; local ct = Instance.new("TextLabel"); ct.Size = UDim2.new(1, -20, 0, 40); ct.Position = UDim2.new(0, 10, 0, 5); ct.BackgroundTransparency = 1; ct.Text = "Are you sure you want to swipe the script?"; ct.TextColor3 = Color3.fromRGB(230, 230, 230); ct.TextSize = 13; ct.Font = Enum.Font.SourceSansBold; ct.TextWrapped = true; ct.ZIndex = 5; ct.Parent = cf; local yb = Instance.new("TextButton"); yb.Size = UDim2.new(0, 100, 0, 28); yb.Position = UDim2.new(0, 15, 0, 50); yb.BackgroundColor3 = Color3.fromRGB(25, 25, 30); yb.Text = "Да"; yb.TextColor3 = Color3.fromRGB(150, 150, 150); yb.TextSize = 13; yb.Font = Enum.Font.SourceSansBold; yb.ZIndex = 5; yb.Parent = cf; local yc = Instance.new("UICorner"); yc.CornerRadius = UDim.new(0, 6); yc.Parent = yb; local nb = Instance.new("TextButton"); nb.Size = UDim2.new(0, 100, 0, 28); nb.Position = UDim2.new(1, -115, 0, 50); nb.BackgroundColor3 = Color3.fromRGB(0, 150, 136); nb.Text = "Нет"; nb.TextColor3 = Color3.fromRGB(255, 255, 255); nb.TextSize = 13; nb.Font = Enum.Font.SourceSansBold; nb.ZIndex = 5; nb.Parent = cf; local nc = Instance.new("UICorner"); nc.CornerRadius = UDim.new(0, 6); nc.Parent = nb; mb.MouseButton1Click:Connect(function() ob.Position = mf.Position; mf.Visible = false; ob.Visible = true end); ob.MouseButton1Click:Connect(function() mf.Position = ob.Position; ob.Visible = false; mf.Visible = true end); cb.MouseButton1Click:Connect(function() cf.Visible = true end); nb.MouseButton1Click:Connect(function() cf.Visible = false end); yb.MouseButton1Click:Connect(function() sg:Destroy() end); local function onSend() local text = tb.Text; if text ~= "" then send(text); tb.Text = "" end end; sb.MouseButton1Click:Connect(onSend); tb.FocusLost:Connect(function(ep) if ep then onSend() end end); if TCS.ChatVersion == Enum.ChatVersion.TextChatService then local channels = TCS:FindFirstChild("TextChannels"); if channels then for _, c in ipairs(channels:GetChildren()) do if c:IsA("TextChannel") then c.MessageReceived:Connect(function(m) if m.TextSource and m.Text ~= "" then add(m.TextSource.Name, m.Text) end end) end end channels.ChildAdded:Connect(function(c) if c:IsA("TextChannel") then c.MessageReceived:Connect(function(m) if m.TextSource and m.Text ~= "" then add(m.TextSource.Name, m.Text) end end) end end) end else local rm = RS:FindFirstChild("DefaultChatSystemChatEvents"); if rm then local om = rm:FindFirstChild("OnMessageDoneFiltering"); if om and om:IsA("RemoteEvent") then om.OnClientEvent:Connect(function(d) if d and d.FromPlayer and d.Message then add(d.FromPlayer.Name or tostring(d.FromPlayer), tostring(d.Message)) end end) end end end; add("Система", "Welcome to the chat!");
end
	
	local legacyRemote = ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents") and ReplicatedStorage.DefaultChatSystemChatEvents:FindFirstChild("SayMessageRequest")
	if legacyRemote and legacyRemote:IsA("RemoteEvent") then
		legacyRemote:FireServer(message, "All")
		return
	end
	
	local chatEvent = ReplicatedStorage:FindFirstChild("Chat")
	if chatEvent and chatEvent:IsA("RemoteEvent") then
		chatEvent:FireServer(message)
		return
	end
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MiniChatSender"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = PlayerGui

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 200, 0, 75)
MainFrame.Position = UDim2.new(0.5, -100, 0.4, -37)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Visible = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 6)
MainCorner.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -30, 0, 22)
Title.BackgroundTransparency = 1
Title.Text = "  Chat Mini"
Title.TextColor3 = Color3.fromRGB(180, 180, 180)
Title.TextSize = 12
Title.Font = Enum.Font.SourceSansBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = MainFrame

local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Size = UDim2.new(0, 20, 0, 20)
MinimizeButton.Position = UDim2.new(1, -22, 0, 2)
MinimizeButton.BackgroundTransparency = 1
MinimizeButton.Text = "_"
MinimizeButton.TextColor3 = Color3.fromRGB(150, 150, 150)
MinimizeButton.TextSize = 14
MinimizeButton.Font = Enum.Font.SourceSansBold
MinimizeButton.Parent = MainFrame

local OpenButton = Instance.new("TextButton")
OpenButton.Size = UDim2.new(0, 25, 0, 25)
OpenButton.Position = UDim2.new(0.5, -12, 0.4, -12)
OpenButton.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
OpenButton.BorderSizePixel = 0
OpenButton.Text = "C"
OpenButton.TextColor3 = Color3.fromRGB(0, 180, 160)
OpenButton.TextSize = 14
OpenButton.Font = Enum.Font.SourceSansBold
OpenButton.Visible = false
OpenButton.Draggable = true
OpenButton.Parent = ScreenGui

local OpenCorner = Instance.new("UICorner")
OpenCorner.CornerRadius = UDim.new(0, 6)
OpenCorner.Parent = OpenButton

local TextBox = Instance.new("TextBox")
TextBox.Size = UDim2.new(1, -16, 0, 22)
TextBox.Position = UDim2.new(0, 8, 0, 22)
TextBox.BackgroundColor3 = Color3.fromRGB(45, 45, 50)
TextBox.BorderSizePixel = 0
TextBox.Text = ""
TextBox.PlaceholderText = "Текст..."
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.PlaceholderColor3 = Color3.fromRGB(120, 120, 120)
TextBox.TextSize = 13
TextBox.Font = Enum.Font.SourceSans
TextBox.Parent = MainFrame

local TextBoxCorner = Instance.new("UICorner")
TextBoxCorner.CornerRadius = UDim.new(0, 4)
TextBoxCorner.Parent = TextBox

local SendButton = Instance.new("TextButton")
SendButton.Size = UDim2.new(1, -16, 0, 20)
SendButton.Position = UDim2.new(0, 8, 0, 48)
SendButton.BackgroundColor3 = Color3.fromRGB(0, 130, 115)
SendButton.BorderSizePixel = 0
SendButton.Text = "ОТПРАВИТЬ"
SendButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SendButton.TextSize = 12
SendButton.Font = Enum.Font.SourceSansBold
SendButton.Parent = MainFrame

local ButtonCorner = Instance.new("UICorner")
ButtonCorner.CornerRadius = UDim.new(0, 4)
ButtonCorner.Parent = SendButton

SendButton.MouseEnter:Connect(function()
	TweenService:Create(SendButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(0, 160, 140)}):Play()
end)
SendButton.MouseLeave:Connect(function()
	TweenService:Create(SendButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(0, 130, 115)}):Play()
end)

MinimizeButton.MouseEnter:Connect(function() MinimizeButton.TextColor3 = Color3.fromRGB(255, 100, 100) end)
MinimizeButton.MouseLeave:Connect(function() MinimizeButton.TextColor3 = Color3.fromRGB(150, 150, 150) end)

MinimizeButton.MouseButton1Click:Connect(function()
	OpenButton.Position = MainFrame.Position
	MainFrame.Visible = false
	OpenButton.Visible = true
end)

OpenButton.MouseButton1Click:Connect(function()
	MainFrame.Position = OpenButton.Position
	OpenButton.Visible = false
	MainFrame.Visible = true
end)

SendButton.MouseButton1Click:Connect(function()
	local text = TextBox.Text
	if text ~= "" then
		sendChatMessage(text)
		TextBox.Text = ""
	end
end)

TextBox.FocusLost:Connect(function(enterPressed)
	if enterPressed then
		local text = TextBox.Text
		if text ~= "" then
			sendChatMessage(text)
			TextBox.Text = ""
		end
	end
end)
