
local L = OVERACHIEVER_STRINGS
local GetAchievementInfo = GetAchievementInfo
local GetAchievementCriteriaInfo = Overachiever.GetAchievementCriteriaInfo
local LBI = LibStub:GetLibrary("LibBabble-Inventory-3.0"):GetReverseLookupTable()

local iconAchShield = "|TInterface\\AddOns\\Overachiever\\AchShield:0|t"                -- Our standard achievement-needed indicator.
local iconAchShieldLarge = "|TInterface\\AddOns\\Overachiever\\AchShield:16:16:-4:-2|t" -- Large version.
local iconAchShieldGlow = "|TInterface\\AddOns\\Overachiever_Trade\\AchShieldGlow:0|t"  -- Glowing/highlighted version.

--[[
Overachiever.chatprint(iconAchShield .. " ONE")
Overachiever.chatprint(iconAchShieldLarge .. " TWO")
Overachiever.chatprint(iconAchShieldGlow .. " THREE")
--]]

--local chatprint = Overachiever.chatprint

local TradeSkillLookup = {}

do
  local TradeSkillAch = {
    Cooking = {
      GourmetOutland = true,
      GourmetNorthrend = true,
      GourmetCataclysm = true,
      GourmetPandaren = true,
	  GourmetDraenor = true,
	  LegionMenu = true,
	  BattleMenu = true,
    }
  }
  local id, recipeID, _, completed
  for tradeName, list in pairs(TradeSkillAch) do
    TradeSkillLookup[tradeName] = {}
    local lookup = TradeSkillLookup[tradeName]
    for ach in pairs(list) do
      id = OVERACHIEVER_ACHID[ach]
      for i=1,GetAchievementNumCriteria(id) do
        _, _, completed, _, _, _, _, recipeID = GetAchievementCriteriaInfo(id, i)
        if (not completed) then
          lookup[recipeID] = lookup[recipeID] or {}
          lookup[recipeID][id] = i
        end
      end
    end
  end
  TradeSkillAch = nil

  --[[
  -- !! We use recipe IDs instead of names so this should no longer be necessary.
  -- !! This means L.TRADE_COOKING_OBJRENAME is deprecated and should be removed!
  local function renameObjective(tab, line, ...)
    if (line) then
      local old, new = strsplit("=", line)
      if (new and tab[old]) then
        tab[new] = tab[old]
        tab[old] = nil
      end
      renameObjective(tab, ...)
    end
  end

  if (L.TRADE_COOKING_OBJRENAME) then
    renameObjective( TradeSkillLookup.Cooking, strsplit("\n", L.TRADE_COOKING_OBJRENAME) )
  end
  renameObjective = nil
  --]]
end

local function getOpenTradeskill()
	return select(7, C_TradeSkillUI.GetTradeSkillLine())
	--local _, name = C_TradeSkillUI.GetTradeSkillLine()
	--return name
end


