x310914_var_FileId          = 310914
x310914_var_MinLevel          = 40
x310914_var_FeastId						= 9
x310914_var_MD_DayCount1				    = MD_GARDEN_DAY1
x310914_var_RandomItemTable0   = {
                               { varItem = 12030043, probability = 2450, itemName = "千里镜",varNum = 3 }, 
                               { varItem = 12030013, probability = 2450, itemName = "芝华士",varNum = 2 }, 
                               { varItem = 12041101, probability = 2450, itemName = "修行草" ,varNum = 2 }, 
                               { varItem = 12110206, probability = 2450, itemName = "钟情一生" ,varNum = 2 }, 
                               { varItem = 12110207, probability = 2450, itemName = "爱无止境",varNum = 1 }, 
                               { varItem = 11990011, probability = 2450, itemName = "三番令",varNum = 1 }, 
                               { varItem = 12030405, probability = 1276, itemName = "活力特惠包",varNum = 1 },
                               { varItem = 11010001, probability = 1000, itemName = "一级皇家秘银",varNum = 1 },
                               { varItem = 11000902, probability = 1000, itemName = "高级洗石剂",varNum = 1  },
                               { varItem = 11990110, probability = 1000, itemName = "募集卷",varNum = 1  },
                               { varItem = 12054300, probability = 1000, itemName = "还童书",varNum = 1  }, 
                               { varItem = 11000300, probability = 19, itemName = "灵魂印",varNum = 1  }, 
                               { varItem = 12250002, probability = 4, itemName = "精品芝华士",varNum = 1  },
                               { varItem = 11000702, probability = 1, itemName = "神天琉璃",varNum = 1  },
                               }             
x310914_var_RandomItemTable1   = {
															 { varItem = 12030043, probability = 2450, itemName = "千里镜",varNum = 3 },
                               { varItem = 12030013, probability = 2450, itemName = "芝华士",varNum = 2 }, 
                               { varItem = 12110206, probability = 2450, itemName = "钟情一生" ,varNum = 2 }, 
                               { varItem = 12110207, probability = 2450, itemName = "爱无止境",varNum = 1  }, 
                               { varItem = 12041101, probability = 2450, itemName = "修行草" ,varNum = 2 },
                               { varItem = 12041102, probability = 2450, itemName = "天赋丹",varNum = 2  },
                               { varItem = 12030405, probability = 1276, itemName = "活力特惠包",varNum = 1 },
                               { varItem = 12034000, probability = 1000, itemName = "固本丹",varNum = 1  }, 
                               { varItem = 12030218, probability = 1000, itemName = "强效练功人偶",varNum = 3  },
                               { varItem = 12054301, probability = 1000, itemName = "还龙书",varNum = 1  }, 
                               { varItem = 11000551, probability = 1000, itemName = "无瑕星辰",varNum = 2  },
                               { varItem = 11000300, probability = 19, itemName = "灵魂印",varNum = 1  }, 
                               { varItem = 12250002, probability = 4, itemName = "精品芝华士",varNum = 1  }, 
                               { varItem = 12050275, probability = 1, itemName = "冰魄冥虎降世符",varNum = 1  },
}
x310914_var_MaxTimes          = 1


function x310914_IsFeastActive() 
	local day = GetDayOfYear()
	if day < 62 or day > 69 or x310914_var_FeastId ~= MD_CURRENT_FEAST_ID then
				return 0
	end
	return 1
end

function x310914_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest)

		
		if x310914_IsFeastActive() ~= 1 then
				return
		end

    local lv = GetLevel( varMap, varPlayer)
    if lv < x310914_var_MinLevel then
        return
    end

    local day = GetDayOfYear()
    if day >= 62 and day <= 69 then
        TalkAppendButton( varMap, x310914_var_FileId, "【首映式】资料片特典大礼", 3, 1)
    end
end

function x310914_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest, indexId)

		if x310914_IsFeastActive() ~= 1 then
        Msg2Player( varMap, varPlayer, "活动没有开启", 8, 3)
        return
    end

    StartTalkTask( varMap)
        TalkAppendString( varMap, "#Y【首映式】资料片特典大礼" )
        TalkAppendString( varMap, "\t为了感恩广大玩家对《成吉思汗3 恶狼传说》的鼎力支持，在此新春伊始，#R3月4日至3月11日八天，每天晚上20：00-20：30#W，所有#G40级#W以上的玩家都可以领取一份#G线上礼物#W。\n\t您确定要领取今天的礼物吗？" )
    StopTalkTask()
    DeliverTalkInfo( varMap, varPlayer, varTalknpc, x310914_var_FileId, -1)
end

