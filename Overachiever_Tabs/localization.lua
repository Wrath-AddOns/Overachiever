
local L, locale = OVERACHIEVER_STRINGS, GetLocale()

L.SEARCH_TAB = "Search";
L.SEARCH_HELP = "Use this tab to search for achievements. You can also search for achievements by name or ID using slash commands. See Overachiever's readme.txt file for details.";
L.SEARCH_NAME = "Name or ID:";
L.SEARCH_DESC = "Description:";
L.SEARCH_CRITERIA = "Criteria:";
L.SEARCH_REWARD = "Reward:";
L.SEARCH_ANY = "Any of the above:";
L.SEARCH_FULLLIST = "Include unlisted|nachievements";
L.SEARCH_FULLLIST_TIP = "Include in the search achievements that aren't normally listed in the default UI, such as those exclusive to the opposing faction, unacquired Feats of Strength, etc.";
L.SEARCH_TYPE = "Type:";
L.SEARCH_TYPE_INDIV = "Personal";
L.SEARCH_TYPE_GUILD = "Guild";
L.SEARCH_TYPE_ALL = "All";
L.SEARCH_SUBMIT = "Search";
L.SEARCH_RESET = "Reset";
L.SEARCH_RESULTS = "Found %s |4achievement:achievements;.";
L.SEARCH_FILTERED_OUT = "%s |4achievement was:achievements were; omitted by the filter.";

L.SUGGESTIONS_TAB = "Suggestions";
L.SUGGESTIONS_HELP = "Suggested achievements are listed here based on your current location. Also listed are all \"Recent Reminder\" achievements.|n|n|cffffffffShift-right-click|r on a suggested achievement to hide it. (This is character-specific and affects all locations.)";
L.SUGGESTIONS_REFRESH = "Refresh";
L.SUGGESTIONS_EMPTY = "Overachiever has no suggestions for you at this time.";
L.SUGGESTIONS_RESULTS = "%d |4suggestion:suggestions; found.";
L.SUGGESTIONS_RESULTS_HIDDEN = "%d |4suggestion:suggestions; found.|n(%d |4is:are; hidden.)";
L.SUGGESTIONS_RESULTS_TRADESKILL = "%s: %d |4suggestion:suggestions; found.";
L.SUGGESTIONS_RESULTS_TRADESKILL_HIDDEN = "%s: %d |4suggestion:suggestions; found.|n(%d |4is:are; hidden.)";
L.SUGGESTIONS_EMPTY_TRADESKILL = "%s: Overachiever has no suggestions for you at this time.";
L.SUGGESTIONS_LOCATION = "Location:"
L.SUGGESTIONS_LOCATION_TIP = "Override Zone/Instance Location"
L.SUGGESTIONS_LOCATION_TIP2 = "Leave blank to get suggestions for your current location or start typing to get a matching valid zone or instance name to use instead. Press |cffffffffTab|r to cycle between locations that match the text to the left of the cursor. |cffffffffShift+Tab|r cycles in reverse order. If the cursor is at the leftmost position, it cycles between all valid locations.|n|nYou can also enter the name of certain holidays/world events (such as \"Hallow's End\")."
L.SUGGESTIONS_LOCATION_SUBZONE = "Subzone:"
L.SUGGESTIONS_LOCATION_NOSUBZONE = "(unspecified)"
L.SUGGESTIONS_DIFFICULTY = "Instance Difficulty:"
L.SUGGESTIONS_DIFFICULTY_AUTO = "Auto-Detect"
L.SUGGESTIONS_DIFFICULTY_NORMAL = "Normal"
L.SUGGESTIONS_DIFFICULTY_HEROIC = "Heroic"
L.SUGGESTIONS_DIFFICULTY_MYTHIC = "Mythic"
L.SUGGESTIONS_RAIDSIZE = "Raid Size:"
L.SUGGESTIONS_RAIDSIZE_AUTO = "Auto-Detect"
L.SUGGESTIONS_RAIDSIZE_10 = "10-man"
L.SUGGESTIONS_RAIDSIZE_25 = "25-man"
L.SUGGESTIONS_SHOWHIDDEN = "Show Hidden"
L.SUGGESTIONS_SHOWHIDDEN_TIP = "Check to show hidden suggestions for this location."
L.SUGGESTIONS_SHOWHIDDEN_TIP2 = "If you want to see all hidden suggestions regardless of location, enter \"hidden\" into the Location field, above.|n|n|cffffffffShift-right-click|r on an achievement to toggle whether it is hidden."
L.SUGGESTIONS_HIDDENLOCATION = "hidden"

