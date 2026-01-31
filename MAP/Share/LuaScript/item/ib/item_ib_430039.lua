


















x430039_var_Buf1 = 7629 
x430039_var_Buf2 = -1




function x430039_ProcEventEntry( varMap, varPlayer, varBagIdx )
	
	return 0;


end






function x430039_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x430039_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x430039_ProcConditionCheck( varMap, varPlayer )
	if varMap == 44 then

		local haveImpact = IsHaveSpecificImpact(varMap, varPlayer, 7538)
		if(haveImpact > 0) then
			StartTalkTask(varMap)
				TalkAppendString(varMap, "很抱歉当前状态下不能使用此道具")
			StopTalkTask()
			DeliverTalkTips(varMap, varPlayer)
			
			return 0
		end
		
		if 1 == IsInChariot(varMap, varPlayer) then
			StartTalkTask(varMap)
				TalkAppendString(varMap, "战车状态无法使用该道具")
			StopTalkTask()
			DeliverTalkTips(varMap, varPlayer)
			
			return 0
		end
		
		local minOfDay = GetMinOfDay()
		local weekIdx = GetWeek()
		if weekIdx == 6 and minOfDay >= 870 and minOfDay <= 900 then
			Msg2Player(varMap,varPlayer,"决战后花园期间，无法使用此道具",8 ,2)
			return 0
		end	

		
		local level =	GetLevel( varMap, varPlayer)
		local levelmax =GetTopListInfo_MinLevel( GetWorldID( varMap, varPlayer) )
		if level >= levelmax then
			Msg2Player(varMap,varPlayer,"等级过高，无法使用此道具",8,3)
				return 0
    end
		return 1; 
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap, "请在后花园使用此道具")
		StopTalkTask()
		DeliverTalkTips(varMap, varPlayer)
			
		return 0
	end		
end







function x430039_ProcDeplete( varMap, varPlayer )
	if(DepletingUsedItem(varMap, varPlayer) > 0) then
		return 1;
	end
	return 0;
end








function x430039_ProcActivateOnce( varMap, varPlayer )
	if(-1~=x430039_var_Buf1) then 
		ReCallHorse( varMap, varPlayer )      
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x430039_var_Buf1, 0);
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x430039_var_Buf2, 0);
	end
	return 1;
end







function x430039_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
