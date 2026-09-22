-- Dеоbfusсateԁ Ьу Leаkӡ | discord.gg/qteAQmfJmP

local virtualUser = game:GetService("VirtualUser")
local players = game:GetService("Players")
local workspace = game:GetService("Workspace")
local runService = game:GetService("RunService")
local tweenService = game:GetService("TweenService")
local replicatedStorage = game:GetService("ReplicatedStorage")

for key, value in pairs(getconnections(players.LocalPlayer.Idled)) do
  value:Disable()
end

players.LocalPlayer.Idled:Connect(function()
  virtualUser:CaptureController()
  virtualUser:ClickButton2(Vector2.new())
end)

setfflag("TaskSchedulerTargetFps", "240")
setfpscap(240)

task.spawn(function()
  while task.wait(5) do
  end
end)

if not workspace:FindFirstChild("BasePlate1") then
  local basePlate1 = Instance.new("Part")
  basePlate1.Name = "BasePlate1"
  basePlate1.Parent = workspace
  basePlate1.Size = Vector3.new(2047, 1, 50)
  basePlate1.CFrame = CFrame.new(1185.5, -1, 151.5, 1, 0, 0, 0, 1, 0, 0, 0, 1)
  basePlate1.Color = Color3.fromRGB(213, 115, 61)
  basePlate1.Material = Enum.Material.Plastic
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

local platform = Instance.new("Part")

if not workspace:FindFirstChild("Platform") then
  platform.Name = "Platform"
  platform.Parent = workspace
  platform.Size = Vector3.new(2048, 1, 2048)
  platform.Color = Color3.fromRGB(213, 115, 61)
  platform.Material = Enum.Material.Plastic
  platform.Anchored = true
end

runService.RenderStepped:Connect(function()
  local v1 = game
  local v2 = game

  platform.CFrame = CFrame.new(
    v1:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position.X, -15,
    v2:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position.Z
  )
end)

local function f1(cframe)
  local v3 = game
  v3:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = cframe
end

