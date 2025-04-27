unpackedContents = {
	uniqueIdentifier = "21de47fc44ff420d94c8ed68bb493bfa",
	bundleIdentifier = "2c89a498317848aab9fe46cd70bf74bb",
	category = "codeblock",
	entryId = "5666d93f-56f9-4ea2-87b5-ee94641a384f",
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
		Id = "5666d93f-56f9-4ea2-87b5-ee94641a384f",
		Language = 1,
		Name = "SearchButton",
		Type = 1,
		Source = 0,
		Target = nil,
		ModifyTime = "2022-11-14T00:01:38.5884547+09:00",
		Properties = {
			{
				Type = "Entity",
				DefaultValue = "3f512ea6-7dbe-4623-92cd-30c21346ba59",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "PartyNotFoundNoticePanel"
			},
			{
				Type = "Entity",
				DefaultValue = "3299f4b7-7b91-4a89-9d5c-d3e5fc41ca73",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "PartyFoundNoticePanel"
			},
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
				DefaultValue = "8c804a02-a423-4a96-99cb-5c51ac0e53d7",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "NPC1_Panel"
			},
			{
				Type = "Entity",
				DefaultValue = "70387f0d-8852-4951-aa3c-8379cc441ce4",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "CodeInputBox"
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
					
					-- 입력된 코드 저장하기
					local getCode = self.CodeInputBox.TextComponent.Text
					
					-- 해당 코드를 가진 유저 찾기 (AdminUser ID로 찾기)
					local AdminUser = _UserService:GetUserEntityByUserId(getCode)
					--local admin = AdminUser:GetChildByName("Admin"..getCode)
					
					--GDB의 PartyListGDB에서 해당 파티 찾기 
					
					if AdminUser == nil then 
						-- 못찾았다는 알람창 켜기
						self.PartyNotFoundNoticePanel.Enable = true
					else 
						log("어드민은 찾음")
						local tag = AdminUser.TagComponent.Tags[1] 
						
						if  tag ~= "Admin" then
							-- 못찾았다는 알람창 켜기
							self.PartyNotFoundNoticePanel.Enable = true
						
						elseif tag == "Admin" then 
							local Admin = AdminUser:GetChildByName("Admin"..AdminUser.Name)
							
							-- 파티에 자리가 있는지 확인하기 
							-- [자리 없음]
							if Admin.Admin.currPlayerCnt>=2 then
								local partyIsFullPanel = _EntityService:GetEntityByPath("/ui/LobbyUIGroup/PartyIsFullNoticePanel")
								partyIsFullPanel.Enable = true
								
							-- [자리 있음]
							else 
								log("자리 있음")
								-- 찾았다는 알람창 켜기 
								self.PartyFoundNoticePanel.Enable = true
								
								-- 찾은 유저의 Admin의 파티맴버에 등록하기 
								--Admin.Admin:AddPlayer(_UserService.LocalPlayer.Name, AdminUser.Name)
								Admin.Admin:AddMember(_UserService.LocalPlayer, AdminUser.Name)
								
								-- 유저가 파티에 등록되었다고 기록하기 
								_UserService.LocalPlayer.Player:OnReadyToPartyPlay()
								_UserService.LocalPlayer.PlayerPartyController:SetIsinparty(true, _UserService.LocalPlayer.Name)
								
								-- 파티 패널 켜기 
								self.partyPanel.Enable = true
								self.partyPanel.UIPartyPanel:SettingPanel_Member(getCode)
								
								
								-- NPC_1 창 끄기 
								self.NPC1_Panel.Enable = false
								_UserService.LocalPlayer.PlayerControllerComponent.Enable = true
								_UserService.LocalPlayer.PlayerSocialController.lockHighJump = false
							end
						end 
					end
					
				end,
				Scope = 0,
				ExecSpace = 0
			}
		}
	}
}

return unpackedContents