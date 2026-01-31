

x550029_var_FileId 					= 550029
x550029_var_QuestName				= "边塞传送"
x550029_var_TransTypeId				= {204,1204,2204,3204}
x550029_var_TransPoint				= {4003,5003,6003,7003}






function x550029_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	
	TalkAppendButton(varMap, x550029_var_FileId, x550029_var_QuestName,15);
	
end







function x550029_ProcEventEntry(varMap, varPlayer, varTalknpc)
	
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

	nDefaultCamp = nDefaultCamp - 16
	
	if varCountry == nDefaultCamp then
		if varCountry == 0 then
			DeliverTransferType(varMap, varPlayer, varTalknpc, x550029_var_TransTypeId[1], x550029_var_TransPoint[1])
		elseif varCountry == 1 then                                                  
			DeliverTransferType(varMap, varPlayer, varTalknpc, x550029_var_TransTypeId[2], x550029_var_TransPoint[2])
		elseif varCountry == 2 then	                                                
			DeliverTransferType(varMap, varPlayer, varTalknpc, x550029_var_TransTypeId[3], x550029_var_TransPoint[3])
		elseif varCountry == 3 then                                                  
			DeliverTransferType(varMap, varPlayer, varTalknpc, x550029_var_TransTypeId[4], x550029_var_TransPoint[4])
		end	
		
	else
		return
	end	
		
end







function x550029_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x550029_ProcAccept(varMap, varPlayer, varTalknpc)

end
