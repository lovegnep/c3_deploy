













x404945_var_FileId = 404945 




x404945_var_Buf1 = 32020
 
x404945_var_Buf2 = -1 




function x404945_ProcEventEntry( varMap, varPlayer, varBagIdx )


end






function x404945_ProcIsSpellLikeScript( varMap, varPlayer)

	return 1; 
end






function x404945_ProcCancelImpacts( varMap, varPlayer )

	return 0; 
end






function x404945_ProcConditionCheck( varMap, varPlayer )
	local ChariotObjID = GetPlayerChariotObjID( varMap, varPlayer )
	if ChariotObjID == -1 then
		Msg2Player(varMap,varPlayer,"没有驾驶战车，无法使用",8,2)
		Msg2Player(varMap,varPlayer,"没有驾驶战车，无法使用",8,3)		
		return
	end

	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x404945_ProcDeplete( varMap, varPlayer )
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		return 1;
	end
	return 0;
end








function x404945_ProcActivateOnce( varMap, varPlayer, varImpact )
	local ChariotObjID = GetPlayerChariotObjID( varMap, varPlayer )	
	if(-1~=x404945_var_Buf1) then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, ChariotObjID, x404945_var_Buf1, 0);
	end
	return 1;
end







function x404945_ProcActivateEachTick( varMap, varPlayer)

	return 1; 
end
