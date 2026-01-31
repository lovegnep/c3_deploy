












x920003_var_FileId = 920003 




x920003_var_Buf1 = 7210
x920003_var_Buf2 = -1 




function x920003_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x920003_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x920003_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x920003_ProcConditionCheck( varMap, varPlayer )
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	
	if GetLevel( varMap, varPlayer) < 20 then
		StartTalkTask( varMap)
		TalkAppendString( varMap, "角色等级小于"..PK_SWITCH_LEVEL.."级不能使用此道具" );
		StopTalkTask()
		DeliverTalkTips( varMap, varPlayer)
		return 0
	end
	
	return 1; 
end







function x920003_ProcDeplete( varMap, varPlayer )
	if DepletingUsedItem(varMap, varPlayer) == 1 then
		return 1;
	end
	return 0;
end








function x920003_ProcActivateOnce( varMap, varPlayer )
	if(-1~=x920003_var_Buf1) then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x920003_var_Buf1, 0);
	end
	
	
	SetCurPKMode( varMap, varPlayer, 7, 1)
	return 1;
end







function x920003_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
