

























function x430032_ProcEventEntry( varMap, varPlayer, varBagIdx )
	
	
	
	
	return 0;
end










function x430032_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 

end

function x430032_ProcCancelImpacts( varMap, varPlayer )
	return 0;
end





function x430032_ProcConditionCheck( varMap, varPlayer )
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	
	if(LetAllHorseHappy( varMap, varPlayer, 1 ) ~= 0) then
		local varStr = "没有骑乘需要恢复生命值"
		Msg2Player(varMap, varPlayer, varStr, 8, 3)
		return 0
	end
	return 1; 

end







function x430032_ProcDeplete( varMap, varPlayer )
	if( DepletingUsedItem(varMap, varPlayer) > 0 ) then
		return 1;
	end
	return 0;
end








function x430032_ProcActivateOnce( varMap, varPlayer )
	
		
		
	
	LetAllHorseHappy( varMap, varPlayer, 0 )
	return 1;
end







function x430032_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
