

























function x430165_ProcEventEntry( varMap, varPlayer, varBagIdx )
	
	
	
	
	return 0;
end










function x430165_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 

end

function x430165_ProcCancelImpacts( varMap, varPlayer )
	return 0;
end





function x430165_ProcConditionCheck( varMap, varPlayer )
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
		local bagIndex = GetBagIndexOfUsedItem(varMap ,varPlayer)
	if GetItemIsOverTimeByBagPos(varMap ,varPlayer ,bagIndex) == 1 then
		EraseItem(varMap, varPlayer,bagIndex)
		Msg2Player(varMap, varPlayer, "您使用的物品已过期,道具自动删除！", 8, 3)
		return
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







function x430165_ProcDeplete( varMap, varPlayer )
--删道具位置

		return 1;
	
end








function x430165_ProcActivateOnce( varMap, varPlayer )
	
		
		RepaireBodyItemDur( varMap, varPlayer, 0 )
	
	return 1;
end







function x430165_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