local function f2(p1)
  local tweenSpeed = EnableCustomSpeed and TweenSpeed or 1100

  local tweenInfo = TweenInfo.new((p1.Position
      - players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    / tweenSpeed, Enum.EasingStyle.Linear)

  tweenService:Create(players.LocalPlayer.Character.HumanoidRootPart, tweenInfo, { CFrame = p1 }):Play()
end

local create = nil

local function f3(p2)
  local tweenSpeed2 = EnableCustomSpeed and TweenSpeed or 1100

  local tweenInfo2 = TweenInfo.new((p2.Position
      - players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    / tweenSpeed2, Enum.EasingStyle.Linear)

  create = tweenService:Create(players.LocalPlayer.Character.HumanoidRootPart, tweenInfo2, {
    CFrame = p2,
  })

  create:Play()
end

local create2 = nil

local function f4(p3)
  if create2 then
    create2:Cancel()
  end

  local tweenSpeed3 = EnableCustomSpeed and TweenSpeed or 1100

  local tweenInfo3 = TweenInfo.new((p3.Position
      - players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    / tweenSpeed3, Enum.EasingStyle.Linear)

  create2 = tweenService:Create(players.LocalPlayer.Character.HumanoidRootPart, tweenInfo3, {
    CFrame = p3,
  })

  create2:Play()
  create2.Completed:Wait()
end

if workspace:FindFirstChild("Barriers") then
  workspace.Barriers:Destroy()
end

if workspace:FindFirstChild("___") then
  workspace.___:Destroy()
end

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

task.spawn(function()
  while task.wait() do
    if workspace:FindFirstChild("VIPWalls", true) then
      workspace:FindFirstChild("VIPWalls", true):Destroy()
    end
  end
end)

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

local v4 = {}

for key5, value5 in pairs(replicatedStorage.Assets.Brainrots:GetChildren()) do
  table.insert(v4, value5.Name)
end

for key6, value6 in pairs(v4) do
  for key7, value7 in pairs(replicatedStorage.Assets.Brainrots[value6]:GetChildren()) do
  end
end

local v5 = {}

for key8, value8 in pairs(replicatedStorage.Shared.Mutations:GetChildren()) do
  if value8.Name ~= "DevTestMut" then
    table.insert(v5, value8.Name)
  end
end

local v6 = {}

for key9, value9 in pairs(replicatedStorage.Shared.Traits:GetChildren()) do
  table.insert(v6, value9.Name)
end

local v7 = {}

for key10, value10 in pairs(replicatedStorage.Assets.LuckyBlocks:GetChildren()) do
  if value10.Name ~= "Default" then
    table.insert(v7, value10.Name)
  end
end

local v8 = {}

for index, value11 in ipairs(workspace:GetDescendants()) do
  if value11.Name == "Gaps" then
    for i = 1, 9 do
      local findFirstChild = value11:FindFirstChild("Gap" .. i)

      if findFirstChild then
        v8[i] = findFirstChild:GetPivot()
      end
    end
  end
end

local solixUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/VuRobloxViet/LibraryUI/refs/heads/main/SolixUI.lua"))()
local window = solixUI:Window({ Name = "Vu Hub | Escape Tsunami For Brainrot" })
solixUI:Notification("Success!", "Succesfully loaded script.", 5)
local autoFarmPage = window:Page({ Name = "Auto Farm", Columns = 2 })

local settingFarmSection = autoFarmPage:Section({ Name = "Setting Farm", Side = 1 })

settingFarmSection:Slider({
  Name = "Speed Farm",
  Default = 1100,
  Min = 1,
  Max = 1500,
  Decimals = 5,
  Callback = function(value12) TweenSpeed = value12 end,
})

settingFarmSection:Toggle({
  Name = "Enable Custom Speed",
  Default = false,
  Callback = function(value13) EnableCustomSpeed = value13 end,
})

local brainrotSection = autoFarmPage:Section({ Name = "Brainrot", Side = 1 })

brainrotSection:Dropdown({
  Name = "Select Rarity",
  Items = v4,
  Multi = true,
  Callback = function(value14) SelectRarityBrainrot = value14 end,
})

brainrotSection:Dropdown({
  Name = "Select Mutation",
  Items = v5,
  Multi = true,
  Callback = function(value15) SelectBrainrotMutation = value15 end,
})

brainrotSection:Dropdown({
  Name = "Select Trait",
  Items = v6,
  Multi = true,
  Callback = function(value16) SelectBrainrotTrait = value16 end,
})

brainrotSection:Toggle({
  Name = "Auto Farm Brainrot",
  Default = false,
  Callback = function(value17)
    AutoFarmBrainrots = value17

    if AutoFarmBrainrots == true then
      if players.LocalPlayer:GetAttribute("CurrentState") == "Base" then
        f1(CFrame.new(120, -5, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1))
      else
        players.LocalPlayer:SetAttribute("CurrentState", "Base")
      end
    end

    if AutoFarmBrainrots == false then
      if players.LocalPlayer:GetAttribute("CurrentState") == "Base" then
        f1(CFrame.new(120, -5, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1) * CFrame.new(0, 11, 0))
      else
        players.LocalPlayer:SetAttribute("CurrentState", "Base")
      end
    end
  end,
})

local trialTowerSection = autoFarmPage:Section({ Name = "Trial Tower", Side = 1 })

trialTowerSection:Slider({
  Name = "Custom Tower Limit",
  Default = 20,
  Min = 3,
  Max = 20,
  Callback = function(value18) CustomTowerLimit = value18 end,
})

trialTowerSection:Toggle({
  Name = "Auto Trial Tower",
  Default = false,
  Callback = function(value19)
    AutoTrialTower = value19

    if AutoTrialTower == true then
      if game.Players.LocalPlayer.PlayerGui.TowerTrialHUD.TrialBar.Visible == false then
        game.Players.LocalPlayer.PlayerGui.TowerTrialHUD.TrialBar.Requirement.Text = ""
      end

      if players.LocalPlayer:GetAttribute("CurrentState") == "Base" then
        f1(CFrame.new(120, -5, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1))
      else
        players.LocalPlayer:SetAttribute("CurrentState", "Base")
      end
    end

    if AutoTrialTower == false then
      if players.LocalPlayer:GetAttribute("CurrentState") == "Base" then
        f1(CFrame.new(120, -5, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1) * CFrame.new(0, 11, 0))
      else
        players.LocalPlayer:SetAttribute("CurrentState", "Base")
      end
    end
  end,
})

local luckyBlockSection = autoFarmPage:Section({ Name = "Lucky Block", Side = 2 })

luckyBlockSection:Dropdown({
  Name = "Select Rarity",
  Items = v7,
  Multi = true,
  Callback = function(value20) SelectRarityLuckyBlock = value20 end,
})

luckyBlockSection:Dropdown({
  Name = "Select Mutation",
  Items = v5,
  Multi = true,
  Callback = function(value21) SelectLuckyBlockMutation = value21 end,
})

luckyBlockSection:Dropdown({
  Name = "Select Trait",
  Items = v6,
  Multi = true,
  Callback = function(value22) SelectLuckyBlockTrait = value22 end,
})

luckyBlockSection:Toggle({
  Name = "Auto Farm Lucky Block",
  Default = false,
  Callback = function(value23)
    AutoFarmLuckyBlock = value23

    if AutoFarmLuckyBlock == true then
      if players.LocalPlayer:GetAttribute("CurrentState") == "Base" then
        f1(CFrame.new(120, -5, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1))
      else
        players.LocalPlayer:SetAttribute("CurrentState", "Base")
      end
    end

    if AutoFarmLuckyBlock == false then
      if players.LocalPlayer:GetAttribute("CurrentState") == "Base" then
        f1(CFrame.new(120, -5, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1) * CFrame.new(0, 11, 0))
      else
        players.LocalPlayer:SetAttribute("CurrentState", "Base")
      end
    end
  end,
})

autoFarmPage:Section({ Name = "Open Lucky Block", Side = 2 }):Toggle({
  Name = "Auto Open Lucky Block",
  Default = false,
  Callback = function(value24) AutoOpenLuckyBlock = value24 end,
})

local eventPage = window:Page({ Name = "Event", Columns = 2 })

eventPage:Section({ Name = "Setting Farm Collect Event", Side = 1 }):Toggle({
  Name = "Auto Go And Back",
  Default = true,
  Callback = function(value25) AutoGoAndBack = value25 end,
})

local carnivalEventSection = eventPage:Section({ Name = "Carnival Event", Side = 1 })

carnivalEventSection:Toggle({
  Name = "Auto Farm Carnival Boss",
  Default = false,
  Callback = function(value26) AutoFarmCarnivalBoss = value26 end,
})

carnivalEventSection:Toggle({
  Name = "Auto Collect Carnival Coin",
  Default = false,
  Callback = function(value27)
    AutoCollectCarnivalCoin = value27

    if AutoGoAndBack == true then
      f1(CFrame.new(120, -5, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1))
    end

    if AutoGoAndBack then
      if not AutoCollectCarnivalCoin then
        Freeze(false)
      end
    end
  end,
})

carnivalEventSection:Toggle({
  Name = "Auto Spin Carnival Wheel",
  Default = false,
  Callback = function(value28) AutoSpinCarnivalWheel = value28 end,
})

local section = eventPage:Section({ Name = "St Patricks Event", Side = 1 })

section:Dropdown({
  Name = "Select Rarity",
  Items = v4,
  Multi = true,
  Callback = function(value29) SelectRarityBrainrotStPatricksSacrifice = value29 end,
})

section:Toggle({
  Name = "Auto St Patricks Sacrifice",
  Default = false,
  Callback = function(value30)
    AutoStPatricksSacrifice = value30

    if AutoStPatricksSacrifice == true then
      if players.LocalPlayer:GetAttribute("CurrentState") == "Base" then
        f1(CFrame.new(120, -5, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1))
      else
        players.LocalPlayer:SetAttribute("CurrentState", "Base")
      end
    end

    if AutoStPatricksSacrifice == false then
      if players.LocalPlayer:GetAttribute("CurrentState") == "Base" then
        f1(CFrame.new(120, -5, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1) * CFrame.new(0, 11, 0))
      else
        players.LocalPlayer:SetAttribute("CurrentState", "Base")
      end
    end
  end,
})

section:Toggle({
  Name = "Auto Collect St Patricks Coin",
  Default = false,
  Callback = function(value31)
    AutoCollectStPatricksCoin = value31

    if AutoGoAndBack == true then
      f1(CFrame.new(120, -5, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1))
    end

    if AutoGoAndBack then
      if not AutoCollectStPatricksCoin then
        Freeze(false)
      end
    end
  end,
})

section:Toggle({
  Name = "Auto Spin St Patricks Wheel",
  Default = false,
  Callback = function(value32) AutoSpinStPatricksWheel = value32 end,
})

local phantomEventSection = eventPage:Section({ Name = "Phantom Event", Side = 2 })

phantomEventSection:Toggle({
  Name = "Auto Collect Phantom Orb",
  Default = false,
  Callback = function(value33)
    AutoCollectPhantomOrb = value33

    if AutoGoAndBack == true then
      f1(CFrame.new(120, -5, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1))
    end

    if AutoGoAndBack then
      if not AutoCollectPhantomOrb then
        Freeze(false)
      end
    end
  end,
})

phantomEventSection:Toggle({
  Name = "Instant Submit",
  Default = false,
  Callback = function(value34) InstantSubmitPhantomCannon = value34 end,
})

phantomEventSection:Toggle({
  Name = "Auto Collect Phantom Coin",
  Default = false,
  Callback = function(value35)
    AutoCollectPhantomCoin = value35

    if AutoGoAndBack == true then
      f1(CFrame.new(120, -5, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1))
    end

    if AutoGoAndBack then
      if not AutoCollectPhantomCoin then
        Freeze(false)
      end
    end
  end,
})

phantomEventSection:Toggle({
  Name = "Auto Collect Phantom Shard",
  Default = false,
  Callback = function(value36)
    AutoCollectPhantomShard = value36

    if AutoGoAndBack == true then
      f1(CFrame.new(120, -5, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1))
    end

    if AutoGoAndBack then
      if not AutoCollectPhantomShard then
        Freeze(false)
      end
    end
  end,
})

phantomEventSection:Toggle({
  Name = "Auto Farm Phantom Chest",
  Default = false,
  Callback = function(value37) AutoFarmPhantomChest = value37 end,
})

phantomEventSection:Toggle({
  Name = "Auto Farm Phantom Loot Crate",
  Default = false,
  Callback = function(value38) AutoFarmPhantomLootCrate = value38 end,
})

phantomEventSection:Toggle({
  Name = "Auto Farm Phantom Enemies",
  Default = false,
  Callback = function(value39) AutoFarmPhantomEnemies = value39 end,
})

phantomEventSection:Toggle({
  Name = "Auto Farm Phantom Brainrot",
  Default = false,
  Callback = function(value40) AutoFarmPhantomBrainrot = value40 end,
})

phantomEventSection:Toggle({
  Name = "Auto Farm Phantom Lucky Block",
  Default = false,
  Callback = function(value41) AutoFarmPhantomLuckyBlock = value41 end,
})

phantomEventSection:Toggle({
  Name = "Auto Spin Phantom Wheel",
  Default = false,
  Callback = function(value42) AutoSpinPhantomWheel = value42 end,
})

local section2 = eventPage:Section({ Name = "Fire And Ice Event", Side = 2 })

section2:Dropdown({
  Name = "Select Rarity",
  Items = v4,
  Multi = true,
  Callback = function(value43) SelectRarityBrainrotSacrifice = value43 end,
})

section2:Toggle({
  Name = "Auto Fire And Ice Sacrifice",
  Default = false,
  Callback = function(value44)
    AutoFireAndIceSacrifice = value44

    if AutoStPatricksSacrifice == true then
      if players.LocalPlayer:GetAttribute("CurrentState") == "Base" then
        f1(CFrame.new(120, -5, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1))
      else
        players.LocalPlayer:SetAttribute("CurrentState", "Base")
      end
    end

    if AutoFireAndIceSacrifice == false then
      if players.LocalPlayer:GetAttribute("CurrentState") == "Base" then
        f1(CFrame.new(120, -5, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1) * CFrame.new(0, 11, 0))
      else
        players.LocalPlayer:SetAttribute("CurrentState", "Base")
      end
    end
  end,
})

section2:Toggle({
  Name = "Auto Collect Fire And Ice Coin",
  Default = false,
  Callback = function(value45)
    AutoCollectFireAndIceCoin = value45

    if AutoGoAndBack == true then
      f1(CFrame.new(120, -5, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1))
    end

    if AutoGoAndBack then
      if not AutoCollectFireAndIceCoin then
        Freeze(false)
      end
    end
  end,
})

section2:Toggle({
  Name = "Auto Spin Fire And Ice Wheel",
  Default = false,
  Callback = function(value46) AutoSpinFireAndIceWheel = value46 end,
})

local event2Page = window:Page({ Name = "Event 2", Columns = 2 })

local doomEventSection = event2Page:Section({ Name = "Doom Event", Side = 1 })

doomEventSection:Toggle({
  Name = "Auto Press Button Of Doom",
  Default = false,
  Callback = function(value47) AutoPressButtonOfDoom = value47 end,
})

doomEventSection:Toggle({
  Name = "Auto Collect Doom Coin",
  Default = false,
  Callback = function(value48)
    AutoCollectDoomCoin = value48

    if AutoGoAndBack == true then
      f1(CFrame.new(120, -5, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1))
    end

    if AutoGoAndBack then
      if not AutoCollectDoomCoin then
        Freeze(false)
      end
    end
  end,
})

doomEventSection:Toggle({
  Name = "Auto Spin Doom Wheel",
  Default = false,
  Callback = function(value49) AutoSpinDoomWheel = value49 end,
})

local valentineEventSection = event2Page:Section({ Name = "Valentine Event", Side = 1 })

valentineEventSection:Toggle({
  Name = "Auto Collect Valentine Candy",
  Default = false,
  Callback = function(value50)
    AutoCollectValentineCandy = value50

    if AutoGoAndBack == true then
      f1(CFrame.new(120, -5, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1))
    end

    if AutoGoAndBack then
      if not AutoCollectValentineCandy then
        Freeze(false)
      end
    end
  end,
})

valentineEventSection:Toggle({
  Name = "Auto Collect Valentine Coin",
  Default = false,
  Callback = function(value51)
    AutoCollectValentineCoin = value51

    if AutoGoAndBack == true then
      f1(CFrame.new(120, -5, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1))
    end

    if AutoGoAndBack then
      if not AutoCollectValentineCoin then
        Freeze(false)
      end
    end
  end,
})

valentineEventSection:Toggle({
  Name = "Auto Submit Candygram Station",
  Default = false,
  Callback = function(value52) AutoSubmitCandygramStation = value52 end,
})

valentineEventSection:Toggle({
  Name = "Auto Spin Valentine Wheel",
  Default = false,
  Callback = function(value53) AutoSpinValentineWheel = value53 end,
})

local arcadeEventSection = event2Page:Section({ Name = "Arcade Event", Side = 1 })

arcadeEventSection:Toggle({
  Name = "Auto Collect Game Console",
  Default = false,
  Callback = function(value54)
    AutoCollectGameConsole = value54

    if AutoGoAndBack == true then
      f1(CFrame.new(120, -5, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1))
    end

    if AutoGoAndBack then
      if not AutoCollectGameConsole then
        Freeze(false)
      end
    end
  end,
})

arcadeEventSection:Toggle({
  Name = "Auto Collect Arcade Ticket",
  Default = false,
  Callback = function(value55)
    AutoCollectArcadeTicket = value55

    if AutoGoAndBack == true then
      f1(CFrame.new(120, -5, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1))
    end

    if AutoGoAndBack then
      if not AutoCollectArcadeTicket then
        Freeze(false)
      end
    end
  end,
})

arcadeEventSection:Toggle({
  Name = "Auto Spent 3 Arcade Ticket",
  Default = false,
  Callback = function(value56) AutoSpent3ArcadeTicket = value56 end,
})

arcadeEventSection:Toggle({
  Name = "Auto Spin Arcade Wheel",
  Default = false,
  Callback = function(value57) AutoSpinArcadeWheel = value57 end,
})

arcadeEventSection:Button():Add("Teleport Gaming Room", function()
  if workspace:FindFirstChild("ArcadeMap_SharedInstances") then
    f2(workspace.ArcadeMap_SharedInstances.AllowedSpaces.GamerRoom.CFrame)
  end
end, false)

local moneyEventSection = event2Page:Section({ Name = "Money Event", Side = 2 })

moneyEventSection:Toggle({
  Name = "Auto Collect Gold Bar",
  Default = false,
  Callback = function(value58)
    AutoCollectGoldBar = value58

    if AutoGoAndBack == true then
      f1(CFrame.new(120, -5, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1))
    end

    if AutoGoAndBack then
      if not AutoCollectGoldBar then
        Freeze(false)
      end
    end
  end,
})

moneyEventSection:Toggle({
  Name = "Auto Complete Money Obby",
  Default = false,
  Callback = function(value59) AutoCompleteMoneyObby = value59 end,
})

moneyEventSection:Toggle({
  Name = "Auto Spin Money Wheel",
  Default = false,
  Callback = function(value60) AutoSpinMoneyWheel = value60 end,
})

local ufoEventSection = event2Page:Section({ Name = "UFO Event", Side = 2 })

ufoEventSection:Toggle({
  Name = "Auto Collect UFO Coin",
  Default = false,
  Callback = function(value61)
    AutoCollectUFOCoin = value61

    if AutoGoAndBack == true then
      f1(CFrame.new(120, -5, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1))
    end

    if AutoGoAndBack then
      if not AutoCollectUFOCoin then
        Freeze(false)
      end
    end
  end,
})

ufoEventSection:Toggle({
  Name = "Auto Spin UFO Wheel",
  Default = false,
  Callback = function(value62) AutoSpinUFOWheel = value62 end,
})

local radioactiveEventSection = event2Page:Section({ Name = "Radioactive Event", Side = 2 })

radioactiveEventSection:Toggle({
  Name = "Auto Collect Radioactive Coin",
  Default = false,
  Callback = function(value63)
    AutoCollectRadioactiveCoin = value63

    if AutoGoAndBack == true then
      f1(CFrame.new(120, -5, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1))
    end

    if AutoGoAndBack then
      if not AutoCollectRadioactiveCoin then
        Freeze(false)
      end
    end
  end,
})

radioactiveEventSection:Toggle({
  Name = "Auto Collect Radioactive Coin Bomb",
  Default = false,
  Callback = function(value64)
    AutoCollectRadioactiveCoinBomb = value64

    if AutoGoAndBack == true then
      f1(CFrame.new(120, -5, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1))
    end

    if AutoGoAndBack then
      if not AutoCollectRadioactiveCoinBomb then
        Freeze(false)
      end
    end
  end,
})

radioactiveEventSection:Toggle({
  Name = "Auto Complete Radioactive Obby",
  Default = false,
  Callback = function(value65) AutoCompleteRadioactiveObby = value65 end,
})

radioactiveEventSection:Toggle({
  Name = "Auto Spin Radioactive Wheel",
  Default = false,
  Callback = function(value66) AutoSpinRadioactiveWheel = value66 end,
})

local basePage = window:Page({ Name = "Base", Columns = 2 })

local collectCashSection = basePage:Section({ Name = "Collect Cash", Side = 1 })

collectCashSection:Toggle({
  Name = "Auto Collect Cash",
  Default = false,
  Callback = function(value67) AutoCollectCash = value67 end,
})

collectCashSection:Slider({
  Name = "Delay (s)",
  Default = 0,
  Min = 0,
  Max = 5,
  Decimals = 0.1,
  Callback = function(value68) DelayCollectCash = value68 end,
})

local upgradeSpeedSection = basePage:Section({ Name = "Upgrade Speed", Side = 1 })

upgradeSpeedSection:Toggle({
  Name = "Auto Upgrade Speed",
  Default = false,
  Callback = function(value69) AutoUpgradeSpeed = value69 end,
})

upgradeSpeedSection:Slider({
  Name = "Delay (s)",
  Default = 0,
  Min = 0,
  Max = 0,
  Decimals = 0.15,
  Callback = function(value70) DelayUpgradeSpeed = value70 end,
})

local upgradeCarrySection = basePage:Section({ Name = "Upgrade Carry", Side = 1 })

upgradeCarrySection:Toggle({
  Name = "Auto Upgrade Carry",
  Default = false,
  Callback = function(value71) AutoUpgradeCarry = value71 end,
})

upgradeCarrySection:Slider({
  Name = "Delay (s)",
  Default = 0,
  Min = 0,
  Max = 5,
  Decimals = 0.1,
  Callback = function(value72) DelayUpgradeCarry = value72 end,
})

local upgradeJumpSection = basePage:Section({ Name = "Upgrade Jump", Side = 1 })

upgradeJumpSection:Toggle({
  Name = "Auto Upgrade Jump",
  Default = false,
  Callback = function(value73) AutoUpgradeJump = value73 end,
})

upgradeJumpSection:Slider({
  Name = "Delay (s)",
  Default = 0,
  Min = 0,
  Max = 5,
  Decimals = 0.1,
  Callback = function(value74) DelayUpgradeJump = value74 end,
})

local upgradeBaseSection = basePage:Section({ Name = "Upgrade Base", Side = 2 })

upgradeBaseSection:Toggle({
  Name = "Auto Upgrade Base",
  Default = false,
  Callback = function(value75) AutoUpgradeBase = value75 end,
})

upgradeBaseSection:Slider({
  Name = "Delay (s)",
  Default = 0,
  Min = 0,
  Max = 5,
  Decimals = 0.1,
  Callback = function(value76) DelayUpgradeBase = value76 end,
})

local upgradeBrainrotSection = basePage:Section({ Name = "Upgrade Brainrot", Side = 2 })

upgradeBrainrotSection:Toggle({
  Name = "Auto Upgrade Brainrot",
  Default = false,
  Callback = function(value77) AutoUpgradeBrainrot = value77 end,
})

upgradeBrainrotSection:Slider({
  Name = "Delay (s)",
  Default = 0.05,
  Min = 0,
  Max = 5,
  Decimals = 0.01,
  Callback = function(value78) DelayUpgradeBrainrot = value78 end,
})

local rebirthSection = basePage:Section({ Name = "Rebirth", Side = 2 })

rebirthSection:Toggle({
  Name = "Auto Rebirth",
  Default = false,
  Callback = function(value79) AutoRebirth = value79 end,
})

rebirthSection:Slider({
  Name = "Delay (s)",
  Default = 0,
  Min = 0,
  Max = 5,
  Decimals = 0.1,
  Callback = function(value80) DelayRebirth = value80 end,
})

local sellingPage = window:Page({ Name = "Selling", Columns = 1 })

local sellingSection = sellingPage:Section({ Name = "Selling", Side = 1 })

sellingSection:Dropdown({
  Name = "Select Rarity",
  Items = v4,
  Multi = true,
  Callback = function(value81) SelectRarityBrainrotSell = value81 end,
})

sellingSection:Toggle({
  Name = "Auto Sell Brainrot",
  Default = false,
  Callback = function(value82) AutoSellBrainrot = value82 end,
})

sellingPage:Section({ Name = "Sell All", Side = 1 }):Toggle({
  Name = "Auto Sell All",
  Default = false,
  Callback = function(value83) AutoSellAll = value83 end,
})

local settingsPage = window:Page({ Name = "Settings", Columns = 2 })
local configsSection = settingsPage:Section({ Name = "Configs", Side = 2 })
local configs

local configsDropdown = configsSection:Dropdown({
  Name = "Configs",
  Flag = "ConfigsList",
  Items = {},
  Multi = false,
  Callback = function(value84) configs = value84 end,
})

local name

configsSection:Textbox({
  Name = "Name",
  Default = "",
  Flag = "ConfigName",
  Placeholder = "...",
  Callback = function(value85) name = value85 end,
})

local button = configsSection:Button()

button:Add("Create", function()
  if name and name ~= "" then
    writefile(
      solixUI.Folders.Configs .. "/" .. name .. tostring(game.GameId) .. ".json",
      solixUI:GetConfig()
    )

    solixUI:RefreshConfigsList(configsDropdown)
  end
end, false)

button:Add("Delete", function()
  if configs then
    solixUI:DeleteConfig(string.gsub(configs, ".json", "") .. "" .. game.GameId .. ".json")
    solixUI:RefreshConfigsList(configsDropdown)
  end
end, false)

local button2 = configsSection:Button()

button2:Add("Load", function()
  if configs then
    local v9 = string.gsub(configs, ".json", "")

    local v10, v11 = solixUI:LoadConfig(readfile(solixUI.Folders.Configs .. "/" .. v9 .. ""
      .. game.GameId .. ".json"))

    if v10 then
      solixUI:Notification("Success!", "Succesfully loaded config.", 5)
      task.wait(0.3)

      solixUI:Thread(function()
        for v12, v13 in solixUI.Theme, nil, nil do
          solixUI.Theme[v12] = solixUI.Flags["Theme" .. v12].Color
          solixUI:ChangeTheme(v12, solixUI.Flags["Theme" .. v12].Color)
        end
      end)
    else
      solixUI:Notification("Error!", [[
Failed to load config. Report this to the developers:
]] .. v11, 5)
    end
  end
end, false)

button2:Add("Save", function()
  local v14

  if configs then
    v14 = string.gsub(configs, ".json", "")
    v14 = v14 .. "" .. game.GameId .. ".json"

    local v15, v16 = solixUI:SafeCall(function()
      writefile(solixUI.Folders.Configs .. "/" .. v14, solixUI:GetConfig())
    end)

    if not v15 then
      solixUI:Notification("Error!", [[
Failed to save config. Report this to the developers:
]] .. v16, 5)
    else
      solixUI:Notification("Success!", "Succesfully saved config.", 5)
    end
  end
end, false)

configsSection:Button():Add(
  "Refresh", function() solixUI:RefreshConfigsList(configsDropdown) end, false
)

local button3 = configsSection:Button()

button3:Add("Set autoload", function()
  if configs then
    local v17 = string.gsub(configs, ".json", "")

    writefile(
      solixUI.Folders.Directory .. "/autoload.json",
      readfile(solixUI.Folders.Configs .. "/" .. v17 .. "" .. game.GameId .. ".json")
    )

    solixUI:Notification("Success!", "Succesfully set autoload.", 5)
  end
end)

button3:Add("Clear autoload", function()
  writefile(solixUI.Folders.Directory .. "/autoload.json", "")
end)

configsSection:Toggle({
  Name = "Watermark",
  Flag = "WatermarkEnabled",
  Default = false,
  Callback = function(value86) Watermark:SetVisible(value86) end,
})

configsSection:Toggle({
  Name = "Keybind list",
  Flag = "Keybind list",
  Default = false,
  Callback = function(value87) KeybindList:SetVisible(value87) end,
})

solixUI:RefreshConfigsList(configsDropdown)
local themesSection = settingsPage:Section({ Name = "Themes", Side = 1 })
local themes

local themesDropdown = themesSection:Dropdown({
  Name = "Themes",
  Flag = "ThemesList",
  Items = {},
  Multi = false,
  Callback = function(value88) themes = value88 end,
})

local name2

themesSection:Textbox({
  Name = "Name",
  Default = "",
  Flag = "ThemeName",
  Placeholder = "...",
  Callback = function(value89) name2 = value89 end,
})

local button4 = themesSection:Button()

button4:Add("Create", function()
  if name2 and name2 ~= "" then
    writefile(solixUI.Folders.Themes .. "/" .. name2 .. ".json", solixUI:GetConfig())
    solixUI:RefreshConfigsList(themesDropdown)
  end
end, false)

button4:Add("Delete", function()
  if themes then
    solixUI:DeleteConfig(themes)
    solixUI:RefreshConfigsList(themesDropdown)
  end
end, false)

local button5 = themesSection:Button()

button5:Add("Load", function()
  if themes then
    local v18, v19 = solixUI:LoadTheme(readfile(solixUI.Folders.Themes .. "/" .. themes))

    if v18 then
      solixUI:Notification("Success!", "Succesfully loaded theme.", 5)
      task.wait(0.3)

      solixUI:Thread(function()
        for v20, v21 in solixUI.Theme, nil, nil do
          solixUI.Theme[v20] = solixUI.Flags["Theme" .. v20].Color
          solixUI:ChangeTheme(v20, solixUI.Flags["Theme" .. v20].Color)
        end
      end)
    else
      solixUI:Notification("Error!", [[
Failed to load theme. Report this to the developers:
]] .. v19, 5)
    end
  end
end, false)

button5:Add("Save", function()
  if themes then
    local v22, v23 = solixUI:SafeCall(function()
      writefile(solixUI.Folders.Themes .. "/" .. themes, solixUI:GetTheme())
    end)

    if not v22 then
      solixUI:Notification("Error!", [[
Failed to save theme. Report this to the developers:
]] .. v23, 5)
    else
      solixUI:Notification("Success!", "Succesfully saved theme.", 5)
    end
  end
end, false)

themesSection:Button():Add(
  "Refresh", function() solixUI:RefreshThemesList(themesDropdown) end, false
)

local themesPresetDropdown = themesSection:Dropdown({
  Name = "Themes Preset",
  Flag = "ThemesPresetList",
  Items = {},
  Multi = false,
  Callback = function(value90)
    local v24 = solixUI.Themes[value90]

    if not v24 then
      return
    end

    for v25, v26 in solixUI.Theme, nil, nil do
      solixUI.Theme[v25] = v24[v25]
      solixUI:ChangeTheme(v25, v24[v25])
      solixUI.ThemeColorpickers[v25]:Set(v24[v25])
    end

    task.wait(0.3)

    solixUI:Thread(function()
      for v27, v28 in solixUI.Theme, nil, nil do
        solixUI.Theme[v27] = solixUI.Flags["Theme" .. v27].Color
        solixUI:ChangeTheme(v27, solixUI.Flags["Theme" .. v27].Color)
      end
    end)
  end,
})

for v29, v30 in solixUI.Themes, nil, nil do
  themesPresetDropdown:Add(v29)
end

solixUI:RefreshThemesList(themesDropdown)

local settingsSection = settingsPage:Section({ Name = "Settings", Side = 2 })

settingsSection:Label("Menu keybind", "Left"):Keybind({
  Name = "Menu keybind",
  Flag = "Menu Keybind",
  Default = Enum.KeyCode.RightControl,
  Mode = "Toggle",
  Callback = function(value91) solixUI.MenuKeybind = solixUI.Flags["Menu Keybind"].Key end,
})

settingsSection:Slider({
  Name = "Background opacity",
  Min = 0,
  Max = 1,
  Default = 0.3,
  Decimals = 0.01,
  Flag = "Background opacity",
  Callback = function(value92) window:SetBackgroundTransparency(value92) end,
})

settingsSection:Slider({
  Name = "Tween time",
  Min = 0,
  Max = 5,
  Default = 0.25,
  Decimals = 0.01,
  Flag = "Tween Time",
  Callback = function(value93) solixUI.Tween.Time = value93 end,
})

settingsSection:Dropdown({
  Name = "Style",
  Flag = "TweenStyle",
  Default = "Cubic",
  Items = {
    "Linear", "Sine", "Quad", "Cubic", "Quart", "Quint", "Exponential", "Circular", "Back",
    "Elastic", "Bounce",
  },
  Callback = function(value94) solixUI.Tween.Style = Enum.EasingStyle[value94] end,
})

settingsSection:Dropdown({
  Name = "Direction",
  Flag = "TweenDirection",
  Default = "Out",
  Items = { "In", "Out", "InOut" },
  Callback = function(value95) solixUI.Tween.Direction = Enum.EasingDirection[value95] end,
})

local themeSection = settingsPage:Section({ Name = "Theme", Side = 1 })

for v31, v32 in solixUI.Theme, nil, nil do
  local v33 = v31
  local label = themeSection:Label(v33, "Left")

  solixUI.ThemeColorpickers[v33] = label:Colorpicker({
    Name = v33,
    Default = v32,
    Flag = "Theme" .. v33,
    Callback = function(value96)
      solixUI.Theme[v33] = value96
      solixUI:ChangeTheme(v33, value96)
    end,
  })
end

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

players.LocalPlayer.CharacterAdded:Connect(function()
  task.spawn(function()
    if AutoFarmBrainrots or AutoFarmLuckyBlock or AutoTrialTower or AutoFireAndIceSacrifice
      or AutoFarmCarnivalBoss then
      Freeze = true
      f1(CFrame.new(120, -5, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1))
    end

    if AutoGoAndBack then
      local autoCollectCarnivalCoin = AutoCollectCarnivalCoin
      local v34 = autoCollectCarnivalCoin

      if not autoCollectCarnivalCoin then
        local autoCollectStPatricksCoin = AutoCollectStPatricksCoin
        local v35 = autoCollectStPatricksCoin

        if not autoCollectStPatricksCoin then
          local autoCollectPhantomCoin = AutoCollectPhantomCoin
          local v36 = autoCollectPhantomCoin

          if not autoCollectPhantomCoin then
            local autoCollectPhantomOrb = AutoCollectPhantomOrb
            local v37 = autoCollectPhantomOrb

            if not autoCollectPhantomOrb then
              local autoCollectPhantomShard = AutoCollectPhantomShard
              local v38 = autoCollectPhantomShard

              if not autoCollectPhantomShard then
                local autoCollectFireAndIceCoin = AutoCollectFireAndIceCoin
                local v39 = autoCollectFireAndIceCoin

                if not autoCollectFireAndIceCoin then
                  local autoCollectDoomCoin = AutoCollectDoomCoin

                  local autoCollectValentineCandy = autoCollectDoomCoin
                    or AutoCollectValentineCandy or AutoCollectValentineCoin
                    or AutoCollectGameConsole or AutoCollectArcadeTicket or AutoCollectGoldBar
                    or AutoCollectUFOCoin or AutoCollectRadioactiveCoin
                    or AutoCollectRadioactiveCoinBomb

                  v39 = autoCollectValentineCandy
                end

                v38 = v39
              end

              v37 = v38
            end

            v36 = v37
          end

          v35 = v36
        end

        v34 = v35
      end

      if v34 then
        Freeze = true
        f1(CFrame.new(120, -5, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1))
      end
    end
  end)
end)

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

task.spawn(function()
  while task.wait() do
    if AutoOpenLuckyBlock then
      pcall(function()
        for key22, value110 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
          if value110:IsA("Tool") then
            if value110:GetAttribute("LuckyBlockTool") == true then
              players.LocalPlayer.Character.Humanoid:EquipTool(value110)
              replicatedStorage.Shared.Remotes.Networking["RE/LuckyBlocks/OpenLuckyBlockTool"]:FireServer(players.LocalPlayer.Character:FindFirstChildOfClass("Tool"))
            end
          end
        end
      end)
    end
  end
end)

local v44 = false
local v45 = false
local contentText = "0/20"

players.LocalPlayer.PlayerGui.NewNotifications.Items.ChildAdded:Connect(function(child)
  local function f7()
    if child:FindFirstChild("TextLabel").Text
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
          if players.LocalPlayer.PlayerGui.TowerTrialHUD.TrialBar.Requirement.ContentText
            == "Tower Trial: Common" then
            f2(workspace.ActiveBrainrots.Common.RenderedBrainrot.Root.CFrame
              * CFrame.new(0, -5, 0))

            fireproximityprompt(workspace.ActiveBrainrots.Common.RenderedBrainrot.Root.TakePrompt)
          elseif players.LocalPlayer.PlayerGui.TowerTrialHUD.TrialBar.Requirement.ContentText
            == "Tower Trial: Uncommon" then
            f2(workspace.ActiveBrainrots.Uncommon.RenderedBrainrot.Root.CFrame
              * CFrame.new(0, -5, 0))

            fireproximityprompt(workspace.ActiveBrainrots.Uncommon.RenderedBrainrot.Root.TakePrompt)
          elseif players.LocalPlayer.PlayerGui.TowerTrialHUD.TrialBar.Requirement.ContentText
            == "Tower Trial: Rare" then
            f2(workspace.ActiveBrainrots.Rare.RenderedBrainrot.Root.CFrame * CFrame.new(0, -5, 0))
            fireproximityprompt(workspace.ActiveBrainrots.Rare.RenderedBrainrot.Root.TakePrompt)
          elseif players.LocalPlayer.PlayerGui.TowerTrialHUD.TrialBar.Requirement.ContentText
            == "Tower Trial: Epic" then
            f2(workspace.ActiveBrainrots.Epic.RenderedBrainrot.Root.CFrame * CFrame.new(0, -5, 0))
            fireproximityprompt(workspace.ActiveBrainrots.Epic.RenderedBrainrot.Root.TakePrompt)
          elseif players.LocalPlayer.PlayerGui.TowerTrialHUD.TrialBar.Requirement.ContentText
            == "Tower Trial: Legendary" then
            f2(workspace.ActiveBrainrots.Legendary.RenderedBrainrot.Root.CFrame
              * CFrame.new(0, -5, 0))

            fireproximityprompt(workspace.ActiveBrainrots.Legendary.RenderedBrainrot.Root.TakePrompt)
          elseif players.LocalPlayer.PlayerGui.TowerTrialHUD.TrialBar.Requirement.ContentText
            == "Tower Trial: Mythical" then
            f2(workspace.ActiveBrainrots.Mythical.RenderedBrainrot.Root.CFrame
              * CFrame.new(0, -5, 0))

            fireproximityprompt(workspace.ActiveBrainrots.Mythical.RenderedBrainrot.Root.TakePrompt)
          elseif players.LocalPlayer.PlayerGui.TowerTrialHUD.TrialBar.Requirement.ContentText
            == "Tower Trial: Cosmic" then
            f2(workspace.ActiveBrainrots.Cosmic.RenderedBrainrot.Root.CFrame
              * CFrame.new(0, -5, 0))

            fireproximityprompt(workspace.ActiveBrainrots.Cosmic.RenderedBrainrot.Root.TakePrompt)
          elseif players.LocalPlayer.PlayerGui.TowerTrialHUD.TrialBar.Requirement.ContentText
            == "Tower Trial: Secret" then
            f2(workspace.ActiveBrainrots.Secret.RenderedBrainrot.Root.CFrame
              * CFrame.new(0, -5, 0))

            fireproximityprompt(workspace.ActiveBrainrots.Secret.RenderedBrainrot.Root.TakePrompt)
          end

          for index4, value111 in ipairs(players.LocalPlayer.Character:GetChildren()) do
            if value111.Name == "RenderedBrainrot" then
              if value111:GetAttribute("Source") == nil then
                f2(workspace.GameObjects.PlaceSpecific.root.Tower.WorldPivot
                  * CFrame.new(0, -58, 0))

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
        local v46 = game
        v46:GetService("Players").LocalPlayer.PlayerGui.ChoiceGui.Choice.Visible = false

        if players.LocalPlayer.PlayerGui.TowerTrialHUD.TrialBar.Deposits.Text
          == CustomTowerLimit .. "/20" then
          replicatedStorage:WaitForChild("Shared"):WaitForChild("Remotes"):WaitForChild("Networking"):WaitForChild("RE/Tower/TowerClaimConfirmed"):FireServer()
        end

        if workspace.GameObjects.PlaceSpecific.root.Tower.Main.Billboard.BillboardGui.Frame.Info.InfoText.ContentText
          == "Trial Complete!" then
          local v47 = game
          v47:GetService("Players").LocalPlayer.PlayerGui.TowerTrialHUD.TrialBar.Requirement.Text = ""
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

task.spawn(function()
  while task.wait() do
    if AutoGoAndBack then
      local autoCollectCarnivalCoin2 = AutoCollectCarnivalCoin
      local v48 = autoCollectCarnivalCoin2

      if not autoCollectCarnivalCoin2 then
        local autoCollectStPatricksCoin2 = AutoCollectStPatricksCoin
        local v49 = autoCollectStPatricksCoin2

        if not autoCollectStPatricksCoin2 then
          local autoCollectPhantomCoin2 = AutoCollectPhantomCoin
          local v50 = autoCollectPhantomCoin2

          if not autoCollectPhantomCoin2 then
            local autoCollectPhantomOrb2 = AutoCollectPhantomOrb
            local v51 = autoCollectPhantomOrb2

            if not autoCollectPhantomOrb2 then
              local autoCollectPhantomShard2 = AutoCollectPhantomShard
              local v52 = autoCollectPhantomShard2

              if not autoCollectPhantomShard2 then
                local autoCollectFireAndIceCoin2 = AutoCollectFireAndIceCoin
                local v53 = autoCollectFireAndIceCoin2

                if not autoCollectFireAndIceCoin2 then
                  local autoCollectDoomCoin2 = AutoCollectDoomCoin

                  local autoCollectValentineCandy2 = autoCollectDoomCoin2
                    or AutoCollectValentineCandy or AutoCollectValentineCoin
                    or AutoCollectGameConsole or AutoCollectArcadeTicket or AutoCollectGoldBar
                    or AutoCollectUFOCoin or AutoCollectRadioactiveCoin
                    or AutoCollectRadioactiveCoinBomb

                  v53 = autoCollectValentineCandy2
                end

                v52 = v53
              end

              v51 = v52
            end

            v50 = v51
          end

          v49 = v50
        end

        v48 = v49
      end

      if v48 then
        pcall(function()
          if workspace:FindFirstChild("DefaultMap") then
            return
          end

          local v54

          if workspace:FindFirstChild("PhantomMap") or workspace:FindFirstChild("ValentinesMap") then
            if not AutoCollectPhantomCoin or AutoCollectPhantomShard or AutoCollectValentineCoin then
              if players.LocalPlayer.PlayerGui.HUD.BottomLeft.EventSpecificCurrencies.Container.Slot1.Value.Text
                == "100" then
                return
              end
            end

            v54 = workspace

            for key24, value114 in pairs(v54:GetChildren()) do
              if string.find(value114.Name, "Map_SharedInstance") then
                f4(workspace.GameObjects.PlaceSpecific.root.Tower.WorldPivot
                  * CFrame.new(0, -58, 0))

                f4(value114.Floors.Common.CFrame * CFrame.new(0, -5, 0))
              end
            end

            return
          end

          v54 = workspace

          for key25, value115 in pairs(v54:GetChildren()) do
            if string.find(value115.Name, "Map_SharedInstance") then
              f4(workspace.GameObjects.PlaceSpecific.root.Tower.WorldPivot
                * CFrame.new(0, -58, 0))

              f4(value115.Floors.Common.CFrame * CFrame.new(0, -5, 0))
            end
          end
        end)
      end
    end
  end
end)

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
        replicatedStorage:WaitForChild("Shared"):WaitForChild("Remotes"):WaitForChild("Networking"):WaitForChild("RE/Events/CarnivalBeachBallThrow"):FireServer(getPivot.Position)
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
        replicatedStorage:WaitForChild("Shared"):WaitForChild("Remotes"):WaitForChild("Networking"):WaitForChild("RF/WheelSpinRoll"):InvokeServer(unpack({
          "Carnival", false,
        }))
      end)
    end
  end
end)

local function f8()
  local v55 = {}

  for key28, value118 in pairs(SelectRarityBrainrotStPatricksSacrifice) do
    for key29, value119 in pairs(workspace.ActiveBrainrots:FindFirstChild(value118):GetDescendants()) do
      if value119.Name == "RenderedBrainrot" then
        table.insert(v55, value119)
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
              local v56 = game

              v56:GetService("Players").LocalPlayer.PlayerGui.ChoiceGui.Choice.Choices.Yes.Size = UDim2.new(
                100, 100, 100, 100
              )

              local v57 = game

              v57:GetService("Players").LocalPlayer.PlayerGui.ChoiceGui.Choice.Choices.Yes.Position = UDim2.new(
                -1, 0, -5, 0
              )

              mouse1click()
            else
              local v58 = game

              v58:GetService("Players").LocalPlayer.PlayerGui.ChoiceGui.Choice.Choices.Yes.Size = UDim2.new(
                0.45, 0, 1, 0
              )

              local v59 = game

              v59:GetService("Players").LocalPlayer.PlayerGui.ChoiceGui.Choice.Choices.Yes.Position = UDim2.new(
                0.279, 0, 0.783, 0
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
    if AutoCollectStPatricksCoin then
      pcall(function()
        for key32, value123 in pairs(workspace.StPatricksCoinParts:GetChildren()) do
          if value123.Name == "StPatricksCoin" then
            firetouchinterest(
              players.LocalPlayer.Character.HumanoidRootPart, value123["Meshes/luckycoin"], 0
            )

            firetouchinterest(
              players.LocalPlayer.Character.HumanoidRootPart, value123["Meshes/luckycoin"], 1
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
        replicatedStorage:WaitForChild("Shared"):WaitForChild("Remotes"):WaitForChild("Networking"):WaitForChild("RF/WheelSpinRoll"):InvokeServer(unpack({
          "StPatricks", false,
        }))
      end)
    end
  end
end)

task.spawn(function()
  while task.wait() do
    if AutoCollectPhantomOrb then
      pcall(function()
        if players.LocalPlayer.PlayerGui.HUD.BottomLeft.EventSpecificCurrencies.Container.Slot1.Value.Text
          ~= "100" then
          for key33, value124 in pairs(workspace.PhantomOrbParts:GetChildren()) do
            if string.find(value124.Name, "PhantomOrb") then
              firetouchinterest(
                players.LocalPlayer.Character.HumanoidRootPart, value124.Hitbox, 0
              )

              firetouchinterest(
                players.LocalPlayer.Character.HumanoidRootPart, value124.Hitbox, 1
              )
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
            firetouchinterest(
              players.LocalPlayer.Character.HumanoidRootPart, value128.Hitbox, 0
            )

            firetouchinterest(
              players.LocalPlayer.Character.HumanoidRootPart, value128.Hitbox, 1
            )
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

              for key41, value132 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
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
            if game.Players.LocalPlayer.PlayerGui.DropGui.Enabled == false then
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
        replicatedStorage:WaitForChild("Shared"):WaitForChild("Remotes"):WaitForChild("Networking"):WaitForChild("RF/WheelSpinRoll"):InvokeServer(unpack({
          "Phantom", false,
        }))
      end)
    end
  end
end)

local function f9()
  local v60 = {}

  for key45, value138 in pairs(SelectRarityBrainrotSacrifice) do
    for key46, value139 in pairs(workspace.ActiveBrainrots:FindFirstChild(value138):GetDescendants()) do
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
              local v61 = game

              v61:GetService("Players").LocalPlayer.PlayerGui.ChoiceGui.Choice.Choices.Yes.Size = UDim2.new(
                100, 100, 100, 100
              )

              local v62 = game

              v62:GetService("Players").LocalPlayer.PlayerGui.ChoiceGui.Choice.Choices.Yes.Position = UDim2.new(
                -1, 0, -5, 0
              )

              mouse1click()
            else
              local v63 = game

              v63:GetService("Players").LocalPlayer.PlayerGui.ChoiceGui.Choice.Choices.Yes.Size = UDim2.new(
                0.45, 0, 1, 0
              )

              local v64 = game

              v64:GetService("Players").LocalPlayer.PlayerGui.ChoiceGui.Choice.Choices.Yes.Position = UDim2.new(
                0.279, 0, 0.783, 0
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
        replicatedStorage:WaitForChild("Shared"):WaitForChild("Remotes"):WaitForChild("Networking"):WaitForChild("RF/WheelSpinRoll"):InvokeServer(unpack({
          "FireAndIce", false,
        }))
      end)
    end
  end
end)

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
        replicatedStorage:WaitForChild("Shared"):WaitForChild("Remotes"):WaitForChild("Networking"):WaitForChild("RF/WheelSpinRoll"):InvokeServer(unpack({
          "Doom", false,
        }))
      end)
    end
  end
end)

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
        replicatedStorage:WaitForChild("Shared"):WaitForChild("Remotes"):WaitForChild("Networking"):WaitForChild("RF/WheelSpinRoll"):InvokeServer(unpack({
          "Valentines", false,
        }))
      end)
    end
  end
