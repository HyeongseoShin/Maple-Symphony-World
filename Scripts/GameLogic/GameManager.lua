unpackedContents = {
	uniqueIdentifier = "10a136493c55483eb77d8f637818b075",
	bundleIdentifier = "2c89a498317848aab9fe46cd70bf74bb",
	category = "codeblock",
	entryId = "f37c2b20-1739-43d0-8e75-8b04ef0f23f5",
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
		Id = "f37c2b20-1739-43d0-8e75-8b04ef0f23f5",
		Language = 1,
		Name = "GameManager",
		Type = 1,
		Source = 0,
		Target = nil,
		ModifyTime = "2022-11-14T04:31:23.9232891+09:00",
		Properties = {
			{
				Type = "number",
				DefaultValue = "0",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "roomIdx"
			},
			{
				Type = "number",
				DefaultValue = "0",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "checkReadyPlayerTimer"
			},
			{
				Type = "number",
				DefaultValue = "0",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "checkMultiReadyPlayerTimer"
			},
			{
				Type = "number",
				DefaultValue = "2",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "needMultiPlayerNum"
			},
			{
				Type = "any",
				DefaultValue = "nil",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "mapDatabase"
			}
		},
		Methods = {
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
					{
						Type = "number",
						DefaultValue = "0",
						SyncDirection = 0,
						Attributes = {
						},
						Name = "arg"
					}
				},
				Code = function(arg)
					-- InstanceMapService를 이용해 Instance Map을 생성하고 roomIdx를 1 올려줍니다.
					-- roomIdx를 Instance Map을 만드는 키로 사용해 매번 새로운 InstanceMap이 만들어지게 합니다.
					local instanceMap = _InstanceMapService:GetOrCreateInstanceMap("InstanceMap"..tostring(self.roomIdx))
					log("self.roomIdx: "..self.roomIdx)
					self.roomIdx = self.roomIdx + 1
					return instanceMap
				end,
				Scope = 2,
				ExecSpace = 1,
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
						Type = "number",
						DefaultValue = nil,
						SyncDirection = 0,
						Attributes = {
						},
						Name = "delta"
					}
				},
				Code = function(delta)
					-- 타이머에 시간 넣기 
					self.checkReadyPlayerTimer = self.checkReadyPlayerTimer + delta
					self.checkMultiReadyPlayerTimer = self.checkMultiReadyPlayerTimer + delta
					
					
					--[멀티]
						if self.checkMultiReadyPlayerTimer >= 5.0 then
						    self.checkMultiReadyPlayerTimer = 0. -- 타이머 초기화
							
						
						    -- Ready 상태인 플레이어 수, 이름 가져오기 
						    local readyPlayerNum = 0
						    local readyPlayers = {}
						        for k, v in pairs(_UserService.UserEntities) do
						        if v.Player.isReadyToMultiPlay == true then
								
						            readyPlayerNum = readyPlayerNum + 1
						            readyPlayers[#readyPlayers+1] = v
						        end
						    end
						
						    -- Ready 플레이어가 수가 조건을 만족하면 
						    if readyPlayerNum >= self.needMultiPlayerNum then
							
								-- 맵 정하기 
								local multimapCnt = self.mapDatabase:GetRowCount()
								local mapIndex =  math.random(1,multimapCnt) 
							
								for k,v in pairs(readyPlayers) do
									-- 해당 플레이어들 의자 없애기 
									v.PlayerSocialController:DestroyChair_client()
									-- 해당 플레이어들 목적지 맵 정해주기
									local Id = self.mapDatabase:GetCell(mapIndex, "Id") -- index에서 map Id 가져오기 
									v.Player:SetSelectMapId(Id) -- map ID저장 
									v.Player:OnUpdateSelectMap() -- update했다고 알려줌 
									
								end
						        -- 해당 플레이어들을 인스턴스 맵으로 보내기 
						        for i = 1, math.floor(readyPlayerNum / self.needMultiPlayerNum) do
						            -- Instance Map 생성 
						            local instanceMap = self:GetOrCreateInstanceMap()
						            -- 인스턴스맵으로 보낼 플레이어를 list에 담기 
								   local toSendPlayers = {}
						            for j = 1, self.needMultiPlayerNum do
						                local idx = (i-1) * self.needMultiPlayerNum + j
						                toSendPlayers[#toSendPlayers+1] = readyPlayers[idx].Name
						            end
						            -- 플레이어들 Instance Map으로 보내기 
						            _InstanceMapService:MoveUsersToInstanceMap(instanceMap.InstanceKey, toSendPlayers)
						        end
						    end
						end
					
					--[솔플]
						if self.checkReadyPlayerTimer >= 2.0 then
							self.checkReadyPlayerTimer = 0. -- 타이머 초기화
						
							-- Lobby에 있는 전체 플레이어 체크 
							for k, v in pairs(_UserService.UserEntities) do
								-- 준비된 플레이어는 AIns맵으로 이동시키기
								if v.Player.isReadyToPlay == true then 
									-- 의자 없애기 
									v.PlayerSocialController:DestroyChair_client()
									-- 인스턴스 맵 생성 
									local instanceMap = self:GetOrCreateInstanceMap()
									-- 보낼 플레이어 리스트 만들기 (로컬 유저만 넣기)
									local toSendPlayer = {}
									toSendPlayer[1] =  v.Name
									-- story waiting ui 없애기 
									v.PlayerUIController:OffStoryWaitingPanel()
								     -- 플레이어들 Instance Map으로 보내기 
								     _InstanceMapService:MoveUsersToInstanceMap(instanceMap.InstanceKey,toSendPlayer)
								end
							end
						end
				end,
				Scope = 2,
				ExecSpace = 1,
				Attributes = {
				},
				Name = "OnUpdate"
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
					self.mapDatabase = _DataService:GetTable("MultiMapInfoDataSet")
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