function CPFPets_UpdateHealth(self, pet)
    if UnitExists(pet) then
        self:SetValue(UnitHealth(pet))
    end
end

function CPFPets_UpdatePosition(unit, event)
    local partyMembers = GetNumGroupMembers()

    if partyMembers > 0 then
        local petAnchor = "CompactPartyFrameMember" .. partyMembers

        if UnitExists(unit) and unit == "pet" then
            CPFPets_PlayerPet:SetPoint("LEFT", petAnchor, "LEFT", 1, -50)
            CPFPets_PlayerPet.name:SetText(UnitName(unit))
            CPFPets_PlayerPet:Show()
        elseif not UnitExists(unit) and unit == "pet" then
            CPFPets_PlayerPet.name:SetText("")
            CPFPets_PlayerPet:Hide()
        end

        if UnitExists(unit) and unit == "partypet1" then
            CPFPets_PartyPet1:SetPoint("CENTER", CPFPets_PlayerPet or petAnchor, "CENTER", 0, -20)
            CPFPets_PartyPet1.name:SetText(UnitName(unit))
            CPFPets_PartyPet1:Show()
        elseif not UnitExists(unit) and unit == "partypet1" then
            CPFPets_PartyPet1.name:SetText("")
            CPFPets_PartyPet1:Hide()
        end

        if UnitExists(unit) and unit == "partypet2" then
            CPFPets_PartyPet2:SetPoint("CENTER", CPFPets_PartyPet1 or CPFPets_PlayerPet or petAnchor, "CENTER", 0, -20)
            CPFPets_PartyPet2.name:SetText(UnitName(unit))
            CPFPets_PartyPet2:Show()
        elseif not UnitExists(unit) and unit == "partypet2" then
            CPFPets_PartyPet2.name:SetText("")
            CPFPets_PartyPet2:Hide()
        end

        if UnitExists(unit) and unit == "partypet3" then
            CPFPets_PartyPet3:SetPoint("CENTER", CPFPets_PartyPet1 or CPFPets_PlayerPet2 or CPFPets_PlayerPet or petAnchor, "CENTER", 0, -20)
            CPFPets_PartyPet3.name:SetText(UnitName(unit))
            CPFPets_PartyPet3:Show()
        elseif not UnitExists(unit) and unit == "partypet3" then
            CPFPets_PartyPet3:UnregisterAllEvents()
        end

        if UnitExists(unit) and unit == "partypet4" then
            CPFPets_PartyPet4:SetPoint("CENTER", CPFPets_PartyPet1 or CPFPets_PlayerPet2 or CPFPets_PlayerPet3 or CPFPets_PlayerPet or petAnchor, "CENTER", 0, -20)
            CPFPets_PartyPet4.name:SetText(UnitName(unit))
            CPFPets_PartyPet4:Show()
        elseif not UnitExists(unit) and unit == "partypet4" then
            CPFPets_PartyPet4:UnregisterAllEvents()
        end
    end
end

-- ======================================== PLAYER PET ======================================== --

-- Create Pet HealthBar
CPFPets_PlayerPet = CreateFrame("StatusBar", "CPFPets_PlayerPet", UIParent)

-- Set Frame Size
CPFPets_PlayerPet:SetSize(129, 20)

-- Create FontString for Pet Name
CPFPets_PlayerPet.name = CPFPets_PlayerPet:CreateFontString(nil)
CPFPets_PlayerPet.name:SetFont(STANDARD_TEXT_FONT, 10, "")
CPFPets_PlayerPet.name:SetPoint("LEFT", CPFPets_PlayerPet, "LEFT", 5, 0)
CPFPets_PlayerPet.name:SetShadowOffset(1, -1)

-- Set Background
CPFPets_PlayerPet.background = CPFPets_PlayerPet:CreateTexture()
CPFPets_PlayerPet.background:SetAllPoints(CPFPets_PlayerPet)
CPFPets_PlayerPet.background:SetTexture([[Interface\RaidFrame\Raid-Bar-Hp-Bg]])
CPFPets_PlayerPet.background:SetTexCoord(0, 1, 0, 0.53125)

