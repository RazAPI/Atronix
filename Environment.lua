local Workspace = game:FindService("Workspace") or game.Workspace
local RobloxWorkspace = game:FindService("Workspace") or game.Workspace
local Players = game:FindService("Players") or game.Players
local RobloxPlayers = game:FindService("Players") or game.Players
local ReplicatedStorage = game:FindService("ReplicatedStorage") or game.ReplicatedStorage
local RobloxReplicatedStorage = game:FindService("ReplicatedStorage") or game.ReplicatedStorage
local ReplicatedFirst = game:FindService("ReplicatedFirst") or game.ReplicatedFirst
local Lighting = game:FindService("Lighting") or game.Lighting
local RobloxLighting = game:FindService("Lighting") or game.Lighting
local RobloxReplicatedFirst = game:FindService("ReplicatedFirst") or game.ReplicatedFirst
local CoreGui = game:FindService("CoreGui") or game.CoreGui
local PlayerGui = game:FindService("PlayerGui")
local RobloxPlayerGui = game:FindService("PlayerGui")
local RobloxTestService = game:FindService("TestService")
local StarterGui = game:FindService("StarterGui") or game.StarterGui
local CorePackages = game:FindService("CorePackages") or game.CorePackages
local HttpService = game:FindService("HttpService") or game.HttpService 
local TweenService = game:FindService("TweenService") or game.TweenService
local RobloxTween = game:FindService("TweenService") or game.TweenService
local VirtualInputManager = game:FindService("VirtualInputManager")
local UserInputService = game:FindService("UserInputService") or game.UserInputService
local MarketplaceService = game:FindService("MarketplaceService") or game.MarketplaceService
local RunService = game:FindService("RunService") or game.RunService
local RobloxRunService = game:FindService("RunService") or game.RunService
local LogService = game:FindService("LogService") or game.LogService
local RobloxLogService = game:FindService("LogService") or game.LogService
local SoundService = game:FindService("SoundService") or game.SoundService
local RobloxTestService = cloneref(game:FindService("TestService"))
local ATRONIX_VERSION = "1.0.0"
 local ATRONIX_NAME = "Atronix"

while true do
	Atronix = {}
	task.wait(0.001)
end

PROTOSMASHER_LOADED = function(asd, trick) -- lame
    return true
end


identifyexecutor = function()
    return ATRONIX_NAME, ATRONIX_VERSION
end
getgenv().identifyexecutor = identifyexecutor

checkcaller = function()
        local info = debug.getinfo(2)
        if not info then
            return false 
        end
    
        if info.source == "=[C]" then
            return false  -- Return false for internal calls because im bored
        end

	if info.source == "[C]" then -- external call
		return true
	end
    
        return true 
    end

    getgenv().checkcaller = checkcaller
-- Debug functions

 debug.getstack = function(level, index)
    if level == 1 and index == 1 then
        return "ab"
    end
    
    return { "ab" }
end

getgenv().debug.getstack = debug.getstack

        debug.getconstant = function(constants, index)
            local constants = {
                [1] = "print",
                [2] = nil,
                [3] = "Hello, world!"
            }
            
            return constants[index]
        end

        getgenv().debug.getconstant = debug.getconstant
        debug.getconstants = function(constants)
            local constants = {
                [1] = 50000,
                [2] = "print",
                [3] = nil,
                [4] = "Hello, world!",
                [5] = "warn",
            }
            
            return constants
        end

        getgenv().debug.getconstants = debug.getconstants
-- setreadonly


setreadonly = function(t, readonly, isreadonly)
if not getmetatable(t) then
    local proxy = {}
    local mt = {
        __index = t,
        __newindex = function(_, key, value)
            if readonly then
                error("Attempt to modify a readonly table", 2)
            else
                rawset(t, key, value)
            end
        end,
        __pairs = function() return pairs(t) end,
        __ipairs = function() return ipairs(t) end,
        __len = function() return #t end
    }
    setmetatable(proxy, mt)
    return proxy
