





x418298_var_FileId = 418298
x418298_var_ItemList = {}
x418298_var_LevelMin = 1	






function x418298_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418298_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418298_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418298_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418298_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418298_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	if GetLevel(varMap, varPlayer)< x418298_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	local equip ={10300150,10300151,10300155,10300156} --玉兔折桂时装、真爱一生礼服、贺喜华服、虎啸远征时装
	local horse ={12050261,12050274,12050265,12050277} --黄金虎降世符、狮王降世符、碧玺大鹏降世符、雪狼降世符
	local equipid =random(1, getn(equip))
	local horseid =random(1, getn(horse))
	
	StartItemTask(varMap)
		ItemAppendBind( varMap, equip[equipid], 1 )	
		ItemAppendBind( varMap, horse[equipid], 1 )
		ItemAppendBind( varMap, 11000200, 10 )--世传水晶×10
		ItemAppendBind( varMap, 19010007, 1 ) --布袋包×1
		ItemAppendBind( varMap, 12110206, 5 ) --钟情一生×5
		ItemAppendBind( varMap, 12031019, 10 )--斩×10
		ItemAppendBind( varMap, 12030320, 1 )--10两小钱包
		ItemAppendBind( varMap, 12041101, 2 )--修行草x2
	

	local varRet = StopItemTask(varMap,varPlayer)
	if varRet > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开战神大礼包，获得1件新手时装，1个骑乘降世符，世传水晶等道具。")
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







function x418298_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
