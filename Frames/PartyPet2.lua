local PFP_PartyPet2 = PFP:NewModule("PFP_PartyPet2")

function PFP_PartyPet2:OnEnable()
    function PFP:CreatePartyPet2()
        -- Create Pet HealthBar
        CPFPets_PartyPet2 = CreateFrame("StatusBar", "CPFPets_PartyPet2", UIParent)

        -- Set Frame Size
        CPFPets_PartyPet2:SetSize(129, 20)

        -- Create FontString for Pet Name
        CPFPets_PartyPet2.name = CPFPets_PartyPet2:CreateFontString(nil)
        CPFPets_PartyPet2.name:SetFont(STANDARD_TEXT_FONT, 10, "")
        CPFPets_PartyPet2.name:SetPoint("LEFT", CPFPets_PartyPet2, "LEFT", 5, 0)
        CPFPets_PartyPet2.name:SetShadowOffset(1,-1)

        -- Set Background
        CPFPets_PartyPet2.background = CPFPets_PartyPet2:CreateTexture()
        CPFPets_PartyPet2.background:SetTexture([[Interface\RaidFrame\Raid-Bar-Hp-Bg]])

        -- Set Bar Texture & Color
        CPFPets_PartyPet2:SetStatusBarTexture([[Interface\RaidFrame\Raid-Bar-Hp-Fill]])
        CPFPets_PartyPet2:SetStatusBarColor(0, 1, 0)

        -- Set MinMax Values
        CPFPets_PartyPet2:SetMinMaxValues(0, UnitHealthMax("partypet2"))

        -- Create Button for Pet Healthbar
        CPFPets_PartyPet2Button = CreateFrame("Button", "CPFPets_PlayerPetButton", CPFPets_PartyPet2, "SecureUnitButtonTemplate")

        -- Set Button Position
        CPFPets_PartyPet2Button:SetPoint("CENTER")
        CPFPets_PartyPet2Button:SetSize(129, 20)

        -- Set Button Attribute
        CPFPets_PartyPet2Button:SetAttribute("unit", "partypet2")

        -- Register Button and Click Events
        RegisterUnitWatch(CPFPets_PartyPet2Button)
        CPFPets_PartyPet2Button:RegisterForClicks("AnyUp")

        -- Register Clicks
        CPFPets_PartyPet2Button:SetAttribute("*type1", "target") -- Target unit on left click
        CPFPets_PartyPet2Button:SetAttribute("*type2", "togglemenu") -- Toggle units menu on left click
        CPFPets_PartyPet2Button:SetAttribute("*type3", "assist") -- On middle click, target the target of the clicked unit

        -- Register Events
        CPFPets_PartyPet2:RegisterEvent("UNIT_PET")
        CPFPets_PartyPet2:RegisterEvent("UNIT_HEALTH")
        CPFPets_PartyPet2:RegisterEvent("UNIT_MAXHEALTH", CPFPets_PartyPet2:SetMinMaxValues(0, UnitHealthMax("partypet2")))
        CPFPets_PartyPet2:RegisterEvent("PLAYER_ENTERING_WORLD")
        CPFPets_PartyPet2:RegisterEvent("PLAYER_LEAVING_WORLD")
        CPFPets_PartyPet2:RegisterEvent("UNIT_CONNECTION")
        CPFPets_PartyPet2:RegisterEvent("GROUP_ROSTER_UPDATE")
    end
end