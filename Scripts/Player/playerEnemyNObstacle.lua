unpackedContents = {
	uniqueIdentifier = "4213cd314e0b4a24a7b6d084e6ae4bcc",
	bundleIdentifier = "2c89a498317848aab9fe46cd70bf74bb",
	category = "codeblock",
	entryId = "64be1ef5-98b9-4954-abc3-17e56f1a3e60",
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
		Id = "64be1ef5-98b9-4954-abc3-17e56f1a3e60",
		Language = 1,
		Name = "playerEnemyNObstacle",
		Type = 1,
		Source = 0,
		Target = nil,
		ModifyTime = "2022-11-12T17:15:57.9877784+09:00",
		Properties = {
			{
				Type = "Vector3",
				DefaultValue = "Vector3(0,0,0)",
				SyncDirection = 3,
				Attributes = {
				},
				Name = "prevPosition"
			},
			{
				Type = "Vector3",
				DefaultValue = "Vector3(0,0,0)",
				SyncDirection = 3,
				Attributes = {
				},
				Name = "curPosition"
			},
			{
				Type = "Vector2",
				DefaultValue = "Vector2(0,0)",
				SyncDirection = 3,
				Attributes = {
				},
				Name = "positionDif"
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
						Type = "Vector3",
						DefaultValue = "Vector3(0,0,0)",
						SyncDirection = 0,
						Attributes = {
						},
						Name = "prev"
					},
					{
						Type = "Vector3",
						DefaultValue = "Vector3(0,0,0)",
						SyncDirection = 0,
						Attributes = {
						},
						Name = "cur"
					}
				},
				Code = function(prev, cur)
					self.positionDif.x = cur.x - prev.x
					self.positionDif.y = cur.y - prev.y
					--self:ConfirmDirection()
				end,
				Scope = 2,
				ExecSpace = 0,
				Attributes = {
				},
				Name = "CalpositionDiff"
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
					if self.positionDif.y < 0 then
						log("위에서 접근")
					elseif self.positionDif.y >= 0 then
						log("아래서 접근")
					end
				end,
				Scope = 2,
				ExecSpace = 0,
				Attributes = {
				},
				Name = "ConfirmDirection"
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
					self.Entity.StateComponent:ChangeState("DEAD")
				end,
				Scope = 2,
				ExecSpace = 0,
				Attributes = {
				},
				Name = "SetDie"
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
					self.Entity.StateComponent:ChangeState("IDLE")
				end,
				Scope = 2,
				ExecSpace = 0,
				Attributes = {
				},
				Name = "SetMove"
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
					if key == KeyboardKey.A or key == KeyboardKey.S or key == KeyboardKey.D or key == KeyboardKey.W or key == KeyboardKey.UpArrow or key == KeyboardKey.DownArrow or key == KeyboardKey.LeftArrow or key == KeyboardKey.RightArrow then
						self.prevPosition = _UserService.LocalPlayer.TransformComponent.Position
						--log(self.prevPosition)
					end
				end,
				Scope = 0,
				ExecSpace = 0
			},
			{
				Name = "HandleTriggerEnterEvent",
				EventName = "TriggerEnterEvent",
				Target = "self",
				Code = function()
					-- Parameters
					local TriggerBodyEntity = event.TriggerBodyEntity
					--------------------------------------------------------
					if TriggerBodyEntity.TagComponent ~= nil and TriggerBodyEntity.TagComponent.Tags[1] == "enemy" then
						self.curPosition = self.Entity.TransformComponent.Position
						--log(self.curPosition)
						--TriggerBodyEntity.TriggerComponent.Enable = false
						self:CalpositionDiff(self.prevPosition, self.curPosition)
						--log("positionDif" .. self.positionDif.y)
						if self.positionDif.y < 0 then
							
							_UserService.LocalPlayer.PlayerAttack:NormalAttack()
					
						elseif self.positionDif.y >= 0 then
							if(TriggerBodyEntity.EnemyHit ~= nil) then
								TriggerBodyEntity.EnemyHit:SetAttack()
								--self:SetDie()
								_UserService.LocalPlayer.CurrentMap.TimeValueCal:minusOne(10)
								--wait(2)
								--self:SetMove()
					--			local timeval = _EntityService:GetEntityByPath("/maps/Ins100/NoteManagerEntity")
					--			timeval.TimeValueCal:minusOne(10)
					
					--			self.Entity.RigidbodyComponent:SetForce(-1 * self.positionDif)
								--self.Entity.RigidbodyComponent:SetPosition(Vector2(TriggerBodyEntity.TransformComponent.Position.x,TriggerBodyEntity.TransformComponent.Position.y))
								--TriggerBodyEntity.Enable = false
								--local animsheet = TriggerBodyEntity.StateAnimationComponent.ActionSheet.Keys[2]
								--log(animsheet)
								--local animsheet1 = TriggerBodyEntity.StateAnimationComponent.ActionSheet.Values[3]
								--TriggerBodyEntity.StateAnimationComponent:SetActionSheet("stand", animsheet1)
								--log(animsheet1)
					--			TriggerBodyEntity.StateComponent:ChangeState("die")
							else
								--TriggerBodyEntity.Enable = true
							end
					
								--TriggerBodyEntity.StateComponent:ChangeState("hit")
						end
						
						
					elseif TriggerBodyEntity.TagComponent ~= nil and TriggerBodyEntity.TagComponent.Tags[1] == "obstacle" then
						--TriggerBodyEntity.EnemyObstacle:WhenObstacleTouched()
						--self:SetDie()
						_UserService.LocalPlayer.CurrentMap.TimeValueCal:minusOne(10)
						--wait(2)
						--self:SetMove()
						--local timeval = _EntityService:GetEntityByPath("/maps/Ins100/NoteManagerEntity")
						if _UserService.LocalPlayer.CurrentMapName == "Ins199" then
							TriggerBodyEntity.Visible = false
							TriggerBodyEntity.Enable = false
							wait(2.5)
								
							TriggerBodyEntity.Enable = true
							TriggerBodyEntity.Visible = true
						else
							TriggerBodyEntity.Visible = false
							TriggerBodyEntity.Enable = false
						end
					end
					
				end,
				Scope = 2,
				ExecSpace = 2
			}
		}
	}
}

return unpackedContents