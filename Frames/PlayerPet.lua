local PFP_PlayerPet = PFP:NewModule("PFP_PlayerPet")

function PFP_PlayerPet:OnEnable()
    function PFP:CreatePlayerPet()
        -- Create Pet HealthBar
        CPFPets_PlayerPet = CreateFrame("StatusBar", "CPFPets_PlayerPet", UIParent)

        -- Set Frame Position & Size 
        CPFPets_PlayerPet:SetPoint("LEFT", CompactPartyFrame, "LEFT", 1, -50)
        CPFPets_PlayerPet:SetSize(129, 20)

        -- Create FontString for Pet Name
        CPFPets_PlayerPet.name = CPFPets_PlayerPet:CreateFontString(nil)
        CPFPets_PlayerPet.name:SetFont(STANDARD_TEXT_FONT, 10, "")
        CPFPets_PlayerPet.name:SetPoint("LEFT", CPFPets_PlayerPet, "LEFT", 5, 0)
        CPFPets_PlayerPet.name:SetShadowOffset(1, -1)
        CPFPets_PlayerPet.name:SetText(UnitName("pet"))

        -- Set Background
        CPFPets_PlayerPet.background = CPFPets_PlayerPet:CreateTexture()
        CPFPets_PlayerPet.background:SetAllPoints(CPFPets_PlayerPet)
        CPFPets_PlayerPet.background:SetTexture([[Interface\RaidFrame\Raid-Bar-Hp-Bg]])
        CPFPets_PlayerPet.background:SetTexCoord(0, 1, 0, 0.53125)

        -- Set Bar Texture & Color
        CPFPets_PlayerPet:SetStatusBarTexture([[Interface\RaidFrame\Raid-Bar-Hp-Fill]])
        CPFPets_PlayerPet:SetStatusBarColor(0, 1, 0)

        -- Set MinMax Values
        CPFPets_PlayerPet:SetMinMaxValues(0, UnitHealthMax("pet"))

        -- Create Button for Pet Healthbar
        CPFPets_PlayerPetButton = CreateFrame("Button", "CPFPets_PlayerPetButton", CPFPets_PlayerPet, "SecureUnitButtonTemplate")

        -- Set Button Position
        CPFPets_PlayerPetButton:SetPoint("CENTER")
        CPFPets_PlayerPetButton:SetSize(129, 20)

        -- Set Button Attribute
        CPFPets_PlayerPetButton:SetAttribute("unit", "pet")

        -- Register Button and Click Events
        RegisterUnitWatch(CPFPets_PlayerPetButton)
        CPFPets_PlayerPetButton:RegisterForClicks("AnyUp")

        -- Register Clicks
        CPFPets_PlayerPetButton:SetAttribute("*type1", "target") -- Target unit on left click
        CPFPets_PlayerPetButton:SetAttribute("*type2", "togglemenu") -- Toggle units menu on left click
        CPFPets_PlayerPetButton:SetAttribute("*type3", "assist") -- On middle click, target the target of the clicked unit

        -- Register Events
        CPFPets_PlayerPet:RegisterEvent("UNIT_PET")
        CPFPets_PlayerPet:RegisterEvent("UNIT_HEALTH")
        CPFPets_PlayerPet:RegisterEvent("UNIT_MAXHEALTH", CPFPets_PlayerPet:SetMinMaxValues(0, UnitHealthMax("pet")))
        CPFPets_PlayerPet:RegisterEvent("PLAYER_LOGIN")
        CPFPets_PlayerPet:RegisterEvent("PLAYER_ENTERING_WORLD")
        CPFPets_PlayerPet:RegisterEvent("GROUP_ROSTER_UPDATE")
    end
end