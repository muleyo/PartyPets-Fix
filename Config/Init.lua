PFP = LibStub("AceAddon-3.0"):NewAddon("PFP", "AceEvent-3.0", "AceConsole-3.0")

function PFP:OnInitialize()
    -- Database Default profile
    local defaults = {
        profile = {
          width = 72,
          position = -55,
          texture = [[Interface\Default]],
          enabled = true
        }
    }

    -- Register Database
    self.db = LibStub("AceDB-3.0"):New("PFPDB", defaults, true)

    -- Assign DB to a global variable
    PFP_DB = self.db.profile
end