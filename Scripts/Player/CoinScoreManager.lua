unpackedContents = {
	uniqueIdentifier = "47ab44de7d9b4216a4a4230f92446f00",
	bundleIdentifier = "2c89a498317848aab9fe46cd70bf74bb",
	category = "codeblock",
	entryId = "9890217f-89a5-4000-a99f-05b8588ffb94",
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
		Id = "9890217f-89a5-4000-a99f-05b8588ffb94",
		Language = 1,
		Name = "CoinScoreManager",
		Type = 1,
		Source = 0,
		Target = nil,
		ModifyTime = "2022-11-08T02:03:45.3277849+09:00",
		Properties = {
			{
				Type = "number",
				DefaultValue = "0",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "coinScore"
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
				Arguments = nil,
				Code = function()
					self.coinScore = self.coinScore + 10
					log("유저네임: " .. _UserService.LocalPlayer.Name .. " Score: " .. tostring(self.coinScore))
				end,
				Scope = 2,
				ExecSpace = 2,
				Attributes = {
				},
				Name = "addcoinScore"
			}
		},
		EntityEventHandlers = {
		}
	}
}

return unpackedContents