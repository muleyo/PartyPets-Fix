local PFP_PartyPet2 = PFP:NewModule("PFP_PartyPet2")

function PFP_PartyPet2:OnEnable()
    -- Create Pet HealthBar
    PFP_P2 = CreateFrame("StatusBar", "PFP_P2", UIParent)

    -- Set Frame Size
    PFP_P2:SetSize(130, 30)

    -- Create FontString for Pet Name
    PFP_P2.name = PFP_P2:CreateFontString(nil)
    PFP_P2.name:SetFont(STANDARD_TEXT_FONT, 10, "")
    PFP_P2.name:SetPoint("LEFT", PFP_P2, "LEFT", 5, 0)
    PFP_P2.name:SetShadowOffset(1,-1)

    -- Set Bar Texture & Color
    PFP_P2:SetStatusBarTexture([[Interface\RaidFrame\Raid-Bar-Hp-Fill]])
    PFP_P2:GetStatusBarTexture():SetDrawLayer("ARTWORK", 5)
    PFP_P2:SetStatusBarColor(0, 1, 0)

    -- Set Background
    PFP_P2.background = PFP_P2:CreateTexture()
    PFP_P2.background:SetAllPoints(PFP_P2)
    PFP_P2.background:SetTexture([[Interface\RaidFrame\Raid-Bar-Hp-Bg]])
    PFP_P2.background:SetDrawLayer("BACKGROUND", -1)
    PFP_P2.background:SetTexCoord(0, 1, 0, 0.53125)

    -- Set Border
    PFP_P2.border = PFP_P2:CreateTexture()
    PFP_P2.border:SetAllPoints(PFP_P2)
    PFP_P2.border:SetTexture([[Interface\RaidFrame\Raid-FrameHighlights]])
    PFP_P2.border:SetTexCoord(0.00781250, 0.55468750, 0.28906250, 0.55468750)
    PFP_P2.border:SetDrawLayer("ARTWORK", 7)
    PFP_P2.border:Hide()

    -- Set MinMax Values
    PFP_P2:SetMinMaxValues(0, UnitHealthMax("partypet2"))

    -- Create Button for Pet Healthbar
    PFP_P2Button = CreateFrame("Button", "CPFPets_PlayerPetButton", PFP_P2, "SecureUnitButtonTemplate")

    -- Set Button Position
    PFP_P2Button:SetPoint("CENTER")
    PFP_P2Button:SetSize(130, 30)

    -- Set Button Attribute
    PFP_P2Button:SetAttribute("unit", "partypet2")

    -- Register Button and Click Events
    RegisterUnitWatch(PFP_P2Button)
    PFP_P2Button:RegisterForClicks("AnyUp")

    -- Register Clicks
    PFP_P2Button:SetAttribute("*type1", "target") -- Target unit on left click
    PFP_P2Button:SetAttribute("*type2", "togglemenu") -- Toggle units menu on left click
    PFP_P2Button:SetAttribute("*type3", "assist") -- On middle click, target the target of the clicked unit

    -- Register Events
    PFP_P2:RegisterEvent("UNIT_HEALTH")
    PFP_P2:RegisterEvent("UNIT_MAXHEALTH")
    PFP_P2:RegisterEvent("PLAYER_TARGET_CHANGED")

    PFP_P2:HookScript("OnEvent", function(self, event)
        if event == "PLAYER_TARGET_CHANGED" then
            PFP:ShowBorder(PFP_P2, "partypet2")
        else
            PFP:UpdateHealth(PFP_P2, "partypet2")
            PFP_P2:SetMinMaxValues(0, UnitHealthMax("partypet2"))
        end
    end)
end