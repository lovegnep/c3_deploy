


x310911_var_FileId          = 310911

x310911_var_MinLevel          = 40


x310911_var_FeastId						= 6
x310911_var_MD_DayCount1				    = MD_GANENJIE_DAY1



x310911_var_RandomItemTable0   = {
                               { varItem = 12030013, probability = 160, itemName = "芝华士",varNum = 2 }, 
                               { varItem = 12041101, probability = 160, itemName = "修行草" ,varNum = 2 }, 
                               { varItem = 12110206, probability = 160, itemName = "钟情一生" ,varNum = 2 }, 
                               { varItem = 12110207, probability = 160, itemName = "爱无止境",varNum = 1  }, 
                               { varItem = 12034000, probability = 70, itemName = "固本丹",varNum = 1  }, 
                               { varItem = 12041103, probability = 77, itemName = "活力丹",varNum = 5  }, 
                               { varItem = 11990110, probability = 70, itemName = "募集卷",varNum = 1  },
                               { varItem = 12030211, probability = 70, itemName = "师恩难谢",varNum = 1  }, 
                               { varItem = 12054300, probability = 70, itemName = "还童书",varNum = 1  }, 
                               { varItem = 12250002, probability = 2, itemName = "精品芝华士",varNum = 1  }, 
                               { varItem = 11000300, probability = 1, itemName = "灵魂印",varNum = 1  }, 
}


x310911_var_RandomItemTable1   = {
                               { varItem = 12030013, probability = 1600, itemName = "芝华士",varNum = 2 }, 
                               { varItem = 12110206, probability = 1600, itemName = "钟情一生" ,varNum = 2 }, 
                               { varItem = 12110207, probability = 1600, itemName = "爱无止境",varNum = 1  }, 
                               { varItem = 12041101, probability = 1600, itemName = "修行草" ,varNum = 2 },
                               { varItem = 12034000, probability = 700, itemName = "固本丹",varNum = 1  }, 
                               { varItem = 12041103, probability = 770, itemName = "活力丹",varNum = 5  },
                               { varItem = 12030217, probability = 700, itemName = "练功人偶",varNum = 4  },
                               { varItem = 12054300, probability = 700, itemName = "还童书",varNum = 1  }, 
                               { varItem = 11000551, probability = 700, itemName = "无瑕星辰",varNum = 2  },
                               { varItem = 12250002, probability = 20, itemName = "精品芝华士",varNum = 1  }, 
                               { varItem = 11000300, probability = 10, itemName = "灵魂印",varNum = 1  }, 
}










x310911_var_MaxTimes          = 1


function x310911_IsFeastActive()
    local day = GetDayOfYear()
	if day < 326 or day > 328 or x310911_var_FeastId ~= MD_CURRENT_FEAST_ID then
				return 0
	end
	return 1
end

function x310911_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest)

		
		if x310911_IsFeastActive() ~= 1 then
				return
		end

    local lv = GetLevel( varMap, varPlayer)
    if lv < x310911_var_MinLevel then
        return
    end

    local day = GetDayOfYear()
    if day >= 326 and day <= 328 then
        TalkAppendButton( varMap, x310911_var_FileId, "【感恩节】线上领奖", 3, 1)
    end
end

function x310911_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest, indexId)

		if x310911_IsFeastActive() ~= 1 then
        Msg2Player( varMap, varPlayer, "活动没有开启", 8, 3)
        return
    end

    StartTalkTask( varMap)
        TalkAppendString( varMap, "#Y【感恩节】线上领奖" )
        TalkAppendString( varMap, "\t为了感恩广大玩家对《成吉思汗3 恶狼传说》的鼎力支持，#R从11月23日至11月25日，每天晚上20：00-20：30#W，所有#G40级#W以上的玩家都可以领取一份#G感恩节礼物#W。\n\t您确定要领取感恩节礼物吗？" )
    StopTalkTask()
    DeliverTalkInfo( varMap, varPlayer, varTalknpc, x310911_var_FileId, -1)
end

