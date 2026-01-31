
--花样成就包





x418575_var_FileId 		= 418575

x418575_var_LevelMin		=	1





function x418575_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418575_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418575_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418575_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418575_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418575_ProcActivateOnce( varMap, varPlayer, varImpact )
	if GetBagSpace(varMap, varPlayer) < 1 then
		Msg2Player( varMap, varPlayer, "您的背包空间不足，请整理后再使用", 8, 3)
		return
	end	


	if(DepletingUsedItem(varMap, varPlayer)) == 1 then

			
	if GetBagSpace(varMap, varPlayer) >= 1 then
		local itemlist = {
		{count = 1,item=12500271,},
 		{count = 1,item=12500272,},
		{count = 1,item=12500273,},
		}                              
		local k =-1
		local varRand = random (1,100)
		StartItemTask( varMap )
		if varRand <= 50 then
			k = 1
		elseif 	 varRand <= 80 then
      k = 2
		else
			k = 3
		end  
		ItemAppendBind( varMap, itemlist[k].item, itemlist[k].count ) --高级经验符
			local varRet = StopItemTask( varMap, varPlayer )
			if varRet > 0 then
				DeliverItemListSendToPlayer(varMap,varPlayer)
				local message = "恭喜您获得了物品：@item_"..itemlist[k].item
				Msg2Player( varMap, varPlayer, message, 8, 2)
				Msg2Player( varMap, varPlayer, message, 8, 3)

			end
		end
	else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"使用物品异常！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end

end







function x418575_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
