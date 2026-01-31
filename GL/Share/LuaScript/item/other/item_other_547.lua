





x418547_var_FileId 		= 418547 

x418547_var_LevelMin		=	1






function x418547_ProcEventEntry( varMap, varPlayer, varBagIdx )
if GetLevel(varMap, varPlayer)< x418547_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	


if(DelItemByIndexInBag( varMap, varPlayer, varBagIdx, 1)) == 1 then
		local nMoney = random(80,100)
		AddMoney(varMap, varPlayer, 1, nMoney)
		
		GamePlayScriptLog( varMap, varPlayer, 1485)
		
		Msg2Player(varMap,varPlayer,format("你获得了#{_MONEY%d}银卡", nMoney),4,3)
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"使用物品异常！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end
end






function x418547_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0; 
end






function x418547_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418547_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418547_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418547_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	

end







function x418547_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
