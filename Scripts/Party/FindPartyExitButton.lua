unpackedContents = {
	uniqueIdentifier = "22d9ed35e58c43998a6ff1f403998837",
	bundleIdentifier = "2c89a498317848aab9fe46cd70bf74bb",
	category = "codeblock",
	entryId = "c1ff6384-d3a6-4560-81d5-c9119f99f415",
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
		Id = "c1ff6384-d3a6-4560-81d5-c9119f99f415",
		Language = 1,
		Name = "FindPartyExitButton",
		Type = 1,
		Source = 0,
		Target = nil,
		ModifyTime = "2022-11-10T06:09:51.8091153+09:00",
		Properties = {
		},
		Methods = {
		},
		EntityEventHandlers = {
			{
				Name = "HandleButtonClickEvent",
				EventName = "ButtonClickEvent",
				Target = "self",
				Code = function()
					-- Parameters
					local Entity = event.Entity
					--------------------------------------------------------
					local NPC1_panel = _EntityService:GetEntityByPath("/ui/LobbyUIGroup/NPC_new1_DialogPanel")
					NPC1_panel.Enable = false
				end,
				Scope = 0,
				ExecSpace = 0
			}
		}
	}
}

return unpackedContents