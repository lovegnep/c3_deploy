
--初级声望卡





x418567_var_FileId 		= 418567

x418567_var_LevelMin		=	1





function x418567_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418567_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418567_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418567_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418567_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418567_ProcActivateOnce( varMap, varPlayer, varImpact )
	

	

	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
	
	
	
	
	  local nValue = 100
		local varShengWang = GetShengWang( varMap, varPlayer )
		varShengWang = varShengWang + nValue
		SetShengWang( varMap, varPlayer, varShengWang )	
		Msg2Player(varMap,varPlayer,format("您获得了%d点声望", 100),4,3)
		Msg2Player(varMap,varPlayer,format("您获得了%d点声望", 100),4,2)
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"使用物品异常！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end

end







function x418567_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