L.SUGGESTIONS_ZONERENAME_DALARAN_NORTHREND = "Dalaran (Northrend)"
L.SUGGESTIONS_ZONERENAME_DALARAN_BROKENISLES = "Dalaran (Broken Isles)"
L.SUGGESTIONS_ZONERENAME_SHADOWMOONVALLEY_OUTLAND = "Shadowmoon Valley (Outland)"
L.SUGGESTIONS_ZONERENAME_SHADOWMOONVALLEY_DRAENOR = "Shadowmoon Valley (Draenor)"
L.SUGGESTIONS_ZONERENAME_NAGRAND_OUTLAND = "Nagrand (Outland)"
L.SUGGESTIONS_ZONERENAME_NAGRAND_DRAENOR = "Nagrand (Draenor)"
L.SUGGESTIONS_ZONERENAME_KARAZHAN_LEGION = "Return to Karazhan"

L.WATCH_TAB = "Watch";
L.WATCH_HELP = "Create your watch list by |cffffffffalt+clicking|r on achievements in the other tabs or achievement chat links. |cffffffffAlt+click|r on one displayed here to stop watching it.";
L.WATCH_EMPTY = "Your watch list is empty. Alt+click on an achievement in another tab or an achievement's chat link to watch it.";
L.WATCH_EMPTY_SHORT = "Empty List";
L.WATCH_DISPLAYEDLIST = "Displayed List:";
L.WATCH_DEFAULTLIST = "Default List:";
L.WATCH_DEFAULTLIST_TIP = "The specified list will be the Displayed List at the beginning of each session.";
L.WATCH_COPY = "Copy to List:";
L.WATCH_COPY_TIP = "When enabled, if you |cffffffffshift+alt+click|r on an achievement on this tab, it will be added to the specified watch list.";
L.WATCH_LIST_GLOBAL = "Global";
L.WATCH_LIST_PERCHAR = "Character-specific";
L.WATCH_NEW = "New";
L.WATCH_DELETE = "Delete";
L.WATCH_CLEAR = "Clear";
L.WATCH_COPY = "Copy To:";
L.WATCH_POPUP_NEWLIST = "Enter the name of your new achievement watch list:";
L.WATCH_POPUP_DELETELIST = "Are you sure you want to permanently delete the current achievement watch list?";
L.WATCH_POPUP_CLEARLIST = "Are you sure you want to clear the contents of the current achievement watch list?";
L.WATCH_ERR_INVALIDID = 'Removed "%s" from Watch List: An achievement with that ID could not be found.';
L.WATCH_FILTERED_OUT = "%s |4achievement was:achievements were; omitted by the filter.";

L.RELATED_TAB = "Related";
L.RELATED_HELP = "This tab shows achievements that are related to one another. One achievement was chosen as the base. The rest are in the same series as the base, are one of the criteria of the base or of another in its series, or have as one of their own criteria either the base or an achievement in its series.";
L.RELATED_RESULTS = "Found %s |4achievement:achievements;.";
L.RELATED_BASE = "Base Achievement:";
L.RELATED_CLOSE = "Close";
L.RELATED_RECURSIVE = "Extended";
L.RELATED_RECURSIVE_TIP = "Do a recursive search so all achievements that are indirectly related to the base achievement are also included.";

