unpackedContents = {
	uniqueIdentifier = "06a03cf9a9544991a5a0a97008c60be0",
	bundleIdentifier = "2c89a498317848aab9fe46cd70bf74bb",
	category = "codeblock",
	entryId = "9a436f4a-7ee0-4af6-91ca-58ae410b9903",
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
		Id = "9a436f4a-7ee0-4af6-91ca-58ae410b9903",
		Language = 1,
		Name = "PlayerAttack",
		Type = 4,
		Source = 0,
		Target = "MOD.Core.AttackComponent",
		ModifyTime = "2022-10-29T00:44:43.0948222+09:00",
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
				Arguments = nil,
				Code = function()
					local attackSize = Vector2(1, 1)
					local attackOffset = Vector2(0,0)
					
					self:Attack(attackSize, attackOffset, nil)
				end,
				Scope = 2,
				ExecSpace = 0,
				Attributes = {
				},
				Name = "NormalAttack"
			},
			{
				Return = {
					Type = "int",
					DefaultValue = nil,
					SyncDirection = 0,
					Attributes = {
					},
					Name = nil
				},
				Arguments = {
					{
						Type = "Entity",
						DefaultValue = nil,
						SyncDirection = 0,
						Attributes = {
						},
						Name = "attacker"
					},
					{
						Type = "Entity",
						DefaultValue = nil,
						SyncDirection = 0,
						Attributes = {
						},
						Name = "defender"
					},
					{
						Type = "string",
						DefaultValue = nil,
						SyncDirection = 0,
						Attributes = {
						},
						Name = "attackInfo"
					}
				},
				Code = function(attacker, defender, attackInfo)
					--return __base:CalcDamage(attacker,defender,attackInfo)
					return 1000
				end,
				Scope = 2,
				ExecSpace = 0,
				Attributes = {
				},
				Name = "CalcDamage"
			}
		},
		EntityEventHandlers = {
		}
	}
}

return unpackedContents