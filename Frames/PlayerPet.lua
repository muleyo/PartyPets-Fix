local PFP_PetPet = PFP:NewModule("PFP_PetPet")

function PFP_PetPet:OnEnable()
    -- Create Pet HealthBar
    PFP_Pet = CreateFrame("StatusBar", "PFP_Pet", UIParent)

    -- Set Frame Position & Size 
    PFP_Pet:SetSize(129, 20)

    -- Create FontString for Pet Name
    PFP_Pet.name = PFP_Pet:CreateFontString(nil)
    PFP_Pet.name:SetFont(STANDARD_TEXT_FONT, 10, "")
    PFP_Pet.name:SetPoint("LEFT", PFP_Pet, "LEFT", 5, 0)
    PFP_Pet.name:SetShadowOffset(1, -1)

    -- Set Background
    PFP_Pet.background = PFP_Pet:CreateTexture()
    PFP_Pet.background:SetAllPoints(PFP_Pet)
    PFP_Pet.background:SetTexture([[Interface\RaidFrame\Raid-Bar-Hp-Bg]])
    PFP_Pet.background:SetTexCoord(0, 1, 0, 0.53125)

    -- Set Bar Texture & Color
    PFP_Pet:SetStatusBarTexture([[Interface\RaidFrame\Raid-Bar-Hp-Fill]])
    PFP_Pet:SetStatusBarColor(0, 1, 0)

    -- Set MinMax Values
    PFP_Pet:SetMinMaxValues(0, UnitHealthMax("pet"))

    -- Create Button for Pet Healthbar
    PFP_PetButton = CreateFrame("Button", "PFP_PetButton", PFP_Pet, "SecureUnitButtonTemplate")

    -- Set Button Position
    PFP_PetButton:SetPoint("CENTER")
    PFP_PetButton:SetSize(129, 20)

    -- Set Button Attribute
    PFP_PetButton:SetAttribute("unit", "pet")

    -- Register Button and Click Events
    RegisterUnitWatch(PFP_PetButton)
    PFP_PetButton:RegisterForClicks("AnyUp")

    -- Register Clicks
    PFP_PetButton:SetAttribute("*type1", "target") -- Target unit on left click
    PFP_PetButton:SetAttribute("*type2", "togglemenu") -- Toggle units menu on left click
    PFP_PetButton:SetAttribute("*type3", "assist") -- On middle click, target the target of the clicked unit

    -- Register Events
    PFP_Pet:RegisterEvent("UNIT_HEALTH")
    PFP_Pet:RegisterEvent("UNIT_MAXHEALTH")

    PFP_Pet:HookScript("OnEvent", function()
        PFP:UpdateHealth(PFP_Pet, "pet")
        PFP_Pet:SetMinMaxValues(0, UnitHealthMax("pet"))
    end)
end