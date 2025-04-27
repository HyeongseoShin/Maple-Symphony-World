unpackedContents = {
	uniqueIdentifier = "091ad4a4abae40acbe819381989f8e6b",
	bundleIdentifier = "2c89a498317848aab9fe46cd70bf74bb",
	category = "codeblock",
	entryId = "012400c3-b8af-4345-a090-9dae80b6ed0c",
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
		Id = "012400c3-b8af-4345-a090-9dae80b6ed0c",
		Language = 1,
		Name = "QuestController",
		Type = 1,
		Source = 0,
		Target = nil,
		ModifyTime = "2022-11-14T18:42:44.7472024+09:00",
		Properties = {
			{
				Type = "any",
				DefaultValue = "nil",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "questDataSet"
			},
			{
				Type = "any",
				DefaultValue = "nil",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "UDB"
			},
			{
				Type = "any",
				DefaultValue = "nil",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "userItemDataSet"
			},
			{
				Type = "any",
				DefaultValue = "nil",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "storyMapInfoDataSet"
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
						Type = "boolean",
						DefaultValue = nil,
						SyncDirection = 0,
						Attributes = {
						},
						Name = "isFirst"
					}
				},
				Code = function(isFirst)
					-- [월드 접속시 퀘스트 세팅]
					
					-- 첫 접속시에만 wait 하기 
					if isFirst then
						-- UDB가 초기화 된 후에 아래 동작 실행 
						wait(1)
					end
					-- (퀘스트 slot 로드하기는 UIQuest에서 함)  
					-- 퀘스트 slot들 state따라 세팅하기 
					self:GetQuestStateTable()
					self:GetCurrClearStory()
					
					
				end,
				Scope = 2,
				ExecSpace = 6,
				Attributes = {
				},
				Name = "WorldVisit_QuestSetting"
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
					-- UDB 가져오기 
					
					-- quest state에 값 넣기 
					local states = {}
					local questCnt = tonumber(self.questDataSet:GetRowCount())
					for i = 1, questCnt, 1 do
						--states[i] = tostring(self.Entity.PlayerUDBController:GetQID_UDB(tostring(i))) : 왜 안되는지 모르겠는데 이렇게는 못씀. 
						local callBack = function(errorcode,key,value)
							states[i] = tostring(value)
						end
						self.UDB:GetAsync("Q"..tostring(i), callBack)
					end
					
					wait(2) -- 이게 없으면 uDB에서 읽어오는게 밑에 서버, 클라이언트 출력보다 느릴때가 있다. 그럼 값이 제대로 안들어감. 
					
					-- quest slot state따라 초기화 
					self:SetAllQuestSlot(states,questCnt, self.Entity.Name)
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "GetQuestStateTable"
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
						DefaultValue = "{}",
						SyncDirection = 0,
						Attributes = {
						},
						Name = "arg"
					},
					{
						Type = "number",
						DefaultValue = "0",
						SyncDirection = 0,
						Attributes = {
						},
						Name = "questCnt"
					}
				},
				Code = function(arg, questCnt)
					for i = 1, questCnt, 1 do
						local questSlot = _EntityService:GetEntityByPath("/ui/LobbyUIGroup/QuestPanel/ScrollPanel/QuestScroll/Quest"..tostring(i))
						if questSlot == nil then
					
						else 
							questSlot.UIQuestSlot:SetQuestSlotState(tostring(arg[i]))
						end
					end
				end,
				Scope = 2,
				ExecSpace = 6,
				Attributes = {
				},
				Name = "SetAllQuestSlot"
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
					self.questDataSet = _DataService:GetTable("QuestDataSet")
					self.userItemDataSet = _DataService:GetTable("UserItemDataSet")
					self.storyMapInfoDataSet = _DataService:GetTable("StoryMapInfoDataSet")
					self.UDB = _DataStorageService:GetUserDataStorage(self.Entity.Name)
				end,
				Scope = 2,
				ExecSpace = 1,
				Attributes = {
				},
				Name = "OnBeginPlay"
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
						Name = "mapID"
					}
				},
				Code = function(mapID)
					-- [Story 모드 맵의 S랭크 퀘스트를 확인하는 함수]
					
					-- 퀘스트 번호 가져오기 
					local questID
					
					if mapID == "100" then questID = 2 
					elseif mapID == "101" then questID = 4
					elseif mapID == "102" then questID = 6
					elseif mapID == "103" then questID = 8
					elseif mapID == "104" then questID = 10
					elseif mapID == "105" then questID = 12
					elseif mapID == "106" then questID = 14
					elseif mapID == "107" then questID = 16
					end
					
					-- 기존 퀘스트 기록 확인하기
					local udbQuestState
					local callBack = function(errorcode,key,value)
						udbQuestState = tostring(value) 
					end
					self.UDB:GetAsync("Q"..tostring(questID), callBack)
					wait(0.5) -- Get에서 시간 좀 걸려서 udbQuestState에 확실히 값 들어가는거 확인하려면 기다려야함. 
					if udbQuestState == "0" then
						-- 0인 경우 (퀘스트 미완인경우)
						--완료처리함
						log("[퀘스트]S링크 퀘스트 need update")
						self.UDB:SetAsync("Q"..tostring(questID), "1", nil)	
					else 
						-- 1또는 2인경우 (이미 퀘스트 완료 또는 보상수령완료인경우) 
						--아무것도 안함
						log("[퀘스트] S링크 퀘스트 not need update")
						return 
					end
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "Check_SRankQuest"
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
						Name = "mapID"
					}
				},
				Code = function(mapID)
					-- [Story 모드 맵의 완주 퀘스트를 확인하는 함수]
					
					-- 퀘스트 번호 가져오기 
					local questID
					if mapID == "100" then questID = 1
					elseif mapID == "101" then questID = 3
					elseif mapID == "102" then questID = 5
					elseif mapID == "103" then questID = 7
					elseif mapID == "104" then questID = 9
					elseif mapID == "105" then questID = 11
					elseif mapID == "106" then questID = 13
					elseif mapID == "107" then questID = 15
					end
					
					-- 기존 퀘스트 기록 확인하기
					local udbQuestState
					local callBack = function(errorcode,key,value)
						udbQuestState = tostring(value) 
					end
					self.UDB:GetAsync("Q"..tostring(questID), callBack)
					
					wait(0.5) -- Get에서 시간 좀 걸려서 udbQuestState에 확실히 값 들어가는거 확인하려면 기다려야함. 
					
					-- 0인 경우 (퀘스트 미완인경우)
					if udbQuestState == "0" then
						-- 완료처리함
						log("[퀘스트]clear quest need update")
						self.UDB:SetAsync("Q"..tostring(questID), "1", nil)	
						
						-- 해금처리함
						local updateMapID = tonumber(mapID) + 1
						self.UDB:SetAsync("CurrClearStory", tostring(updateMapID), nil)	 
					-- 1또는 2인경우 (이미 퀘스트 완료 또는 보상수령완료인경우) 
					else 
						--아무것도 안함
						log("[퀘스트]not need update")
						return 
					end
				end,
				Scope = 2,
				ExecSpace = 0,
				Attributes = {
				},
				Name = "Check_StoryClearQuest"
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
						Name = "QID"
					}
				},
				Code = function(QID)
					local questID = tostring(QID)
					self:ChangeQuestState(questID)
				end,
				Scope = 2,
				ExecSpace = 6,
				Attributes = {
				},
				Name = "CompleteQuest"
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
						Name = "QID"
					}
				},
				Code = function(QID)
					self.UDB:SetAsync("Q"..QID, "2",nil)
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "ChangeQuestState"
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
						DefaultValue = "{}",
						SyncDirection = 0,
						Attributes = {
						},
						Name = "rewards"
					}
				},
				Code = function(rewards)
					-- [complete 버튼 누르면 퀘스트 보상 주는 함수 / UIQuestSlot에서 호출함.]
					
					local inventory = self.Entity.InventoryComponent
					if inventory == nil then return end
					
					--UserItemDataSet에 추가되어 있는 아이템들의 이름과 아이템 타입 명을 Table로 만들어 줍니다.
					for i = 1, 3, 1 do
						local itemIndex = tonumber(rewards[i])
						if itemIndex ~= 0 then
							local itemName = tostring(self.userItemDataSet:GetCell(rewards[i],"Name"))
							local itemType = self.userItemDataSet:GetCell(rewards[i],"Type")
						
							if itemType == "Chair" then
								_ItemService:CreateItem(Chair,itemName,inventory) 
							elseif itemType == "Ring" then
								_ItemService:CreateItem(Ring,itemName,inventory)
							elseif itemType == "Toy" then
								_ItemService:CreateItem(Toy,itemName,inventory)
							elseif itemType == "Pet" then
								_ItemService:CreateItem(Pet,itemName,inventory)
							elseif itemType == "DamageSkin" then
								_ItemService:CreateItem(DamageSkin,itemName,inventory)
							elseif itemType == "Title" then
								_ItemService:CreateItem(Title,itemName,inventory)
							end
						end
					end
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "GiveReward"
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
					-- UDB에서 currClearStory 가져오기 
					local currClearStory
					local callBack = function(errorcode,key,value)
						currClearStory = value
						
						local storyMapCnt = tonumber(self.storyMapInfoDataSet:GetRowCount())
						
						for i = 2,storyMapCnt,1 do
							--local mapID =  self.storyMapInfoDataSet:GetCell(i,"Id")
							--wait(0.3)
							local mapID = tostring(i + 98)
							self:LockStoryMap(currClearStory, storyMapCnt, mapID, self.Entity.PlayerComponent.UserId)
						end
					end
					self.UDB:GetAsync("CurrClearStory", callBack)
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "GetCurrClearStory"
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
						Name = "currClearStory"
					},
					{
						Type = "number",
						DefaultValue = "0",
						SyncDirection = 0,
						Attributes = {
						},
						Name = "storyMapCnt"
					},
					{
						Type = "string",
						DefaultValue = "",
						SyncDirection = 0,
						Attributes = {
						},
						Name = "mapID"
					}
				},
				Code = function(currClearStory, storyMapCnt, mapID)
					local storyMapSlot = _EntityService:GetEntityByPath("/ui/LobbyUIGroup/StoryMapPanel/Panel/StoryMapScroll/StoryMap"..mapID)
					if storyMapSlot == nil then
						log("can't find questSlot UI"..mapID)
					else 
						-- 해금 된 맵 
						if tonumber(mapID) <= tonumber(currClearStory) then
							storyMapSlot.UIStoryMapButton:SetStoryMapSlotState(0)
							
						-- 해금 안된 맵 
						else 
							storyMapSlot.UIStoryMapButton:SetStoryMapSlotState(1)
						end 
					end
				end,
				Scope = 2,
				ExecSpace = 6,
				Attributes = {
				},
				Name = "LockStoryMap"
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
						Name = "targetUser"
					}
				},
				Code = function(targetUser)
					if targetUser.Name ~= self.Entity.Name then return end
					
					-- battleClearCnt 가져오기 
					local questID = 0
					local battleClearCnt
					
					local battleClearCntFunc = function(errorcode,key,value)
						battleClearCnt = value
						log("퀘스트함수에서 읽어온 clear: "..tostring(value))
						if tonumber(battleClearCnt) == 10 then
							questID = 17
						elseif tonumber(battleClearCnt) == 25 then
							questID = 18
						elseif tonumber(battleClearCnt) == 50 then
							questID = 19
						end
						
						if questID ~= 0 then
							-- 기존 퀘스트 기록 확인하기
							local udbQuestState
							local questStateFunc = function(errorcode,key,value)
								udbQuestState = tostring(value) 
							end
							self.UDB:GetAsync("Q"..tostring(questID), questStateFunc)
							
							wait(1)
							
							if udbQuestState == "0" then
								-- 완료처리함
								log("[퀘스트] battle clear quest need update")
								self.UDB:SetAndWait("Q"..tostring(questID), "1", nil)	
								 
							-- 1또는 2인경우 (이미 퀘스트 완료 또는 보상수령완료인경우) 
							else 
								--아무것도 안함
								log("[퀘스트] battle clear not need update")
								return 
							end
						else
							log("[퀘스트]clear 업데이트할 퀘스트 없음")
						end
					end
					
					--  BattleClearCnt 값 찾기 
					self.UDB:GetAsync("BattleClearCnt", battleClearCntFunc)
					
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "Check_BattleClearQuest"
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
						Name = "targetUser"
					}
				},
				Code = function(targetUser)
					if targetUser.Name ~= self.Entity.Name then return end
					
					-- battleClearCnt 가져오기 
					local questID = 0 
					local battleWinCnt
					
						local battleWinCntFunc = function(errorcode,key,value)
						battleWinCnt = value
						log("퀘스트함수에서 읽어온 win: "..tostring(value))
						if tonumber(battleWinCnt) == 1 then
							questID = 20
						elseif tonumber(battleWinCnt) == 10 then
							questID = 21
						elseif tonumber(battleWinCnt) == 25 then
							questID = 22
						elseif tonumber(battleWinCnt) == 50 then
							questID = 23
						end
						
						if questID ~= 0 then
							-- 기존 퀘스트 기록 확인하기
							local udbQuestState
							local questStateFunc = function(errorcode,key,value)
								udbQuestState = tostring(value) 
							end
							self.UDB:GetAsync("Q"..tostring(questID), questStateFunc)
							
							wait(1)
							
							if udbQuestState == "0" then
								-- 완료처리함
								log("[퀘스트] battle win quest need update")
								self.UDB:SetAsync("Q"..tostring(questID), "1", nil)	
								 
							-- 1또는 2인경우 (이미 퀘스트 완료 또는 보상수령완료인경우) 
							else 
								--아무것도 안함
								log("[퀘스트] battle win not need update")
								return 
							end
						else
							log("[퀘스트]win 업데이트할 퀘스트 없음")
						end
					end
					
					self.UDB:GetAsync("BattleWinCnt",battleWinCntFunc) 
					
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "Check_BattleWinQuest"
			}
		},
		EntityEventHandlers = {
		}
	}
}

return unpackedContents