function x310911_ProcAcceptCheck( varMap, varPlayer, varTalknpc)

		if x310911_IsFeastActive() ~= 1 then
        Msg2Player( varMap, varPlayer, "活动没有开启", 8, 3)
        return
    end
    
    
    LuaCallNoclosure(888894,"Feast_SetCurrentId",varMap,varPlayer,x310911_var_FeastId)

    local minute = GetMinOfDay()
    local active = nil
    local varToday = GetDayOfYear()
    if varToday < 326 or varToday > 328 then
    	return
    end
    if minute >= 1200 and minute < 1230 then
    	if GetPlayerGameData( varMap, varPlayer, x310911_var_MD_DayCount1[ 1], x310911_var_MD_DayCount1[ 2], x310911_var_MD_DayCount1[ 3] ) ~= varToday then
    	    active = x310911_var_MD_DayCount1
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
	  		  for varI, item in x310911_var_RandomItemTable0 do
	  		      up = up + item.probability
	  		      if rseed >= dn and rseed < up then
	  		          varIndex = varI
	  		          break
	  		      end
	  		      dn = dn + item.probability
	  		  end
	  		  
	  		  ItemAppendBind( varMap, x310911_var_RandomItemTable0[ varIndex ].varItem, x310911_var_RandomItemTable0[ varIndex ].varNum)
	  		  
	  		  
	  		  
	  		  
	  		  
	  		  
	  		  ItemAppendBind( varMap, 12030043, 3)
    		
    		if StopItemTask( varMap, varPlayer) == 0 then
    		    Msg2Player( varMap, varPlayer, "添加物品失败", 8, 3)
    		    return
    		end
    		
    		if x310911_var_RandomItemTable0[ varIndex ].varItem ==12250002 then
    			local varMsg = format( "恭喜#R%s#cffcc00在感恩节线上领奖活动中，获得#G精品芝华士#cffcc00！", GetName( varMap, varPlayer) )
    			LuaAllScenceM2Wrold (varMap , varMsg , 5, 1)
    		end
    			
    		if x310911_var_RandomItemTable0[ varIndex ].varItem ==11000300 then
    			local varMsg = format( "恭喜#R%s#cffcc00在感恩节线上领奖活动中，获得#G灵魂印#cffcc00！", GetName( varMap, varPlayer) )
    			LuaAllScenceM2Wrold (varMap , varMsg , 5, 1)
    		end	
    			
    		Msg2Player( varMap, varPlayer, "恭喜您获得了感恩节礼物！", 8, 3)    
    		DeliverItemListSendToPlayer( varMap, varPlayer)
    		
		else
    		StartItemTask( varMap)
    			
    			
	  		  local rseed = random( 1, 10000)
	  		  local varIndex = 1
	  		  local dn = 1
	  		  local up = 1
	  		  for varI, item in x310911_var_RandomItemTable1 do
	  		      up = up + item.probability
	  		      if rseed >= dn and rseed < up then
	  		          varIndex = varI
	  		          break
	  		      end
	  		      dn = dn + item.probability
	  		  end
	  		  
	  		  ItemAppendBind( varMap, x310911_var_RandomItemTable1[ varIndex ].varItem, x310911_var_RandomItemTable1[ varIndex ].varNum)
	  		  
	  		  
	  		  
	  		  
	  		  
	  		  ItemAppendBind( varMap, 12030043, 3)
    		
    		if StopItemTask( varMap, varPlayer) == 0 then
    		    Msg2Player( varMap, varPlayer, "添加物品失败", 8, 3)
    		    return
    		end
    		
    		if x310911_var_RandomItemTable1[ varIndex ].varItem ==12250002 then
    			local varMsg = format( "恭喜#R%s#cffcc00在感恩节线上领奖活动中，获得#G精品芝华士#cffcc00！", GetName( varMap, varPlayer) )
    			LuaAllScenceM2Wrold (varMap , varMsg , 5, 1)
    		end
    			
    		if x310911_var_RandomItemTable1[ varIndex ].varItem ==11000300 then
    			local varMsg = format( "恭喜#R%s#cffcc00在感恩节线上领奖活动中，获得#G灵魂印#cffcc00！", GetName( varMap, varPlayer) )
    			LuaAllScenceM2Wrold (varMap , varMsg , 5, 1)
    		end	
    			 
    		
    		Msg2Player( varMap, varPlayer, "恭喜您获得了感恩节礼物！", 8, 3)    
    		DeliverItemListSendToPlayer( varMap, varPlayer)
    end
    					

















    SetPlayerGameData( varMap, varPlayer, active[ 1], active[ 2], active[ 3], varToday)
end
