local PFP_PartyPet2 = PFP:NewModule("PFP_PartyPet2")

function PFP_PartyPet2:OnEnable()
    -- Create Pet HealthBar
    PFP_P2 = CreateFrame("StatusBar", "PFP_P2", UIParent)

    -- Set Frame Size
    PFP_P2:SetSize(129, 20)

    -- Create FontString for Pet Name
    PFP_P2.name = PFP_P2:CreateFontString(nil)
    PFP_P2.name:SetFont(STANDARD_TEXT_FONT, 10, "")
    PFP_P2.name:SetPoint("LEFT", PFP_P2, "LEFT", 5, 0)
    PFP_P2.name:SetShadowOffset(1,-1)

    -- Set Background
    PFP_P2.background = PFP_P2:CreateTexture()
    PFP_P2.background:SetTexture([[Interface\RaidFrame\Raid-Bar-Hp-Bg]])

    -- Set Bar Texture & Color
    PFP_P2:SetStatusBarTexture([[Interface\RaidFrame\Raid-Bar-Hp-Fill]])
    PFP_P2:SetStatusBarColor(0, 1, 0)

    -- Set MinMax Values
    PFP_P2:SetMinMaxValues(0, UnitHealthMax("partypet2"))

    -- Create Button for Pet Healthbar
    PFP_P2Button = CreateFrame("Button", "CPFPets_PlayerPetButton", PFP_P2, "SecureUnitButtonTemplate")

    -- Set Button Position
    PFP_P2Button:SetPoint("CENTER")
    PFP_P2Button:SetSize(129, 20)

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

    PFP_P2:HookScript("OnEvent", function()
        PFP:UpdateHealth(PFP_P2, "partypet2")
        PFP_P2:SetMinMaxValues(0, UnitHealthMax("partypet2"))
    end)
end