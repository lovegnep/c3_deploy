

x301010_var_GatherPointTypeId = 11 
x301010_var_ItemId = 13011003 
x301010_var_QuestId = 2895
x301010_var_Bossid =-1
x301010_var_DemandItem ={{varId=13020007,varNum=1},{varId=13020008,varNum=1},{varId=13020009,varNum=1}}


function 	x301010_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301010_var_GatherPointTypeId, varMap, 0, x301010_var_ItemId)
end




function	 x301010_ProcGpOpen(varMap,varPlayer,varTalknpc)
		local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x301010_var_QuestId)
		if IsHaveQuest(varMap,varPlayer, x301010_var_QuestId) > 0 then
			if GetItemCount(varMap,varPlayer,x301010_var_DemandItem[3].varId) >= x301010_var_DemandItem[3].varNum then
					return 0
			else
					StartTalkTask(varMap)
					TalkAppendString(varMap,"乌黑的石像，散发出邪恶的光辉，似乎需要一颗钻石才能开启它。")
					StopTalkTask()
					DeliverTalkMenu(varMap, varPlayer, varPlayer);
					return 1
			end
		end
		return 1
end




function	 x301010_ProcGpRecycle(varMap,varPlayer,varTalknpc)
		local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x301010_var_QuestId)
		if IsHaveQuest(varMap,varPlayer, x301010_var_QuestId) > 0 then
						if DelItem( varMap,varPlayer,x301010_var_DemandItem[3].varId, x301010_var_DemandItem[3].varNum ) ~= 1 then return 0 end
						StartItemTask(varMap)
						ItemAppend( varMap, x301010_var_DemandItem[1].varId, x301010_var_DemandItem[1].varNum )
    				StopItemTask(varMap,varPlayer)
    				DeliverItemListSendToPlayer(varMap,varPlayer)
    				StartTalkTask(varMap)
						TalkAppendString(varMap,"乌黑的石像张开了嘴吐出一颗乌黑的珠子。")
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varPlayer);
						return 0
		end
		return 0

end





function	x301010_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end


