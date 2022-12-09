local PFP_Config = PFP:NewModule("PFP_Config")

function PFP_Config:OnInitialize()

    local options = {
        type = "group",
        args = {
          enable = {
            name = "Enable",
            desc = "Enables / disables the addon",
            type = "toggle",

          },
          moreoptions={
            name = "General",
            type = "group",
            args={
            }
          }
        }
      }

    LibStub("AceConfig-3.0"):RegisterOptionsTable("AddonName", options)
    local OptFrame = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("AddonName")

    function SlashCommand()
        InterfaceOptionsFrame_OpenToCategory(OptFrame)
    end

    PFP:RegisterChatCommand("pfp", SlashCommand)
end