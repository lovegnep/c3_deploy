





x418615_var_FileId 		= 418615 

x418615_var_LevelMin		=	1






function x418615_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418615_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418615_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418615_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418615_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418615_ProcActivateOnce( varMap, varPlayer, varImpact )

	if GetLevel(varMap, varPlayer)< x418615_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
				if(DepletingUsedItem(varMap, varPlayer)) == 1 then
					local varShengWang = GetShengWang( varMap, varPlayer )
					varShengWang = varShengWang + 960
					SetShengWang( varMap, varPlayer, varShengWang )
					Msg2Player(varMap,varPlayer,format("您获得了%d点声望", 960),8,3)
					Msg2Player(varMap,varPlayer,format("您获得了%d点声望", 960),8,2)
				else
					StartTalkTask(varMap)
					TalkAppendString(varMap,"使用物品异常！")
					StopTalkTask(varMap)
					DeliverTalkTips(varMap,varPlayer)
				end
	
end







function x418615_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
