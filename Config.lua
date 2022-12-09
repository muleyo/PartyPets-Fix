local PFP_Config = PFP:NewModule('PFP_Config')

function PFP_Config:OnInitialize()

    local function DisableAddon()
        PFP:OnEvent()
        print("" .. "|cff2f80faPartyframe Pets: |r" .. "Addon disabled.")
    end

    local function EnableAddon()
        PFP:OnEvent()
        print("" .. "|cff2f80faPartyframe Pets: |r" .. "Addon enabled.")
    end

    local options = {
        type = 'group',
        args = {
            enable = {
            name = 'Enable',
            desc = 'Enables / disables the addon',
            type = 'toggle',
            set = function(_, status)
                if status then
                    EnableAddon()
                else
                    DisableAddon()
                end
            end
            },
            moreoptions={
                name = 'General',
                type = 'group',
                childGroups = "tab",
                args={
                    generalHeader = {
                        type = 'header',
                        name = 'Width & Position',
                        order = 1
                    },
                    width = {
                        type = 'range',
                        order = 2,
                        name = 'Width',
                        desc = 'Adjust the Frame width',
                        width = 'full',
                        min = 72,
                        max = 300,
                        step = 0.1,
                        set = function(_, width)
                            print(width)
                        end
                    },
                    position = {
                        type = 'range',
                        order = 3,
                        name = 'Position',
                        desc = 'Adjust the Frame Position',
                        width = 'full',
                        min = 72,
                        max = 300,
                        step = 0.1,
                        set = function(_, width)
                            print(width)
                        end
                    },
                    textureHeader = {
                        type = 'header',
                        name = 'Textures',
                        order = 4
                    },
                    texture = {
                        type = 'select',
                        order = 5,
                        name = 'Set Texture',
                        desc = 'Change the Pet HP-Bar texture if you want to',
                        width = 'full',
                        values = {1, 2, 3, 4},
                        style = 'dropdown',
                        set = function(_, texture)
                            print(texture)
                        end
                    },
                    profileHeader = {
                        type = 'header',
                        name = 'Profile',
                        order = 6
                    },
                    profile = {
                        type = 'select',
                        order = 7,
                        name = 'Change Profile',
                        desc = 'Change your profile',
                        width = 'full',
                        values = {1, 2, 3, 4},
                        style = 'dropdown',
                        set = function(_, profile)
                            print(profile)
                        end
                    },
                }
            }
        }
    }

    LibStub('AceConfig-3.0'):RegisterOptionsTable('Partyframe Pet Fix', options)
    local PFP_Config = LibStub('AceConfigDialog-3.0'):AddToBlizOptions('Partyframe Pet Fix')

    function SlashCommand(msg)
        if msg == '' then
            InterfaceOptionsFrame_OpenToCategory(PFP_Config)
        end

        if msg == 'enable' or msg == 'Enable' or msg == 'ENABLE' then
            EnableAddon()
        elseif msg == 'e' or msg == 'E' then
            EnableAddon()
        end

        if msg == 'disable' or msg == 'Disable' or msg == 'DISABLE' then
            DisableAddon()
        elseif msg == 'd' or msg == 'D' then
            DisableAddon()
        end
    end

    PFP:RegisterChatCommand('pfp', SlashCommand)
end