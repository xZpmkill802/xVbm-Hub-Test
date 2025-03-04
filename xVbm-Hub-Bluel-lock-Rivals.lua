local correctKeys = {
    ["Dev"] = {hwid = nil, expires = nil}, -- Key "Dev" ใช้ได้ตลอด ไม่มีหมดอายุ
    ["Fopf934xhvwbtdsgdrg"] = {hwid = nil, expires = os.time() + 86400},
    ["Owigsjfnbsmscsfed"] = {hwid = nil, expires = os.time() + 86400},
    ["rcgkbkdgcndurgbnidxrgrdf"] = {hwid = nil, expires = os.time() + 86400},
    ["Oipgsjnbvusurhgsdigorkdi"] = {hwid = nil, expires = os.time() + 86400},
    ["Pkfjusegisenbmsjifkksjdo"] = {hwid = nil, expires = os.time() + 86400},
    ["T9eofjsmbmis0si39jgsjkds"] = {hwid = nil, expires = os.time() + 86400},
    ["MjfjeubsoeHHHifiekgjseif"] = {hwid = nil, expires = os.time() + 86400},
    ["Opfkebn00skeksjsrmbkskdl"] = {hwid = nil, expires = os.time() + 86400},
    ["suaifjb8suedaypejfsidjbm"] = {hwid = nil, expires = os.time() + 86400},
    ["qPBN0SJSJMBISEDKFIJGSIJE"] = {hwid = nil, expires = os.time() + 86400},
    ["qIkgosksefksiejfcjsesvse"] = {hwid = nil, expires = os.time() + 86400},
    ["efdtrnbdkrighvgjxdjgujbd"] = {hwid = nil, expires = os.time() + 86400},
    ["awftgkbebngidkergjubudud"] = {hwid = nil, expires = os.time() + 86400},
    ["rgrtmfhbftcjntjhfctjhfhb"] = {hwid = nil, expires = os.time() + 86400},
    ["Pikfeboskgscheguhbdruhcd"] = {hwid = nil, expires = os.time() + 86400},
    ["Oodefisjeufsesegirigbjdr"] = {hwid = nil, expires = os.time() + 86400},
    ["pgbkdirgndrgvdrlgdirudhr"] = {hwid = nil, expires = os.time() + 86400},
    ["wfweOOwkfjvsoebsnseofdsj"] = {hwid = nil, expires = os.time() + 86400},
    ["fosebfvmbvbnsnmefucsiefu"] = {hwid = nil, expires = os.time() + 86400},
    ["AkefbPPefibsepfbs9seoigs"] = {hwid = nil, expires = os.time() + 86400},
    ["PgndruPPierndsueJfefusef"] = {hwid = nil, expires = os.time() + 86400},
    ["bntohgighutbdjrgjvdjbbnd"] = {hwid = nil, expires = os.time() + 86400},
    ["Photnfiihbdjrgjindjrijgv"] = {hwid = nil, expires = os.time() + 86400},
    ["segdrDief834tbh9dijrigdk"] = {hwid = nil, expires = os.time() + 86400},
    ["wafQdwefebegergdrgdrgbdf"] = {hwid = nil, expires = os.time() + 86400},
    ["Awd9tbdrtbidirgidrgbxfka"] = {hwid = nil, expires = os.time() + 86400},
    ["Pkfebusifuebvsjzfuuvjdrg"] = {hwid = nil, expires = os.time() + 86400},
    ["Kfiwseujvsbhdbbneujfvugb"] = {hwid = nil, expires = os.time() + 86400},
    ["OsjeuvgubvHsuIUuejf2JUje"] = {hwid = nil, expires = os.time() + 86400},
    ["bntohgighutbdjrgjvdjbbnd"] = {hwid = nil, expires = os.time() + 86400}
}

