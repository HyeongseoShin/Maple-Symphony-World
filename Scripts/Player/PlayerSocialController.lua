unpackedContents = {
	uniqueIdentifier = "3293118925e241c4be9b0e1c38e9dc3b",
	bundleIdentifier = "2c89a498317848aab9fe46cd70bf74bb",
	category = "codeblock",
	entryId = "0b22eedb-3d88-4b40-a0f6-9223ab317bb8",
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
		Id = "0b22eedb-3d88-4b40-a0f6-9223ab317bb8",
		Language = 1,
		Name = "PlayerSocialController",
		Type = 1,
		Source = 0,
		Target = nil,
		ModifyTime = "2022-11-14T19:18:05.1521797+09:00",
		Properties = {
			{
				Type = "boolean",
				DefaultValue = "false",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "isSit"
			},
			{
				Type = "Vector2",
				DefaultValue = "Vector2(0,0)",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "playerBeforSitPosition"
			},
			{
				Type = "boolean",
				DefaultValue = "false",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "isScreenShotMode"
			},
			{
				Type = "string",
				DefaultValue = "",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "jumpEffect"
			},
			{
				Type = "boolean",
				DefaultValue = "false",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "lockHighJump"
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
						Name = "ChairModelID"
					},
					{
						Type = "number",
						DefaultValue = "0",
						SyncDirection = 0,
						Attributes = {
						},
						Name = "chairSpawnPosition_y"
					},
					{
						Type = "number",
						DefaultValue = "0",
						SyncDirection = 0,
						Attributes = {
						},
						Name = "playerSitPosition_y"
					},
					{
						Type = "number",
						DefaultValue = "0",
						SyncDirection = 0,
						Attributes = {
						},
						Name = "playerSitPosition_x"
					}
				},
				Code = function(ChairModelID, chairSpawnPosition_y, playerSitPosition_y, playerSitPosition_x)
					self:Sit_client(self.Entity.PlayerComponent.UserId)
					
					-- 의자 생성 
					local direction = self.Entity.PlayerControllerComponent.LookDirectionX
					local currMap = self.Entity.CurrentMap
					local chairEntity = _SpawnService:SpawnByModelId(ChairModelID, "Chair"..self.Entity.Name, Vector3(self.Entity.TransformComponent.Position.x,self.Entity.TransformComponent.Position.y + chairSpawnPosition_y,self.Entity.TransformComponent.Position.z), currMap)
					
					--chairEntity.SpriteRendererComponent.SortingLayer = "Layer7"
					--chairEntity.SpriteRendererComponent.OrderInLayer = 18
					
					chairEntity.SpriteRendererComponent.SortingLayer = self.Entity.AvatarRendererComponent.SortingLayer
					chairEntity.SpriteRendererComponent.OrderInLayer = self.Entity.AvatarRendererComponent.OrderInLayer-1 
					
					
					-- 의자 방향 설정 (플레이어 방향 따라)
					local sit = _EntityService:GetEntityByPath(currMap.Path.."/Chair"..self.Entity.Name)
					if direction == 1 then
						sit.SpriteRendererComponent.FlipX = true
					elseif direction == -1 then
						sit.SpriteRendererComponent.FlipX = false
					end
					
					--v플레이어 위치이동 
					if direction == 1 then
						self.Entity.RigidbodyComponent:SetPosition(Vector2(self.Entity.TransformComponent.Position.x - playerSitPosition_x, self.Entity.TransformComponent.Position.y + playerSitPosition_y))
					elseif direction == -1 then
						self.Entity.RigidbodyComponent:SetPosition(Vector2(self.Entity.TransformComponent.Position.x + playerSitPosition_x, self.Entity.TransformComponent.Position.y + playerSitPosition_y))
					end
					
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "Sit_server"
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
						Type = "Vector2",
						DefaultValue = "Vector2(0,0)",
						SyncDirection = 0,
						Attributes = {
						},
						Name = "arg"
					}
				},
				Code = function(arg)
					--[의자 객체를 없애는 함수. DestroyChair_Client에서 호출해준다. 단독으로 쓰지 말기. 단독으로 쓰면 플레이어 이동시 타유저 의자를 없애는 오류가있음.]
					--self.Entity.RigidbodyComponent:SetPosition(arg)
					
					local currMap = self.Entity.CurrentMap
					local chair = _EntityService:GetEntityByPath(currMap.Path.."/Chair"..self.Entity.Name)
					if chair ~= nil then
						-- 의자 없애기 
						_EntityService:Destroy(chair)	
					end
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "DestoryChair_server"
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
						Name = "nameTagRUID"
					},
					{
						Type = "string",
						DefaultValue = "",
						SyncDirection = 0,
						Attributes = {
						},
						Name = "chatBalloonRUID"
					},
					{
						Type = "string",
						DefaultValue = "",
						SyncDirection = 0,
						Attributes = {
						},
						Name = "color"
					},
					{
						Type = "string",
						DefaultValue = "",
						SyncDirection = 0,
						Attributes = {
						},
						Name = "targetUserName"
					}
				},
				Code = function(nameTagRUID, chatBalloonRUID, color, targetUserName)
					if self.Entity.Name == targetUserName then	
						self.Entity.NameTagComponent.NameTagRUID = nameTagRUID
						self.Entity.ChatBalloonComponent.ChatBalloonRUID = chatBalloonRUID
						if color == "Black" then
							self.Entity.NameTagComponent.FontColor = Color(0,0,0,1)
						elseif color == "White" then
							self.Entity.NameTagComponent.FontColor = Color(1,1,1,1)
						end
					end
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "OnRing_server"
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
					self.Entity.NameTagComponent.NameTagRUID = ""
					self.Entity.ChatBalloonComponent.ChatBalloonRUID = "28f1106f1a594b649f161b357d347e59"
					self.Entity.NameTagComponent.FontColor = Color(1,1,1,1)
					self.Entity.ChatBalloonComponent.FontColor = Color(0,0,0,1)
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "OffRing"
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
						Name = "nameTagRUID"
					},
					{
						Type = "string",
						DefaultValue = "",
						SyncDirection = 0,
						Attributes = {
						},
						Name = "chatBalloonRUID"
					},
					{
						Type = "string",
						DefaultValue = "",
						SyncDirection = 0,
						Attributes = {
						},
						Name = "color"
					}
				},
				Code = function(nameTagRUID, chatBalloonRUID, color)
					self.Entity.NameTagComponent.NameTagRUID = nameTagRUID
					self.Entity.ChatBalloonComponent.ChatBalloonRUID = chatBalloonRUID
					if color == "Black" then
						self.Entity.NameTagComponent.FontColor = Color(0,0,0,1)
					elseif color == "White" then
						self.Entity.NameTagComponent.FontColor = Color(1,1,1,1)
					end
					
					self:OnRing_server(nameTagRUID,chatBalloonRUID,color)
				end,
				Scope = 2,
				ExecSpace = 6,
				Attributes = {
				},
				Name = "OnRing_Client"
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
					-- 플레이어 위치 돌려놓기
					self.Entity.RigidbodyComponent.Gravity = 1
					self.Entity.StateComponent:ChangeState("IDLE")
					--의자 없애기
					self:DestoryChair_server(self.playerBeforSitPosition)
					
					-- 모든 의자 슬롯UI 사용안함으로 바꾸기 
					local uiInventory = _EntityService:GetEntityByPath("/ui/LobbyUIGroup/InventoryPanel").UIInventory
					uiInventory:SettingOnePick("Chair")
					self.isSit = false
				end,
				Scope = 2,
				ExecSpace = 6,
				Attributes = {
				},
				Name = "DestroyChair_client"
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
					--[Sit_server에서 호출함.]
					
					self.isSit = true
					
					--플레이어 동작, 방향
					local direction = self.Entity.PlayerControllerComponent.LookDirectionX
					self.Entity.StateComponent:ChangeState("SIT")
					self.Entity.PlayerControllerComponent.LookDirectionX = direction
					self.Entity.RigidbodyComponent.Gravity = 0
				end,
				Scope = 2,
				ExecSpace = 6,
				Attributes = {
				},
				Name = "Sit_client"
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
						Name = "petModelID"
					}
				},
				Code = function(petModelID)
					--팻 생성 (플레이어의 자녀객체로)
					local petEntity = _SpawnService:SpawnByModelId(petModelID, "Pet", Vector3(0.35,0,0), self.Entity)
					petEntity.SpriteRendererComponent.SortingLayer = self.Entity.AvatarRendererComponent.SortingLayer
					petEntity.SpriteRendererComponent.OrderInLayer = self.Entity.AvatarRendererComponent.OrderInLayer-1 
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "OnPet_server"
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
					local currPet = self.Entity:GetChildByName("Pet")
					if currPet ~= nil then
						_EntityService:Destroy(currPet)	
					end
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "DestroyPet_server"
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
						Name = "effectModelID"
					},
					{
						Type = "number",
						DefaultValue = "0",
						SyncDirection = 0,
						Attributes = {
						},
						Name = "effectPosition_y"
					}
				},
				Code = function(effectModelID, effectPosition_y)
					_SpawnService:SpawnByModelId(effectModelID, "Effect", Vector3(0,tonumber(effectPosition_y),0), self.Entity)
					wait(40)
					self:DestroyEffect_server()
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "OnEffect_server"
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
					local effect = self.Entity:GetChildByName("Effect")
					_EntityService:Destroy(effect)
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "DestroyEffect_server"
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
						Name = "emotion"
					},
					{
						Type = "string",
						DefaultValue = "",
						SyncDirection = 0,
						Attributes = {
						},
						Name = "targetUserName"
					}
				},
				Code = function(emotion, targetUserName)
					if self.Entity.Name == targetUserName then
						if emotion == "Cheers" then
							self.Entity.AvatarRendererComponent:PlayEmotion(EmotionalType.Cheers,36) 
						elseif emotion == "Hot" then
							self.Entity.AvatarRendererComponent:PlayEmotion(EmotionalType.Hot,36) 
						elseif emotion == "Despair" then
							self.Entity.AvatarRendererComponent:PlayEmotion(EmotionalType.Despair,36) 
						elseif emotion == "Love" then
							self.Entity.AvatarRendererComponent:PlayEmotion(EmotionalType.Love,36) 
						elseif emotion == "Troubled" then
							self.Entity.AvatarRendererComponent:PlayEmotion(EmotionalType.Troubled,36)
						elseif emotion == "Oops" then
							self.Entity.AvatarRendererComponent:PlayEmotion(EmotionalType.Oops,36) 
						end
					end
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "OnEffectEmotion"
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
						Name = "emotionKey"
					},
					{
						Type = "string",
						DefaultValue = "",
						SyncDirection = 0,
						Attributes = {
						},
						Name = "targetUserName"
					}
				},
				Code = function(emotionKey, targetUserName)
					if self.Entity.Name == targetUserName then
						if emotionKey == 1 then
							self.Entity.AvatarRendererComponent:PlayEmotion(EmotionalType.Smile,10) -- 웃기 
						elseif emotionKey == 2 then
							self.Entity.AvatarRendererComponent:PlayEmotion(EmotionalType.Cheers,10) -- 꺄오
						elseif emotionKey == 3 then
							self.Entity.AvatarRendererComponent:PlayEmotion(EmotionalType.Chu,10) -- 뽀뽀
						elseif emotionKey == 4 then
							self.Entity.AvatarRendererComponent:PlayEmotion(EmotionalType.Wink,10) -- 윙크 
						elseif emotionKey == 5 then
							self.Entity.AvatarRendererComponent:PlayEmotion(EmotionalType.Love,10) -- 러브
						elseif emotionKey == 6 then
							self.Entity.AvatarRendererComponent:PlayEmotion(EmotionalType.Cry,10) -- 울음 
						elseif emotionKey == 7 then
							self.Entity.AvatarRendererComponent:PlayEmotion(EmotionalType.Angry,10) -- 화남
						elseif emotionKey == 8 then
							self.Entity.AvatarRendererComponent:PlayEmotion(EmotionalType.Vomit,10) -- 토함 
						elseif emotionKey == 9 then
							self.Entity.AvatarRendererComponent:PlayEmotion(EmotionalType.Shine,10) -- 반짝반짝  
						elseif emotionKey == 0 then
							self.Entity.AvatarRendererComponent:PlayEmotion(EmotionalType.Hum,10) -- 흐음
						end
					end
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "OnEmotion"
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
					},
					{
						Type = "string",
						DefaultValue = "",
						SyncDirection = 0,
						Attributes = {
						},
						Name = "effect"
					}
				},
				Code = function(targetUserName, effect)
					if self.Entity.Name == targetUserName then
						_SoundService:PlaySound("0251ec87bc1141f58819bd3b6d2a6035",0.5)
						_EffectService:PlayEffectAttached(effect, self.Entity, Vector3(0,0,0), -90, Vector3(1,1,1), false)
					end
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "HighJump"
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
					if self.Entity.StateComponent.CurrentStateName == "JUMP" then
						self.lockHighJump = true
					else 
						self.lockHighJump = false
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
					self.Entity.Visible = arg
				end,
				Scope = 2,
				ExecSpace = 6,
				Attributes = {
				},
				Name = "SettingPlayerEntityVisible"
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
						Name = "titleModelID"
					}
				},
				Code = function(titleModelID)
					--팻 생성 (플레이어의 자녀객체로)
					_SpawnService:SpawnByModelId(titleModelID, "Title", Vector3(0,0.9,0), self.Entity)
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "OnTitle_server"
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
					local currTitle = self.Entity:GetChildByName("Title")
					if currTitle ~= nil then
						_EntityService:Destroy(currTitle)	
					end
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "DestroyTitle_server"
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
					self.Entity.AvatarRendererComponent.OrderInLayer = 20
				end,
				Scope = 2,
				ExecSpace = 0,
				Attributes = {
				},
				Name = "OnBeginPlay"
			}
		},
		EntityEventHandlers = {
			{
				Name = "HandleKeyDownEvent",
				EventName = "KeyDownEvent",
				Target = "service:InputService",
				Code = function()
					if self.Entity.CurrentMap.Name == "Lobby" or  self.Entity.CurrentMap.Name == "RankMap" then 
						
						-- Parameters
						local key = event.key
						--------------------------------------------------------
						-- 이동키인경우 의자 삭제
						if key == KeyboardKey.A or key == KeyboardKey.B or key == KeyboardKey.S or key == KeyboardKey.W or key == KeyboardKey.RightArrow or key == KeyboardKey.LeftArrow or key == KeyboardKey.UpArrow or key == KeyboardKey.DownArrow then
							if self.isSit then
								self:DestroyChair_client()
							end
						end
						
						--[조작법세팅]-------------------------------------------------------------
						
						-- 일반 점프 
						if key == KeyboardKey.LeftShift or key == KeyboardKey.RightShift then
							self.Entity.MovementComponent.JumpForce = 1
						end
						
						-- 윗점  
						if key == KeyboardKey.LeftControl then
							if self.lockHighJump == false then
								self.Entity.MovementComponent.JumpForce = 2
								self:HighJump(_UserService.LocalPlayer.Name, self.jumpEffect)
							end
						end
						
						--[단축키세팅]-------------------------------------------------------------
						
						-- 모든 창 닫기 단축키
						if key == KeyboardKey.Escape then
							-- 퀘스트, 인벤토리, 도움말
							local inventoryPanel = _EntityService:GetEntityByPath("/ui/LobbyUIGroup/InventoryPanel")
							local questPanel = _EntityService:GetEntityByPath("/ui/LobbyUIGroup/QuestPanel")
							local helpPanel = _EntityService:GetEntityByPath("/ui/LobbyUIGroup/HelpPanel")
							inventoryPanel.Enable = false
							questPanel.Enable = false
							helpPanel.Enable = false
						end
						
						-- 퀘스트 창 단축키
						if key == KeyboardKey.Q then
							local questPanel = _EntityService:GetEntityByPath("/ui/LobbyUIGroup/QuestPanel")
							questPanel.Enable = true
						end
						
						-- 인벤토리 창 단축키
						if key == KeyboardKey.I then
							local inventoryPanel = _EntityService:GetEntityByPath("/ui/LobbyUIGroup/InventoryPanel")
							inventoryPanel.Enable = true
						end
						
						-- 도움말 창 단축키
						if key == KeyboardKey.H then
							local inventoryPanel = _EntityService:GetEntityByPath("/ui/LobbyUIGroup/HelpPanel")
							inventoryPanel.Enable = true
						end
						
						-- 스크린 샷 모드 단축키
						if key == KeyboardKey.S then
							local lobbyUIGroup = _EntityService:GetEntityByPath("/ui/LobbyUIGroup")
							local defaultGroup = _EntityService:GetEntityByPath("/ui/DefaultGroup")
							if self.isScreenShotMode then
								self.isScreenShotMode = false
								lobbyUIGroup.Enable = true
								defaultGroup.Enable = true
							else 
								self.isScreenShotMode = true
								lobbyUIGroup.Enable = false
								defaultGroup.Enable = false
							end
						end
						--[[
						-- 표정 단축키 
						if key == KeyboardKey.Alpha1 then
							self:OnEmotion(1, _UserService.LocalPlayer.Name)
						elseif key == KeyboardKey.Alpha2 then
							self:OnEmotion(2, _UserService.LocalPlayer.Name)
						elseif key == KeyboardKey.Alpha3 then
							self:OnEmotion(3, _UserService.LocalPlayer.Name)
						elseif key == KeyboardKey.Alpha4 then
							self:OnEmotion(4, _UserService.LocalPlayer.Name)
						elseif key == KeyboardKey.Alpha5 then
							self:OnEmotion(5, _UserService.LocalPlayer.Name)
						elseif key == KeyboardKey.Alpha6 then
							self:OnEmotion(6, _UserService.LocalPlayer.Name)
						elseif key == KeyboardKey.Alpha7 then
							self:OnEmotion(7, _UserService.LocalPlayer.Name)
						elseif key == KeyboardKey.Alpha8 then
							self:OnEmotion(8, _UserService.LocalPlayer.Name) 
						elseif key == KeyboardKey.Alpha9 then
							self:OnEmotion(9, _UserService.LocalPlayer.Name)
						elseif key == KeyboardKey.Alpha0 then
							self:OnEmotion(0, _UserService.LocalPlayer.Name)
						end
						--]]
					
					end
				end,
				Scope = 0,
				ExecSpace = 0
			}
		}
	}
}

return unpackedContents