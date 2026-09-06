-- =====================================================================
-- Peak ETFB Core (No UI) - gabungan ETFB_Final + CombinedMachine
-- Semua fitur dikendalikan lewat getgenv().CONFIG (diset di loader).
-- Upload file ini ke GitHub, lalu panggil lewat loader:
--   loadstring(game:HttpGet("https://raw.githubusercontent.com/.../Peak_ETFB_Core.lua"))()
-- =====================================================================

local CONFIG = getgenv().CONFIG or {}

-- helper baca config: cfg("Machine", "Enabled")
local function cfg(...)
	local value = CONFIG
	for _, key in ipairs({ ... }) do
		if type(value) ~= "table" then
			return nil
		end
		value = value[key]
	end
	return value
end

-- ====== FLAG DARI CONFIG ======
-- Misc
local TweenSpeed = tonumber(cfg("Misc", "TweenSpeed")) or 1100
local EnableCustomSpeed = cfg("Misc", "CustomTweenSpeed") == true

-- Auto Farm
local AutoFarmBrainrots = cfg("AutoFarm", "Brainrot") == true
local SelectRarityBrainrot = cfg("AutoFarm", "BrainrotRarity") or {}
local SelectBrainrotMutation = cfg("AutoFarm", "BrainrotMutation") or {}
local SelectBrainrotTrait = cfg("AutoFarm", "BrainrotTrait") or {}

local AutoFarmLuckyBlock = cfg("AutoFarm", "LuckyBlock") == true
local SelectRarityLuckyBlock = cfg("AutoFarm", "LuckyBlockRarity") or {}
local SelectLuckyBlockMutation = cfg("AutoFarm", "LuckyBlockMutation") or {}
local SelectLuckyBlockTrait = cfg("AutoFarm", "LuckyBlockTrait") or {}

local AutoOpenLuckyBlock = cfg("AutoFarm", "OpenLuckyBlock") == true
local AutoTrialTower = cfg("AutoFarm", "TrialTower") == true
local CustomTowerLimit = tonumber(cfg("AutoFarm", "TowerLimit")) or 20

-- Event
local AutoGoAndBack = cfg("Event", "AutoGoAndBack") ~= false

local AutoCollectPhantomOrb = cfg("Event", "Phantom", "CollectOrb") == true
local InstantSubmitPhantomCannon = cfg("Event", "Phantom", "InstantSubmit") == true
local AutoCollectPhantomCoin = cfg("Event", "Phantom", "CollectCoin") == true
local AutoCollectPhantomShard = cfg("Event", "Phantom", "CollectShard") == true
local AutoFarmPhantomChest = cfg("Event", "Phantom", "FarmChest") == true
local AutoFarmPhantomLootCrate = cfg("Event", "Phantom", "FarmLootCrate") == true
local AutoFarmPhantomEnemies = cfg("Event", "Phantom", "FarmEnemies") == true
local AutoFarmPhantomBrainrot = cfg("Event", "Phantom", "FarmBrainrot") == true
local AutoFarmPhantomLuckyBlock = cfg("Event", "Phantom", "FarmLuckyBlock") == true
local AutoSpinPhantomWheel = cfg("Event", "Phantom", "SpinWheel") == true

local AutoFireAndIceSacrifice = cfg("Event", "FireAndIce", "Sacrifice") == true
local SelectRarityBrainrotSacrifice = cfg("Event", "FireAndIce", "SacrificeRarity") or {}
local AutoCollectFireAndIceCoin = cfg("Event", "FireAndIce", "CollectCoin") == true
local AutoSpinFireAndIceWheel = cfg("Event", "FireAndIce", "SpinWheel") == true

local AutoStPatricksSacrifice = cfg("Event", "StPatricks", "Sacrifice") == true
local SelectRarityBrainrotStPatricksSacrifice = cfg("Event", "StPatricks", "SacrificeRarity") or {}
local AutoCollectStPatricksCoin = cfg("Event", "StPatricks", "CollectCoin") == true
local AutoSpinStPatricksWheel = cfg("Event", "StPatricks", "SpinWheel") == true

local AutoFarmCarnivalBoss = cfg("Event", "Carnival", "FarmBoss") == true
local AutoCollectCarnivalCoin = cfg("Event", "Carnival", "CollectCoin") == true
local AutoSpinCarnivalWheel = cfg("Event", "Carnival", "SpinWheel") == true

local AutoPressButtonOfDoom = cfg("Event", "Doom", "PressButton") == true
local AutoCollectDoomCoin = cfg("Event", "Doom", "CollectCoin") == true
local AutoSpinDoomWheel = cfg("Event", "Doom", "SpinWheel") == true

local AutoCollectValentineCandy = cfg("Event", "Valentines", "CollectCandy") == true
local AutoCollectValentineCoin = cfg("Event", "Valentines", "CollectCoin") == true
local AutoSubmitCandygramStation = cfg("Event", "Valentines", "SubmitCandygram") == true
local AutoSpinValentineWheel = cfg("Event", "Valentines", "SpinWheel") == true

local AutoCollectGameConsole = cfg("Event", "Arcade", "CollectConsole") == true
local AutoCollectArcadeTicket = cfg("Event", "Arcade", "CollectTicket") == true
local AutoSpent3ArcadeTicket = cfg("Event", "Arcade", "Spend3Tickets") == true
local AutoSpinArcadeWheel = cfg("Event", "Arcade", "SpinWheel") == true

local AutoCollectGoldBar = cfg("Event", "Money", "CollectGoldBar") == true
local AutoCompleteMoneyObby = cfg("Event", "Money", "CompleteObby") == true
local AutoSpinMoneyWheel = cfg("Event", "Money", "SpinWheel") == true

local AutoCollectUFOCoin = cfg("Event", "UFO", "CollectCoin") == true
local AutoSpinUFOWheel = cfg("Event", "UFO", "SpinWheel") == true

local AutoCollectRadioactiveCoin = cfg("Event", "Radioactive", "CollectCoin") == true
local AutoCollectRadioactiveCoinBomb = cfg("Event", "Radioactive", "CollectCoinBomb") == true
local AutoCompleteRadioactiveObby = cfg("Event", "Radioactive", "CompleteObby") == true
local AutoSpinRadioactiveWheel = cfg("Event", "Radioactive", "SpinWheel") == true

-- Base
local AutoCollectCash = cfg("Base", "CollectCash") == true
local DelayCollectCash = tonumber(cfg("Base", "DelayCollectCash")) or 0
local AutoUpgradeSpeed = cfg("Base", "UpgradeSpeed") == true
local DelayUpgradeSpeed = tonumber(cfg("Base", "DelayUpgradeSpeed")) or 0
local AutoUpgradeCarry = cfg("Base", "UpgradeCarry") == true
local DelayUpgradeCarry = tonumber(cfg("Base", "DelayUpgradeCarry")) or 0
local AutoUpgradeJump = cfg("Base", "UpgradeJump") == true
local DelayUpgradeJump = tonumber(cfg("Base", "DelayUpgradeJump")) or 0
local AutoUpgradeBase = cfg("Base", "UpgradeBase") == true
local DelayUpgradeBase = tonumber(cfg("Base", "DelayUpgradeBase")) or 0
local AutoUpgradeBrainrot = cfg("Base", "UpgradeBrainrot") == true
local DelayUpgradeBrainrot = tonumber(cfg("Base", "DelayUpgradeBrainrot")) or 0.05
local AutoRebirth = cfg("Base", "Rebirth") == true
local DelayRebirth = tonumber(cfg("Base", "DelayRebirth")) or 0

-- Selling
local AutoSellBrainrot = cfg("Selling", "Brainrot") == true
local SelectRarityBrainrotSell = cfg("Selling", "Rarity") or {}
local AutoSellAll = cfg("Selling", "SellAll") == true

-- Machine (CombinedMachine)
local MachineEnabled = cfg("Machine", "Enabled") ~= false
local TARGET_ITEMS = cfg("Machine", "TargetItems") or { "Quartzino" }
local MACHINE_TWEEN_SPEED = tonumber(cfg("Machine", "TweenSpeed")) or 650
local COOLDOWN_TIME = tonumber(cfg("Machine", "Cooldown")) or 35
local MachineCollectMoney = cfg("Machine", "AutoCollectMoney") ~= false
local MachineCollectMoneyDelay = tonumber(cfg("Machine", "CollectMoneyDelay")) or 5

local MACHINE_CONFIGS = {}
for _, machineName in ipairs(cfg("Machine", "Machines") or {
	"Blackhole", "ATM", "Arcade", "Valentines", "Doom", "FireAndIce",
	"PhantomSummoner", "LuckyClover", "Carnival", "Drillforge",
}) do
	MACHINE_CONFIGS[machineName] = { enabled = true }
end
-- paksa skip Default & OfferMachine
if MACHINE_CONFIGS["Default"] then
	MACHINE_CONFIGS["Default"].enabled = false
end
if MACHINE_CONFIGS["OfferMachine"] then
	MACHINE_CONFIGS["OfferMachine"].enabled = false
end

