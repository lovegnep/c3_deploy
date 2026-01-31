


x418023_var_FileId = 418023
x418023_var_Buf1 = 7520 
x418023_var_item = 12030335


function x418023_ProcEventEntry( varMap, varPlayer, varBagIdx )
		





  
end

function x418023_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1;     
	
	

end

function x418023_ProcCancelImpacts( varMap, varPlayer )
	return 0; 

end

function x418023_ProcConditionCheck( varMap, varPlayer )
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end

function x418023_ProcDeplete( varMap, varPlayer )
	return 1
end

function x418023_ProcActivateOnce( varMap, varPlayer )

	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		local yanhua=   SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x418021_var_Buf1, 0);
	else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"使用物品异常！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
	end

end

function x418023_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
