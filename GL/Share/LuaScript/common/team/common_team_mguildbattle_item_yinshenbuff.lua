
x303145_var_FileId = 303145

function x303145_ProcEventEntry( varMap, varPlayer, varBagIdx )

end




function x303145_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end




function x303145_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end




function x303145_ProcConditionCheck( varMap, varPlayer )
		
	--local varMapType = GetSceneType(varMap)
	--if ( varMapType ~= 7 ) then
		--Msg2Player(varMap,varPlayer, "请在跨服帮会战场使用该物品",8,2)
		--Msg2Player(varMap,varPlayer, "请在跨服帮会战场使用该物品",8,3)	
		--return
	--end
		
	if ( varMap < 3584 or varMap > 3886 ) then
		Msg2Player(varMap,varPlayer, "请在跨服帮会战场使用该物品",8,2)
		Msg2Player(varMap,varPlayer, "请在跨服帮会战场使用该物品",8,3)
		return
	end
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 

end




function x303145_ProcDeplete( varMap, varPlayer )
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		return 1;
	end
	return 0;
end




function x303145_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	if ( varImpact ~= nil ) then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, varImpact, 0)
	end
	
	return 1;
end




function x303145_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
