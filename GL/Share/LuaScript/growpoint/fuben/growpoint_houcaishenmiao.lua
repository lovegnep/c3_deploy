                                                                                                                









x301021_var_QuestId 	= 6602 
x301021_var_ItemId 		= 12030006
x301021_var_FileId 		= 700003




function 		x301021_ProcGpCreate(varMap,varGpType,varX,varY)

	
	local varBoxId = ItemBoxEnterScene(varX,varY,29,varMap,0,x301021_var_ItemId)


end










function	 x301021_ProcGpOpen(varMap,varPlayer,varTalknpc)
	if IsHaveQuest(varMap,varPlayer, x301021_var_QuestId) > 0 then
		if GetItemCount(varMap,varPlayer,varTalknpc) == 0 then
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




function	 x301021_ProcGpRecycle(varMap,varPlayer,varTalknpc)
     LuaCallNoclosure( x301021_var_FileId, "ProcDestroyHouPaoDan", varMap, varPlayer )
     return 0
end





function	x301021_ProcGpProcOver(varMap,varPlayer,varTalknpc)

end




function	x301021_OpenCheck(varMap,varPlayer,AbilityId,AblityLevel)

end