local correctMaps = {
    ["18668065416"] = {hwid = nil, expires = nil},
    ["34671275"] = {hwid = nil, expires = os.time() + 86400},
    ["2534191426"] = {hwid = nil, expires = os.time() + 86400}
    ["2658724324"] = {hwid = nil, expires = os.time() + 86400}
    ["0935233543"] = {hwid = nil, expires = os.time() + 86400}
    ["1938576496"] = {hwid = nil, expires = os.time() + 86400}
    ["4903875668"] = {hwid = nil, expires = os.time() + 86400}
    ["1903857664"] = {hwid = nil, expires = os.time() + 86400}
    ["0837562638"] = {hwid = nil, expires = os.time() + 86400}
    ["0376572783"] = {hwid = nil, expires = os.time() + 86400}
    ["7265968363"] = {hwid = nil, expires = os.time() + 86400}
    ["3857263598"] = {hwid = nil, expires = os.time() + 86400}
    ["4232564313"] = {hwid = nil, expires = os.time() + 86400}
    ["0274682385"] = {hwid = nil, expires = os.time() + 86400}
    ["0496726482"] = {hwid = nil, expires = os.time() + 86400}
}

-- ฟังก์ชันดึง Hardware ID ของผู้เล่น
local function GetHardwareID()
    local player = game.Players.LocalPlayer
    return game:GetService("RbxAnalyticsService"):GetClientId() -- ใช้ Client ID เป็น HWID
end

-- ฟังก์ชันเพิ่ม Key ใหม่ (ยกเว้น "Dev")
function AddNewKey(newKey)
    if newKey ~= "Dev" then
        correctKeys[newKey] = {hwid = nil, expires = os.time() + 86400}
    end
end

-- ฟังก์ชันเพิ่ม Map ใหม่
function AddNewMap(newMap)
    correctMaps[newMap] = {hwid = nil, expires = os.time() + 86400}
end

-- ฟังก์ชันตรวจสอบและลบ Key / Map ที่หมดอายุ
local function RemoveExpiredKeysAndMaps()
    local currentTime = os.time()

    for key, data in pairs(correctKeys) do
        if key ~= "Dev" and data.expires and currentTime > data.expires then
            correctKeys[key] = nil
        end
    end

    for map, data in pairs(correctMaps) do
        if data.expires and currentTime > data.expires then
            correctMaps[map] = nil
        end
    end
end

local function CheckKeyAndMap()
    RemoveExpiredKeysAndMaps()

    local player = game.Players.LocalPlayer
    local Key = _G.Key
    local Map = _G.Map
    local hwid = GetHardwareID()

    -- ตรวจสอบว่า Key อยู่ในรายการที่ถูกต้อง
    if not correctKeys[Key] then
        player:Kick("❌ Wrong or Expired Key! You are kicked out of the game.")
        return
    end

    -- ตรวจสอบว่า Map อยู่ในรายการที่ถูกต้อง
    if not correctMaps[Map] then
        player:Kick("❌ Wrong or Expired Map! You are kicked out of the game.")
        return
    end

    -- ตรวจสอบว่า Key ถูกใช้ไปแล้วในเครื่องอื่น
    if correctKeys[Key].hwid and correctKeys[Key].hwid ~= hwid then
        player:Kick("❌ This Key is already used on another device!")
        return
    end

    -- ตรวจสอบว่า Map ถูกใช้ไปแล้วในเครื่องอื่น
    if correctMaps[Map].hwid and correctMaps[Map].hwid ~= hwid then
        player:Kick("❌ This Map is already used on another device!")
        return
    end

    -- บันทึก HWID ลงใน Key และ Map
    correctKeys[Key].hwid = hwid
    correctMaps[Map].hwid = hwid

    print("✅ Key และ Map ถูกต้อง! เริ่มต้นทำงาน...")

    loadstring(game:HttpGet("https://raw.githubusercontent.com/xZpmkill802/xVbm-Hub-Test/refs/heads/main/Script.lua"))()
end

CheckKeyAndMap()
