
--YY平民新年特权卡





x418460_var_FileId 		= 418460

x418460_var_LevelMin		=	1





function x418460_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418460_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418460_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418460_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418460_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418460_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	

	StartItemTask(varMap)
	 ItemAppendBind( varMap, 12050268, 1 )	--YY浣熊降世符
   ItemAppendBind( varMap, 11990011, 5 )	--三番令
   ItemAppendBind( varMap, 12054300, 5 )	--还童书
   ItemAppendBind( varMap, 12030016, 2 )	--队伍召集令
   ItemAppendBind( varMap, 12030012, 20 )	--路易十三

  
	
	

	
 	
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then 
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)	
			local nMoney = 500000
			AddMoney(varMap,varPlayer,1,nMoney)  
		
			Msg2Player( varMap,varPlayer,"打开礼包，获得YY浣熊降世符1个、路易十三20个、三番令5个、队伍召集令2个、银卡500两、还童书5本",8,3) ;
		
			GamePlayScriptLog( varMap, varPlayer, 3019)
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







function x418460_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