L.TAB_SORT = "Sort by:";
L.TAB_SORT_NAME = "Name";
L.TAB_SORT_ID = "ID";
L.TAB_SORT_POINTS = "Point value";
L.TAB_SORT_COMPLETE = "Date completed";
L.TAB_SORT_RELATION = "Relation";
L.TAB_HELP = "|cffffffffCtrl-click|r on an achievement to jump to its place in the standard UI.|n|n|cffffffffCtrl-shift-click|r on an achievement to view related achievements.|n|nA |cffffffffblue background|r means it is part of a series for which you haven't completed an earlier step.|n|nA |cffffffffred background|r means it cannot be found in the standard UI for this character. It may be exclusive to the opposing faction or is an unacquired Feat of Strength.|n|nA |cffffffffgreen background|r means the achievement is on the \"Recent Reminder\" list. It became especially relevant within the last 2 minutes (e.g. because its timer started or an objective was seen in a tooltip).";

L.EVENTNOTICE_ONGOING = "This event is ongoing.";
L.EVENTNOTICE_STARTED_TODAY = "This event started earlier today.";
L.EVENTNOTICE_STARTS_HOURS = "This event starts in|cff7eff00 %s |4hour:hours;|r.";
L.EVENTNOTICE_STARTS_MINUTES = "This event starts in|cff7eff00 %s |4minute:minutes;|r.";
L.EVENTNOTICE_ENDED_TODAY = "|cffff2020This event ended|r earlier today."
L.EVENTNOTICE_ENDS_DAYS = "It ends in|cffff2020 %s |4day:days;|r.";
L.EVENTNOTICE_ENDS_HOURS = "It ends in|cffff2020 %s |4hour:hours;|r.";
L.EVENTNOTICE_ENDS_MINUTES = "It ends in|cffff2020 %s |4minute:minutes;|r.";
L.EVENTNOTICE_ENDS_DATETIME = "It ends on %2$d/%1$02d at %3$s (server time).";  -- 1 - day 2 - month 3 - time
L.EVENTNOTICE_ENDS_TIME = "It ends today at %3$s (server time).";
L.EVENTNOTICE_TIP = "Hold |cffffffffShift|r for more details.";
L.EVENTNOTICE_HELP = "|cffffffffClick|r to see related achievements.|n|cffffffffCtrl-click|r to open the calendar.|n|cffffffffShift-right-click|r to temporarily hide this notice."; --|n|cffffffffRight-click|r for more options.";


L.SUBZONES = {
-- Ulduar:
	["Formation Grounds"] = "Formation Grounds",
	["Razorscale's Aerie"] = "Razorscale's Aerie",
	["The Assembly of Iron"] = "The Assembly of Iron",
	["The Celestial Planetarium"] = "The Celestial Planetarium",
	["The Clash of Thunder"] = "The Clash of Thunder",
	["The Colossal Forge"] = "The Colossal Forge",
	["The Conservatory of Life"] = "The Conservatory of Life",
	["The Descent into Madness"] = "The Descent into Madness",
	["The Halls of Winter"] = "The Halls of Winter",
	["The Observation Ring"] = "The Observation Ring",
	["The Prison of Yogg-Saron"] = "The Prison of Yogg-Saron",
	["The Scrapyard"] = "The Scrapyard",
	["The Shattered Walkway"] = "The Shattered Walkway",
	["The Spark of Imagination"] = "The Spark of Imagination",
-- Icecrown:
	["Argent Tournament Grounds"] = "Argent Tournament Grounds",
	["The Ring of Champions"] = "The Ring of Champions",
	["Argent Pavilion"] = "Argent Pavilion",
	["The Argent Valiants' Ring"] = "The Argent Valiants' Ring",
	["The Aspirants' Ring"] = "The Aspirants' Ring",
	["The Alliance Valiants' Ring"] = "The Alliance Valiants' Ring",
	["Silver Covenant Pavilion"] = "Silver Covenant Pavilion",
	["Sunreaver Pavilion"] = "Sunreaver Pavilion",
	["The Horde Valiants' Ring"] = "The Horde Valiants' Ring",
}


