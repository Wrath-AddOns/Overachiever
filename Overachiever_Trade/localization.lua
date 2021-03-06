
local L, locale = OVERACHIEVER_STRINGS, GetLocale()

L.TRADE_SKILLET_ACHSORT = "By Achievement";

if (locale == "enUS" or locale == "enGB") then  -- English
	--If an achievement's criteria list gives an incorrect name for an item to be cooked, correct it with
	--the string L.TRADE_COOKING_OBJRENAME using the format "<incorrect name>=<correct name>" (without
	--quotes), separating different items with a carriage return. Example usage (commented out because
	--it's no longer needed for English clients):
	--L.TRADE_COOKING_OBJRENAME = [[
--Rhinolicious Wyrmsteak=Rhinolicious Wormsteak
--Spiced Wyrm Burger=Spiced Worm Burger
--Wyrm Delight=Worm Delight
--]]

elseif (locale == "deDE") then  -- German
--@localization(locale="deDE", format="lua_additive_table", namespace="Trade", handle-subnamespaces="none")@

elseif (locale == "frFR") then  -- French
--@localization(locale="frFR", format="lua_additive_table", namespace="Trade", handle-subnamespaces="none")@

elseif (locale == "zhTW") then  -- Traditional Chinese
--@localization(locale="zhTW", format="lua_additive_table", namespace="Trade", handle-subnamespaces="none")@

elseif (locale == "zhCN") then  -- Simplified Chinese
--@localization(locale="zhCN", format="lua_additive_table", namespace="Trade", handle-subnamespaces="none")@

elseif (locale == "ruRU") then  -- Russian
--@localization(locale="ruRU", format="lua_additive_table", namespace="Trade", handle-subnamespaces="none")@

elseif (locale == "koKR") then  -- Korean
--@localization(locale="koKR", format="lua_additive_table", namespace="Trade", handle-subnamespaces="none")@

elseif (locale == "esES" or locale == "esMX") then  -- Spanish
--@localization(locale="esES", format="lua_additive_table", namespace="Trade", handle-subnamespaces="none")@

	if (locale == "esMX") then  -- Spanish (Mexican)
--@localization(locale="esMX", format="lua_additive_table", namespace="Trade", handle-subnamespaces="none")@
	end

end
