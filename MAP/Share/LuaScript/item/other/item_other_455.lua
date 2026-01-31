
--闹太套新年大礼包





x418455_var_FileId 		= 418455

x418455_var_LevelMin		=	1





function x418455_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418455_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418455_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418455_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418455_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418455_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	

	StartItemTask(varMap)
	ItemAppendBind( varMap, 12050299, 1 )	--圣诞熊降世符
	ItemAppendBind( varMap, 12110206, 5 )	--钟情一生
	ItemAppendBind( varMap, 12030801, 1 )	--小钱包
	ItemAppendBind( varMap, 12031002, 10 )	--五彩缤纷烟花
	
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
			Msg2Player( varMap,varPlayer,"打开礼包，获得圣诞熊坐骑，好基友时装,小钱包1个，钟情一生5个，五彩缤纷烟花10个",8,3) ;
			else
			Msg2Player( varMap,varPlayer,"打开礼包，获得圣诞熊坐骑，事业线时装,小钱包1个，钟情一生5个，五彩缤纷烟花10个",8,3) ;
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







function x418455_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
