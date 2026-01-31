
--YY皇室特权卡





x418537_var_FileId 		= 418537

x418537_var_LevelMin		=	1





function x418537_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418537_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418537_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418537_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418537_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418537_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	local nian, yue, ri = GetYearMonthDay()
	local shi,fen,miao = GetHourMinSec()	

	if yue == 3 and ri < 23 then
		Msg2Player( varMap, varPlayer, "请3月23号后开启", 8, 3)
		return	
	end
	
	
	
	

	StartItemTask(varMap)
	ItemAppendBind( varMap, 12050292, 1)	--蚩尤饕餮兽降世符1个
	ItemAppendBind( varMap, 12030012, 20)	--路易十三20个
	ItemAppendBind( varMap, 11990011, 5)	--三番令5个
	ItemAppendBind( varMap, 12010021, 1)	--中生命清露1个
	ItemAppendBind( varMap, 12054300, 5)	--还童书5本

 	
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then 
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)	
			
			
			Msg2Player( varMap,varPlayer,"打开礼包，获得蚩尤饕餮兽降世符1个，路易十三20个，还童书5本，银卡500两等",8,2) ;
			
			Msg2Player( varMap,varPlayer,"打开礼包，获得蚩尤饕餮兽降世符1个，路易十三20个，还童书5本，银卡500两等",8,3) ;
			local nMoney = 500000
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







function x418537_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
