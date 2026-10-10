-- ============================================================
-- VALIDASI SCRIPT KEY (otomatis ditambahin di atas script lo)
-- ============================================================
local __SB_URL  = "https://kojfzfblyueopjzrzdil.supabase.co"
local __SB_KEY  = "sb_publishable_mOB4oa0BTuTlnAOoE0iLOA_GMa7sfxX"
local __REQ     = (syn and syn.request) or (http and http.request)
    or http_request or (Fluxus and Fluxus.request) or request

local function __validateKey()
    if not __REQ then
        warn("[KEY] Executor gak support HTTP request. Script dibatalkan.")
        return false
    end

    local key = rawget(_G, "script_key")
    if type(key) ~= "string" or #key < 8 then
        warn("[KEY] script_key gak ditemukan atau gak valid.")
        return false
    end

    local username = game:GetService("Players").LocalPlayer and
        game:GetService("Players").LocalPlayer.Name or ""

    local ok, res = pcall(function()
        return __REQ({
            Url    = __SB_URL .. "/rest/v1/rpc/validate_script_key",
            Method = "POST",
            Headers = {
                ["apikey"]        = __SB_KEY,
                ["Authorization"] = "Bearer " .. __SB_KEY,
                ["Content-Type"]  = "application/json",
            },
            Body = game:GetService("HttpService"):JSONEncode({
                p_key      = key,
                p_username = username,
            }),
        })
    end)

    if not ok or not res then
        warn("[KEY] Gagal nyambung ke server.")
        return false
    end
    if res.StatusCode ~= 200 then
        warn("[KEY] Server nolak. HTTP " .. tostring(res.StatusCode))
        return false
    end

    local body = res.Body or ""
    if body:find('"ok":%s*true') then return true end

    if body:find("username_not_linked") then
        warn("[KEY] Username " .. username .. " belum di-link di dashboard.")
    elseif body:find("key_invalid") then
        warn("[KEY] Key tidak valid / sudah dicabut.")
    else
        warn("[KEY] Ditolak: " .. body)
    end
    return false
end

if not __validateKey() then
    warn("============================================")
    warn("  AKSES DITOLAK — script tidak dijalankan")
    warn("  Hubungi admin kalau ini salah.")
    warn("============================================")
    return
end
-- ============================================================

-- // ============================================ \\ --
-- //          AUTO BOOTH + AUTO LISTING            \\ --
-- // ============================================ \\ --

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HttpService = game:GetService("HttpService")

local Player = Players.LocalPlayer
local BoothsFolder = workspace.GameObjects.Booths
local Networking = ReplicatedStorage.Shared.Remotes.Networking

-- // BOOTH CONFIG \\ --
local CLAIM_REMOTE = Networking:WaitForChild("RF/ClaimBooth")
local SHUFFLE_REMOTE = Networking:WaitForChild("RE/TradingBooths/ShuffleTeleport")
local SCAN_DELAY = 3

-- // LISTING CONFIG \\ --
local SUPABASE_URL = "https://kojfzfblyueopjzrzdil.supabase.co/rest/v1"
local SUPABASE_KEY = "sb_publishable_mOB4oa0BTuTlnAOoE0iLOA_GMa7sfxX"
local DISCORD_WEBHOOK = "https://webhook-cathy.vercel.app/api/webhooks/1496693380493869108/d_Asq17-cDNSzPyH6k3IIpiSfWpSpWBKXOyn5aY4GMmwnfIhQPvNHF2AV_yaOjHrJ03l"
local TokenPath = Player:WaitForChild("leaderstats"):WaitForChild("Trade Tokens")
local RemoteRestock = Networking:WaitForChild("RF/ListBoothOffering")

-- // STATE \\ --
local claimed = false
local isSyncing = false
local lastTokenValue = tonumber((string.gsub(tostring(TokenPath.Value), "[^%d.-]", ""))) or 0
local LIVE_PRICE = nil
local ITEM_PRICES = {}
local lastPurchaseTime = tick()
local IDLE_TIMEOUT = 60 * 60

-- ============================================ \\
--                  BOOTH FUNCTIONS              \\
-- ============================================ \\

local function getOwnerText(boothModel)
    local info = boothModel:FindFirstChild("Info")
    if not info then return nil end
    local gui = info:FindFirstChild("SurfaceGui")
    if not gui then return nil end
    local frame = gui:FindFirstChild("Frame")
    if not frame then return nil end
    local owner = frame:FindFirstChild("Owner")
    if not owner then return nil end
    return owner.Text
