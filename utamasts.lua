-- =====================================================================
-- CATHLEEN PRO TRACKER - ETFB (Escape Tsunami Farming Bot)
-- =====================================================================

local SUPABASE_URL   = "https://kojfzfblyueopjzrzdil.supabase.co"
local SUPABASE_KEY   = "sb_publishable_mOB4oa0BTuTlnAOoE0iLOA_GMa7sfxX"
local HttpService    = game:GetService("HttpService")
local Players        = game:GetService("Players")
local LocalPlayer    = Players.LocalPlayer
local UPDATE_INTERVAL = 60

local Mutations = {
    "Blood","Crimson","Diamond","Electric","Gold","Emerald","Radioactive",
    "Admin","UFO","Hacker","Lucky","Money","Gamer","Candy","Doom","Fire",
    "Ice","Phantom","Shamrock","Showtime","Eggsplosion","Tidal","Miner"
}

local request_func = (syn and syn.request) or (http and http.request)
    or http_request or (Fluxus and Fluxus.request) or (request)

local function cleanName(name)
    for _, mut in ipairs(Mutations) do
        name = name:gsub("^" .. mut .. "%s+", ""):gsub("%s+" .. mut .. "$" , "")
    end
    return name:match("^%s*(.-)%s*$")
end

local function getInventory()
    local bp = LocalPlayer:FindFirstChild("Backpack")
    if not bp then return "Kosong" end
    local counts = {}
    for _, item in ipairs(bp:GetChildren()) do
        if item:IsA("Tool") or item:IsA("Model") then
            local rawName = item:GetAttribute("DisplayName") or item.Name
            local name = cleanName(rawName)
            if name:find("Lucky Block") then name = "Lucky Block" end
            counts[name] = (counts[name] or 0) + 1
        end
    end
    local list = {}
    for n, c in pairs(counts) do table.insert(list, n .. " (" .. c .. ")") end
    table.sort(list)
    return #list > 0 and table.concat(list, "\n") or "Kosong"
end

local function sendTrackerLog(message)
    if not request_func then return end
    pcall(function()
        request_func({
            Url    = SUPABASE_URL .. "/rest/v1/tracker_logs",
            Method = "POST",
            Headers = {
                ["apikey"]        = SUPABASE_KEY,
                ["Authorization"] = "Bearer " .. SUPABASE_KEY,
                ["Content-Type"]  = "application/json",
                ["Prefer"]        = "return=minimal"
            },
            Body = HttpService:JSONEncode({
                username = LocalPlayer.Name,
                message  = tostring(message)
            })
        })
    end)
end

local function anyToString(val)
    if val == nil then return "nil" end
    local t = type(val)
    if t == "string"  then return val end
    if t == "number" or t == "boolean" then return tostring(val) end
    if t == "table" then
        local msg = val.message or val.Message or val.text or val.Text
            or val.msg or val.Msg or val.content or val.Content
        if msg then return tostring(msg) end
        local parts = {}
        for k, v in pairs(val) do
            table.insert(parts, tostring(k) .. "=" .. tostring(v))
        end
        return "{" .. table.concat(parts, ", ") .. "}"
    end
    return tostring(val)
end

local function hookDisplayPopup()
    local ok, remote = pcall(function()
        return game:GetService("ReplicatedStorage")
            :WaitForChild("Shared", 10)
            :WaitForChild("Remotes", 10)
            :WaitForChild("Networking", 10)
            :WaitForChild("RE/Misc/DisplayPopup", 10)
    end)
    if not ok or not remote then warn("[CathleenTracker] RE/Misc/DisplayPopup not found!"); return end
    print("[CathleenTracker] Hooked DisplayPopup ✅")
    remote.OnClientEvent:Connect(function(...)
        local args = {...}
        local parts = {}
        for i, v in ipairs(args) do table.insert(parts, anyToString(v)) end
        local fullMsg = table.concat(parts, " | ")
        if fullMsg == "" then return end
        if not fullMsg:match("^Info") then return end
        sendTrackerLog(fullMsg)
        print("[CathleenTracker] Popup: " .. fullMsg)
    end)
end

local function sendData()
    local money = LocalPlayer:FindFirstChild("leaderstats") and (
        LocalPlayer.leaderstats:FindFirstChild("MoneyBags") or
        LocalPlayer.leaderstats:FindFirstChild("Money") or
        LocalPlayer.leaderstats:FindFirstChild("Cash")
    )
    local moneyVal = money and tostring(money.Value) or "0"
    local slot = "N/A"
    for _, v in ipairs(LocalPlayer.PlayerGui:GetDescendants()) do
        if v:IsA("TextLabel") and v.Text:match("%d+/%d+") then
            local _, max = v.Text:match("(%d+)/(%d+)")
            if max and tonumber(max) >= 80 then slot = v.Text; break end
        end
    end
    local inv = getInventory()
    if request_func then
        request_func({
            Url    = SUPABASE_URL .. "/rest/v1/player_stats",
            Method = "POST",
            Headers = {
                ["apikey"]        = SUPABASE_KEY,
                ["Authorization"] = "Bearer " .. SUPABASE_KEY,
                ["Content-Type"]  = "application/json",
                ["Prefer"]        = "resolution=merge-duplicates"
            },
            Body = HttpService:JSONEncode({
                username    = LocalPlayer.Name,
                money       = moneyVal,
                slot_tas    = slot,
                isi_tas     = inv,
                last_update = os.date("!%Y-%m-%dT%H:%M:%SZ")
            })
        })
    end
end

task.spawn(function()
    print("✅ Cathleen ETFB Tracker Active!")
    pcall(hookDisplayPopup)
    while true do
        pcall(sendData)
        task.wait(UPDATE_INTERVAL)
    end
end)
