unpackedContents = {
	uniqueIdentifier = "495d7198737a45fc9f117e1988e5a715",
	bundleIdentifier = "2c89a498317848aab9fe46cd70bf74bb",
	category = "codeblock",
	entryId = "7701b88b-4310-4654-b3aa-d56d1bd594dd",
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
		Id = "7701b88b-4310-4654-b3aa-d56d1bd594dd",
		Language = 1,
		Name = "PlayerUIController",
		Type = 1,
		Source = 0,
		Target = nil,
		ModifyTime = "2022-11-14T07:08:56.2341858+09:00",
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
				Name = "noticePanelImg"
			},
			{
				Type = "Entity",
				DefaultValue = "nil",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "rankScroll"
			},
			{
				Type = "number",
				DefaultValue = "0",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "userIndex"
			},
			{
				Type = "Entity",
				DefaultValue = "nil",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "coinScoreText"
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
				Type = "Entity",
				DefaultValue = "d311bb18-5d93-4e37-8574-799250719b56",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "partyCancelNoticePanel"
			},
			{
				Type = "Entity",
				DefaultValue = "f45756e9-5b81-4f3b-964e-1c0be7a5abdd",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "partyDestoryNoticePanel"
			},
			{
				Type = "Entity",
				DefaultValue = "d9478a17-6935-46db-9255-53160ed3f469",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "StoryStarImg5"
			},
			{
				Type = "Entity",
				DefaultValue = "1033c093-5595-421c-844a-7e6bad530463",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "StoryStarImg4"
			},
			{
				Type = "Entity",
				DefaultValue = "08e83269-96b4-448b-b8bf-8f97425eeeed",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "StoryStarImg3"
			},
			{
				Type = "Entity",
				DefaultValue = "d3864b52-0d0c-4ace-9635-3109f2e469a8",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "StoryStarImg2"
			},
			{
				Type = "Entity",
				DefaultValue = "a3239e39-c341-4e97-ad13-4ea8e3265033",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "StoryStarImg1"
			},
			{
				Type = "Entity",
				DefaultValue = "35473cab-9b87-4e79-9247-c7096fb074b4",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "MultiStarImg5"
			},
			{
				Type = "Entity",
				DefaultValue = "d18dfc9f-0779-4722-b1e2-3dda6c8393aa",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "MultiStarImg1"
			},
			{
				Type = "Entity",
				DefaultValue = "8045a6db-6635-47e3-b3b5-42499e6e7b3b",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "partyRegistrationPanel"
			},
			{
				Type = "Entity",
				DefaultValue = "a613b62b-9787-4409-9bdd-a8266d452795",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "partyDestoryNoticePanel2"
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
						Type = "any",
						DefaultValue = nil,
						SyncDirection = 0,
						Attributes = {
						},
						Name = "enteredMap"
					}
				},
				Code = function(enteredMap)
					if string.find(enteredMap.Name, "Ins") == nil then
						
						if enteredMap.Name == "Lobby" then
							-- lobby ui 켜기 
							wait(0.5) -- 이게 없으면 밑에 다 함수 안불림.. 왜그런지 모르겠어.. (이거 onmapenter를 클라로 하든 서버로 하든 필요함)
							self:SetGameUIGroup(false)
							self:SetLobbyUIGroup(true)
							self:SetLoadingUIGroup(false)
							self:SetTutorialUIGroup(false)
							self:SetMapTitle("음유시인의 기록관")
					
							
						elseif enteredMap.Name == "RankMap" then 
							wait(0.5)-- 이게 없으면 밑에 다 함수 안불림.. 왜그런지 모르겠어.. 
							self:SetGameUIGroup(false)
							self:SetLobbyUIGroup(true)
							self:SetLoadingUIGroup(false)
							self:SetTutorialUIGroup(false)
							self:SetMapTitle("명예의 전당 & 잊혀진 정원")
							-- UI정리하기
							self:OffWaitingPanel() -- 대기열 UI
							
						elseif enteredMap.Name == "A_lodding" then
							wait(0.5)-- 이게 없으면 밑에 다 함수 안불림.. 왜그런지 모르겠어.. 
							-- loading ui 켜기 
							self:SetGameUIGroup(false)
							self:SetLobbyUIGroup(false)
							self:SetLoadingUIGroup(true)
							self:SetTutorialUIGroup(false)
						end
					else
						if enteredMap.Name == "Ins199" then
							wait(0.5)-- 이게 없으면 밑에 다 함수 안불림.. 왜그런지 모르겠어.. 
							-- tutorial ui 켜기 
							self:SetGameUIGroup(false)
							self:SetLobbyUIGroup(false)
							self:SetLoadingUIGroup(false)
							self:SetTutorialUIGroup(true)
							enteredMap.TutorialController:StartTutorialOpening()
						else 
							wait(0.5)-- 이게 없으면 밑에 다 함수 안불림.. 왜그런지 모르겠어.. 
							-- game ui 켜기 
							self:SetGameUIGroup(true)
							self:SetLobbyUIGroup(false)
							self:SetLoadingUIGroup(false)
							self:SetTutorialUIGroup(false)
						end
						
					end
				end,
				Scope = 2,
				ExecSpace = 2,
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
						Type = "boolean",
						DefaultValue = nil,
						SyncDirection = 0,
						Attributes = {
						},
						Name = "arg"
					}
				},
				Code = function(arg)
					if self.Entity ~= _UserService.LocalPlayer then return end
					local UIGroup = _EntityService:GetEntityByPath("/ui/LobbyUIGroup")
					UIGroup:SetEnable(arg)
				end,
				Scope = 2,
				ExecSpace = 6,
				Attributes = {
				},
				Name = "SetLobbyUIGroup"
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
					}
				},
				Code = function(arg)
					if self.Entity ~= _UserService.LocalPlayer then return end
					local UIGroup = _EntityService:GetEntityByPath("/ui/GameUIGroup")
					UIGroup:SetEnable(arg)
					
					if arg == true then
						self.Entity.ActionManager.curr_2 = _EntityService:GetEntityByPath("/ui/GameUIGroup/ActionCntPanel/CurrActionCntPanel/Curr_2")
						self.Entity.ActionManager.curr_1 = _EntityService:GetEntityByPath("/ui/GameUIGroup/ActionCntPanel/CurrActionCntPanel/Curr_1")
						self.Entity.ActionManager.curr_0 = _EntityService:GetEntityByPath("/ui/GameUIGroup/ActionCntPanel/CurrActionCntPanel/Curr_0")
						
						self.coinScoreText = _EntityService:GetEntityByPath("/ui/GameUIGroup/CoinScorePanel/Score")
						
						self.Entity.ActionManager:NumberToAnim(0)
					end
					
				end,
				Scope = 2,
				ExecSpace = 6,
				Attributes = {
				},
				Name = "SetGameUIGroup"
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
					}
				},
				Code = function(arg)
					if self.Entity ~= _UserService.LocalPlayer then return end
					local UIGroup = _EntityService:GetEntityByPath("/ui/LoddingUIGroup")
					UIGroup:SetEnable(arg)
				end,
				Scope = 2,
				ExecSpace = 6,
				Attributes = {
				},
				Name = "SetLoadingUIGroup"
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
						Name = "mapTitle"
					}
				},
				Code = function(mapTitle)
					if self.Entity ~= _UserService.LocalPlayer then return end
					--log("맵 타이틀")
					local MapTitle = _EntityService:GetEntityByPath("/ui/DefaultGroup/MapTitlePanel")
					local SubText = _EntityService:GetEntityByPath("/ui/DefaultGroup/MapTitlePanel/SubText")
					local TitleText = _EntityService:GetEntityByPath("/ui/DefaultGroup/MapTitlePanel/TitleText")
					TitleText.TextComponent.Text = mapTitle
					local ColorA = 0
					MapTitle.SpriteGUIRendererComponent.Color.a = ColorA
					MapTitle:SetEnable(true)
					
					-- 페이드 인
					for i=0,100 do
						wait(0.01)
						MapTitle.SpriteGUIRendererComponent.Color.a = ColorA
						SubText.TextComponent.FontColor.a = ColorA
						TitleText.TextComponent.FontColor.a = ColorA
						ColorA = ColorA + 0.01
					end
					
					wait(3)
					
					-- 페이드 아웃 
					for i=0,100 do
						wait(0.01)
						MapTitle.SpriteGUIRendererComponent.Color.a = ColorA
						SubText.TextComponent.FontColor.a = ColorA
						TitleText.TextComponent.FontColor.a = ColorA
						ColorA = ColorA - 0.01
					end
					MapTitle:SetEnable(false)
				end,
				Scope = 2,
				ExecSpace = 6,
				Attributes = {
				},
				Name = "SetMapTitle"
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
					if self.Entity ~= _UserService.LocalPlayer then return end
					-- 오프닝 재생 후 없애기 
					local UIGroup = _EntityService:GetEntityByPath("/ui/LobbyUIGroup/OpeningPanel")
					UIGroup:SetEnable(true)
					UIGroup.UIOpeningPanel:StartOpening()
				end,
				Scope = 2,
				ExecSpace = 6,
				Attributes = {
				},
				Name = "StartOpening"
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
					if self.Entity ~= _UserService.LocalPlayer then return end
					-- rankMap 들어갈때 대기열 waiting 켜져있으면 끄는 함수. 
					local waitingPanel = _EntityService:GetEntityByPath("/ui/LobbyUIGroup/WaitingPanel")
					waitingPanel:SetEnable(false)
				end,
				Scope = 2,
				ExecSpace = 6,
				Attributes = {
				},
				Name = "OffWaitingPanel"
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
					local UIGroup = _EntityService:GetEntityByPath("/ui/LobbyUIGroup/OpeningPanel")
					UIGroup:SetEnable(false)
				end,
				Scope = 2,
				ExecSpace = 6,
				Attributes = {
				},
				Name = "EndOpening"
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
					local normalEffect = _EntityService:GetEntityByPath("/ui/GameUIGroup/NotePanel/Effect")
					normalEffect.SpriteGUIRendererComponent.ImageRUID = "044ec07f78904bf5b3088aa4dbaa921b"
				end,
				Scope = 2,
				ExecSpace = 6,
				Attributes = {
				},
				Name = "PerfectEffect"
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
					local stateText = _EntityService:GetEntityByPath("/ui/GameUIGroup/StateText")
					stateText.TextComponent.Text = arg
					stateText:SetEnable(true)
				end,
				Scope = 2,
				ExecSpace = 6,
				Attributes = {
				},
				Name = "SetStateText"
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
					local NotePanel = _EntityService:GetEntityByPath("/ui/GameUIGroup/NotePanel")
					NotePanel:SetEnable(false)
				end,
				Scope = 2,
				ExecSpace = 6,
				Attributes = {
				},
				Name = "OffIndicator"
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
					local resultPanel = _EntityService:GetEntityByPath("/ui/GameUIGroup/ResultPanel")
					local coinScoreText = _EntityService:GetEntityByPath("/ui/GameUIGroup/ResultPanel/CoinScorePanel/Score")
					local noteScoreText = _EntityService:GetEntityByPath("/ui/GameUIGroup/ResultPanel/NoteScorePanel/Score")
					local leftNoteScoreText = _EntityService:GetEntityByPath("/ui/GameUIGroup/ResultPanel/LeftNoteScorePanel/Score")
					local totalScoreText = _EntityService:GetEntityByPath("/ui/GameUIGroup/ResultPanel/TotalScorePanel/Score")
					local rankText = _EntityService:GetEntityByPath("/ui/GameUIGroup/ResultPanel/RankPanel/RankText")
					--local rankImg = _EntityService:GetEntityByPath("/ui/GameUIGroup/ResultPanel/RankPanel/RankStar")
					
					-- 플레이 결과UI세팅 
						coinScoreText.TextComponent.Text = tostring(math.floor(self.Entity.PlayerGameState.coinScore))
						noteScoreText.TextComponent.Text = tostring(math.floor(self.Entity.PlayerGameState.noteScore))
						log("남은 노트수: "..tostring(self.Entity.PlayerGameState.leftNoteScore))
						leftNoteScoreText.TextComponent.Text = tostring(math.floor(self.Entity.PlayerGameState.leftNoteScore))
						totalScoreText.TextComponent.Text = tostring(math.floor(self.Entity.PlayerGameState.noteScore + self.Entity.PlayerGameState.coinScore + self.Entity.PlayerGameState.leftNoteScore * 10))
						if self.Entity.PlayerGameState.rank == 1 then 
							rankText.TextComponent.Text = "F"
							--rankImg.UITransformComponent.Scale = Vector3(100,88,99)
							--rankImg.SpriteGUIRendererComponent.ImageRUID = "1ff435ee96a343bdb4163e10b7c7ee54"
							self.StoryStarImg5.Enable = false
							self.StoryStarImg4.Enable = false
							self.StoryStarImg3.Enable = false
							self.StoryStarImg2.Enable = false
							self.StoryStarImg1.Enable = true
						elseif self.Entity.PlayerGameState.rank == 2 then 
							rankText.TextComponent.Text = "C"
							self.StoryStarImg5.Enable = false
							self.StoryStarImg4.Enable = false
							self.StoryStarImg3.Enable = false
							self.StoryStarImg2.Enable = true
							self.StoryStarImg1.Enable = false
							--rankImg.UITransformComponent.Scale = Vector3(153,60,99)
							--rankImg.SpriteGUIRendererComponent.ImageRUID = "48dbfab4628348c481cc9be71a06f60c"
						elseif self.Entity.PlayerGameState.rank == 3 then 
							rankText.TextComponent.Text = "B"
							--rankImg.UITransformComponent.Scale = Vector3(166,88,99)
							--rankImg.SpriteGUIRendererComponent.ImageRUID = "96117a1879814874a66f4698fdff76ba"
							self.StoryStarImg5.Enable = false
							self.StoryStarImg4.Enable = false
							self.StoryStarImg3.Enable = true
							self.StoryStarImg2.Enable = false
							self.StoryStarImg1.Enable = false
						elseif self.Entity.PlayerGameState.rank == 4 then 
							rankText.TextComponent.Text = "A"
							--rankImg.UITransformComponent.Scale = Vector3(186,99,99)
							--rankImg.SpriteGUIRendererComponent.ImageRUID = "2a7236d6e9e1448dabf7b3b9515b513e"
							self.StoryStarImg5.Enable = false
							self.StoryStarImg4.Enable = true
							self.StoryStarImg3.Enable = false
							self.StoryStarImg2.Enable = false
							self.StoryStarImg1.Enable = false
						elseif self.Entity.PlayerGameState.rank == 5 then 
							rankText.TextComponent.Text = "S"
							--rankImg.UITransformComponent.Scale = Vector3(294,203,99)
							--rankImg.SpriteGUIRendererComponent.ImageRUID = "1ed3582e047741ad932c4c94eef1043b"
							self.StoryStarImg5.Enable = true
							self.StoryStarImg4.Enable = false
							self.StoryStarImg3.Enable = false
							self.StoryStarImg2.Enable = false
							self.StoryStarImg1.Enable = false
						end
						
					-- 플레이어 결과 UI보여주기
					resultPanel.Enable = true
				end,
				Scope = 2,
				ExecSpace = 6,
				Attributes = {
				},
				Name = "OnResultPanel"
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
						Name = "isClear"
					}
				},
				Code = function(isClear)
					local gameEndEffectpanel = _EntityService:GetEntityByPath("/ui/GameUIGroup/GameEndEffectPanel")
					local clearImg = _EntityService:GetEntityByPath("/ui/GameUIGroup/GameEndEffectPanel/ClearText")
					local failImg = _EntityService:GetEntityByPath("/ui/GameUIGroup/GameEndEffectPanel/FailText")
					
					--완주한 경우
					if isClear then
						-- Clear이팩트 띄우기
						gameEndEffectpanel.Enable = true
						clearImg.Visible = true
						failImg.Visible = false
						
					--완주 못한 경우
					else
						-- Fail이팩트 띄우기
						gameEndEffectpanel.Enable = true
						clearImg.Visible = false
						failImg.Visible = true
					
					end
					
					-- GameEndEffectPanel 끄기 
					wait(5)
					gameEndEffectpanel.Enable = false
				end,
				Scope = 2,
				ExecSpace = 6,
				Attributes = {
				},
				Name = "OnGameEndEffectPanel"
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
						Name = "coinScore"
					}
				},
				Code = function(coinScore)
					self.coinScoreText.TextComponent.Text = tostring(math.floor(coinScore))
				end,
				Scope = 2,
				ExecSpace = 2,
				Attributes = {
				},
				Name = "SetCoinScore"
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
						Name = "iconRUID"
					}
				},
				Code = function(iconRUID)
					if self.Entity ~= _UserService.LocalPlayer then return end
					
					self.noticePanel.Enable = true
					self.noticePanelImg.SpriteGUIRendererComponent.ImageRUID = iconRUID
					wait(10)
					self.noticePanel.Enable = false 
				end,
				Scope = 2,
				ExecSpace = 6,
				Attributes = {
				},
				Name = "OnItemGetNoticePanel"
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
					self.noticePanel = _EntityService:GetEntityByPath("/ui/LobbyUIGroup/NoticePanel")
					self.noticePanelImg = _EntityService:GetEntityByPath("/ui/LobbyUIGroup/NoticePanel/ItemIcon")
					self.rankScroll = _EntityService:GetEntityByPath("/ui/LobbyUIGroup/RankPanel/RankScroll")
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
						Type = "boolean",
						DefaultValue = nil,
						SyncDirection = 0,
						Attributes = {
						},
						Name = "arg"
					}
				},
				Code = function(arg)
					if self.Entity ~= _UserService.LocalPlayer then return end
					local UIGroup = _EntityService:GetEntityByPath("/ui/TutorialUIGroup")
					UIGroup:SetEnable(arg)
					
					if arg == true then
						self.Entity.ActionManager.curr_2 = _EntityService:GetEntityByPath("/ui/TutorialUIGroup/UIHelperSet/Tutorial_ActionCntPanel/CurrActionCntPanel/Curr_2")
						self.Entity.ActionManager.curr_1 = _EntityService:GetEntityByPath("/ui/TutorialUIGroup/UIHelperSet/Tutorial_ActionCntPanel/CurrActionCntPanel/Curr_1")
						self.Entity.ActionManager.curr_0 = _EntityService:GetEntityByPath("/ui/TutorialUIGroup/UIHelperSet/Tutorial_ActionCntPanel/CurrActionCntPanel/Curr_0")
						self.Entity.ActionManager:NumberToAnim(0)
						
						self.coinScoreText = _EntityService:GetEntityByPath("/ui/TutorialUIGroup/UIHelperSet/Tutorial_CoinScorePanel/Score")
					end
					
				end,
				Scope = 2,
				ExecSpace = 6,
				Attributes = {
				},
				Name = "SetTutorialUIGroup"
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
						Name = "type"
					}
				},
				Code = function(type)
					local endStatePanel = _EntityService:GetEntityByPath("/ui/GameUIGroup/GameEndStatePanel")
					local endStateImage = _EntityService:GetEntityByPath("/ui/GameUIGroup/GameEndStateImage")
					
					if type == "완주" then
						endStatePanel.TextComponent.Text = "Clear!"
						endStateImage.SpriteGUIRendererComponent.ImageRUID = "39432c8be9c9468d849253886087011d"
					elseif type == "실패" then
						endStatePanel.TextComponent.Text = "Fail"
						endStateImage.SpriteGUIRendererComponent.ImageRUID = "321903bef642468d8ad8e8e2f7c8b187"
					elseif type == "종료" then
						endStatePanel.TextComponent.Text = "Game Over"
						endStateImage.SpriteGUIRendererComponent.ImageRUID = "c891c767fb88480595bb0fe83812da8d"
					end
					--endStatePanel.Enable = true
					endStateImage.Enable = true
					wait(6)
					endStatePanel.Enable = false
					endStateImage.Enable = false
				end,
				Scope = 2,
				ExecSpace = 6,
				Attributes = {
				},
				Name = "OnGameEndStatePanel"
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
					
					
					local isWinner = self.Entity.PlayerGameState.isWinner
					
					local resultPanel = _EntityService:GetEntityByPath("/ui/GameUIGroup/MultiResultPanel")
					local nicknameText_1p = _EntityService:GetEntityByPath("/ui/GameUIGroup/MultiResultPanel/Player1Panel/Player1Name")
					local coinScoreText_1p = _EntityService:GetEntityByPath("/ui/GameUIGroup/MultiResultPanel/Player1Panel/CoinScorePanel/Score")
					local noteScoreText_1p = _EntityService:GetEntityByPath("/ui/GameUIGroup/MultiResultPanel/Player1Panel/NoteScorePanel/Score")
					local extraScoreText_1p = _EntityService:GetEntityByPath("/ui/GameUIGroup/MultiResultPanel/Player1Panel/ExtraScorePanel/Score")
					local leftNoteScoreText_1p = _EntityService:GetEntityByPath("/ui/GameUIGroup/MultiResultPanel/Player1Panel/LeftNoteScorePanel/Score")
					local totalScoreText_1p = _EntityService:GetEntityByPath("/ui/GameUIGroup/MultiResultPanel/Player1Panel/TotalScorePanel/Score")
					
					
					local nicknameText_2p = _EntityService:GetEntityByPath("/ui/GameUIGroup/MultiResultPanel/Player2Panel/Player2Name")
					local coinScoreText_2p = _EntityService:GetEntityByPath("/ui/GameUIGroup/MultiResultPanel/Player2Panel/CoinScorePanel/Score")
					local noteScoreText_2p = _EntityService:GetEntityByPath("/ui/GameUIGroup/MultiResultPanel/Player2Panel/NoteScorePanel/Score")
					local extraScoreText_2p = _EntityService:GetEntityByPath("/ui/GameUIGroup/MultiResultPanel/Player2Panel/ExtraScorePanel/Score")
					local leftNoteScoreText_2p = _EntityService:GetEntityByPath("/ui/GameUIGroup/MultiResultPanel/Player2Panel/LeftNoteScorePanel/Score")
					local totalScoreText_2p = _EntityService:GetEntityByPath("/ui/GameUIGroup/MultiResultPanel/Player2Panel/TotalScorePanel/Score")
					
					local rankText = _EntityService:GetEntityByPath("/ui/GameUIGroup/MultiResultPanel/RankPanel/RankText")
					
					
					if self.Entity.CurrentMap.GameController_Multi.playerList[1].PlayerComponent.UserId == self.Entity.PlayerComponent.UserId then
						self.userIndex = 2
					else
						self.userIndex = 1
					end
					
					
					
					
					
					-- 플레이 결과UI세팅 
						nicknameText_1p.TextComponent.Text = self.Entity.PlayerComponent.Nickname
						coinScoreText_1p.TextComponent.Text = tostring(self.Entity.PlayerGameState.coinScore)
						noteScoreText_1p.TextComponent.Text = tostring(self.Entity.PlayerGameState.noteScore)
						extraScoreText_1p.TextComponent.Text = tostring(self.Entity.PlayerGameState.extraScore)
						leftNoteScoreText_1p.TextComponent.Text = tostring(self.Entity.PlayerGameState.leftNoteScore)
						totalScoreText_1p.TextComponent.Text = tostring(self.Entity.PlayerGameState.noteScore + self.Entity.PlayerGameState.coinScore + self.Entity.PlayerGameState.extraScore + self.Entity.PlayerGameState.leftNoteScore * 10)
					
						log("PlayerList COunt: "..tostring(#self.Entity.CurrentMap.GameController_Multi.playerList))
						if #self.Entity.CurrentMap.GameController_Multi.playerList == 2 then
						
							local otherPlayer = self.Entity.CurrentMap.GameController_Multi.playerList[self.userIndex]
							nicknameText_2p.TextComponent.Text = otherPlayer.PlayerComponent.Nickname
							coinScoreText_2p.TextComponent.Text = tostring(otherPlayer.PlayerGameState.coinScore)
							noteScoreText_2p.TextComponent.Text = tostring(otherPlayer.PlayerGameState.noteScore)
							extraScoreText_2p.TextComponent.Text = tostring(otherPlayer.PlayerGameState.extraScore)
							leftNoteScoreText_2p.TextComponent.Text = tostring(otherPlayer.PlayerGameState.leftNoteScore)
							totalScoreText_2p.TextComponent.Text = tostring(otherPlayer.PlayerGameState.noteScore + otherPlayer.PlayerGameState.coinScore + otherPlayer.PlayerGameState.extraScore + otherPlayer.PlayerGameState.leftNoteScore * 10)
						else
							nicknameText_2p.TextComponent.Text = "상대방 접속 종료"
							coinScoreText_2p.TextComponent.Text = "0.0"
							noteScoreText_2p.TextComponent.Text = "0.0"
							extraScoreText_2p.TextComponent.Text = "0.0"
							leftNoteScoreText_2p.TextComponent.Text = "0.0"
							totalScoreText_2p.TextComponent.Text = "0.0"
						 
						end
							
						if isWinner then
							rankText.TextComponent.Text = "WIN"
					
							self.MultiStarImg5.Enable = true
							self.MultiStarImg1.Enable = false
							
						else
							rankText.TextComponent.Text = "Lose"
					
							self.MultiStarImg5.Enable = false
							self.MultiStarImg1.Enable = true
						end
						
					-- 플레이어 결과 UI보여주기
					resultPanel.Enable = true
				end,
				Scope = 2,
				ExecSpace = 6,
				Attributes = {
				},
				Name = "OnResultPanel_Multi"
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
					local notePanel = _EntityService:GetEntityByPath("/ui/GameUIGroup/NotePanel")
					notePanel.Enable = false
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
				Arguments = nil,
				Code = function()
					local rankScorll = _EntityService:GetEntityByPath("/ui/LobbyUIGroup/RankPanel/RankScroll")
					rankScorll.UIRankScroll:SetRankScorll()
				end,
				Scope = 2,
				ExecSpace = 6,
				Attributes = {
				},
				Name = "UpdateRankPanel"
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
					local waitingPanel = _EntityService:GetEntityByPath("/ui/LobbyUIGroup/StoryWatingPanel")
						waitingPanel.Enable = false
				end,
				Scope = 2,
				ExecSpace = 6,
				Attributes = {
				},
				Name = "OffStoryWaitingPanel"
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
					self.partyUIPanel.Enable = false
				end,
				Scope = 2,
				ExecSpace = 6,
				Attributes = {
				},
				Name = "OffPartyPanel"
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
					self.partyCancelNoticePanel.Enable = true
				end,
				Scope = 2,
				ExecSpace = 6,
				Attributes = {
				},
				Name = "OnPartyCancelNoticePanel"
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
					if type ==1 then 
						self.partyDestoryNoticePanel.Enable = true
					elseif type == 2 then
						self.partyDestoryNoticePanel2.Enable = true
					end
					
				end,
				Scope = 2,
				ExecSpace = 6,
				Attributes = {
				},
				Name = "OnPartyDestroyNoticePanel"
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
					self.partyRegistrationPanel.Enable = true
				end,
				Scope = 2,
				ExecSpace = 6,
				Attributes = {
				},
				Name = "OnPartyRegistrationPanel"
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
						Name = "memberList"
					}
				},
				Code = function(memberList)
					local memberPanel = _EntityService:GetEntityByPath("/ui/LobbyUIGroup/PartyUIPanel/PartyWatingPanel/UserNameText")
					memberPanel.TextComponent.Text = memberList
				end,
				Scope = 2,
				ExecSpace = 6,
				Attributes = {
				},
				Name = "SetPartyMemberPanel"
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
					local waitNoticePanel = _EntityService:GetEntityByPath("/ui/LobbyUIGroup/PartyStartWatingPanel")
					waitNoticePanel.Enable = true
				end,
				Scope = 2,
				ExecSpace = 6,
				Attributes = {
				},
				Name = "OnPartyStartWatingPanel"
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
					local NoticePanel = _EntityService:GetEntityByPath("/ui/LobbyUIGroup/NotReadyToStartPartyNoticePanel")
					NoticePanel.Enable = true
				end,
				Scope = 2,
				ExecSpace = 6,
				Attributes = {
				},
				Name = "OnNotReadyToStartPartyNoticePanel"
			}
		},
		EntityEventHandlers = {
		}
	}
}

return unpackedContents