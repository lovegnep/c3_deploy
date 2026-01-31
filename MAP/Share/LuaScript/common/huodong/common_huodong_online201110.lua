x310916_var_FileId          = 310916
x310916_var_MinLevel          = 40
x310916_var_FeastId						= 11
x310916_var_MD_DayCount1				    = MD_HANGHAI_DAY1
x310916_var_MD_DayCount2				    = MD_HANGHAI_DAY2
x310916_var_MD_DayCount3				    = MD_HANGHAI_DAY3
x310916_var_MD_DayCount4				    = MD_HANGHAI_DAY4
x310916_var_RandomItemTable0   = {
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
x310916_var_RandomItemTable1   = {
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
                               { varItem = 12030803, probability = 1, itemName = "梦魇龙王降世符",varNum = 1  },
}
x310916_var_MaxTimes          = 1


function x310916_IsFeastActive() 
	local day = GetDayOfYear()
	if day < 300 or day > 303 or x310916_var_FeastId ~= MD_CURRENT_FEAST_ID  then
				return 0
	end
	return 1
end
	
function x310916_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest)

		if x310916_IsFeastActive() ~= 1 then
				return
		end

    local lv = GetLevel( varMap, varPlayer)
    if lv < x310916_var_MinLevel then
        return
    end

    local day = GetDayOfYear()
    if day >= 300 and day <= 303 then
        TalkAppendButton( varMap, x310916_var_FileId, "【扬帆地中海】神秘大奖等你拿", 3, 1)
    end
end

function x310916_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest, indexId)

    StartTalkTask( varMap)
        TalkAppendString( varMap, "#Y【扬帆地中海】神秘大奖等你拿" )
        TalkAppendString( varMap, "\t为了感恩广大玩家对《成吉思汗3 恶狼传说》资料片的鼎力支援，在#R10月28日至10月31日#W期间，#R每晚20:00至20:30#W，所有#G40级#W以上的玩家登陆游戏都可以与#G活动使者#W对话，获得奖品。还有一定几率获得#R超级豪礼#W。\n\t您确定要领取奖品吗？" )
    StopTalkTask()
    DeliverTalkInfo( varMap, varPlayer, varTalknpc, x310916_var_FileId, -1)
end

