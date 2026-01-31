


x300800_var_QuestId 	= 7551
x300800_var_ItemId 		= 13011602
x300800_var_FileId 		= 300752
x300800_var_GatherPointType	= 115
x300800_var_ItemCount		= 1





function 		x300800_ProcGpCreate(varMap,varGpType,varX,varY)
	
	local varBoxId = ItemBoxEnterScene(varX,varY,x300800_var_GatherPointType,varMap,0,x300800_var_ItemId)
end





function	 x300800_ProcGpOpen(varMap,varPlayer,varTalknpc)
	if IsHaveQuest(varMap,varPlayer, x300800_var_QuestId) > 0 then
		if GetItemCount(varMap,varPlayer,x300800_var_ItemId) < x300800_var_ItemCount then
			return 0
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"您无法这样做")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			return 1
		end
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"您没有这个任务")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 1
	end
end




function	 x300800_ProcGpRecycle(varMap,varPlayer,varTalknpc)
     return LuaCallNoclosure( x300800_var_FileId, "ProcGetGrowPoint", varMap, varPlayer, x300800_var_QuestId, x300800_var_ItemId )
end




function	x300800_ProcGpProcOver(varMap,varPlayer,varTalknpc)

end

function	x300800_OpenCheck(varMap,varPlayer,AbilityId,AblityLevel)

end
