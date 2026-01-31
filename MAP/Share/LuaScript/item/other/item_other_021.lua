


x418021_var_FileId = 418021
x418021_var_Buf1 = 7518 
x418021_var_item = 12030333

function x418021_ProcEventEntry( varMap, varPlayer, varBagIdx )
	




end

function x418021_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1;     
	
	

end

function x418021_ProcCancelImpacts( varMap, varPlayer )
	return 0; 

end

function x418021_ProcConditionCheck( varMap, varPlayer )
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end

function x418021_ProcDeplete( varMap, varPlayer )
	return 1
end

function x418021_ProcActivateOnce( varMap, varPlayer )

	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		local yanhua=   SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x418021_var_Buf1, 0);
	else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"使用物品异常！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
	end

end

function x418021_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
