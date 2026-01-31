

























function x430163_ProcEventEntry( varMap, varPlayer, varBagIdx )
	
	
	
	
	return 0;
end










function x430163_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 

end

function x430163_ProcCancelImpacts( varMap, varPlayer )
	return 0;
end





function x430163_ProcConditionCheck( varMap, varPlayer )
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	local bagIndex = GetBagIndexOfUsedItem(varMap ,varPlayer)

	if GetItemIsOverTimeByBagPos(varMap ,varPlayer ,bagIndex) == 1 then
			if( DepletingUsedItem(varMap, varPlayer) > 0 ) then
			Msg2Player(varMap, varPlayer, "您使用的物品已过期,道具自动删除！", 8, 3)
				return
			end
	end
	if(LetAllHorseHappy( varMap, varPlayer, 1 ) ~= 0) then
		local varStr = "没有骑乘需要恢复生命值"
		Msg2Player(varMap, varPlayer, varStr, 8, 3)
		return 0
	end
	return 1; 

end







function x430163_ProcDeplete( varMap, varPlayer )
	--删道具条件
		return 1;
end








function x430163_ProcActivateOnce( varMap, varPlayer )
	
		
	
		LetAllHorseHappy( varMap, varPlayer, 0 )
		if LastMount(varMap, varPlayer) == 1 then
			local varStr = "骑乘出战完成"
			Msg2Player(varMap, varPlayer, varStr, 8, 3)
		end
	return 1;
end







function x430163_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