end)

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
        replicatedStorage:WaitForChild("Shared"):WaitForChild("Remotes"):WaitForChild("Networking"):WaitForChild("RF/WheelSpinRoll"):InvokeServer(unpack({
          "Arcade", false,
        }))
      end)
    end
  end
end)

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

spawn(function()
  while wait() do
    if AutoSpinMoneyWheel then
      pcall(function()
        replicatedStorage:WaitForChild("Shared"):WaitForChild("Remotes"):WaitForChild("Networking"):WaitForChild("RF/WheelSpinRoll"):InvokeServer(unpack({
          "Money", false,
        }))
      end)
    end
  end
end)

task.spawn(function()
  while task.wait() do
    if AutoCollectUFOCoin then
      pcall(function()
        for key55, value149 in pairs(workspace.UFOEventParts:GetDescendants()) do
          if value149.Name == "UFO Coin" then
            firetouchinterest(
              players.LocalPlayer.Character.HumanoidRootPart, value149.Hitbox, 0
            )

            firetouchinterest(
              players.LocalPlayer.Character.HumanoidRootPart, value149.Hitbox, 1
            )
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
        replicatedStorage:WaitForChild("Shared"):WaitForChild("Remotes"):WaitForChild("Networking"):WaitForChild("RF/WheelSpinRoll"):InvokeServer(unpack({
          "UFO", false,
        }))
      end)
    end
  end
end)

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
        replicatedStorage:WaitForChild("Shared"):WaitForChild("Remotes"):WaitForChild("Networking"):WaitForChild("RF/WheelSpinRoll"):InvokeServer(unpack({
          "Radioactive", false,
        }))
      end)
    end
  end
