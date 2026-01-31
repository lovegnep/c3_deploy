function x600000_ProcActiveEvent(varMap, varPlayer)

	StartItemTask(varMap)
		ItemAppend( varMap,12010100,1)
	local varRet = StopItemTask(varMap,varPlayer)
	if varRet > 0 then
		DeliverItemListSendToPlayer(varMap,varPlayer)	
			StartTalkTask(varMap)
				TalkAppendString(varMap, "你获得了马奶！")
			StopTalkTask()
	else 
		StartTalkTask(varMap)
			TalkAppendString(varMap, "物品栏已满，无法得到马奶！！")
		StopTalkTask()	
	end	
	DeliverTalkTips(varMap, varPlayer);

end
