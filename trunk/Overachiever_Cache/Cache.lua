
local function mergeCache(t1, t2)
	for k,v in pairs(t2) do
		if (t1[k]) then
			if (type(v) == "table") then
				if (type(t1[k]) ~= "table") then
					t1[k] = { t1[k] }
				end
				t1[k] = mergeCache(t1[k], v)
			elseif (type(t1[k]) == "table") then
				t1[k] = mergeCache(t1[k], { v })
			else
				if (t1[k] ~= v) then  -- Prevent duplicates
					t1[k] = { t1[k], v }
				end
			end
		else
			t1[k] = v
		end
	end
	return t1
end

local function isCacheCompatible(thisVer, cacheVer, thisBuild, cacheBuild)
	if (thisBuild ~= cacheBuild) then  return false;  end
	if (cacheVer < "1.0.3") then  return false;  end
	return thisVer >= cacheVer -- Discard cache if it claims to be "from the future"
end

local function saveCacheSection(name, data, ver, build, faction, populateID)
	local vername = name .. "_version"
	local oldVersionData = Overachiever_Cache_CritAssets[vername]

	if (Overachiever_Cache_CritAssets[name] and oldVersionData and isCacheCompatible(ver, oldVersionData.ver, build, oldVersionData.build)) then
		if ((faction == "Alliance" and oldVersionData.faction == "Horde") or (faction == "Horde" and oldVersionData.faction == "Alliance")) then
			if (Overachiever_Debug) then  Overachiever.chatprint("Merging faction-specific caches for \"" .. name .. "\".");  end
			faction = "both"
			-- Merge new cache data with old:
			Overachiever_Cache_CritAssets[name] = mergeCache(Overachiever_Cache_CritAssets[name], data)
			if (populateID) then
				TjAchieve.PopulateCritAssetCache(populateID, Overachiever_Cache_CritAssets[name])
				if (Overachiever_Debug) then  Overachiever.chatprint("- Populated TjAchieve cache for asset " .. populateID .. ".");  end
			end
		else
			if (oldVersionData.faction == "both") then
				-- If merge was already done in a previous session:
				if (Overachiever_Debug) then  Overachiever.chatprint("Cache for \"" .. name .. "\" is already for both factions.");  end
				faction = "both"
			end
			Overachiever_Cache_CritAssets[name] = data
		end
	else
		Overachiever_Cache_CritAssets[name] = data
	end

	Overachiever_Cache_CritAssets[vername] = { ver = ver, build = build, faction = faction }

	--[[ No longer needed (causes problems, even) since cache is saved at a different time now:
	if (oldVersionData and oldVersionData.build == "0") then
		-- Force rebuild next session. Doesn't just keep build at "0" (which would also force a rebuild) since the check above would be true every time,
		-- thus forcing a rebuild EVERY future session.
		Overachiever_Cache_CritAssets[vername] = nil
	else
		Overachiever_Cache_CritAssets[vername] = { ver = ver, build = build, faction = faction }
	end
	--]]
end


function Overachiever.SaveCache(name, skipPopulate)
	-- Careful: Don't call this function multiple times in a session unless you've properly populated the cache (TjAchieve) first. Otherwise, you could overwrite
	-- the merged faction-specific cache data using one-faction-only data while leaving the "both factions" indicator, meaning the cache will be missing one
	-- faction's data. (If skipPopulate wasn't true/"truthy" when the merge happened, it should be safe.)

	if (Overachiever_Debug) then  Overachiever.chatprint("SaveCache called for \"" .. name .. "\".");  end

	Overachiever_Cache_CritAssets = Overachiever_Cache_CritAssets or {}
	local ver = GetAddOnMetadata("Overachiever", "Version")
	local build = select(2, GetBuildInfo())
	local faction
	if (UnitFactionGroup("player") == "Alliance") then
		faction = "Alliance"
	else
		faction = "Horde"
	end

	if (name == "meta") then
		local lookupMeta, lookupMetaIncomplete = Overachiever.GetMetaCriteriaLookup(true)
		if (not lookupMetaIncomplete) then  -- Don't save data to cache if lookup wasn't complete
			saveCacheSection("meta", lookupMeta, ver, build, faction, not skipPopulate and TjAchieve.CRITTYPE_META or false)
		end
	elseif (name == "kill") then
		local lookupKill, lookupKillIncomplete = Overachiever.GetKillCriteriaLookup(true)
		if (not lookupMetaIncomplete) then  -- Don't save data to cache if lookup wasn't complete
			saveCacheSection("kill", lookupKill, ver, build, faction, not skipPopulate and TjAchieve.CRITTYPE_KILL or false)
		end
	else
		error("Invalid call to Overachiever.SaveCache. Cache name \"" .. name .. "\" not recognized.")
	end
end

function Overachiever.GetCache(name)
	if (Overachiever_Cache_CritAssets) then
		local tab = Overachiever_Cache_CritAssets[name]
		if (tab) then
			local ver = GetAddOnMetadata("Overachiever", "Version")
			local build = select(2, GetBuildInfo())
			local tabVersionData = Overachiever_Cache_CritAssets[name .. "_version"]
			if (tabVersionData and isCacheCompatible(ver, tabVersionData.ver, build, tabVersionData.build)) then
			--if (tabVersionData and tabVersionData.build == build) then
				local factionOK = false
				if (tabVersionData.faction == "both") then
					factionOK = true
				elseif (UnitFactionGroup("player") == "Alliance") then
					factionOK = (tabVersionData.faction == "Alliance")
				else
					factionOK = (tabVersionData.faction == "Horde")
				end
				if (factionOK) then
					return tab
				elseif (Overachiever_Debug) then
					Overachiever.chatprint("Ignoring "..name.." cache with data for opposing faction.")
				end
			elseif (Overachiever_Debug and tabVersionData) then
				Overachiever.chatprint("Ignoring "..name.." cache with old build. (WoW build: "..build..". Cache build: "..(tabVersionData.build or type(tabVersionData.build))..")")
			end
		end
	end
	return false
end


if (Overachiever_Debug) then
	function Overachiever.InvalidateCache(name)
		if (Overachiever_Cache_CritAssets) then
			local tabVersionData = Overachiever_Cache_CritAssets[name .. "_version"]
			if (not tabVersionData) then
				Overachiever.chatprint("Cache for \"" .. name .. "\" not found.")
				return;
			end
			tabVersionData.build = "0"
			Overachiever.chatprint("Invalidated cache for \"" .. name .. "\".")
		else
			Overachiever.chatprint("Cache not found.")
		end
	end
end

--[[
/run Overachiever.InvalidateCache("meta")
/run Overachiever.InvalidateCache("kill")
--]]
