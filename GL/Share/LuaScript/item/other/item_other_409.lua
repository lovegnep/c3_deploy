





x418409_var_FileId 		= 418409

x418409_var_LevelMin		=	1

x418409_var_Bonus = {
varitem =11010001 , varcount = 50
}

x418409_var_ChariotHonour =1000




function x418409_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418409_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418409_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418409_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418409_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418409_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	

	StartItemTask(varMap)
	ItemAppendBind( varMap, x418409_var_Bonus.varitem, x418409_var_Bonus.varcount ) 
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)
			AddPlayerChariotHonour(varMap, varPlayer, x418409_var_ChariotHonour) 		
			Msg2Player( varMap,varPlayer,format("打开礼包，获得了%d个@item_%d#cffcf00和%d点战车荣誉",x418409_var_Bonus.varcount ,x418409_var_Bonus.varitem,x418409_var_ChariotHonour),8,3) ;
			GamePlayScriptLog( varMap, varPlayer, 2648)
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







function x418409_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
