local PFP_PartyPet4 = PFP:NewModule("PFP_PartyPet4")

function PFP_PartyPet4:OnEnable()
    -- Create Pet HealthBar
    PFP_P4 = CreateFrame("StatusBar", "PFP_P4", UIParent)

    -- Set Frame Size
    PFP_P4:SetSize(PFP_DB.width, 30)

    -- Create FontString for Pet Name
    PFP_P4.name = PFP_P4:CreateFontString(nil)
    PFP_P4.name:SetFont(STANDARD_TEXT_FONT, 10, "")
    PFP_P4.name:SetPoint("LEFT", PFP_P4, "LEFT", 5, 0)
    PFP_P4.name:SetShadowOffset(1,-1)

    -- Set Bar Texture & Color
    PFP_P4:SetStatusBarTexture([[Interface\RaidFrame\Raid-Bar-Hp-Fill]])
    PFP_P4:GetStatusBarTexture():SetDrawLayer("ARTWORK", 5)
    PFP_P4:SetStatusBarColor(0, 1, 0)

    -- Set Background
    PFP_P4.background = PFP_P4:CreateTexture()
    PFP_P4.background:SetAllPoints(PFP_P4)
    PFP_P4.background:SetTexture([[Interface\RaidFrame\Raid-Bar-Hp-Bg]])
    PFP_P4.background:SetDrawLayer("BACKGROUND", -1)
    PFP_P4.background:SetTexCoord(0, 1, 0, 0.53125)

    -- Set Border
    PFP_P4.border = PFP_P4:CreateTexture()
    PFP_P4.border:SetAllPoints(PFP_P4)
    PFP_P4.border:SetTexture([[Interface\RaidFrame\Raid-FrameHighlights]])
    PFP_P4.border:SetTexCoord(0.00781250, 0.55468750, 0.28906250, 0.55468750)
    PFP_P4.border:SetDrawLayer("ARTWORK", 7)
    PFP_P4.border:Hide()

    -- Set MinMax Values
    PFP_P4:SetMinMaxValues(0, UnitHealthMax("partypet4"))

    -- Create Button for Pet Healthbar
    PFP_P4Button = CreateFrame("Button", "CPFPets_PlayerPetButton", PFP_P4, "SecureUnitButtonTemplate")

    -- Set Button Position
    PFP_P4Button:SetPoint("CENTER")
    PFP_P4Button:SetSize(PFP_DB.width, 30)

    -- Set Button Attribute
    PFP_P4Button:SetAttribute("unit", "partypet4")

    -- Register Button and Click Events
    RegisterUnitWatch(PFP_P4Button)
    PFP_P4Button:RegisterForClicks("AnyUp")

    -- Register Clicks
    PFP_P4Button:SetAttribute("*type1", "target") -- Target unit on left click
    PFP_P4Button:SetAttribute("*type2", "togglemenu") -- Toggle units menu on left click
    PFP_P4Button:SetAttribute("*type3", "assist") -- On middle click, target the target of the clicked unit

    -- Register Events
    PFP_P4:RegisterEvent("UNIT_HEALTH")
    PFP_P4:RegisterEvent("UNIT_MAXHEALTH")
    PFP_P4:RegisterEvent("PLAYER_TARGET_CHANGED")

    PFP_P4:HookScript("OnEvent", function(self, event)
        if event == "PLAYER_TARGET_CHANGED" then
            PFP:ShowBorder(PFP_P4, "partypet4")
        else
            PFP:UpdateHealth(PFP_P4, "partypet4")
            PFP_P4:SetMinMaxValues(0, UnitHealthMax("partypet4"))
        end
    end)
end