
x413100_var_FileId  = 413100
x413100_var_Buf1   = 14306
x413100_var_Buf2   = -1 





function x413100_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x413100_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x413100_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x413100_ProcConditionCheck( varMap, varPlayer )

 
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	local varTalknpc = GetTargetObjID(varMap, varPlayer)
	if(0<=varTalknpc) then
		




		
	
	
	
	
		




		









	end

	return 1; 
end






function x413100_ProcDeplete( varMap, varPlayer )
 	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		return 1;
	end
	return 0;
	
end

function ShowTips( varMap,varPlayer,msgTips )

	StartTalkTask(varMap);
		TalkAppendString(varMap,msgTips);
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);

end








function x413100_ProcActivateOnce( varMap, varPlayer )
    if(-1~=x413100_var_Buf1) then
		

		

		local varTalknpc = GetTargetObjID(varMap, varPlayer)
		varTalknpc = 4
		if(0<=varTalknpc) then 
		    

			SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varTalknpc, x413100_var_Buf1, 0);
		end
		


		


		







	end
	return 1;
end







function x413100_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
