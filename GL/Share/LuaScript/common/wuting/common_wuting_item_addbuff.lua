x300163_var_FileId  = 300163
x300163_var_Buf1   = -1
x300163_var_Buf2   = -1 
x300163_var_FarScriptId	= 300160
x300163_var_BuffId        = 7646





function x300163_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x300163_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x300163_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x300163_ProcConditionCheck( varMap, varPlayer )
    if varMap ~= 14 then
        StartTalkTask( varMap);
        TalkAppendString( varMap, "只能在大都美丽会内使用" );
        StopTalkTask( varMap);
        DeliverTalkTips( varMap, varPlayer);
        return 0
    else
        return 1
    end
end






function x300163_ProcDeplete( varMap, varPlayer )
 	if DepletingUsedItem(varMap, varPlayer) == 1 then
 		LuaCallNoclosure(x300163_var_FarScriptId, "ProcUseItem", varMap, varPlayer, x300163_var_BuffId)
		return 1;
	end
	
	return 0;
	
end








function x300163_ProcActivateOnce( varMap, varPlayer )
	if(-1~=x300163_var_Buf1) then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x300163_var_Buf1, 0);
	end
	return 1;
end







function x300163_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
