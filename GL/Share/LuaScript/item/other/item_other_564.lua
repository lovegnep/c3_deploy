--成吉思汗三上线礼包





x418564_var_FileId 		= 418564 

x418564_var_LevelMin		=	1

x418564_g_ItemID =12031038

x418564_g_DAYMD ={188, 0 , 9}
x418564_g_SECMD ={188, 9 ,20 }



function x418564_ProcEventEntry( varMap, varPlayer, varBagIdx )
		
  if x418564_Checktime( varMap, varPlayer) == 0 then
  	return 
  end	
  	
		local itemid = 100000
		local ranmoney =random(1,280)
		local itemgailv = {
		{item =12050290, posibable = 2  },
		{item =11010001, posibable = 8  },
		{item =11970021, posibable = 76 },
		{item =11990011, posibable = 80 },
		{item =11990015, posibable = 82 },
		{item =11990051, posibable = 86 },
		{item =11990100, posibable = 94 },
		{item =11990400, posibable = 95 },
		{item =12010200, posibable = 99 },
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
		{item =11000550, posibable = 172},		
		{item =12030031, posibable = 192},		
		{item =12030043, posibable = 193},		
		{item =12030044, posibable = 197},		
		{item =12030107, posibable = 198},		
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
		{item =12041101, posibable = 237},		
		{item =12041103, posibable = 239},		
		{item =12054300, posibable = 247},		
		{item =12054301, posibable = 271},		
		{item =12110206, posibable = 272},			
		{item =11000501, posibable = 280},	                            
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
		 Msg2Player(varMap,varPlayer,format("打开成吉思汗3 恶狼传说上线礼包，你获得了@item_%d", itemid),4,3)
		 if itemid == 12050290  then
				local varName = GetName(varMap,varPlayer)
				if varName == nil then
					varName = "Errorname"
				end
				local varMsg1 =format(varName.."打开成吉思汗3 恶狼传说上线礼包，获得了烈焰狮鹫降世符")
				LuaAllScenceM2Wrold(varMap, varMsg1, CHAT_MAIN_RIGHTDOWN, 1)
			end
		 GamePlayScriptLog( varMap, varPlayer, 5007)
		end
		

end






function x418564_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0; 
end






function x418564_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418564_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418564_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418564_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	return 1;
	

end







function x418564_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end












function x418564_Checktime( varMap, varPlayer)

	  
	 	local year,month,day1 =GetYearMonthDay()
	 	local bagindex = FindFirstBagIndexOfItem(varMap, varPlayer, x418564_g_ItemID)
	  if year ~=2012 then
		if DelItemByIndexInBag( varMap, varPlayer, bagindex, 1) == 1 then
			 Msg2Player(varMap,varPlayer,"感谢您参与成吉思汗3 恶狼传说冲级活动，本次活动已经结束，礼包已销毁",8,3)
			end
			return 0
		end
	
	  local day = GetDayOfYear()
 		if day >88 then
			if DelItemByIndexInBag( varMap, varPlayer, bagindex, 1) == 1 then
			 Msg2Player(varMap,varPlayer,"感谢您参与成吉思汗3 恶狼传说冲级活动，本次活动已经结束，礼包已销毁",8,3)
			end
			return 0
		end

  local hour, minute, sec = GetHourMinSec()
	  local temp =0 
	  if hour<20 or hour >=22 then	
	   Msg2Player(varMap,varPlayer,"很抱歉，只能在每天的20：00~22：00使用这个礼包",8,3)
	   return 0
	   elseif  (GetBagSpace(varMap,varPlayer)) <= 0  then
	 
		 Msg2Player( varMap,varPlayer, "背包空间已满,无法使用物品", 8, 2)
		 Msg2Player( varMap,varPlayer, "背包空间已满,无法使用物品", 8, 3)
		 return 0
	 
	  else --在时间内
	  	local secmd = hour*3600+minute*60 +sec
	  	local lastsec =GetPlayerGameData(varMap, varPlayer, x418564_g_SECMD[1], x418564_g_SECMD[2],x418564_g_SECMD[3] )
	  	local change =secmd -lastsec
	  	if  GetPlayerGameData(varMap, varPlayer, x418564_g_DAYMD[1], x418564_g_DAYMD[2],x418564_g_DAYMD[3] )  == day then --同一天
	  		if change >300 then
		  		SetPlayerGameData(varMap, varPlayer, x418564_g_DAYMD[1], x418564_g_DAYMD[2], x418564_g_DAYMD[3], day)
		  		SetPlayerGameData(varMap, varPlayer, x418564_g_SECMD[1], x418564_g_SECMD[2], x418564_g_SECMD[3], secmd)
		  		return 1	  			
	  		else 
				 Msg2Player( varMap,varPlayer, "请于"..300-change.."秒后再使用", 8, 3)	  			
	  			return 0
	  		end
	  	end
	  	
 
	  		SetPlayerGameData(varMap, varPlayer, x418564_g_DAYMD[1], x418564_g_DAYMD[2], x418564_g_DAYMD[3], day)
	  		SetPlayerGameData(varMap, varPlayer, x418564_g_SECMD[1], x418564_g_SECMD[2], x418564_g_SECMD[3], secmd)
	  		return 1
 
	  
	  

	  end
	  
end	  
