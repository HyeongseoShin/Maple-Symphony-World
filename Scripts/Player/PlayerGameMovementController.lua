unpackedContents = {
	uniqueIdentifier = "50000fa916b449ce988745041449cb0d",
	bundleIdentifier = "2c89a498317848aab9fe46cd70bf74bb",
	category = "codeblock",
	entryId = "01c2fb5b-e8e6-4323-b604-b3683ed9904d",
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
		Id = "01c2fb5b-e8e6-4323-b604-b3683ed9904d",
		Language = 1,
		Name = "PlayerGameMovementController",
		Type = 1,
		Source = 0,
		Target = nil,
		ModifyTime = "2022-11-12T17:20:39.3017037+09:00",
		Properties = {
			{
				Type = "boolean",
				DefaultValue = "false",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "enable"
			},
			{
				Type = "number",
				DefaultValue = "0",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "currActionCnt"
			},
			{
				Type = "number",
				DefaultValue = "3",
				SyncDirection = 3,
				Attributes = {
				},
				Name = "maxActionCnt"
			},
			{
				Type = "number",
				DefaultValue = "0",
				SyncDirection = 3,
				Attributes = {
				},
				Name = "NoteCnt"
			},
			{
				Type = "Vector3",
				DefaultValue = "Vector3(0,0,0)",
				SyncDirection = 3,
				Attributes = {
				},
				Name = "previousPosition"
			},
			{
				Type = "boolean",
				DefaultValue = "false",
				SyncDirection = 3,
				Attributes = {
				},
				Name = "isTyping"
			},
			{
				Type = "number",
				DefaultValue = "0",
				SyncDirection = 3,
				Attributes = {
				},
				Name = "IndicatorCnt"
			},
			{
				Type = "string",
				DefaultValue = "",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "Up_effect"
			},
			{
				Type = "string",
				DefaultValue = "",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "Down_effect"
			},
			{
				Type = "string",
				DefaultValue = "",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "Front_effect"
			},
			{
				Type = "string",
				DefaultValue = "",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "Stop_effect"
			},
			{
				Type = "number",
				DefaultValue = "0",
				SyncDirection = 3,
				Attributes = {
				},
				Name = "moveDirection"
			},
			{
				Type = "number",
				DefaultValue = "0",
				SyncDirection = 3,
				Attributes = {
				},
				Name = "Direction"
			},
			{
				Type = "boolean",
				DefaultValue = "false",
				SyncDirection = 3,
				Attributes = {
				},
				Name = "isGround"
			},
			{
				Type = "Entity",
				DefaultValue = "nil",
				SyncDirection = 3,
				Attributes = {
				},
				Name = "Map"
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
					-- UDB의 스킬이팩트를 스크립트에 적용하기
					self.Entity.PlayerUDBController:UpdateGameSkin_server()
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
						Type = "number",
						DefaultValue = nil,
						SyncDirection = 0,
						Attributes = {
						},
						Name = "delta"
					}
				},
				Code = function(delta)
					self.Direction = self.moveDirection
					
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
						Type = "number",
						DefaultValue = nil,
						SyncDirection = 0,
						Attributes = {
						},
						Name = "pow"
					}
				},
				Code = function(pow)
					-- 가해지던 힘 삭제 후 중력 초기화
					self.Entity.RigidbodyComponent:SetForce(Vector2(0,0)) -- 가해지던 힘을 삭제
					self.Entity.RigidbodyComponent.Gravity = pow -- 중력 pow값으로 초기화
				end,
				Scope = 2,
				ExecSpace = 0,
				Attributes = {
				},
				Name = "GravityHandler"
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
					self.Map = _EntityService:GetEntityByPath("/maps/"..tostring(self.Entity.CurrentMapName))
					--log(self.Map)
				end,
				Scope = 2,
				ExecSpace = 0,
				Attributes = {
				},
				Name = "CheckCurrentMap"
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
						_EffectService:PlayEffectAttached(effect, self.Entity, Vector3(0,0,0), -90, Vector3(1,1,1), false)
						
					end
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "JumpEffect"
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
						_EffectService:PlayEffectAttached(effect, self.Entity, Vector3(0,0,0), 0, Vector3(1,1,1), false)
					end
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "LeftDashEffect"
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
						_EffectService:PlayEffectAttached(effect, self.Entity, Vector3(0,0,0), 180, Vector3(1,1,1), false)
					end
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "RightDashEffect"
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
						_EffectService:PlayEffectAttached(effect, self.Entity, Vector3(0,0,0), 90, Vector3(1,1,1), false)
					end
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "DownEffect"
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
					local playerX = self.Entity.TransformComponent.Position.x
					local playerY = self.Entity.TransformComponent.Position.y
					local playerZ = self.Entity.TransformComponent.Position.z
					--------------------------------------------------------
					--log(key)
					
					
					
					if self.Entity.StateComponent.CurrentStateName ~= "DEAD" and self.IndicatorCnt == 0 then
						-- and key ~= KeyboardKey.LeftArrow and key ~= KeyboardKey.RightArrow and key ~= KeyboardKey.DownArrow 
						
						if key == KeyboardKey.W or key == KeyboardKey.UpArrow then -- 점프
							
							self.Entity.RigidbodyComponent.Enable = true
							self.IndicatorCnt = self.IndicatorCnt + 1
							self.Entity.RigidbodyComponent.Gravity = 1.0 -- 키 입력 시 중력 1로 초기화
							self.previousPosition = self.Entity.TransformComponent.Position -- 점프하기 이전 위치 저장
							
							if self.currActionCnt < self.maxActionCnt then -- 연속 이동 제한
								self.isTyping = true
								
								if self.enable ~= true then	
									return
								end
								
								self.NoteCnt = self.NoteCnt + 1 -- 다음 박자 기다리는 상태
								
								self.Entity.StateComponent:ChangeState("JUMP") 
								self.Entity.RigidbodyComponent:SetForce(Vector2(0,8.5)) -- 점프
								self.isGround = false
								--_EffectService:PlayEffectAttached(self.Up_effect, self.Entity, Vector3(0,0,0), -90, Vector3(1,1,1), false)
								self:JumpEffect(_UserService.LocalPlayer.Name, self.Up_effect)
								self.currActionCnt = self.currActionCnt + 1 -- 연속 이동 + 1
								self.Entity.ActionManager:NumberToAnim(math.floor(self.currActionCnt))
								
								-- 하강 시 Gravity 줄어들게
								wait(0.3)
								if self.currActionCnt == self.maxActionCnt then
									self:GravityHandler(1.0)
									
									
								else
									self:GravityHandler(0.03)
								end
								
							end
						
						elseif key == KeyboardKey.A or key == KeyboardKey.D or key == KeyboardKey.LeftArrow or key == KeyboardKey.RightArrow then -- 대쉬
							
							if key == KeyboardKey.LeftArrow or key == KeyboardKey.A then
								self.Direction = -1
							elseif key == KeyboardKey.RightArrow or key == KeyboardKey.D then
								self.Direction = 1
							end
							
							self.Entity.PlayerControllerComponent.LookDirectionX = self.Direction
							self.IndicatorCnt = self.IndicatorCnt + 1
							
							self.Entity.RigidbodyComponent.Enable = true
							self.previousPosition = self.Entity.TransformComponent.Position -- 대쉬 이전 위치 저장
					
							if self.currActionCnt < self.maxActionCnt then -- 연속 이동 제한
								if self.Map ~= nil and self.Map.FootholdComponent:Raycast(Vector2(self.Entity.TransformComponent.Position.x, self.Entity.TransformComponent.Position.y), Vector2.down, 0.3) == nil then
									--log("발판존재X")
									self.currActionCnt = self.currActionCnt + 1 -- 현재 이동 + 1
								end
								
								self.isTyping = true
								
								if self.enable ~= true then	
									return
								end
								
								self.NoteCnt = self.NoteCnt + 1 -- 다음 박자 기다리는 상태
								self:GravityHandler(0) -- 가해지던 힘 멈추고 중력 0으로 초기화
								--local Xdir=self.Entity.PlayerControllerComponent.LookDirectionX -- 캐릭터 바라보는 방향
								self.Entity.RigidbodyComponent:SetForce(Vector2(self.Direction * 8*6, 0)) -- 캐릭터 바라보는 방향으로 대쉬
								--[[
								if self.Map.FootholdComponent:Raycast(Vector2(self.Entity.TransformComponent.Position.x, self.Entity.TransformComponent.Position.y), Vector2.left, 0.1) ~= nil 
								or self.Map.FootholdComponent:Raycast(Vector2(self.Entity.TransformComponent.Position.x, self.Entity.TransformComponent.Position.y), Vector2(1,-1), 0.1) ~= nil then
									self.Entity.RigidbodyComponent:SetForce(Vector2(0,0)) -- 가해지던 힘 멈추기
									log("무야홍")
								end
								--]]
								--self.Entity.StateComponent:ChangeState("CROUCH")
								if self.Direction == -1 then
									self:LeftDashEffect(_UserService.LocalPlayer.Name, self.Front_effect)
									--_EffectService:PlayEffectAttached(self.Front_effect, self.Entity, Vector3(0,0,0), 0, Vector3(1,1,1), false)
									--log(tostring(self.Front_effect))
								else
									self:RightDashEffect(_UserService.LocalPlayer.Name, self.Front_effect)
									--_EffectService:PlayEffectAttached(self.Front_effect, self.Entity, Vector3(0,0,0), 180, Vector3(1,1,1), false)
									--log(tostring(self.Front_effect))
								end
										
								
								self.Entity.ActionManager:NumberToAnim(math.floor(self.currActionCnt))
								
								wait(0.25)
								if self.Map.FootholdComponent:Raycast(Vector2(self.Entity.TransformComponent.Position.x, self.Entity.TransformComponent.Position.y), Vector2.down, 0.3) == nil 
									and self.currActionCnt < self.maxActionCnt then
									--log("발판존재X")
									self:GravityHandler(0.0)
								else
									self:GravityHandler(1.0)
								end
								
								
								
								if self.Entity.RigidbodyComponent:IsOnGround() == false then
									--self.isGround = false
								end
							end
							
						elseif key == KeyboardKey.S  or key == KeyboardKey.DownArrow then
							--log("하강 Direction: "..self.Direction.."Key: "..tostring(key))
							self.Entity.RigidbodyComponent.Enable = true
							self.isTyping = true
							
							if self.enable ~= true then	
									return
							end
							
							self.IndicatorCnt = self.IndicatorCnt + 1
							self.Entity.RigidbodyComponent.Gravity = 1.0 -- 중력 1로 초기화
							self.previousPosition = self.Entity.TransformComponent.Position -- 하강 이전 위치 저장
							
							self.Entity.StateComponent:ChangeState("FALL")
							self.Entity.RigidbodyComponent:SetForce(Vector2(0,-30))
							self:DownEffect(_UserService.LocalPlayer.Name, self.Down_effect)
							--_EffectService:PlayEffectAttached(self.Down_effect, self.Entity, Vector3(0,0,0), 90, Vector3(1,1,1), false)
							--log(tostring(self.Down_effect))
						end
					end
						
					
				end,
				Scope = 0,
				ExecSpace = 0
			},
			{
				Name = "HandleTriggerStayEvent",
				EventName = "TriggerEnterEvent",
				Target = "self",
				Code = function()
					-- Parameters
					local TriggerBodyEntity = event.TriggerBodyEntity
					--------------------------------------------------------
					
					if TriggerBodyEntity.TagComponent ~= nil and TriggerBodyEntity.TagComponent.Tags[1] == "Wall" then -- 밑 벽 닿는 척 하기
						local posX = self.Entity.TransformComponent.Position.x
						local posY = self.Entity.TransformComponent.Position.y
						
						self.Entity.RigidbodyComponent:SetForce(Vector2(0,0)) -- 가해지던 힘 멈추기
						self.Entity.RigidbodyComponent:SetForce(Vector2.Normalize(Vector2(self.previousPosition.x - posX, self.previousPosition.y - posY))*2) -- 왔던 방향으로 밀어내기
					end
				end,
				Scope = 2,
				ExecSpace = 2
			},
			{
				Name = "HandleTriggerLeaveEvent",
				EventName = "TriggerLeaveEvent",
				Target = "self",
				Code = function()
					-- Parameters
					local TriggerBodyEntity = event.TriggerBodyEntity
					--------------------------------------------------------
					if TriggerBodyEntity.TagComponent and TriggerBodyEntity.TagComponent.Tags[1] == "Wall" then
						self.previousPosition = self.Entity.TransformComponent.Position
					end
					
				end,
				Scope = 2,
				ExecSpace = 2
			},
			{
				Name = "HandleFootholdEnterEvent",
				EventName = "FootholdEnterEvent",
				Target = "self",
				Code = function()
					-- Parameters
					local Entity = event.Entity
					local Foothold = event.Foothold
					--------------------------------------------------------
					--log("벽 붙음")
					self.isGround = true
					self.currActionCnt = 0	 -- 액션 횟수 초기화
					if self.Entity.ActionManager.curr_2 ~= nil then
						self.Entity.ActionManager:NumberToAnim(math.floor(self.currActionCnt))
					end
					
					self.Entity.RigidbodyComponent.Gravity = 1.0 -- 중력 1로 초기화
					self.NoteCnt = 0 -- cnt: 박자 대기중인 상태 초기화 (0이 아니면 점프 후 공중에서 기다리는 상태)
				end,
				Scope = 2,
				ExecSpace = 2
			}
		}
	}
}

return unpackedContents