

x550585_var_FileId 					= 550585
x550585_var_QuestName				= "锡拉库萨港传送"
x550585_var_TransTypeId				= {1503,2503,3503,4503}
x550585_var_TransPoint				=  {1603,2603,3603,4603}






function x550585_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	
	TalkAppendButton(varMap, x550585_var_FileId, x550585_var_QuestName,15);
	
end







function x550585_ProcEventEntry(varMap, varPlayer, varTalknpc)

	
	if IsHaveSpecificImpact( varMap, varPlayer, 7610) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7607) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7608) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7605) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7616) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7613) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7614) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7611) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7622) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7619) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7620) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7617) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7628) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7625) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7626) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7623) == 1 then
		Msg2Player(varMap,varPlayer,"很抱歉，未完成铁人三项任务时无法使用马车夫",8,2)
		return
	end
	
	if IsHaveSpecificImpact( varMap, varPlayer, 32584) == 1 then
		Msg2Player(varMap,varPlayer,"很抱歉，那达慕赛马大赛中无法使用马车夫",8,2)
		return
	end
	
	local varCountry = GetCurCountry(varMap, varPlayer)
	local nDefaultCamp = GetSceneCamp( varMap )

	
	

	
		if varCountry == 0 then
			DeliverTransferType(varMap, varPlayer, varTalknpc, x550585_var_TransTypeId[1], x550585_var_TransPoint[1])
		elseif varCountry == 1 then                                                  
			DeliverTransferType(varMap, varPlayer, varTalknpc, x550585_var_TransTypeId[2], x550585_var_TransPoint[2])
		elseif varCountry == 2 then	                                                
			DeliverTransferType(varMap, varPlayer, varTalknpc, x550585_var_TransTypeId[3], x550585_var_TransPoint[3])
		elseif varCountry == 3 then                                                  
			DeliverTransferType(varMap, varPlayer, varTalknpc, x550585_var_TransTypeId[4], x550585_var_TransPoint[4])
		else
			return
	end	
		
	
		
end







function x550585_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x550585_ProcAccept(varMap, varPlayer, varTalknpc)

end