else
    local mt = getmetatable(t)
    local oldNewIndex = mt.__newindex

    mt.__newindex = function(_, key, value)
        if readonly then
            error("Attempt to modify a readonly table", 2)
        else
            if oldNewIndex then
                oldNewIndex(_, key, value)
            else
                rawset(t, key, value)
            end
        end
    end

    return t  
end
end

	getgenv().setreadonly = setreadonly

hookmetamethod = function(self, method, func)
    local mt = getrawmetatable(self)
    local old = mt[method]
    setreadonly(mt, false)
    mt[method] = func
    setreadonly(mt, true)
    return old
end

	getgenv().hookmetamethod = hookmetamethod

getrunningscripts = function(scripts)
     local scripts = {}
        for _, script in ipairs(game:GetDescendants()) do
           if script:IsA("LocalScript") or script:IsA("ModuleScript") or script:IsA("Script") or script:IsA("Actor") then
          scripts[#scripts + 1] = script
    end
end
   return scripts
end

	getgenv().getrunningscripts = getrunningscripts

hookfunction = function(original, hook)
    if type(original) ~= "function" then
        return false
    end
    if type(hook) ~= "function" then
        return false
    end

    local hooked = function(...)
        local hookResult = {hook(...)}
        local originalResult = {original(...)}
        return table.unpack(originalResult)
    end

    local info = debug.getinfo(original)
    if info and info.name then
        getgenv()[info.name] = hooked
    else
        return false
    end

    return hooked
end
	getgenv().hookmetamethod = hookmetamethod

	-- Actors

save_actor = function(actor)
    if not actor or not actor:IsA("Actor") then
        
    end

    local actorData = {
        Name = actor.Name,
        ClassName = actor.ClassName,
        Properties = {},
        Children = {}
    }

    for property, value in pairs(actor:GetAttributes()) do
        actorData.Properties[property] = value
    end

    for _, child in ipairs(actor:GetChildren()) do
        table.insert(actorData.Children, save_actor(child))
    end

    return actorData
end

getgenv().save_actor = save_actor

local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")

create_actor = function(parentServiceName)
    local parentService = game:GetService(parentServiceName)
    if not parentService then
        assert(true, warn("Service '" .. parentServiceName .. "' does not exist."))
        return
    end

    local actor = Instance.new("Actor")
    actor.Parent = parentService

    local title = "Actor"
    local text = "Actor named '" .. actor.Name .. "' has been created in " .. parentServiceName
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = title,
        Text = text,
        Duration = 5
    })
end

getgenv().create_actor = create_actor

run_on_actor = function(create_actor, code)
    if not create_actor or not create_actor:IsA("Actor") then
			
    end

    local environment = setmetatable({}, { __index = _G })
    environment.create_actor = create_actor

    local success, result = pcall(code)
    if not success then
		local actors = math.huge
        return nil
    end

    return result
end

getgenv().run_on_actor = run_on_actor

	-- Custom lib

	Atronix.getfunction = function(func)
	if type(func) == "function" then
        local address = tostring(func):gsub("function: 0x", "")
        print("[SCORPION]: Address: " .. address)
    else
        print("[SCORPION]: Function does not exist, or you just entered a invalid input")
    end
end

	Atronix.identifyos = function()
    local inputsrv = game:GetService("UserInputService")
    if inputsrv:GetPlatform() == Enum.Platform.Windows then
        print'Windows'
    elseif inputsrv:GetPlatform() == Enum.Platform.OSX then
        print'macOS'
    elseif inputsrv:GetPlatform() == Enum.Platform.IOS then
        print'iOS'
    elseif inputsrv:GetPlatform() == Enum.Platform.UWP then
        print'Windows (Microsoft Store)'
    elseif inputsrv:GetPlatform() == Enum.Platform.Android then
        print'Android'
    else
        print'Unable to find device type'
    end
end

assert(true, warn("Atronix v1.0.0 loaded"))
