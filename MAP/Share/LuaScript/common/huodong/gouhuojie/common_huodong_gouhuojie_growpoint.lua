

x310856_var_GatherPointTypeId = 1050
x310856_var_ItemId = 12110210


function x310856_ProcGpCreate(varMap,varGpType,varX,varY,viewgroup)
--WriteLog(1,format("--x310856_ProcGpCreate..varMap =%d,varX=%d,varY=%d",varMap, varX,varY))
	local varBoxId = ItemBoxEnterScene(varX, varY, x310856_var_GatherPointTypeId, varMap, 0, x310856_var_ItemId,-1,viewgroup)
	SetGrowPointObjID(varMap,x310856_var_GatherPointTypeId,varX, varY,varBoxId)
end




function x310856_ProcGpOpen(varMap,varPlayer,varTalknpc)
  local perYear, perMonth, perDay = GetYearMonthDay();
  if ( perYear == 2012 and perMonth == 4 and perDay >= 17 and perDay <= 30  ) then
		local mintemp = GetMinOfDay()
		if (mintemp <780) or (mintemp >810 and mintemp <1140) or (mintemp >1170) then
			ChangeGrowPointViewGroupByType(varMap, x310856_var_GatherPointTypeId, 1)
			Msg2Player(varMap, varPlayer, "不在活动时间内，请在(13:00~13:30,19:00~19:30)时间内采集", 0, 3)
			return 1
		else
			return 0
		end
	else
		Msg2Player(varMap, varPlayer, "不在活动时间内，无法采集", 0, 3)
		return 1
	end
	return 0
end




function x310856_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	local temp = random(1,1500)
	local PlayerPosX,PlayerPosZ = GetWorldPos( varMap, varPlayer )
	
	if temp > 21 then
	
		Msg2Player(varMap, varPlayer, "采集完成，获得1个@item_"..x310856_var_ItemId, 0, 3)
		StartItemTask(varMap)
		ItemAppendBind( varMap, x310856_var_ItemId, 1 )	
		local varRet = StopItemTask(varMap,varPlayer)
		if varRet > 0 then
			DeliverItemListSendToPlayer(varMap,varPlayer)
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"背包已满，无法得到物品！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end

	elseif temp >1 and temp <=20 then
		Msg2Player(varMap, varPlayer, "地面一阵震动，出现了一只魔君喽啰", 0, 3)
		local objId= CreateMonster(varMap,
					 8016,
					 PlayerPosX,  
					 PlayerPosZ,  
					 1,
					 -1,
					 -1, 
					 -1,  
					 21,  
					 1800000, 
					 0,
					 "魔君喽啰",
					 "")
	elseif temp == 1 then
		local name= GetName(varMap,varPlayer)
		local temp = GetQuestParam(varMap,varPlayer,varQuestIdx,5)
		Msg2Player(varMap, varPlayer, "一阵巨大的震动，你惊醒了一只恐怖的魔君", 0, 3)
		LuaAllScenceM2Wrold( varMap, "玩家"..name.."采集木材时惊醒了一只恐怖的魔君", 5, 1 )
    	LuaAllScenceM2Wrold( varMap, "玩家"..name.."采集木材时惊醒了一只恐怖的魔君", 1, 1 )
		local objId= CreateMonster(varMap,
			 8017,
			 PlayerPosX,  
			 PlayerPosZ,  
			 1,
			 970,
			 -1, 
			 -1,  
			 21,  
			 1800000, 
			 0,
			 "恐怖的魔君",
			 "")
	end

	return 1
	
end



function	x310856_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end


function x310856_ProcTimerDoingStart( varMap, varAct, varParam1, varParam2, varParam3, varParam4,Param5 )
	local perYear, perMonth, perDay = GetYearMonthDay();
	if ( perYear == 2012 and perMonth == 4 and perDay >= 17 and perDay <= 30  ) then
		if varMap == 3 then
			if varParam1 == 0 then
				LuaAllScenceM2Wrold( varMap, "在各国王城、边塞和中兴府出现了大量篝火节木材", 5, 1 )
		    LuaAllScenceM2Wrold( varMap, "在各国王城、边塞和中兴府出现了大量篝火节木材", 1, 1 )
		  elseif varParam1 == 1 then
		    LuaAllScenceM2Wrold( varMap, "篝火节木材被哄抢一光，请等待下次木柴刷新", 1, 1 )
		  end
	  end
	    --改变采集点镜像组 varparam1为1的时候及显示
		ChangeGrowPointViewGroupByType(varMap, x310856_var_GatherPointTypeId, varParam1)
	end

	
end
