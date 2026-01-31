
--战友招募礼包





x418700_var_FileId 		= 418700

x418700_var_LevelMin		=	1





function x418700_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418700_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418700_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418700_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418700_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418700_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	if GetBagSpace(varMap, varPlayer) <= 4 then
		Msg2Player(varMap, varPlayer, "背包空间不足，请整理后再试", 0, 3)
		return
	end

	

	StartItemTask(varMap)
	ItemAppendBind( varMap, 12030016, 1)	--队伍召集令
	ItemAppendBind( varMap, 19010008, 1)	--布袋包
	ItemAppendBind( varMap, 11000200, 20)	--世传水晶20
	ItemAppendBind( varMap, 12031002, 5)	--五彩缤纷烟花
	ItemAppendBind( varMap, 12041101, 1)	--修行草

 	
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then 
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)	
			
			
			Msg2Player( varMap,varPlayer,"打开礼包，获得队伍召集令1个，布袋包1个，世传水晶20个，修行草1个等",8,2) ;
			
			Msg2Player( varMap,varPlayer,"打开礼包，获得队伍召集令1个，布袋包1个，世传水晶20个，修行草1个等",8,3) ;
			local nMoney = 20000
			AddMoney(varMap, varPlayer, 1, nMoney)
			Msg2Player(varMap,varPlayer,format("你获得了#{_MONEY%d}银卡", nMoney),4,3)
   		GamePlayScriptLog( varMap, varPlayer, 3049)
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"使用物品异常！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"背包空间不足！")	
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x418700_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
