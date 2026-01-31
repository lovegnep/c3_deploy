






x920002_var_FileId = 920002 




x920002_var_Buf1 = 7211
x920002_var_Buf2 = -1 




function x920002_ProcEventEntry( varMap, varPlayer, buffIndex, varFlag)
    
	
  
  
  
end






function x920002_ProcIsSpellLikeScript( varMap, varPlayer)
    
	return 1; 
end






function x920002_ProcCancelImpacts( varMap, varPlayer )
    
	return 0; 
end






function x920002_ProcConditionCheck( varMap, varPlayer )
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	
	local _,nSecurityLevel = GetSceneRestrictiveMode(varMap) ;
	if nSecurityLevel == 0 or varMap == 50 or varMap == 150 or varMap == 250 or varMap == 350 then	
		Msg2Player( varMap, varPlayer, "很抱歉，在和平场景不可使用狂暴丸", 8, 3)
		return 0
	end

	
	
	if GetLevel( varMap, varPlayer) < 20 then
		StartTalkTask( varMap)
		TalkAppendString( varMap, "很抱歉，未达到20级的玩家是受保护的，您不可使用狂暴丸" );
		StopTalkTask()
		DeliverTalkTips( varMap, varPlayer)
		return 0
	end

    
    if IsHaveSpecificImpact( varMap, varPlayer, x920002_var_Buf1) ~= 0 then
		StartTalkTask( varMap)
		TalkAppendString( varMap, "不能叠加使用此道具" )
		StopTalkTask()
		DeliverTalkTips( varMap, varPlayer)
		return 0
    end
	
	
	if varMap == PK_PUNISH_PRISON_SCENE_ID then
		StartTalkTask( varMap)
		TalkAppendString( varMap, "监狱中不能使用此道具" )
		StopTalkTask()
		DeliverTalkTips( varMap, varPlayer)
		return 0
	end
	
	
	if GetSceneType(varMap)==2 then
		StartTalkTask( varMap)
		TalkAppendString( varMap, "战场中不能使用此道具" )
		StopTalkTask()
		DeliverTalkTips( varMap, varPlayer)
		return 0		
	end

	return 1; 
end







function x920002_ProcDeplete( varMap, varPlayer )
	if DepletingUsedItem(varMap, varPlayer) == 1 then
		return 1;
	end
	return 0;
end








function x920002_ProcActivateOnce( varMap, varPlayer )
	if(-1~=x920002_var_Buf1) then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x920002_var_Buf1, 0);
	end
	
	SetCurPKMode( varMap, varPlayer, 2, 0)

    StartTalkTask( varMap)
    TalkAppendString( varMap, "进入狂暴状态，可以攻击本国人及其镖车" )
    StopTalkTask()
    DeliverTalkTips( varMap, varPlayer)

	return 1;
end







function x920002_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
