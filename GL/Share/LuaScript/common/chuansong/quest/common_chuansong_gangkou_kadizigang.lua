

x550582_var_FileId 					= 550582
x550582_var_QuestName				= "卡迪兹港传送"
x550582_var_TransTypeId				= {1500,2500,3500,4500}
x550582_var_TransPoint				=  {1600,2600,3600,4600}






function x550582_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	
	TalkAppendButton(varMap, x550582_var_FileId, x550582_var_QuestName,15);
	
end







function x550582_ProcEventEntry(varMap, varPlayer, varTalknpc)

	
	if IsHaveSpecificImpact( varMap, varPlayer, 7610) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7607) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7608) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7605) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7616) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7613) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7614) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7611) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7622) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7619) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7620) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7617) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7628) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7625) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7626) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7623) == 1 then
		Msg2Player(varMap,varPlayer,"很抱歉，未完成铁人三项任务时无法使用马车夫",8,2)
		return
	end
	
	if IsHaveSpecificImpact( varMap, varPlayer, 32584) == 1 then
		Msg2Player(varMap,varPlayer,"很抱歉，那达慕赛马大赛中无法使用马车夫",8,2)
		return
	end
	if GetCountryParam(varMap,0,CD_COUNTRY_DIZHONGHAI_POINT) <POINT_KADIZI_TRANS then
			Msg2Player(varMap,varPlayer,"卡迪兹港的征服度不足"..POINT_KADIZI_TRANS.."点，无法使用地中海传送",8 ,2)
			Msg2Player(varMap,varPlayer,"卡迪兹港的征服度不足"..POINT_KADIZI_TRANS.."点，无法使用地中海传送",8 ,3)
			return 0
	end	
	
	local varCountry = GetCurCountry(varMap, varPlayer)
	local nDefaultCamp = GetSceneCamp( varMap )

	
	

	
		if varCountry == 0 then
			DeliverTransferType(varMap, varPlayer, varTalknpc, x550582_var_TransTypeId[1], x550582_var_TransPoint[1])
		elseif varCountry == 1 then                                                  
			DeliverTransferType(varMap, varPlayer, varTalknpc, x550582_var_TransTypeId[2], x550582_var_TransPoint[2])
		elseif varCountry == 2 then	                                                
			DeliverTransferType(varMap, varPlayer, varTalknpc, x550582_var_TransTypeId[3], x550582_var_TransPoint[3])
		elseif varCountry == 3 then                                                  
			DeliverTransferType(varMap, varPlayer, varTalknpc, x550582_var_TransTypeId[4], x550582_var_TransPoint[4])
		else
			return
	end	
		
	
		
end







function x550582_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x550582_ProcAccept(varMap, varPlayer, varTalknpc)

end
