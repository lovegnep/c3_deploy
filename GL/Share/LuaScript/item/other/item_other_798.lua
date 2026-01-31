





x418798_var_FileId 		= 418798

x418798_var_LevelMin		=	1






function x418798_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418798_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418798_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418798_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418798_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418798_ProcActivateOnce( varMap, varPlayer, varImpact )




 	
	local ret = StopItemTask(varMap,varPlayer)
	--if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			AwardTitle(varMap,varPlayer,182)
			Msg2Player( varMap,varPlayer,"打开礼包，获得蔷薇美女称号",8,3) ;
			GamePlayScriptLog( varMap, varPlayer, 2689)
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"使用物品异常！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end
--	else
		--StartTalkTask(varMap)
	--	TalkAppendString(varMap,"背包空间不足！")	
	--	StopTalkTask(varMap)
	--	DeliverTalkTips(varMap,varPlayer)
	--end

end







function x418798_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
