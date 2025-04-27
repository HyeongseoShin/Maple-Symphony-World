unpackedContents = {
	uniqueIdentifier = "5be63db5b95941ae9c772edd4262046c",
	bundleIdentifier = "2c89a498317848aab9fe46cd70bf74bb",
	category = "codeblock",
	entryId = "5bb3c7d8-1348-4bec-b869-a78a807a911a",
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
		Id = "5bb3c7d8-1348-4bec-b869-a78a807a911a",
		Language = 1,
		Name = "PlayerPartyController",
		Type = 1,
		Source = 0,
		Target = nil,
		ModifyTime = "2022-11-14T02:06:31.1835719+09:00",
		Properties = {
			{
				Type = "boolean",
				DefaultValue = "false",
				SyncDirection = 3,
				Attributes = {
				},
				Name = "isInParty"
			},
			{
				Type = "boolean",
				DefaultValue = "false",
				SyncDirection = 3,
				Attributes = {
				},
				Name = "isAdmin"
			},
			{
				Type = "Entity",
				DefaultValue = "b2a07025-8f74-42ac-bb8a-ec00fa382090",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "partyUIPanel"
			},
			{
				Type = "string",
				DefaultValue = "",
				SyncDirection = 3,
				Attributes = {
				},
				Name = "playerPartyCode"
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
						Name = "targetUser"
					}
				},
				Code = function(targetUser)
					if self.Entity.Name ~= targetUser then return end
					local adminEntity = _SpawnService:SpawnByModelId("model://c7624fa7-50cf-45e2-bb6e-d039956f216d" ,"Admin"..self.Entity.Name, Vector3(-0.05,0.65,0), self.Entity)
					adminEntity.Admin:InitAdmin(self.Entity.Name)
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "SpawnAdmin"
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
						Type = "any",
						DefaultValue = nil,
						SyncDirection = 0,
						Attributes = {
						},
						Name = "enteredMap"
					}
				},
				Code = function(enteredMap)
					if enteredMap.Name == "Lobby" then
					else 
						-- admin 이면 admin객체 없애기 
						if self.isAdmin then
							local Admin = self.Entity:GetChildByName("Admin"..self.Entity.Name)
							_EntityService:Destroy(Admin)
						end
					end
				end,
				Scope = 2,
				ExecSpace = 1,
				Attributes = {
				},
				Name = "OnMapEnter"
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
						DefaultValue = nil,
						SyncDirection = 0,
						Attributes = {
						},
						Name = "code"
					},
					{
						Type = "number",
						DefaultValue = "0",
						SyncDirection = 0,
						Attributes = {
						},
						Name = "type"
					}
				},
				Code = function(code, type)
					-- 파티장인 경우
					if self.isAdmin then
						
						-- [ 파티원에 대해서 ]
						-- 파티원 NoticeUI 끄기 (대기열은 Admin파괴하면 알아서 사라짐)
						local Admin = self.Entity:GetChildByName("Admin"..self.Entity.Name)
						for index, user in pairs(Admin.Admin.ReadyUserList) do
							if Admin.Admin.ReadyUserList[index].Name ~= self.Entity.Name then 
								Admin.Admin:RemoveMember(user.PlayerComponent.Nickname, self.Entity.Name)
								user.PlayerPartyController:SetIsinparty(false, user.Name)
								user.PlayerUIController:OnPartyDestroyNoticePanel(type,user.Name)
								user.PlayerUIController:OffPartyPanel(user.PlayerComponent.UserId)
								user.PlayerPartyController.playerPartyCode = ""
							end
						end
						
						-- [ 파티장에 대해서 ] 
						-- 파티장 태그 바꾸기 
						self.Entity.Player:ChangeTag(self.Entity.Name, "User")
						self.Entity.PlayerUIController:OnPartyDestroyNoticePanel(type,self.Entity.Name)
						self:SetIsAdmin(false, self.Entity.Name)
						self:SetIsinparty(false, self.Entity.Name) 
						self.playerPartyCode = ""
						--Admin 파괴하기
						_EntityService:Destroy(Admin)
						self.Entity.PlayerUIController:OffPartyPanel(self.Entity.PlayerComponent.UserId)
						
					
					
					-- 파티원인 경우
					else  
						-- 참여되어있는 파티에서 빼기 
						local AdminUser = _UserService:GetUserEntityByUserId(code)
						local Admin = AdminUser:GetChildByName("Admin"..AdminUser.Name)
					
						
						for index, user in pairs(Admin.Admin.ReadyUserListName) do
							if user == self.Entity.PlayerComponent.Nickname then
								Admin.Admin:RemoveMember(self.Entity.PlayerComponent.Nickname, AdminUser.Name)
								self:SetIsinparty(false, self.Entity.Name)
								self.Entity.PlayerUIController:OnPartyCancelNoticePanel(self.Entity.PlayerComponent.UserId)
								self.Entity.PlayerUIController:OffPartyPanel(self.Entity.PlayerComponent.UserId)
								self.playerPartyCode = ""
							end
						end	
					end
					self:CancelSetting()
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "CancelParty"
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
				},
				Code = function()
						self.isAdmin = false
						self.isInParty = false
				end,
				Scope = 2,
				ExecSpace = 6,
				Attributes = {
				},
				Name = "CancelSetting"
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
						Type = "boolean",
						DefaultValue = nil,
						SyncDirection = 0,
						Attributes = {
						},
						Name = "arg"
					},
					{
						Type = "string",
						DefaultValue = "",
						SyncDirection = 0,
						Attributes = {
						},
						Name = "targetUser"
					}
				},
				Code = function(arg, targetUser)
					if self.Entity.Name == targetUser then
						self.isAdmin = arg
						if arg then 
							self.Entity.Player:ChangeTag(self.Entity.Name, "Admin")
							self.playerPartyCode = self.Entity.Name
						end
					end
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "SetIsAdmin"
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
						Type = "boolean",
						DefaultValue = nil,
						SyncDirection = 0,
						Attributes = {
						},
						Name = "arg"
					},
					{
						Type = "string",
						DefaultValue = "",
						SyncDirection = 0,
						Attributes = {
						},
						Name = "targetUser"
					}
				},
				Code = function(arg, targetUser)
					if self.Entity.Name == targetUser then
						self.isInParty = arg
						if self.isInParty == true then
						end
					end
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "SetIsinparty"
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
				Arguments = nil,
				Code = function()
					if self.isInParty then
						log(self.Entity.PlayerComponent.Nickname.." 접종함")
						self:CancelParty_2(self.playerPartyCode,1 )
					end
				end,
				Scope = 2,
				ExecSpace = 1,
				Attributes = {
				},
				Name = "OnEndPlay"
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
						Type = "any",
						DefaultValue = nil,
						SyncDirection = 0,
						Attributes = {
						},
						Name = "leftMap"
					}
				},
				Code = function(leftMap)
					if self.isInParty then
						log(self.Entity.PlayerComponent.Nickname.." 맵 나감")
						self:CancelParty_3(2)
					end
				end,
				Scope = 2,
				ExecSpace = 1,
				Attributes = {
				},
				Name = "OnMapLeave"
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
					},
					{
						Type = "number",
						DefaultValue = "0",
						SyncDirection = 0,
						Attributes = {
						},
						Name = "type"
					}
				},
				Code = function(code, type)
					-- 접종시 파티 캔슬 
					
					
					-- [ 내가 파장인 경우 ] : 나는 어차피 나가니까 괜찮고, 파티원만 처리하기 
					if self.isAdmin then
						
						-- 유저 리스트 가져오기 
						local Admin = self.Entity:GetChildByName("Admin"..self.Entity.Name)
						for index, user in pairs(Admin.Admin.ReadyUserList) do
							-- 파티원 
							if user.Name ~= self.Entity.Name then 
								-- 나 포함 모든 사람 isInParty 해제하기 
								user.PlayerPartyController:SetIsinparty(false, user.Name) 
								-- 파티 해체 ui띄우기 
								user.PlayerUIController:OnPartyDestroyNoticePanel(type,user.Name)
								-- partyUipanel UI끄기 
								user.PlayerUIController:OffPartyPanel(user.PlayerComponent.UserId)
							end
						end
						
					-- [ 내가 파티원인경우 ]
					else 
						local AdminUser = _UserService:GetUserEntityByUserId(code)
						local Admin = AdminUser:GetChildByName("Admin"..AdminUser.Name)
						Admin.Admin:RemoveMember(self.Entity.PlayerComponent.Nickname, AdminUser.Name)
					end
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "CancelParty_2"
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
						Type = "number",
						DefaultValue = "0",
						SyncDirection = 0,
						Attributes = {
						},
						Name = "type"
					}
				},
				Code = function(type)
					-- 다른 맵 갔을때 파장이 파티캔슬
					
					if self.isAdmin then
						
						-- 유저 리스트 가져오기 
						local Admin = self.Entity:GetChildByName("Admin"..self.Entity.Name)
						for index, user in pairs(Admin.Admin.ReadyUserList) do
							-- 파티원 
							-- 나 포함 모든 사람 isInParty 해제하기 
							user.PlayerPartyController:SetIsinparty(false, user.Name) 
							-- 파티 해체 ui띄우기 
							user.PlayerUIController:OnPartyDestroyNoticePanel(type,user.Name)
							-- partyUipanel UI끄기 
							user.PlayerUIController:OffPartyPanel(user.PlayerComponent.UserId)
							user.PlayerPartyController.playerPartyCode = ""
						end
						
					end
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "CancelParty_3"
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
					},
					{
						Type = "string",
						DefaultValue = "",
						SyncDirection = 0,
						Attributes = {
						},
						Name = "targetUser"
					}
				},
				Code = function(code, targetUser)
					if self.Entity.Name ~= targetUser then return end
					self.playerPartyCode = code
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "SetPlayerPartyCode"
			}
		},
		EntityEventHandlers = {
		}
	}
}

return unpackedContents