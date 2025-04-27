unpackedContents = {
	uniqueIdentifier = "bed159799e674bba91e8b66cf600b94c",
	bundleIdentifier = "2c89a498317848aab9fe46cd70bf74bb",
	category = "codeblock",
	entryId = "030f9de2-4298-42ac-9f4e-d7a1df2f8866",
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
		Id = "030f9de2-4298-42ac-9f4e-d7a1df2f8866",
		Language = 1,
		Name = "PlayerItemController",
		Type = 1,
		Source = 0,
		Target = nil,
		ModifyTime = "2022-11-04T13:45:25.7371219+09:00",
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
						Name = "spentItemName"
					}
				},
				Code = function(spentItemName)
					local playerItemList = self.Entity.InventoryComponent:GetItemList()
					for i, item in pairs(playerItemList) do 
						if item.ItemDataTableName == spentItemName then
							item.ItemCount = item.ItemCount -1 
							if item.ItemCount == 0 then
								_ItemService:RemoveItem(playerItemList[i])
							end
							return
						end
					end
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "SpentItem"
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
						Name = "getItemName"
					},
					{
						Type = "string",
						DefaultValue = "",
						SyncDirection = 0,
						Attributes = {
						},
						Name = "getItemType"
					}
				},
				Code = function(getItemName, getItemType)
					-- [이거 GetItem 똑같은데 위에있는건 Chair_Box에서 사용하는거고 이건 ItemMonster에서 사용함. 아마 나중에는 이 함수만 있으면될듯.]
					-- 둘다 결국 이 get item은 server에서 처리되어야해서 같은거라고 생각함. 근데 일단.. 따로 구현은 해둠.
					
					local newItem
					local playerItemList = self.Entity.InventoryComponent:GetItemList() 
					
					if playerItemList[1] == nil then 
						-- 처음얻는 경우 아이템을 생성하여 충돌한 엔티티의 인벤토리에 넣어줍니다.
						if getItemType == "Chair" then
							newItem = _ItemService:CreateItem(Chair, getItemName, self.Entity.InventoryComponent)
						elseif getItemType == "Toy" then
							newItem = _ItemService:CreateItem(Toy, getItemName, self.Entity.InventoryComponent)
						elseif getItemType == "Ring" then
							newItem = _ItemService:CreateItem(Ring, getItemName, self.Entity.InventoryComponent)
						elseif getItemType == "Pet" then
							newItem = _ItemService:CreateItem(Pet, getItemName, self.Entity.InventoryComponent)
						elseif getItemType == "Skin" then
							newItem = _ItemService:CreateItem(Skin, getItemName, self.Entity.InventoryComponent)
						elseif getItemType == "DamageSkin" then
							_ItemService:CreateItem(DamageSkin, getItemName, self.Entity.InventoryComponent)
						elseif getItemType == "Title" then
							_ItemService:CreateItem(Title, getItemName, self.Entity.InventoryComponent)
						end
						self.Entity.PlayerUIController:OnItemGetNoticePanel(newItem.IconRUID)
					else
						for i,item in pairs(playerItemList) do
							if item.ItemDataTableName == getItemName then
								--이미 있는 경우 갯수 수정함
								playerItemList[i].ItemCount = playerItemList[i].ItemCount + 1 -- server에서 수정해야 HandleInventoryModifiedEvent가 실행된다.
								newItem = playerItemList[i]
								self.Entity.PlayerUIController:OnItemGetNoticePanel(newItem.IconRUID)
								return -- 함수 자체를 끝냄.(for문이 아니라 GetItem을 끝냄) 
							end
						end
						-- 처음얻는 경우 아이템을 생성하여 충돌한 엔티티의 인벤토리에 넣어줍니다.
						if getItemType == "Chair" then
							newItem = _ItemService:CreateItem(Chair, getItemName, self.Entity.InventoryComponent)
						elseif getItemType == "Toy" then
							newItem = _ItemService:CreateItem(Toy, getItemName, self.Entity.InventoryComponent)
						elseif getItemType == "Ring" then
							newItem = _ItemService:CreateItem(Ring, getItemName, self.Entity.InventoryComponent)
						elseif getItemType == "Pet" then
							newItem = _ItemService:CreateItem(Pet, getItemName, self.Entity.InventoryComponent)
						elseif getItemType == "Skin" then
							newItem = _ItemService:CreateItem(Skin, getItemName, self.Entity.InventoryComponent)
						elseif getItemType == "DamageSkin" then
							_ItemService:CreateItem(DamageSkin, getItemName, self.Entity.InventoryComponent)
						elseif getItemType == "Title" then
							_ItemService:CreateItem(Title, getItemName, self.Entity.InventoryComponent)
						end
						
						self.Entity.PlayerUIController:OnItemGetNoticePanel(newItem.IconRUID)
					end
					
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "GetItem_server"
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
						Name = "rewardName"
					},
					{
						Type = "string",
						DefaultValue = "",
						SyncDirection = 0,
						Attributes = {
						},
						Name = "rewardType"
					}
				},
				Code = function(rewardName, rewardType)
					self:GetSeasonReward_server(rewardName, rewardType)
				end,
				Scope = 2,
				ExecSpace = 6,
				Attributes = {
				},
				Name = "GetSeasonReward"
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
						Name = "rewardName"
					},
					{
						Type = "string",
						DefaultValue = "",
						SyncDirection = 0,
						Attributes = {
						},
						Name = "rewardType"
					}
				},
				Code = function(rewardName, rewardType)
					-- 이게.. NPC_new1_DialogDataSet에서는 client만 부를 수 있고, GetItem은 server에서만 불러야해서 두번이나 경유해서 보냄ㅠㅠ 방법 찾으면 정리하기.
					
					self:GetItem_server(rewardName, rewardType)
				end,
				Scope = 2,
				ExecSpace = 5,
				Attributes = {
				},
				Name = "GetSeasonReward_server"
			}
		},
		EntityEventHandlers = {
		}
	}
}

return unpackedContents