function x310914_ProcAcceptCheck( varMap, varPlayer, varTalknpc)

		if x310914_IsFeastActive() ~= 1 then
        Msg2Player( varMap, varPlayer, "活动没有开启", 8, 3)
        return
    end

    LuaCallNoclosure(888894,"Feast_SetCurrentId",varMap,varPlayer,x310914_var_FeastId)

    local minute = GetMinOfDay()
    local active = nil
    local varToday = GetDayOfYear()
    if varToday < 62 or varToday > 69 then
    	return
    end
    if minute >= 1200 and minute < 1230 then
    	if GetPlayerGameData( varMap, varPlayer, x310914_var_MD_DayCount1[ 1], x310914_var_MD_DayCount1[ 2], x310914_var_MD_DayCount1[ 3] ) ~= varToday then
    	    active = x310914_var_MD_DayCount1
    	else
	        Msg2Player( varMap, varPlayer, "您今天的礼物已经领取过了", 8, 3)
	        return
    	end

    else
        Msg2Player( varMap, varPlayer, "很抱歉，本活动开放时间为#R20：00至20：30#cffcf00", 8, 3)
        return
    end

    if GetBagSpace( varMap, varPlayer) < 1 then
        Msg2Player( varMap, varPlayer, "背包空间不足，无法获得物品", 8, 3)
        return
    end
   
    if GetLevel( varMap, varPlayer) <80 then      

	  		  local rseed = random( 1, 20000)
	  		  local varIndex = 1
	  		  local dn = 1
	  		  local up = 1
	  		  for varI, item in x310914_var_RandomItemTable0 do
	  		      up = up + item.probability
	  		      if rseed >= dn and rseed < up then
	  		          varIndex = varI
	  		          break
	  		      end
	  		      dn = dn + item.probability
	  		  end

					
						AddMoney( varMap, varPlayer, 1, 150000) 
					
		  		  StartItemTask( varMap)
		  		  ItemAppendBind( varMap, x310914_var_RandomItemTable0[ varIndex ].varItem, x310914_var_RandomItemTable0[ varIndex ].varNum)

		    		if StopItemTask( varMap, varPlayer) == 0 then
		    		    Msg2Player( varMap, varPlayer, "添加物品失败", 8, 3)
		    		    return
		    		end
		    		
		    		if x310914_var_RandomItemTable0[ varIndex ].varItem ==12250002 then
		    			local varMsg = format( "恭喜#R%s#cffcc00在【首映式】资料片特典大礼活动中获得#G精品芝华士#cffcc00！", GetName( varMap, varPlayer) )
		    			LuaAllScenceM2Wrold (varMap , varMsg , 5, 1)
		    		end
		    			
		    		if x310914_var_RandomItemTable0[ varIndex ].varItem ==11000300 then
		    			local varMsg = format( "恭喜#R%s#cffcc00在【首映式】资料片特典大礼活动中获得#G灵魂印#cffcc00！", GetName( varMap, varPlayer) )
		    			LuaAllScenceM2Wrold (varMap , varMsg , 5, 1)
		    		end	
		    		
		    		if x310914_var_RandomItemTable0[ varIndex ].varItem ==11000702 then
		    			local varMsg = format( "恭喜#R%s#cffcc00在【首映式】资料片特典大礼活动中获得#G神天琉璃#cffcc00！", GetName( varMap, varPlayer) )
		    			LuaAllScenceM2Wrold (varMap , varMsg , 5, 1)
		    		end		
		    			
		    		Msg2Player( varMap, varPlayer, format("恭喜您获得了150两银卡和%d个#G@itemid_%d#cffcf00！",x310914_var_RandomItemTable0[ varIndex ].varNum,x310914_var_RandomItemTable0[ varIndex ].varItem), 8, 3) 
		    		DeliverItemListSendToPlayer( varMap, varPlayer)
		    	
		else
	  		  local rseed = random( 1, 20000)
	  		  local varIndex = 1
	  		  local dn = 1
	  		  local up = 1
	  		  for varI, item in x310914_var_RandomItemTable1 do
	  		      up = up + item.probability
	  		      if rseed >= dn and rseed < up then
	  		          varIndex = varI
	  		          break
	  		      end
	  		      dn = dn + item.probability
	  		  end
	  		  
	  		  
						AddMoney( varMap, varPlayer, 1, 150000) 
				
		  		  StartItemTask( varMap)
		  		  ItemAppendBind( varMap, x310914_var_RandomItemTable1[ varIndex ].varItem, x310914_var_RandomItemTable1[ varIndex ].varNum)

		    		if StopItemTask( varMap, varPlayer) == 0 then
		    		    Msg2Player( varMap, varPlayer, "添加物品失败", 8, 3)
		    		    return
		    		end
		    		
		    		if x310914_var_RandomItemTable1[ varIndex ].varItem ==12250002 then
		    			local varMsg = format( "恭喜#R%s#cffcc00在【首映式】资料片特典大礼活动中获得#G精品芝华士#cffcc00！", GetName( varMap, varPlayer) )
		    			LuaAllScenceM2Wrold (varMap , varMsg , 5, 1)
		    		end
		    			
		    		if x310914_var_RandomItemTable1[ varIndex ].varItem ==11000300 then
		    			local varMsg = format( "恭喜#R%s#cffcc00在【首映式】资料片特典大礼活动中获得#G灵魂印#cffcc00！", GetName( varMap, varPlayer) )
		    			LuaAllScenceM2Wrold (varMap , varMsg , 5, 1)
		    		end	
    			 
		    		if x310914_var_RandomItemTable1[ varIndex ].varItem ==12050275 then
		    			local varMsg = format( "恭喜#R%s#cffcc00在【首映式】资料片特典大礼活动中获得#G冰魄冥虎#cffcc00！", GetName( varMap, varPlayer) )
		    			LuaAllScenceM2Wrold (varMap , varMsg , 5, 1)
		    		end	
		    				    		
		    		Msg2Player( varMap, varPlayer, format("恭喜您获得了150两银卡和%d个#G@itemid_%d#cffcf00！",x310914_var_RandomItemTable1[ varIndex ].varNum,x310914_var_RandomItemTable1[ varIndex ].varItem), 8, 3)    
		    		DeliverItemListSendToPlayer( varMap, varPlayer)
		    	end	
    

    SetPlayerGameData( varMap, varPlayer, active[ 1], active[ 2], active[ 3], varToday)
end
