unpackedContents = {
	uniqueIdentifier = "7669b6e406824ff299a14b0f9abe611c",
	bundleIdentifier = "2c89a498317848aab9fe46cd70bf74bb",
	category = "codeblock",
	entryId = "f55d957f-f752-4cfd-ab45-58b1b2d60103",
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
		Id = "f55d957f-f752-4cfd-ab45-58b1b2d60103",
		Language = 1,
		Name = "GameController_Story",
		Type = 1,
		Source = 0,
		Target = nil,
		ModifyTime = "2022-11-06T13:31:32.8630027+09:00",
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
					wait(5)
					-- [ 카운트 다운 전 ] 
						-- 유저 움직임 끄기 
						
						-- notice panel 끄기  
						self.noticePanel.Enable = false
						-- 카운트 다운 시작
						self:StartCountDown()
					
					-- [ 카운트 다운 후 ] 
						-- 플레이어 움직임 허용 
						local playersArr = _UserService:GetUsersByMapName(self.Entity.Name)
						for index, player in pairs(playersArr) do
							player.Player:PlayerInGameMap_setting()
						end
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
					
					-- 노래 끄고 시작 
					self.Entity.SoundComponent.Enable = false
					
					-- notice 패널 키고 시작
					self.noticePanel.Enable = true
					
					-- result 패널 끄고 시작
					self.resultPanel.Enable = false 
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
				Arguments = nil,
				Code = function()
					self.enterUserCnt = self.enterUserCnt + 1
					
					if self.enterUserCnt == self.needUserCnt then
						self:StartGame()
					end
				end,
				Scope = 2,
				ExecSpace = 6,
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
				Arguments = nil,
				Code = function()
					-- 노래 끄기 
					self.Entity.SoundComponent.Enable = false
					
					-- 노트 UI 끄기 
					local notePanel = _EntityService:GetEntityByPath("/ui/GameUIGroup/NotePanel")
					notePanel.Enable = false
					
				end,
				Scope = 2,
				ExecSpace = 6,
				Attributes = {
				},
				Name = "EndGame_GameController"
			}
		},
		EntityEventHandlers = {
		}
	}
}

return unpackedContents