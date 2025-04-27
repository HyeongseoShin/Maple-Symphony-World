unpackedContents = {
	uniqueIdentifier = "a34d1338839a445ea73633d4055bcdf4",
	bundleIdentifier = "2c89a498317848aab9fe46cd70bf74bb",
	category = "codeblock",
	entryId = "f9e791ba-04c9-479b-b480-3fc6f7f4872c",
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
		Id = "f9e791ba-04c9-479b-b480-3fc6f7f4872c",
		Language = 1,
		Name = "PlayerUDBController",
		Type = 1,
		Source = 0,
		Target = nil,
		ModifyTime = "2022-11-14T17:46:04.2588467+09:00",
		Properties = {
			{
				Type = "any",
				DefaultValue = "nil",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "storyMapInfoDB"
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
				Type = "string",
				DefaultValue = "CurrClearStory",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "CurrClearStory"
			},
			{
				Type = "string",
				DefaultValue = "BattleClearCnt",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "BattleClearCnt"
			},
			{
				Type = "string",
				DefaultValue = "CollaboClearCnt",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "CollaboClearCnt"
			},
			{
				Type = "string",
				DefaultValue = "IsFirstVisit",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "IsFirstVisit"
			},
			{
				Type = "string",
				DefaultValue = "DistMapId",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "DistMapId"
			},
			{
				Type = "any",
				DefaultValue = "nil",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "questDB"
			},
			{
				Type = "Entity",
				DefaultValue = "nil",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "questSlot"
			},
			{
				Type = "number",
				DefaultValue = "0",
				SyncDirection = 3,
				Attributes = {
				},
				Name = "WinCnt"
			},
			{
				Type = "string",
				DefaultValue = "BattleWinCnt",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "BattleWinCnt"
			},
			{
				Type = "string",
				DefaultValue = "1e08a7b6d3d64e4683da00996017d316",
				SyncDirection = 3,
				Attributes = {
				},
				Name = "currDamageSkin"
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
						Name = "selectMapID"
					}
				},
				Code = function(selectMapID)
					-- 유저의 selectMapId를 userDataStorage에 저장하기 
					local callBack = function(errorcode,key,value)
					end
					
					local userId = self.Entity.Name 
					local userDS = _DataStorageService:GetUserDataStorage(userId)
					userDS:SetAsync(self.DistMapId, selectMapID, nil) -- id저장
					userDS:GetAsync(self.DistMapId, callBack) -- 저장된거 확인 
				end,
				Scope = 2,
				ExecSpace = 1,
				Attributes = {
				},
				Name = "UpdateDistMapId_UDB"
			},
			{
				Return = {
					Type = "void",
					DefaultValue = "",
					SyncDirection = 0,
					Attributes = {
					},
					Name = nil
				},
				Arguments = nil,
				Code = function()
					local callBack = function(errorcode,key,value)
						
						-- GDB의 해당 유저 NickNameData : 현재 닉네임으로 설정
						--local nickNameData = _DataStorageService:GetGlobalDataStorage("nickNameDataGDB")
						--nickNameData:SetAndWait(self.Entity.PlayerComponent.UserId, self.Entity.PlayerComponent.Nickname)
						
						if value == "true" then
							-- 퀘스트 세팅 
							self.Entity.QuestController:WorldVisit_QuestSetting(false, self.Entity.PlayerComponent.UserId)
							--DamageSkin 노말로 세팅 
							self:SetDamageSkin_UDB("1e08a7b6d3d64e4683da00996017d316")
							-- skill skin 노말로 세팅 
						else 
							-- UDB 초기화
							self:InitializeUDB_UDB()
							
							-- quest test용 function
							--self:QuestTestFunction() 
							
							-- 퀘스트 세팅
							self.Entity.QuestController:WorldVisit_QuestSetting(true, self.Entity.PlayerComponent.UserId)
							
							-- 오프닝 보여주기
							self.Entity.PlayerUIController:StartOpening(self.Entity.PlayerComponent.UserId)
						end
						 
					end
					
					local userDS = _DataStorageService:GetUserDataStorage(self.Entity.Name)
					userDS:GetAsync(self.IsFirstVisit, callBack) -- 저장된거 확인
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "CheckIsFirstVisit_UDB"
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
						Name = "arg"
					}
				},
				Code = function(arg)
					local userId = self.Entity.Name 
					local userDS = _DataStorageService:GetUserDataStorage(userId)
					userDS:SetAsync(self.IsFirstVisit, arg, nil)
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "SetIsFirstVisit_UDB"
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
						Name = "arg"
					}
				},
				Code = function(arg)
					self.UDB:SetAsync(self.CurrClearStory, arg, nil)
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "SetCurrClearStory_UDB"
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
					self.UDB:SetAsync(self.BattleClearCnt, "0", nil)
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "SetBattleClearCnt_UDB"
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
						Name = "arg"
					}
				},
				Code = function(arg)
					self.UDB:SetAsync(self.CollaboClearCnt, arg, nil)
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "SetCollaboClearCnt_UDB"
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
						Name = "MapId"
					},
					{
						Type = "number",
						DefaultValue = "0",
						SyncDirection = 0,
						Attributes = {
						},
						Name = "Rank"
					}
				},
				Code = function(MapId, Rank)
					self.UDB:SetAsync("Story"..MapId, Rank, nil)
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "SetStoryID_UDB"
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
					-- 월드 첫 접속때만 실행됨
					
					-- 스킨 세팅
					self:SetSkin_UDB(self.Entity.Player.normalSkillSkin,self.Entity.Player.normalSkillSkin,self.Entity.Player.normalSkillSkin,self.Entity.Player.normalSkillSkin)
					
					--IsFirstVisit : true로 초기화 
					self:SetIsFirstVisit_UDB("true")
					
					--BattleClearCnt : 0으로 초기화
					self:SetBattleClearCnt_UDB()
					
					--BattleWinCnt : 0으로 초기화
					self:SetBattleWinCnt_UDB()
					
					--DamageSkin : 노말로 초기화
					self:SetDamageSkin_UDB("1e08a7b6d3d64e4683da00996017d316")
					
					--CollaboClearCnt : 0으로 초기화
					self:SetCollaboClearCnt_UDB("0")
					
					--CurrClearStory : 100으로 초기화
					self:SetCurrClearStory_UDB("100")
					
					-- SDB의 해당 유저 BattleWinScore : 0으로 초기화 
					local battleRankSDB = _DataStorageService:GetSortableDataStorage("BattleRankSDB")
					battleRankSDB:SetAndWait(self.Entity.PlayerComponent.UserId, 0)
					
					--Story(ID) : F로 초기화
					local storyMapCnt = self.storyMapInfoDB:GetRowCount()
					for i=1,storyMapCnt,1 do
						local mapId = self.storyMapInfoDB:GetCell(i, "Id")
						self:SetStoryID_UDB(mapId, 1)
					end
					
					--Q(ID): 0으로 초기화 
					local questCnt = self.questDB:GetRowCount()
					for i = 1, questCnt, 1 do
						self:SetQID_UDB(i, 0)
					end
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "InitializeUDB_UDB"
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
					self.storyMapInfoDB = _DataService:GetTable("StoryMapInfoDataSet")
					self.questDB = _DataService:GetTable("QuestDataSet")
					local userId = self.Entity.Name 
					self.UDB = _DataStorageService:GetUserDataStorage(userId)
					
					-- [ 출시 전 삭제해야함. ]
					if self.Entity.CurrentMap.Name == "Lobby" then
						self:SetSkin_UDB(self.Entity.Player.normalSkillSkin,self.Entity.Player.normalSkillSkin,self.Entity.Player.normalSkillSkin,self.Entity.Player.normalSkillSkin)
					end
					
					-- [ 출시 전 삭제해야함. ]
					if self.Entity.CurrentMap.Name == "Ins100" then
						self:SetSkin_UDB(self.Entity.Player.normalSkillSkin,self.Entity.Player.normalSkillSkin,self.Entity.Player.normalSkillSkin,self.Entity.Player.normalSkillSkin)
					end
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
				Arguments = nil,
				Code = function()
					-- [월드 첫 접속시 퀘스트 완료가 표시되는지 체크하기 위한 함수/ GetFirstVisit함수에서 호출함.]
					
					self:SetQID_UDB(17,1)
					self:SetQID_UDB(18,1)
					
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "QuestTestFunction"
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
						Name = "Qnum"
					},
					{
						Type = "number",
						DefaultValue = "0",
						SyncDirection = 0,
						Attributes = {
						},
						Name = "state"
					}
				},
				Code = function(Qnum, state)
					-- UDB 값 바꿔주기
					self.UDB:SetAsync("Q"..tostring(Qnum), tostring(state), nil)
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "SetQID_UDB"
			},
			{
				Return = {
					Type = "string",
					DefaultValue = "",
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
						Name = "ID"
					}
				},
				Code = function(ID)
					local state
					local callBack = function(errorcode,key,value)
						log("[Get in UDB]"..ID..":"..value)
						state = value 
					end
					self.UDB:GetAsync("Q"..ID, callBack)
					return state
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "GetQID_UDB"
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
						Name = "upEffect"
					},
					{
						Type = "string",
						DefaultValue = "",
						SyncDirection = 0,
						Attributes = {
						},
						Name = "downEffect"
					},
					{
						Type = "string",
						DefaultValue = "",
						SyncDirection = 0,
						Attributes = {
						},
						Name = "frontEffect"
					},
					{
						Type = "string",
						DefaultValue = "",
						SyncDirection = 0,
						Attributes = {
						},
						Name = "stopEffect"
					}
				},
				Code = function(upEffect, downEffect, frontEffect, stopEffect)
					self.UDB:SetAsync("UpEffect", upEffect, nil)
					self.UDB:SetAsync("DownEffect", downEffect, nil)
					self.UDB:SetAsync("FrontEffect", frontEffect, nil)
					self.UDB:SetAsync("StopEffect", stopEffect, nil)
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "SetSkin_UDB"
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
					local up
					local down
					local front
					local stop
					
					local getUpFunc = function(errorcode,key,value)
						up = value 
					end
					self.UDB:GetAsync("UpEffect", getUpFunc)
					local getDownFunc = function(errorcode,key,value)
						down = value 
					end
					self.UDB:GetAsync("DownEffect", getDownFunc)
					local getFrontFunc = function(errorcode,key,value)
						front = value 
					end
					self.UDB:GetAsync("FrontEffect", getFrontFunc)
					local getStopFunc = function(errorcode,key,value)
						stop = value 
					end
					self.UDB:GetAsync("StopEffect", getStopFunc)
					
					wait(1)
					self.Entity.Player:UpdateGameSkin_client(up,down,front,stop)
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "UpdateGameSkin_server"
			},
			{
				Return = {
					Type = "void",
					DefaultValue = "",
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
						Name = "targetUserName"
					}
				},
				Code = function(targetUserName)
					if targetUserName ~= self.Entity.Name then return end 
					
					local prevBattleCnt = 1
					local callBack = function(errorcode,key,value)
						prevBattleCnt = prevBattleCnt + tonumber(value)
					end
					self.UDB:GetAsync(self.BattleClearCnt, callBack) 
					wait(1)
					self.UDB:SetAsync(self.BattleClearCnt, prevBattleCnt, nil)
					log("ClearCnt UDB +1 "..self.Entity.PlayerComponent.Nickname)
					wait(2)
					self.Entity.QuestController:Check_BattleClearQuest(self.Entity)
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "AddBattleClearCnt_UDB"
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
						Name = "targetUserName"
					}
				},
				Code = function(targetUserName)
					if targetUserName ~= self.Entity.Name then return end 
					
					local prevBattleWinCnt = 1
					local callBack = function(errorcode,key,value)
						prevBattleWinCnt = prevBattleWinCnt + tonumber(value)
					end
					self.UDB:GetAsync(self.BattleWinCnt, callBack) 
					wait(1)
					self.UDB:SetAsync(self.BattleWinCnt, prevBattleWinCnt, nil)
					wait(1)
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "AddBattleWinCnt_UDB"
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
					self.UDB:SetAsync(self.BattleWinCnt, "0", nil)
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "SetBattleWinCnt_UDB"
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
						Name = "damageSkin"
					}
				},
				Code = function(damageSkin)
					self.UDB:SetAsync("DamageSkin", damageSkin, nil)
					log("뎀스 저장함 UDB에 "..damageSkin)
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "SetDamageSkin_UDB"
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
					local callBack = function(errorcode,key,value)
						self.currDamageSkin = value 
						log("뎀스 가져옴 "..value)
					end
					self.UDB:GetAsync("DamageSkin", callBack)
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "GetDamageSkin_UDB"
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
					-- 배틀 퀘스트 테스트용 함수이다. BattleQuestInitButton UI의 컴포넌트이다. 
					log("퀘스트 UDB 초기화")
					-- UDB의 BattleWinCnt 0으로 초기화
					self:SetBattleWinCnt_UDB()
					
					-- UDB의 BattleClearCnt 0으로 초기화
					self:SetBattleClearCnt_UDB("0")
					
					-- UDB의 BattleClearCnt 0으로 초기화
					self:SetCurrClearStory_UDB("100")
					
					-- UDB의 배틀 퀘스트 상태 0으로 초기화 
					for i= 1,23,1 do
						self:SetQID_UDB(i,0)
					end
					
					self.Entity.QuestController:WorldVisit_QuestSetting(false, self.Entity.PlayerComponent.UserId)
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "Test_BattleQuestInit"
			}
		},
		EntityEventHandlers = {
		}
	}
}

return unpackedContents