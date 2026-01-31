--冲级赛礼包（70级）





x418629_var_FileId 		= 418629

x418629_var_LevelMin		=	1





function x418629_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418629_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418629_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418629_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418629_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418629_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	local nian, yue, ri = GetYearMonthDay()
	local day = GetDayOfYear()
	if nian > 2012 then
		Msg2Player( varMap, varPlayer, "礼包已过期，系统自动删除礼包", 8, 3)
		DepletingUsedItem(varMap, varPlayer)
		return	
	end


	if day > 148 then
		Msg2Player( varMap, varPlayer, "礼包已过期，系统自动删除礼包", 8, 3)
		DepletingUsedItem(varMap, varPlayer)
		return	
	end
	
	local lv = GetLevel( varMap, varPlayer)
    if lv < 80 then
    Msg2Player( varMap, varPlayer, "请80级以后再使用此礼包", 8, 3)
        return
    end
 	

		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			
			Msg2Player( varMap,varPlayer,"打开礼包，获得金卡200两",8,2) ;
			
			Msg2Player( varMap,varPlayer,"打开礼包，获得金卡200两",8,3) ;
			local nMoney = 200000
			AddMoney(varMap, varPlayer, 3, nMoney)
			Msg2Player(varMap,varPlayer,format("你获得了#{_MONEY%d}金卡", nMoney),4,3)
   		GamePlayScriptLog( varMap, varPlayer, 3734)
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"使用物品异常！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end


end







function x418629_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
