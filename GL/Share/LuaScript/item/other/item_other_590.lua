
--白色将星包





x418590_var_FileId 		= 418590

x418590_var_LevelMin		=	1





function x418590_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418590_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418590_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418590_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418590_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418590_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	

	StartItemTask(varMap)
	ItemAppendBind( varMap, 45013681, 1)	--雄鹰长老
	ItemAppendBind( varMap, 45013686, 1)	--苍狼长老
	ItemAppendBind( varMap, 45013691, 1)	--年轻的铁木真
	ItemAppendBind( varMap, 45013696, 1)	--年轻的札木合
	ItemAppendBind( varMap, 45013701, 1)	--狡猾的王汗
	ItemAppendBind( varMap, 45013706, 1)	--纨绔的桑昆

	
 	
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then 
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)	
			
			
			Msg2Player( varMap,varPlayer,"打开礼包，获得1个雄鹰长老、1个苍狼长老、1个年轻的铁木真等",8,2) ;
			
			Msg2Player( varMap,varPlayer,"打开礼包，获得1个雄鹰长老、1个苍狼长老、1个年轻的铁木真等",8,3) ;
		
			
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







function x418590_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
