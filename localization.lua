
-- Thank you to all of the translators that have helped localize Overachiever. In addition to those mentioned
-- below in their respective sections, recognition is due to all who have used the localization system provided
-- for Overachiever by Curse Forge. See a list of them here:
-- http://wow.curseforge.com/projects/overachiever/localization/translators/

OVERACHIEVER_STRINGS = {
	BINDING_NAME_OVERACHIEVER_TAB_SEARCH = "Open Search Tab";
	BINDING_NAME_OVERACHIEVER_TAB_SUGGESTIONS = "Open Suggestions Tab";
	BINDING_NAME_OVERACHIEVER_TAB_WATCH = "Open Watch Tab";

	OVERACHIEVER_INSTALLED_TOAST = "OVERACHIEVER INSTALLED!";
	OVERACHIEVER_INSTALLED_MSG = "|cff7eff00Overachiever|r v%s was installed.";
	OVERACHIEVER_UPDATED_TOAST = "OVERACHIEVER UPDATED!";
	OVERACHIEVER_UPDATED_MSG = "|cff7eff00Overachiever|r was updated to v%s.";

	STARTTOAST_EVENT = "Happening Today";

	SERIESTIP = "Part of a series:";
	REQUIREDFORMETATIP = "Required for:";
	PROGRESSIFOTHERCOMPLETED = "%s's Progress:";
	RECENTREMINDERCRITERIA = "Recently spotted objective:";

	PROGRESS = "Progress";
	YOURPROGRESS = "Your Progress";
	COMPLETEDATE = "Completed on %2$d/%1$02d/%3$02d";  -- 1 - day 2 - month 3 - year
	INCOMPLETE = "Incomplete";

	MULTI_NEED = "%s (needed for %s achievements)";

	KILL_INCOMPLETE = "Need to kill";
	KILL_COMPLETE = "Already killed";
	--? "Need to defeat" -- for things you need to defeat but not kill

	CRITTER = "Critter";
	WILDPET = "Wild Pet";
	ACH_LOVECRITTERS_INCOMPLETE = "Needs some /love";
	ACH_LOVECRITTERS_COMPLETE = "Already /loved";

	ACH_WELLREAD_INCOMPLETE = "Needs to be read";
	ACH_WELLREAD_COMPLETE = "Already read";
	ACH_EATYOURGREENS_INCOMPLETE = "Need to eat";
	ACH_EATYOURGREENS_COMPLETE = "Already eaten";

	ACH_ANGLER_INCOMPLETE = "Need to fish";
	ACH_ANGLER_COMPLETE = "Already fished";
	-- Since some achievements say to catch a certain fish but don't require fishing from a specific node and so don't give the node's name in the criteria,
	-- use this to make reminder tooltips work on those nodes where the fish name is known but the node's full name isn't. The %s is a stand-in for the
	-- fish name. Put each possibility on a new line.
	ACH_FISHSCHOOL_FORMAT = [[%s School
School of %s
%s Swarm]];

	-- For fishing achievements that have only one criteria and which require fishing from a node. Put each on a new line. Format: <achievement ID>=<fishing node names (separated by commas)>
	ACH_ANGLER_COUNT = [[9455=Fire Ammonite School
9456=Abyssal Gulper School,Oily Abyssal Gulper School
9457=Blackwater Whiptail School
9458=Blind Lake Sturgeon School
9459=Fat Sleeper School
9460=Jawless Skulker School
9461=Sea Scorpion School,Oily Sea Scorpion School
]];

	ACH_CONSUME_INCOMPLETE = "Need to consume";
	ACH_CONSUME_COMPLETE = "Already consumed";
	ACH_CONSUME_INCOMPLETE_EXTRA = "Haven't consumed";

	ACH_CONSUME_91_INCOMPLETE = "I dare you to eat 91 all at once!";
	ACH_CONSUME_91_COMPLETE = "Gluttony already proven"; --"1000% Satisfied";

	ACH_ACQUIRE_INCOMPLETE = "Need to acquire";
	ACH_ACQUIRE_COMPLETE = "Already acquired";
	ACH_ACQUIRE_INCOMPLETE_EXTRA = "Haven't acquired";

	ACH_MISSIONCOMPLETE_INCOMPLETE = "Need to complete";
	ACH_MISSIONCOMPLETE_COMPLETE = "Previously completed";

	ACH_RIDE_INCOMPLETE = "Need to ride";
	ACH_RIDE_COMPLETE = "Already ridden";

	ACH_LETITSNOW_INCOMPLETE = "Need to use Handful of Snowflakes";
	ACH_LETITSNOW_COMPLETE = "Already used Handful of Snowflakes";
	ACH_FISTFULOFLOVE_INCOMPLETE = "Need to use Handful of Rose Petals";
	ACH_FISTFULOFLOVE_COMPLETE = "Already used Handful of Rose Petals";
	ACH_BUNNYMAKER_INCOMPLETE = "Need to use Spring Flowers";
	ACH_BUNNYMAKER_COMPLETE = "Already used Spring Flowers";
	ACH_CHECKYOURHEAD_INCOMPLETE = "Needs a pumpkin head";
	ACH_CHECKYOURHEAD_COMPLETE = "Already pumpkin-headed";
	ACH_TURKEYLURKEY_INCOMPLETE = "Needs feathers";
	ACH_TURKEYLURKEY_COMPLETE = "Already feathered";

	HOLIDAY_DARKMOONFAIRE = "Darkmoon Faire";
	HOLIDAY_LUNARFESTIVAL = "Lunar Festival";
	HOLIDAY_LOVEISINTHEAIR = "Love is in the Air";
	HOLIDAY_NOBLEGARDEN = "Noblegarden";
	HOLIDAY_CHILDRENSWEEK = "Children's Week";
	HOLIDAY_MIDSUMMER = "Midsummer Fire Festival";
	HOLIDAY_MIDSUMMER_SHORT = "Midsummer";
	HOLIDAY_PIRATESDAY = "Pirates' Day";
	HOLIDAY_BREWFEST = "Brewfest";
	HOLIDAY_HALLOWSEND = "Hallow's End";
	HOLIDAY_DAYOFTHEDEAD = "Day of the Dead";
	HOLIDAY_PIGRIMSBOUNTY = "Pilgrim's Bounty";
	HOLIDAY_WINTERVEIL = "Feast of Winter Veil";
	HOLIDAY_WINTERVEIL_SHORT = "Winter Veil";

	MSG_INVALIDID = "Invalid input: No achievement with that ID.";
	MSG_NAMENOTFOUND = 'No achievement with name containing "|cffffffff%s|r" was found.';
	MSG_OPENINGTO = "Opening to: ";
	MSG_ONEFOUND = "1 other achievement found: ";
	MSG_NUMFOUNDLIST = "%s other achievements found:";
	MSG_NOOPEN = "Could not open to an achievement. None visible in UI.";
	MSG_NOOPEN_LIST = "%s |4achievement:achievements; found:";
	MSG_ACHNOTFOUND = "Achievement not found.";

	MSG_CRITERIAPROGRESS = "|cff7eff00Achievement Progress:|r %s (%s)";

	OPTPANEL_REMINDERTOOLTIPS = "Reminder Tooltips";

	OPT_LABEL_SEASONALACHS = "SEASONAL ACHIEVEMENTS";

	OPT_LABEL_ACHTWO = '"%s" and "%s"';
	OPT_LABEL_ACHTHREE = '"%s," "%s," and "%s"';
	OPT_LABEL_ACHFOUR = '"%s," "%s,"|n"%s," "%s"';
	OPT_LABEL_ACHFIVE = '"%s," "%s,"|n"%s," "%s"|n"%s"';
	OPT_LABEL_ACHSIX = '"%s," "%s,"|n"%s," "%s"|n"%s," "%s"';
	OPT_LABEL_ACHSEVEN = '"%s," "%s,"|n"%s," "%s"|n"%s," "%s," "%s"';

	OPT_ACHUNKNOWN = "<Unknown>";

	OPT_LABEL_TOOLTIPS = "Achievement Tooltips and Links";
	OPT_SHOWPROGRESS = "Add your progress";
	OPT_SHOWPROGRESS_TIP = 'Add your progress when an achievement has quantity-based criteria, such as "Obtain 10 mounts."';
	OPT_SHOWPROGRESS_OTHER = "Compare progress in others' links";
	OPT_SHOWPROGRESS_OTHER_TIP = "Add your progress when the achievement info shown is that of another player.";
	OPT_SHOWID = "Show achievement IDs";

	OPT_LABEL_TRACKING = "Achievement Tracking";
	OPT_AUTOTRACKTIMED = "Auto-track timed achievements (non-battleground)";
	OPT_AUTOTRACKTIMED_TIP = "Automatically track achievements with timed criteria when the timer starts. If you are already tracking the maximum number allowed, it may take the place of a previously auto-tracked achievement.|n|nExcludes battleground-specific achievements.";
	OPT_AUTOTRACKTIMED_BG = "Auto-track timed battleground achievements";
	OPT_AUTOTRACKTIMED_TIP_BG = "Automatically track battleground achievements with timed criteria when the timer starts. (For example, those that require a win or flag capture within a certain time frame.)|n|nThe achievement is untracked upon leaving the battleground.";
	OPT_AUTOTRACKEXPLORE = "Auto-track exploration achievements as you travel";
	OPT_AUTOTRACKEXPLORE_TIP = "When you enter a zone, automatically track its exploration achievement. It will be untracked when you leave the zone.";
	OPT_AUTOTRACKEXPLORE_COMPLETED = "Including those completed on a different character";
	OPT_AUTOTRACK_CRITERIATOAST = 'Auto-track upon "Achievement Progress" toast';
	OPT_AUTOTRACK_CRITERIATOAST_TIP = 'When the "Achievement Progress" toast appears, automatically track the achievement (if the tracking limit permits).';

	OPT_LABEL_CRITERIATOAST = "Progress Reaction (Non-Tracking)";
	OPT_CRITERIATOAST_CHATLOG = "Add to chat log";
	OPT_CRITERIATOAST_CHATLOG_TIP = 'When the "Achievement Progress" toast appears, link the achievement and show the completed criteria in the chat log.';
	OPT_CRITERIATOAST_SUGGEST = "Add to Recent Reminders (Suggestions)";
	OPT_CRITERIATOAST_SUGGEST_TIP = 'When the "Achievement Progress" toast appears, temporarily add the achievement to the Suggestions tab as a "Recent Reminder."';

	OPT_LABEL_LOVECRITTER = '/Love Critter Achievements ("%s," "%s," etc.)';
	OPT_CRITTERTIPS = "Critter /loved?";
	OPT_CRITTERTIPS_TIP = "If this achievement is incomplete, add a line to the tooltips of critters that are part of its criteria to indicate whether you still need to /love that type of critter.";
	OPT_PESTCONTROLTIPS = "Pest exterminated?";
	OPT_PESTCONTROLTIPS_TIP = "If this achievement is incomplete, add a line to the tooltips of critters that are part of its criteria to indicate whether you still need to exterminate them.";
	OPT_WELLREADTIPS = "Book read?";
	OPT_WELLREADTIPS_TIP = "If the achievement is incomplete, add a line to the tooltips of books that are part of its criteria to indicate whether you need to read them.";
	OPT_EATYOURGREENSTIPS = "Green eaten?";
	OPT_EATYOURGREENSTIPS_TIP = "If the achievement is incomplete, add a line to the tooltips of plants in Nazmir that you need to eat.";

	OPT_ANGLERTIPS = "Fishing node fished?";
	OPT_ANGLERTIPS_TIP = "If the achievement is incomplete, add a line to the tooltips of fishing nodes that are part of its criteria to indicate whether you need to fish from them.";
	OPT_ANGLERTIPS_TIP_ALWAYS = "Add a line to the tooltips of fishing nodes that are part of its criteria to indicate whether you need to fish from them.";
	OPT_LABEL_DRAENORANGLER = '"%s" Sub-Achievements';

	OPT_LETITSNOWTIPS = "Handful of Snowflakes used?";
	OPT_LETITSNOWTIPS_TIP = "If the achievement is incomplete, add a line to the tooltips of players of an appropriate race/class combo to indicate whether you need to use a Handful of Snowflakes on them.";
	OPT_FISTFULOFLOVETIPS = "Handful of Rose Petals used?";
	OPT_FISTFULOFLOVETIPS_TIP = "If the achievement is incomplete, add a line to the tooltips of players of an appropriate race/class combo to indicate whether you need to use a Handful of Rose Petals on them.";
	OPT_BUNNYMAKERTIPS = "Spring Flowers used?";
	OPT_BUNNYMAKERTIPS_TIP = "If the achievement is incomplete, add a line to the tooltips of players of an appropriate level to indicate whether you need to use Spring Flowers on them. Note that enemy players that are 10 or more levels higher than you are assumed to be at least level 18.";
	OPT_CHECKYOURHEADTIPS = "Weighted Jack-o'-Lantern used?";
	OPT_CHECKYOURHEADTIPS_TIP = "If the achievement is incomplete, add a line to the tooltips of players to indicate whether you need to use a Weighted Jack-o'-Lantern on them.";
	OPT_TURKEYLURKEYTIPS = "Turkey Shooter used?";
	OPT_TURKEYLURKEYTIPS_TIP = "If the achievement is incomplete, add a line to the tooltips of players to indicate whether you need to use your Turkey Shooter on them.";

	OPT_CONSUMEITEMTIPS = "Item consumed?";
	OPT_CONSUMEITEMTIPS_TIP = "If the achievement is incomplete, add a line to the tooltips of items that are part of its criteria to indicate whether you need to consume them.";
	OPT_CONSUMEITEMTIPS_TIP2 = "Items that you are too low level to consume will not trigger a reminder sound.";
	--OPT_CONSUMEITEMTIPS_TIP3 = "Note: This option can add a few seconds to your initial load time.";
	OPT_CONSUMEITEMTIPS_WHENCOMPLETE = "Show even if achievement is complete";

	OPT_SATISFIEDTIPS = "1000% Satisfied?";
	OPT_SATISFIEDTIPS_TIP = "Add a line to the tooltips of items that are part the achievement's criteria to indicate whether you need to consume them.";

	OPT_ACQUIREDTIPS = "Item acquired?";
	OPT_ACQUIREDTIPS_TIP = "Add a line to the tooltips of items to indicate whether you need to acquire them for an achievement.";

	OPT_MISSIONCOMPLETE = "Mission completed?";
	OPT_MISSIONCOMPLETE_TIP = "Add a line to the tooltips of missions to indicate whether you need to complete them for an achievement.";
	OPT_MISSIONCOMPLETE_WHENCOMPLETE = "Show even if achievement is complete";

	OPT_VEHICLERIDDENTIPS = "Vehicle/creature ridden?";
	OPT_VEHICLERIDDENTIPS_TIP = "Add a line to the tooltips of vehicles and creatures that you need to ride to complete an achievement.";

	OPT_LABEL_NEEDTOKILL = 'Kill Creature Achievements ("%s," "%s," etc.)';
	OPT_KILLCREATURETIPS = "Creature killed?";
	OPT_KILLCREATURETIPS_TIP = "Add a line to the tooltips of creatures (excluding critters) indicating whether you need to kill them for an achievement.";
	OPT_KILLCREATURETIPS_TIP2 = "|nNote: This relies on achievements providing mob IDs. Many kill-achievements do, but not all. Creatures needed for those that don't will not have updated tooltips, with a few exceptions where the data has been manually entered into Overachiever.";
	OPT_KILLCREATURETIPS_WHENCOMPLETE = "Show even if achievement is complete";
	OPT_KILLCREATURETIPS_EXCLUDE_GUILD = "Exclude guild achievements";

	OPT_LABEL_MAINUI = "Main Achievement UI Modifications";
	OPT_UI_SERIESTIP = "Tooltip for achievements that are part of a series";
	OPT_UI_SERIESTIP_TIP = "When the cursor is over an achievement that is part of a series, display the names of others in the series and its relation to them.";
	OPT_UI_REQUIREDFORMETATIP = "Tooltip for achievements required by others";
	OPT_UI_REQUIREDFORMETATIP_TIP = "When the cursor is over an achievement that is required to earn another achievement, display the name of the meta-achievement.";
	--OPT_UI_REQUIREDFORMETATIP_FACTIONICON = "Add an icon when exclusive to one faction";
	--OPT_UI_REQUIREDFORMETATIP_FACTIONICON_TIP = "Add an Alliance or Horde icon when the requirement is exclusive to one faction."
	--OPT_UI_REQUIREDFORMETATIP_FACTIONICON_TIP2 = "|nRequires the |cffffffffCache module|r to be enabled.";
	OPT_UI_PROGRESSIFOTHERCOMPLETED = "Tooltip for quantity-based progress if completed by another";
	OPT_UI_PROGRESSIFOTHERCOMPLETED_TIP = "When the cursor is over a quantity-based achievement (e.g. critera of \"Obtain 10 mounts\") that was completed but not by the current character, display the current character's progress.";
	OPT_DRAGGABLE = "Make draggable";
	OPT_DRAGSAVE = "Remember position";
	OPT_UI_HOLIDAYNOTICE = "Display notice if a holiday event is active";
	OPT_UI_HOLIDAYNOTICE_SUGGESTIONSTABONLY = "On Suggestions tab only";
	OPT_UI_HOLIDAYNOTICE_TIP = "If there is a holiday event today (e.g. Brewfest or Darkmoon Faire), a graphical notice appears next to the achievement UI. Clicking it displays achievements for that event. Put your cursor over it for more details.";
	OPT_UI_HOLIDAYNOTICE_TIP2 = "|cffffffffTabs module with Suggestions tab is required.|r";

	OPT_LABEL_TRADESKILLUI = "Professions UI Modifications";
	OPT_TRADESKILL_SHOWCOMPLETEDACH_COOKING = "Indicate uncooked recipes for complete achievements";
	OPT_TRADESKILL_SHOWCOMPLETEDACH_COOKING_TIP = "If Overachiever's Trade module is enabled, then an achievement icon appears next to recipes that you need to cook in order to earn certain achievements. If this option is checked, then these icons will appear next to uncooked recipes even if the associated achievement is complete.";

	OPT_LABEL_STARTTOAST = "Holiday/Event Toasts";
	OPT_STARTTOAST_HOLIDAY = "Show today's holidays";
	OPT_STARTTOAST_HOLIDAY_TIP = "Show today's holidays in toast notifications upon entering the game world.";
	OPT_STARTTOAST_MICROHOLIDAY = "Show today's micro-holidays";
	OPT_STARTTOAST_MICROHOLIDAY_TIP = "Show today's micro-holidays in toast notifications upon entering the game world.";
	OPT_STARTTOAST_BONUS = "Show today's bonus events";
	OPT_STARTTOAST_BONUS_TIP = "Show today's bonus events in toast notifications upon entering the game world.";
	OPT_STARTTOAST_DUNGEON = "Show today's dungeon events";
	OPT_STARTTOAST_DUNGEON_TIP = "Show today's dungeon events in toast notifications upon entering the game world.";
	OPT_STARTTOAST_PVPBRAWL = "Show today's PvP brawl";
	OPT_STARTTOAST_PVPBRAWL_TIP = "Show today's PvP brawl in toast notifications upon entering the game world.";
	OPT_STARTTOAST_MISC = "Show today's misc. holidays";
	OPT_STARTTOAST_MISC_TIP = "Show today's miscellaneous \"holiday\" events in toast notifications upon entering the game world.";
	OPT_STARTTOAST_MISC_TIP2 = "These are events found in the default calendar as \"holidays\" but are neither considered full holidays nor covered by another category given here. Examples include WoW Anniversaries and raid release days (for new raids or difficulties, not weekly resets).";
	OPT_STARTTOAST_TIMEFADE = "Do not automatically hide";
	OPT_STARTTOAST_TIMEFADE_TIP = "Prevent toast notifications you don't interact with from fading after a few seconds.";
	OPT_STARTTOAST_ONLYCLICKFADE = "Require click to hide";
	OPT_STARTTOAST_ONLYCLICKFADE_TIP = "Prevent toast notifications from fading unless left- or right-clicked. (If unchecked, they will also fade if the cursor goes over them and then moves away.)";

	OPT_SELECTSOUND = "Incomplete Achievement Reminder Sound";
	OPT_SELECTSOUND_TIP = "Play the selected sound when an incomplete achievement reminder is added to the tooltip.";
	OPT_SELECTSOUND_TIP2 = "Sounds will only play once every 15 seconds.";
	OPT_SELECTSOUND_ANGLERCHECKPOLE = "Exclude fishing node reminders if pole is equipped";
	OPT_SELECTSOUND_ANGLERCHECKPOLE_TIP = "Don't play reminder sound from fishing nodes if your fishing pole is equipped.";
	OPT_SELECTSOUND_CHECKCOMBAT = "Exclude kill reminders if in combat with creature";
	OPT_SELECTSOUND_CHECKCOMBAT_TIP = "Don't play reminder sound from needing to kill a creature while you are in combat with it.";

	OPT_LABEL_MISC = "Miscellaneous";
	OPT_THROTTLE_ACHLOOKUP = "Startup: Throttle achievement lookup";
	OPT_THROTTLE_ACHLOOKUP_TIP = "Overachiever looks up certain data on startup. If this is unchecked, lookup happens while the UI is first loading. If checked, data is gathered over time after the player enters the world.";
	OPT_THROTTLE_ACHLOOKUP_TIP2 = "|nThe advantage to throttled lookup is a faster initial loading time, but, for some users and on some characters, this can noticeably impact performance for several seconds at the start of a session.|n|nIf the |cffffffffCache module|r is enabled, then throttling doesn't improve loading time as significantly unless the cache needs to be rebuilt. The cache is rebuilt after each new WoW build is released.";
	OPT_SLASHSEARCH_TAB = "Slash commands use Search tab";
	OPT_SLASHSEARCH_TAB_TIP = "Use the Search tab to show search results from slash commands like \"/ach food\". If this is unchecked, results are output to the chat log instead (unless a silent output command like \"/achs\" is used).";
	OPT_SLASHSEARCH_TIP2 = "|cffffffffTabs module with Search tab is required.|r";

	SOUND_BELL_ALLIANCE = "Bell - Alliance";
	SOUND_BELL_HORDE = "Bell - Horde";
	SOUND_BELL_NIGHTELF = "Bell - Night Elf";
	SOUND_DRUMHIT = "Drum Hit";
	SOUND_BELL_BOATARRIVED = "Bells - Boat Arrived";
	SOUND_GONG_TROLL = "Gong - Troll";
	SOUND_BELL_MELLOW = "Mellow Bells";
	SOUND_ENTERQUEUE = "Enter Queue";
	SOUND_HEARTHBIND = "Hearthstone Bind";
	SOUND_BELL_KARA = "Karazhan Bell";
	SOUND_DING_AUCTION = "Auction Ding";
	SOUND_BELL_AUCTION = "Auction Bells";
	SOUND_ALARM1 = "Alarm Clock 1";
	SOUND_ALARM2 = "Alarm Clock 2";
	SOUND_ALARM3 = "Alarm Clock 3";
	SOUND_MAP_PING = "Map Ping";
	SOUND_SIMON_DING = "Simon Ding";
	SOUND_SIMON_STARTGAME = "Simon Start Game";
	SOUND_SIMON_STARTLEVEL = "Simon Start Level";
	SOUND_SIMON_BADPRESS = "Simon Bad Press";
	SOUND_SIMON_FAIL_LARGE = "Simon Fail Large";
	SOUND_SIMON_FAIL_SMALL = "Simon Fail Small";
	SOUND_YAR = "Yarrrr";
	SOUND_AGGRO_WARNING = "Aggro Warning";
	SOUND_AGGRO_PULLED = "Aggro Pulled";
	SOUND_GLYPH_CREATE_MAJOR = "Glyph Create Major";
	SOUND_GLYPH_CREATE_MINOR = "Glyph Create Minor";
	SOUND_GLYPH_DESTROY_MAJOR = "Glyph Destroy Major";
	SOUND_GLYPH_DESTROY_MINOR = "Glyph Destroy Minor";
	SOUND_BGTIMER = "Battleground Countdown";
	SOUND_BGTIMER_END = "Battleground Countdown End";
	SOUND_MEDAL_EXPIRES = "Medal Expires";
	SOUND_GARRISON_INVASION = "Garrison Invasion Alert";
	SOUND_BONUSEVENT = "Bonus Event";
	SOUND_DIGSITE_COMPLETE = "Digsite Complete";
	SOUND_STORE_CONFIRM = "Store Confirmation";
	SOUND_MEDAL_GOLDTOSILVER = "Medal Gold to Silver";
	SOUND_MEDAL_SILVERTOBRONZE = "Medal Silver to Bronze";
	SOUND_CHAR_CREATE = "Create Character";
	SOUND_QUEST_COMPLETE = "Quest Complete";
	SOUND_LEVELUP = "Level Up";
}

