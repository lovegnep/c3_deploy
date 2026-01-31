





x432530_var_FileId 		= 432530

x432530_var_LevelMin		=	60

x432530_var_lingjiangBUFF = 9300




function x432530_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x432530_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x432530_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x432530_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x432530_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x432530_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	if IsHaveSpecificImpact(varMap, varPlayer, x432530_var_lingjiangBUFF) == 1 then
		Msg2Player(varMap, varPlayer, "不要着急，领奖状态消失后才可以开启礼包！", 8, 3)
		Msg2Player(varMap, varPlayer, "不要着急，领奖状态消失后才可以开启礼包！", 8, 2)
		return 1
	end	
	if GetLevel(varMap, varPlayer)< x432530_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	


	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		local nMoney = 100000
		AddMoney(varMap, varPlayer, 3, nMoney)
		
		GamePlayScriptLog( varMap, varPlayer, 1485)
		
		Msg2Player(varMap,varPlayer,format("你获得了#{_MONEY%d}金卡", nMoney),4,3)
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"使用物品异常！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x432530_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
