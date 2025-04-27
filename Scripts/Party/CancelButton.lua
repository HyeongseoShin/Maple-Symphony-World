unpackedContents = {
	uniqueIdentifier = "a88df9782447472caf5aeec5aa483234",
	bundleIdentifier = "2c89a498317848aab9fe46cd70bf74bb",
	category = "codeblock",
	entryId = "abd4377f-0549-4a4c-b05d-a825cb679ac8",
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
		Id = "abd4377f-0549-4a4c-b05d-a825cb679ac8",
		Language = 1,
		Name = "CancelButton",
		Type = 1,
		Source = 0,
		Target = nil,
		ModifyTime = "2022-11-14T00:51:13.9210622+09:00",
		Properties = {
			{
				Type = "Entity",
				DefaultValue = "b2a07025-8f74-42ac-bb8a-ec00fa382090",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "partyUIPanel"
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
					-- 파티 없애기 
					_UserService.LocalPlayer.PlayerPartyController:CancelParty(self.partyUIPanel.UIPartyPanel.partyCode, 1)
					
					--플레이어를 파티 대기열에서 취소했다는 것 기록하기 
					--_UserService.LocalPlayer.Player:CancelReadyToPartyPlay(_UserService.LocalPlayer.Name)
					
					--party panel 끄기
					self.Entity.Parent.Parent.Enable = false
				end,
				Scope = 0,
				ExecSpace = 0
			}
		}
	}
}

return unpackedContents