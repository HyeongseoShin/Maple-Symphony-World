unpackedContents = {
	uniqueIdentifier = "f2943dfb2a8447cd8b467c607c0477e0",
	bundleIdentifier = "2c89a498317848aab9fe46cd70bf74bb",
	category = "codeblock",
	entryId = "d4fcd4dc-6af9-48f7-8161-d901ea540796",
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
		Id = "d4fcd4dc-6af9-48f7-8161-d901ea540796",
		Language = 1,
		Name = "Admin",
		Type = 1,
		Source = 0,
		Target = nil,
		ModifyTime = "2022-11-14T07:08:56.0268482+09:00",
		Properties = {
			{
				Type = "string",
				DefaultValue = "",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "PW"
			},
			{
				Type = "boolean",
				DefaultValue = "false",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "isFull"
			},
			{
				Type = "dictionary",
				DefaultValue = "number|Entity",
				SyncDirection = 3,
				Attributes = {
				},
				Name = "ReadyUserList"
			},
			{
				Type = "string",
				DefaultValue = "",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "AdminName"
			},
			{
				Type = "number",
				DefaultValue = "0",
				SyncDirection = 3,
				Attributes = {
				},
				Name = "currPlayerCnt"
			},
			{
				Type = "dictionary",
				DefaultValue = "number|string",
				SyncDirection = 3,
				Attributes = {
				},
				Name = "ReadyUserListName"
			},
			{
				Type = "Entity",
				DefaultValue = "24b40163-49f1-442e-9ca8-e1025b60967e",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "partyMemberText"
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
						Type = "number",
						DefaultValue = nil,
						SyncDirection = 0,
						Attributes = {
						},
						Name = "delta"
					}
				},
				Code = function(delta)
					-- 플레이어 움직임
					if self.Entity.Parent.PlayerControllerComponent.LookDirectionX < 0 then
						self.Entity.SpriteRendererComponent.FlipX = false
						self.Entity.TransformComponent.Position.x = -0.05
					else 
						self.Entity.SpriteRendererComponent.FlipX = true
						self.Entity.TransformComponent.Position.x = 0.05
					end
				end,
				Scope = 2,
				ExecSpace = 2,
				Attributes = {
				},
				Name = "OnUpdate"
			},
			{
				Return = {
					Type = "any",
					DefaultValue = "nil",
					SyncDirection = 0,
					Attributes = {
					},
					Name = nil
				},
				Arguments = {
				},
				Code = function()
					-- Instance Map을 생성. roomName(방장 ID) instanceMap뒤에 숫자 붙음.
					local instanceMap = _InstanceMapService:GetOrCreateInstanceMap(self.Entity.Parent.Name)  
					return instanceMap
				end,
				Scope = 2,
				ExecSpace = 0,
				Attributes = {
				},
				Name = "GetOrCreateInstanceMap"
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
						Name = "targetAdminUser"
					}
				},
				Code = function(targetAdminUser)
					if self.Entity.Parent.Name ~= targetAdminUser then return end
					log("[파티로그] PartyStart "..self.Entity.Name)
					
					--  [ 파티원이 다 안찬경우 ]
					if self.currPlayerCnt < 2 then
						log("[파티로그_] PartyStart member"..self.ReadyUserListName[1])
						self:OnCantStartPartyPanel(self.Entity.Parent.Name)
					else 
						local isOkToStart = true
						
						-- 파티원이 모두 로비에 있는지 확인
						for k,user in pairs(self.ReadyUserList) do
							if user.CurrentMap.Name ~= "Lobby" then
								 isOkToStart = false
							end
						end
						
						-- 모두 로비에 있어서 출발가능 
						if isOkToStart then 
							-- 파티 시작하기
							local GM = _EntityService:GetEntityByPath("/maps/Lobby").GM
						
							------------------------------------[이거 send ]------------------------------------------------------------------
							
							-- 기다리라는 UI띄우기 
							for index, user in pairs(self.ReadyUserList) do
								if user ~= nil then
									-- 대기 UI띄우기 
									user.PlayerUIController:OnPartyStartWatingPanel(user.Name)
									user.PlayerUIController:OffPartyPanel(user.Name)
								end
							end
							
							--local instanceMap = self.Entity.Parent.CurrentMap.GameManager:GetOrCreateInstanceMap()
							local instanceMap = _InstanceMapService:GetOrCreateInstanceMap("InstanceMap"..self.Entity.Parent.Name)
							local mapDatabase =  _DataService:GetTable("MultiMapInfoDataSet")
							local multimapCnt = mapDatabase:GetRowCount()
							local mapIndex =  math.random(1,multimapCnt) 
							local Id
							local sendMemberList = {}
							local index = 1
							for index, user in pairs(self.ReadyUserList) do
								if user ~= nil then
									-- 대기 UI띄우기 
									--user.PlayerUIController:OnPartyStartWatingPanel(user.Name)
									
									-- 이동 준비
									sendMemberList[index] = user.Name
									index = index + 1
									-- 해당 플레이어들 의자 없애기 
									user.PlayerSocialController:DestroyChair_client()
									-- 해당 플레이어들 목적지 맵 정해주기
									Id = mapDatabase:GetCell(mapIndex, "Id") -- index에서 map Id 가져오기 
									user.Player:SetSelectMapId(Id) -- map ID저장 
									user.Player:OnUpdateSelectMap() -- update했다고 알려줌
									wait(1) 
								end
							end
							--log("[파티로그_] 준비끝 이제보냄")
							log("sendMemberList[1] "..sendMemberList[1])
							log("sendMemberList[2] "..sendMemberList[2])
							_InstanceMapService:MoveUsersToInstanceMap(instanceMap.InstanceKey, sendMemberList)
						
					
					
					
					
					
					
					
					         --------------------------------------------------------------------------------------------------
					
							
					
					
						-- 누군가 랭킹맵에 있어서 출발 불가능 
						else 
							self.Entity.Parent.PlayerUIController:OnNotReadyToStartPartyNoticePanel()
						end
					end
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "PartyStart"
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
						Name = "targetAdminUser"
					}
				},
				Code = function(targetAdminUser)
					log("[파티로그] UpdateMemberListPanel "..self.Entity.Name)
					if self.Entity.Parent.Name ~= targetAdminUser then return end
					
					-- 파티원이름으로 한 문장 만들기 
					local memberText = ""
					for index,user in pairs(self.ReadyUserListName) do
						if user ~= "" then 
						memberText = memberText..user.."\n"
						end
					end
					
					log("[파티] 완성한 문장:"..memberText)
					self.Entity.Parent.PlayerUIController:SetPartyMemberPanel(memberText, targetAdminUser)
					
					-- 모든 파티원의 UI 업데이트하기 
					for k, player in pairs(self.ReadyUserList) do
						if player ~= nil then 
						log("[파티] 패널 업데이트"..player.Name)
						player.PlayerUIController:SetPartyMemberPanel(memberText, player.Name)
						end
					end
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "UpdateMemberListPanel"
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
					local cantStartPartyPanel = _EntityService:GetEntityByPath("/ui/LobbyUIGroup/CantStartPartyNoticePanel")
					cantStartPartyPanel.Enable = true
				end,
				Scope = 2,
				ExecSpace = 6,
				Attributes = {
				},
				Name = "OnCantStartPartyPanel"
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
						Name = "targetAdminUser"
					}
				},
				Code = function(targetAdminUser)
					log("[파티로그] InitAdmin "..self.Entity.Name)
					
					if self.Entity.Parent.Name ~= targetAdminUser then return end
					
					-- 플레이어 카운트 초기화
					self.currPlayerCnt= 1
					-- 자기 자신 번호 넣기
					self.ReadyUserList[1] = self.Entity.Parent
					-- 자기 자신 닉네임 넣기
					self.ReadyUserListName[1] = self.Entity.Parent.NameTagComponent.Name
					
					-- UI업데이트
					self:UpdateMemberListPanel(targetAdminUser)
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "InitAdmin"
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
						Name = "targetMemver"
					},
					{
						Type = "string",
						DefaultValue = "",
						SyncDirection = 0,
						Attributes = {
						},
						Name = "targetAdminUser"
					}
				},
				Code = function(targetMemver, targetAdminUser)
					log("[파티로그] RemoveMember "..self.Entity.Name)
					if self.Entity.Parent.Name ~= targetAdminUser then return end
					
					for index, userNickname in pairs(self.ReadyUserListName) do
						if userNickname == targetMemver then
							self.ReadyUserList[index] = nil
							self.ReadyUserListName[index] = ""
							self.currPlayerCnt = self.currPlayerCnt - 1
							log("[파티]나 탈퇴함("..tostring(self.currPlayerCnt)..")")
							self:UpdateMemberListPanel(targetAdminUser)
							return
						end
					end	
					
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "RemoveMember"
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
						Type = "Entity",
						DefaultValue = "nil",
						SyncDirection = 0,
						Attributes = {
						},
						Name = "targetMember"
					},
					{
						Type = "string",
						DefaultValue = "",
						SyncDirection = 0,
						Attributes = {
						},
						Name = "targetAdminUser"
					}
				},
				Code = function(targetMember, targetAdminUser)
					log("[파티로그] AddMember "..self.Entity.Name)
					if self.Entity.Parent.Name ~= targetAdminUser then return end
					self.currPlayerCnt = self.currPlayerCnt + 1
					
					self.ReadyUserList[self.currPlayerCnt] = targetMember
					self.ReadyUserListName[self.currPlayerCnt] = targetMember.PlayerComponent.Nickname
					
					targetMember.PlayerPartyController:SetPlayerPartyCode(targetAdminUser, targetMember.Name)
					log("[파티로그]맴버 추가함("..tostring(self.currPlayerCnt)..")")
					-- UI업데이트
					self:UpdateMemberListPanel(targetAdminUser)
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "AddMember"
			}
		},
		EntityEventHandlers = {
		}
	}
}

return unpackedContents