unpackedContents = {
	uniqueIdentifier = "58db78eccd284158822dc0d5d88dbe68",
	bundleIdentifier = "2c89a498317848aab9fe46cd70bf74bb",
	category = "codeblock",
	entryId = "cacb5e68-9973-40db-8e7b-139eb2076ef4",
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
		Id = "cacb5e68-9973-40db-8e7b-139eb2076ef4",
		Language = 1,
		Name = "PlayerGameState",
		Type = 1,
		Source = 0,
		Target = nil,
		ModifyTime = "2022-11-14T07:09:05.6976468+09:00",
		Properties = {
			{
				Type = "number",
				DefaultValue = "0",
				SyncDirection = 3,
				Attributes = {
				},
				Name = "coinScore"
			},
			{
				Type = "number",
				DefaultValue = "5",
				SyncDirection = 3,
				Attributes = {
				},
				Name = "rank"
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
				Type = "number",
				DefaultValue = "0",
				SyncDirection = 3,
				Attributes = {
				},
				Name = "noteScore"
			},
			{
				Type = "boolean",
				DefaultValue = "false",
				SyncDirection = 3,
				Attributes = {
				},
				Name = "isWinner"
			},
			{
				Type = "number",
				DefaultValue = "0",
				SyncDirection = 3,
				Attributes = {
				},
				Name = "playerWinScore"
			},
			{
				Type = "number",
				DefaultValue = "0",
				SyncDirection = 3,
				Attributes = {
				},
				Name = "leftNoteScore"
			},
			{
				Type = "number",
				DefaultValue = "0",
				SyncDirection = 3,
				Attributes = {
				},
				Name = "totalScore"
			},
			{
				Type = "number",
				DefaultValue = "0",
				SyncDirection = 3,
				Attributes = {
				},
				Name = "extraScore"
			},
			{
				Type = "boolean",
				DefaultValue = "false",
				SyncDirection = 3,
				Attributes = {
				},
				Name = "isClear"
			},
			{
				Type = "boolean",
				DefaultValue = "false",
				SyncDirection = 3,
				Attributes = {
				},
				Name = "isWinnerUpdateDone"
			},
			{
				Type = "dictionary",
				DefaultValue = "string|boolean",
				SyncDirection = 3,
				Attributes = {
				},
				Name = "isWinnerTable"
			},
			{
				Type = "number",
				DefaultValue = "0",
				SyncDirection = 3,
				Attributes = {
				},
				Name = "loserCnt"
			},
			{
				Type = "number",
				DefaultValue = "2",
				SyncDirection = 3,
				Attributes = {
				},
				Name = "maxLoserCnt"
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
						Name = "targetUserName"
					}
				},
				Code = function(targetUserName)
					if self.Entity.Name ~= targetUserName then return end
					
					if self.isClear == false then
						self.totalScore = 0
						self.extraScore = 0
						self.coinScore = 0
						self.noteScore = 0
						self.leftNoteScore = 0
					end
					
					--[플레이어가 맵을 완주한 경우: finish object와 충돌한 경우]
					
					-- note score계산하기 
					self:CalcNoteScore()
					wait(2)
					-- coin score 계산하기
					-- [UI띄우기]
						-- 완주 못한 경우 
						if self.rank == 1 or self.isClear == false then
							-- 페일 이팩트먼저 띄우기
							--self.Entity.PlayerUIController:OnGameEndEffectPanel(false,self.Entity.PlayerComponent.UserId)
							self.Entity.PlayerUIController:OnGameEndStatePanel("실패",self.Entity.PlayerComponent.UserId)
							-- 결과ui띄우기
							wait(6)
							self.Entity.PlayerUIController:OnResultPanel(self.Entity.PlayerComponent.UserId)
						-- 완주한 경우 
						else
							-- 클리어 이팩트먼저 띄우기
							--self.Entity.PlayerUIController:OnGameEndEffectPanel(true,self.Entity.PlayerComponent.UserId)
							self.Entity.PlayerUIController:OnGameEndStatePanel("완주",self.Entity.PlayerComponent.UserId)
							-- 결과ui띄우기	
							wait(6)
							self.Entity.PlayerUIController:OnResultPanel(self.Entity.PlayerComponent.UserId)
						end
					
					-- [퀘스트 체크]
						local currMapID
						local getDistMapId = function(errorcode,key,value)
							currMapID = value
							-- 완주 퀘스트 확인
							if self.rank ~= 1 then
								self.Entity.QuestController:Check_StoryClearQuest(tostring(value))
							end
							-- S랭크 퀘스트 확인
							if self.rank == 5 then
								self.Entity.QuestController:Check_SRankQuest(tostring(value))
							end 
						end
						self.UDB:GetAsync("DistMapId", getDistMapId)	
					
					-- [UDB에 랭킹 기록 (갱신시에만)]
						wait(0.5) -- Get하고나서 시간이 좀 걸림. 이때 기다려야지 currMapID에 값이 정확히 들어가서 밑에서 오류가 안생김. 
						local getSID_Rank = function(errorcode,key,value)
							local previousRank = tonumber(value)
							if self.rank > previousRank then
								self.UDB:SetAsync("Story"..tostring(currMapID), self.rank, nil)
								log("랭킹 갱신함 "..value.."->"..self.rank)
							else	
								log("랭킹 갱신 필요없음 "..value.."<-"..self.rank)
							end 
						end
						self.UDB:GetAsync("Story"..tostring(currMapID), getSID_Rank)
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "EndGame_Story_PlayerGameState"
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
					self.UDB = _DataStorageService:GetUserDataStorage(self.Entity.Name)
					self.isWinnerUpdateDone = false
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
				},
				Code = function()
					
					-- left note score 계산하기
					--self.Entity.CurrentMap.TimeValueCal:GetLeftNoteCount()
					self.totalScore = self.coinScore + self.noteScore + self.leftNoteScore * 10
					log("leftNoteScore In CalcNoteScore: "..tostring(self.leftNoteScore))
					_UserService.LocalPlayer.CurrentMap.ScoreManager:SetRankByTotalScore(self.totalScore)
				end,
				Scope = 2,
				ExecSpace = 6,
				Attributes = {
				},
				Name = "CalcNoteScore"
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
						Name = "score"
					}
				},
				Code = function(score)
					self.leftNoteScore = score
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "CalcLeftNoteScore"
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
						Name = "targetUser"
					}
				},
				Code = function(targetUser)
					if self.Entity.Name ~= targetUser then return end 
					
					-- BattleRankSDB에 업데이트 하기
					self:UpateBattleRankDataSet_SDB()
					wait(3)
					
					
					-- 승자인 경우 
					if self.isWinner then
						-- BattleWinCnt UDB 업데이트하기 
						self.totalScore = self.coinScore + self.noteScore + self.extraScore + self.leftNoteScore * 10
						self.Entity.PlayerUDBController:AddBattleWinCnt_UDB(self.Entity.PlayerComponent.UserId)
						wait(4)
						
						-- BattleWinCnt 퀘스트 체크하기
						self.Entity.QuestController:Check_BattleWinQuest(self.Entity)
						
						 
						wait(3)
						--self.isWinnerUpdateDone = true
						self.Entity.CurrentMap.GameController_Multi:SetIsWinnerUpdateDone(self.Entity.Name)
						
						
						--Result Panel 띄우기
						--self.Entity.PlayerUIController:OnResultPanel_Multi(true, self.Entity.PlayerComponent.UserId)
					
					-- 패자인 경우 
					else
						self.Entity.CurrentMap.GameController_Multi:AddLoserCnt(self.Entity.Name)
						--Result Panel 띄우기 
						--[[
						if (self.Entity.PlayerUIController == nil) then
							return
						end
						wait(8)
						self.Entity.PlayerUIController:OnResultPanel_Multi(false, self.Entity.PlayerComponent.UserId)
						log("[진사람] UI띄우러옴 "..self.Entity.PlayerComponent.Nickname)
						]]--
					end
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "EndGame_Multi_PlayerGameState"
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
					self.totalScore = 0
					self.coinScore = 0
					self.noteScore = 0
					self.leftNoteScore = 0
					self.rank = 5
					self.isWinner = false
					self.isClear = false
					self.extraScore = 0
					self.loserCnt = 0
					self.maxLoserCnt = 2
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "InitializeGameState"
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
					self.totalScore = self.noteScore + self.coinScore + self.extraScore + self.leftNoteScore * 10
					
					local battleRankSDB = _DataStorageService:GetSortableDataStorage("BattleRankSDB")
					local _,battleScore = battleRankSDB:GetAndWait(self.Entity.PlayerComponent.UserId)
					if battleScore == nil then
						battleScore = 0
					end
					battleScore = battleScore + self.totalScore
					-- SDB의 해당 유저 BattleWinScore : 0으로 초기화 
					battleRankSDB:SetAndWait(self.Entity.PlayerComponent.UserId, battleScore)
					local _,battleScore_new = battleRankSDB:GetAndWait(self.Entity.PlayerComponent.UserId)
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "UpateBattleRankDataSet_SDB"
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
					self.rank = 1
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "rankSetOne"
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
					local indi = _EntityService:GetEntityByPath("/ui/TutorialUIGroup/UIHelperSet/Tutorial_NotePanel")
						if indi == nil then log("못찾음") end 
						indi.Visible = false
				end,
				Scope = 2,
				ExecSpace = 6,
				Attributes = {
				},
				Name = "OffNotePanel"
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
						Name = "addScore"
					}
				},
				Code = function(addScore)
					self.noteScore = self.noteScore + addScore
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "GetNoteScore"
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
						Name = "addScore"
					}
				},
				Code = function(addScore)
					self.coinScore = self.coinScore + addScore
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "GetCoinScore"
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
						Name = "state"
					}
				},
				Code = function(state)
					self.isClear = state
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "SetisClear"
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
						Name = "rankNum"
					}
				},
				Code = function(rankNum)
					self.rank = rankNum
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "SetRank"
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
						Name = "name"
					},
					{
						Type = "any",
						DefaultValue = nil,
						SyncDirection = 0,
						Attributes = {
						},
						Name = "value"
					}
				},
				Code = function(name, value)
					if _UserService.LocalPlayer.Name == self.Entity.Name then
					
						if name == "isWinnerUpdateDone" then
							if self.isWinnerUpdateDone == value then
								if self.isWinnerUpdateDone == true then
									--log("결과 UI띄울거임 "..self.Entity.PlayerComponent.Nickname)
					
									self.Entity.PlayerUIController:OnResultPanel_Multi()
								end
							end
						end
						
						if name == "loserCnt" then
							if self.loserCnt == value then
								if self.loserCnt == self.maxLoserCnt then
						
									self.Entity.PlayerUIController:OnResultPanel_Multi()
									self:SetloserCntInit()
								end
							end
						end
					end 
				end,
				Scope = 2,
				ExecSpace = 2,
				Attributes = {
				},
				Name = "OnSyncProperty"
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
					if self.Entity.Name ~= targetUser then return end
					self.isWinner = arg
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "SetIsWinner"
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
					
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "InitIsWinnerTable"
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
					self.loserCnt = 0
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "SetloserCntInit"
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
						Name = "cnt"
					}
				},
				Code = function(cnt)
					self.maxLoserCnt = cnt
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "SetMaxLoserCnt"
			}
		},
		EntityEventHandlers = {
			{
				Name = "HandleKeyDownEvent",
				EventName = "KeyDownEvent",
				Target = "service:InputService",
				Code = function()
					-- Parameters
					local key = event.key
					--------------------------------------------------------
					if key == KeyboardKey.H then 
						--self:OffNotePanel()
					end
				end,
				Scope = 0,
				ExecSpace = 0
			}
		}
	}
}

return unpackedContents