end

local function isUnclaimed(ownerText)
    return ownerText == "Unclaimed Booth"
end

local function findFreeBooth()
    for _, booth in pairs(BoothsFolder:GetChildren()) do
        local ownerText = getOwnerText(booth) or "Unknown"
        if isUnclaimed(ownerText) then
            return booth.Name
        end
    end
    return nil
end

local function tryClaim()
    if claimed then return end
    local boothName = findFreeBooth()
    if boothName then
        local success, result = pcall(function() return CLAIM_REMOTE:InvokeServer(boothName) end)
        if success then
            print("[AutoBooth] Claimed booth | UUID: " .. boothName)
            claimed = true
            return true
        else
            warn("[AutoBooth] Failed to claim booth | Error: " .. tostring(result))
        end
    end
    return false
end

local function shuffleServer()
    print("[AutoBooth] No free booths, shuffling server...")
    pcall(function() SHUFFLE_REMOTE:FireServer() end)
end

-- ============================================ \\
--               LISTING FUNCTIONS               \\
-- ============================================ \\

local function pushDiscord(title, desc, color)
    task.spawn(function()
        local request = (syn and syn.request) or (http and http.request) or http_request or request
        local success, res = pcall(function()
            return request({
                Url = DISCORD_WEBHOOK,
                Method = "POST",
                Headers = { ["Content-Type"] = "application/json" },
                Body = HttpService:JSONEncode({
                    embeds = {{
                        title = title,
                        description = desc,
                        color = color or 1752220,
                        footer = { text = "Cathleen Plaza • " .. os.date("%H:%M:%S") }
                    }}
                })
            })
        end)
        if not success then
            warn("Discord Script Error: " .. tostring(res))
        elseif res and res.StatusCode ~= 200 and res.StatusCode ~= 204 then
            warn("Discord Webhook Ditolak (" .. tostring(res.StatusCode) .. "): " .. tostring(res.Body))
        end
    end)
end

local function getPureName(item)
    local n = item:GetAttribute("DisplayName") or item:GetAttribute("ItemName") or item.Name
    local mutations = {
        "Blood", "Crimson", "Diamond", "Electric", "Gold", "Emerald",
        "Radioactive", "Admin", "UFO", "Hacker", "Lucky", "Money",
        "Gamer", "Candy", "Doom", "Fire", "Ice", "Phantom", "Shamrock",
        "Showtime", "Eggsplosion", "Tidal", "Miner"
    }
    for _, m in pairs(mutations) do n = n:gsub(m .. "%s*", "") end
    return n:gsub("Lv%.%d+", ""):gsub("^%s+", ""):gsub("%s+$", "")
end

local function doRequest(method, endpoint, body, extraHeaders)
    local request = (syn and syn.request) or (http and http.request) or http_request or request
    local headers = {
        ["apikey"] = SUPABASE_KEY,
        ["Authorization"] = "Bearer " .. SUPABASE_KEY,
        ["Content-Type"] = "application/json",
    }
    if extraHeaders then for k, v in pairs(extraHeaders) do headers[k] = v end end
    local success, res = pcall(function()
        return request({
            Url = SUPABASE_URL .. endpoint,
            Method = method,
            Headers = headers,
            Body = body and HttpService:JSONEncode(body) or nil
        })
    end)
    if not success then warn("Supabase Request Error:", res) return false, nil
    elseif res and res.StatusCode >= 400 then warn("Supabase API Error: " .. tostring(res.Body)) end
    return success, res
end

local function pushLog(msg)
    task.spawn(function() doRequest("POST", "/plaza_logs", { ["bot_name"] = Player.Name, ["message"] = msg }) end)
end

local function pushPlazaData()
    if isSyncing then return end
    isSyncing = true
    task.spawn(function()
        local currentTokens = tostring(TokenPath.Value)
        local counts = {}
        for _, v in pairs(Player.Backpack:GetChildren()) do
            local name = getPureName(v)
            if #name > 2 then counts[name] = (counts[name] or 0) + 1 end
        end
        local inv = ""
        for n, c in pairs(counts) do inv = inv .. n .. " (" .. c .. ")\n" end
        if inv == "" then inv = "Empty Bag" end

        local body = {
            ["username"] = Player.Name,
            ["tokens"] = currentTokens,
            ["isi_tas"] = inv,
            ["last_update"] = "now()"
        }

        -- Single upsert call, no GET needed
        doRequest(
            "POST",
            "/plaza_stats?on_conflict=username",
            body,
            { ["Prefer"] = "resolution=merge-duplicates,return=representation" }
        )

        isSyncing = false
        print("[AutoListing] Plaza Synced! Tokens: " .. currentTokens)
    end)
