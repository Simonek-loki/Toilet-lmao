--https://github.com/Mokiros/roblox-FE-compatibility
if game:GetService("RunService"):IsClient() then error("Script must be server-side in order to work; use h/ and not hl/") end
local Player,game,owner = owner,game
local RealPlayer = Player
do
	print("FE Compatibility code V2 by Mokiros")
	local RealPlayer = RealPlayer
	script.Parent = RealPlayer.Character

	--Fake event to make stuff like Mouse.KeyDown work
	local Disconnect_Function = function(this)
		this[1].Functions[this[2]] = nil
	end
	local Disconnect_Metatable = {__index={disconnect=Disconnect_Function,Disconnect=Disconnect_Function}}
	local FakeEvent_Metatable = {__index={
		Connect = function(this,f)
			local i = tostring(math.random(0,10000))
			while this.Functions[i] do
				i = tostring(math.random(0,10000))
			end
			this.Functions[i] = f
			return setmetatable({this,i},Disconnect_Metatable)
		end
	}}
	FakeEvent_Metatable.__index.connect = FakeEvent_Metatable.__index.Connect
	local function fakeEvent()
		return setmetatable({Functions={}},FakeEvent_Metatable)
	end

	--Creating fake input objects with fake variables
	local FakeMouse = {Hit=CFrame.new(),KeyUp=fakeEvent(),KeyDown=fakeEvent(),Button1Up=fakeEvent(),Button1Down=fakeEvent(),Button2Up=fakeEvent(),Button2Down=fakeEvent()}
	FakeMouse.keyUp = FakeMouse.KeyUp
	FakeMouse.keyDown = FakeMouse.KeyDown
	local UIS = {InputBegan=fakeEvent(),InputEnded=fakeEvent()}
	local CAS = {Actions={},BindAction=function(self,name,fun,touch,...)
		CAS.Actions[name] = fun and {Name=name,Function=fun,Keys={...}} or nil
	end}
	--Merged 2 functions into one by checking amount of arguments
	CAS.UnbindAction = CAS.BindAction

	--This function will trigger the events that have been :Connect()'ed
	local function TriggerEvent(self,ev,...)
		for _,f in pairs(self[ev].Functions) do
			f(...)
		end
	end
	FakeMouse.TriggerEvent = TriggerEvent
	UIS.TriggerEvent = TriggerEvent

	--Client communication
	local Event = Instance.new("RemoteEvent")
	Event.Name = "UserInput_Event"
	Event.OnServerEvent:Connect(function(plr,io)
		if plr~=RealPlayer then return end
		FakeMouse.Target = io.Target
		FakeMouse.Hit = io.Hit
		if not io.isMouse then
			local b = io.UserInputState == Enum.UserInputState.Begin
			if io.UserInputType == Enum.UserInputType.MouseButton1 then
				return FakeMouse:TriggerEvent(b and "Button1Down" or "Button1Up")
			end
			if io.UserInputType == Enum.UserInputType.MouseButton2 then
				return FakeMouse:TriggerEvent(b and "Button2Down" or "Button2Up")
			end
			for _,t in pairs(CAS.Actions) do
				for _,k in pairs(t.Keys) do
					if k==io.KeyCode then
						t.Function(t.Name,io.UserInputState,io)
					end
				end
			end
			FakeMouse:TriggerEvent(b and "KeyDown" or "KeyUp",io.KeyCode.Name:lower())
			UIS:TriggerEvent(b and "InputBegan" or "InputEnded",io,false)
		end
	end)
	Event.Parent = NLS([==[local Event = script:WaitForChild("UserInput_Event")
	local Mouse = owner:GetMouse()
	local UIS = game:GetService("UserInputService")
	local input = function(io,RobloxHandled)
		if RobloxHandled then return end
		--Since InputObject is a client-side instance, we create and pass table instead
		Event:FireServer({KeyCode=io.KeyCode,UserInputType=io.UserInputType,UserInputState=io.UserInputState,Hit=Mouse.Hit,Target=Mouse.Target})
	end
	UIS.InputBegan:Connect(input)
	UIS.InputEnded:Connect(input)

	local h,t
	--Give the server mouse data every second frame, but only if the values changed
	--If player is not moving their mouse, client won't fire events
	local HB = game:GetService("RunService").Heartbeat
	while true do
		if h~=Mouse.Hit or t~=Mouse.Target then
			h,t=Mouse.Hit,Mouse.Target
			Event:FireServer({isMouse=true,Target=t,Hit=h})
		end
		--Wait 2 frames
		for i=1,2 do
			HB:Wait()
		end
	end]==],script)

	----Sandboxed game object that allows the usage of client-side methods and services
	--Real game object
	local RealGame = game

	--Metatable for fake service
	local FakeService_Metatable = {
		__index = function(self,k)
			local s = rawget(self,"_RealService")
			if s then
				return typeof(s[k])=="function"
					and function(_,...)return s[k](s,...)end or s[k]
			end
		end,
		__newindex = function(self,k,v)
			local s = rawget(self,"_RealService")
			if s then s[k]=v end
		end
	}
	local function FakeService(t,RealService)
		t._RealService = typeof(RealService)=="string" and RealGame:GetService(RealService) or RealService
		return setmetatable(t,FakeService_Metatable)
	end

	--Fake game object
	local FakeGame = {
		GetService = function(self,s)
			return rawget(self,s) or RealGame:GetService(s)
		end,
		Players = FakeService({
			LocalPlayer = FakeService({GetMouse=function(self)return FakeMouse end},Player)
		},"Players"),
		UserInputService = FakeService(UIS,"UserInputService"),
		ContextActionService = FakeService(CAS,"ContextActionService"),
		RunService = FakeService({
			_btrs = {},
			RenderStepped = RealGame:GetService("RunService").Heartbeat,
			BindToRenderStep = function(self,name,_,fun)
				self._btrs[name] = self.Heartbeat:Connect(fun)
			end,
			UnbindFromRenderStep = function(self,name)
				self._btrs[name]:Disconnect()
			end,
		},"RunService")
	}
	rawset(FakeGame.Players,"localPlayer",FakeGame.Players.LocalPlayer)
	FakeGame.service = FakeGame.GetService
	FakeService(FakeGame,game)
	--Changing owner to fake player object to support owner:GetMouse()
	game,owner = FakeGame,FakeGame.Players.LocalPlayer
