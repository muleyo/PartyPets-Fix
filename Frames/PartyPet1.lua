local PFP_PartyPet1 = PFP:NewModule("PFP_PartyPet1")

function PFP_PartyPet1:OnEnable()
    -- Create Pet HealthBar
    PFP_P1 = CreateFrame("StatusBar", "PFP_P1", UIParent)

    -- Set Frame Size
    PFP_P1:SetSize(PFP_DB.width, 30)

    -- Create FontString for Pet Name
    PFP_P1.name = PFP_P1:CreateFontString(nil)
    PFP_P1.name:SetFont(STANDARD_TEXT_FONT, 10, "")
    PFP_P1.name:SetPoint("LEFT", PFP_P1, "LEFT", 5, 0)
    PFP_P1.name:SetShadowOffset(1,-1)

    -- Set Bar Texture & Color
    PFP_P1:SetStatusBarTexture([[Interface\RaidFrame\Raid-Bar-Hp-Fill]])
    PFP_P1:GetStatusBarTexture():SetDrawLayer("ARTWORK", 5)
    PFP_P1:SetStatusBarColor(0, 1, 0)

    -- Set Background
    PFP_P1.background = PFP_P1:CreateTexture()
    PFP_P1.background:SetAllPoints(PFP_P1)
    PFP_P1.background:SetTexture([[Interface\RaidFrame\Raid-Bar-Hp-Bg]])
    PFP_P1.background:SetDrawLayer("BACKGROUND", -1)
    PFP_P1.background:SetTexCoord(0, 1, 0, 0.53125)

    -- Set Border
    PFP_P1.border = PFP_P1:CreateTexture()
    PFP_P1.border:SetAllPoints(PFP_P1)
    PFP_P1.border:SetTexture([[Interface\RaidFrame\Raid-FrameHighlights]])
    PFP_P1.border:SetTexCoord(0.00781250, 0.55468750, 0.28906250, 0.55468750)
    PFP_P1.border:SetDrawLayer("ARTWORK", 7)
    PFP_P1.border:Hide()

    -- Set MinMax Values
    PFP_P1:SetMinMaxValues(0, UnitHealthMax("partypet1"))

    -- Create Button for Pet Healthbar
    PFP_P1Button = CreateFrame("Button", "CPFPets_PlayerPetButton", PFP_P1, "SecureUnitButtonTemplate")

    -- Set Button Position
    PFP_P1Button:SetPoint("CENTER")
    PFP_P1Button:SetSize(PFP_DB.width, 30)

    -- Set Button Attribute
    PFP_P1Button:SetAttribute("unit", "partypet1")

    -- Register Button and Click Events
    RegisterUnitWatch(PFP_P1Button)
    PFP_P1Button:RegisterForClicks("AnyUp")

    -- Register Clicks
    PFP_P1Button:SetAttribute("*type1", "target") -- Target unit on left click
    PFP_P1Button:SetAttribute("*type2", "togglemenu") -- Toggle units menu on left click
    PFP_P1Button:SetAttribute("*type3", "assist") -- On middle click, target the target of the clicked unit

    -- Register Events
    PFP_P1:RegisterEvent("UNIT_HEALTH")
    PFP_P1:RegisterEvent("UNIT_MAXHEALTH")
    PFP_P1:RegisterEvent("PLAYER_TARGET_CHANGED")

    PFP_P1:HookScript("OnEvent", function(self, event)
        if event == "PLAYER_TARGET_CHANGED" then
            PFP:ShowBorder(PFP_P1, "partypet1")
        else
            PFP:UpdateHealth(PFP_P1, "partypet1")
            PFP_P1:SetMinMaxValues(0, UnitHealthMax("partypet1"))
        end
    end)
end