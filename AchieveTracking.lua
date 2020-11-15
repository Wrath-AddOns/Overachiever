
-- A system to handle automatically tracking/untracking achievements, using a Priority value to determine which achievements to track when the number of achievements we want to track is higher than the number we CAN track.


-- Lower number is higher priority. If there is a tie, the achievement added to the tracking list first has priority.
-- If multiple priorities are given, lower number overrides higher number.
--local PRIORITY_PLAYER = 1;				-- Achievement the player apparently tracked manually
local PRIORITY_TIMER = 2;					-- Achievement tracked because its timer started and timer is ongoing
--local PRIORITY_TIMER_EXPIRED = 8;	-- As PRIORITY_TIMER but the timer has expired
local PRIORITY_SUGGESTION = 3;		-- Achievement provided by Suggestions tab
local PRIORITY_EXPLORE = 3;				-- Exploration achievements
--local PRIORITY_TOAST = 4;					-- Achievement that was recently featured in a toast indicating progress

local UNTRACK_NEVER = 0;		-- Never automatically untrack (still untracks temporarily if we need space for a higher priority achievement)
local UNTRACK_EXIT_BG = 1;	-- Automatically untrack when battleground is exited
local UNTRACK_SUBZONE = 2;	-- Automatically untrack when zone or subzone changes (unless set to autotrack in the new location)

local trackableAchs = {}		-- Note that the same achievement can be listed multiple times (under different priorities and/or untrack reasons).

local autoTrackedAchs = {}
local manuallyUntrackedAchs = {}

local autoTrackedBGTimer = false

local doingUntrack = false


local function untrackAchievement(id)
	doingUntrack = true
	RemoveTrackedAchievement(id)
	doingUntrack = false
end

local function addTrackableAch(id, priority, untrackReason)
	local pos
	for i,track in ipairs(trackableAchs) do
		if (track.id == id and track.priority == priority and track.untrackReason == untrackReason) then
			return false
		end
		if (not pos and track.priority > priority) then
			pos = i
			break	-- Since we sort by priority and this last element's priority was too high a number, anything after this point won't be a match so we can break out of the check-loop now.
		end
	end
	local track = {
		id = id,
		priority = priority,
		untrackReason = untrackReason
	}
	-- Sort by priority:
	if (pos) then
		tinsert(trackableAchs, pos, track)
	else
		tinsert(trackableAchs, track)
	end
	return true
end

--[[
local function removeTrackableAch(id, priority, untrackReason)
	for i,track in ipairs(trackableAchs) do
		if (track.id == id and track.priority == priority and track.untrackReason == untrackReason) then
			tremove(trackableAchs, i)
			return true
		end
end
--]]

local function removeAllUntrackReasonAchsExcept(untrackReason, exceptLookup)
	local tab = {}
	local n = 1
	for i,track in ipairs(trackableAchs) do
		if (track.untrackReason ~= untrackReason or (exceptLookup and exceptLookup[track.id])) then
			tab[n] = track
			n = n + 1
		end
	end
	trackableAchs = tab
end


--[[
local function canTrackAchievement(id, allowCompleted) -- allowCompleted is defunct; WoW UI doesn't allow this. Left here for now just in case.
  if (GetNumTrackedAchievements() < MAX_TRACKED_ACHIEVEMENTS and (allowCompleted or not select(4, GetAchievementInfo(id))) ) then
    return true
  end
	return false
end

local function setTracking(id)
  if (canTrackAchievement(id)) then
    AddTrackedAchievement(id)
    if (AchievementFrameAchievements_ForceUpdate) then
      AchievementFrameAchievements_ForceUpdate() -- Update the achievement UI so it displays as tracked in the achievement list. (Note: Per testing, this is needed even if the frame is hidden, so long as it is loaded.)
    end
    return true
  end
	return false
end
--]]


local function getCurrentTrackableSuggestions()
	if (not AchievementFrame) then
		AchievementFrame_LoadUI()
	end
	if (Overachiever.GetLocalAutoTrackedSuggestions) then
		return Overachiever.GetLocalAutoTrackedSuggestions(true)
	end
	return nil
end

local function getCurrentExplorationTrackable()
	if (Overachiever_Settings.Explore_AutoTrack) then
		if (not IsInInstance()) then
			local zone = GetRealZoneText()
			if (zone and zone ~= "") then
				--local id = Overachiever.FindExplorationAchievementForZone(zone) -- Decided against this call because it caused slight hitching when entering a zone that has no predefined exploration achievement (so it tries to look it up the long way). So be sure to have the exploration achievements saved in AchieveID.lua!
				local id = Overachiever.ExploreZoneIDLookup(zone)
				if (id) then
					local _, complete
					_, _, _, complete = GetAchievementInfo(id)
					if (not complete) then
						return id
					end
				end
			end
		end
	end
	return nil
end


local function getTrackAchievementsLookup()
	local list = { GetTrackedAchievements() }
	local lookup = {}
	for i,id in ipairs(list) do
		lookup[id] = true
	end
	return lookup
end

