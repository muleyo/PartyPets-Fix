local PFP_PartyPet3 = PFP:NewModule("PFP_PartyPet3")

function PFP_PartyPet3:OnEnable()
    function PFP:CreatePartyPet3()
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
    end
end