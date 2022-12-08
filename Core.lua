PFP = LibStub("AceAddon-3.0"):NewAddon("PFP", "AceEvent-3.0")

function PFP:OnInitialize()
    self:RegisterEvent("GROUP_ROSTER_UPDATE", "OnEvent")
    self:RegisterEvent("PLAYER_ENTERING_WORLD", "OnEvent")
    self:RegisterEvent("PLAYER_LOGIN", "OnEvent")
end

function PFP:OnEvent()
    if IsInParty() then
        if UnitExists("pet") then
            PFP:CreatePlayerPet()
        end
    end
end

-- Update Pet HealthBar
function CPFPets_UpdateHealth(self, pet)
    if UnitExists(pet) then
        self:SetValue(UnitHealth(pet))
    end
end

function IsInParty()
    if GetNumGroupMembers() > 0 then
        return true
    end
end