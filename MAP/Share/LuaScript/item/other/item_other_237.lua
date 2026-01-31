





x418237_var_FileId = 418237
x418237_var_ItemList = {}
x418237_var_LevelMin = 1	






function x418237_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418237_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418237_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418237_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418237_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418237_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	if GetLevel(varMap, varPlayer)< x418237_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	local equip ={10300150,10300151,10300155,10300156}
	local horse ={12050276,12050289,12050281,12050290}
	local equipid =random(1, getn(equip))
	local horseid =random(1, getn(horse))
	
	StartItemTask(varMap)
		ItemAppendBind( varMap, equip[equipid], 1 )	
		ItemAppendBind( varMap, horse[equipid], 1 )
		ItemAppendBind( varMap, 11000200, 10 )--世传水晶×10
		ItemAppendBind( varMap, 19010007, 1 ) --布袋包×1
		ItemAppendBind( varMap, 12110206, 5 ) --钟情一生×5
		ItemAppendBind( varMap, 12031002, 10 )--五彩缤纷×10
		ItemAppendBind( varMap, 12030320, 1 )--10两小钱包
		ItemAppendBind( varMap, 12041101, 1 )--修行草
	

	local varRet = StopItemTask(varMap,varPlayer)
	if varRet > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开礼包，获得了新手时装1件，骑乘降世符1个，世传水晶等道具。")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			DeliverItemListSendToPlayer(varMap,varPlayer)
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"使用物品异常！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end
		
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"背包已满，无法得到物品！您需要至少有8个背包空间！")	
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end
	


end







function x418237_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
