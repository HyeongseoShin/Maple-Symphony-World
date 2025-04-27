unpackedContents = {
	uniqueIdentifier = "d158ec33ea5043dc9e73fdcc70799456",
	bundleIdentifier = "2c89a498317848aab9fe46cd70bf74bb",
	category = "codeblock",
	entryId = "7253aea5-8cc7-4815-b28b-8e4bb94d4582",
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
		Id = "7253aea5-8cc7-4815-b28b-8e4bb94d4582",
		Language = 1,
		Name = "PartyGDBManager",
		Type = 1,
		Source = 0,
		Target = nil,
		ModifyTime = "2022-11-12T18:46:41.1659286+09:00",
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
						Name = "partyID"
					}
				},
				Code = function(partyID)
					local partyListGDB = _DataStorageService:GetGlobalDataStorage("PartyListGDB")
					partyListGDB:SetAndWait(partyID, "")
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "RegisterPartyToGDB_GDB"
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
				Arguments = {
					{
						Type = "string",
						DefaultValue = "",
						SyncDirection = 0,
						Attributes = {
						},
						Name = "partyID"
					}
				},
				Code = function(partyID)
					local partyListGDB = _DataStorageService:GetGlobalDataStorage("PartyListGDB")
					local isExist 
					local FindFunc = function (errorCode, key, value)
						if value == nil then isExist = false
						else
							isExist = true
						end 
						return isExist 
					end
					partyListGDB:GetAndWait(partyID)
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "FindPartyInGDB_GDB"
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
						Name = "partyID"
					}
				},
				Code = function(partyID)
					local partyListGDB = _DataStorageService:GetGlobalDataStorage("PartyListGDB")
					partyListGDB:DeleteAndWait(partyID)
					
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "DeletePartyFromGDB_GDB"
			}
		},
		EntityEventHandlers = {
		}
	}
}

return unpackedContents