-- Set Bar Texture & Color
CPFPets_PlayerPet:SetStatusBarTexture([[Interface\RaidFrame\Raid-Bar-Hp-Fill]])
CPFPets_PlayerPet:SetStatusBarColor(0, 1, 0)

-- Set MinMax Values
CPFPets_PlayerPet:SetMinMaxValues(0, UnitHealthMax("pet"))

-- Create Button for Pet Healthbar
CPFPets_PlayerPetButton = CreateFrame("Button", "CPFPets_PlayerPetButton", CPFPets_PlayerPet, "SecureUnitButtonTemplate")

-- Set Button Position
CPFPets_PlayerPetButton:SetPoint("CENTER")
CPFPets_PlayerPetButton:SetSize(129, 20)

-- Set Button Attribute
CPFPets_PlayerPetButton:SetAttribute("unit", "pet")

-- Register Button and Click Events
RegisterUnitWatch(CPFPets_PlayerPetButton)
CPFPets_PlayerPetButton:RegisterForClicks("AnyUp")

-- Register Clicks
CPFPets_PlayerPetButton:SetAttribute("*type1", "target") -- Target unit on left click
CPFPets_PlayerPetButton:SetAttribute("*type2", "togglemenu") -- Toggle units menu on left click
CPFPets_PlayerPetButton:SetAttribute("*type3", "assist") -- On middle click, target the target of the clicked unit

-- Register Events
CPFPets_PlayerPet:RegisterEvent("UNIT_PET")
CPFPets_PlayerPet:RegisterEvent("UNIT_HEALTH")
CPFPets_PlayerPet:RegisterEvent("UNIT_MAXHEALTH", CPFPets_PlayerPet:SetMinMaxValues(0, UnitHealthMax("pet")))
CPFPets_PlayerPet:RegisterEvent("PLAYER_LOGIN")
CPFPets_PlayerPet:RegisterEvent("PLAYER_ENTERING_WORLD")
CPFPets_PlayerPet:RegisterEvent("GROUP_ROSTER_UPDATE")

-- ======================================== PARTYPET 1 ======================================== --

-- Create Pet HealthBar
CPFPets_PartyPet1 = CreateFrame("StatusBar", "CPFPets_PartyPet1", UIParent)

-- Set Frame Size
CPFPets_PartyPet1:SetSize(129, 20)

-- Create FontString for Pet Name
CPFPets_PartyPet1.name = CPFPets_PartyPet1:CreateFontString(nil)
CPFPets_PartyPet1.name:SetFont(STANDARD_TEXT_FONT, 10, "")
CPFPets_PartyPet1.name:SetPoint("LEFT", CPFPets_PartyPet1, "LEFT", 5, 0)
CPFPets_PartyPet1.name:SetShadowOffset(1,-1)

-- Set Background
CPFPets_PartyPet1.background = CPFPets_PartyPet1:CreateTexture()
CPFPets_PartyPet1.background:SetTexture([[Interface\RaidFrame\Raid-Bar-Hp-Bg]])

-- Set Bar Texture & Color
CPFPets_PartyPet1:SetStatusBarTexture([[Interface\RaidFrame\Raid-Bar-Hp-Fill]])
CPFPets_PartyPet1:SetStatusBarColor(0, 1, 0)

-- Set MinMax Values
CPFPets_PartyPet1:SetMinMaxValues(0, UnitHealthMax("partypet1"))

-- Create Button for Pet Healthbar
CPFPets_PartyPet1Button = CreateFrame("Button", "CPFPets_PlayerPetButton", CPFPets_PartyPet1, "SecureUnitButtonTemplate")

-- Set Button Position
CPFPets_PartyPet1Button:SetPoint("CENTER")
CPFPets_PartyPet1Button:SetSize(129, 20)

