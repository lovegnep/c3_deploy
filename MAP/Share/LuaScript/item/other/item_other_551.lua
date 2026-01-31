





x418551_var_FileId 		= 418551 

x418551_var_LevelMin		=	1

x418551_g_ItemID =12250022




function x418551_ProcEventEntry( varMap, varPlayer, varBagIdx )
	if GetItemIDByIndexInBag(varMap, varPlayer, varBagIdx) ~= x418551_g_ItemID then
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
		local ranmoney =random(1,142)
		local itemgailv = {
		{item =12030016, posibable = 20  },
		{item =11990050, posibable = 28  },
		{item =11000501, posibable = 48  },
		{item =12041103, posibable = 53  },
		{item =12035257, posibable = 58  },
		{item =11990015, posibable = 62  },
		{item =12030013, posibable = 72  },
		{item =12041044, posibable = 112 },
		{item =12054300, posibable = 132 }, 
  	{item =11970022, posibable = 142 },                             
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
		 Msg2Player(varMap,varPlayer,format("打开白银贵族礼包，你获得了@item_%d", itemid),4,3)
		end
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"使用物品异常！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end	
end






function x418551_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0; 
end






function x418551_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418551_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418551_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418551_ProcActivateOnce( varMap, varPlayer, varImpact )


	
	


	

end







function x418551_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
