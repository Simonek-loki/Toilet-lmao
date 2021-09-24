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
local TS = game:GetService("TweenService")
local fardDbc = false

--Lets set up floppy arms lol

local RAA1 = Instance.new("Attachment")
RAA1.Parent = char.Torso
RAA1.CFrame = char.Torso["Right Shoulder"].C0

local RAA2 = Instance.new("Attachment")
RAA2.Parent = char["Right Arm"]
RAA2.CFrame = char.Torso["Right Shoulder"].C1

local LAA1 = Instance.new("Attachment")
LAA1.Parent = char.Torso
LAA1.CFrame = char.Torso["Left Shoulder"].C0

local LAA2 = Instance.new("Attachment")
LAA2.Parent = char["Left Arm"]
LAA2.CFrame = char.Torso["Left Shoulder"].C1

local Socket1 = Instance.new("BallSocketConstraint")
Socket1.Parent = char.Torso
Socket1.Attachment0 = RAA1
Socket1.Attachment1 = RAA2
Socket1.LimitsEnabled = true
Socket1.TwistLimitsEnabled = true
Socket1.TwistLowerAngle = -180
Socket1.TwistUpperAngle = 0

local Socket2 = Instance.new("BallSocketConstraint")
Socket2.Parent = char.Torso
Socket2.Attachment0 = LAA1
Socket2.Attachment1 = LAA2
Socket2.LimitsEnabled = true
Socket2.TwistLimitsEnabled = true
Socket2.TwistLowerAngle = -180
Socket2.TwistUpperAngle = 0

char.Torso["Right Shoulder"].Enabled = false
char.Torso["Left Shoulder"].Enabled = false

local Collider1 = Instance.new("Part", char)
Collider1.Name = "RagdollPart"
Collider1.Transparency = 1
Collider1.Size = Vector3.new(0.8,0.8,0.8)
Collider1.CanCollide = true
Collider1.Anchored = false
Collider1.Massless = true
Collider1.CFrame = char["Right Arm"].CFrame - Vector3.new(0,0.6,0)

local CWeld1 = Instance.new("WeldConstraint", char["Right Arm"])
CWeld1.Part0 = char["Right Arm"]
CWeld1.Part1 = Collider1

local Collider2 = Instance.new("Part", char)
Collider2.Name = "RagdollPart"
Collider2.Transparency = 1
Collider2.Size = Vector3.new(0.8,0.8,0.8)
Collider2.CanCollide = true
Collider2.Anchored = false
Collider2.Massless = true
Collider2.CFrame = char["Left Arm"].CFrame - Vector3.new(0,0.6,0)

local CWeld2 = Instance.new("WeldConstraint", char["Left Arm"])
CWeld2.Part0 = char["Left Arm"]
CWeld2.Part1 = Collider2

--Our script

local offset = 55
local rotOffset = 5
local colorOffset = 5
hum.MaxHealth = math.huge

local musicIds = {
	6276690390;
	5636195402;
	6866477335;
	1050510419;
	7402893056;
	6788577727;
	6833090202;
	6810949996;
	4688657498;
	6409022358;
	7168715206;
	4732984253;
	4923299019;
	
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
	sound.SoundId = "rbxassetid://" .. musicIds[math.random(1,#musicIds)]
	repeat task.wait() until sound.IsLoaded
	boom:Play()
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
Toilet.Size = Vector3.new(3.2580299377441, 3.451761007309, 2.1790940761566)
Toilet.BottomSurface = Enum.SurfaceType.Smooth
Toilet.CanCollide = false
Toilet.TopSurface = Enum.SurfaceType.Smooth
SpecialMesh1.Parent = Toilet
SpecialMesh1.MeshId = "rbxassetid://4718140898"
SpecialMesh1.MeshType = Enum.MeshType.FileMesh

WeldToilet = Instance.new("Weld")
WeldToilet.Parent = char.HumanoidRootPart
WeldToilet.Part0 = char.HumanoidRootPart
WeldToilet.Part1 = Toilet
WeldToilet.C0 = CFrame.new(0.0451,-1.5,0) * CFrame.Angles(0,math.rad(-90),0)

AttachmentFard = Instance.new("Attachment")
AttachmentFard.Parent = char.Torso
AttachmentFard.Position = Vector3.new(0,-1,0)



Fard = Instance.new("ParticleEmitter")
Fard.Parent = AttachmentFard
Fard.Speed = NumberRange.new(8, 8)
Fard.Color = ColorSequence.new(Color3.new(0.117647, 0.0392157, 0),Color3.new(0.0588235, 0.0392157, 0))
Fard.Enabled = false
Fard.LightInfluence = 1
Fard.Texture = "rbxasset://textures/particles/smoke_main.dds"
Fard.Drag = 1
Fard.EmissionDirection = Enum.NormalId.Back
Fard.Lifetime = NumberRange.new(4, 4)
Fard.Rate = 100
Fard.SpreadAngle = Vector2.new(-10, 10)
Fard.VelocityInheritance = 50
Fard.VelocitySpread = -10
Fard.LockedToPart = true

local SoundFard = Instance.new("Sound", char.Torso)
SoundFard.SoundId = "rbxassetid://6554649622"
SoundFard.Volume = 0.5
SoundFard.RollOffMode = Enum.RollOffMode.Linear
SoundFard.RollOffMaxDistance = 40
SoundFard.Looped = true

coroutine.resume(coroutine.create(function()
	while task.wait() do
		hum.Health = hum.MaxHealth
		hum.Name = game:GetService("HttpService"):GenerateGUID(false)
		if fardDbc == true then
			if not Fard.Enabled then
				Fard.Enabled = true
			end
			if not SoundFard.IsPlaying then
				SoundFard:Play()
			end
			local params = RaycastParams.new()
			params.FilterDescendantsInstances = {char}
			params.FilterType = Enum.RaycastFilterType.Blacklist
			local result = workspace:Raycast(AttachmentFard.WorldCFrame, AttachmentFard.WorldPosition + (-AttachmentFard.WorldCFrame.LookVector * 10), params)
			if result then
				local model = result.Instance:FindFirstAncestorWhichIsA("Model")
				if model then
					local hum = model:FindFirstChildWhichIsA("Humanoid")
					if hum then
						hum:TakeDamage(1)
					end
				end
			end
		else
			if Fard.Enabled then
				Fard.Enabled = false
			end
			if SoundFard.IsPlaying then
				SoundFard:Stop()
			end
		end
	end
end))

mouse.KeyDown:Connect(function(key)
	if key == "q" then
		fardDbc = true
	end
end)

mouse.KeyUp:Connect(function(key)
	if key == "q" then
		fardDbc = false
	end
end)
