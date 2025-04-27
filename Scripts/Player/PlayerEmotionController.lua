unpackedContents = {
	uniqueIdentifier = "9f10b5c4db9b4555915e1600e8fa1059",
	bundleIdentifier = "2c89a498317848aab9fe46cd70bf74bb",
	category = "codeblock",
	entryId = "075a9bf4-321c-4efb-aa4b-256f01964113",
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
		Id = "075a9bf4-321c-4efb-aa4b-256f01964113",
		Language = 1,
		Name = "PlayerEmotionController",
		Type = 1,
		Source = 0,
		Target = nil,
		ModifyTime = "2022-11-06T20:58:45.3000692+09:00",
		Properties = {
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
						Name = "emotion"
					},
					{
						Type = "string",
						DefaultValue = nil,
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
						DefaultValue = nil,
						SyncDirection = 0,
						Attributes = {
						},
						Name = "emotionKey"
					},
					{
						Type = "string",
						DefaultValue = nil,
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
				end,
				Scope = 0,
				ExecSpace = 0
			}
		}
	}
}

return unpackedContents