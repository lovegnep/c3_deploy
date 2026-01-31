

x490614_var_FileId 					= 490614
x490614_var_QuestName				= "轮回台传送跨服中兴府"
x490614_var_TransTypeId				= {7003,7003,7003,7003}
x490614_var_TransPoint				= {7037,7037,7037,7037}






function x490614_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

	print("11111121212121212")
	TalkAppendButton(varMap, x490614_var_FileId, x490614_var_QuestName,15);
	
end

function x490614_ProcEventEntry(varMap, varPlayer, varTalknpc)
	print("1111112121212121aaaa2")
	if IsHaveSpecificImpact( varMap, varPlayer, 7610) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7607) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7608) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7605) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7616) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7613) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7614) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7611) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7622) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7619) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7620) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7617) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7628) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7625) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7626) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7623) == 1 then
		Msg2Player(varMap,varPlayer,"很抱歉，未完成铁人三项任务时无法使用马车夫",8,2)
		return
	end
	
	if IsHaveSpecificImpact( varMap, varPlayer, 32584) == 1 then
		Msg2Player(varMap,varPlayer,"很抱歉，那达慕赛马大赛中无法使用马车夫",8,2)
		return
	end
	if IsHaveSpecificImpact( varMap, varPlayer, 7538) == 1 then
		Msg2Player(varMap,varPlayer,"很抱歉，变身状态无法使用马车夫",8,2)
		return
	end
	local  WorldID = GetWorldID(varMap,varPlayer)	
	local  toplevel = GetToplistCount(WorldID,0)
	local  guid,varLevelMax = GetToplistInfo(WorldID,0,toplevel-1)

--	if varLevelMax < 70 then
--		Msg2Player(varMap,varPlayer,"很抱歉，服务器等级排行榜最后一名达到70级才可开启后花园传送",8,2)
--		return
--	end
	
	local minOfDay = GetMinOfDay()
	local weekIdx = GetWeek()

	if weekIdx == 6 and minOfDay >= 890 and minOfDay <= 900 then
			Msg2Player(varMap,varPlayer,"决战后花园期间，无法传送至后花园",8 ,2)
			return
	end	
	
	if weekIdx == 6 and minOfDay >= 870 and minOfDay <= 890 then
		local Level = GetLevel(varMap,varPlayer)
		if Level < 40 then
			Msg2Player(varMap,varPlayer,"决战后花园期间，等级未达到40级无法传送至后花园",8 ,2)
			return
		end
	else
		local Level = GetLevel(varMap,varPlayer)
		if Level < 70 then
			Msg2Player(varMap,varPlayer,"很抱歉，未达到70级无法传送至后花园",8 ,3)
			return
		end		
	end
	
	if IsHaveSpecificImpact( varMap, varPlayer, 7629) == 1 then
		CancelSpecificImpact( varMap, varPlayer, 7629)	
	end
	
	local varCountry = GetCurCountry(varMap, varPlayer)

		if varCountry == 0 then
			DeliverTransferType(varMap, varPlayer, varTalknpc, x490614_var_TransTypeId[1], x490614_var_TransPoint[1])
		elseif varCountry == 1 then
			DeliverTransferType(varMap, varPlayer, varTalknpc, x490614_var_TransTypeId[2], x490614_var_TransPoint[2])
		elseif varCountry == 2 then	
			DeliverTransferType(varMap, varPlayer, varTalknpc, x490614_var_TransTypeId[3], x490614_var_TransPoint[3])
		elseif varCountry == 3 then
			DeliverTransferType(varMap, varPlayer, varTalknpc, x490614_var_TransTypeId[4], x490614_var_TransPoint[4])
		end	
					
end







function x490614_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x490614_ProcAccept(varMap, varPlayer, varTalknpc)

end