end)

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

task.spawn(function()
  while task.wait(DelayUpgradeSpeed) do
    if AutoUpgradeSpeed then
      pcall(function()
        replicatedStorage:WaitForChild("RemoteFunctions"):WaitForChild("UpgradeSpeed"):InvokeServer(10)
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
        replicatedStorage:WaitForChild("Shared"):WaitForChild("Remotes"):WaitForChild("Networking"):WaitForChild("RF/UpgradeJump"):InvokeServer()
      end)
    end
  end
end)

task.spawn(function()
  while task.wait(DelayUpgradeBase) do
    if AutoUpgradeBase then
      pcall(function()
        replicatedStorage:WaitForChild("Shared"):WaitForChild("Remotes"):WaitForChild("Networking"):WaitForChild("RE/Plots/PlotUpgradeBase"):FireServer()
      end)
    end
  end
end)

local function f10()
  for key60, value154 in pairs(workspace.Bases:GetChildren()) do
    local v65 = game

    if value154.Title.TitleGui.Frame.PlayerName.Text
      == v65:GetService("Players").LocalPlayer.DisplayName then
      return value154
    end
  end
end

local v66 = f10()

local function f11()
  if v66 and v66:FindFirstChild("Slots") then
    return v66.Slots:GetChildren()
  end

  return {}