-- FPS Boost
local FPSBoostEnabled = cfg("FPSBoost", "Enabled") ~= false
local KillWalls = cfg("FPSBoost", "KillWalls") ~= false
local DeleteBaseBrainrot = cfg("FPSBoost", "DeleteBaseBrainrot") ~= false

-- ====== SERVICES ======
local virtualUser = game:GetService("VirtualUser")
local players = game:GetService("Players")
local workspace = game:GetService("Workspace")
local runService = game:GetService("RunService")
local tweenService = game:GetService("TweenService")
local replicatedStorage = game:GetService("ReplicatedStorage")

-- ====== FPS CAP ======
do
	local fps = tonumber(cfg("Misc", "FPS"))
	if fps and fps > 0 then
		pcall(function()
			setfflag("TaskSchedulerTargetFps", tostring(math.floor(fps)))
			setfpscap(fps)
		end)
	end
end

-- ====== ANTI IDLE ======
pcall(function()
	for key, value in pairs(getconnections(players.LocalPlayer.Idled)) do
		value:Disable()
	end
end)

players.LocalPlayer.Idled:Connect(function()
	virtualUser:CaptureController()
	virtualUser:ClickButton2(Vector2.new())
end)

task.spawn(function()
	while task.wait(5) do
	end
end)

-- ====== WORLD SETUP: BasePlate + Platform bawah tanah ======
if not workspace:FindFirstChild("BasePlate1") then
	local basePlate1 = Instance.new("Part")
	basePlate1.Name = "BasePlate1"
	basePlate1.Parent = workspace
	basePlate1.Size = Vector3.new(2047, 1, 50)
	basePlate1.CFrame = CFrame.new(1185.5, -1, 151.5, 1, 0, 0, 0, 1, 0, 0, 0, 1)
	basePlate1.Color = Color3.fromRGB(213, 115, 61)
	basePlate1.Material = Enum.Material.Plastic
	basePlate1.Anchored = true
end

if not workspace:FindFirstChild("BasePlate2") then
	local basePlate2 = Instance.new("Part")
	basePlate2.Name = "BasePlate2"
	basePlate2.Parent = workspace
	basePlate2.Size = Vector3.new(2047, 1, 50)
	basePlate2.CFrame = CFrame.new(3231.5, -1, 151.5, 1, 0, 0, 0, 1, 0, 0, 0, 1)
	basePlate2.Color = Color3.fromRGB(213, 115, 61)
	basePlate2.Material = Enum.Material.Plastic
	basePlate2.Anchored = true
end

if not workspace:FindFirstChild("Platform") then
	local platform = Instance.new("Part")
	platform.Name = "Platform"
	platform.Parent = workspace
	platform.Size = Vector3.new(2048, 1, 2048)
	platform.Color = Color3.fromRGB(213, 115, 61)
	platform.Material = Enum.Material.Plastic
	platform.Anchored = true
end

runService.RenderStepped:Connect(function()
	local character = players.LocalPlayer.Character

	if character and character:FindFirstChild("HumanoidRootPart") then
		workspace.Platform.CFrame = CFrame.new(
			character.HumanoidRootPart.Position.X,
			-15,
			character.HumanoidRootPart.Position.Z
		)
	end
end)

-- ====== HELPER GERAK ======
-- teleport instan
local function f1(cframe)
	local character = players.LocalPlayer.Character

	if character and character:FindFirstChild("HumanoidRootPart") then
		character.HumanoidRootPart.CFrame = cframe
	end
end

