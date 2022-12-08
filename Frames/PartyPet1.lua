local PFP_PartyPet1 = PFP:NewModule("PFP_PartyPet1")

function PFP_PartyPet1:OnEnable()
    function PFP:CreatePartyPet1()
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
    end
end