function x310916_ProcAcceptCheck( varMap, varPlayer, varTalknpc)

		if x310916_IsFeastActive() ~= 1 then
        return
    end
    
    if GetMinOfDay() < 1200 or GetMinOfDay() >= 1230 then
        Msg2Player( varMap, varPlayer, "活动还没有开启", 8, 3)
        return
    end

    LuaCallNoclosure(888894,"Feast_SetCurrentId",varMap,varPlayer,x310916_var_FeastId)

    local minute = GetMinOfDay()
    local active = nil
    local varToday = GetDayOfYear()
    if varToday < 300 or varToday > 303 then
    	return
    end
    
   
  	if (varToday == 300 and GetPlayerGameData( varMap, varPlayer, x310916_var_MD_DayCount1[ 1], x310916_var_MD_DayCount1[ 2], x310916_var_MD_DayCount1[ 3] ) == varToday) or
  	(varToday == 301 and GetPlayerGameData( varMap, varPlayer, x310916_var_MD_DayCount2[ 1], x310916_var_MD_DayCount2[ 2], x310916_var_MD_DayCount2[ 3] ) == varToday) or
  	(varToday == 302 and GetPlayerGameData( varMap, varPlayer, x310916_var_MD_DayCount3[ 1], x310916_var_MD_DayCount3[ 2], x310916_var_MD_DayCount3[ 3] ) == varToday) or
  	(varToday == 303 and GetPlayerGameData( varMap, varPlayer, x310916_var_MD_DayCount4[ 1], x310916_var_MD_DayCount4[ 2], x310916_var_MD_DayCount4[ 3] ) == varToday) 
  	then
        Msg2Player( varMap, varPlayer, "您今天已经领取过礼物了。", 8, 3)
        return
  	end
  
    if GetBagSpace( varMap, varPlayer) < 2 then
        Msg2Player( varMap, varPlayer, "背包空间不足，无法获得物品", 8, 3)
        return
    end
   
    if GetLevel( varMap, varPlayer) <80 then      

	  		  local rseed = random( 1, 20000)
	  		  local varIndex = 1
	  		  local dn = 1
	  		  local up = 1
	  		  for varI, item in x310916_var_RandomItemTable0 do
	  		      up = up + item.probability
	  		      if rseed >= dn and rseed < up then
	  		          varIndex = varI
	  		          break
	  		      end
	  		      dn = dn + item.probability
	  		  end

					
						AddMoney( varMap, varPlayer, 1, 150000) 
					
		  		  StartItemTask( varMap)
		  		  ItemAppendBind( varMap, x310916_var_RandomItemTable0[ varIndex ].varItem, x310916_var_RandomItemTable0[ varIndex ].varNum)

		    		if StopItemTask( varMap, varPlayer) == 0 then
		    		    Msg2Player( varMap, varPlayer, "添加物品失败", 8, 3)
		    		    return
		    		end
		    		
		    		if x310916_var_RandomItemTable0[ varIndex ].varItem ==12250002 then
		    			local varMsg = format( "恭喜#R%s#cffcc00在【扬帆地中海】神秘大奖等你拿活动中获得#G精品芝华士#cffcc00！", GetName( varMap, varPlayer) )
		    			LuaAllScenceM2Wrold (varMap , varMsg , 5, 1)
		    		end
		    			
		    		if x310916_var_RandomItemTable0[ varIndex ].varItem ==11000300 then
		    			local varMsg = format( "恭喜#R%s#cffcc00在【扬帆地中海】神秘大奖等你拿活动中获得#G灵魂印#cffcc00！", GetName( varMap, varPlayer) )
		    			LuaAllScenceM2Wrold (varMap , varMsg , 5, 1)
		    		end	
		    		
		    		if x310916_var_RandomItemTable0[ varIndex ].varItem ==11000702 then
		    			local varMsg = format( "恭喜#R%s#cffcc00在【扬帆地中海】神秘大奖等你拿活动中获得#G神天琉璃#cffcc00！", GetName( varMap, varPlayer) )
		    			LuaAllScenceM2Wrold (varMap , varMsg , 5, 1)
		    		end		
		    			
		    		Msg2Player( varMap, varPlayer, format("恭喜您获得了150两银卡，%d个#G@itemid_%d#cffcf00！",x310916_var_RandomItemTable0[ varIndex ].varNum,x310916_var_RandomItemTable0[ varIndex ].varItem), 8, 3) 
		    		DeliverItemListSendToPlayer( varMap, varPlayer)
		    	
		else
	  		  local rseed = random( 1, 20000)
	  		  local varIndex = 1
	  		  local dn = 1
	  		  local up = 1
	  		  for varI, item in x310916_var_RandomItemTable1 do
	  		      up = up + item.probability
	  		      if rseed >= dn and rseed < up then
	  		          varIndex = varI
	  		          break
	  		      end
	  		      dn = dn + item.probability
	  		  end
	  		  
	  		  
						AddMoney( varMap, varPlayer, 1, 150000) 
						GamePlayScriptLog(varMap, varPlayer, 2500)
		  		  StartItemTask( varMap)
		  		  ItemAppendBind( varMap, x310916_var_RandomItemTable1[ varIndex ].varItem, x310916_var_RandomItemTable1[ varIndex ].varNum)

		    		if StopItemTask( varMap, varPlayer) == 0 then
		    		    Msg2Player( varMap, varPlayer, "添加物品失败", 8, 3)
		    		    return
		    		end
		    		
		    		if x310916_var_RandomItemTable1[ varIndex ].varItem ==12250002 then
		    			local varMsg = format( "恭喜#R%s#cffcc00在【扬帆地中海】神秘大奖等你拿活动中获得#G精品芝华士#cffcc00！", GetName( varMap, varPlayer) )
		    			LuaAllScenceM2Wrold (varMap , varMsg , 5, 1)
		    		end
		    			
		    		if x310916_var_RandomItemTable1[ varIndex ].varItem ==11000300 then
		    			local varMsg = format( "恭喜#R%s#cffcc00在【扬帆地中海】神秘大奖等你拿活动中获得#G灵魂印#cffcc00！", GetName( varMap, varPlayer) )
		    			LuaAllScenceM2Wrold (varMap , varMsg , 5, 1)
		    		end	
    			 
		    		if x310916_var_RandomItemTable1[ varIndex ].varItem ==12030803 then
		    			local varMsg = format( "恭喜#R%s#cffcc00在【扬帆地中海】神秘大奖等你拿活动中获得#G梦魇龙王#cffcc00！", GetName( varMap, varPlayer) )
		    			LuaAllScenceM2Wrold (varMap , varMsg , 5, 1)
		    		end	
		    				    		
		    		Msg2Player( varMap, varPlayer, format("恭喜您获得了150两银卡，%d个#G@itemid_%d#cffcf00！",x310916_var_RandomItemTable1[ varIndex ].varNum,x310916_var_RandomItemTable1[ varIndex ].varItem), 8, 3)    
		    		DeliverItemListSendToPlayer( varMap, varPlayer)
		    	end	
    
	if varToday == 300 then
    SetPlayerGameData( varMap, varPlayer, x310916_var_MD_DayCount1[ 1], x310916_var_MD_DayCount1[ 2], x310916_var_MD_DayCount1[ 3], varToday)
    elseif varToday == 301 then
    SetPlayerGameData( varMap, varPlayer, x310916_var_MD_DayCount2[ 1], x310916_var_MD_DayCount2[ 2], x310916_var_MD_DayCount2[ 3], varToday) 
    elseif varToday == 302 then
    SetPlayerGameData( varMap, varPlayer, x310916_var_MD_DayCount3[ 1], x310916_var_MD_DayCount3[ 2], x310916_var_MD_DayCount3[ 3], varToday)  
    elseif varToday == 303 then
    SetPlayerGameData( varMap, varPlayer, x310916_var_MD_DayCount4[ 1], x310916_var_MD_DayCount4[ 2], x310916_var_MD_DayCount4[ 3], varToday) 
    end
    
end
