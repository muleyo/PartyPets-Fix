local PFP_PartyPet4 = PFP:NewModule("PFP_PartyPet4")

function PFP_PartyPet4:OnEnable()
    function PFP:CreatePartyPet4()
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
    end
end