end

local function fetchPrices()
    local ok, res = doRequest("GET", "/plaza_stats?username=eq." .. Player.Name .. "&select=target_price,item_prices", nil)
    if ok and res and res.StatusCode == 200 then
        pcall(function()
            local data = HttpService:JSONDecode(res.Body)
            if data[1] then
                if data[1].target_price then LIVE_PRICE = tonumber(data[1].target_price) end
                if data[1].item_prices then
                    local ip = data[1].item_prices
                    if type(ip) == "string" then local s, parsed = pcall(function() return HttpService:JSONDecode(ip) end); if s then ip = parsed end end
                    if type(ip) == "table" then ITEM_PRICES = ip end
                else ITEM_PRICES = {} end
            end
        end)
    end
end

local function autoRestock()
    if not LIVE_PRICE then return end
    local bp = Player:FindFirstChild("Backpack")
    if not bp then return end
    for _, item in pairs(bp:GetChildren()) do
        local id = item:GetAttribute("UUID") or item.Name
        local name = getPureName(item)
        local finalPrice = LIVE_PRICE
        if ITEM_PRICES and ITEM_PRICES[name] then finalPrice = tonumber(ITEM_PRICES[name]) or LIVE_PRICE end
        pcall(function() RemoteRestock:InvokeServer(id, finalPrice) end)
        task.wait(0.5)
    end
end

-- ============================================ \\
--                   MAIN FLOW                  \\
-- ============================================ \\

local function boothPhase()
    print("[AutoBooth] Auto Claim Booth started!")
    print("[AutoBooth] Claiming any free booth...")
    while not claimed do
        local success = tryClaim()
        if not success and not claimed then shuffleServer() end
        task.wait(SCAN_DELAY)
    end
    print("[AutoBooth] Booth claimed successfully!")
end

local function listingPhase()
    print("[AutoListing] Starting auto listing...")

    task.spawn(function()
        while true do
            fetchPrices()
            task.wait(10)
        end
    end)

    task.spawn(function()
        while true do
            if claimed then autoRestock() end
            task.wait(5)
        end
    end)

    TokenPath:GetPropertyChangedSignal("Value"):Connect(function()
        local rawNewVal = TokenPath.Value
        local newValNum = tonumber((string.gsub(tostring(rawNewVal), "[^%d.-]", ""))) or 0
        local diff = newValNum - lastTokenValue
        lastTokenValue = newValNum
        if diff == 0 then return end
        local arah = diff > 0 and "+" or ""
        local msg = "Token " .. arah .. tostring(diff) .. " | Total: " .. tostring(newValNum)
        pushLog(msg)
        if diff > 0 then
            lastPurchaseTime = tick()
            pushDiscord("ADA YANG BELI! — " .. Player.Name, "**+" .. tostring(diff) .. " tokens**\nTotal: **" .. tostring(newValNum) .. "**", 1752220)
        end
        task.spawn(function() task.wait(0.5) pushPlazaData() end)
        print("[AutoListing] Token changed! " .. arah .. tostring(diff))
    end)

    task.spawn(function() while true do pushPlazaData() task.wait(30) end end)

    task.spawn(function()
        while true do
            task.wait(60)
            if claimed and (tick() - lastPurchaseTime) >= IDLE_TIMEOUT then
                pushLog("Idle 60 menit tanpa pembeli — shuffle server")
                print("[AutoListing] Idle timeout, shuffling server...")
                claimed = false
                pcall(function() SHUFFLE_REMOTE:FireServer() end)
                task.wait(5)
                boothPhase()
                lastPurchaseTime = tick()
            end
        end
    end)

    task.wait(2)
    pushPlazaData()
    pushLog("Bot online: " .. Player.Name)
    print("[AutoListing] Plaza Hub v18 (Auto Booth + Listing) Loaded!")
end

-- // START \\ --
boothPhase()
listingPhase()
