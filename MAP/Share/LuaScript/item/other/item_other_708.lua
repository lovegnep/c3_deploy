





x418708_var_FileId 		= 418708 

x418708_var_LevelMin		=	1

x418708_g_ItemID =12030967




function x418708_ProcEventEntry( varMap, varPlayer, varBagIdx )
	if GetItemIDByIndexInBag(varMap, varPlayer, varBagIdx) ~= x418708_g_ItemID then
		return
	end
	  
	-- 检测背包空间
	 if GetBagSpace(varMap,varPlayer) <= 0 then
		 Msg2Player( varMap,varPlayer, "背包空间已满,无法使用物品", 8, 2)
		 Msg2Player( varMap,varPlayer, "背包空间已满,无法使用物品", 8, 3)
		 return
	 end
	local bCplay =  DelItemByIndexInBag(varMap, varPlayer, varBagIdx, 1)
	if bCplay == 1 then
		local itemid = 100000
		local ranmoney =random(1,20000)
		local itemgailv = {
		{item =12030056, posibable = 667  },
		{item =12030057, posibable = 1000 },
		{item =12030058, posibable = 1133 },
		{item =12030016, posibable = 1266 },
		{item =12030017, posibable = 1599 },
		{item =12030013, posibable = 1932 },
		{item =12030014, posibable = 2265 },
		{item =11000300, posibable = 2280 },
		{item =11000304, posibable = 2287 },
		{item =11000501, posibable = 2620 },
		{item =11000360, posibable = 2953 },
		{item =11000902, posibable = 3286 },
		{item =11000207, posibable = 4032 },
		{item =12030018, posibable = 4778 },
		{item =12041103, posibable = 5524 },
		{item =12030201, posibable = 6270 },
		{item =12030213, posibable = 7016 },
		{item =12030217, posibable = 7762 },
		{item =12030043, posibable = 8508 },
		{item =12010203, posibable = 9254 },
		{item =12010204, posibable = 10000},  
		{item =-1, posibable = 20000},                            
		}
		local tempmark = getn(itemgailv)
		for k,v in itemgailv do
			if ranmoney < v.posibable then
				tempmark = k
				break
			end
		end
		itemid = itemgailv[tempmark].item

		 if itemid == -1 then
		 		Msg2Player(varMap,varPlayer,format("打开赛马大竞猜安慰包，很遗憾你什么都没获得"),4,3)
		 else
			 StartItemTask(varMap)
	     ItemAppendBind( varMap, itemid, 1 )	
			 
			 local ret = StopItemTask(varMap,varPlayer)
		   if ret > 0 then 
		   DeliverItemListSendToPlayer(varMap,varPlayer)	
		   local name =GetName(varMap,varPlayer)
		   if itemid == 11000300  then
		   	LuaAllScenceM2Wrold( varMap,"恭喜玩家"..name.."打开赛马大竞猜安慰包，获得#G灵魂印", 5, 1 )
		   	elseif  itemid ==11000304 then
		 	   	LuaAllScenceM2Wrold( varMap,"恭喜玩家"..name.."打开赛马大竞猜安慰包，获得残破的#G神兵之魂", 5, 1 )
		   	end
			--GamePlayScriptLog( varMap, varPlayer, 3070+tempmark)
			 Msg2Player(varMap,varPlayer,format("打开赛马大竞猜安慰包，你获得了@item_%d", itemid),4,3)
			end
		end
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"使用物品异常！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end	
end






function x418708_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0; 
end






function x418708_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418708_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418708_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418708_ProcActivateOnce( varMap, varPlayer, varImpact )


	
	


	

end







function x418708_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