end

task.spawn(function()
  while task.wait(DelayUpgradeBrainrot) do
    if AutoUpgradeBrainrot and v66 then
      pcall(function()
        for j = 1, #f11() do
          local v67 = j

          task.spawn(function()
            local v68 = game
            local v69 = { "Upgrade Brainrot", v66.Name, tostring(v67) }
            v68:GetService("ReplicatedStorage").Shared.Remotes.Networking["RF/PlotAction"]:InvokeServer(unpack(v69))
          end)
        end
      end)
    end
  end
end)

task.spawn(function()
  while task.wait(DelayRebirth) do
    if AutoRebirth then
      pcall(function()
        replicatedStorage:WaitForChild("RemoteFunctions"):WaitForChild("Rebirth"):InvokeServer()
      end)
    end
  end
end)

task.spawn(function()
  while task.wait() do
    if AutoSellBrainrot then
      pcall(function()
        for key61, value155 in pairs(players.LocalPlayer.Backpack:GetChildren()) do
          if value155:IsA("Tool") then
            for key62, value156 in pairs(SelectRarityBrainrotSell) do
              if value155:GetAttribute("BrainrotName")
                and replicatedStorage.Assets.Brainrots:FindFirstChild(value156):FindFirstChild(value155:GetAttribute("BrainrotName")) then
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
