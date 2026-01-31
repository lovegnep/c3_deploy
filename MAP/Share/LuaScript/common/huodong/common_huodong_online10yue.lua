


x310910_var_FileId          = 310910

x310910_var_MinLevel          = 40


x310910_var_FeastId						= 5
x310910_var_MD_DayCount1				    = MD_JINLINGJIANG_DAY1



x310910_var_RandomItemTable0   = {
                               { varItem = 12030013, probability = 140, itemName = "芝华士",varNum = 2 }, 
                               { varItem = 12041101, probability = 140, itemName = "修行草" ,varNum = 2 }, 
                               { varItem = 12110206, probability = 140, itemName = "钟情一生" ,varNum = 2 }, 
                               { varItem = 12110207, probability = 140, itemName = "爱无止境",varNum = 1  }, 
                               { varItem = 11990050, probability = 85, itemName = "回魂丹",varNum = 3  }, 
                               { varItem = 12041103, probability = 85, itemName = "活力丹",varNum = 5  }, 
                               { varItem = 11990011, probability = 84, itemName = "三番令",varNum = 2  },
                               { varItem = 11000501, probability = 85, itemName = "紫檀木炭",varNum = 5  }, 
                               { varItem = 12054300, probability = 85, itemName = "还童书",varNum = 1  }, 
                               { varItem = 12250002, probability = 10, itemName = "精品芝华士",varNum = 1  }, 
                               { varItem = 11000300, probability = 5, itemName = "灵魂印",varNum = 1  }, 
                               { varItem = 12050258, probability = 1, itemName = "浣熊降世符",varNum = 1  }
}


x310910_var_RandomItemTable1   = {
                               { varItem = 12030013, probability = 1200, itemName = "芝华士",varNum = 2 }, 
                               { varItem = 12110206, probability = 1200, itemName = "钟情一生" ,varNum = 2 }, 
                               { varItem = 12110207, probability = 1200, itemName = "爱无止境",varNum = 1  }, 
                               { varItem = 11000598, probability = 750, itemName = "五彩石",varNum = 1  }, 
                               { varItem = 11000597, probability = 750, itemName = "金龙印",varNum = 1  },
                               { varItem = 12041108, probability = 900, itemName = "荣誉之星",varNum = 1  }, 
                               { varItem = 11010121, probability = 750, itemName = "七彩墨",varNum = 1  }, 
                               { varItem = 12041102, probability = 750, itemName = "天赋丹",varNum = 1  }, 
                               { varItem = 12260001, probability = 900, itemName = "美容秘方",varNum = 1  }, 
                               { varItem = 11000550, probability = 750, itemName = "微瑕星辰",varNum = 2  },
                               { varItem = 11010111, probability = 699, itemName = "一级平衡之书",varNum = 1  }, 
                               { varItem = 12250002, probability = 100, itemName = "精品芝华士",varNum = 1  }, 
                               { varItem = 11000300, probability = 50, itemName = "灵魂印",varNum = 1  }, 
                               { varItem = 12050260, probability = 1, itemName = "熊猫降世符",varNum = 1  }
}










x310910_var_MaxTimes          = 1


function x310910_IsFeastActive()
    local day = GetDayOfYear()
	if day < 298 or day > 300 or x310910_var_FeastId ~= MD_CURRENT_FEAST_ID then
				return 0
	end
	return 1
end

function x310910_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest)

		
		if x310910_IsFeastActive() ~= 1 then
				return
		end

    local lv = GetLevel( varMap, varPlayer)
    if lv < x310910_var_MinLevel then
        return
    end

    local day = GetDayOfYear()
    if day >= 298 and day <= 300 then
        TalkAppendButton( varMap, x310910_var_FileId, "【线上领奖】感恩金翎", 3, 1)
    end
end

function x310910_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest, indexId)

		if x310910_IsFeastActive() ~= 1 then
        Msg2Player( varMap, varPlayer, "活动没有开启", 8, 3)
        return
    end

    StartTalkTask( varMap)
        TalkAppendString( varMap, "#Y【线上领奖】感恩金翎" )
        TalkAppendString( varMap, "\t值此金秋收获的季节，《成吉思汗3 恶狼传说》喜获#G金翎奖#W大奖。\n\t为了回馈广大玩家对《成吉思汗3 恶狼传说》的鼎力支持，#R从10月26日至10月28日，每天晚上20：00-20：30#W，所有#G40级#W以上的玩家都可以领取一份#G感恩礼物#W。\n\t您确定要领取感恩金翎礼物吗？" )
    StopTalkTask()
    DeliverTalkInfo( varMap, varPlayer, varTalknpc, x310910_var_FileId, -1)
end