-- Set Button Attribute
CPFPets_PartyPet1Button:SetAttribute("unit", "partypet1")

-- Register Button and Click Events
RegisterUnitWatch(CPFPets_PartyPet1Button)
CPFPets_PartyPet1Button:RegisterForClicks("AnyUp")

-- Register Clicks
CPFPets_PartyPet1Button:SetAttribute("*type1", "target") -- Target unit on left click
CPFPets_PartyPet1Button:SetAttribute("*type2", "togglemenu") -- Toggle units menu on left click
CPFPets_PartyPet1Button:SetAttribute("*type3", "assist") -- On middle click, target the target of the clicked unit

-- Register Events
CPFPets_PartyPet1:RegisterEvent("UNIT_PET")
CPFPets_PartyPet1:RegisterEvent("UNIT_HEALTH")
CPFPets_PartyPet1:RegisterEvent("UNIT_MAXHEALTH", CPFPets_PartyPet1:SetMinMaxValues(0, UnitHealthMax("partypet1")))
CPFPets_PartyPet1:RegisterEvent("PLAYER_ENTERING_WORLD")
CPFPets_PartyPet1:RegisterEvent("PLAYER_LEAVING_WORLD")
CPFPets_PartyPet1:RegisterEvent("UNIT_CONNECTION")
CPFPets_PartyPet1:RegisterEvent("GROUP_ROSTER_UPDATE")

-- ======================================== PARTYPET 2 ======================================== --

-- Create Pet HealthBar
CPFPets_PartyPet2 = CreateFrame("StatusBar", "CPFPets_PartyPet2", UIParent)

-- Set Frame Size
CPFPets_PartyPet2:SetSize(129, 20)

-- Create FontString for Pet Name
CPFPets_PartyPet2.name = CPFPets_PartyPet2:CreateFontString(nil)
CPFPets_PartyPet2.name:SetFont(STANDARD_TEXT_FONT, 10, "")
CPFPets_PartyPet2.name:SetPoint("LEFT", CPFPets_PartyPet2, "LEFT", 5, 0)
CPFPets_PartyPet2.name:SetShadowOffset(1,-1)

-- Set Background
CPFPets_PartyPet2.background = CPFPets_PartyPet2:CreateTexture()
CPFPets_PartyPet2.background:SetTexture([[Interface\RaidFrame\Raid-Bar-Hp-Bg]])

-- Set Bar Texture & Color
CPFPets_PartyPet2:SetStatusBarTexture([[Interface\RaidFrame\Raid-Bar-Hp-Fill]])
CPFPets_PartyPet2:SetStatusBarColor(0, 1, 0)

-- Set MinMax Values
CPFPets_PartyPet2:SetMinMaxValues(0, UnitHealthMax("partypet2"))

-- Create Button for Pet Healthbar
CPFPets_PartyPet2Button = CreateFrame("Button", "CPFPets_PlayerPetButton", CPFPets_PartyPet2, "SecureUnitButtonTemplate")

-- Set Button Position
CPFPets_PartyPet2Button:SetPoint("CENTER")
CPFPets_PartyPet2Button:SetSize(129, 20)

-- Set Button Attribute
CPFPets_PartyPet2Button:SetAttribute("unit", "partypet2")

-- Register Button and Click Events
RegisterUnitWatch(CPFPets_PartyPet2Button)
CPFPets_PartyPet2Button:RegisterForClicks("AnyUp")

-- Register Clicks
CPFPets_PartyPet2Button:SetAttribute("*type1", "target") -- Target unit on left click
CPFPets_PartyPet2Button:SetAttribute("*type2", "togglemenu") -- Toggle units menu on left click
CPFPets_PartyPet2Button:SetAttribute("*type3", "assist") -- On middle click, target the target of the clicked unit