end

local char = owner.Character or owner.CharacterAdded:Wait()
local mouse = owner:GetMouse()
local hum = char:FindFirstChildWhichIsA("Humanoid")
local ms = game:GetService("MarketplaceService")
hum.MaxHealth = math.huge

local musicIds = {
	7346959750;
	5146076857;
	4159840042;
	6456889294;
}

local sound = Instance.new("Sound")
sound.Parent = char.HumanoidRootPart
sound.SoundId = "rbxassetid://" .. tostring(musicIds[math.random(1,#musicIds)])
sound:Play()
sound.Volume = 0.8

local boom = Instance.new("Sound")
boom.Parent = char.HumanoidRootPart
boom.SoundId = "rbxassetid://7147226095"

sound.Ended:Connect(function()
	boom:Play()
	sound.SoundId = "rbxassetid://" .. musicIds[math.random(1,#musicIds)]
	sound:Play()
end)

local RightLegWeld = Instance.new("Weld")
RightLegWeld.Parent = char["Torso"]
RightLegWeld.Name = "RightLegWeld"
RightLegWeld.Part0 = char["Torso"]
RightLegWeld.Part1 = char["Right Leg"]
RightLegWeld.C0 = char.Torso["Right Hip"].C0
RightLegWeld.C1 = char.Torso["Right Hip"].C1

local LeftLegWeld = Instance.new("Weld")
LeftLegWeld.Parent = char["Torso"]
LeftLegWeld.Name = "RightLegWeld"
LeftLegWeld.Part0 = char["Torso"]
LeftLegWeld.Part1 = char["Left Leg"]
LeftLegWeld.C0 = char.Torso["Left Hip"].C0
LeftLegWeld.C1 = char.Torso["Left Hip"].C1

local TorsoWeld = Instance.new("Weld")
TorsoWeld.Parent = char["HumanoidRootPart"]
TorsoWeld.Name = "TorsoWeld"
TorsoWeld.Part0 = char["HumanoidRootPart"]
TorsoWeld.Part1 = char["Torso"]
TorsoWeld.C0 = char.HumanoidRootPart["RootJoint"].C0
TorsoWeld.C1 = char.HumanoidRootPart["RootJoint"].C1

TorsoWeld.C0 = char.HumanoidRootPart["RootJoint"].C0 * CFrame.new(0, 0.8, 0.4)
RightLegWeld.C0 = char.Torso["Right Hip"].C0 * CFrame.Angles(0, 0, math.rad(90.012))
LeftLegWeld.C0 = char.Torso["Left Hip"].C0 * CFrame.Angles(0, 0, math.rad(-90.012))

Toilet = Instance.new("Part")
SpecialMesh1 = Instance.new("SpecialMesh")
Toilet.Name = "Toilet"
Toilet.Parent = char
Toilet.CFrame = char.HumanoidRootPart.CFrame * CFrame.Angles(0,math.rad(char.HumanoidRootPart.Orientation.Y - 90), 0) - Vector3.new(0,1.5,0)
Toilet.Size = Vector3.new(3.2580299377441, 3.451761007309, 2.1790940761566)
Toilet.BottomSurface = Enum.SurfaceType.Smooth
Toilet.CanCollide = false
Toilet.TopSurface = Enum.SurfaceType.Smooth
SpecialMesh1.Parent = Toilet
SpecialMesh1.MeshId = "rbxassetid://4718140898"
SpecialMesh1.MeshType = Enum.MeshType.FileMesh

BillboardGui0 = Instance.new("BillboardGui")
TextLabel1 = Instance.new("TextLabel")
TextLabel2 = Instance.new("TextLabel")
BillboardGui0.Parent = char.Head
BillboardGui0.LightInfluence = 1
BillboardGui0.Size = UDim2.new(8, 0, 2, 0)
BillboardGui0.Active = true
BillboardGui0.ClipsDescendants = true
BillboardGui0.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
BillboardGui0.AlwaysOnTop = true
BillboardGui0.StudsOffset = Vector3.new(0, 3, 0)
TextLabel1.Name = "SongName"
TextLabel1.Parent = BillboardGui0
TextLabel1.Size = UDim2.new(1, 0, 0.5, 0)
TextLabel1.BackgroundColor = BrickColor.new("Institutional white")
TextLabel1.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel1.BackgroundTransparency = 1
TextLabel1.Font = Enum.Font.FredokaOne
TextLabel1.FontSize = Enum.FontSize.Size14
TextLabel1.Text = "No song playing"
TextLabel1.TextColor = BrickColor.new("Toothpaste")
TextLabel1.TextColor3 = Color3.new(0, 1, 1)
TextLabel1.TextScaled = true
TextLabel1.TextSize = 14
TextLabel1.TextStrokeTransparency = 0
TextLabel1.TextWrap = true
TextLabel1.TextWrapped = true
TextLabel2.Name = "AuthorName"
TextLabel2.Parent = BillboardGui0
TextLabel2.Position = UDim2.new(0.150000006, 0, 0.5, 0)
TextLabel2.Size = UDim2.new(0.699999988, 0, 0.300000012, 0)
TextLabel2.BackgroundColor = BrickColor.new("Institutional white")
TextLabel2.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel2.BackgroundTransparency = 1
TextLabel2.Font = Enum.Font.FredokaOne
TextLabel2.FontSize = Enum.FontSize.Size14
TextLabel2.Text = "Author"
TextLabel2.TextColor = BrickColor.new("Hot pink")
TextLabel2.TextColor3 = Color3.new(1, 0, 1)
TextLabel2.TextScaled = true
TextLabel2.TextSize = 14
TextLabel2.TextStrokeTransparency = 0
TextLabel2.TextWrap = true
TextLabel2.TextWrapped = true

WeldToilet = Instance.new("WeldConstraint")
WeldToilet.Parent = char.HumanoidRootPart
WeldToilet.Part0 = char.HumanoidRootPart
WeldToilet.Part1 = Toilet

coroutine.resume(coroutine.create(function()
	while task.wait() do
		sound.Volume = math.clamp(sound.PlaybackLoudness / 35, 0.3, 1)
		hum.Health = hum.MaxHealth
		hum.Name = game:GetService("HttpService"):GenerateGUID(false)
		local songData = ms:GetProductInfo(tonumber(string.sub(sound.SoundId, 13, #sound.SoundId)))
		TextLabel1.Text = "Playing right now : " .. songData.Name
		TextLabel2.Text = "Author : " .. songData.Creator.Name
	end
end))
