unpackedContents = {
	uniqueIdentifier = "d0f435135a964a60bcb6b847e112d0d8",
	bundleIdentifier = "2c89a498317848aab9fe46cd70bf74bb",
	category = "codeblock",
	entryId = "97d3ebbd-a655-4698-80a9-2f8d8208fba0",
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
		Id = "97d3ebbd-a655-4698-80a9-2f8d8208fba0",
		Language = 1,
		Name = "MakePartyButton",
		Type = 1,
		Source = 0,
		Target = nil,
		ModifyTime = "2022-11-13T16:38:21.0974438+09:00",
		Properties = {
			{
				Type = "Entity",
				DefaultValue = "b2a07025-8f74-42ac-bb8a-ec00fa382090",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "partyPanel"
			},
			{
				Type = "Entity",
				DefaultValue = "862adf3c-72f2-4dc4-bf92-7be05660308f",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "partyMakeNoticePanel"
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
					_UserService.LocalPlayer.PlayerPartyController.isAdmin = true
					-- DB에 파티 저장하기
					local GM = _EntityService:GetEntityByPath("/maps/Lobby") 
					GM.GM:SavePartyToDB(_UserService.LocalPlayer.Name)
						
					-- Admin 생성
					_UserService.LocalPlayer.PlayerPartyController:SpawnAdmin(_UserService.LocalPlayer.Name)
					
					
					-- GDB에 파티 등록
					--local common = _EntityService:GetEntityByPath("/common")
					--common.PartyGDBManager:RegisterPartyToGDB_GDB(_UserService.LocalPlayer.Name)
					
					-- 파티장 태그 바꾸기 
					_UserService.LocalPlayer.Player:ChangeTag("Admin")
					
					--플레이어를 파티 대기열에 등록했다는 것 기록하기 
					--_UserService.LocalPlayer.Player:OnReadyToPartyPlay()
					_UserService.LocalPlayer.PlayerPartyController:SetIsAdmin(true, _UserService.LocalPlayer.Name)
					_UserService.LocalPlayer.PlayerPartyController:SetIsinparty(true,  _UserService.LocalPlayer.Name)
					
					
					-- 플레이어 이동 허락하기 
					_UserService.LocalPlayer.PlayerControllerComponent.Enable = true
					_UserService.LocalPlayer.PlayerSocialController.lockHighJump = false
					
					-- Partypanel 보이기 + PartyPanel을 방장 버전으로 세팅하기 
					self.partyPanel.Enable = true
					self.partyPanel.UIPartyPanel:SettingPanel_Master(_UserService.LocalPlayer.Name)
					
					-- 파티 만들어졌다는 notice panel 켜기
					self.partyMakeNoticePanel.Enable = true
					
					-- NPC_1 UI Panel 끄기
					self.Entity.Parent.Parent.Enable = false
					
					
				end,
				Scope = 0,
				ExecSpace = 0
			}
		}
	}
}

return unpackedContents