-- tween tanpa nunggu
local function f2(p1)
	local tweenSpeed = EnableCustomSpeed and TweenSpeed or 1100
	local tweenInfo = TweenInfo.new(
		(p1.Position - players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude / tweenSpeed,
		Enum.EasingStyle.Linear
	)

	tweenService:Create(players.LocalPlayer.Character.HumanoidRootPart, tweenInfo, { CFrame = p1 }):Play()
end

local create = nil

-- tween tanpa nunggu, simpan referensi (dipakai St Patricks)
local function f3(p2)
	local tweenSpeed2 = EnableCustomSpeed and TweenSpeed or 1100
	local tweenInfo2 = TweenInfo.new(
		(p2.Position - players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude / tweenSpeed2,
		Enum.EasingStyle.Linear
	)

	create = tweenService:Create(players.LocalPlayer.Character.HumanoidRootPart, tweenInfo2, {
		CFrame = p2,
	})
	create:Play()
end

local create2 = nil

-- tween sambil nunggu selesai
local function f4(p3)
	if create2 then
		create2:Cancel()
	end

	local tweenSpeed3 = EnableCustomSpeed and TweenSpeed or 1100
	local tweenInfo3 = TweenInfo.new(
		(p3.Position - players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude / tweenSpeed3,
		Enum.EasingStyle.Linear
	)

	create2 = tweenService:Create(players.LocalPlayer.Character.HumanoidRootPart, tweenInfo3, {
		CFrame = p3,
	})
	create2:Play()
	create2.Completed:Wait()
end

-- posisi standby bawah tanah (ikut base masing2)
local function getBasePos()
	for _, b in pairs(workspace.Bases:GetChildren()) do
		if b:GetAttribute("Holder") == players.LocalPlayer.UserId then
			local pp = b.PrimaryPart or b:FindFirstChild("Primary", true)
			if pp then
				return Vector3.new(pp.Position.X, -5, pp.Position.Z)
			end
			local piv = b:GetPivot().Position
			return Vector3.new(piv.X, -5, piv.Z)
		end
	end
	return Vector3.new(120, -5, 0)
end

-- tween versi machine (speed 650 biar ga kecepetan)
local function tweenTo(pos)
	local hrp = players.LocalPlayer.Character and players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
	if not hrp then
		return false
	end
	local dist = (hrp.Position - pos).Magnitude
	local ti = TweenInfo.new(dist / MACHINE_TWEEN_SPEED, Enum.EasingStyle.Linear)
	local tween = tweenService:Create(hrp, ti, { CFrame = CFrame.new(pos) })
	tween:Play()
	tween.Completed:Wait()
	return true
end

-- ====== CLEANUP AWAL ======
if workspace:FindFirstChild("___") then
	workspace.___:Destroy()
end

if KillWalls and workspace:FindFirstChild("Barriers") then
	workspace.Barriers:Destroy()
end

-- ====== FREEZE (BodyVelocity biar ga kebawa tsunami) ======
local Freeze = false

task.spawn(function()
	while task.wait() do
		if Freeze then
			pcall(function()
				if not players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Anchor") then
					local anchor = Instance.new("BodyVelocity")
					anchor.Name = "Anchor"
					anchor.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
					anchor.Velocity = Vector3.zero
					anchor.Parent = players.LocalPlayer.Character.HumanoidRootPart
				end
			end)
		elseif players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Anchor") then
			players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Anchor"):Destroy()
		end
	end
end)

task.spawn(function()
	while task.wait() do
		if AutoFarmBrainrots or AutoFarmLuckyBlock or AutoTrialTower or AutoFireAndIceSacrifice
			or AutoStPatricksSacrifice then
			Freeze = true
		else
			Freeze = false
		end
	end
end)

-- ====== QOL LOOP ======
-- noclip pas farming
task.spawn(function()
	while task.wait() do
		if AutoFarmBrainrots or AutoFarmLuckyBlock or AutoTrialTower or AutoFireAndIceSacrifice
			or AutoStPatricksSacrifice then
			pcall(function()
				for key2, value2 in pairs(players.LocalPlayer.Character:GetDescendants()) do
					if value2:IsA("BasePart") and value2.Name ~= "Platform"
						and value2.Name ~= "BasePlate1" and value2.Name ~= "BasePlate2" then
						value2.CanCollide = false
					end
				end
			end)
		end
	end
end)

-- hapus VIP walls
task.spawn(function()
	while task.wait() do
		if KillWalls then
			if workspace:FindFirstChild("VIPWalls", true) then
				workspace:FindFirstChild("VIPWalls", true):Destroy()
			end
		end
	end
end)

-- prompt brainrot langsung take (tanpa hold)
task.spawn(function()
	while task.wait() do
		pcall(function()
			for key3, value3 in pairs(workspace.ActiveBrainrots:GetDescendants()) do
				if value3.Name == "RenderedBrainrot" then
					value3.Root.TakePrompt.HoldDuration = 0
				end
			end
		end)
	end
end)

-- prompt lucky block langsung take
task.spawn(function()
	while task.wait() do
		pcall(function()
			for key4, value4 in pairs(workspace.ActiveLuckyBlocks:GetChildren()) do
				if string.find(value4.Name, "LuckyBlock") then
					value4.RootPart.ProximityPrompt.HoldDuration = 0
				end
			end
		end)
	end
end)

-- ====== AUTO FARM BRAINROT ======
local function f5()
	local v40 = {}

	for key11, value97 in pairs(SelectRarityBrainrot) do
		local findFirstChild2 = workspace.ActiveBrainrots:FindFirstChild(value97)

		if findFirstChild2 then
			for key12, value98 in pairs(findFirstChild2:GetChildren()) do
				if value98.Name == "RenderedBrainrot" then
					local v41 = true

					if SelectBrainrotMutation and #SelectBrainrotMutation > 0 then
						v41 = false
						for key13, value99 in pairs(SelectBrainrotMutation) do
							if value98:GetAttribute("Mutation") == value99 then
								v41 = true
								break
							end
						end
					end

					if v41 and SelectBrainrotTrait and #SelectBrainrotTrait > 0 then
						v41 = false
						for key14, value100 in pairs(SelectBrainrotTrait) do
							if value98:GetAttribute("Trait") == value100 then
								v41 = true
								break
							end
						end
					end

					if v41 then
						table.insert(v40, value98)
					end
				end
			end
		end
	end

	return v40
end

task.spawn(function()
	while task.wait() do
		if AutoFarmBrainrots then
			pcall(function()
				for key15, value101 in pairs(f5()) do
					if value101:FindFirstChild("Root") then
						f2(value101.Root.CFrame * CFrame.new(0, -5, 0))
						fireproximityprompt(value101.Root.TakePrompt)
					end
				end

				local count = 0
				for index2, value102 in ipairs(players.LocalPlayer.Character:GetChildren()) do
					if value102.Name == "RenderedBrainrot" then
						count = count + 1
					end
				end

				if #f5() > 0 and count >= players.LocalPlayer:GetAttribute("MaxCarry") or count >= #f5() then
					f2(CFrame.new(120, -5, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1))
				end
			end)
		end
	end
end)

-- ====== AUTO FARM LUCKY BLOCK ======
local function f6()
	local v42 = {}

	for key16, value103 in pairs(SelectRarityLuckyBlock) do
		for key17, value104 in pairs(workspace.ActiveLuckyBlocks:GetDescendants()) do
			if string.find(value104.Name, "LuckyBlock_" .. value103) then
				local v43 = true

				if SelectLuckyBlockMutation and #SelectLuckyBlockMutation > 0 then
					v43 = false
					for key18, value105 in pairs(SelectLuckyBlockMutation) do
						if value104:GetAttribute("Mutation") == value105 then
							v43 = true
							break
						end
					end
				end

				if v43 and SelectLuckyBlockTrait and #SelectLuckyBlockTrait > 0 then
					v43 = false
					for key19, value106 in pairs(SelectLuckyBlockTrait) do
						if value104:GetAttribute("Trait") == value106 then
							v43 = true
							break
						end
					end
				end

				if v43 then
					table.insert(v42, value104)
				end
			end
		end
	end

	return v42
end

task.spawn(function()
	while task.wait() do
		if AutoFarmLuckyBlock then
			pcall(function()
				for key20, value107 in pairs(f6()) do
					if value107:FindFirstChild("RootPart") then
						f2(value107.RootPart.CFrame * CFrame.new(0, -5, 0))
						fireproximityprompt(value107.RootPart.ProximityPrompt)
					end
				end

				local count2 = 0
				for index3, value108 in ipairs(players.LocalPlayer.Character:GetChildren()) do
					for key21, value109 in pairs(SelectRarityLuckyBlock) do
						if string.find(value108.Name, "LuckyBlock_" .. value109) then
							count2 = count2 + 1
						end
					end
				end

				if #f6() > 0 and count2 >= players.LocalPlayer:GetAttribute("MaxCarry")
					or count2 >= #f6() then
					f2(CFrame.new(120, -5, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1))
				end
			end)
		end
	end
end)

-- ====== AUTO OPEN LUCKY BLOCK ======
task.spawn(function()
	while task.wait() do
		if AutoOpenLuckyBlock then
			pcall(function()
				for key22, value110 in pairs(players.LocalPlayer.Backpack:GetChildren()) do
					if value110:IsA("Tool") then
						if value110:GetAttribute("LuckyBlockTool") == true then
							players.LocalPlayer.Character.Humanoid:EquipTool(value110)
							replicatedStorage.Shared.Remotes.Networking["RE/LuckyBlocks/OpenLuckyBlockTool"]
								:FireServer(players.LocalPlayer.Character:FindFirstChildOfClass("Tool"))
						end
					end
				end
			end)
		end
	end
end)

-- ====== AUTO TRIAL TOWER ======
local v44 = false
local v45 = false
local contentText = "0/20"

players.LocalPlayer.PlayerGui.NewNotifications.Items.ChildAdded:Connect(function(child)
	local function f7()
		if child:FindFirstChild("TextLabel") and child:FindFirstChild("TextLabel").Text
			and string.find(child:FindFirstChild("TextLabel").Text, "Good") then
			v44 = true
			v45 = false
		end
	end

	f7()
	child:FindFirstChild("TextLabel"):GetPropertyChangedSignal("Text"):Connect(f7)
end)

task.spawn(function()
	while task.wait() do
		if AutoTrialTower then
			pcall(function()
				if workspace.GameObjects.PlaceSpecific.root.Tower.Main.Billboard.BillboardGui.Frame.Info.InfoText.ContentText
					== "Start Trial?" then
					players.LocalPlayer.Character.Humanoid:UnequipTools()
					f2(workspace.GameObjects.PlaceSpecific.root.Tower.WorldPivot * CFrame.new(0, -58, 0))
					fireproximityprompt(workspace.GameObjects.PlaceSpecific.root.Tower.Main.Prompt.ProximityPrompt)
				end

				if players.LocalPlayer.PlayerGui.TowerTrialHUD.TrialBar.Deposits.ContentText
					~= contentText then
					contentText = players.LocalPlayer.PlayerGui.TowerTrialHUD.TrialBar.Deposits.ContentText

					if players.LocalPlayer.PlayerGui.TowerTrialHUD.TrialBar.Deposits.ContentText ~= "0/20" then
						v45 = true
						v44 = false
					end
				end

				if v45 and not v44 then
					return
				end

				if players.LocalPlayer.PlayerGui.TowerTrialHUD.TrialBar.Visible == true then
					local requirement = players.LocalPlayer.PlayerGui.TowerTrialHUD.TrialBar.Requirement.ContentText

					if requirement == "Tower Trial: Common" then
						f2(workspace.ActiveBrainrots.Common.RenderedBrainrot.Root.CFrame * CFrame.new(0, -5, 0))
						fireproximityprompt(workspace.ActiveBrainrots.Common.RenderedBrainrot.Root.TakePrompt)
					elseif requirement == "Tower Trial: Uncommon" then
						f2(workspace.ActiveBrainrots.Uncommon.RenderedBrainrot.Root.CFrame * CFrame.new(0, -5, 0))
						fireproximityprompt(workspace.ActiveBrainrots.Uncommon.RenderedBrainrot.Root.TakePrompt)
					elseif requirement == "Tower Trial: Rare" then
						f2(workspace.ActiveBrainrots.Rare.RenderedBrainrot.Root.CFrame * CFrame.new(0, -5, 0))
						fireproximityprompt(workspace.ActiveBrainrots.Rare.RenderedBrainrot.Root.TakePrompt)
					elseif requirement == "Tower Trial: Epic" then
						f2(workspace.ActiveBrainrots.Epic.RenderedBrainrot.Root.CFrame * CFrame.new(0, -5, 0))
						fireproximityprompt(workspace.ActiveBrainrots.Epic.RenderedBrainrot.Root.TakePrompt)
					elseif requirement == "Tower Trial: Legendary" then
						f2(workspace.ActiveBrainrots.Legendary.RenderedBrainrot.Root.CFrame * CFrame.new(0, -5, 0))
						fireproximityprompt(workspace.ActiveBrainrots.Legendary.RenderedBrainrot.Root.TakePrompt)
					elseif requirement == "Tower Trial: Mythical" then
						f2(workspace.ActiveBrainrots.Mythical.RenderedBrainrot.Root.CFrame * CFrame.new(0, -5, 0))
						fireproximityprompt(workspace.ActiveBrainrots.Mythical.RenderedBrainrot.Root.TakePrompt)
					elseif requirement == "Tower Trial: Cosmic" then
						f2(workspace.ActiveBrainrots.Cosmic.RenderedBrainrot.Root.CFrame * CFrame.new(0, -5, 0))
						fireproximityprompt(workspace.ActiveBrainrots.Cosmic.RenderedBrainrot.Root.TakePrompt)
					elseif requirement == "Tower Trial: Secret" then
						f2(workspace.ActiveBrainrots.Secret.RenderedBrainrot.Root.CFrame * CFrame.new(0, -5, 0))
						fireproximityprompt(workspace.ActiveBrainrots.Secret.RenderedBrainrot.Root.TakePrompt)
					end

					for index4, value111 in ipairs(players.LocalPlayer.Character:GetChildren()) do
						if value111.Name == "RenderedBrainrot" then
							if value111:GetAttribute("Source") == nil then
								f2(workspace.GameObjects.PlaceSpecific.root.Tower.WorldPivot * CFrame.new(0, -58, 0))
								fireproximityprompt(workspace.GameObjects.PlaceSpecific.root.Tower.Main.Prompt.ProximityPrompt)
							end
						end
					end
				end
			end)
		end
	end
end)

task.spawn(function()
	while task.wait() do
		if AutoTrialTower then
			pcall(function()
				players.LocalPlayer.PlayerGui.ChoiceGui.Choice.Visible = false

				if players.LocalPlayer.PlayerGui.TowerTrialHUD.TrialBar.Deposits.Text
					== CustomTowerLimit .. "/20" then
					replicatedStorage:WaitForChild("Shared"):WaitForChild("Remotes"):WaitForChild("Networking")
						:WaitForChild("RE/Tower/TowerClaimConfirmed"):FireServer()
				end

				if workspace.GameObjects.PlaceSpecific.root.Tower.Main.Billboard.BillboardGui.Frame.Info.InfoText.ContentText
					== "Trial Complete!" then
					players.LocalPlayer.PlayerGui.TowerTrialHUD.TrialBar.Requirement.Text = ""
				end

				for key23, value112 in pairs(workspace.ActiveBrainrots:GetDescendants()) do
					if value112.Name == "RenderedBrainrot" then
						if value112:GetAttribute("Source") == "Tower"
							or value112:GetAttribute("Source") == "AnticheatDrop" then
							f2(value112.Root.CFrame * CFrame.new(0, -5, 0))
							fireproximityprompt(value112.Root.TakePrompt)
						end
					end
				end

				for index5, value113 in ipairs(players.LocalPlayer.Character:GetChildren()) do
					if value113.Name == "RenderedBrainrot" then
						if value113:GetAttribute("Source") == "Tower"
							or value113:GetAttribute("Source") == "AnticheatDrop" then
							f2(CFrame.new(120, -5, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1))
						end
					end
				end
			end)
		end
	end
end)

-- ====== AUTO GO AND BACK (event collect) ======
local anyEventCollect = AutoCollectCarnivalCoin
	or AutoCollectStPatricksCoin
	or AutoCollectPhantomCoin
	or AutoCollectPhantomOrb
	or AutoCollectPhantomShard
	or AutoCollectFireAndIceCoin
	or AutoCollectDoomCoin
	or AutoCollectValentineCandy
	or AutoCollectValentineCoin
	or AutoCollectGameConsole
	or AutoCollectArcadeTicket
	or AutoCollectGoldBar
	or AutoCollectUFOCoin
	or AutoCollectRadioactiveCoin
	or AutoCollectRadioactiveCoinBomb

task.spawn(function()
	while task.wait() do
		if AutoGoAndBack and anyEventCollect then
			pcall(function()
				if workspace:FindFirstChild("DefaultMap") then
					return
				end

				if workspace:FindFirstChild("PhantomMap") or workspace:FindFirstChild("ValentinesMap") then
					if not AutoCollectPhantomCoin or AutoCollectPhantomShard or AutoCollectValentineCoin then
						if players.LocalPlayer.PlayerGui.HUD.BottomLeft.EventSpecificCurrencies.Container.Slot1.Value.Text
							== "100" then
							return
						end
					end

					for key24, value114 in pairs(workspace:GetChildren()) do
						if string.find(value114.Name, "Map_SharedInstance") then
							f4(workspace.GameObjects.PlaceSpecific.root.Tower.WorldPivot * CFrame.new(0, -58, 0))
							f4(value114.Floors.Common.CFrame * CFrame.new(0, -5, 0))
						end
					end

					return
				end

				for key25, value115 in pairs(workspace:GetChildren()) do
					if string.find(value115.Name, "Map_SharedInstance") then
						f4(workspace.GameObjects.PlaceSpecific.root.Tower.WorldPivot * CFrame.new(0, -58, 0))
						f4(value115.Floors.Common.CFrame * CFrame.new(0, -5, 0))
					end
				end
			end)
		end
	end
end)

-- ====== CARNIVAL EVENT ======
task.spawn(function()
	while task.wait() do
		if AutoFarmCarnivalBoss then
			pcall(function()
				if workspace.GameObjects.Enemies.Carnival:FindFirstChild("NPC_CarnivalClown") then
					f2(game.Workspace.Debris.BeachBall:GetPivot() * CFrame.new(0, -8, 0))

					for key26, value116 in pairs(game.Workspace.Debris.BeachBall:GetChildren()) do
						if value116:IsA("ProximityPrompt") then
							fireproximityprompt(value116)
						end
					end
				end
			end)
		end
	end
end)

task.spawn(function()
	while task.wait() do
		if AutoFarmCarnivalBoss then
			pcall(function()
				local getPivot = workspace.GameObjects.Enemies.Carnival.NPC_CarnivalClown:GetPivot()
				replicatedStorage:WaitForChild("Shared"):WaitForChild("Remotes"):WaitForChild("Networking")
					:WaitForChild("RE/Events/CarnivalBeachBallThrow"):FireServer(getPivot.Position)
			end)
		end
	end
end)

task.spawn(function()
	while task.wait() do
		if AutoCollectCarnivalCoin then
			pcall(function()
				for key27, value117 in pairs(workspace.CarnivalCoinParts:GetChildren()) do
					if value117.Name == "CarnivalCoin" then
						firetouchinterest(players.LocalPlayer.Character.HumanoidRootPart, value117.main, 0)
						firetouchinterest(players.LocalPlayer.Character.HumanoidRootPart, value117.main, 1)
					end
				end
			end)
		end
	end
end)

task.spawn(function()
	while task.wait() do
		if AutoSpinCarnivalWheel then
			pcall(function()
				replicatedStorage:WaitForChild("Shared"):WaitForChild("Remotes"):WaitForChild("Networking")
					:WaitForChild("RF/WheelSpinRoll"):InvokeServer(unpack({ "Carnival", false }))
			end)
		end
	end
end)

-- ====== ST PATRICKS EVENT ======
local function f8()
	local v55 = {}

	for key28, value118 in pairs(SelectRarityBrainrotStPatricksSacrifice) do
		local rarityFolder = workspace.ActiveBrainrots:FindFirstChild(value118)
		if rarityFolder then
			for key29, value119 in pairs(rarityFolder:GetDescendants()) do
				if value119.Name == "RenderedBrainrot" then
					table.insert(v55, value119)
				end
			end
		end
	end

	return v55
end

task.spawn(function()
	while task.wait() do
		if AutoStPatricksSacrifice then
			pcall(function()
				if workspace:FindFirstChild("StPatricksMap") then
					for key30, value120 in pairs(f8()) do
						if value120:FindFirstChild("Root") then
							f2(value120.Root.CFrame * CFrame.new(0, -5, 0))
							fireproximityprompt(value120.Root.TakePrompt)
						end
					end

					local count3 = 0
					for index6, value121 in ipairs(players.LocalPlayer.Character:GetChildren()) do
						if value121.Name == "RenderedBrainrot" then
							count3 = count3 + 1
						end
					end

					if #f8() > 0 and count3 >= players.LocalPlayer:GetAttribute("MaxCarry")
						or count3 >= #f8() then
						f3(workspace.PotOfGold.WorldPivot * CFrame.new(0, -80, 0))

						if create.Completed then
							f1(workspace.PotOfGold.WorldPivot)
						end

						for key31, value122 in pairs(workspace.PotOfGold:GetDescendants()) do
							if value122:IsA("ProximityPrompt") then
								fireproximityprompt(value122)
							end
						end

						if players.LocalPlayer.PlayerGui.ChoiceGui.Choice.Visible == true then
							players.LocalPlayer.PlayerGui.ChoiceGui.Choice.Choices.Yes.Size = UDim2.new(100, 100, 100, 100)
							players.LocalPlayer.PlayerGui.ChoiceGui.Choice.Choices.Yes.Position = UDim2.new(-1, 0, -5, 0)
							mouse1click()
						else
							players.LocalPlayer.PlayerGui.ChoiceGui.Choice.Choices.Yes.Size = UDim2.new(0.45, 0, 1, 0)
							players.LocalPlayer.PlayerGui.ChoiceGui.Choice.Choices.Yes.Position = UDim2.new(0.279, 0, 0.783, 0)
						end
					end
				end
			end)
		end
	end
end)

task.spawn(function()
	while task.wait() do
		if AutoCollectStPatricksCoin then
			pcall(function()
				for key32, value123 in pairs(workspace.StPatricksCoinParts:GetChildren()) do
					if value123.Name == "StPatricksCoin" then
						firetouchinterest(
							players.LocalPlayer.Character.HumanoidRootPart,
							value123["Meshes/luckycoin"], 0
						)
						firetouchinterest(
							players.LocalPlayer.Character.HumanoidRootPart,
							value123["Meshes/luckycoin"], 1
						)
					end
				end
			end)
		end
	end
end)

task.spawn(function()
	while task.wait() do
		if AutoSpinStPatricksWheel then
			pcall(function()
				replicatedStorage:WaitForChild("Shared"):WaitForChild("Remotes"):WaitForChild("Networking")
					:WaitForChild("RF/WheelSpinRoll"):InvokeServer(unpack({ "StPatricks", false }))
			end)
		end
	end
end)

-- ====== PHANTOM EVENT ======
task.spawn(function()
	while task.wait() do
		if AutoCollectPhantomOrb then
			pcall(function()
				if players.LocalPlayer.PlayerGui.HUD.BottomLeft.EventSpecificCurrencies.Container.Slot1.Value.Text
					~= "100" then
					for key33, value124 in pairs(workspace.PhantomOrbParts:GetChildren()) do
						if string.find(value124.Name, "PhantomOrb") then
							firetouchinterest(players.LocalPlayer.Character.HumanoidRootPart, value124.Hitbox, 0)
							firetouchinterest(players.LocalPlayer.Character.HumanoidRootPart, value124.Hitbox, 1)
						end
					end
				elseif not InstantSubmitPhantomCannon then
					for key34, value125 in pairs(workspace.PhantomMap:GetChildren()) do
						if value125.Name == "GhostCannon" then
							f2(value125.Part.CFrame)
							fireproximityprompt(value125.Part.Prompts.ProximityPrompt)
						end
					end
				end
			end)
		end
	end
end)

task.spawn(function()
	while task.wait() do
		if InstantSubmitPhantomCannon then
			pcall(function()
				if players.LocalPlayer.PlayerGui.HUD.BottomLeft.EventSpecificCurrencies.Container.Slot1.Value.Text
					== "100" then
					for key35, value126 in pairs(workspace.PhantomMap:GetChildren()) do
						if value126.Name == "GhostCannon" then
							f1(value126.Part.CFrame)
							fireproximityprompt(value126.Part.Prompts.ProximityPrompt)
						end
					end
				end
			end)
		end
	end
end)

task.spawn(function()
	while task.wait() do
		if AutoCollectPhantomCoin then
			pcall(function()
				for key36, value127 in pairs(workspace.PhantomCoinParts:GetChildren()) do
					if value127.Name == "PhantomCoin" then
						firetouchinterest(players.LocalPlayer.Character.HumanoidRootPart, value127.Main, 0)
						firetouchinterest(players.LocalPlayer.Character.HumanoidRootPart, value127.Main, 1)
					end
				end
			end)
		end
	end
end)

task.spawn(function()
	while task.wait() do
		if AutoCollectPhantomShard then
			pcall(function()
				for key37, value128 in pairs(workspace.PhantomShardParts:GetChildren()) do
					if value128.Name == "PhantomShard" then
						firetouchinterest(players.LocalPlayer.Character.HumanoidRootPart, value128.Hitbox, 0)
						firetouchinterest(players.LocalPlayer.Character.HumanoidRootPart, value128.Hitbox, 1)
					end
				end
			end)
		end
	end
end)

task.spawn(function()
	while task.wait() do
		if AutoFarmPhantomChest then
			pcall(function()
				for key38, value129 in pairs(workspace.PhantomMap.ChestSpawns:GetChildren()) do
					if value129.Name == "Chest" then
						if value129:GetAttribute("Opened") == false then
							f1(value129.WorldPivot)
							fireproximityprompt(value129.ProximityPrompt)
						end
					end
				end
			end)
		end
	end
end)

task.spawn(function()
	while task.wait() do
		if AutoFarmPhantomLootCrate then
			pcall(function()
				for key39, value130 in pairs(workspace.GameObjects.Interactables.LootCrates:GetChildren()) do
					if value130.Name == "LootCrate" then
						f1(value130:GetPivot())
						fireproximityprompt(value130.ProximityPrompt)
					end
				end
			end)
		end
	end
end)

task.spawn(function()
	while task.wait() do
		if AutoFarmPhantomEnemies then
			pcall(function()
				if workspace:FindFirstChild("PhantomMap") then
					for key40, value131 in pairs(workspace.GameObjects.Enemies.Ghostly:GetChildren()) do
						if value131.Name == "NPC_BrainrotGhost" then
							f2(value131.Root.CFrame)

							for key41, value132 in pairs(players.LocalPlayer.Backpack:GetChildren()) do
								if value132:IsA("Tool") then
									if value132:GetAttribute("DisplayName") == "Basic Bat" then
										players.LocalPlayer.Character.Humanoid:EquipTool(value132)
									end
								end
							end

							virtualUser:Button1Up(Vector2.new(10000, 10000))
							virtualUser:Button1Down(Vector2.new(10000, 10000))
						end
					end
				end
			end)
		end
	end
end)

task.spawn(function()
	while task.wait() do
		if AutoFarmPhantomBrainrot then
			pcall(function()
				for key42, value133 in pairs(workspace.Debris:GetChildren()) do
					if value133.Name == "RenderedBrainrot" then
						if players.LocalPlayer.PlayerGui.DropGui.Enabled == false then
							f2(value133:GetPivot())
							fireproximityprompt(value133.ProximityPrompt)
						else
							f2(CFrame.new(120, -7.46325016, 0.550000012, 1, 0, 0, 0, 1, 0, 0, 0, 1))
						end
					end
				end

				for key43, value134 in pairs(workspace.ActiveBrainrots:GetDescendants()) do
					if value134.Name == "RenderedBrainrot" then
						if value134:GetAttribute("Source") == "CaptainChair" then
							f2(value134.Root.CFrame)
							fireproximityprompt(value134.Root.TakePrompt)
						end
					end
				end

				for index7, value135 in ipairs(players.LocalPlayer.Character:GetChildren()) do
					if value135.Name == "RenderedBrainrot" then
						if value135:GetAttribute("Source") == "CaptainChair" then
							f2(CFrame.new(120, -7.46325016, 0.550000012, 1, 0, 0, 0, 1, 0, 0, 0, 1))
						end
					end
				end
			end)
		end
	end
end)

task.spawn(function()
	while task.wait() do
		if AutoFarmPhantomLuckyBlock then
			pcall(function()
				for key44, value136 in pairs(workspace.ActiveLuckyBlocks:GetChildren()) do
					if string.find(value136.Name, "EventSpawnLuckyBlock") then
						if value136:GetAttribute("Mutation") == "Phantom" then
							f2(value136.RootPart.CFrame)
							fireproximityprompt(value136.RootPart.ProximityPrompt)
						end
					end
				end

				for index8, value137 in ipairs(players.LocalPlayer.Character:GetChildren()) do
					if string.find(value137.Name, "EventSpawnLuckyBlock") then
						if value137:GetAttribute("Mutation") == "Phantom" then
							f2(CFrame.new(120, -7.46325016, 0.550000012, 1, 0, 0, 0, 1, 0, 0, 0, 1))
						end
					end
				end
			end)
		end
	end
end)

task.spawn(function()
	while task.wait() do
		if AutoSpinPhantomWheel then
			pcall(function()
				replicatedStorage:WaitForChild("Shared"):WaitForChild("Remotes"):WaitForChild("Networking")
					:WaitForChild("RF/WheelSpinRoll"):InvokeServer(unpack({ "Phantom", false }))
			end)
		end
	end
end)

-- ====== FIRE AND ICE EVENT ======
local function f9()
	local v60 = {}

	for key45, value138 in pairs(SelectRarityBrainrotSacrifice) do
		local rarityFolder = workspace.ActiveBrainrots:FindFirstChild(value138)
		if rarityFolder then
			for key46, value139 in pairs(rarityFolder:GetDescendants()) do
				if value139.Name == "RenderedBrainrot" then
					if players.LocalPlayer:GetAttribute("FireAndIceTeam") == "Fire" then
						if value139.Root.Position.Z < 0 then
							table.insert(v60, value139)
						end
					end

					if players.LocalPlayer:GetAttribute("FireAndIceTeam") == "Ice" then
						if value139.Root.Position.Z > 0 then
							table.insert(v60, value139)
						end
					end
				end
			end
		end
	end

	return v60
end

task.spawn(function()
	while task.wait() do
		if AutoFireAndIceSacrifice then
			pcall(function()
				if workspace:FindFirstChild("FireAndIceMap") then
					for key47, value140 in pairs(f9()) do
						if value140:FindFirstChild("Root") then
							f2(value140.Root.CFrame * CFrame.new(0, -5, 0))
							fireproximityprompt(value140.Root.TakePrompt)
						end
					end

					local count4 = 0
					for index9, value141 in ipairs(players.LocalPlayer.Character:GetChildren()) do
						if value141.Name == "RenderedBrainrot" then
							count4 = count4 + 1
						end
					end

					if #f9() > 0 and count4 >= players.LocalPlayer:GetAttribute("MaxCarry")
						or count4 >= #f9() then
						f2(workspace.FireAndIceMap.FireAndIceSacraficeMachine.Primary.CFrame
							* CFrame.new(0, -8, 0))
						fireproximityprompt(workspace.FireAndIceMap.FireAndIceSacraficeMachine.Primary.Prompt.ProximityPrompt)

						if players.LocalPlayer.PlayerGui.ChoiceGui.Choice.Visible == true then
							players.LocalPlayer.PlayerGui.ChoiceGui.Choice.Choices.Yes.Size = UDim2.new(100, 100, 100, 100)
							players.LocalPlayer.PlayerGui.ChoiceGui.Choice.Choices.Yes.Position = UDim2.new(-1, 0, -5, 0)
							mouse1click()
						else
							players.LocalPlayer.PlayerGui.ChoiceGui.Choice.Choices.Yes.Size = UDim2.new(0.45, 0, 1, 0)
							players.LocalPlayer.PlayerGui.ChoiceGui.Choice.Choices.Yes.Position = UDim2.new(0.279, 0, 0.783, 0)
						end
					end
				end
			end)
		end
	end
end)

task.spawn(function()
	while task.wait() do
		if AutoCollectFireAndIceCoin then
			pcall(function()
				for key48, value142 in pairs(workspace.FireAndIceEventParts:GetChildren()) do
					if value142.Name == "FireAndIceCoin" then
						firetouchinterest(players.LocalPlayer.Character.HumanoidRootPart, value142.Main, 0)
						firetouchinterest(players.LocalPlayer.Character.HumanoidRootPart, value142.Main, 1)
					end
				end
			end)
		end
	end
end)

task.spawn(function()
	while task.wait() do
		if AutoSpinFireAndIceWheel then
			pcall(function()
				replicatedStorage:WaitForChild("Shared"):WaitForChild("Remotes"):WaitForChild("Networking")
					:WaitForChild("RF/WheelSpinRoll"):InvokeServer(unpack({ "FireAndIce", false }))
			end)
		end
	end
end)

-- ====== DOOM EVENT ======
task.spawn(function()
	while task.wait() do
		if AutoPressButtonOfDoom then
			pcall(function()
				if workspace:FindFirstChild("DoomEventButtons") then
					f1(workspace.DoomEventButtons.Button.WorldPivot)
					fireproximityprompt(workspace.DoomEventButtons.Button.Union.ProximityPrompt)
				end
			end)
		end
	end
end)

task.spawn(function()
	while task.wait() do
		if AutoCollectDoomCoin then
			pcall(function()
				for key49, value143 in pairs(workspace.DoomEventParts:GetDescendants()) do
					if value143.Name == "DoomCoin" then
						firetouchinterest(players.LocalPlayer.Character.HumanoidRootPart, value143.Main, 0)
						firetouchinterest(players.LocalPlayer.Character.HumanoidRootPart, value143.Main, 1)
					end
				end
			end)
		end
	end
end)

task.spawn(function()
	while task.wait() do
		if AutoSpinDoomWheel then
			pcall(function()
				replicatedStorage:WaitForChild("Shared"):WaitForChild("Remotes"):WaitForChild("Networking")
					:WaitForChild("RF/WheelSpinRoll"):InvokeServer(unpack({ "Doom", false }))
			end)
		end
	end
end)

-- ====== VALENTINE EVENT ======
task.spawn(function()
	while task.wait() do
		if AutoCollectValentineCandy then
			pcall(function()
				for key50, value144 in pairs(workspace.CandyEventParts:GetDescendants()) do
					if string.find(value144.Name, "HeartCandy") then
						firetouchinterest(players.LocalPlayer.Character.HumanoidRootPart, value144, 0)
						firetouchinterest(players.LocalPlayer.Character.HumanoidRootPart, value144, 1)
					end
				end
			end)
		end
	end
end)

task.spawn(function()
	while task.wait() do
		if AutoCollectValentineCoin then
			pcall(function()
				if players.LocalPlayer.PlayerGui.HUD.BottomLeft.EventSpecificCurrencies.Container.Slot1.Value.Text
					~= "100" then
					for key51, value145 in pairs(workspace.ValentinesCoinParts:GetDescendants()) do
						if string.find(value145.Name, "ValentinesCoin") then
							firetouchinterest(
								players.LocalPlayer.Character.HumanoidRootPart, value145.lovetoken, 0
							)
							firetouchinterest(
								players.LocalPlayer.Character.HumanoidRootPart, value145.lovetoken, 1
							)
						end
					end
				end
			end)
		end
	end
end)

task.spawn(function()
	while task.wait() do
		if AutoSubmitCandygramStation then
			pcall(function()
				if workspace:FindFirstChild("ValentinesMap") then
					if players.LocalPlayer.PlayerGui.HUD.BottomLeft.EventSpecificCurrencies.Container.Slot1.Value.Text
						== "100" then
						f2(workspace.ValentinesMap.CandyGramStation.WorldPivot * CFrame.new(0, -11, 0))
						fireproximityprompt(workspace.ValentinesMap.CandyGramStation.Main.Prompts.ProximityPrompt)
					end
				end
			end)
		end
	end
end)

task.spawn(function()
	while task.wait() do
		if AutoSpinValentineWheel then
			pcall(function()
				replicatedStorage:WaitForChild("Shared"):WaitForChild("Remotes"):WaitForChild("Networking")
					:WaitForChild("RF/WheelSpinRoll"):InvokeServer(unpack({ "Valentines", false }))
			end)
		end
	end
end)

-- ====== ARCADE EVENT ======
task.spawn(function()
	while task.wait() do
		if AutoCollectGameConsole then
			pcall(function()
				for key52, value146 in pairs(workspace.ArcadeEventConsoles:GetChildren()) do
					if value146.Name == "Game Console" then
						firetouchinterest(
							players.LocalPlayer.Character.HumanoidRootPart, value146["Game Console"], 0
						)
						firetouchinterest(
							players.LocalPlayer.Character.HumanoidRootPart, value146["Game Console"], 1
						)
					end
				end
			end)
		end
	end
end)

task.spawn(function()
	while task.wait() do
		if AutoCollectArcadeTicket then
			pcall(function()
				for key53, value147 in pairs(workspace.ArcadeEventTickets:GetChildren()) do
					if value147.Name == "Ticket" then
						firetouchinterest(
							players.LocalPlayer.Character.HumanoidRootPart, value147.Ticket, 0
						)
						firetouchinterest(
							players.LocalPlayer.Character.HumanoidRootPart, value147.Ticket, 1
						)
					end
				end
			end)
		end
	end
end)

task.spawn(function()
	while task.wait() do
		if AutoSpent3ArcadeTicket then
			pcall(function()
				if workspace:FindFirstChild("Debris") then
					if players.LocalPlayer.PlayerGui.HUD.BottomLeft.EventSpecificCurrencies.Container.Slot1.Value.Text
						== "3" then
						f2(workspace.Debris.TokenMachine.Prompt.CFrame)
						fireproximityprompt(workspace.Debris.TokenMachine.Prompt.SpendTokensPrompt)
					end
				end
			end)
		end
	end
end)

task.spawn(function()
	while task.wait() do
		if AutoSpinArcadeWheel then
			pcall(function()
				replicatedStorage:WaitForChild("Shared"):WaitForChild("Remotes"):WaitForChild("Networking")
					:WaitForChild("RF/WheelSpinRoll"):InvokeServer(unpack({ "Arcade", false }))
			end)
		end
	end
end)

-- ====== MONEY EVENT ======
task.spawn(function()
	while task.wait() do
		if AutoCollectGoldBar then
			pcall(function()
				for key54, value148 in pairs(workspace.MoneyEventParts:GetChildren()) do
					if value148.Name == "GoldBar" then
						firetouchinterest(players.LocalPlayer.Character.HumanoidRootPart, value148.Main, 0)
						firetouchinterest(players.LocalPlayer.Character.HumanoidRootPart, value148.Main, 1)
					end
				end
			end)
		end
	end
end)

task.spawn(function()
	while task.wait() do
		if AutoCompleteMoneyObby then
			pcall(function()
				if workspace:FindFirstChild("MoneyMap_SharedInstances") then
					f1(workspace.MoneyMap_SharedInstances.MoneyObby1End.CFrame)
					task.wait(0.5)
					f1(workspace.MoneyMap_SharedInstances.MoneyObby2End.CFrame)
					task.wait(0.5)
					f1(workspace.MoneyMap_SharedInstances.MoneyObby3End.CFrame)
				end
			end)
		end
	end
end)

task.spawn(function()
	while task.wait() do
		if AutoSpinMoneyWheel then
			pcall(function()
				replicatedStorage:WaitForChild("Shared"):WaitForChild("Remotes"):WaitForChild("Networking")
					:WaitForChild("RF/WheelSpinRoll"):InvokeServer(unpack({ "Money", false }))
			end)
		end
	end
end)

-- ====== UFO EVENT ======
task.spawn(function()
	while task.wait() do
		if AutoCollectUFOCoin then
			pcall(function()
				for key55, value149 in pairs(workspace.UFOEventParts:GetDescendants()) do
					if value149.Name == "UFO Coin" then
						firetouchinterest(players.LocalPlayer.Character.HumanoidRootPart, value149.Hitbox, 0)
						firetouchinterest(players.LocalPlayer.Character.HumanoidRootPart, value149.Hitbox, 1)
					end
				end
			end)
		end
	end
end)

task.spawn(function()
	while task.wait() do
		if AutoSpinUFOWheel then
			pcall(function()
				replicatedStorage:WaitForChild("Shared"):WaitForChild("Remotes"):WaitForChild("Networking")
					:WaitForChild("RF/WheelSpinRoll"):InvokeServer(unpack({ "UFO", false }))
			end)
		end
	end
end)

-- ====== RADIOACTIVE EVENT ======
task.spawn(function()
	while task.wait() do
		if AutoCollectRadioactiveCoin then
			pcall(function()
				for key56, value150 in pairs(workspace.EventParts.RadioactiveCoinsFolder:GetChildren()) do
					if value150.Name == "Radioactive Coin" then
						firetouchinterest(
							players.LocalPlayer.Character.HumanoidRootPart, value150["Radioactive Coin"], 0
						)
						firetouchinterest(
							players.LocalPlayer.Character.HumanoidRootPart, value150["Radioactive Coin"], 1
						)
					end
				end
			end)
		end
	end
end)

task.spawn(function()
	while task.wait() do
		if AutoCollectRadioactiveCoinBomb then
			pcall(function()
				for key57, value151 in pairs(workspace.EventParts.CoinBombs["Coin Bomb"]:GetChildren()) do
					if string.find(value151.Name, "CoinBomb") then
						firetouchinterest(players.LocalPlayer.Character.HumanoidRootPart, value151, 0)
						firetouchinterest(players.LocalPlayer.Character.HumanoidRootPart, value151, 1)
					end
				end
			end)
		end
	end
end)

task.spawn(function()
	while task.wait() do
		if AutoCompleteRadioactiveObby then
			pcall(function()
				if workspace:FindFirstChild("RadioactiveMap_SharedInstances") then
					f1(workspace.RadioactiveMap_SharedInstances.ObbyEnd.CFrame)
				end
			end)
		end
	end
end)

task.spawn(function()
	while task.wait() do
		if AutoSpinRadioactiveWheel then
			pcall(function()
				replicatedStorage:WaitForChild("Shared"):WaitForChild("Remotes"):WaitForChild("Networking")
					:WaitForChild("RF/WheelSpinRoll"):InvokeServer(unpack({ "Radioactive", false }))
			end)
		end
	end
end)

-- ====== BASE: COLLECT CASH ======
task.spawn(function()
	while task.wait(DelayCollectCash) do
		if AutoCollectCash then
			pcall(function()
				for key58, value152 in pairs(workspace.Bases:GetChildren()) do
					for key59, value153 in pairs(value152:FindFirstChild("Slots"):GetChildren()) do
						if value153:FindFirstChild("Collect")
							and value153:FindFirstChild("Collect"):FindFirstChild("TouchInterest") then
							firetouchinterest(
								players.LocalPlayer.Character.HumanoidRootPart,
								value153:FindFirstChild("Collect"), 0
							)
							firetouchinterest(
								players.LocalPlayer.Character.HumanoidRootPart,
								value153:FindFirstChild("Collect"), 1
							)
						end
					end
				end
			end)
		end
	end
end)

-- ====== BASE: UPGRADE ======
task.spawn(function()
	while task.wait(DelayUpgradeSpeed) do
		if AutoUpgradeSpeed then
			pcall(function()
				replicatedStorage:WaitForChild("RemoteFunctions"):WaitForChild("UpgradeSpeed"):InvokeServer(1)
			end)
		end
	end
end)

task.spawn(function()
	while task.wait(DelayUpgradeCarry) do
		if AutoUpgradeCarry then
			pcall(function()
				replicatedStorage:WaitForChild("RemoteFunctions"):WaitForChild("UpgradeCarry"):InvokeServer()
			end)
		end
	end
end)

task.spawn(function()
	while task.wait(DelayUpgradeJump) do
		if AutoUpgradeJump then
			pcall(function()
				replicatedStorage:WaitForChild("Shared"):WaitForChild("Remotes"):WaitForChild("Networking")
					:WaitForChild("RF/UpgradeJump"):InvokeServer()
			end)
		end
	end
end)

task.spawn(function()
	while task.wait(DelayUpgradeBase) do
		if AutoUpgradeBase then
			pcall(function()
				replicatedStorage:WaitForChild("Shared"):WaitForChild("Remotes"):WaitForChild("Networking")
					:WaitForChild("RE/Plots/PlotUpgradeBase"):FireServer()
			end)
		end
	end
end)

-- cari base sendiri via title
local function f10()
	for key60, value154 in pairs(workspace.Bases:GetChildren()) do
		if value154.Title.TitleGui.Frame.PlayerName.Text == players.LocalPlayer.DisplayName then
			return value154
		end
	end
end

local myBase = f10()

local function f11()
	if myBase and myBase:FindFirstChild("Slots") then
		return myBase.Slots:GetChildren()
	end
	return {}
end

task.spawn(function()
	while task.wait(DelayUpgradeBrainrot) do
		if AutoUpgradeBrainrot then
			pcall(function()
				if not myBase then
					myBase = f10()
				end
				if myBase then
					for j = 1, #f11() do
						local slotIndex = j
						task.spawn(function()
							replicatedStorage.Shared.Remotes.Networking["RF/PlotAction"]
								:InvokeServer(unpack({ "Upgrade Brainrot", myBase.Name, tostring(slotIndex) }))
						end)
					end
				end
			end)
		end
	end
end)

-- ====== BASE: REBIRTH ======
task.spawn(function()
	while task.wait(DelayRebirth) do
		if AutoRebirth then
			pcall(function()
				replicatedStorage:WaitForChild("RemoteFunctions"):WaitForChild("Rebirth"):InvokeServer()
			end)
		end
	end
end)

-- ====== SELLING ======
task.spawn(function()
	while task.wait() do
		if AutoSellBrainrot then
			pcall(function()
				for key61, value155 in pairs(players.LocalPlayer.Backpack:GetChildren()) do
					if value155:IsA("Tool") then
						for key62, value156 in pairs(SelectRarityBrainrotSell) do
							local rarityFolder = replicatedStorage.Assets.Brainrots:FindFirstChild(value156)
							if value155:GetAttribute("BrainrotName") and rarityFolder
								and rarityFolder:FindFirstChild(value155:GetAttribute("BrainrotName")) then
								players.LocalPlayer.Character.Humanoid:EquipTool(value155)
								replicatedStorage:WaitForChild("RemoteFunctions"):WaitForChild("SellTool"):InvokeServer()
							end
						end
					end
				end
			end)
		end
	end
end)

task.spawn(function()
	while task.wait() do
		if AutoSellAll then
			pcall(function()
				replicatedStorage:WaitForChild("RemoteFunctions"):WaitForChild("SellAll"):InvokeServer()
			end)
		end
	end
end)

-- =====================================================================
-- MACHINE SECTION (dari CombinedMachine)
-- Auto Fuse Machine + FPS Boost + Auto Collect Money
-- =====================================================================

-- respawn handler: kalau mati langsung balik ke bawah tanah, bukan ke atas kena tsunami
players.LocalPlayer.CharacterAdded:Connect(function(char)
	char:WaitForChild("HumanoidRootPart", 5)
	task.wait(0.5)
	pcall(function()
		local hrp2 = char:FindFirstChild("HumanoidRootPart")
		if hrp2 then
			hrp2.CFrame = CFrame.new(getBasePos())
		end
	end)
end)

-- respawn handler farm: balik ke base + freeze kalau lagi farming
players.LocalPlayer.CharacterAdded:Connect(function()
	task.spawn(function()
		if AutoFarmBrainrots or AutoFarmLuckyBlock or AutoTrialTower or AutoFireAndIceSacrifice
			or AutoFarmCarnivalBoss then
			Freeze = true
			f1(CFrame.new(120, -5, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1))
		end

		if AutoGoAndBack and anyEventCollect then
			Freeze = true
			f1(CFrame.new(120, -5, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1))
		end
	end)
end)

-- langsung ke base ETFB 120,-5,0 (bawah tanah)
pcall(function()
	local hrp = players.LocalPlayer.Character and players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
	if hrp then
		hrp.CFrame = CFrame.new(120, -5, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
	end
end)
task.wait(0.5)

-- FPS Boost: semua part abu2 polos, matikan partikel/bayangan/decal
if FPSBoostEnabled then
	task.spawn(function()
		while true do
			pcall(function()
				for _, v in pairs(workspace:GetDescendants()) do
					if v:IsA("BasePart") then
						v.Color = Color3.fromRGB(150, 150, 150)
						v.Material = Enum.Material.SmoothPlastic
						v.CastShadow = false
					elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
						v.Enabled = false
					elseif v:IsA("Decal") or v:IsA("Texture") then
						v.Transparency = 1
					end
				end
				settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
				game.Lighting.GlobalShadows = false
				game.Lighting.FogEnd = 100000
			end)
			task.wait(5)
		end
	end)
end

-- Kill Walls semua map
if KillWalls then
	task.spawn(function()
		while true do
			pcall(function()
				for _, d in pairs(workspace:GetDescendants()) do
					if d.Name == "Walls" or d.Name == "VIPWalls" or d.Name == "Barriers" then
						d:Destroy()
					end
				end
			end)
			task.wait(2)
		end
	end)
end

-- Delete brainrot di base biar boost FPS (tetep ke-collect via Gen/s)
if DeleteBaseBrainrot then
	task.spawn(function()
		while true do
			pcall(function()
				local base
				for _, b in pairs(workspace.Bases:GetChildren()) do
					if b:GetAttribute("Holder") == players.LocalPlayer.UserId then
						base = b
						break
					end
				end
				if base then
					for _, c in pairs(base:GetChildren()) do
						if c.Name:find("brainrot") then
							c:Destroy() -- client-side, server tetap ngitung Gen/s
						end
					end
				end
			end)
			task.wait(3)
		end
	end)
end

-- Auto Collect Money (base sendiri, pakai firetouchinterest)
task.spawn(function()
	while true do
		if MachineCollectMoney then
			pcall(function()
				local base
				for _, b in pairs(workspace.Bases:GetChildren()) do
					if b:GetAttribute("Holder") == players.LocalPlayer.UserId then
						base = b
						break
					end
				end
				if base and players.LocalPlayer.Character
					and players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
					local hrp = players.LocalPlayer.Character.HumanoidRootPart
					for _, slot in pairs(base.Slots:GetChildren()) do
						local col = slot:FindFirstChild("Collect")
						if col then
							firetouchinterest(hrp, col, 0)
							task.wait(0.02)
							firetouchinterest(hrp, col, 1)
						end
					end
				end
			end)
		end
		task.wait(MachineCollectMoneyDelay)
	end
end)

-- ====== STATE MACHINE AUTO FUSE (10 event machines, skip Default) ======
-- Aturan penting: kalau mesin udah ada isinya ( deposit masuk, walau sempat mati ),
-- LANJUT combine - JANGAN deposit brainrot lagi.
if MachineEnabled then
	task.spawn(function()
		local networkRemote = replicatedStorage:WaitForChild("Shared"):WaitForChild("Remotes")
			:WaitForChild("Networking"):WaitForChild("RF/SpawnMachineAction")
		local spawnMachinesFolder = workspace:WaitForChild("GameObjects"):WaitForChild("PlaceSpecific")
			:WaitForChild("root"):WaitForChild("SpawnMachines")

		local function log(txt)
			print("[CombinedMachine] " .. txt)
		end

		local STATE = "IDLE"
		local currentMachine = nil
		local currentMachineName = nil
		local cooldownEnd = 0
		local emptyChecks = 0
		local missingChecks = 0
		-- mesin yang baru aja di-combine di-skip dulu di scan IDLE selama beberapa detik,
		-- biar prompt basi/stale ga bikin script combine ulang tanpa guna
		local lastCombineName = nil
		local lastCombineTime = 0
		local COMBINE_SKIP_TIME = 10
		-- berapa kali cek ulang sebelum yakin mesin kosong / mesin hilang
		-- (abis mati/respawn prompt mesin bisa telat ke-update, jangan langsung percaya)
		local EMPTY_RETRY = tonumber(cfg("Machine", "EmptyRetries")) or 3

		local function hasContent(machine)
			local main = machine:FindFirstChild("Main")
			local prompts = main and main:FindFirstChild("Prompts")
			if not prompts then
				return nil -- ga bisa dicek (model belum lengkap / ke-streaming out)
			end
			for _, d in pairs(prompts:GetDescendants()) do
				if d:IsA("ProximityPrompt") and (d.ActionText:find("1/3")
					or d.ActionText:find("2/3") or d.ActionText:find("3/3")) then
					return true
				end
			end
			return false
		end

		local function getMatching()
			local all = {}
			for _, v in ipairs(players.LocalPlayer.Backpack:GetChildren()) do
				table.insert(all, v)
			end
			if players.LocalPlayer.Character then
				for _, v in ipairs(players.LocalPlayer.Character:GetChildren()) do
					table.insert(all, v)
				end
			end
			for _, item in ipairs(all) do
				if item:IsA("Tool") then
					for _, target in ipairs(TARGET_ITEMS) do
						local dn = item:GetAttribute("DisplayName") or item.ToolTip or ""
						if string.find(string.lower(dn), string.lower(target))
							or string.find(string.lower(item.Name), string.lower(target)) then
							return item
						end
					end
				end
			end
			return nil
		end

		-- 1 langkah state machine. pake return (bukan continue) + dibungkus pcall
		-- di bawah, jadi error apapun ga matiin thread-nya
		local function step()
			if STATE == "COOLDOWN" then
				local remain = math.ceil(cooldownEnd - tick())
				if remain > 0 then
					task.wait(1)
					return
				end
				STATE = "IDLE"
			end

			-- lagi mati/respawn? tunggu dulu, jangan apa2in
			local char = players.LocalPlayer.Character
			local hrp = char and char:FindFirstChild("HumanoidRootPart")
			if not hrp then
				return
			end

			-- cari mesin aktif (skip Default & OfferMachine)
			local active = {}
			for _, child in ipairs(spawnMachinesFolder:GetChildren()) do
				if child.Name ~= "Default" and child.Name ~= "OfferMachine"
					and MACHINE_CONFIGS[child.Name] and MACHINE_CONFIGS[child.Name].enabled then
					table.insert(active, child)
				end
			end

			if #active == 0 then
				task.wait(5)
				return
			end

			if STATE == "IDLE" then
				-- CEK DULU: ada mesin yang udah keisi? (deposit sebelumnya masuk,
				-- walau client sempat mati pas/negh setelah deposit)
				-- kalau ada, anggap itu currentMachine dan lanjut COMBINE, bukan deposit lagi
				for _, m in ipairs(active) do
					if m.Name == lastCombineName and tick() - lastCombineTime < COMBINE_SKIP_TIME then
						continue -- baru aja di-combine, skip dulu
					end
					local content = hasContent(m)
					if content == true then
						currentMachine = m
						currentMachineName = m.Name
						STATE = "DEPOSITED"
						emptyChecks = 0
						missingChecks = 0
						log("Mesin " .. m.Name .. " masih ada isi, lanjut combine (ga deposit lagi)")
						return
					end
				end

				local machine = active[1]
				local item = getMatching()
				if not item then
					task.wait(3)
					return
				end
				-- pastiin di base dulu sebelum ke mesin
				local basePos = getBasePos()
				if (hrp.Position - basePos).Magnitude > 8 then
					tweenTo(basePos)
					task.wait(0.3)
				end
				if item.Parent ~= char then
					char.Humanoid:EquipTool(item)
					task.wait(0.4)
				end
				local pp = machine:FindFirstChildWhichIsA("BasePart", true)
				if pp then
					tweenTo(pp.Position + Vector3.new(0, -5, 0))
				end
				task.wait(0.3)
				local ok = pcall(function()
					return networkRemote:InvokeServer("Deposit", machine)
				end)
				if ok then
					STATE = "DEPOSITED"
					currentMachine = machine
					currentMachineName = machine.Name
					emptyChecks = 0
					missingChecks = 0
					log("Deposit " .. item.Name .. " ke " .. machine.Name .. ", lanjut combine")
					task.wait(0.5)
					tweenTo(getBasePos())
				end
				return
			end

			if STATE == "DEPOSITED" then
				-- pastiin di base bawah dulu sebelum cek & combine
				local basePos2 = getBasePos()
				if (hrp.Position - basePos2).Magnitude > 8 then
					tweenTo(basePos2)
					task.wait(0.3)
				end

				-- re-acquire mesin: model bisa ke-recreate / reference basi abis mati
				local machineNow = currentMachine
				if not machineNow or not machineNow.Parent then
					machineNow = spawnMachinesFolder:FindFirstChild(currentMachineName or "")
				end

				if not machineNow then
					-- bisa juga cuma streaming lag, jangan langsung reset
					missingChecks = missingChecks + 1
					if missingChecks >= EMPTY_RETRY then
						log("Mesin bener2 ilang, balik ke IDLE")
						STATE = "IDLE"
						currentMachine = nil
						currentMachineName = nil
						missingChecks = 0
						emptyChecks = 0
					else
						task.wait(1)
					end
					return
				end
				currentMachine = machineNow
				missingChecks = 0

				local content = hasContent(currentMachine)
				if content ~= true then
					-- nil = prompt belum kebaca (lag), false = beneran kosong
					-- dikasih retry beberapa kali biar ga salah kesimpulan abis mati/respawn
					emptyChecks = emptyChecks + 1
					if emptyChecks >= EMPTY_RETRY then
						log("Mesin kosong, balik ke IDLE buat deposit lagi")
						emptyChecks = 0
						STATE = "IDLE"
						currentMachine = nil
						currentMachineName = nil
					else
						task.wait(1)
					end
					return
				end
				emptyChecks = 0

				-- ada isi: langsung COMBINE, jangan deposit lagi
				local pp = currentMachine:FindFirstChildWhichIsA("BasePart", true)
				if pp then
					tweenTo(pp.Position + Vector3.new(0, -5, 0))
				end
				task.wait(0.3)
				-- begitu remote Combine ditembak, cooldown LANGSUNG jalan berapa pun
				-- hasilnya - jadi walau mati di detik terakhir, ga bakal lgsg deposit
				pcall(function()
					networkRemote:InvokeServer("Combine", currentMachine)
				end)
				STATE = "COOLDOWN"
				cooldownEnd = tick() + COOLDOWN_TIME
				lastCombineName = currentMachineName
				lastCombineTime = tick()
				currentMachine = nil
				currentMachineName = nil
				tweenTo(getBasePos())
				log("Combine dikirim, cooldown " .. COOLDOWN_TIME .. "s")
			end
		end

		while true do
			local ok, err = pcall(step)
			if not ok then
				log("step error (thread tetap jalan): " .. tostring(err))
			end
			task.wait(0.5)
		end
	end)
end

print("[Peak ETFB] Core loaded (no UI) - semua fitur dari getgenv().CONFIG")
