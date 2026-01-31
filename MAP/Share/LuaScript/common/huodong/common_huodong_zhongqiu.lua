


x310900_var_FileId          = 310900

x310900_var_MinLevel          = 40


x310900_var_FeastId						= 4
x310900_var_MD_DayCount1				    = MD_ZHONGQIU_DAY1
x310900_var_MD_DayCount2				    = MD_ZHONGQIU_DAY2



x310900_var_RandomItemTable   = {
                                { varItem = 11010017, probability = 10, itemName = "祈福种子",varNum = 1 }, 
                                { varItem = 11010015, probability = 40, itemName = "许愿种子" ,varNum = 3 }, 
                                { varItem = 11990011, probability = 10, itemName = "三番令" ,varNum = 1 }, 
                                { varItem = 12041101, probability = 10, itemName = "修行草",varNum = 1  }, 
                                { varItem = 12030258, probability = 10, itemName = "全福月饼",varNum = 1  }, 
                                { varItem = 12030320, probability = 20, itemName = "小钱包",varNum = 2  } 
}


x310900_var_ProceFromFour       = {
                                12031002,
                                12031003,
                                12031004,
}


x310900_var_MaxTimes          = 2


function x310900_IsFeastActive()
    local day = GetDayOfYear()
	if day < 263 or day > 270 or x310900_var_FeastId ~= MD_CURRENT_FEAST_ID then
				return 0
	end
	return 1
end

function x310900_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest)

		
		if x310900_IsFeastActive() ~= 1 then
				return
		end

    local lv = GetLevel( varMap, varPlayer)
    if lv < x310900_var_MinLevel then
        return
    end

    local day = GetDayOfYear()
    if day >= 263 and day <= 269 then
        TalkAppendButton( varMap, x310900_var_FileId, "中秋领奖", 3, 1)
    end
end

function x310900_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest, indexId)

		if x310900_IsFeastActive() ~= 1 then
        Msg2Player( varMap, varPlayer, "活动没有开启", 8, 3)
        return
    end

    StartTalkTask( varMap)
        TalkAppendString( varMap, "#Y中秋领奖" )
        TalkAppendString( varMap, "\t值此中秋佳节之际，《成吉思汗3 恶狼传说》与您一起欢度中秋。从9月21日至9月27日，每天中午12：00-12：30和晚上20：00-20：30，您都可以领取一份#G礼物#W。\n\t您确定要领取中秋节礼物吗？" )
    StopTalkTask()
    DeliverTalkInfo( varMap, varPlayer, varTalknpc, x310900_var_FileId, -1)
end

function x310900_ProcAcceptCheck( varMap, varPlayer, varTalknpc)

		if x310900_IsFeastActive() ~= 1 then
        Msg2Player( varMap, varPlayer, "活动没有开启", 8, 3)
        return
    end
    
    
    LuaCallNoclosure(888894,"Feast_SetCurrentId",varMap,varPlayer,x310900_var_FeastId)

    local minute = GetMinOfDay()
    local active = nil
    local varToday = GetDayOfYear()
    if varToday < 263 or varToday > 270 then
    	return
    end
    if minute >= 720 and minute < 750 then
    	if GetPlayerGameData( varMap, varPlayer, x310900_var_MD_DayCount1[ 1], x310900_var_MD_DayCount1[ 2], x310900_var_MD_DayCount1[ 3] ) ~= varToday then
    	    active = x310900_var_MD_DayCount1
    	else
	        Msg2Player( varMap, varPlayer, "这个时段的礼物已经领取过了", 8, 3)
	        return
    	end

    elseif minute >= 1200 and minute < 1230 then
    	if GetPlayerGameData( varMap, varPlayer, x310900_var_MD_DayCount2[ 1], x310900_var_MD_DayCount2[ 2], x310900_var_MD_DayCount2[ 3] ) ~= varToday then
    	    active = x310900_var_MD_DayCount2
    	else
	        Msg2Player( varMap, varPlayer, "这个时段的礼物已经领取过了", 8, 3)
	        return
    	end
    else
        Msg2Player( varMap, varPlayer, "现在不是活动时间", 8, 3)
        return
    end

    if GetBagSpace( varMap, varPlayer) < 3 then
        Msg2Player( varMap, varPlayer, format( "背包空间不足3个，无法获得物品", 1), 8, 3)
        return
    end

    
    StartItemTask( varMap)
    	
    	
	    local rseed = random( 1, 100)
	    local varIndex = 1
	    local dn = 1
	    local up = 1
	    for varI, item in x310900_var_RandomItemTable do
	        up = up + item.probability
	        if rseed >= dn and rseed < up then
	            varIndex = varI
	            break
	        end
	        dn = dn + item.probability
	    end
	    
	    ItemAppendBind( varMap, x310900_var_RandomItemTable[ varIndex ].varItem, x310900_var_RandomItemTable[ varIndex ].varNum)
	    
	    
	    varIndex = random(1,3)
	    if varIndex < 1 then varIndex = 1 end
	    if varIndex > 3 then varIndex = 3 end
	    ItemAppendBind( varMap, x310900_var_ProceFromFour[ varIndex ], 3)
    
    if StopItemTask( varMap, varPlayer) == 0 then
        Msg2Player( varMap, varPlayer, "添加物品失败", 8, 3)
        return
    end
    Msg2Player( varMap, varPlayer, "恭喜你获得了中秋礼物！", 8, 3)    
    DeliverItemListSendToPlayer( varMap, varPlayer)


















    SetPlayerGameData( varMap, varPlayer, active[ 1], active[ 2], active[ 3], varToday)
end
