
--龙腾新春大礼包

x418532_var_FileId 		= 418532

x418532_var_LevelMin	= 40


function x418532_ProcEventEntry( varMap, varPlayer, varBagIdx )

end

function x418532_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end

function x418532_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x418532_ProcConditionCheck( varMap, varPlayer )
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end


function x418532_ProcDeplete( varMap, varPlayer )
	
	return 1;
end
function x418532_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	if GetLevel(varMap, varPlayer)< x418532_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end	

	StartItemTask(varMap)
	ItemAppendBind( varMap, 19010006, 2)	--雕菱锦线包2个
	ItemAppendBind( varMap, 11990050, 50)	--还魂丹50个
	ItemAppendBind( varMap, 12030948, 100)	--豪华将星卡礼盒100个
	ItemAppendBind( varMap, 12030201, 50)	--修理石50个
	ItemAppendBind( varMap, 12030213, 50)	--强效极乐草50个	
 	
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then 
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)	
			
			Msg2Player( varMap,varPlayer,"打开龙腾新春大礼包，获得雕菱锦线包2个，还魂丹50个，金卡10000两，豪华将星卡礼盒100个，修理石50个，强效极乐草50个。",8,2) ;			
			Msg2Player( varMap,varPlayer,"打开龙腾新春大礼包，获得雕菱锦线包2个，还魂丹50个，金卡10000两，豪华将星卡礼盒100个，修理石50个，强效极乐草50个。",8,3) ;		
			
			local nMoney = 10000000
			AddMoney(varMap, varPlayer, 3, nMoney)
			Msg2Player(varMap,varPlayer,format("你获得了#{_MONEY%d}金卡", nMoney),4,3)
			GamePlayScriptLog( varMap, varPlayer, 3049)
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


function x418532_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
