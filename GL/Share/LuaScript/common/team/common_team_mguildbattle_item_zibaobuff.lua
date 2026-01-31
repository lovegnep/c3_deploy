
x303146_var_FileId = 303146

function x303146_ProcEventEntry( varMap, varPlayer, varBagIdx )

end




function x303146_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end




function x303146_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end




function x303146_ProcConditionCheck( varMap, varPlayer )
		
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




function x303146_ProcDeplete( varMap, varPlayer )
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		return 1;
	end
	return 0;
end




function x303146_ProcActivateOnce( varMap, varPlayer, varImpact )

	local varCamp = GetCurCamp(varMap, varPlayer)
	
	if ( varImpact ~= nil ) then
		if ( varCamp == 5 ) then
			SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, 32561, 0)
		elseif ( varCamp == 6 ) then
			SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, 32562, 0)
		end
	end
	
	return 1;
end




function x303146_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