local function updateTracking()
	-- Validate the auto-tracked table and get its size:
	local tracked = getTrackAchievementsLookup()
	local autoTrackedNum = 0
	for id in pairs(autoTrackedAchs) do
		if (tracked[id]) then
			autoTrackedNum = autoTrackedNum + 1
		else
			autoTrackedAchs[id] = nil
		end
	end

	local add = {}
	local num = GetNumTrackedAchievements() - autoTrackedNum
	for i,track in ipairs(trackableAchs) do
		if (num >= MAX_TRACKED_ACHIEVEMENTS) then  break;  end
		if (not add[track.id] and (not manuallyUntrackedAchs[track.id] or track.priority == PRIORITY_TIMER)) then
			add[track.id] = true
			num = num + 1
		end
	end

	local anyChange = false
	for id in pairs(autoTrackedAchs) do
		if (not add[id]) then
			if (tracked[id]) then
				untrackAchievement(id)
				anyChange = true
			end
			autoTrackedAchs[id] = nil
		end
	end
	for id in pairs(add) do
		if (not tracked[id]) then
			AddTrackedAchievement(id)
			anyChange = true
			autoTrackedAchs[id] = true -- Note that this is inside the "if tracked" check while above setting it to nil in the autoTrackedAchs-loop is outside a similar check because here we differentiate between things we actually auto-tracked and things that were already tracked (so later we won't automatically untrack something that wasn't automatically tracked by us).
		end
	end

	if (anyChange and AchievementFrameAchievements_ForceUpdate) then
		AchievementFrameAchievements_ForceUpdate() -- Update the achievement UI so it displays as tracked in the achievement list. (Note: Per testing, this is needed even if the frame is hidden, so long as it is loaded.)
	end
end

local function updateLocationTrackables(zoneChanged)
	if (zoneChanged) then
		wipe(manuallyUntrackedAchs)
	end

	local tab = getCurrentTrackableSuggestions()
	if (tab) then
		for id in pairs(tab) do
			addTrackableAch(id, PRIORITY_SUGGESTION, UNTRACK_SUBZONE)
		end
	end

	if (zoneChanged) then
		--local t = debugprofilestop()
		local expID = getCurrentExplorationTrackable()
		--print("getCurrentExplorationTrackable() took",(debugprofilestop() - t) / 1000,"seconds")
		if (expID) then
			addTrackableAch(expID, PRIORITY_EXPLORE, UNTRACK_SUBZONE)
			if (not tab) then  tab = {};  end
			tab[expID] = true
		end
	end

	removeAllUntrackReasonAchsExcept(UNTRACK_SUBZONE, tab)

	if (zoneChanged and autoTrackedBGTimer and tab) then
		local isInstance, instanceType = IsInInstance()
		if (not isInstance or instanceType ~= "pvp") then
			removeAllUntrackReasonAchsExcept(UNTRACK_EXIT_BG, tab)
			autoTrackedBGTimer = false
		end
	end

	updateTracking()
end

local function untrackAllAutoTracked()
	for id in pairs(autoTrackedAchs) do
		untrackAchievement(id)
	end
end



local trackingFrame = CreateFrame("frame")
Overachiever.TrackingFrame = trackingFrame

trackingFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
trackingFrame:RegisterEvent("PLAYER_LOGOUT")

trackingFrame:SetScript("OnEvent", function(self, event, arg1, arg2, ...)
	if (event == "ZONE_CHANGED" or event == "ZONE_CHANGED_NEW_AREA") then
		--local t = debugprofilestop()
		updateLocationTrackables(event == "ZONE_CHANGED_NEW_AREA")
		--print(event, "took",(debugprofilestop() - t) / 1000,"seconds")

	elseif (event == "TRACKED_ACHIEVEMENT_LIST_CHANGED") then
		-- arg1 is achievement ID. arg2 is whether the achievement is now tracked (true is yes, nil is no).
		if (arg1 and not arg2) then  -- Something was untracked:
			-- If one of our auto-tracked achievements has become untracked by something outside our autotracking manager, then remove it from the autotracking list and flag it as manually untracked:
			if (not doingUntrack and autoTrackedAchs[arg1]) then
				autoTrackedAchs[arg1] = nil
				manuallyUntrackedAchs[arg1] = true
			end
		end

	elseif (event == "PLAYER_ENTERING_WORLD") then
		trackingFrame:UnregisterEvent("PLAYER_ENTERING_WORLD")
		trackingFrame:RegisterEvent("ZONE_CHANGED_NEW_AREA")
		trackingFrame:RegisterEvent("ZONE_CHANGED") -- Subzone change. Testing (as of WoW 9.0.1) shows it does NOT trigger with a zone change even though you're technically changing subzones then, too.
		trackingFrame:RegisterEvent("TRACKED_ACHIEVEMENT_LIST_CHANGED")
		updateLocationTrackables(true)
	
	elseif (event == "PLAYER_LOGOUT") then
		-- Untrack the auto-tracked on logout (or interface reload) to prevent auto-tracked achievements being seen as manually-tracked when you log back in.
		untrackAllAutoTracked()
	end
end)

function Overachiever.TrackTimedAchievement(id, isBGTimer)
	if (isBGTimer) then
		autoTrackedBGTimer = true
		addTrackableAch(id, PRIORITY_TIMER, UNTRACK_EXIT_BG)
	else
		addTrackableAch(id, PRIORITY_TIMER, UNTRACK_NEVER)
	end
	updateTracking()
end

function Overachiever.AutoTrackingSettingUpdated()
	updateLocationTrackables(true)
end

--[[
function Overachiever.Debug_updateLocationTrackables()
	updateLocationTrackables(true)
	return trackableAchs
end
]]


-- POSSIBLE TODO:
-- - detect if untracking opens space for something new to auto-track? maybe delay afterward so we don't take a spot the player was briefly emptying to put something else in?
--   probably not necessary as moving to another zone/subzone will trigger a check anyway.
-- - Add to tooltips in achievement UI to indicate it's auto-tracked, and not just on Suggestions tab.
