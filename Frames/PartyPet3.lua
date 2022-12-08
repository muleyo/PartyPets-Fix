local PFP_PartyPet3 = PFP:NewModule("PFP_PartyPet3")

function PFP_PartyPet3:OnEnable()
    -- Create Pet HealthBar
    PFP_P3 = CreateFrame("StatusBar", "PFP_P3", UIParent)

    -- Set Frame Size
    PFP_P3:SetSize(129, 20)

    -- Create FontString for Pet Name
    PFP_P3.name = PFP_P3:CreateFontString(nil)
    PFP_P3.name:SetFont(STANDARD_TEXT_FONT, 10, "")
    PFP_P3.name:SetPoint("LEFT", PFP_P3, "LEFT", 5, 0)
    PFP_P3.name:SetShadowOffset(1,-1)

    -- Set Background
    PFP_P3.background = PFP_P3:CreateTexture()
    PFP_P3.background:SetTexture([[Interface\RaidFrame\Raid-Bar-Hp-Bg]])

    -- Set Bar Texture & Color
    PFP_P3:SetStatusBarTexture([[Interface\RaidFrame\Raid-Bar-Hp-Fill]])
    PFP_P3:SetStatusBarColor(0, 1, 0)

    -- Set MinMax Values
    PFP_P3:SetMinMaxValues(0, UnitHealthMax("partypet3"))

    -- Create Button for Pet Healthbar
    PFP_P3Button = CreateFrame("Button", "CPFPets_PlayerPetButton", PFP_P3, "SecureUnitButtonTemplate")

    -- Set Button Position
    PFP_P3Button:SetPoint("CENTER")
    PFP_P3Button:SetSize(129, 20)

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

    PFP_P3:HookScript("OnEvent", function()
        PFP:UpdateHealth(PFP_P3, "partypet3")
        PFP_P3:SetMinMaxValues(0, UnitHealthMax("partypet3"))
    end)
end