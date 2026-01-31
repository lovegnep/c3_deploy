

























function x430001_ProcEventEntry( varMap, varPlayer, varBagIdx )
	
	
	
	
	return 0;
end










function x430001_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 

end

function x430001_ProcCancelImpacts( varMap, varPlayer )
	return 0;
end





function x430001_ProcConditionCheck( varMap, varPlayer )
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	if(IsNeedRepaireBodyItemDur( varMap, varPlayer ) <= 0) then
		local varStr
		varStr = "没有装备需要修理"
		StartTalkTask( varMap )
		TalkAppendString( varMap, varStr )
		StopTalkTask()
		DeliverTalkTips( varMap, varPlayer )

		return 0
	end
	return 1; 

end







function x430001_ProcDeplete( varMap, varPlayer )
	if( DepletingUsedItem(varMap, varPlayer) > 0 ) then
		return 1;
	end
	return 0;
end








function x430001_ProcActivateOnce( varMap, varPlayer )
	
		
		RepaireBodyItemDur( varMap, varPlayer, 0 )
	
	return 1;
end







function x430001_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
