unpackedContents = {
	uniqueIdentifier = "37f1d4f9fd864a8282f632ddca1d6d41",
	bundleIdentifier = "2c89a498317848aab9fe46cd70bf74bb",
	category = "codeblock",
	entryId = "ae33a625-fd50-414d-a175-0d5f410a3b60",
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
		Id = "ae33a625-fd50-414d-a175-0d5f410a3b60",
		Language = 1,
		Name = "UIPartyModeButton",
		Type = 1,
		Source = 0,
		Target = nil,
		ModifyTime = "2022-11-12T19:30:53.0864687+09:00",
		Properties = {
			{
				Type = "Entity",
				DefaultValue = "nil",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "dot"
			},
			{
				Type = "Entity",
				DefaultValue = "nil",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "underline"
			},
			{
				Type = "Entity",
				DefaultValue = "e98b8473-acee-4cf3-a6cc-2836ee1e59da",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "PartyUIGroup"
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
					self.dot = self.Entity:GetChildByName("Dot")
					self.underline = self.Entity:GetChildByName("Underline")
				end,
				Scope = 2,
				ExecSpace = 2,
				Attributes = {
				},
				Name = "OnBeginPlay"
			}
		},
		EntityEventHandlers = {
			{
				Name = "HandleButtonStateChangeEvent",
				EventName = "ButtonStateChangeEvent",
				Target = "self",
				Code = function()
					-- Parameters
					local state = event.state
					--------------------------------------------------------
					local stringState = tostring(state)
					
					if stringState == "Normal" then
						self.Entity.TextComponent.FontColor = Color(0.4, 0.4, 0.4,1)
						self.dot.SpriteGUIRendererComponent.Color = Color(0.6, 0.6, 0.6, 1) 
						self.underline.Enable = false
					elseif stringState == "Hover" then
						self.Entity.TextComponent.FontColor = Color(0,0,0,1)
						self.dot.SpriteGUIRendererComponent.Color = Color(0,0,0,1)
						self.underline.Enable = true
					elseif stringState == "Pressed" then
						self.Entity.TextComponent.FontColor = Color(0,0,0,1)
						self.dot.SpriteGUIRendererComponent.Color = Color(0,0,0,1)
						self.underline.Enable = true
					end
				end,
				Scope = 0,
				ExecSpace = 0
			},
			{
				Name = "HandleButtonClickEvent",
				EventName = "ButtonClickEvent",
				Target = "self",
				Code = function()
					-- Parameters
					local Entity = event.Entity
					--------------------------------------------------------
					-- 이미 파티 등록
					if _UserService.LocalPlayer.PlayerPartyController.isInParty then
						self.Entity.Parent.Parent.UINPC_new1_DialogPanel:AlreadyInParty()
					
					-- 이미 배틀 등록
					elseif _UserService.LocalPlayer.Player.isReadyToMultiPlay then
						local alreadyInBattleNoticePanel = _EntityService:GetEntityByPath("/ui/LobbyUIGroup/AlreadyInBattleNoticePanel")
						alreadyInBattleNoticePanel.Enable = true
					
					-- 이미 스토리 등록
					elseif _UserService.LocalPlayer.Player.isReadyToPlay then
						-- 아무것도 안함. 로딩중인것처럼	
					else
						self.Entity.Parent.Parent.UINPC_new1_DialogPanel:PartyModeButtonClickedFunc()
					end
				end,
				Scope = 0,
				ExecSpace = 0
			}
		}
	}
}

return unpackedContents