-- Register Events
CPFPets_PartyPet2:RegisterEvent("UNIT_PET")
CPFPets_PartyPet2:RegisterEvent("UNIT_HEALTH")
CPFPets_PartyPet2:RegisterEvent("UNIT_MAXHEALTH", CPFPets_PartyPet2:SetMinMaxValues(0, UnitHealthMax("partypet2")))
CPFPets_PartyPet2:RegisterEvent("PLAYER_ENTERING_WORLD")
CPFPets_PartyPet2:RegisterEvent("PLAYER_LEAVING_WORLD")
CPFPets_PartyPet2:RegisterEvent("UNIT_CONNECTION")
CPFPets_PartyPet2:RegisterEvent("GROUP_ROSTER_UPDATE")

-- ======================================== PARTYPET 3 ======================================== --

-- Create Pet HealthBar
CPFPets_PartyPet3 = CreateFrame("StatusBar", "CPFPets_PartyPet3", UIParent)

-- Set Frame Size
CPFPets_PartyPet3:SetSize(129, 20)

-- Create FontString for Pet Name
CPFPets_PartyPet3.name = CPFPets_PartyPet3:CreateFontString(nil)
CPFPets_PartyPet3.name:SetFont(STANDARD_TEXT_FONT, 10, "")
CPFPets_PartyPet3.name:SetPoint("LEFT", CPFPets_PartyPet3, "LEFT", 5, 0)
CPFPets_PartyPet3.name:SetShadowOffset(1,-1)

-- Set Background
CPFPets_PartyPet3.background = CPFPets_PartyPet3:CreateTexture()
CPFPets_PartyPet3.background:SetTexture([[Interface\RaidFrame\Raid-Bar-Hp-Bg]])

-- Set Bar Texture & Color
CPFPets_PartyPet3:SetStatusBarTexture([[Interface\RaidFrame\Raid-Bar-Hp-Fill]])
CPFPets_PartyPet3:SetStatusBarColor(0, 1, 0)

-- Set MinMax Values
CPFPets_PartyPet3:SetMinMaxValues(0, UnitHealthMax("partypet3"))

-- Create Button for Pet Healthbar
CPFPets_PartyPet3Button = CreateFrame("Button", "CPFPets_PlayerPetButton", CPFPets_PartyPet3, "SecureUnitButtonTemplate")

-- Set Button Position
CPFPets_PartyPet3Button:SetPoint("CENTER")
CPFPets_PartyPet3Button:SetSize(129, 20)

-- Set Button Attribute
CPFPets_PartyPet3Button:SetAttribute("unit", "partypet3")

-- Register Button and Click Events
RegisterUnitWatch(CPFPets_PartyPet3Button)
CPFPets_PartyPet3Button:RegisterForClicks("AnyUp")

-- Register Clicks
CPFPets_PartyPet3Button:SetAttribute("*type1", "target") -- Target unit on left click
CPFPets_PartyPet3Button:SetAttribute("*type2", "togglemenu") -- Toggle units menu on left click
CPFPets_PartyPet3Button:SetAttribute("*type3", "assist") -- On middle click, target the target of the clicked unit

-- Register Events
CPFPets_PartyPet3:RegisterEvent("UNIT_PET")
CPFPets_PartyPet3:RegisterEvent("UNIT_HEALTH")
CPFPets_PartyPet3:RegisterEvent("UNIT_MAXHEALTH", CPFPets_PartyPet3:SetMinMaxValues(0, UnitHealthMax("partypet3")))
CPFPets_PartyPet3:RegisterEvent("PLAYER_ENTERING_WORLD")
CPFPets_PartyPet3:RegisterEvent("PLAYER_LEAVING_WORLD")
CPFPets_PartyPet3:RegisterEvent("UNIT_CONNECTION")
CPFPets_PartyPet3:RegisterEvent("GROUP_ROSTER_UPDATE")

-- ======================================== PARTYPET 4 ======================================== --

-- Create Pet HealthBar
CPFPets_PartyPet4 = CreateFrame("StatusBar", "CPFPets_PartyPet4", UIParent)

-- Set Frame Size
CPFPets_PartyPet4:SetSize(129, 20)

