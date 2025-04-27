unpackedContents = {
	uniqueIdentifier = "4aba1debf5314bfebd4791ec52a42242",
	bundleIdentifier = "2c89a498317848aab9fe46cd70bf74bb",
	category = "codeblock",
	entryId = "1a518226-142b-4c2c-a3d7-051fcd3a27ab",
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
		Id = "1a518226-142b-4c2c-a3d7-051fcd3a27ab",
		Language = 1,
		Name = "PartyStartButton",
		Type = 1,
		Source = 0,
		Target = nil,
		ModifyTime = "2022-11-14T00:04:36.829222+09:00",
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
					-- 파장이 다른 맵에 있는 경우, 어드민을 못찾아 에러나기 때문에 사전 차단
					if _UserService.LocalPlayer.CurrentMap.Name ~= "Lobby" then
						_UserService.LocalPlayer.PlayerUIController:OnNotReadyToStartPartyNoticePanel()
					
					-- 일단 파장이 로비맵에 있는 경우 
					else
						local admin = _UserService.LocalPlayer:GetChildByName("Admin".._UserService.LocalPlayer.Name)
						admin.Admin:PartyStart(_UserService.LocalPlayer.Name)	
					end
					
				end,
				Scope = 0,
				ExecSpace = 0
			}
		}
	}
}

return unpackedContents