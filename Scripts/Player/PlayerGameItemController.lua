unpackedContents = {
	uniqueIdentifier = "bf976ef61db244819599b4dd53695d20",
	bundleIdentifier = "2c89a498317848aab9fe46cd70bf74bb",
	category = "codeblock",
	entryId = "e46a68e7-c0a6-414a-b9c8-f85010c5bddb",
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
		Id = "e46a68e7-c0a6-414a-b9c8-f85010c5bddb",
		Language = 1,
		Name = "PlayerGameItemController",
		Type = 1,
		Source = 0,
		Target = nil,
		ModifyTime = "2022-11-14T17:54:57.7969763+09:00",
		Properties = {
		},
		Methods = {
		},
		EntityEventHandlers = {
			{
				Name = "HandleTriggerEnterEvent",
				EventName = "TriggerEnterEvent",
				Target = "self",
				Code = function()
					-- Parameters
					local TriggerBodyEntity = event.TriggerBodyEntity
					local playerPosX = self.Entity.TransformComponent.Position.x
					local playerPosY = self.Entity.TransformComponent.Position.y
					local posX = TriggerBodyEntity.TransformComponent.Position.x
					local posY = TriggerBodyEntity.TransformComponent.Position.y
					local posZ = TriggerBodyEntity.TransformComponent.Position.z
					local TagName = nil
					local playerColliderWorldPos = Vector2(playerPosX, playerPosY + self.Entity.TriggerComponent.ColliderOffset.y)
					local TriggerColliderWorldPos = Vector2(posX, posY + TriggerBodyEntity.TriggerComponent.ColliderOffset.y)
					
					if TriggerBodyEntity.TagComponent ~= nil then
						TagName = TriggerBodyEntity.TagComponent.Tags[1]
					else
						TagName = nil
					end
					
					-- (math.abs(TriggerColliderWorldPos.x - playerColliderWorldPos.x) > 0.25 or 
					-- or math.abs(TriggerColliderWorldPos.y - playerColliderWorldPos.y) > 0.25 
					--------------------------------------------------------
					if TagName == nil then
						--log("Out Trigger: "..tostring(TriggerColliderWorldPos) .. " Player: " .. tostring(playerColliderWorldPos))
						return
					end
					
					--log("In Trigger: "..tostring(TriggerColliderWorldPos) .. " Player: " .. tostring(playerColliderWorldPos))
					--[[
					if TagName == "Stop" then -- 공중 멈춤 아이템
						self.Entity.RigidbodyComponent:SetForce(Vector2(0,0))
						self.Entity.RigidbodyComponent.Enable = false
						--self.Entity.RigidbodyComponent.Gravity = 0
						--self.Entity.MovementComponent:SetPosition(Vector2(TriggerBodyEntity.TransformComponent.Position.x, TriggerBodyEntity.TransformComponent.Position.y))
						_SoundService:PlaySound("0350ad2d1d5944f8ae6e0bd2f930648a",0.5) -- 623
						_EffectService:PlayEffect("4be4a68ede844885b6a5b9cee5d03955", TriggerBodyEntity, TriggerBodyEntity.TransformComponent.Position,0, Vector3(1.0, 1.0, 1.0), false)
							
							
						--if _UserService.LocalPlayer.CurrentMapName == "Ins199" then
						TriggerBodyEntity.Visible = false
						TriggerBodyEntity.Enable = false
						wait(2.5)
							
						TriggerBodyEntity.Enable = true
						TriggerBodyEntity.Visible = true
						--[[else
							TriggerBodyEntity.Visible = false
							TriggerBodyEntity.Enable = false
						end]]--
					--]]
					if TagName == "Coin" then -- 코인 아이템
						if TriggerBodyEntity.SoundComponent:IsPlaying() == false then
							TriggerBodyEntity.SoundComponent:Play()	
						end
						
						_EffectService:PlayEffect("045cd2b4b08d439fb5df3e13481b3793", TriggerBodyEntity, TriggerBodyEntity.TransformComponent.Position,0, Vector3(1.0, 1.0, 1.0), false)
					--	_UserService.LocalPlayer.CurrentMap.ScoreManager.coinScore = _UserService.LocalPlayer.CurrentMap.ScoreManager.coinScore + 10
						if self.Entity.Name == _UserService.LocalPlayer.Name then
							_UserService.LocalPlayer.CurrentMap.ScoreManager:AddCoinScore()
							_UserService.LocalPlayer.PlayerGameState:GetCoinScore(10)
							--_UserService.LocalPlayer.PlayerGameState.coinScore = _UserService.LocalPlayer.PlayerGameState.coinScore + 10
							_UserService.LocalPlayer.PlayerUIController:SetCoinScore(_UserService.LocalPlayer.CurrentMap.ScoreManager.coinScore)
						end
						
						
						TriggerBodyEntity.Visible = false
						wait(1.0)
						
						if _UserService.LocalPlayer.CurrentMapName == "Ins199" then
							TriggerBodyEntity.Enable = false
							wait(2.5)
							
							TriggerBodyEntity.Enable = true
							TriggerBodyEntity.Visible = true
						else
							TriggerBodyEntity.Visible = false
							TriggerBodyEntity.Enable = false
						end
					--[[
					elseif TagName == "Reset" then -- 액션 횟수 초기화 아이템
						self.Entity.PlayerGameMovementController.currActionCnt = 0
						self.Entity.ActionManager:NumberToAnim(self.Entity.PlayerGameMovementController.currActionCnt)
						_SoundService:PlaySound("0350ad2d1d5944f8ae6e0bd2f930648a",0.5) -- 623
						_EffectService:PlayEffect("95ac4f0b4d5945af995a1b486bceb681", TriggerBodyEntity, TriggerBodyEntity.TransformComponent.Position,0, Vector3(1.0, 1.0, 1.0), false)
						
						--if _UserService.LocalPlayer.CurrentMapName == "Ins199" then
							TriggerBodyEntity.Visible = false
							TriggerBodyEntity.Enable = false
							wait(2.5)
							
							TriggerBodyEntity.Enable = true
							TriggerBodyEntity.Visible = true
						--[[else
							TriggerBodyEntity.Visible = false
							TriggerBodyEntity.Enable = false
						end]]
					--]]
					elseif TagName == "enemy" 	or TagName == "obstacle" then
						if TriggerBodyEntity.EnemyHit ~= nil and TriggerBodyEntity.EnemyHit.isOnHit == false then
							self.Entity.RigidbodyComponent:SetForce(Vector2(0,0))
							self.Entity.RigidbodyComponent.Enable = false
							--self.Entity.RigidbodyComponent.Gravity = 0
							--self.Entity.MovementComponent:SetPosition(Vector2(TriggerBodyEntity.TransformComponent.Position.x, TriggerBodyEntity.TransformComponent.Position.y))
							--_SoundService:PlaySound("0350ad2d1d5944f8ae6e0bd2f930648a",0.5) -- 623
							--_EffectService:PlayEffect("4be4a68ede844885b6a5b9cee5d03955", TriggerBodyEntity, TriggerBodyEntity.TransformComponent.Position,0, Vector3(1.0, 1.0, 1.0), false)
							
							self.Entity.PlayerGameMovementController.currActionCnt = 0
							self.Entity.ActionManager:NumberToAnim(self.Entity.PlayerGameMovementController.currActionCnt)
							--_SoundService:PlaySound("0350ad2d1d5944f8ae6e0bd2f930648a",0.5) -- 623
							--_EffectService:PlayEffect("95ac4f0b4d5945af995a1b486bceb681", TriggerBodyEntity, TriggerBodyEntity.TransformComponent.Position,0, Vector3(1.0, 1.0, 1.0), false)
							
							if _UserService.LocalPlayer.CurrentMapName == "Ins199" then
								--TriggerBodyEntity.Visible = false
								--TriggerBodyEntity.Enable = false
								wait(2.5)
									
								TriggerBodyEntity.Enable = true
								TriggerBodyEntity.Visible = true
							else
								--TriggerBodyEntity.Visible = false
								--TriggerBodyEntity.Enable = false
							end
						end
					--[[
					elseif TagName == "ResetNStop" then
						self.Entity.RigidbodyComponent:SetForce(Vector2(0,0))
						self.Entity.RigidbodyComponent.Enable = false
						self.Entity.PlayerGameMovementController.currActionCnt = 0
						self.Entity.ActionManager:NumberToAnim(self.Entity.PlayerGameMovementController.currActionCnt)
						_EffectService:PlayEffect("f8d487b417e243b1bc1a047a4cb4c448", TriggerBodyEntity, TriggerBodyEntity.TransformComponent.Position,0, Vector3(1.0, 1.0, 1.0), false)
						--self.Entity.RigidbodyComponent.Gravity = 0
						--self.Entity.MovementComponent:SetPosition(Vector2(TriggerBodyEntity.TransformComponent.Position.x, TriggerBodyEntity.TransformComponent.Position.y))
						_SoundService:PlaySound("0350ad2d1d5944f8ae6e0bd2f930648a",0.5) -- 623
						--if _UserService.LocalPlayer.CurrentMapName == "Ins199" then
							TriggerBodyEntity.Visible = false
							TriggerBodyEntity.Enable = false
							wait(2.5)
							
							TriggerBodyEntity.Enable = true
							TriggerBodyEntity.Visible = true
						--[[else
							TriggerBodyEntity.Visible = false
							TriggerBodyEntity.Enable = false
						end]]
					--]]
					end
					
				end,
				Scope = 2,
				ExecSpace = 2
			},
			{
				Name = "HandleTriggerStayEvent",
				EventName = "TriggerStayEvent",
				Target = "self",
				Code = function()
					-- Parameters
					local TriggerBodyEntity = event.TriggerBodyEntity
					local playerPosX = self.Entity.TransformComponent.Position.x
					local playerPosY = self.Entity.TransformComponent.Position.y
					local posX = TriggerBodyEntity.TransformComponent.Position.x
					local posY = TriggerBodyEntity.TransformComponent.Position.y
					local posZ = TriggerBodyEntity.TransformComponent.Position.z
					local TagName = nil
					local playerColliderWorldPos = Vector2(playerPosX, playerPosY + self.Entity.TriggerComponent.ColliderOffset.y)
					local TriggerColliderWorldPos = Vector2(posX, posY + TriggerBodyEntity.TriggerComponent.ColliderOffset.y)
					local colliderDif = math.abs(self.Entity.TriggerComponent.ColliderOffset.y - TriggerBodyEntity.TriggerComponent.ColliderOffset.y)
					if TriggerBodyEntity.TagComponent ~= nil then
						TagName = TriggerBodyEntity.TagComponent.Tags[1]
					else
						TagName = nil
					end
					
					-- (math.abs(TriggerColliderWorldPos.x - playerColliderWorldPos.x) > 0.25 or 
					-- or math.abs(TriggerColliderWorldPos.y - playerColliderWorldPos.y) > 0.25 
					--------------------------------------------------------
					if TagName == nil or math.abs(TriggerColliderWorldPos.x - playerColliderWorldPos.x) > colliderDif*3.0
					or math.abs(TriggerColliderWorldPos.y - playerColliderWorldPos.y) > colliderDif*3.0 then 
						--log("Out Trigger: "..tostring(TriggerColliderWorldPos) .. " Player: " .. tostring(playerColliderWorldPos))
						return
					end
					
					if TagName == "Stop" then -- 공중 멈춤 아이템
						if self.Entity.Name ~= _UserService.LocalPlayer.Name then
							return
						end
						self.Entity.RigidbodyComponent:SetForce(Vector2(0,0))
						self.Entity.RigidbodyComponent.Enable = false
						--self.Entity.RigidbodyComponent.Gravity = 0
						--self.Entity.MovementComponent:SetPosition(Vector2(TriggerBodyEntity.TransformComponent.Position.x, TriggerBodyEntity.TransformComponent.Position.y))
						_SoundService:PlaySound("0350ad2d1d5944f8ae6e0bd2f930648a",0.5) -- 623
						_EffectService:PlayEffect("4be4a68ede844885b6a5b9cee5d03955", TriggerBodyEntity, TriggerBodyEntity.TransformComponent.Position,0, Vector3(1.0, 1.0, 1.0), false)
							
							
						--if _UserService.LocalPlayer.CurrentMapName == "Ins199" then
						TriggerBodyEntity.Visible = false
						TriggerBodyEntity.Enable = false
						wait(2.5)
							
						TriggerBodyEntity.Enable = true
						TriggerBodyEntity.Visible = true
						--[[else
							TriggerBodyEntity.Visible = false
							TriggerBodyEntity.Enable = false
						end]]--
					elseif TagName == "Reset" then -- 액션 횟수 초기화 아이템
						if self.Entity.Name ~= _UserService.LocalPlayer.Name then
							return
						end
						self.Entity.PlayerGameMovementController.currActionCnt = 0
						self.Entity.ActionManager:NumberToAnim(self.Entity.PlayerGameMovementController.currActionCnt)
						_SoundService:PlaySound("0350ad2d1d5944f8ae6e0bd2f930648a",0.5) -- 623
						_EffectService:PlayEffect("95ac4f0b4d5945af995a1b486bceb681", TriggerBodyEntity, TriggerBodyEntity.TransformComponent.Position,0, Vector3(1.0, 1.0, 1.0), false)
						
						--if _UserService.LocalPlayer.CurrentMapName == "Ins199" then
							TriggerBodyEntity.Visible = false
							TriggerBodyEntity.Enable = false
							wait(2.5)
							
							TriggerBodyEntity.Enable = true
							TriggerBodyEntity.Visible = true
						--[[else
							TriggerBodyEntity.Visible = false
							TriggerBodyEntity.Enable = false
						end]]
					elseif TagName == "ResetNStop" then
						
						if TriggerBodyEntity.Visible ~= true then
							return
						end
						
						if self.Entity.Name ~= _UserService.LocalPlayer.Name then
							return
						end
						self.Entity.RigidbodyComponent:SetForce(Vector2(0,0))
						self.Entity.RigidbodyComponent.Enable = false
						self.Entity.PlayerGameMovementController.currActionCnt = 0
						self.Entity.ActionManager:NumberToAnim(0)
						_EffectService:PlayEffect("f8d487b417e243b1bc1a047a4cb4c448", TriggerBodyEntity, TriggerBodyEntity.TransformComponent.Position,0, Vector3(1.0, 1.0, 1.0), false)
						--self.Entity.RigidbodyComponent.Gravity = 0
						--self.Entity.MovementComponent:SetPosition(Vector2(TriggerBodyEntity.TransformComponent.Position.x, TriggerBodyEntity.TransformComponent.Position.y))
						_SoundService:PlaySound("0350ad2d1d5944f8ae6e0bd2f930648a",0.5) -- 623
						--if _UserService.LocalPlayer.CurrentMapName == "Ins199" then
							TriggerBodyEntity.Visible = false
							TriggerBodyEntity.Enable = false
							wait(2.5)
							
							TriggerBodyEntity.Enable = true
							TriggerBodyEntity.Visible = true
						--[[else
							TriggerBodyEntity.Visible = false
							TriggerBodyEntity.Enable = false
						end]]
					--]]
					end
					
				end,
				Scope = 2,
				ExecSpace = 2
			}
		}
	}
}

return unpackedContents