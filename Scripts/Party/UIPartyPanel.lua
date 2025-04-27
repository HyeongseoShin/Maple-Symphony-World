unpackedContents = {
	uniqueIdentifier = "2f450019d3294e5db278ed8ac38b18a6",
	bundleIdentifier = "2c89a498317848aab9fe46cd70bf74bb",
	category = "codeblock",
	entryId = "af3e1c37-4dcb-4a84-896d-215326bc0285",
	contents = {
		CoreVersion = {
			Major = 0,
			Minor = 2
		},
		ScriptVersion = {
			Major = 1,
			Minor = 0
		},
		Description = "",
		Id = "af3e1c37-4dcb-4a84-896d-215326bc0285",
		Language = 1,
		Name = "UIPartyPanel",
		Type = 1,
		Source = 0,
		Target = nil,
		ModifyTime = "2022-11-14T16:43:09.6783062+09:00",
		Properties = {
			{
				Type = "Entity",
				DefaultValue = "24b40163-49f1-442e-9ca8-e1025b60967e",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "partyWatingPanel"
			},
			{
				Type = "Entity",
				DefaultValue = "b7ea977b-7274-4a23-906b-24ff1404b36d",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "partyCodePanel"
			},
			{
				Type = "Entity",
				DefaultValue = "95f52aac-cb9a-4eb4-9c6c-efce0d318741",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "partyStartButton"
			},
			{
				Type = "string",
				DefaultValue = "",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "partyCode"
			}
		},
		Methods = {
			{
				Return = {
					Type = "void",
					DefaultValue = nil,
					SyncDirection = 0,
					Attributes = {
					},
					Name = nil
				},
				Arguments = {
					{
						Type = "string",
						DefaultValue = "",
						SyncDirection = 0,
						Attributes = {
						},
						Name = "code"
					}
				},
				Code = function(code)
					self.partyCodePanel.Enable = true
					self.partyWatingPanel.Enable = true
					self.partyStartButton.Enable = true
					self.partyCodePanel.TextComponent.Text = _UserService.LocalPlayer.Name
					self.partyCode = code
				end,
				Scope = 2,
				ExecSpace = 6,
				Attributes = {
				},
				Name = "SettingPanel_Master"
			},
			{
				Return = {
					Type = "void",
					DefaultValue = nil,
					SyncDirection = 0,
					Attributes = {
					},
					Name = nil
				},
				Arguments = {
					{
						Type = "string",
						DefaultValue = "",
						SyncDirection = 0,
						Attributes = {
						},
						Name = "code"
					}
				},
				Code = function(code)
					self.partyCodePanel.Enable = false
					self.partyWatingPanel.Enable = true
					self.partyStartButton.Enable = false
					self.partyCode = code
				end,
				Scope = 2,
				ExecSpace = 6,
				Attributes = {
				},
				Name = "SettingPanel_Member"
			}
		},
		EntityEventHandlers = {
		}
	}
}

return unpackedContents