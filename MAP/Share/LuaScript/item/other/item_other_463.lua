
--一骑当千大礼包





x418463_var_FileId 		= 418463

x418463_var_LevelMin		=	1





function x418463_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418463_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418463_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418463_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418463_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418463_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	

	StartItemTask(varMap)
	ItemAppendBind( varMap, 10300141, 1 )	--圣诞时装
	ItemAppendBind( varMap, 12110206, 5 )	--钟情一生
	ItemAppendBind( varMap, 12030801, 1 )	--小钱包
	ItemAppendBind( varMap, 11990011, 2 )	--三番令
	ItemAppendBind( varMap, 12041101, 3)	--修行草 
	ItemAppendBind( varMap, 11000200, 20)	--世传水晶 
	
	
	if GetSex(varMap,varPlayer) == 1 then
	
	
	local ran=random(1,2)
	if(ran<2) then
	  ItemAppendBind( varMap, 10306071, 1 )	--好基友时装
		else
		ItemAppendBind( varMap, 10306073, 1 )	--好基友时装
		end
	else
		ItemAppendBind( varMap, 10306072, 1 )	--事业线时装
	end	
	

	
 	
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then 
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)	
			
			if GetSex(varMap,varPlayer) == 1 then
			Msg2Player( varMap,varPlayer,"打开礼包，获得圣诞时装、好基友时装,获得小钱包1个、世传水晶20个、钟情一生5个等物品",8,3) ;
			else
			Msg2Player( varMap,varPlayer,"打开礼包，获得圣诞时装、事业线时装,获得小钱包1个、世传水晶20个、钟情一生5个等物品",8,3) ;
			print(GetSex(varMap,varPlayer))
			end
			GamePlayScriptLog( varMap, varPlayer, 3014)
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







function x418463_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
