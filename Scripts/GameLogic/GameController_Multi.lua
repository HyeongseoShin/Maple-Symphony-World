unpackedContents = {
	uniqueIdentifier = "a3c1d16b407f4604951473fbe8341182",
	bundleIdentifier = "2c89a498317848aab9fe46cd70bf74bb",
	category = "codeblock",
	entryId = "7feea09e-0a52-40a9-bc79-a06a2ddf5bfb",
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
		Id = "7feea09e-0a52-40a9-bc79-a06a2ddf5bfb",
		Language = 1,
		Name = "GameController_Multi",
		Type = 1,
		Source = 0,
		Target = nil,
		ModifyTime = "2022-11-14T07:09:18.1539021+09:00",
		Properties = {
			{
				Type = "Entity",
				DefaultValue = "nil",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "noticePanel"
			},
			{
				Type = "Entity",
				DefaultValue = "nil",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "resultPanel"
			},
			{
				Type = "number",
				DefaultValue = "0",
				SyncDirection = 3,
				Attributes = {
				},
				Name = "endUserCnt"
			},
			{
				Type = "number",
				DefaultValue = "0",
				SyncDirection = 3,
				Attributes = {
				},
				Name = "enterUserCnt"
			},
			{
				Type = "number",
				DefaultValue = "0",
				SyncDirection = 3,
				Attributes = {
				},
				Name = "needUserCnt"
			},
			{
				Type = "Entity",
				DefaultValue = "nil",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "countDownPanel"
			},
			{
				Type = "string",
				DefaultValue = "",
				SyncDirection = 3,
				Attributes = {
				},
				Name = "winnerName"
			},
			{
				Type = "boolean",
				DefaultValue = "false",
				SyncDirection = 3,
				Attributes = {
				},
				Name = "isOneDead"
			},
			{
				Type = "number",
				DefaultValue = "0",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "delayTime_timer"
			},
			{
				Type = "number",
				DefaultValue = "0",
				SyncDirection = 3,
				Attributes = {
				},
				Name = "startTime_timer"
			},
			{
				Type = "boolean",
				DefaultValue = "false",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "isTimerStart"
			},
			{
				Type = "Entity",
				DefaultValue = "1baeab91-d38b-49f6-8290-ea4e0f167ed1",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "ReadyButton"
			},
			{
				Type = "number",
				DefaultValue = "0",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "Ready"
			},
			{
				Type = "boolean",
				DefaultValue = "false",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "IsClicked"
			},
			{
				Type = "boolean",
				DefaultValue = "false",
				SyncDirection = 3,
				Attributes = {
				},
				Name = "IsStart"
			},
			{
				Type = "Entity",
				DefaultValue = "f3f6816e-7939-41e8-8571-739d9311b613",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "MyNickNameTextComp"
			},
			{
				Type = "Entity",
				DefaultValue = "71215eb5-bbd6-41de-baf2-197e87591cd3",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "EnemyNameTextComp"
			},
			{
				Type = "Entity",
				DefaultValue = "156210c0-2167-43c6-a3f9-60e1f184d747",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "MyNickNameDisplay"
			},
			{
				Type = "Entity",
				DefaultValue = "e2b9d45a-ea49-482a-8513-3721178546ca",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "EnemyNameDisplay"
			},
			{
				Type = "dictionary",
				DefaultValue = "string|number",
				SyncDirection = 3,
				Attributes = {
				},
				Name = "BattleList"
			},
			{
				Type = "boolean",
				DefaultValue = "false",
				SyncDirection = 3,
				Attributes = {
				},
				Name = "CannotPlay"
			},
			{
				Type = "number",
				DefaultValue = "0",
				SyncDirection = 3,
				Attributes = {
				},
				Name = "timer"
			},
			{
				Type = "Component",
				DefaultValue = "d548d84b-4e96-41dc-956d-674edc972f90:TextComponent",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "CannotPlayTextComp"
			},
			{
				Type = "Entity",
				DefaultValue = "1369f0df-a634-4c5a-b651-539b91c06794",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "ReadyPanel"
			},
			{
				Type = "array",
				DefaultValue = "Entity",
				SyncDirection = 3,
				Attributes = {
				},
				Name = "playerList"
			},
			{
				Type = "Entity",
				DefaultValue = "nil",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "countDownPanel_ten"
			},
			{
				Type = "string",
				DefaultValue = "",
				SyncDirection = 3,
				Attributes = {
				},
				Name = "user1"
			},
			{
				Type = "string",
				DefaultValue = "",
				SyncDirection = 3,
				Attributes = {
				},
				Name = "user2"
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
				Arguments = nil,
				Code = function()
					-- [ 카운트 다운 전 ] 
						-- Ready 패널 키기
						self.ReadyPanel.Enable = false
						-- endUserCnt 초기화하기
						self.endUserCnt = 0
						-- 유저 움직임 끄기 필요없음.
						_UserService.LocalPlayer.MovementComponent.Enable = false
						-- 유저 gamestate 초기화 하기
						_UserService.LocalPlayer.PlayerGameState:InitializeGameState()
						-- notice panel 끄기  
						self.noticePanel.Enable = false
						-- 카운트 다운 시작
						self:StartCountDown()
					
					-- [ 카운트 다운 후 ] 
						-- 플레이어 움직임 허용
						_UserService.LocalPlayer.Player:PlayerInGameMap_setting() 
						-- 맵 노래 켜기 
						self.Entity.SoundComponent.Enable = true
						self.Entity.SongManager:musicStart()
				end,
				Scope = 2,
				ExecSpace = 6,
				Attributes = {
				},
				Name = "StartGame"
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
					self.noticePanel = _EntityService:GetEntityByPath("/ui/GameUIGroup/NoticePanel")
					self.resultPanel = _EntityService:GetEntityByPath("/ui/GameUIGroup/ResultPanel") 
					self.countDownPanel = _EntityService:GetEntityByPath("/ui/GameUIGroup/CountDown")
					self.countDownPanel_ten = _EntityService:GetEntityByPath("/ui/GameUIGroup/CountDown_ten")
					
					-- 노래 끄고 시작 
					self.Entity.SoundComponent.Enable = false
					
					-- notice 패널 키고 시작
					self.noticePanel.Enable = true
					
					-- result 패널 끄고 시작
					self.resultPanel.Enable = false 
					
					-- Ready 패널 키기
					self.ReadyPanel.Enable = true
					--ReadyButton.ButtonComponent.Enable = false
					
					-- Ready 적색 표시
					self.MyNickNameDisplay.SpriteGUIRendererComponent.Color = Color(1,0,0,1)
					-- NickName 표기
					self.MyNickNameTextComp.TextComponent.Text = _UserService.LocalPlayer.NameTagComponent.Name
					-- 서로 NickName 주고 받기
					self:ServerSendReady(0, _UserService.LocalPlayer.NameTagComponent.Name)
				end,
				Scope = 2,
				ExecSpace = 2,
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
						Name = "inUser"
					}
				},
				Code = function(inUser)
					self.enterUserCnt = self.enterUserCnt + 1
					
					if self.enterUserCnt == 1 then self.user1 = inUser
					elseif self.enterUserCnt == 2 then self.user2 = inUser
					end
					
					if self.enterUserCnt == self.needUserCnt then
						
						--wait(15)
						self.startTime_timer = os.clock()
						self.delayTime_timer = os.clock()
						
						self.isTimerStart = true 
						
						--self:StartGame()
					end
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "AddEnterUserCnt"
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
					self.countDownPanel:SetEnable(true)
					local numberSpriteDB = _DataService:GetTable("NumberSpriteData")
					_SoundService:PlaySound("406712d14b9243df820a58f63882a41b",1)
					for i = 3, 1, -1 do
						self.countDownPanel.SpriteGUIRendererComponent.ImageRUID = numberSpriteDB:GetCell(i,"RUID3")
						wait(0.6)	
						self.countDownPanel.SpriteGUIRendererComponent.ImageRUID = numberSpriteDB:GetCell(i,"RUID3-1")
						wait(0.4)
					end
					self.countDownPanel.SpriteGUIRendererComponent.ImageRUID = "b17fa006212f4de39fc323772c91844b" 
					wait(1)
					self.countDownPanel:SetEnable(false)
				end,
				Scope = 2,
				ExecSpace = 6,
				Attributes = {
				},
				Name = "StartCountDown"
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
					-- endUserCnt 업데이트하기 
					self.endUserCnt = self.endUserCnt + 1
					
					-- [ 1등으로 도착 ] 
					if self.endUserCnt == 1 then
							-- 1등 유저에게 가산점 부가 
							targetUser.PlayerGameState.extraScore = 100
							log("가산점!!!")
							-- 카운트 다운 시작
							self:OnEndCountDown()
						
					-- [ 2등으로 도착 ]
					elseif self.endUserCnt == 2 then
							targetUser.PlayerGameState.extraScore = 0
							--log("2등: " .. tostring(targetUser.PlayerGameState.leftNoteScore))endType
							-- 카운트 다운 끄기 
							self:OffEndCountDown()
							
							-- 배경음악 끄기 
							 self:OffBGM()
						
							-- 게임 오버 사운드 재생 
							self:OnGameOverSound()
							
							-- 게임오버 함수 실행 ( 승패 가리기 및 유저 돌려보내기 )
						log("[GOF] call AddEndUserCnt")
							self:GameOverFunction(3)
					end
					
					
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "AddEndUserCnt"
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
					-- 게임에서 한명이 먼저 도착하거나 죽었을 경우 10초 카운트 다운이 시작된다. 
					self.countDownPanel_ten:SetEnable(true)
					self.countDownPanel:SetEnable(true)
					local numberSpriteDB = _DataService:GetTable("NumberSpriteData")
					
					for i = 10, 1, -1 do
						self.countDownPanel.SpriteGUIRendererComponent.ImageRUID = numberSpriteDB:GetCell(i,"RUID3")
						wait(0.6)	
						--countDownImg.SpriteGUIRendererComponent.ImageRUID = numberSpriteDB:GetCell(i,"RUID3-1")
						wait(0.4)
						if i == 10 then
							self.countDownPanel_ten:SetEnable(false)
						end
					end
					self.countDownPanel.SpriteGUIRendererComponent.ImageRUID = "b17fa006212f4de39fc323772c91844b" 
					wait(1)
					self.countDownPanel:SetEnable(false)
					
					-- 카운트 다운 끝났으면 유저 남았는지 확인해보기 
					if self.endUserCnt == 1 then
						log("[GOF] call OnEndCountDown called by".._UserService.LocalPlayer.PlayerComponent.Nickname)
						self:GameOverFunction(0)
					end
				end,
				Scope = 2,
				ExecSpace = 6,
				Attributes = {
				},
				Name = "OnEndCountDown"
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
					self.countDownPanel.Enable = false
				end,
				Scope = 2,
				ExecSpace = 6,
				Attributes = {
				},
				Name = "OffEndCountDown"
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
					_SoundService:PlaySound("415afeeaf4714b78bfd66b92d4ff056a",0.5)
				end,
				Scope = 2,
				ExecSpace = 6,
				Attributes = {
				},
				Name = "OnGameOverSound"
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
					self.Entity.SoundComponent.Enable = false
				end,
				Scope = 2,
				ExecSpace = 6,
				Attributes = {
				},
				Name = "OffBGM"
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
						Name = "gameOverTyep"
					}
				},
				Code = function(gameOverTyep)
					local playerArray = _UserService:GetUsersByMapName(self.Entity.Name)
					-- 노래 끄기 
					
					
					-- 한명이 완주 못했거나 둘다 완주 못한상태로 게임 끝난 경우 
					if gameOverTyep == 0 then
						-- 모든 유저 움직임 멈추기  
						for index, player in pairs(playerArray) do
							player.PlayerUIController:OffNotePanel()
						end
					end
					
					-- 유저 다 가져오기, game over UI 띄우기
					local users = {}
					for index, player in pairs(playerArray) do
						users[index] = player
						self:OffBgm()
						player.PlayerUIController:OnGameEndStatePanel("종료")
					end
					
					self.playerList[1] = users[1]
					
					log("users.Count: "..tostring(#users))
					if #users == 1 then
						playerArray[1].PlayerGameState:SetMaxLoserCnt(1)
						if playerArray[1].PlayerGameState.isClear == true then
							playerArray[1].PlayerGameState:SetIsWinner(true, users[1].Name)
						else
							playerArray[1].PlayerGameState:SetIsWinner(false, users[1].Name)
							playerArray[1].PlayerGameState.coinScore = 0
							playerArray[1].PlayerGameState.noteScore = 0
							playerArray[1].PlayerGameState.leftNoteScore = 0
							playerArray[1].PlayerGameState.extraScore = 0
							playerArray[1].PlayerGameState.totalScore = 0
							log("졌어")
						end
					else 
						
						self.playerList[2] = users[2]
						
						
						-- 유저 승패 기록하기 / RankDB 업데이트 하기 
						local user1TotialScore = users[1].PlayerGameState.coinScore  + users[1].PlayerGameState.noteScore + users[1].PlayerGameState.extraScore + users[1].PlayerGameState.leftNoteScore * 10
						local user2TotialScore = users[2].PlayerGameState.coinScore  + users[2].PlayerGameState.noteScore + users[2].PlayerGameState.extraScore + users[2].PlayerGameState.leftNoteScore * 10
						local battleRankSDB = _DataStorageService:GetSortableDataStorage("BattleRankSDB")
						
						-- 2명 모두 완주일 때 점수 기준으로 승자 결정
						if users[1].PlayerGameState.isClear == true and users[2].PlayerGameState.isClear == true then
							if user1TotialScore >  user2TotialScore then
								users[1].PlayerGameState:SetIsWinner(true, users[1].Name)
								users[2].PlayerGameState:SetIsWinner(false, users[2].Name)
								--users[1].PlayerGameState.isWinner = true
								--users[2].PlayerGameState.isWinner = false	
								--local errorCode, value = battleRankSDB:IncreaseAndWait(users[1].PlayerComponent.Nickname, 1)
							
							elseif user1TotialScore == user2TotialScore then
								users[1].PlayerGameState:SetIsWinner(true, users[1].Name)
								users[2].PlayerGameState:SetIsWinner(true, users[2].Name)
								--users[1].PlayerGameState.isWinner = true
								--users[2].PlayerGameState.isWinner = true
								--local errorCode, value = battleRankSDB:IncreaseAndWait(users[1].PlayerComponent.Nickname, 1)
								--local errorCode2, value2 = battleRankSDB:IncreaseAndWait(users[2].PlayerComponent.Nickname, 1)
								
							elseif user1TotialScore < user2TotialScore then
								users[1].PlayerGameState:SetIsWinner(false, users[1].Name)
								users[2].PlayerGameState:SetIsWinner(true, users[2].Name)
								--users[1].PlayerGameState.isWinner = false
								--users[2].PlayerGameState.isWinner = true
								--local errorCode, value = battleRankSDB:IncreaseAndWait(users[2].PlayerComponent.Nickname, 1)
							end
						
						-- 둘 중 한 명만 완주인 경우 완주자만 승자
						elseif users[1].PlayerGameState.isClear == true then
							users[1].PlayerGameState:SetIsWinner(true, users[1].Name)
							users[2].PlayerGameState:SetIsWinner(false, users[2].Name)
							--users[1].PlayerGameState.isWinner = true
							--users[2].PlayerGameState.isWinner = false
							users[2].PlayerGameState.coinScore = 0
							users[2].PlayerGameState.noteScore = 0
							users[2].PlayerGameState.leftNoteScore = 0
							users[2].PlayerGameState.extraScore = 0
							users[2].PlayerGameState.totalScore = 0
						
						elseif users[2].PlayerGameState.isClear == true then
							--users[1].PlayerGameState.isWinner = false
							users[1].PlayerGameState:SetIsWinner(false, users[1].Name)
							users[1].PlayerGameState.coinScore = 0
							users[1].PlayerGameState.noteScore = 0
							users[1].PlayerGameState.leftNoteScore = 0
							users[1].PlayerGameState.extraScore = 0
							users[1].PlayerGameState.totalScore = 0
							
							--users[2].PlayerGameState.isWinner = true
							users[2].PlayerGameState:SetIsWinner(true, users[2].Name)
						
						-- 둘 다 미완주시 둘다 패배자
						else
							--users[1].PlayerGameState.isWinner = false
							users[1].PlayerGameState:SetIsWinner(false, users[1].Name)
							users[1].PlayerGameState.coinScore = 0
							users[1].PlayerGameState.noteScore = 0
							users[1].PlayerGameState.leftNoteScore = 0
							users[1].PlayerGameState.extraScore = 0
							users[1].PlayerGameState.totalScore = 0
							
							--users[2].PlayerGameState.isWinner = false
							users[2].PlayerGameState:SetIsWinner(false, users[2].Name)
							users[2].PlayerGameState.coinScore = 0
							users[2].PlayerGameState.noteScore = 0
							users[2].PlayerGameState.leftNoteScore = 0
							users[2].PlayerGameState.extraScore = 0
							users[2].PlayerGameState.totalScore = 0
							
							
						end
					end
					
					
					for index, player in pairs(playerArray) do
						-- 각 유저에게 Result Panel 띄우기 / BattleClearCnt UDB 업데이트하기 / BattleClearCnt 퀘스트 체크하기 / RankPanel 업데이트하기 
						log("GC_multi에서 실행!!!!"..player.PlayerComponent.Nickname.."("..index..")")
						player.PlayerGameState:EndGame_Multi_PlayerGameState(player.Name)
					end
					
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "GameOverFunction"
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
					self.Entity.SoundComponent.Enable = false
				end,
				Scope = 2,
				ExecSpace = 6,
				Attributes = {
				},
				Name = "OffBgm"
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
					
					if self.Ready == 2 and self.IsStart ~= true then
						log("Let's Fight")
						self:StartGame()
						self.IsStart = true
					end
					
					if self.Ready == 1 and self.CannotPlay ~= true then
						-- 20초 카운트 다운
						self:CountDown(delta)
					end
					
					if self.Ready == 0 and self.CannotPlay ~= true then
						-- 20초 카운트 다운
						self.timer = 0
					end
					
					--[[
					if self.isTimerStart then
						local currTime_timer = os.clock()
						local timer = currTime_timer - self.startTime_timer
						if timer > 5 then
							log("[GC] 게임 시작")
							self:StartGame()
							self.startTime_timer = 0 
							self.isTimerStart = false 
						end
						
					end
					--]]
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
				Arguments = {
					{
						Type = "number",
						DefaultValue = "0",
						SyncDirection = 0,
						Attributes = {
						},
						Name = "rd"
					},
					{
						Type = "string",
						DefaultValue = "",
						SyncDirection = 0,
						Attributes = {
						},
						Name = "name"
					}
				},
				Code = function(rd, name)
					self.Ready = self.Ready + rd
					self.BattleList[name] = rd
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "ServerSendReady"
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
					if name == "BattleList" then
						if value == self.BattleList then
							for name, rd in pairs(value) do
								if name ~= _UserService.LocalPlayer.NameTagComponent.Name then
									-- 적 NickName 표기	
									--ReadyButton.ButtonComponent.Enable = true
									self.EnemyNameTextComp.TextComponent.Text = name
										if rd == -1 or rd == 0 then
										self.ReadyButton.Enable = true
											-- Ready 적색 표시
											self.EnemyNameDisplay.SpriteGUIRendererComponent.Color = Color(1,0,0,1)
										elseif rd == 1 then
											-- Ready 녹색 표시
											self.EnemyNameDisplay.SpriteGUIRendererComponent.Color = Color(0,1,0,1)
										end
										
								end
							end
						end
					end
					
					if name == "IsStart" then
						if value == self.IsStart then
							if  self.IsStart == true then
								self:ReadyButtonOff()
							end
						end
					end
					
					if name == "CannotPlay" then
						if self.CannotPlay == self.CannotPlay and self.CannotPlay == true then
							-- Ready 녹색 표시
							self.EnemyNameDisplay.SpriteGUIRendererComponent.Color =  Color(0,1,0,1)
							-- Ready 녹색 표시
							self.MyNickNameDisplay.SpriteGUIRendererComponent.Color = Color(0,1,0,1)
							self:ReadyButtonOff()
						end
					end
					
					
					if name == "timer" then
						if self.timer == value then
							if math.floor(self.timer) == 0 then
								self.CannotPlayTextComp.Text = ""
							else
								self.CannotPlayTextComp.Text = tostring(math.floor(60 - self.timer)).."초 내에 자동 퇴장됩니다."
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
						Type = "number",
						DefaultValue = "0",
						SyncDirection = 0,
						Attributes = {
						},
						Name = "delta"
					}
				},
				Code = function(delta)
					
					self.timer = self.timer + delta
					
					if self.timer > 60 then
						-- 플레이어 두명을 나가게 한다.
						self.CannotPlay = true
						
						local Players = _UserService:GetUsersByMapName(self.Entity.CurrentMapName)
						for i, player in pairs(Players) do
							player.Player:SendBackToParent(player.Name)
						end
					
					end
					
				end,
				Scope = 2,
				ExecSpace = 1,
				Attributes = {
				},
				Name = "CountDown"
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
					self.ReadyButton.Visible = false
					self.ReadyButton.Enable = false
				end,
				Scope = 2,
				ExecSpace = 6,
				Attributes = {
				},
				Name = "ReadyButtonOff"
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
					
					if self.user1 ~= targetUser and self.user2 ~= targetUser then return end
					
					local playerArray = _UserService:GetUsersByMapName(self.Entity.Name)
					for index, player in pairs(playerArray) do
						player.PlayerGameState.isWinnerUpdateDone = true 
					end 
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "SetIsWinnerUpdateDone"
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
					
					if self.user1 ~= targetUser and self.user2 ~= targetUser then return end
					
					local playerArray = _UserService:GetUsersByMapName(self.Entity.Name)
					for index, player in pairs(playerArray) do
						player.PlayerGameState.loserCnt = player.PlayerGameState.loserCnt + 1 
					end 
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "AddLoserCnt"
			}
		},
		EntityEventHandlers = {
			{
				Name = "HandleButtonStateChangeEvent",
				EventName = "ButtonStateChangeEvent",
				Target = "entity:1baeab91-d38b-49f6-8290-ea4e0f167ed1",
				Code = function()
					-- Parameters
					local state = event.state
					--------------------------------------------------------
					if state == ButtonState.Clicked and self.Ready == 0 and self.IsClicked == false then
						log(_UserService.LocalPlayer.Name..": Get Ready for Next Battle")
						self:ServerSendReady(1, _UserService.LocalPlayer.NameTagComponent.Name)
						self.Ready = 1
						self.IsClicked = true
					
						-- Ready 녹색 표시
						self.MyNickNameDisplay.SpriteGUIRendererComponent.Color = Color(0,1,0,1)
						
					elseif state == ButtonState.Clicked and self.Ready == 1 and self.IsClicked == true then
						log(_UserService.LocalPlayer.Name..": Not Ready for Next Battle")
						self:ServerSendReady(-1, _UserService.LocalPlayer.NameTagComponent.Name)
						self.Ready = 0
						self.IsClicked = false
						
						-- Ready 적색 표시
						self.MyNickNameDisplay.SpriteGUIRendererComponent.Color = Color(1,0,0,1)
					end
				end,
				Scope = 0,
				ExecSpace = 0
			}
		}
	}
}

return unpackedContents