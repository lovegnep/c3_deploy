





x418552_var_FileId 		= 418552 

x418552_var_LevelMin		=	1

x418552_g_ItemID =12250023




function x418552_ProcEventEntry( varMap, varPlayer, varBagIdx )
	if GetItemIDByIndexInBag(varMap, varPlayer, varBagIdx) ~= x418552_g_ItemID then
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
		local ranmoney =random(1,222)
		local itemgailv = {
		{item =12030016, posibable = 20  },
		{item =11990050, posibable = 28  },
		{item =11000501, posibable = 48  },
		{item =12041103, posibable = 53  },
		{item =12035257, posibable = 58  },
		{item =11990015, posibable = 62  },
		{item =12030013, posibable = 72  },
		{item =12030014, posibable = 92  },
		{item =12030017, posibable = 112 },
		{item =12041044, posibable = 152 },
		{item =12054300, posibable = 172 },
		{item =11970023, posibable = 222 },                              
		}
		local tempmark = getn(itemgailv)
		for k,v in itemgailv do
			if ranmoney < v.posibable then
				tempmark = k
				break
			end
		end
		itemid = itemgailv[tempmark].item

		 
		 StartItemTask(varMap)
     ItemAppendBind( varMap, itemid, 1 )	
		 
		 local ret = StopItemTask(varMap,varPlayer)
	   if ret > 0 then 
	   DeliverItemListSendToPlayer(varMap,varPlayer)	
		--GamePlayScriptLog( varMap, varPlayer, 3070+tempmark)
		 Msg2Player(varMap,varPlayer,format("打开黄金贵族礼包，你获得了@item_%d", itemid),4,3)
		end
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"使用物品异常！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end	
end






function x418552_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0; 
end






function x418552_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418552_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418552_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418552_ProcActivateOnce( varMap, varPlayer, varImpact )


	
	


	

end







function x418552_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
