
x303142_var_FileId = 303142 

x303142_var_Buf1 = 8001 


function x303142_ProcEventEntry( varMap, varPlayer, varBagIdx )
end






function x303142_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x303142_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x303142_ProcConditionCheck( varMap, varPlayer )
	
	local varMapType = GetSceneType(varMap)
	--if ( varMapType ~= 7 ) then
		--Msg2Player(varMap,varPlayer, "请在跨服帮会战场使用该物品",8,2)
		--Msg2Player(varMap,varPlayer, "请在跨服帮会战场使用该物品",8,3)	
		--return
	--end
		
	if ( varMap < 650 or varMap > 749 ) then
		Msg2Player(varMap,varPlayer, "请在跨服帮会战场使用该物品",8,2)
		Msg2Player(varMap,varPlayer, "请在跨服帮会战场使用该物品",8,3)
		return
	end
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x303142_ProcDeplete( varMap, varPlayer )
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		return 1;
	end
	return 0;
end








function x303142_ProcActivateOnce( varMap, varPlayer, varImpact )
	if(-1~=x303142_var_Buf1) then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, varImpact, 0);
	end
	return 1;
end







function x303142_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
