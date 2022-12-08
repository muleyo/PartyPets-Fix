PFP = LibStub("AceAddon-3.0"):NewAddon("PFP", "AceEvent-3.0")

function PFP:OnInitialize()
    self:RegisterEvent("GROUP_ROSTER_UPDATE", "OnEvent")
    self:RegisterEvent("PLAYER_ENTERING_WORLD", "OnEvent")
    self:RegisterEvent("PLAYER_LOGIN", "OnEvent")
    self:RegisterEvent("UNIT_PET", "OnEvent")
end

function PFP:OnEvent()
    if (IsInParty() and GetNumGroupMembers() > 1) and not IsInRaid() then
        if UnitExists("pet") then
            local anchor = _G["CompactPartyFrameMember" .. GetNumGroupMembers()]
            PFP_Pet:SetPoint("LEFT", anchor, "LEFT", 1, -50)
            PFP_Pet.name:SetText(UnitName("pet"))

            -- Show frames if they got hidden earlier
            PFP_Pet:Show()
            PFP_PetButton:Show()
        elseif PFP_Pet and not UnitExists("pet") then
            PFP_Pet:Hide()
            PFP_PetButton:Hide()
        end

        if UnitExists("partypet1") then
            -- Set Position
            if PFP_Pet:IsShown() then
                PFP_P1:SetPoint("LEFT", PFP_Pet, "LEFT", 1, -50)
            else
                PFP_P1:SetPoint("LEFT", _G["CompactPartyFrameMember" .. GetNumGroupMembers()], "LEFT", 1, -50)
            end

            -- Set Name
            PFP_P1.name:SetText(UnitName("partypet1"))

            -- Show frames if they got hidden earlier
            PFP_P1:Show()
            PFP_P1Button:Show()
        elseif PFP_P1 and not UnitExists("partypet1") then
            PFP_P1:Hide()
            PFP_P1Button:Hide()
        end

        if UnitExists("partypet2") then
            -- Set Position
            if PFP_P2:IsShown() then
                PFP_P2:SetPoint("LEFT", PFP_P1, "LEFT", 1, -50)
            elseif PFP_Pet:IsShown() then
                PFP_P2:SetPoint("LEFT", PFP_Pet, "LEFT", 1, -50)
            else
                PFP_P2:SetPoint("LEFT", _G["CompactPartyFrameMember" .. GetNumGroupMembers()], "LEFT", 1, -50)
            end

            -- Set Name
            PFP_P2.name:SetText(UnitName("partypet1"))

            -- Show frames if they got hidden earlier
            PFP_P2:Show()
            PFP_P2Button:Show()
        elseif PFP_P1 and not UnitExists("partypet1") then
            PFP_P2:Hide()
            PFP_P2Button:Hide()
        end

        if UnitExists("partypet3") then
            -- Set Position
            if PFP_P2:IsShown() then
                PFP_P3:SetPoint("LEFT", PFP_P2, "LEFT", 1, -50)
            elseif PFP_P2:IsShown() then
                PFP_P3:SetPoint("LEFT", PFP_P1, "LEFT", 1, -50)
            elseif PFP_Pet:IsShown() then
                PFP_P3:SetPoint("LEFT", PFP_Pet, "LEFT", 1, -50)
            else
                PFP_P3:SetPoint("LEFT", _G["CompactPartyFrameMember" .. GetNumGroupMembers()], "LEFT", 1, -50)
            end

            -- Set Name
            PFP_P3.name:SetText(UnitName("partypet1"))

            -- Show frames if they got hidden earlier
            PFP_P3:Show()
            PFP_P3Button:Show()
        elseif PFP_P1 and not UnitExists("partypet1") then
            PFP_P3:Hide()
            PFP_P3Button:Hide()
        end

        if UnitExists("partypet4") then
            -- Set Position
            if PFP_P3:IsShown() then
                PFP_P4:SetPoint("LEFT", PFP_P3, "LEFT", 1, -50)
            elseif PFP_P2:IsShown() then
                PFP_P4:SetPoint("LEFT", PFP_P2, "LEFT", 1, -50)
            elseif PFP_P2:IsShown() then
                PFP_P4:SetPoint("LEFT", PFP_P1, "LEFT", 1, -50)
            elseif PFP_Pet:IsShown() then
                PFP_P4:SetPoint("LEFT", PFP_Pet, "LEFT", 1, -50)
            else
                PFP_P4:SetPoint("LEFT", _G["CompactPartyFrameMember" .. GetNumGroupMembers()], "LEFT", 1, -50)
            end

            -- Set Name
            PFP_P4.name:SetText(UnitName("partypet1"))

            -- Show frames if they got hidden earlier
            PFP_P4:Show()
            PFP_P4Button:Show()
        elseif PFP_P1 and not UnitExists("partypet1") then
            PFP_P4:Hide()
            PFP_P4Button:Hide()
        end
    end
end

function PFP:UpdateHealth(frame, unit)
    frame:SetValue(UnitHealth(unit))
end

function IsInParty()
    if GetNumGroupMembers() > 0 then
        return true
    end
end