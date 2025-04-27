unpackedContents = {
	uniqueIdentifier = "241d115db68f4b928ceacaf95d976fad",
	bundleIdentifier = "2c89a498317848aab9fe46cd70bf74bb",
	category = "codeblock",
	entryId = "a5d47940-7617-434a-ba56-9b57f8e39896",
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
		Id = "a5d47940-7617-434a-ba56-9b57f8e39896",
		Language = 1,
		Name = "Player",
		Type = 1,
		Source = 0,
		Target = nil,
		ModifyTime = "2022-11-14T07:13:44.2672031+09:00",
		Properties = {
			{
				Type = "boolean",
				DefaultValue = "false",
				SyncDirection = 3,
				Attributes = {
				},
				Name = "isReadyToMultiPlay"
			},
			{
				Type = "number",
				DefaultValue = "0",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "roomIdx"
			},
			{
				Type = "string",
				DefaultValue = "",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "selectMapID"
			},
			{
				Type = "boolean",
				DefaultValue = "false",
				SyncDirection = 3,
				Attributes = {
				},
				Name = "isReadyToPlay"
			},
			{
				Type = "boolean",
				DefaultValue = "false",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "isUserStorage"
			},
			{
				Type = "boolean",
				DefaultValue = "false",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "isUpdateSelectMap"
			},
			{
				Type = "string",
				DefaultValue = "",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "currMapName"
			},
			{
				Type = "string",
				DefaultValue = "400f6612e36a4a6d96416e0a7a6d0460",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "normalSkillSkin"
			},
			{
				Type = "dictionary",
				DefaultValue = "string|number",
				SyncDirection = 3,
				Attributes = {
				},
				Name = "battleRankSDBPages"
			},
			{
				Type = "string",
				DefaultValue = "-",
				SyncDirection = 3,
				Attributes = {
				},
				Name = "playerCurrRank"
			},
			{
				Type = "string",
				DefaultValue = "-",
				SyncDirection = 3,
				Attributes = {
				},
				Name = "playerCurrBattleScore"
			},
			{
				Type = "number",
				DefaultValue = "1",
				SyncDirection = 3,
				Attributes = {
				},
				Name = "updateTimer"
			},
			{
				Type = "boolean",
				DefaultValue = "false",
				SyncDirection = 3,
				Attributes = {
				},
				Name = "isRewardUser"
			},
			{
				Type = "boolean",
				DefaultValue = "false",
				SyncDirection = 3,
				Attributes = {
				},
				Name = "isReadyToPartyPlay"
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
				},
				Code = function()
					self.isReadyToMultiPlay = true
					
					log("기다림 상태: "..tostring(self.isReadyToMultiPlay))
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "OnReadyToMultiPlay"
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
						Name = "targetUserName"
					}
				},
				Code = function(targetUserName)
					
					self.isReadyToMultiPlay = false
					
					log("기다림 상태: "..tostring(self.isReadyToMultiPlay))
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "CancelReadyToMultiPlay"
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
					self.isReadyToPlay = true
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "OnReadyToPlay"
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
					self.isReadyToPlay = false
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "CancelReadyToPlay"
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
					self.isReadyToPartyPlay = true
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "OnReadyToPartyPlay"
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
						Name = "targetUserName"
					}
				},
				Code = function(targetUserName)
					self.isReadyToPartyPlay = false
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "CancelReadyToPartyPlay"
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
					self.isUpdateSelectMap = true
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "OnUpdateSelectMap"
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
					self.isUpdateSelectMap = false
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "CancelUpdateSelectMap"
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
						Name = "arg"
					}
				},
				Code = function(arg)
					self.selectMapID = arg
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "SetSelectMapId"
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
					-- user storage에 selected map 업데이트 
					if self.isUpdateSelectMap then
						self.Entity.PlayerUDBController:UpdateDistMapId_UDB(self.selectMapID)
						self:CancelUpdateSelectMap()
					end
					
					if self.updateTimer > 0 then
					    self.updateTimer = self.updateTimer - delta
					    return
					end
					
					self.updateTimer = 5
					
					self:GetCurrRank_SDB()
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
						Type = "any",
						DefaultValue = nil,
						SyncDirection = 0,
						Attributes = {
						},
						Name = "enteredMap"
					}
				},
				Code = function(enteredMap)
					-- [ 소셜 맵 ] 
					if string.find(enteredMap.Name, "Ins") == nil then
						self:PlayerInSocialMap_setting()
						
						if enteredMap.Name == "Lobby" then
							self.Entity.PlayerUDBController:CheckIsFirstVisit_UDB()
							
						elseif enteredMap.Name == "RankMap" then
							self:RemoveFromWaiting(self.Entity.Name)
							--self:GetCurrRank_SDB()
						end
					
					-- [ 게임 맵 ] 
					else
						self:PlayerInGameMap_setting()
						self.Entity.PlayerGameMovementController:CheckCurrentMap()
						self.Entity.PlayerUDBController:GetDamageSkin_UDB() -- 뎀스
						
						-- 튜토리얼 맵이 아닌 일반 게임 맵인 경우 
						if enteredMap.Name ~= "Ins199" then
							-- 멀티맵인 경우 
							if enteredMap.InsMapType.mapType == "Multi" then
								enteredMap.GameController_Multi:AddEnterUserCnt(self.Entity.Name)
							elseif enteredMap.InsMapType.mapType == "Story" then
								enteredMap.GameController_Story:AddEnterUserCnt()
							end
							
							if enteredMap.Name == "Ins104" then
								self.Entity.CameraComponent.CameraOffset = Vector2(0,1)
							else 
								self.Entity.CameraComponent.CameraOffset = Vector2(0,0)
							end
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
						Name = "targetUserName"
					}
				},
				Code = function(targetUserName)
					if self.Entity.Name ~= targetUserName then return end
					local users ={}
					users[1] = self.Entity.Name
					_InstanceMapService:MoveUsersToParentMap(users, "Lobby")
					self.Entity.Parent:SetEnable(false)
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "SendBackToParent"
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
					-- Lobby외의 맵에서는 유저를 모든 대기열에서 취소시키기 
					self:CancelReadyToPlay()
					self:CancelReadyToMultiPlay()
					local waitingPanel = _EntityService:GetEntityByPath("/ui/LobbyUIGroup/WaitingPanel")
					waitingPanel.Enable = false
				end,
				Scope = 2,
				ExecSpace = 6,
				Attributes = {
				},
				Name = "RemoveFromWaiting"
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
					self.Entity.PlayerGameMovementController.Enable = state 
					self.Entity.PlayerGameMovementController.enable = state
					
					self.Entity.PlayerGameItemController.Enable = state 
					
					self.Entity.PlayerGameState.Enable = state
					self.Entity.ActionManager.Enable = state
				end,
				Scope = 2,
				ExecSpace = 6,
				Attributes = {
				},
				Name = "SetEnablePlayerGameScript"
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
					self.Entity.PlayerSocialController.Enable = state
				end,
				Scope = 2,
				ExecSpace = 6,
				Attributes = {
				},
				Name = "SetEnablePlayerSocialScript"
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
					self.Entity.MovementComponent.Enable = state
				end,
				Scope = 2,
				ExecSpace = 6,
				Attributes = {
				},
				Name = "SetEnablePlayerMovementComponent"
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
					-- 무조건 제거되어야 하는 키 (소셜, 게임 상관없이)
					self.Entity.PlayerControllerComponent:RemoveActionKey(KeyboardKey.Space)  -- space 점프 제거 
					self.Entity.PlayerControllerComponent:RemoveActionKey(KeyboardKey.LeftAlt)  -- alt점프 제거
					self.Entity.PlayerControllerComponent:RemoveActionKey(KeyboardKey.LeftControl)  -- L.control 공격 제거 
					self.Entity.PlayerControllerComponent:RemoveActionKey(KeyboardKey.A)  -- AWSD 방향키 제거
					self.Entity.PlayerControllerComponent:RemoveActionKey(KeyboardKey.W)  -- AWSD 방향키 제거
					self.Entity.PlayerControllerComponent:RemoveActionKey(KeyboardKey.S)  -- AWSD 방향키 제거
					self.Entity.PlayerControllerComponent:RemoveActionKey(KeyboardKey.D)  -- AWSD 방향키 제거
					
					-- 소셜로 세팅하기
					self:PlayerInSocialMap_setting()
					
					if self.Entity.CurrentMap.Name == "Lobby" then
						self.Entity.PlayerSocialController.jumpEffect = self.normalSkillSkin
					end	
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
						DefaultValue = nil,
						SyncDirection = 0,
						Attributes = {
						},
						Name = "up"
					},
					{
						Type = "string",
						DefaultValue = nil,
						SyncDirection = 0,
						Attributes = {
						},
						Name = "down"
					},
					{
						Type = "string",
						DefaultValue = nil,
						SyncDirection = 0,
						Attributes = {
						},
						Name = "front"
					},
					{
						Type = "string",
						DefaultValue = nil,
						SyncDirection = 0,
						Attributes = {
						},
						Name = "stop"
					}
				},
				Code = function(up, down, front, stop)
					if self.Entity.Name ~= _UserService.LocalPlayer.Name then return end
					
					-- UDB 스킨을 게임 스킨으로 저장  
					self.Entity.PlayerGameMovementController.Up_effect = up
					self.Entity.PlayerGameMovementController.Down_effect = down
					self.Entity.PlayerGameMovementController.Front_effect = front
					self.Entity.PlayerGameMovementController.Stop_effect = stop
					
				end,
				Scope = 2,
				ExecSpace = 6,
				Attributes = {
				},
				Name = "UpdateGameSkin_client"
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
					if self.Entity.Name ~= _UserService.LocalPlayer.Name then return end
					
					self.isReadyToMultiPlay = false
					
					-- 게임 스크립트 켜기 
					self.Entity.PlayerGameMovementController.Enable = true 
					self.Entity.PlayerGameMovementController.enable = false 
					self.Entity.PlayerGameItemController.Enable = true 
					self.Entity.PlayerGameState.Enable = true 
					self.Entity.MovementComponent.Enable = true
					
					-- 소셜 스크립트 끄기
					self.Entity.PlayerSocialController.Enable = false
					
					-- 기본이동 속도 조절 
					--self.Entity.MovementComponent.InputSpeed = 0.2
					self.Entity.MovementComponent.InputSpeed = 0.2
					
					-- 소셜 키 조작 끄기 
					
					-- 단축키 설정하기 
					self.Entity.PlayerControllerComponent:RemoveActionKey(KeyboardKey.Z)  -- 공격 제거
					self.Entity.PlayerControllerComponent:RemoveActionKey(KeyboardKey.C)  -- 앉기 제거
					self.Entity.PlayerControllerComponent:RemoveActionKey(KeyboardKey.LeftShift)  --점프 제거 
					self.Entity.PlayerControllerComponent:RemoveActionKey(KeyboardKey.RightShift)  --점프 제거 
					self.Entity.PlayerControllerComponent:RemoveActionKey(KeyboardKey.LeftControl)  --점프 제거 
					self.Entity.PlayerControllerComponent:RemoveActionKey(KeyboardKey.RightArrow) -- 방향키 제거
					self.Entity.PlayerControllerComponent:RemoveActionKey(KeyboardKey.LeftArrow) -- 방향키 제거
					self.Entity.PlayerControllerComponent:RemoveActionKey(KeyboardKey.UpArrow) -- 방향키 제거
					self.Entity.PlayerControllerComponent:RemoveActionKey(KeyboardKey.DownArrow) -- 방향키 제거
					self.Entity.PlayerControllerComponent:RemoveActionKey(KeyboardKey.W) -- 방향키 제거
					self.Entity.PlayerControllerComponent:RemoveActionKey(KeyboardKey.A) -- 방향키 제거
					self.Entity.PlayerControllerComponent:RemoveActionKey(KeyboardKey.S) -- 방향키 제거
					self.Entity.PlayerControllerComponent:RemoveActionKey(KeyboardKey.D) -- 방향키 제거
					
				end,
				Scope = 2,
				ExecSpace = 6,
				Attributes = {
				},
				Name = "PlayerInGameMap_setting"
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
					if self.Entity.Name ~= _UserService.LocalPlayer.Name then return end
					
					-- 게임 스크립트 끄기
					self.Entity.PlayerGameMovementController.Enable = false 
					self.Entity.PlayerGameMovementController.enable = false 
					self.Entity.PlayerGameItemController.Enable = false 
					--self.Entity.PlayerGameState.Enable = false 
					
					-- 소셜 스크립트 켜기
					self.Entity.PlayerSocialController.Enable = true
					
					-- 기본이동 속도 조절 
					self.Entity.MovementComponent.InputSpeed = 1.2
					
					-- 소셜 키 조작 켜기
					self.Entity.PlayerControllerComponent.Enable = true
					self.Entity.MovementComponent.Enable = true
					
					-- 단축키 설정하기
					self.Entity.PlayerControllerComponent:SetActionKey(KeyboardKey.Z , "Attack") --Z 공격 연결
					self.Entity.PlayerControllerComponent:SetActionKey(KeyboardKey.C , "Sit") --Z 공격 연결
					self.Entity.PlayerControllerComponent:SetActionKey(KeyboardKey.LeftShift , "Jump") --shift 점프 연결
					self.Entity.PlayerControllerComponent:SetActionKey(KeyboardKey.RightShift , "Jump") --shift 점프 연결
					self.Entity.PlayerControllerComponent:SetActionKey(KeyboardKey.LeftControl , "Jump") --control 점프 연결
					self.Entity.PlayerControllerComponent:SetActionKey(KeyboardKey.RightArrow, "MoveRight") -- 방향키 연결
					self.Entity.PlayerControllerComponent:SetActionKey(KeyboardKey.LeftArrow, "MoveLeft") -- 방향키 연결
					self.Entity.PlayerControllerComponent:SetActionKey(KeyboardKey.UpArrow, "MoveUp") -- 방향키 연결
					self.Entity.PlayerControllerComponent:SetActionKey(KeyboardKey.DownArrow, "MoveDown") -- 방향키 연결
					self.Entity.PlayerControllerComponent:SetActionKey(KeyboardKey.W, "MoveRight") -- 방향키 연결
					self.Entity.PlayerControllerComponent:SetActionKey(KeyboardKey.A, "MoveLeft") -- 방향키 연결
					self.Entity.PlayerControllerComponent:SetActionKey(KeyboardKey.S, "MoveUp") -- 방향키 연결
					self.Entity.PlayerControllerComponent:SetActionKey(KeyboardKey.D, "MoveDown") -- 방향키 연결
					
				end,
				Scope = 2,
				ExecSpace = 6,
				Attributes = {
				},
				Name = "PlayerInSocialMap_setting"
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
					local totalScore = 100
					
					local battleRankGDB = _DataStorageService:GetSortableDataStorage("BattleRankSDB")
					local _,battleScore = battleRankGDB:GetAndWait(self.Entity.PlayerComponent.UserId)
					if battleScore == nil then
						log("battleScore is nil")
						battleScore = 0
					end
					
					battleScore = battleScore + totalScore
					-- SDB의 해당 유저 BattleWinScore : 0으로 초기화 
					local errorcode = battleRankGDB:SetAndWait(self.Entity.PlayerComponent.UserId, battleScore)
					log("battleRankSDB ErrorCode :"..errorcode)
					local _,battleScore_new = battleRankGDB:GetAndWait(self.Entity.PlayerComponent.UserId)
					log("[test] SDB 내 battle score: "..battleScore_new)
				end,
				Scope = 2,
				ExecSpace = 1,
				Attributes = {
				},
				Name = "SDB_TestFunc"
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
					local battleRankSDB = _DataStorageService:GetSortableDataStorage("BattleRankSDB")
					local errorCode, pages = battleRankSDB:GetSortedAndWait(SortDirection.Descending,0,10000000) 
					
					local currMaxRankIndex = 1
					
					while true do
					    local items = pages:GetCurrentPageDatas()
					    for _, item in pairs(items) do
							if item.KeyInfo.Key == self.Entity.PlayerComponent.UserId then
								self.playerCurrRank = tostring(currMaxRankIndex)
								self.playerCurrBattleScore = tostring(item.Value)
								return 
							end
							currMaxRankIndex = currMaxRankIndex + 1
					    end
					 
					    if pages.IsLastPage == true then
					        break
					    end
					    pages:MoveToNextPageAndWait()
					end
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "GetCurrRank_SDB"
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
					local battleRankSDB = _DataStorageService:GetSortableDataStorage("RewardUserSDB")
					local errorCode, pages = battleRankSDB:GetSortedAndWait(SortDirection.Descending,0,10000000) 
					
					while true do
					    local items = pages:GetCurrentPageDatas()
					    for _, item in pairs(items) do
							log("RewardUserSDB 순회: "..item.KeyInfo.Key .. ":" ..item.Value.."[Player]")
					
							if item.KeyInfo.Key == self.Entity.PlayerComponent.UserId then
								if item.Value ~= 0 then
									-- 보상 수령 대상임을 체크 
									self.isRewardUser = true
									log(item.KeyInfo.Key.." isRewardUser."..tostring(self.isRewardUser).." [Player]")
									-- SDB에서 해당 유저 삭제하기 
									local deleteUser = {}
									deleteUser[1] = self.Entity.PlayerComponent.Nickname
									local callBackFunc = function()
										log("SDB에서 해당유저 삭제함.[Player]")
									end
									battleRankSDB:BatchDeleteAsync(deleteUser, callBackFunc)
									return 
								end
							end
					
					
					    end
					 
					    if pages.IsLastPage == true then
					        break
					    end
					    pages:MoveToNextPageAndWait()
					end
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "CheckIsRewardUser"
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
					self.isRewardUser = false
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "OffIsRewardUser"
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
					log("오프닝 사운드 틀기")
					
					self.Entity.CurrentMap.LobbySoundController:OffSound()
					wait(4)
					self.Entity.CurrentMap.LobbySoundController:OnOpeningSound()
				end,
				Scope = 2,
				ExecSpace = 6,
				Attributes = {
				},
				Name = "OnOpeningSound"
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
					self.Entity.CurrentMap.LobbySoundController:OffSound()
					wait(4)
					self.Entity.CurrentMap.LobbySoundController:OnNorimalSound()
				end,
				Scope = 2,
				ExecSpace = 6,
				Attributes = {
				},
				Name = "OnOriginalSound"
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
						Name = "targetName"
					},
					{
						Type = "string",
						DefaultValue = "",
						SyncDirection = 0,
						Attributes = {
						},
						Name = "tag"
					}
				},
				Code = function(targetName, tag)
					if self.Entity.Name == targetName then
						self.Entity.TagComponent.Tags[1] = tag	
					end
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "ChangeTag"
			}
		},
		EntityEventHandlers = {
		}
	}
}

return unpackedContents