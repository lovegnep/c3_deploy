

x550575_var_FileId 					= 550575
x550575_var_QuestName			  = "领地传送"
x550575_var_TransTypeId				= {160,360,560,760}
x550575_var_TransPoint				= {61,261,461,661}






function x550575_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

	
	TalkAppendButton(varMap, x550575_var_FileId, x550575_var_QuestName,15);
	
end







function x550575_ProcEventEntry(varMap, varPlayer, varTalknpc)


	
	if IsHaveSpecificImpact( varMap, varPlayer, 7610) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7607) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7608) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7605) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7616) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7613) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7614) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7611) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7622) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7619) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7620) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7617) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7628) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7625) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7626) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7623) == 1 then
		Msg2Player(varMap,varPlayer,"很抱歉，未完成铁人三项任务时无法使用马车夫",8,2)
		return
	end
	
	if IsHaveSpecificImpact( varMap, varPlayer, 32584) == 1 then
		Msg2Player(varMap,varPlayer,"很抱歉，那达慕赛马大赛中无法使用马车夫",8,2)
		return
	end
	
	
	local varCountry = GetCurCountry(varMap, varPlayer)
	

	
	
	
		
		if varCountry == 0 then
			DeliverTransferType(varMap, varPlayer, varTalknpc, x550575_var_TransTypeId[1], x550575_var_TransPoint[1])
		elseif varCountry == 1 then                                                  
			DeliverTransferType(varMap, varPlayer, varTalknpc, x550575_var_TransTypeId[2], x550575_var_TransPoint[2])
		elseif varCountry == 2 then	                                                
			DeliverTransferType(varMap, varPlayer, varTalknpc, x550575_var_TransTypeId[3], x550575_var_TransPoint[3])
		elseif varCountry == 3 then                                                  
			DeliverTransferType(varMap, varPlayer, varTalknpc, x550575_var_TransTypeId[4], x550575_var_TransPoint[4])
		end	

	

	
	
		
end







function x550575_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x550575_ProcAccept(varMap, varPlayer, varTalknpc)

end