function x310910_ProcAcceptCheck( varMap, varPlayer, varTalknpc)

		if x310910_IsFeastActive() ~= 1 then
        Msg2Player( varMap, varPlayer, "活动没有开启", 8, 3)
        return
    end
    
    
    LuaCallNoclosure(888894,"Feast_SetCurrentId",varMap,varPlayer,x310910_var_FeastId)

    local minute = GetMinOfDay()
    local active = nil
    local varToday = GetDayOfYear()
    if varToday < 298 or varToday > 300 then
    	return
    end
    if minute >= 1200 and minute < 1230 then
    	if GetPlayerGameData( varMap, varPlayer, x310910_var_MD_DayCount1[ 1], x310910_var_MD_DayCount1[ 2], x310910_var_MD_DayCount1[ 3] ) ~= varToday then
    	    active = x310910_var_MD_DayCount1
    	else
	        Msg2Player( varMap, varPlayer, "您今天的礼物已经领取过了", 8, 3)
	        return
    	end

    
    
    
    
	  
	  
    
    else
        Msg2Player( varMap, varPlayer, "很抱歉，本活动开放时间为#R20：00至20：30#cffcf00", 8, 3)
        return
    end

    if GetBagSpace( varMap, varPlayer) < 2 then
        Msg2Player( varMap, varPlayer, format( "背包空间不足2个，无法获得物品", 1), 8, 3)
        return
    end
          
    AddMoney( varMap, varPlayer, 1, 150000) 
          
    if GetLevel( varMap, varPlayer) <80 then      
    		
    		StartItemTask( varMap)
    			
    			
	  		  local rseed = random( 1, 1000)
	  		  local varIndex = 1
	  		  local dn = 1
	  		  local up = 1
	  		  for varI, item in x310910_var_RandomItemTable0 do
	  		      up = up + item.probability
	  		      if rseed >= dn and rseed < up then
	  		          varIndex = varI
	  		          break
	  		      end
	  		      dn = dn + item.probability
	  		  end
	  		  
	  		  ItemAppendBind( varMap, x310910_var_RandomItemTable0[ varIndex ].varItem, x310910_var_RandomItemTable0[ varIndex ].varNum)
	  		  
	  		  
	  		  
	  		  
	  		  
	  		  
	  		  ItemAppendBind( varMap, 12031002, 3)
    		
    		if StopItemTask( varMap, varPlayer) == 0 then
    		    Msg2Player( varMap, varPlayer, "添加物品失败", 8, 3)
    		    return
    		end
    		
    		if x310910_var_RandomItemTable0[ varIndex ].varItem ==12250002 then
    			local varMsg = format( "恭喜#R%s#cffcc00在感恩金翎领奖活动中，获得#G精品芝华士#cffcc00！", GetName( varMap, varPlayer) )
    			LuaAllScenceM2Wrold (varMap , varMsg , 5, 1)
    		end
    			
    		if x310910_var_RandomItemTable0[ varIndex ].varItem ==11000300 then
    			local varMsg = format( "恭喜#R%s#cffcc00在感恩金翎领奖活动中，获得#G灵魂印#cffcc00！", GetName( varMap, varPlayer) )
    			LuaAllScenceM2Wrold (varMap , varMsg , 5, 1)
    		end	
    			
    		if x310910_var_RandomItemTable0[ varIndex ].varItem ==12050258 then
    			local varMsg = format( "恭喜#R%s#cffcc00在感恩金翎领奖活动中，获得#G浣熊降世符#cffcc00！", GetName( varMap, varPlayer) )
    			LuaAllScenceM2Wrold (varMap , varMsg , 5, 1)
    		end	    			
    			
    		Msg2Player( varMap, varPlayer, "恭喜您获得了感恩金翎礼物！", 8, 3)    
    		DeliverItemListSendToPlayer( varMap, varPlayer)
    		
		else
    		StartItemTask( varMap)
    			
    			
	  		  local rseed = random( 1, 10000)
	  		  local varIndex = 1
	  		  local dn = 1
	  		  local up = 1
	  		  for varI, item in x310910_var_RandomItemTable1 do
	  		      up = up + item.probability
	  		      if rseed >= dn and rseed < up then
	  		          varIndex = varI
	  		          break
	  		      end
	  		      dn = dn + item.probability
	  		  end
	  		  
	  		  ItemAppendBind( varMap, x310910_var_RandomItemTable1[ varIndex ].varItem, x310910_var_RandomItemTable1[ varIndex ].varNum)
	  		  
	  		  
	  		  
	  		  
	  		  
	  		  ItemAppendBind( varMap, 12031002, 3)
    		
    		if StopItemTask( varMap, varPlayer) == 0 then
    		    Msg2Player( varMap, varPlayer, "添加物品失败", 8, 3)
    		    return
    		end
    		
    		if x310910_var_RandomItemTable1[ varIndex ].varItem ==12250002 then
    			local varMsg = format( "恭喜#R%s#cffcc00在感恩金翎领奖活动中，获得#G精品芝华士#cffcc00！", GetName( varMap, varPlayer) )
    			LuaAllScenceM2Wrold (varMap , varMsg , 5, 1)
    		end
    			
    		if x310910_var_RandomItemTable1[ varIndex ].varItem ==11000300 then
    			local varMsg = format( "恭喜#R%s#cffcc00在感恩金翎领奖活动中，获得#G灵魂印#cffcc00！", GetName( varMap, varPlayer) )
    			LuaAllScenceM2Wrold (varMap , varMsg , 5, 1)
    		end	
    			
    		if x310910_var_RandomItemTable1[ varIndex ].varItem ==12050260 then
    			local varMsg = format( "恭喜#R%s#cffcc00在感恩金翎领奖活动中，获得#G熊猫降世符#cffcc00！", GetName( varMap, varPlayer) )
    			LuaAllScenceM2Wrold (varMap , varMsg , 5, 1)
    		end	  
    		
    		Msg2Player( varMap, varPlayer, "恭喜您获得了感恩金翎礼物！", 8, 3)    
    		DeliverItemListSendToPlayer( varMap, varPlayer)
    end
    					

















    SetPlayerGameData( varMap, varPlayer, active[ 1], active[ 2], active[ 3], varToday)
end
