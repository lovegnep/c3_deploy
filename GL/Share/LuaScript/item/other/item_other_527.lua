
--征服世界大礼包





x418527_var_FileId 		= 418527

x418527_var_LevelMin		=	1





function x418527_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418527_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418527_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418527_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end






function x418527_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418527_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	local nian, yue, ri = GetYearMonthDay()
	local shi,fen,miao = GetHourMinSec()	

	if yue == 3 and ri < 23 then
		Msg2Player( varMap, varPlayer, "请3月23号后开启", 8, 3)
		return	
	end
	
	
	
	
	
	
	
	
	
	

	StartItemTask(varMap)
	ItemAppendBind( varMap, 12266785, 1)	--小钱包1个
	ItemAppendBind( varMap, 11000600, 3)	--初级绿水晶3个
	ItemAppendBind( varMap, 19010002, 1)	--布袋包1个
	ItemAppendBind( varMap, 12110206, 5)	--钟情一生5个
	ItemAppendBind( varMap, 12031002, 10)	--五彩缤纷烟花10个
	ItemAppendBind( varMap, 12030933, 1)	--帝国勇士时装礼包1个
	ItemAppendBind( varMap, 12050291, 1)	--千里驹降世符1个
	
 	
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then 
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)	
			
			
			Msg2Player( varMap,varPlayer,"打开礼包，获得帝国勇士时装礼包1个，千里驹降世符1个，布袋包1个等",8,2) ;
			
			Msg2Player( varMap,varPlayer,"打开礼包，获得帝国勇士时装礼包1个，千里驹降世符1个，布袋包1个等",8,3) ;
		
			
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







function x418527_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
