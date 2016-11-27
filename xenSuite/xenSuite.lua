local ScriptName = "xenSuite"
local AUTOUPDATES = true
local Author = "xentrocity"
local version = 1.0

local function tContains(t,c)
	if not t then return false end
	if type(t) ~= "table" then return false end
	for i=1,#t do
		if t == c then return true end
	end
end

local SupportedChampions = {"Amumu"}

if not tContains(SupportedChampions,myHero.charName) then return end

function CheckUpdate()
    if AUTOUPDATES then
        local ToUpdate = {}
        ToUpdate.LocalVersion = version
        ToUpdate.VersionPath = "raw.githubusercontent.com/LucasRPC/BoL-Scripts/master/version/Lux.version"
        ToUpdate.ScriptPath = "raw.githubusercontent.com/LucasRPC/BoL-Scripts/master/BioLogicLux.lua"
        ToUpdate.SavePath = SCRIPT_PATH.._ENV.FILE_NAME
        ToUpdate.CallbackUpdate = function(NewVersion,OldVersion) PrintMessage(ScriptName, "Updated to "..NewVersion..". Please reload with 2x F9.") end
        ToUpdate.CallbackNoUpdate = function(OldVersion) PrintMessage(ScriptName, "No Updates Found.") end
        ToUpdate.CallbackNewVersion = function(NewVersion) PrintMessage(ScriptName, "New Version found ("..NewVersion.."). Please wait...") end
        ToUpdate.CallbackError = function(NewVersion) PrintMessage(ScriptName, "Error while downloading.") end
        _ScriptUpdate(ToUpdate)
    end
end