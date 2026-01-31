





x414040_var_FileId 		= 414040 

x414040_var_LevelMin		=	1




function x414040_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x414040_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x414040_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x414040_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x414040_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x414040_ProcActivateOnce( varMap, varPlayer, varImpact )
		local today = GetDayOfYear()
    local count = GetPlayerGameData( varMap, varPlayer, MD_JINKATOYINKA_DAYCOUNT[ 1], MD_JINKATOYINKA_DAYCOUNT[ 2], MD_JINKATOYINKA_DAYCOUNT[ 3] )
    
    if GetPlayerGameData( varMap, varPlayer, MD_JINKATOYINKA_DAY[ 1], MD_JINKATOYINKA_DAY[ 2], MD_JINKATOYINKA_DAY[ 3] ) == today then
        if count >=5 then
					Msg2Player( varMap, varPlayer, "您今天的开启次数已达上限", 0, 2 )
					Msg2Player( varMap, varPlayer, "您今天的开启次数已达上限", 0, 3 )
					return
        end	        
    end	
	
	if GetLevel(varMap, varPlayer)< x414040_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
--	if GetTopListInfo_MinLevel( GetWorldID( varMap, varPlayer) ) < 70 then
--	   Msg2Player( varMap, varPlayer, "很抱歉，等级排行榜最后一名玩家未到70级，无法使用物品", 0, 3 )
  --	 return 
  --end	 	
	


	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		local nMoney = 150000
		AddMoney(varMap, varPlayer, 1, nMoney)
		Msg2Player(varMap,varPlayer,format("您获得了#{_MONEY%d}银卡的奖励。", nMoney),4,3)
		Msg2Player(varMap,varPlayer,format("您获得了#{_MONEY%d}银卡的奖励。", nMoney),4,2)
		
     	if GetPlayerGameData( varMap, varPlayer, MD_JINKATOYINKA_DAY[ 1], MD_JINKATOYINKA_DAY[ 2], MD_JINKATOYINKA_DAY[ 3] ) == today then
       	if GetPlayerGameData( varMap, varPlayer, MD_JINKATOYINKA_DAYCOUNT[ 1], MD_JINKATOYINKA_DAYCOUNT[ 2], MD_JINKATOYINKA_DAYCOUNT[ 3] ) <5 then
            SetPlayerGameData( varMap,varPlayer, MD_JINKATOYINKA_DAYCOUNT[ 1], MD_JINKATOYINKA_DAYCOUNT[ 2], MD_JINKATOYINKA_DAYCOUNT[ 3], count+1)
 			 	end
   	  else
        SetPlayerGameData( varMap,varPlayer, MD_JINKATOYINKA_DAY[ 1], MD_JINKATOYINKA_DAY[ 2], MD_JINKATOYINKA_DAY[ 3], today )
        SetPlayerGameData( varMap,varPlayer, MD_JINKATOYINKA_DAYCOUNT[ 1], MD_JINKATOYINKA_DAYCOUNT[ 2], MD_JINKATOYINKA_DAYCOUNT[ 3], 1)
   	  end
   	  
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"使用物品异常！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x414040_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
