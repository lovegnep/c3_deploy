





x418524_var_FileId 		= 418524 

x418524_var_LevelMin		=	1

x418524_g_ItemID =12030887




function x418524_ProcEventEntry( varMap, varPlayer, varBagIdx )
	if GetItemIDByIndexInBag(varMap, varPlayer, varBagIdx) ~= x418524_g_ItemID then
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
		local ranmoney =random(1,254)
		local itemgailv = {
		{item =11010001, posibable = 8  },
		{item =12010200, posibable = 76 },
		{item =11990015, posibable = 80 },
		{item =11990011, posibable = 82 },
		{item =11990051, posibable = 86 },
		{item =11990100, posibable = 94 },
		{item =11000800, posibable = 95 },
		{item =11990400, posibable = 99 },
		{item =12010201, posibable = 103},
		{item =12010202, posibable = 107},
		{item =12010203, posibable = 111},
		{item =12010204, posibable = 115},
		{item =12030011, posibable = 116},
		{item =12030012, posibable = 118},
		{item =12030013, posibable = 122},
		{item =12030014, posibable = 130},
		{item =12030016, posibable = 138},
		{item =12030017, posibable = 146},
		{item =12030018, posibable = 154},
		{item =12030022, posibable = 158},
		{item =12030023, posibable = 162},
		{item =12030024, posibable = 166},		
		{item =12030025, posibable = 170},		
		{item =11060001, posibable = 172},		
		{item =12030043, posibable = 192},		
		{item =12031037, posibable = 193},		
		{item =12030107, posibable = 197},		
		{item =12030044, posibable = 198},		
		{item =12030201, posibable = 200},		
		{item =12030213, posibable = 204},		
		{item =12041060, posibable = 205},		
		{item =12041061, posibable = 207},		
		{item =12041062, posibable = 211},		
		{item =12041070, posibable = 212},		
		{item =12041071, posibable = 214},		
		{item =12041072, posibable = 218},		
		{item =12041080, posibable = 219},		
		{item =12041081, posibable = 221},		
		{item =12041082, posibable = 225},		
		{item =12041097, posibable = 229},		
		{item =12041099, posibable = 233},		
		{item =12041103, posibable = 237},		
		{item =12041101, posibable = 239},		
		{item =12054300, posibable = 247},		
		{item =11000902, posibable = 250},		
		{item =12110206, posibable = 252},			
		{item =11000501, posibable = 254},	                            
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
		 Msg2Player(varMap,varPlayer,format("打开前辈的馈赠，你获得了@item_%d", itemid),4,3)
		end
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"使用物品异常！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end	
end






function x418524_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0; 
end






function x418524_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418524_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418524_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418524_ProcActivateOnce( varMap, varPlayer, varImpact )


	
	


	

end







function x418524_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
