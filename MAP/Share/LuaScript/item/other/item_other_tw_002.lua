





x205002_var_FileId = 205002
 	






function x205002_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x205002_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x205002_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x205002_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x205002_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x205002_ProcActivateOnce( varMap, varPlayer, varImpact )
	--背包空间判断
	if GetBagSpace(varMap, varPlayer) < 16 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"您至少需要16个空余背包位才能使用此礼包")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	local zhiye =GetZhiye(varMap,varPlayer)
	StartItemTask(varMap)
	--武士 自测过
	if zhiye == 0 then
		ItemAppendBind( varMap,10014003,1 )
		ItemAppendBind( varMap,10074003,1 )
		ItemAppendBind( varMap,10204003,1 )
		ItemAppendBind( varMap,10234003,1 )	
		ItemAppendBind( varMap,10244003,1 )	
		ItemAppendBind( varMap,10254003,1 )	
		ItemAppendBind( varMap,10264003,1 )	
		ItemAppendBind( varMap,10274003,1 )
		StopItemTask(varMap,varPlayer)   
		DeliverItemListSendToPlayer(varMap,varPlayer)
		StartItemTask(varMap)	
		ItemAppendBind( varMap,10284003,2 )	
		ItemAppendBind( varMap,10294003,2 )
		ItemAppendBind( varMap,10221108,1 )
		ItemAppendBind( varMap,10213101,1 )
		ItemAppendBind( varMap,11000300,12 )
		ItemAppendBind( varMap,11000302,2 )
	--剑侠	自测过
	elseif zhiye ==1 then
		ItemAppendBind( varMap,10024003,1 )
		ItemAppendBind( varMap,10084003,1 )
		ItemAppendBind( varMap,10204013,1 )
		ItemAppendBind( varMap,10234013,1 )	
		ItemAppendBind( varMap,10244013,1 )	
		ItemAppendBind( varMap,10254013,1 )	
		ItemAppendBind( varMap,10264013,1 )	
		ItemAppendBind( varMap,10274013,1 )
		StopItemTask(varMap,varPlayer)   
		DeliverItemListSendToPlayer(varMap,varPlayer)
		StartItemTask(varMap)		
		ItemAppendBind( varMap,10284013,2 )	
		ItemAppendBind( varMap,10294013,2 )
		ItemAppendBind( varMap,10221108,1 )
		ItemAppendBind( varMap,10213101,1 )
		ItemAppendBind( varMap,11000300,12 )
		ItemAppendBind( varMap,11000302,2 )
	--骑射 自测过
	elseif zhiye ==2 then
		ItemAppendBind( varMap,10034003,1 )
		ItemAppendBind( varMap,10094003,1 )
		ItemAppendBind( varMap,10204023,1 )
		ItemAppendBind( varMap,10234023,1 )	
		ItemAppendBind( varMap,10244023,1 )	
		ItemAppendBind( varMap,10254023,1 )	
		ItemAppendBind( varMap,10264023,1 )	
		ItemAppendBind( varMap,10274023,1 )
		StopItemTask(varMap,varPlayer)   
		DeliverItemListSendToPlayer(varMap,varPlayer)
		StartItemTask(varMap)		
		ItemAppendBind( varMap,10284023,2 )	
		ItemAppendBind( varMap,10294023,2 )
		ItemAppendBind( varMap,10221108,1 )
		ItemAppendBind( varMap,10213101,1 )
		ItemAppendBind( varMap,11000300,12 )
		ItemAppendBind( varMap,11000302,2 )
	--火枪 自测过
	elseif zhiye ==3 then
		ItemAppendBind( varMap,10044003,1 )
		ItemAppendBind( varMap,10104003,1 )
		ItemAppendBind( varMap,10204033,1 )
		ItemAppendBind( varMap,10234033,1 )	
		ItemAppendBind( varMap,10244033,1 )	
		ItemAppendBind( varMap,10254033,1 )	
		ItemAppendBind( varMap,10264033,1 )	
		ItemAppendBind( varMap,10274033,1 )
		StopItemTask(varMap,varPlayer)   
		DeliverItemListSendToPlayer(varMap,varPlayer)
		StartItemTask(varMap)		
		ItemAppendBind( varMap,10284033,2 )	
		ItemAppendBind( varMap,10294033,2 )
		ItemAppendBind( varMap,10221108,1 )
		ItemAppendBind( varMap,10213101,1 )
		ItemAppendBind( varMap,11000300,12 )
		ItemAppendBind( varMap,11000302,2 )
	--先知 自测过
	elseif zhiye ==4 then
		ItemAppendBind( varMap,10054003,1 )
		ItemAppendBind( varMap,10114003,1 )
		ItemAppendBind( varMap,10204043,1 )
		ItemAppendBind( varMap,10234043,1 )	
		ItemAppendBind( varMap,10244043,1 )	
		ItemAppendBind( varMap,10254043,1 )	
		ItemAppendBind( varMap,10264043,1 )	
		ItemAppendBind( varMap,10274043,1 )
		StopItemTask(varMap,varPlayer)   
		DeliverItemListSendToPlayer(varMap,varPlayer)
		StartItemTask(varMap)		
		ItemAppendBind( varMap,10284043,2 )	
		ItemAppendBind( varMap,10294043,2 )
		ItemAppendBind( varMap,10221108,1 )
		ItemAppendBind( varMap,10213101,1 )
		ItemAppendBind( varMap,11000300,12 )
		ItemAppendBind( varMap,11000302,2 )
	--萨满 自测过
	elseif zhiye ==5 then
		ItemAppendBind( varMap,10064003,1 )
		ItemAppendBind( varMap,10124003,1 )
		ItemAppendBind( varMap,10204053,1 )
		ItemAppendBind( varMap,10234053,1 )	
		ItemAppendBind( varMap,10244053,1 )	
		ItemAppendBind( varMap,10254053,1 )	
		ItemAppendBind( varMap,10264053,1 )	
		ItemAppendBind( varMap,10274053,1 )
		StopItemTask(varMap,varPlayer)   
		DeliverItemListSendToPlayer(varMap,varPlayer)
		StartItemTask(varMap)		
		ItemAppendBind( varMap,10284053,2 )	
		ItemAppendBind( varMap,10294053,2 )
		ItemAppendBind( varMap,10221108,1 )
		ItemAppendBind( varMap,10213101,1 )
		ItemAppendBind( varMap,11000300,12 )
		ItemAppendBind( varMap,11000302,2 )
	--十字军 自测过	
	elseif zhiye ==6 then
		ItemAppendBind( varMap,10354003,1 )
		ItemAppendBind( varMap,10414003,1 )
		ItemAppendBind( varMap,10204063,1 )
		ItemAppendBind( varMap,10239220,1 )	
		ItemAppendBind( varMap,10249220,1 )	
		ItemAppendBind( varMap,10259220,1 )	
		ItemAppendBind( varMap,10269220,1 )	
		ItemAppendBind( varMap,10279220,1 )
		StopItemTask(varMap,varPlayer)   
		DeliverItemListSendToPlayer(varMap,varPlayer)
		StartItemTask(varMap)		
		ItemAppendBind( varMap,10288020,2 )	
		ItemAppendBind( varMap,10298020,2 )
		ItemAppendBind( varMap,10221108,1 )
		ItemAppendBind( varMap,10213101,1 )
		ItemAppendBind( varMap,11000300,12 )
		ItemAppendBind( varMap,11000302,2 )
	--圣火使 自测过	
	elseif zhiye ==7 then
		ItemAppendBind( varMap,10364003,1 )
		ItemAppendBind( varMap,10424003,1 )
		ItemAppendBind( varMap,10204073,1 )
		ItemAppendBind( varMap,10239224,1 )	
		ItemAppendBind( varMap,10249224,1 )	
		ItemAppendBind( varMap,10259224,1 )	
		ItemAppendBind( varMap,10269224,1 )	
		ItemAppendBind( varMap,10279224,1 )
		StopItemTask(varMap,varPlayer)   
		DeliverItemListSendToPlayer(varMap,varPlayer)
		StartItemTask(varMap)		
		ItemAppendBind( varMap,10288024,2 )	
		ItemAppendBind( varMap,10298024,2 )
		ItemAppendBind( varMap,10221108,1 )
		ItemAppendBind( varMap,10213101,1 )
		ItemAppendBind( varMap,11000300,12 )
		ItemAppendBind( varMap,11000302,2 )
	--刺客 自测过
	elseif zhiye ==8 then
		ItemAppendBind( varMap,10374003,1 )
		ItemAppendBind( varMap,10434003,1 )
		ItemAppendBind( varMap,10204083,1 )
		ItemAppendBind( varMap,10239228,1 )	
		ItemAppendBind( varMap,10249228,1 )	
		ItemAppendBind( varMap,10259228,1 )	
		ItemAppendBind( varMap,10269228,1 )	
		ItemAppendBind( varMap,10279228,1 )
		StopItemTask(varMap,varPlayer)   
		DeliverItemListSendToPlayer(varMap,varPlayer)
		StartItemTask(varMap)		
		ItemAppendBind( varMap,10288028,2 )	
		ItemAppendBind( varMap,10298028,2 )
		ItemAppendBind( varMap,10221108,1 )
		ItemAppendBind( varMap,10213101,1 )
		ItemAppendBind( varMap,11000300,12 )
		ItemAppendBind( varMap,11000302,2 )
	--近卫军 自测过
	elseif zhiye ==9 then
		ItemAppendBind( varMap,10384003,1 )
		ItemAppendBind( varMap,10444003,1 )
		ItemAppendBind( varMap,10204093,1 )
		ItemAppendBind( varMap,10239232,1 )	
		ItemAppendBind( varMap,10249232,1 )	
		ItemAppendBind( varMap,10259232,1 )	
		ItemAppendBind( varMap,10269232,1 )	
		ItemAppendBind( varMap,10279232,1 )
		StopItemTask(varMap,varPlayer)   
		DeliverItemListSendToPlayer(varMap,varPlayer)
		StartItemTask(varMap)		
		ItemAppendBind( varMap,10288032,2 )	
		ItemAppendBind( varMap,10298032,2 )
		ItemAppendBind( varMap,10221108,1 )
		ItemAppendBind( varMap,10213101,1 )
		ItemAppendBind( varMap,11000300,12 )
		ItemAppendBind( varMap,11000302,2 )
	--隐修士	自测过		
	elseif zhiye ==10  then
		ItemAppendBind( varMap,10394003,1 )
		ItemAppendBind( varMap,10454003,1 )
		ItemAppendBind( varMap,10204103,1 )
		ItemAppendBind( varMap,10239236,1 )	
		ItemAppendBind( varMap,10249236,1 )	
		ItemAppendBind( varMap,10259236,1 )	
		ItemAppendBind( varMap,10269236,1 )	
		ItemAppendBind( varMap,10279236,1 )
		StopItemTask(varMap,varPlayer)   
		DeliverItemListSendToPlayer(varMap,varPlayer)
		StartItemTask(varMap)		
		ItemAppendBind( varMap,10288036,2 )	
		ItemAppendBind( varMap,10298036,2 )
		ItemAppendBind( varMap,10221108,1 )
		ItemAppendBind( varMap,10213101,1 )
		ItemAppendBind( varMap,11000300,12 )
		ItemAppendBind( varMap,11000302,2 )
	--僧侣	自测过			
	else
		ItemAppendBind( varMap,10404003,1 )
		ItemAppendBind( varMap,10464003,1 )
		ItemAppendBind( varMap,10204113,1 )
		ItemAppendBind( varMap,10239240,1 )	
		ItemAppendBind( varMap,10249240,1 )	
		ItemAppendBind( varMap,10259240,1 )	
		ItemAppendBind( varMap,10269240,1 )	
		ItemAppendBind( varMap,10279240,1 )
		StopItemTask(varMap,varPlayer)   
		DeliverItemListSendToPlayer(varMap,varPlayer)
		StartItemTask(varMap)		
		ItemAppendBind( varMap,10288040,2 )	
		ItemAppendBind( varMap,10298040,2 )
		ItemAppendBind( varMap,10221108,1 )
		ItemAppendBind( varMap,10213101,1 )
		ItemAppendBind( varMap,11000300,12 )
		ItemAppendBind( varMap,11000302,2 )			
	end

	local varRet = StopItemTask(varMap,varPlayer)
	if varRet > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开礼包，获得了礼包道具！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"使用物品异常！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end
		
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"背包已满，无法得到物品！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x205002_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
