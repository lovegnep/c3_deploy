                                                                                                                









x301030_var_QuestId 	= 6603
x301030_var_ItemId 		= 13010083
x301030_var_FileId 		= 700004




function 		x301030_ProcGpCreate(varMap,varGpType,varX,varY)

	
	local varBoxId = ItemBoxEnterScene(varX,varY,100,varMap,0,x301030_var_ItemId)


end










function	 x301030_ProcGpOpen(varMap,varPlayer,varTalknpc)
	if IsHaveQuest(varMap,varPlayer, x301030_var_QuestId) > 0 then
		if GetItemCount(varMap,varPlayer,x301030_var_ItemId) == 0 then
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




function	 x301030_ProcGpRecycle(varMap,varPlayer,varTalknpc)
     return LuaCallNoclosure( x301030_var_FileId, "ProcGetHeShiBi", varMap, varPlayer )
end





function	x301030_ProcGpProcOver(varMap,varPlayer,varTalknpc)

end




function	x301030_OpenCheck(varMap,varPlayer,AbilityId,AblityLevel)

end
