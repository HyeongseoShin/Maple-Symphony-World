unpackedContents = {
	uniqueIdentifier = "e6cd51b83c9f4237942549036b91909a",
	bundleIdentifier = "2c89a498317848aab9fe46cd70bf74bb",
	category = "codeblock",
	entryId = "2778c56a-4c16-4851-abbf-705d30c386b4",
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
		Id = "2778c56a-4c16-4851-abbf-705d30c386b4",
		Language = 1,
		Name = "GameController",
		Type = 1,
		Source = 0,
		Target = nil,
		ModifyTime = "2022-11-08T22:25:26.5338083+09:00",
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
						DefaultValue = "",
						SyncDirection = 0,
						Attributes = {
						},
						Name = "userName"
					}
				},
				Code = function(userName)
					local users = {}
					users[1] = userName
					 _InstanceMapService:MoveUsersToParentMap(users)
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "SendToParent"
			}
		},
		EntityEventHandlers = {
		}
	}
}

return unpackedContents