local L, locale = OVERACHIEVER_STRINGS, GetLocale()

--if (locale == "enGB") then  -- English (EU)
-- Unfortunately, GetLocale() returns "enUS" even when "enGB" would be more appropriate, and the SHORTDATE
-- global string is defined incorrectly for enGB clients (it's set as it is for enUS), so we have to do things
-- this way:
if (ACHIEVEMENT_TOOLTIP_COMPLETE == "Achievement earned by %1$s on %3$d/%2$d/20%4$02d") then
	L["COMPLETEDATE"] = "Completed on %1$d/%2$02d/%3$02d";  -- 1 - day 2 - month 3 - year
end

if (locale == "deDE") then  -- German
-- Thanks to users Svensn and Farook at wowinterface.com for many of these translations:
--@localization(locale="deDE", format="lua_additive_table", handle-subnamespaces="none")@


elseif (locale == "frFR") then  -- French
-- Thanks to Atropyne (EU-Garona) for many of these translations:
--@localization(locale="frFR", format="lua_additive_table", handle-subnamespaces="none")@


elseif (locale == "zhTW") then  -- Traditional Chinese
-- Thanks to user xyrho at wowinterface.com and laincat at curse.com for many of these translations:
--@localization(locale="zhTW", format="lua_additive_table", handle-subnamespaces="none")@


elseif (locale == "zhCN") then  -- Simplified Chinese
-- Thanks to user Miste(晨光麦) at wowinterface.com and yeah-chen and chrisccc at curse.com for many of these translations:
--@localization(locale="zhCN", format="lua_additive_table", handle-subnamespaces="none")@


elseif (locale == "ruRU") then  -- Russian
-- Thanks to user Swix at wowinterface.com for many of these translations:
--@localization(locale="ruRU", format="lua_additive_table", handle-subnamespaces="none")@


elseif (locale == "koKR") then  -- Korean
--@localization(locale="koKR", format="lua_additive_table", handle-subnamespaces="none")@



elseif (locale == "esES" or locale == "esMX") then  -- Spanish
-- Thanks to user PatoDaia at wowinterface.com for many of these translations:
--@localization(locale="esES", format="lua_additive_table", handle-subnamespaces="none")@


	if (locale == "esMX") then  -- Spanish (Mexican)
--@localization(locale="esMX", format="lua_additive_table", handle-subnamespaces="none")@
	end

elseif (locale == "ptBR") then  -- Brazilian Portuguese
--@localization(locale="ptBR", format="lua_additive_table", handle-subnamespaces="none")@


elseif (locale == "itIT") then  -- Italian
--@localization(locale="itIT", format="lua_additive_table", handle-subnamespaces="none")@


end

BINDING_HEADER_OVERACHIEVER = GetAddOnMetadata("Overachiever", "Title")
BINDING_NAME_OVERACHIEVER_TAB_SEARCH = L.BINDING_NAME_OVERACHIEVER_TAB_SEARCH;
BINDING_NAME_OVERACHIEVER_TAB_SUGGESTIONS = L.BINDING_NAME_OVERACHIEVER_TAB_SUGGESTIONS;
BINDING_NAME_OVERACHIEVER_TAB_WATCH = L.BINDING_NAME_OVERACHIEVER_TAB_WATCH;
