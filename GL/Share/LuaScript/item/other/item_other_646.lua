





x418646_var_FileId 		= 418646 

x418646_var_LevelMin		=	1

x418646_g_ItemID =12271321




function x418646_ProcEventEntry( varMap, varPlayer, varBagIdx )
	if GetItemIDByIndexInBag(varMap, varPlayer, varBagIdx) ~= x418646_g_ItemID then
		return
	end
	  
	-- 检测背包空间
	 if GetBagSpace(varMap,varPlayer) <= 0 then
		 Msg2Player( varMap,varPlayer, "背包剩余空间不足！", 8, 2)
		 Msg2Player( varMap,varPlayer, "背包剩余空间不足！", 8, 3)
		 return
	 end
	local bCplay =  DelItemByIndexInBag(varMap, varPlayer, varBagIdx, 1)
	if bCplay == 1 then
		local itemid = 100000
		local ranmoney =random(1,100)
		local itemgailv = {
				{item =	11010001,	posibable =7}, 						
				{item =	11990015,	posibable =14 }, 												
				{item =	11990051,	posibable =15 }, 						
				{item =	12030011,	posibable =16 }, 						
				{item =	12030012,	posibable =18 }, 						
				{item =	12030013,	posibable =22 }, 						
				{item =	12030014,	posibable =29 }, 						
				{item =	12030016,	posibable =36 }, 						
				{item =	12030017,	posibable =43 }, 						
				{item =	12030022,	posibable =46 }, 						
				{item =	12030023,	posibable =49 }, 						
				{item =	12030024,	posibable =52 }, 						
				{item =	12030025,	posibable =56 }, 												
				{item =	12031037,	posibable =58 }, 						
				{item =	12030107,	posibable =59 }, 						
				{item =	12030094,	posibable =61 }, 						
				{item =	12030201,	posibable =63 }, 						
				{item =	12041061,	posibable =64 }, 						
				{item =	12041062,	posibable =66 }, 						
				{item =	12041071,	posibable =67 }, 						
				{item =	12041072,	posibable =69 }, 						
				{item =	12041081,	posibable =70 }, 						
				{item =	12041082,	posibable =72 }, 						
				{item =	12041097,	posibable =73 }, 						
				{item =	12041099,	posibable =74 }, 						
				{item =	12041103,	posibable =75 }, 						
				{item =	12041101,	posibable =79 }, 						
				{item =	12054300,	posibable =86 }, 						
				{item =	11000902,	posibable =93 }, 						
				{item =	11000501,	posibable =100}, 					                             
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
		 Msg2Player(varMap,varPlayer,format("您打开好运礼盒获得了@item_%d", itemid),4,3)
		end
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"使用物品异常！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end	
end






function x418646_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0; 
end






function x418646_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418646_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418646_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418646_ProcActivateOnce( varMap, varPlayer, varImpact )


	
	


	

end







function x418646_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
