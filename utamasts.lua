-- ============================================================
-- VALIDASI SCRIPT KEY (otomatis ditambahin di atas script lo)
-- ============================================================
-- =====================================================================
-- CATHLEEN PRO TRACKER - ETFB (Escape Tsunami Farming Bot)
-- =====================================================================

local SUPABASE_URL   = "https://kojfzfblyueopjzrzdil.supabase.co"
local SUPABASE_KEY   = "sb_publishable_mOB4oa0BTuTlnAOoE0iLOA_GMa7sfxX"
-- ==========================================================
-- PROFILE: nama group bot kamu di dashboard.
-- Kosongin ("") kalau gak mau dipisah.
-- Contoh: "Rift" atau "Temen"
-- Gak usah ubah lewat dashboard -- tulis di sini aja.
-- ==========================================================
local PROFILE = ""
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

-- ============================================ \\
--   WEBHOOK DISCORD (bawaan script)
--   Ganti webhook: ubah DISCORD_WEBHOOK_DEFAULT aja.
--   Gak perlu buka GitHub.
-- ============================================ \\
local DISCORD_WEBHOOK_DEFAULT = "https://webhook-cathy.vercel.app/api/webhooks/1496693380493869108/d_Asq17-cDNSzPyH6k3IIpiSfWpSpWBKXOyn5aY4GMmwnfIhQPvNHF2AV_yaOjHrJ03l"
local DISCORD_WEBHOOK = DISCORD_WEBHOOK_DEFAULT

-- ============================================ \\
--   ROUTING KE PROXY
--   User tempel URL Discord biasa -> otomatis lewat proxy lo.
--   Biar Discord gak rate limit / block notif farming yang rame.
--   URL yang udah proxy / punya relay sendiri -> dibiarkan.
-- ============================================ \\
local WEBHOOK_PROXY = "https://webhook-cathy.vercel.app"

local function routeThroughProxy(url)
    if type(url) ~= "string" or url == "" then return url end
    -- udah lewat proxy, jangan diapa-apain
    if url:find("^https://webhook%-cathy%.vercel%.app/") then return url end
    -- discord.com / discordapp.com / ptb / canary -> pindahin host ke proxy
    local path = url:match("^https://discord%.com(/api/webhooks/.+)$")
        or url:match("^https://discordapp%.com(/api/webhooks/.+)$")
        or url:match("^https://ptb%.discord%.com(/api/webhooks/.+)$")
        or url:match("^https://canary%.discord%.com(/api/webhooks/.+)$")
    if path then
        print("[Webhook] Dialihkan lewat proxy.")
        return WEBHOOK_PROXY .. path
    end
    -- selain itu biarin (user mungkin punya relay sendiri)
    return url
end



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
    -- notif Discord (pakai webhook bawaan)
    pushDiscord(tostring(message))
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
    -- =========================================================
    -- JANGAN kirim money kalau belum kebaca.
    -- leaderstats belum ke-load pas bot baru masuk game / respawn.
    -- Kalau tetep dikirim "0", nilai lama yang udah ke-save
    -- jadi KETIMPA jadi 0 di database.
    -- Makanya field money dilewat aja -- PostgREST cuma ngirim
    -- kolom yang ada di body, jadi UPDATE gak nyentuh money.
    -- =========================================================
    local moneyVal = (money and money.Value) or nil
    if moneyVal then moneyVal = tostring(moneyVal) end

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
            Body = (function()
                local b = {
                    username    = LocalPlayer.Name,
                    profile     = (PROFILE ~= "" and PROFILE) or nil,
                    slot_tas    = slot,
                    isi_tas     = inv,
                    last_update = os.date("!%Y-%m-%dT%H:%M:%SZ")
                }
                if moneyVal and moneyVal ~= "0" then
                    b.money = moneyVal
                else
                    warn("[STATS] money belum kebaca -> kolom money gak dikirim (nilai lama dipertahankan)")
                end
                return HttpService:JSONEncode(b)
            end)()
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
