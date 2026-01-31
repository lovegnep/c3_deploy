                                                                                                                









x301022_var_QuestId 	= 6602
x301022_var_ItemId 		= 12030006
x301022_var_FileId 		= 700003




function 		x301022_ProcGpCreate(varMap,varGpType,varX,varY)

	
	local varBoxId = ItemBoxEnterScene(varX,varY,30,varMap,0,x301022_var_ItemId)


end










function	 x301022_ProcGpOpen(varMap,varPlayer,varTalknpc)
 	if IsHaveQuest(varMap,varPlayer, x301022_var_QuestId) > 0 then
		if GetItemCount(varMap,varPlayer,x301022_var_ItemId) < 10 then
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




function	 x301022_ProcGpRecycle(varMap,varPlayer,varTalknpc)
    return LuaCallNoclosure( x301022_var_FileId, "ProcGetHuoPaoDan", varMap, varPlayer )
end





function	x301022_ProcGpProcOver(varMap,varPlayer,varTalknpc)

end




function	x301022_OpenCheck(varMap,varPlayer,AbilityId,AblityLevel)

end
