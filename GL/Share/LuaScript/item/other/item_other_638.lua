





x418638_var_FileId 		= 418638 

x418638_var_LevelMin		=	1






function x418638_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418638_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418638_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418638_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418638_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418638_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x418638_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then

			local suiji = random(1,3)
			if suiji == 1 then
			local varShengWang = GetShengWang( varMap, varPlayer )
		    varShengWang = varShengWang + 700
		    SetShengWang( varMap, varPlayer, varShengWang )		 
				Msg2Player(varMap,varPlayer,format("您获得了%d点声望", 700),4,3)
				Msg2Player(varMap,varPlayer,format("您获得了%d点声望", 700),4,2)	
			elseif suiji == 2 then
				AddHonor(varMap, varPlayer, 130)
				Msg2Player(varMap,varPlayer,format("您获得了%d点荣誉", 130),4,3)
				Msg2Player(varMap,varPlayer,format("您获得了%d点荣誉", 130),4,2)
			elseif suiji == 3 then
			local value = GetPlayerGoodBadValue(varMap, varPlayer)
				value = value + 1200
				SetPlayerGoodBadValue(varMap, varPlayer, value)
				Msg2Player(varMap,varPlayer,format("您获得了%d点威望", 1200),4,3)
				Msg2Player(varMap,varPlayer,format("您获得了%d点威望", 1200),4,2)
			
		end
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"使用物品异常！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x418638_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
