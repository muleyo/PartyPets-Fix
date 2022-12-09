local PFP_PartyPet3 = PFP:NewModule("PFP_PartyPet3")

function PFP_PartyPet3:OnEnable()
    -- Create Pet HealthBar
    PFP_P3 = CreateFrame("StatusBar", "PFP_P3", UIParent)

    -- Set Frame Size
    PFP_P3:SetSize(130, 30)

    -- Create FontString for Pet Name
    PFP_P3.name = PFP_P3:CreateFontString(nil)
    PFP_P3.name:SetFont(STANDARD_TEXT_FONT, 10, "")
    PFP_P3.name:SetPoint("LEFT", PFP_P3, "LEFT", 5, 0)
    PFP_P3.name:SetShadowOffset(1,-1)

    -- Set Bar Texture & Color
    PFP_P3:SetStatusBarTexture([[Interface\RaidFrame\Raid-Bar-Hp-Fill]])
    PFP_P3:GetStatusBarTexture():SetDrawLayer("ARTWORK", 5)
    PFP_P3:SetStatusBarColor(0, 1, 0)

    -- Set Background
    PFP_P3.background = PFP_P3:CreateTexture()
    PFP_P3.background:SetAllPoints(PFP_P3)
    PFP_P3.background:SetTexture([[Interface\RaidFrame\Raid-Bar-Hp-Bg]])
    PFP_P3.background:SetDrawLayer("BACKGROUND", -1)
    PFP_P3.background:SetTexCoord(0, 1, 0, 0.53125)

    -- Set Border
    PFP_P3.border = PFP_P3:CreateTexture()
    PFP_P3.border:SetAllPoints(PFP_P3)
    PFP_P3.border:SetTexture([[Interface\RaidFrame\Raid-FrameHighlights]])
    PFP_P3.border:SetTexCoord(0.00781250, 0.55468750, 0.28906250, 0.55468750)
    PFP_P3.border:SetDrawLayer("ARTWORK", 7)
    PFP_P3.border:Hide()

    -- Set MinMax Values
    PFP_P3:SetMinMaxValues(0, UnitHealthMax("partypet3"))

    -- Create Button for Pet Healthbar
    PFP_P3Button = CreateFrame("Button", "CPFPets_PlayerPetButton", PFP_P3, "SecureUnitButtonTemplate")

    -- Set Button Position
    PFP_P3Button:SetPoint("CENTER")
    PFP_P3Button:SetSize(130, 30)

    -- Set Button Attribute
    PFP_P3Button:SetAttribute("unit", "partypet3")

    -- Register Button and Click Events
    RegisterUnitWatch(PFP_P3Button)
    PFP_P3Button:RegisterForClicks("AnyUp")

    -- Register Clicks
    PFP_P3Button:SetAttribute("*type1", "target") -- Target unit on left click
    PFP_P3Button:SetAttribute("*type2", "togglemenu") -- Toggle units menu on left click
    PFP_P3Button:SetAttribute("*type3", "assist") -- On middle click, target the target of the clicked unit

    -- Register Events
    PFP_P3:RegisterEvent("UNIT_HEALTH")
    PFP_P3:RegisterEvent("UNIT_MAXHEALTH")
    PFP_P3:RegisterEvent("PLAYER_TARGET_CHANGED")

    PFP_P3:HookScript("OnEvent", function(self, event)
        if event == "PLAYER_TARGET_CHANGED" then
            PFP:ShowBorder(PFP_P3, "partypet3")
        else
            PFP:UpdateHealth(PFP_P3, "partypet3")
            PFP_P3:SetMinMaxValues(0, UnitHealthMax("partypet3"))
        end
    end)
end