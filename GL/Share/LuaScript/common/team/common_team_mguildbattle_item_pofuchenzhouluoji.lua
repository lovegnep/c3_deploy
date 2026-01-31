
x303148_var_FileId = 303148 


function x303148_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x303148_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x303148_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x303148_ProcConditionCheck( varMap, varPlayer )
	
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
	
	local varSelfHp = 0
	local varSelfMaxHp = 0
	varSelfHp = GetHp( varMap, varPlayer )
	varSelfMaxHp = GetMaxHp( varMap, varPlayer )
	
	if ( varSelfHp/varSelfMaxHp >= 0.6 ) then
		Msg2Player(varMap,varPlayer, "只有血量低于60%，才能使用此道具",8,2)
		Msg2Player(varMap,varPlayer, "只有血量低于60%，才能使用此道具",8,3)
		return
	end
	
	local buffid = 0 
	local varTalknpc = GetTargetObjID(varMap, varPlayer)                                                      
	local NUM = GetImpactListCount(varMap,varTalknpc)
	
	for i=0,NUM-1 do                                                       
		buffid = GetImpactDataIndex(varMap,varTalknpc,i)                    
		if ( buffid == 32570 ) then
			Msg2Player(varMap,varPlayer, "目标玩家已经免疫此效果",8,2)
			Msg2Player(varMap,varPlayer, "目标玩家已经免疫此效果",8,3)
			return
		end
	end
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	
	if ( varTalknpc >= 0 ) then
		return 1;
	end

	return 0; 
end







function x303148_ProcDeplete( varMap, varPlayer )
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		return 1;
	end
	return 0;
end








function x303148_ProcActivateOnce( varMap, varPlayer, varImpact )
	local varTalknpc = GetTargetObjID(varMap, varPlayer)
	SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, 32568, 0)
	SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varTalknpc, 32569, 0)
	return 1;
end







function x303148_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