-- Create FontString for Pet Name
CPFPets_PartyPet4.name = CPFPets_PartyPet4:CreateFontString(nil)
CPFPets_PartyPet4.name:SetFont(STANDARD_TEXT_FONT, 10, "")
CPFPets_PartyPet4.name:SetPoint("LEFT", CPFPets_PartyPet4, "LEFT", 5, 0)
CPFPets_PartyPet4.name:SetShadowOffset(1,-1)

-- Set Background
CPFPets_PartyPet4.background = CPFPets_PartyPet4:CreateTexture()
CPFPets_PartyPet4.background:SetTexture([[Interface\RaidFrame\Raid-Bar-Hp-Bg]])

-- Set Bar Texture & Color
CPFPets_PartyPet4:SetStatusBarTexture([[Interface\RaidFrame\Raid-Bar-Hp-Fill]])
CPFPets_PartyPet4:SetStatusBarColor(0, 1, 0)

-- Set MinMax Values
CPFPets_PartyPet4:SetMinMaxValues(0, UnitHealthMax("partypet4"))

-- Create Button for Pet Healthbar
CPFPets_PartyPet4Button = CreateFrame("Button", "CPFPets_PlayerPetButton", CPFPets_PartyPet4, "SecureUnitButtonTemplate")

-- Set Button Position
CPFPets_PartyPet4Button:SetPoint("CENTER")
CPFPets_PartyPet4Button:SetSize(129, 20)

-- Set Button Attribute
CPFPets_PartyPet4Button:SetAttribute("unit", "partypet4")

-- Register Button and Click Events
RegisterUnitWatch(CPFPets_PartyPet4Button)
CPFPets_PartyPet4Button:RegisterForClicks("AnyUp")

-- Register Clicks
CPFPets_PartyPet4Button:SetAttribute("*type1", "target") -- Target unit on left click
CPFPets_PartyPet4Button:SetAttribute("*type2", "togglemenu") -- Toggle units menu on left click
CPFPets_PartyPet4Button:SetAttribute("*type3", "assist") -- On middle click, target the target of the clicked unit

-- Register Events
CPFPets_PartyPet4:RegisterEvent("UNIT_PET")
CPFPets_PartyPet4:RegisterEvent("UNIT_HEALTH")
CPFPets_PartyPet4:RegisterEvent("UNIT_MAXHEALTH", CPFPets_PartyPet4:SetMinMaxValues(0, UnitHealthMax("partypet4")))
CPFPets_PartyPet4:RegisterEvent("PLAYER_ENTERING_WORLD")
CPFPets_PartyPet4:RegisterEvent("PLAYER_LEAVING_WORLD")
CPFPets_PartyPet4:RegisterEvent("UNIT_CONNECTION")
CPFPets_PartyPet4:RegisterEvent("GROUP_ROSTER_UPDATE")

-- ======================================== EVENTHOOKS ======================================== --

CPFPets_PlayerPet:HookScript("OnEvent", function(self, event)
    CPFPets_UpdateHealth(CPFPets_PlayerPet, "pet")
    CPFPets_UpdatePosition("pet")
end)

CPFPets_PartyPet1:HookScript("OnEvent", function(self, event)
    CPFPets_UpdateHealth(CPFPets_PlayerPet, "pet")
    CPFPets_UpdatePosition("partypet1", event)
end)

CPFPets_PartyPet2:HookScript("OnEvent", function(self, event)
    CPFPets_UpdateHealth(CPFPets_PlayerPet, "pet")
    CPFPets_UpdatePosition("partypet2", event)
end)

CPFPets_PartyPet3:HookScript("OnEvent", function(self, event)
    CPFPets_UpdateHealth(CPFPets_PlayerPet, "pet")
    CPFPets_UpdatePosition("partypet3", event)
end)

CPFPets_PartyPet4:HookScript("OnEvent", function(self, event)
    CPFPets_UpdateHealth(CPFPets_PlayerPet, "pet")
    CPFPets_UpdatePosition("partypet4")
end)