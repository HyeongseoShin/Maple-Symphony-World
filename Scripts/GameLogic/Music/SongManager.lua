unpackedContents = {
	uniqueIdentifier = "a691e6a20ea44f6a970c0f1ba95d8324",
	bundleIdentifier = "2c89a498317848aab9fe46cd70bf74bb",
	category = "codeblock",
	entryId = "47ce965c-1d03-4980-8b2d-0550bdb5adc9",
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
		Id = "47ce965c-1d03-4980-8b2d-0550bdb5adc9",
		Language = 1,
		Name = "SongManager",
		Type = 1,
		Source = 0,
		Target = nil,
		ModifyTime = "2022-11-14T05:59:46.1605828+09:00",
		Properties = {
			{
				Type = "string",
				DefaultValue = "",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "mapName"
			},
			{
				Type = "number",
				DefaultValue = "0",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "songPosition"
			},
			{
				Type = "number",
				DefaultValue = "0.0",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "songPosInBeats"
			},
			{
				Type = "number",
				DefaultValue = "0.0",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "secPerBeat"
			},
			{
				Type = "number",
				DefaultValue = "0.0",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "departTimeSong"
			},
			{
				Type = "number",
				DefaultValue = "0",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "bpm"
			},
			{
				Type = "string",
				DefaultValue = "",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "AudioRUID"
			},
			{
				Type = "number",
				DefaultValue = "1",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "nextIndex"
			},
			{
				Type = "array",
				DefaultValue = "number",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "notes"
			},
			{
				Type = "number",
				DefaultValue = "0",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "beatsShownInAdvance"
			},
			{
				Type = "number",
				DefaultValue = "3",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "BeatsInScroll"
			},
			{
				Type = "Entity",
				DefaultValue = "nil",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "Indicator"
			},
			{
				Type = "string",
				DefaultValue = "",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "DataSetName"
			},
			{
				Type = "boolean",
				DefaultValue = "false",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "isStartMusic"
			},
			{
				Type = "Entity",
				DefaultValue = "80a32c7b-0a76-452c-b458-e5eb49b18ed8",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "BGM"
			},
			{
				Type = "array",
				DefaultValue = "number",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "nodetypeTable"
			},
			{
				Type = "array",
				DefaultValue = "Entity",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "noteEntities"
			},
			{
				Type = "number",
				DefaultValue = "20",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "poolCapacity"
			},
			{
				Type = "boolean",
				DefaultValue = "false",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "isSetPlayerGameMovementControllerEnable"
			},
			{
				Type = "boolean",
				DefaultValue = "false",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "isTutorialStart"
			},
			{
				Type = "number",
				DefaultValue = "0",
				SyncDirection = 0,
				Attributes = {
				},
				Name = "songDuration"
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
					if _UserService.LocalPlayer.CurrentMapName ~= "Ins199" then
						self:MusicInitialize()
					else
						self:MusicInitialize()
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
						Type = "number",
						DefaultValue = nil,
						SyncDirection = 0,
						Attributes = {
						},
						Name = "delta"
					}
				},
				Code = function(delta)
					local uihelperset = _EntityService:GetEntityByPath("/ui/TutorialUIGroup/UIHelperSet")
					if (uihelperset.Enable ~= false) then
						if _UserService.LocalPlayer.CurrentMapName == "Ins199" and uihelperset.Enable and self.isTutorialStart == false then
							--self:MusicInitialize()
							
							local noteParents 
					
							if self.Entity.CurrentMapName == "Ins199" then
								noteParents = _EntityService:GetEntitiesByPath("/ui/TutorialUIGroup/UIHelperSet/Tutorial_NotePanel/Notes/Model_Indi_Parent")
							end
							
							-- 노트 발생
							for nextindex = 1, self.poolCapacity do
								self:NoteGenerate(nextindex, noteParents[nextindex])
							end
							
							--self:musicStart()
						end
					end
					
					if self:GetIsMusicStart() == false then
						return
					end
					-- 초로 위치를 계산한다.
					self.departTimeSong = self.departTimeSong + delta
					self.songPosition = self.departTimeSong
					
					-- 비트로 위치를 계산한다
					self.songPosInBeats = self.songPosition / self.secPerBeat
					
					-- 노트를 더한다.
					if (self.nextIndex <= self:tablelength(self.notes) and self.notes[self.nextIndex] < self.songPosInBeats + self.beatsShownInAdvance) then
						local N = self.nextIndex 
						if N % 20 > 0.0 then
							N = self.nextIndex % self.poolCapacity
						else
							N = 20
						end
						
						N = math.floor(N)
						
						self.nextIndex = self.nextIndex + 1
						self.noteEntities[N].Enable = true
						self.noteEntities[N].Visible = true
						self.noteEntities[N].Indicator:SyncMapName()
						self.noteEntities[N].Indicator:InitiateNote()
					end
					--[[
					if (self.songPosInBeats > 0.5 and self.songPosInBeats < 1 and self.isSetPlayerGameMovementControllerEnable) then
						self:SetPlayerGameMovementControllerEnable(true)
						self.isSetPlayerGameMovementControllerEnable = true
					end
					]]--
					
					
					if  _UserService.LocalPlayer.CurrentMapName == "Ins199" and self.nextIndex >= self:tablelength(self.notes) then
						self.departTimeSong = 0
						self.nextIndex = 1
					end
					
					local isDown = self:GetIsMusicDone()
					
					if isDown then
						--[[
						if self.Entity:GetComponent(type(GameController_Multi)) ~= nil and self.Entity.GameController_Multi.endUserCnt == 0 then
							self.Entity.GameController_Multi:GameOverFunction(0)
						end
						--]]
						
						if self.Entity.GameController_Story ~= nil then
							if _UserService.LocalPlayer.CurrentMapName ~= "Ins199" then
								self.isStartMusic = false	
							end
						end
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
				},
				Code = function()
					_SoundService:LoadSound(self.AudioRUID)
					_SoundService:PlayBGM(self.AudioRUID, 1, self.Entity)
					-- 노래가 시작한 때를 기록한다.
					self.departTimeSong = 0
					self:SetIsMusicStart(true)
					if  _UserService.LocalPlayer.CurrentMapName == "Ins199" then
						self.isTutorialStart = true
					end
					--self:SetPlayerGameMovementControllerEnable(false)
				end,
				Scope = 2,
				ExecSpace = 0,
				Attributes = {
				},
				Name = "musicStart"
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
						Name = "DataSetName"
					}
				},
				Code = function(DataSetName)
					-- beat 노래 노트 DataSet에서 가져오기
					local dataSet = _DataService:GetTable(DataSetName)    --위에 생성한 데이터의 이름으로 데이터 테이블을 가져옵니다.
					
					-- 노래 노트 입력, 노트 종류 입력
					local rows = dataSet:GetAllRow()
					for i = 1, dataSet:GetRowCount() do
						table.insert(self.notes, dataSet:GetCell(i, "posInBeat"))
						table.insert(self.nodetypeTable, dataSet:GetCell(i, "nodeType"))
					end
				end,
				Scope = 2,
				ExecSpace = 0,
				Attributes = {
				},
				Name = "UploadMusicNoteDataSet"
			},
			{
				Return = {
					Type = "number",
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
						Name = "T"
					}
				},
				Code = function(T)
					 local count = 0
					 for _ in pairs(T) do count = count + 1 end
					 return count
				end,
				Scope = 2,
				ExecSpace = 0,
				Attributes = {
				},
				Name = "tablelength"
			},
			{
				Return = {
					Type = "number",
					DefaultValue = nil,
					SyncDirection = 0,
					Attributes = {
					},
					Name = nil
				},
				Arguments = {
				},
				Code = function()
					return self.songPosInBeats
				end,
				Scope = 2,
				ExecSpace = 0,
				Attributes = {
				},
				Name = "SongPosInBeatsGetter"
			},
			{
				Return = {
					Type = "number",
					DefaultValue = nil,
					SyncDirection = 0,
					Attributes = {
					},
					Name = nil
				},
				Arguments = {
				},
				Code = function()
					return self.BeatsInScroll 
				end,
				Scope = 2,
				ExecSpace = 0,
				Attributes = {
				},
				Name = "BeatsInScrollGetter"
			},
			{
				Return = {
					Type = "number",
					DefaultValue = nil,
					SyncDirection = 0,
					Attributes = {
					},
					Name = nil
				},
				Arguments = {
				},
				Code = function()
					return self.secPerBeat
				end,
				Scope = 2,
				ExecSpace = 0,
				Attributes = {
				},
				Name = "SecForBeatGetter"
			},
			{
				Return = {
					Type = "number",
					DefaultValue = nil,
					SyncDirection = 0,
					Attributes = {
					},
					Name = nil
				},
				Arguments = {
				},
				Code = function()
					return self.songPosition
				end,
				Scope = 2,
				ExecSpace = 0,
				Attributes = {
				},
				Name = "SongPosInSecGetter"
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
						Name = "isStartMusic"
					}
				},
				Code = function(isStartMusic)
					self.isStartMusic = isStartMusic
				end,
				Scope = 2,
				ExecSpace = 0,
				Attributes = {
				},
				Name = "SetIsMusicStart"
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
						Name = "IsEnable"
					}
				},
				Code = function(IsEnable)
					 _UserService.LocalPlayer.PlayerGameMovementController.enable = IsEnable
				end,
				Scope = 2,
				ExecSpace = 0,
				Attributes = {
				},
				Name = "SetPlayerGameMovementControllerEnable"
			},
			{
				Return = {
					Type = "boolean",
					DefaultValue = nil,
					SyncDirection = 0,
					Attributes = {
					},
					Name = nil
				},
				Arguments = {
				},
				Code = function()
					return self.isStartMusic
				end,
				Scope = 2,
				ExecSpace = 0,
				Attributes = {
				},
				Name = "GetIsMusicStart"
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
					local musicInfoDataSet
					if _UserService.LocalPlayer.CurrentMap.InsMapType.mapType == "Story" then
						log("Story DB")
						musicInfoDataSet = _DataService:GetTable("StoryMapInfoDataSet")    --위에 생성한 데이터의 이름으로 데이터 테이블을 가져옵니다.
					elseif _UserService.LocalPlayer.CurrentMap.InsMapType.mapType == "Multi" then
						log("Multi DB")
						musicInfoDataSet = _DataService:GetTable("MultiMapInfoDataSet")    --위에 생성한 데이터의 이름으로 데이터 테이블을 가져옵니다.
					else
						musicInfoDataSet = _DataService:GetTable("StoryMapInfoDataSet")
					end
					
					-- beat 노래 노트 DataSet에서 가져오기
					 
					local currentMapName = _UserService.LocalPlayer.CurrentMapName
					local musicInfoCurrentIndex = 0 -- self.musicIndex -- tonumber(string.sub(currentMapName,4,-1))
					local audioRUID = ""
					
					-- StoryMapInfoDataSet에서 맵에 해당하는 노래 찾기
					-- 노래 노트 입력, 노트 종류 입력
					for i = 1, musicInfoDataSet:GetRowCount() do
						if (musicInfoDataSet:GetCell(i, "MapName") == currentMapName) then
							musicInfoCurrentIndex = i
						end
					end
					
					self.bpm = tonumber(musicInfoDataSet:GetCell(musicInfoCurrentIndex, "Bpm"))
					
					log("self.bpm: "..self.bpm)
					
					-- 하나의 박자가 몇 초인지 계산한다.
					self.secPerBeat = 60.0 / self.bpm
					
					log("self.secPerBeat: "..self.secPerBeat)
					
					-- 노래 종목 입력
					self.AudioRUID = musicInfoDataSet:GetCell(musicInfoCurrentIndex, "AudioRUID")
					
					--self.Entity.SoundComponent.AudioClipRUID =  self.AudioRUID
					self.DataSetName = musicInfoDataSet:GetCell(musicInfoCurrentIndex, "NoteDataName")
					
					self.songDuration = tonumber(musicInfoDataSet:GetCell(musicInfoCurrentIndex, "SongDuration"))
					
					-- 데이터셋에서 노트 데이터를 업로드한다.
					self:UploadMusicNoteDataSet(self.DataSetName)
					
					local noteParents 
					
					if self.Entity.CurrentMapName ~= "Ins199" then
						noteParents = _EntityService:GetEntitiesByPath("/ui/GameUIGroup/NotePanel/Notes/Model_Indi_Parent")
							-- 노트 발생
						for nextindex = 1, self.poolCapacity do
							self:NoteGenerate(nextindex, noteParents[nextindex])
						end
					end
					
					--[[
					if noteParents == nil then return end
					
					    for index, entity in pairs(noteParents) do
					        log(entity.Name)                                                                            -- 반환된 모든 엔티티를 순회하며 엔티티의 이름을 출력. (모두 EntityE로 출력)
					end
					--]]
					
					
					
					
					-- 노래 시작
					-- self:musicStart()
				end,
				Scope = 2,
				ExecSpace = 0,
				Attributes = {
				},
				Name = "MusicInitialize"
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
						Name = "nextIndex"
					},
					{
						Type = "Entity",
						DefaultValue = nil,
						SyncDirection = 0,
						Attributes = {
						},
						Name = "p_IndiEntity"
					}
				},
				Code = function(nextIndex, p_IndiEntity)
					--music note를 생성한다.
					
					--[[
					local currentMapName = _UserService.LocalPlayer.CurrentMapName
					local parent = _EntityService:GetEntityByPath("/ui/GameUIGroup")
					if currentMapName == "Ins199" then
						log("튜토리얼맵 입장")
						parent = _EntityService:GetEntityByPath("/ui/TutorialUIGroup")
					else
						
					end
					--]]
						
						local nodeType = self.nodetypeTable[nextIndex]
						
						-- node 종류에 맞는 node model 생성
						local switch={}
						switch[1]=function() return "model://6da38e89-8ebf-4d15-874d-83874e45399f" end
						switch[2]=function() return '' end
						switch[3]=function() return '' end
						switch[4]=function() return '' end
						switch[5]=function() return '' end
						switch[6]=function() return '' end
						switch[7]=function() return '' end
						switch[8]=function() return '' end
						switch[9]=function() return '' end
						switch[10]=function() return '' end
						switch[11]=function() return '' end
						switch[12]=function() return '' end
						
						local nodeTypeSwitch = switch[nodeType]()
					
						
						local indiEntity = p_IndiEntity:GetChildByName("Model_Indi2") -- = _SpawnService:SpawnByModelId(nodeTypeSwitch, "Note", Vector3(0,0,0), parent):GetChildByName("Model_Indi2")
						indiEntity.UITransformComponent.Position.x = -960
						indiEntity.UITransformComponent.Position.y = -414
					
						indiEntity.Indicator.posInBeats = self.notes[nextIndex]
						indiEntity.Enable = false;
						table.insert(self.noteEntities,indiEntity)
				end,
				Scope = 2,
				ExecSpace = 0,
				Attributes = {
				},
				Name = "NoteGenerate"
			},
			{
				Return = {
					Type = "number",
					DefaultValue = nil,
					SyncDirection = 0,
					Attributes = {
					},
					Name = nil
				},
				Arguments = {
				},
				Code = function()
					local musicInfoDataSet
					-- beat 노래 노트 DataSet에서 가져오기
					if _UserService.LocalPlayer.CurrentMap.InsMapType.mapType == "Story" then
						musicInfoDataSet = _DataService:GetTable("StoryMapInfoDataSet")    --위에 생성한 데이터의 이름으로 데이터 테이블을 가져옵니다.
					elseif _UserService.LocalPlayer.CurrentMap.InsMapType.mapType == "Multi" then
						musicInfoDataSet = _DataService:GetTable("MultiMapInfoDataSet")    --위에 생성한 데이터의 이름으로 데이터 테이블을 가져옵니다.
					end
					
					--log("_UserService.LocalPlayer.CurrentMap.InsMapType".._UserService.LocalPlayer.CurrentMap.InsMapType )
					
					local currentMapName = _UserService.LocalPlayer.CurrentMapName
					local musicInfoCurrentIndex = 0 -- self.musicIndex -- tonumber(string.sub(currentMapName,4,-1))
					
					-- StoryMapInfoDataSet에서 맵에 해당하는 노래 찾기
					-- 노래 노트 입력, 노트 종류 입력
					for i = 1, musicInfoDataSet:GetRowCount() do
						if (musicInfoDataSet:GetCell(i, "MapName") == currentMapName) then
							musicInfoCurrentIndex = i
						end
					end
					
					--self.Entity.SoundComponent.AudioClipRUID =  self.AudioRUID
					local DataSetName = musicInfoDataSet:GetCell(musicInfoCurrentIndex, "NoteDataName")
					
					
					-- beat 노래 노트 DataSet에서 가져오기
					local dataSet = _DataService:GetTable(DataSetName)    --위에 생성한 데이터의 이름으로 데이터 테이블을 가져옵니다.
					
					return dataSet:GetRowCount() 
				end,
				Scope = 2,
				ExecSpace = 0,
				Attributes = {
				},
				Name = "GetNoteLength"
			},
			{
				Return = {
					Type = "boolean",
					DefaultValue = "false",
					SyncDirection = 0,
					Attributes = {
					},
					Name = nil
				},
				Arguments = nil,
				Code = function()
					
					if self.nextIndex == 0 or self:tablelength(self.notes) == 0 then
						return false
					else
						return self.nextIndex == self:tablelength(self.notes) + 1
					end
				end,
				Scope = 2,
				ExecSpace = 0,
				Attributes = {
				},
				Name = "GetIsMusicDone"
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
					self.nextIndex = self.nextIndex + 1
				end,
				Scope = 2,
				ExecSpace = 0,
				Attributes = {
				},
				Name = "IncreaseNextIndex"
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
					
				end,
				Scope = 2,
				ExecSpace = 2,
				Attributes = {
				},
				Name = "OnMapEnter"
			}
		},
		EntityEventHandlers = {
		}
	}
}

return unpackedContents