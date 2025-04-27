unpackedContents = {
	uniqueIdentifier = "131291f9b0a848e788868d7c65b1c249",
	bundleIdentifier = "2c89a498317848aab9fe46cd70bf74bb",
	category = "codeblock",
	entryId = "d4f70c90-7ed1-4b28-8342-88d6c957b179",
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
		Id = "d4f70c90-7ed1-4b28-8342-88d6c957b179",
		Language = 1,
		Name = "FindPartyButton",
		Type = 1,
		Source = 0,
		Target = nil,
		ModifyTime = "2022-11-10T05:45:18.3402889+09:00",
		Properties = {
			{
				Type = "Entity",
				DefaultValue = "43e56850-5681-433b-963e-2c94111ac9bd",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "partyFindNoticePanel"
			}
		},
		Methods = {
		},
		EntityEventHandlers = {
			{
				Name = "HandleButtonClickEvent",
				EventName = "ButtonClickEvent",
				Target = "self",
				Code = function()
					-- Parameters
					local Entity = event.Entity
					--------------------------------------------------------
					-- 파티 찾기 패널 켜기 
					self.partyFindNoticePanel.Enable = true
					
					-- 파티 옵션 버튼 패널 끄기
					self.Entity.Parent.Enable = false
				end,
				Scope = 0,
				ExecSpace = 0
			}
		}
	}
}

return unpackedContents