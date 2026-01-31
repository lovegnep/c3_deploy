
--新春祝福大礼包





x418479_var_FileId 		= 418479

x418479_var_LevelMin		=	1





function x418479_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418479_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418479_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418479_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418479_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418479_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	

	StartItemTask(varMap)
	ItemAppendBind( varMap, 12030016, 2 )	--队伍召集令
	ItemAppendBind( varMap, 12030031, 1)	--神行符
	ItemAppendBind( varMap, 12030201, 2 )	--修理石
	ItemAppendBind( varMap, 12030213, 2 )	--强效极乐草
	ItemAppendBind( varMap, 12250004, 1)	--精品哈瓦那雪茄
	ItemAppendBind( varMap, 12030200, 1)	--小喇叭
	


	
 	
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then 
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)	
			
			if GetSex(varMap,varPlayer) == 1 then
			Msg2Player( varMap,varPlayer,"打开礼包，获得队伍召集令2个，神行符1个，修理石2个，强效极乐草2个等物品",8,3) ;
			else
			Msg2Player( varMap,varPlayer,"打开礼包，获得队伍召集令2个，神行符1个，修理石2个，强效极乐草2个等物品",8,3) ;
			end
			GamePlayScriptLog( varMap, varPlayer, 3050)
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







function x418479_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