--if (locale == "enGB") then  -- English (EU)
-- Unfortunately, GetLocale() returns "enUS" even when "enGB" would be more appropriate, and the SHORTDATE
-- global string is defined incorrectly for enGB clients (it's set as it is for enUS), so we have to do things
-- this way:
if (ACHIEVEMENT_TOOLTIP_COMPLETE == "Achievement earned by %1$s on %3$d/%2$d/20%4$02d") then
	L.EVENTNOTICE_ENDS_DATETIME = "It ends on %1$d/%2$02d at %3$s (server time).";  -- 1 - day 2 - month 3 - time
end

if (locale == "deDE") then  -- German
--@localization(locale="deDE", format="lua_additive_table", namespace="Tabs", handle-subnamespaces="none")@
--@localization(locale="deDE", format="lua_additive_table", namespace="Tabs/SUBZONES", handle-subnamespaces="none", table-name="L.SUBZONES")@


elseif (locale == "frFR") then  -- French
--@localization(locale="frFR", format="lua_additive_table", namespace="Tabs", handle-subnamespaces="none")@
--@localization(locale="frFR", format="lua_additive_table", namespace="Tabs/SUBZONES", handle-subnamespaces="none", table-name="L.SUBZONES")@


elseif (locale == "zhTW") then  -- Traditional Chinese
--@localization(locale="zhTW", format="lua_additive_table", namespace="Tabs", handle-subnamespaces="none")@
--@localization(locale="zhTW", format="lua_additive_table", namespace="Tabs/SUBZONES", handle-subnamespaces="none", table-name="L.SUBZONES")@


elseif (locale == "zhCN") then  -- Simplified Chinese
--@localization(locale="zhCN", format="lua_additive_table", namespace="Tabs", handle-subnamespaces="none")@
--@localization(locale="zhCN", format="lua_additive_table", namespace="Tabs/SUBZONES", handle-subnamespaces="none", table-name="L.SUBZONES")@


elseif (locale == "ruRU") then  -- Russian
--@localization(locale="ruRU", format="lua_additive_table", namespace="Tabs", handle-subnamespaces="none")@
--@localization(locale="ruRU", format="lua_additive_table", namespace="Tabs/SUBZONES", handle-subnamespaces="none", table-name="L.SUBZONES")@


elseif (locale == "koKR") then  -- Korean
--@localization(locale="koKR", format="lua_additive_table", namespace="Tabs", handle-subnamespaces="none")@
--@localization(locale="koKR", format="lua_additive_table", namespace="Tabs/SUBZONES", handle-subnamespaces="none", table-name="L.SUBZONES")@


elseif (locale == "esES" or locale == "esMX") then  -- Spanish
--@localization(locale="esES", format="lua_additive_table", namespace="Tabs", handle-subnamespaces="none")@
--@localization(locale="esES", format="lua_additive_table", namespace="Tabs/SUBZONES", handle-subnamespaces="none", table-name="L.SUBZONES")@


	if (locale == "esMX") then  -- Spanish (Mexican)
--@localization(locale="esMX", format="lua_additive_table", namespace="Tabs", handle-subnamespaces="none")@
--@localization(locale="esMX", format="lua_additive_table", namespace="Tabs/SUBZONES", handle-subnamespaces="none", table-name="L.SUBZONES")@
	end


elseif (locale == "ptBR") then  -- Brazilian Portuguese
--@localization(locale="ptBR", format="lua_additive_table", namespace="Tabs", handle-subnamespaces="none")@
--@localization(locale="ptBR", format="lua_additive_table", namespace="Tabs/SUBZONES", handle-subnamespaces="none", table-name="L.SUBZONES")@


elseif (locale == "itIT") then  -- Italian
--@localization(locale="itIT", format="lua_additive_table", namespace="Tabs", handle-subnamespaces="none")@
--@localization(locale="itIT", format="lua_additive_table", namespace="Tabs/SUBZONES", handle-subnamespaces="none", table-name="L.SUBZONES")@


end
