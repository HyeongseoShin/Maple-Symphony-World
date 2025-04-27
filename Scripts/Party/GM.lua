unpackedContents = {
	uniqueIdentifier = "c77b5bfcbb7e4cfea2c098be92e4ae74",
	bundleIdentifier = "2c89a498317848aab9fe46cd70bf74bb",
	category = "codeblock",
	entryId = "126bf1ae-d4bb-4a78-ab41-f3f488126e6f",
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
		Id = "126bf1ae-d4bb-4a78-ab41-f3f488126e6f",
		Language = 1,
		Name = "GM",
		Type = 1,
		Source = 0,
		Target = nil,
		ModifyTime = "2022-11-14T16:41:48.0048509+09:00",
		Properties = {
			{
				Type = "number",
				DefaultValue = "0",
				SyncDirection = 3,
				Attributes = {
				},
				Name = "InsIndex"
			},
			{
				Type = "Entity",
				DefaultValue = "b16b0fdb-07fd-400b-98f6-95b77746ea3e",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "gameManager"
			},
			{
				Type = "any",
				DefaultValue = "nil",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "MultiDB"
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
						DefaultValue = nil,
						SyncDirection = 0,
						Attributes = {
						},
						Name = "AdminName"
					}
				},
				Code = function(AdminName)
					-- DB에 파티 저장하기 
					local PartyDB = _DataStorageService:GetGlobalDataStorage("PartyDB")
					local callBack = function(errorcode, key, value) 
						
					end
					PartyDB:SetAsync("AdminName",AdminName, callBack) 
					PartyDB:SetAsync("PW", "", callBack) 
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "SavePartyToDB"
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
						Type = "table",
						DefaultValue = nil,
						SyncDirection = 0,
						Attributes = {
						},
						Name = "partyMembers"
					}
				},
				Code = function(partyMembers)
					
					for index, user in pairs(partyMembers) do
						if user ~= nil then
							-- 대기 UI띄우기 
							user.PlayerUIController:OnPartyStartWatingPanel(user.Name)
							user.PlayerUIController:OffPartyPanel(user.Name)
						end
					end
					
					
					local instanceMap = self.gameManager.GameManager:GetOrCreateInstanceMap()
					--local instanceMap = self:GetOrCreateInstanceMap()
					local mapDatabase = self.MultiDB
					local multimapCnt = mapDatabase:GetRowCount()
					local mapIndex =  math.random(1,multimapCnt) 
					local Id
					local sendMemberList = {}
					local index = 1
					for index, user in pairs(partyMembers) do
						if user ~= nil then
							-- 대기 UI띄우기 
							--user.PlayerUIController:OnPartyStartWatingPanel(user.Name)
							
							-- 이동 준비
							sendMemberList[index] = user.Name
							index = index + 1
							--log("[파티로그_] 보낼 사람:"..user.Name)
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
					--log("sendMemberList[1] Name "..sendMemberList[1].Name)
					--log("sendMemberList[2] Name "..sendMemberList[2].Name)
					_InstanceMapService:MoveUsersToInstanceMap(instanceMap.InstanceKey, sendMemberList)
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "Send"
			},
			{
				Return = {
					Type = "any",
					DefaultValue = nil,
					SyncDirection = 0,
					Attributes = {
					},
					Name = nil
				},
				Arguments = {
				},
				Code = function()
					-- Instance Map을 생성. roomName(방장 ID) instanceMap뒤에 숫자 붙음.
					local instanceMap = _InstanceMapService:GetOrCreateInstanceMap("Ins"..self.InsIndex)  
					self.InsIndex = self.InsIndex + 1
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
				Arguments = nil,
				Code = function()
					self.MultiDB = _DataService:GetTable("MultiMapInfoDataSet")
				end,
				Scope = 2,
				ExecSpace = 1,
				Attributes = {
				},
				Name = "OnBeginPlay"
			}
		},
		EntityEventHandlers = {
		}
	}
}

return unpackedContents