PFP_Core = PFP:NewModule("PFP_Core")

function PFP_Core:OnEnable()
    function PFP:OnEvent()
        if InCombatLockdown() then return end
        if PFP_Disabled() then
            PFP_Pet:Hide()
            PFP_PetButton:Hide()

            PFP_P1:Hide()
            PFP_P1Button:Hide()

            PFP_P2:Hide()
            PFP_P2Button:Hide()

            PFP_P3:Hide()
            PFP_P3Button:Hide()

            PFP_P4:Hide()
            PFP_P4Button:Hide()
        elseif (IsInParty()) and not IsInRaid() then
            if UnitExists("pet") then
                local anchor = _G["CompactPartyFrameMember" .. GetNumGroupMembers()]
                PFP_Pet:SetPoint("LEFT", anchor, "LEFT", 0, PFP_DB.position)
                PFP_Pet.name:SetText(UnitName("pet"))

                -- Show frames if they got hidden earlier
                PFP_Pet:Show()
                PFP_PetButton:Show()
            elseif PFP_Pet:IsShown() and not UnitExists("pet") then
                PFP_Pet:Hide()
                PFP_PetButton:Hide()
            end

            if UnitExists("partypet1") then
                -- Set Position
                if UnitExists("pet") then
                    PFP_P1:SetPoint("LEFT", PFP_Pet, "LEFT", 0, -30.5)
                else
                    PFP_P1:SetPoint("LEFT", _G["CompactPartyFrameMember" .. GetNumGroupMembers()], "LEFT", 0, PFP_DB.position)
                end

                -- Set Name
                PFP_P1.name:SetText(UnitName("partypet1"))

                -- Show frames if they got hidden earlier
                PFP_P1:Show()
                PFP_P1Button:Show()
            elseif PFP_P1:IsShown() and not UnitExists("partypet1") then
                PFP_P1:Hide()
                PFP_P1Button:Hide()
            end

            if UnitExists("partypet2") then
                -- Set Position
                if UnitExists("partypet1") then
                    PFP_P2:SetPoint("LEFT", PFP_P1, "LEFT", 0, -30.5)
                elseif UnitExists("pet") then
                    PFP_P2:SetPoint("LEFT", PFP_Pet, "LEFT", 0, -30.5)
                else
                    PFP_P2:SetPoint("LEFT", _G["CompactPartyFrameMember" .. GetNumGroupMembers()], "LEFT", 0, PFP_DB.position)
                end

                -- Set Name
                PFP_P2.name:SetText(UnitName("partypet2"))

                -- Show frames if they got hidden earlier
                PFP_P2:Show()
                PFP_P2Button:Show()
            elseif PFP_P2:IsShown() and not UnitExists("partypet2") then
                PFP_P2:Hide()
                PFP_P2Button:Hide()
            end

            if UnitExists("partypet3") then
                -- Set Position
                if UnitExists("partypet2") then
                    PFP_P3:SetPoint("LEFT", PFP_P2, "LEFT", 0, -30.5)
                elseif UnitExists("partypet1") then
                    PFP_P3:SetPoint("LEFT", PFP_P1, "LEFT", 0, -30.5)
                elseif UnitExists("pet") then
                    PFP_P3:SetPoint("LEFT", PFP_Pet, "LEFT", 0, -30.5)
                else
                    PFP_P3:SetPoint("LEFT", _G["CompactPartyFrameMember" .. GetNumGroupMembers()], "LEFT", 0, PFP_DB.position)
                end

                -- Set Name
                PFP_P3.name:SetText(UnitName("partypet3"))

                -- Show frames if they got hidden earlier
                PFP_P3:Show()
                PFP_P3Button:Show()
            elseif PFP_P3:IsShown() and not UnitExists("partypet3") then
                PFP_P3:Hide()
                PFP_P3Button:Hide()
            end

            if UnitExists("partypet4") then
                -- Set Position
                if UnitExists("partypet3") then
                    PFP_P4:SetPoint("LEFT", PFP_P3, "LEFT", 0, -30.5)
                elseif UnitExists("partypet2") then
                    PFP_P4:SetPoint("LEFT", PFP_P2, "LEFT", 0, -30.5)
                elseif UnitExists("partypet1") then
                    PFP_P4:SetPoint("LEFT", PFP_P1, "LEFT", 0, -30.5)
                elseif UnitExists("pet") then
                    PFP_P4:SetPoint("LEFT", PFP_Pet, "LEFT", 0, -30.5)
                else
                    PFP_P4:SetPoint("LEFT", _G["CompactPartyFrameMember" .. GetNumGroupMembers()], "LEFT", 0, PFP_DB.position)
                end

                -- Set Name
                PFP_P4.name:SetText(UnitName("partypet4"))

                -- Show frames if they got hidden earlier
                PFP_P4:Show()
                PFP_P4Button:Show()
            elseif PFP_P4:IsShown() and not UnitExists("partypet4") then
                PFP_P4:Hide()
                PFP_P4Button:Hide()
            end
        else
            PFP_Pet:Hide()
            PFP_PetButton:Hide()

            PFP_P1:Hide()
            PFP_P1Button:Hide()

            PFP_P2:Hide()
            PFP_P2Button:Hide()

            PFP_P3:Hide()
            PFP_P3Button:Hide()

            PFP_P4:Hide()
            PFP_P4Button:Hide()
        end
    end

    -- Create Border

    function PFP:ShowBorder(frame, unit)
        if UnitIsUnit("target", unit) then
            frame.border:Show()
        else
            frame.border:Hide()
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

    function PFP_Disabled()
        if PFP_DB.enabled then
            return false
        else
            return true
        end
    end

    -- Register Events
    PFP:RegisterEvent("GROUP_ROSTER_UPDATE", "OnEvent")
    PFP:RegisterEvent("PLAYER_ENTERING_WORLD", "OnEvent")
    PFP:RegisterEvent("PLAYER_LOGIN", "OnEvent")
    PFP:RegisterEvent("UNIT_CONNECTION", "OnEvent")
    PFP:RegisterEvent("PLAYER_REGEN_ENABLED", "OnEvent")

    -- Small Delay to dodge errors
    C_Timer.After(0.5, function()
        PFP:RegisterEvent("UNIT_PET", "OnEvent")
    end)
end