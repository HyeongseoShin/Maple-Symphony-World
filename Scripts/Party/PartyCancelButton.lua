unpackedContents = {
	uniqueIdentifier = "664e7d1589eb4addb526946c90a626a8",
	bundleIdentifier = "2c89a498317848aab9fe46cd70bf74bb",
	category = "codeblock",
	entryId = "d922d3cc-04ef-44f0-ae15-5bc6a1766f62",
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
		Id = "d922d3cc-04ef-44f0-ae15-5bc6a1766f62",
		Language = 1,
		Name = "PartyCancelButton",
		Type = 1,
		Source = 0,
		Target = nil,
		ModifyTime = "2022-11-08T23:29:25.5958603+09:00",
		Properties = {
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
					local user = _UserService.LocalPlayer
					
					-- 파티 없애기 
					_UserService.LocalPlayer.PlayerParty:CancelParty(self.Entity.Parent.NoticePanel.PartyCode)
					
					--party panel 끄기
					local partyPanel = _EntityService:GetEntityByPath("/ui/PartyUIGroup/Model_PartyPanel")
					partyPanel:SetEnable(false)
					
					--notice panel 끄기 
					self.Entity.Parent:SetEnable(false)
					
					-- 파티 만들기 버튼 text바꾸기 
					local PartyCreateButton = _EntityService:GetEntityByPath("/ui/PartyUIGroup/Model_CreatePartyButton")
					PartyCreateButton.TextComponent.Text = "파티 만들기"
				end,
				Scope = 0,
				ExecSpace = 0
			}
		}
	}
}

return unpackedContents