local function TradeSkillCheck(tradeName, recipeID, getList)
  local lookup = TradeSkillLookup[tradeName] and TradeSkillLookup[tradeName][recipeID]
  if (lookup) then
    local anyIncomplete, list
    for id,i in pairs(lookup) do
      -- If we don't care if the achievement is complete, or it isn't complete:
      if (Overachiever_Settings.Tradeskill_ShowCompletedAch_Cooking or (not select(4, GetAchievementInfo(id)))) then
        local _, _, completed = GetAchievementCriteriaInfo(id, i)
        if (completed) then
          lookup[id] = nil
        else
          if (not getList) then  return id;  end
          anyIncomplete = true
          if (not list) then
            if (type(getList) == "table") then
              list = getList
            else
              list = {}
            end
          end
          list[#list+1] = id
        end
      end
    end

    if (anyIncomplete) then  return list;  end
  end
end

local function TradeSkillCheckAll(recipeID, getList)
  local list = getList and {} or nil
  local anyFound = false
  for tradeName in pairs(TradeSkillLookup) do
    local v = TradeSkillCheck(tradeName, recipeID, list)
    if (v) then
      if (getList) then
        anyFound = true
      else
        return v
      end
    end
  end
  if (anyFound) then  return list;  end
end


local icons, highlights = {}
local currentButton

local ExamineTradeSkillUI

local skillButtonOnEnter

local function skillButtonOnLeave()
  currentButton = nil
  GameTooltip:Hide()
end

local function skillButtonOnClick(self)
  if (IsControlKeyDown()) then
    local icon = icons[self]
    if (icon.recipeID) then
      local id = TradeSkillCheck(LBI[getOpenTradeskill()], icon.recipeID)
      if (id) then  Overachiever.OpenToAchievement(id);  end
    end
  end
end

local function GetIcon(skillButton)
  local icon = icons[skillButton]
  if (icon) then  return icon;  end
  icon = skillButton:CreateTexture(nil, "OVERLAY")
  icon:SetTexture("Interface\\AddOns\\Overachiever\\AchShield")
  icon:SetWidth(12)
  icon:SetHeight(12)
  icon:SetPoint("LEFT", skillButton, "LEFT", 7, 0)
  icons[skillButton] = icon

  local highlight = skillButton:CreateTexture(nil, "HIGHLIGHT")
  highlight:SetTexture("Interface\\AddOns\\Overachiever_Trade\\AchShieldGlow")
  highlight:SetWidth(12)
  highlight:SetHeight(12)
  highlight:SetPoint("CENTER", icon, "CENTER")
  highlights = highlights or {}
  highlights[icon] = highlight

  -- Tooltip handling:
  local prev = skillButton:GetScript("OnEnter")
  if (prev) then
    skillButton:HookScript("OnEnter", skillButtonOnEnter)
  else
    skillButton:SetScript("OnEnter", skillButtonOnEnter)
  end
  prev = skillButton:GetScript("OnLeave")
  if (prev) then
    skillButton:HookScript("OnLeave", skillButtonOnLeave)
  else
    skillButton:SetScript("OnLeave", skillButtonOnLeave)
  end

  -- OnClick hook:
  skillButton:HookScript("OnClick", skillButtonOnClick)

  if (skillButton:IsMouseOver()) then
    currentButton = skillButton  -- Causes ExamineTradeSkillUI to trigger skillButtonOnEnter.
  end

  return icon
end



-- ---------- Support for other addons: ----------

-- Skillet:

function Overachiever.GetIconForRecipe(recipeID)
  local ach = TradeSkillCheckAll(recipeID)
  return ach and iconAchShield or ""
end

--[[ Very old code!
if (Skillet) then
  local lilsparkys = not not Skillet.version:find("LS")

  local function sortByAchRequired(tradeName, a, b)
-- This groups recipes that are required by the same number of achievements together. Each group is ordered according
-- to the first achievement (by ID) that requires each recipe, sorting them first by the achievement name, then the
-- achievement ID, then the recipe name. Recipes that are required by the most achievements go first.
    if (a and b) then
      -- Support for lilsparky's branch:
      if (lilsparkys) then
        a, b = a.skillIndex, b.skillIndex
        tradeName = getOpenTradeskill()
      end

      local aName = GetTradeSkillInfo(a)
      local bName = GetTradeSkillInfo(b)
      tradeName = LBI[tradeName]

      if (TradeSkillLookup[tradeName]) then
        -- Get number of achievements that require this recipe:
        a = TradeSkillCheck(tradeName, aName, true)
        local aNum = a and #a or 0
        if (a) then  -- This can't wait since TradeSkillCheck is going to be called again, which wipes the table.
          sort(a)
          a = a[1]
        end
        b = TradeSkillCheck(tradeName, bName, true)
        local bNum = b and #b or 0

        if (aNum ~= bNum) then
          return aNum > bNum  -- Notice that we check greater-than, not less-than here.
        elseif (aNum > 0) then  -- If both are greater than zero:
          sort(b)
          b = b[1]
          local aID, aV = GetAchievementInfo(a)
          local bID, bV = GetAchievementInfo(b)
          if (aID ~= bID) then
            if (aV ~= bV) then
              return aV < bV
            else
              return aID < bID
            end
          end
        end
      end

      -- Fall back to names by alphabetical order:
      return aName < bName

    else
      return not b
    end
  end

  Skillet:AddRecipeSorter(L.TRADE_SKILLET_ACHSORT, sortByAchRequired)

  local orig_get_extra = Skillet.GetExtraItemDetailText
  Skillet.GetExtraItemDetailText = function(obj, tradeskill, skill_index)
    --print("Skillet.GetExtraItemDetailText")
    local before = orig_get_extra(obj, tradeskill, skill_index)
    tradeskill = LBI[tradeskill]
    local achs = TradeSkillLookup[tradeskill] and TradeSkillCheck(tradeskill, GetTradeSkillInfo(skill_index), true)
    if (not achs) then  return before;  end

    local myvalue = "|TInterface\\AddOns\\Overachiever_Trade\\AchShieldGlow:0|t |cffffd100" ..
      L.REQUIREDFORMETATIP .. "|cffffffff"
    local _, name
    if (#achs > 1) then
      for i,id in ipairs(achs) do
        _, name = GetAchievementInfo(id)
        myvalue = myvalue.."|n  - "..name
      end
    else
      _, name = GetAchievementInfo(achs[1])
      myvalue = myvalue.."  "..name
    end
    myvalue = myvalue.."|r"

    if (before) then
      return before .. "|n" .. myvalue
    else
      return myvalue
    end
  end

  local orig_get_prefix = Skillet.GetRecipeNamePrefix
  Skillet.GetRecipeNamePrefix = function(obj, tradeskill, skill_index)
    local before = orig_get_prefix(tradeskill, skill_index)

    -- Support for lilsparky's branch:
    if (lilsparkys) then
      tradeskill = getOpenTradeskill()
    end
    tradeskill = LBI[tradeskill]

    local ach = TradeSkillLookup[tradeskill] and TradeSkillCheck(tradeskill, GetTradeSkillInfo(skill_index), false)
    if (not ach) then  return before;  end

    local myvalue = "|TInterface\\AddOns\\Overachiever\\AchShield:16:16:-4:-2|t"
    if (before) then
      return myvalue .. before
    else
      return myvalue
    end
  end

  local function SkilletButtonOnClick(self)
    if ( (not lilsparkys and IsControlKeyDown()) or (lilsparkys and IsAltKeyDown()) ) then
      local index = self:GetID()
      if (index) then
        local tradeName = LBI[getOpenTradeskill()]
        local id = TradeSkillLookup[tradeName] and TradeSkillCheck(tradeName, GetTradeSkillInfo(index), false)
        if (id) then  Overachiever.OpenToAchievement(id);  end
      end
    end
  end

  local SkilletButtonOnEnter
  if (lilsparkys) then
  -- For some reason, lilsparky's branch explicitly removed support for GetExtraItemDetailText, so we're "forcing"
  -- our way in, at least to the tooltips:
    function SkilletButtonOnEnter(self)
      currentButton = self
      local index = self:GetID()
      if (index and not self.locked) then
        local tradeName = LBI[getOpenTradeskill()]
        local achlist = TradeSkillLookup[tradeName] and TradeSkillCheck(tradeName, GetTradeSkillInfo(index), true)
        if (achlist) then
          -- The custom tooltip used by Skillet doesn't handle AddTexture, or we'd use that instead of this method:
          SkilletTradeskillTooltip:AddLine("|TInterface\\AddOns\\Overachiever_Trade\\AchShieldGlow:0|t |cffffd100" .. L.REQUIREDFORMETATIP)
          Overachiever.AddAchListToTooltip(SkilletTradeskillTooltip, achlist)
          SkilletTradeskillTooltip:Show()
        end
      end
    end

    -- Needed for when the button's contents change while the cursor is over it:
    local orig_Skillet_SkillButton_OnEnter = Skillet.SkillButton_OnEnter
    Skillet.SkillButton_OnEnter = function(obj, button, ...)
      orig_Skillet_SkillButton_OnEnter(obj, button, ...)
      if (currentButton) then  SkilletButtonOnEnter(currentButton);  end
    end
  end

  local hookedOnClick = {}

  local function SkilletButtonPreShow(button)
    if (not hookedOnClick[button]) then
      hookedOnClick[button] = true
      button:HookScript("OnClick", SkilletButtonOnClick)
      if (lilsparkys) then
        button:HookScript("OnEnter", SkilletButtonOnEnter)
        button:HookScript("OnLeave", skillButtonOnLeave)  -- so currentButton will be set to nil
      end
    end
    return button
  end

  Skillet:AddPreButtonShowCallback(SkilletButtonPreShow)

end
--]]

-- Advanced Trade Skill Window:
--[[ Very old code! ATSW is no longer maintained.
if (ATSWFrame) then

  function skillButtonOnEnter(self, _, calledByExamine)
    currentButton = self
    local icon = icons[self]
    if (icon.name) then
      local achlist = TradeSkillCheck(LBI[getOpenTradeskill()], icon.name, true)
      if (achlist) then
        ATSWTradeskillTooltip:AddLine(" ")
        -- The custom tooltip used by ATSW doesn't handle AddTexture, or we'd use that instead of this method:
        ATSWTradeskillTooltip:AddLine("|TInterface\\AddOns\\Overachiever_Trade\\AchShieldGlow:0|t |cffffd100" .. L.REQUIREDFORMETATIP)
        Overachiever.AddAchListToTooltip(ATSWTradeskillTooltip, achlist)
        ATSWTradeskillTooltip:Show()
        return true
      elseif (not calledByExamine) then
      -- A criteria must have been earned while the Trade Skills frame was open. Reexamine it:
        ExamineTradeSkillUI()
      end
    end
  end

  function ExamineTradeSkillUI()
    if (not ATSWFrame:IsVisible()) then  return;  end  -- Using IsVisible instead of IsShown because ATSW uses this.

    -- Hide all icons:
    for btn, icon in pairs(icons) do
      icon:Hide()
      highlights[icon]:Hide()
      icon.name = nil
    end

    local tradeName = LBI[getOpenTradeskill()]
    if (TradeSkillLookup[tradeName]) then
      -- Find icons that should be displayed:
      local skillButton, i = ATSWSkill1, 1
      local skillName, skillType
      while (skillButton and skillButton:IsShown()) do
        skillName, skillType = GetTradeSkillInfo(skillButton:GetID())
        if (skillName and skillType ~= "header" and TradeSkillCheck(tradeName, skillName)) then
          local icon = GetIcon(skillButton)
          icon:Show()
          highlights[icon]:Show()
          icon.name = skillName
        end
        i = i + 1
        skillButton = _G["ATSWSkill"..i]
      end
    end

    -- Needed for when the button's contents change while the cursor is over it:
    if (currentButton) then  skillButtonOnEnter(currentButton, nil, true);  end
  end

  hooksecurefunc("ATSWFrame_Update", ExamineTradeSkillUI)

end
--]]

-- Producer:
--[[ Very old code! Producer is no longer maintained.
if (Producer) then

  local function producer_achievementClick(id)
    if (IsShiftKeyDown()) then
      if ( ChatEdit_GetActiveWindow() ) then
        ChatEdit_InsertLink(GetAchievementLink(id));
      else
        ChatFrame_OpenChat(GetAchievementLink(id));
      end
    else
      Overachiever.OpenToAchievement(id)
    end
  end

  local titleLine

  local orig_AddTradeSkillLines = Producer.CraftFrame.AddTradeSkillLines
  function Producer.CraftFrame:AddTradeSkillLines(trade, grp)
    local tradeskill = LBI[getOpenTradeskill()]
    local achs = TradeSkillLookup[tradeskill] and TradeSkillCheck(tradeskill, trade.name, true)
    if (achs) then
      titleLine = titleLine or { type = "header", text = "|cffffd100" .. L.REQUIREDFORMETATIP, isPlain = true, icon = "Interface\\AddOns\\Overachiever_Trade\\AchShieldGlow" }
      grp:AddLine(titleLine)
      local _, name
      for i,id in ipairs(achs) do
        _, name = GetAchievementInfo(id)
        grp:AddLine({ text = name, link = GetAchievementLink(id), action = producer_achievementClick, params = { id } })
        --closeWhenClicked = true
      end
      grp:AddLine()
    end
    return orig_AddTradeSkillLines(self, trade, grp)
  end

  -- Thanks to CMTitan (CurseForge.com user) for the code this is based on:
  local function ProducerTradeskillChanger(trade, line)
      if (not trade.name) then  return line;  end
      local tradeName = LBI[getOpenTradeskill()]
      if (TradeSkillLookup[tradeName] and TradeSkillCheck(tradeName, trade.name)) then
        line.text = "|TInterface\\AddOns\\Overachiever\\AchShield:16:16:-4:-2|t" .. line.text
      end
      return line
  end
  Producer.CraftFrame:RegisterTradeSkillChanger( ProducerTradeskillChanger )

end
--]]

-- ---------- End addon support section. ----------



skillButtonOnEnter = skillButtonOnEnter or function(self, _, calledByExamine)
  currentButton = self
  local icon = icons[self]
  if (icon.recipeID) then
    local achlist = TradeSkillCheck(LBI[getOpenTradeskill()], icon.recipeID, true)
    if (achlist) then
      GameTooltip:SetOwner(self, "ANCHOR_NONE")
      GameTooltip:SetPoint("TOPLEFT", self, "TOPRIGHT", -45, 0)
      GameTooltip:SetBackdropColor(TOOLTIP_DEFAULT_BACKGROUND_COLOR.r, TOOLTIP_DEFAULT_BACKGROUND_COLOR.g, TOOLTIP_DEFAULT_BACKGROUND_COLOR.b)
      GameTooltip:AddLine(L.REQUIREDFORMETATIP)
      GameTooltip:AddLine(" ")
      Overachiever.AddAchListToTooltip(GameTooltip, achlist)
      GameTooltip:AddLine(" ")
      if (Overachiever_Debug) then  GameTooltip:AddLine(icon.name .. " recipe ID: " .. icon.recipeID)  end
      GameTooltip:Show()
      return true
    elseif (not calledByExamine) then
    -- A criteria must have been earned while the Trade Skills frame was open. Reexamine it:
      ExamineTradeSkillUI()
    end
  end
end

if (ExamineTradeSkillUI == nil) then
  function ExamineTradeSkillUI(self)
    --chatprint("ExamineTradeSkillUI")
    -- Hide all icons:
    for btn, icon in pairs(icons) do
      icon:Hide()
      highlights[icon]:Hide()
      icon.recipeID = nil
      icon.name = nil
    end

    local tradeName = LBI[getOpenTradeskill()]
    if (TradeSkillLookup[tradeName]) then
      -- Find icons that should be displayed:
	  -- Based on part of TradeSkillRecipeListMixin:RefreshDisplay() in Blizzard_TradeSkillRecipeList.lua
		local offset = HybridScrollFrame_GetOffset(self);
		local children = { TradeSkillFrameScrollChild:GetChildren() };

		for i, tradeSkillButton in ipairs(self.buttons) do
			local dataIndex = offset + i;
			local tradeSkillInfo = self.dataList[dataIndex];
			if tradeSkillInfo then
				if tradeSkillInfo.type == "recipe" and TradeSkillCheck(tradeName, tradeSkillInfo.recipeID) then
				  --local icon = GetIcon( _G["TradeSkillSkill"..i] )
				  local icon = GetIcon( children[i] )
				  icon:Show()
				  highlights[icon]:Show()
				  icon.recipeID = tradeSkillInfo.recipeID
          icon.name = tradeSkillInfo.name
				end
			end
		end

	  --[[ OLD - pre WoW 7.0.x
      -- Based on part of TradeSkillFrame_Update().
      local skillOffset = FauxScrollFrame_GetOffset(TradeSkillListScrollFrame)
      local hasFilterBar = TradeSkillFilterBar:IsShown()
      local diplayedSkills = hasFilterBar and (TRADE_SKILLS_DISPLAYED - 1) or TRADE_SKILLS_DISPLAYED  -- "diplayedSkills" [sic], as per original
      local skillName, skillType
      for i=1,diplayedSkills do
        skillName, skillType = GetTradeSkillInfo(i + skillOffset)
        if (skillName and skillType ~= "header" and TradeSkillCheck(tradeName, skillName)) then
          local icon = GetIcon( _G["TradeSkillSkill"..(hasFilterBar and (i + 1) or i)] )
          icon:Show()
          highlights[icon]:Show()
          icon.name = skillName
        end
      end
	  --]]
    end

    -- Needed for when the button's contents change while the cursor is over it:
    if (currentButton and not skillButtonOnEnter(currentButton, nil, true)) then
      GameTooltip:Hide()  -- Hide tooltip if skillButtonOnEnter didn't show it.
    end
  end

  --old: hooksecurefunc("TradeSkillFrame_Update", ExamineTradeSkillUI)

  --hooksecurefunc(TradeSkillRecipeListMixin, "RefreshDisplay", ExamineTradeSkillUI)

  --hooksecurefunc(TradeSkillFrame.RecipeList, "RefreshDisplay", ExamineTradeSkillUI)
  --hooksecurefunc(TradeSkillFrame.RecipeList, "update", ExamineTradeSkillUI)
  
  hooksecurefunc(TradeSkillFrame.RecipeList, "UpdateScrollChildRect", ExamineTradeSkillUI)
end
