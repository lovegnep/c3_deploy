x570079_var_FileId 						= 570079
x570079_var_QuestName					= "疯狂的冥铁"
x570079_var_IntroName					= "疯狂的冥铁说明"
x570079_var_Introduction					= "#Y疯狂的冥铁说明\n#W\n1、每天在#G22：30-22：35、22：40-22：45和22：50-22：55#W三个时间段开放三轮四级冥铁兑换。\n \n2、不低于70级的玩家可以用#G2块三级冥铁#W和#G10两现金#W来换取1块四级冥铁。\n \n3、每一轮限量出售#G60块#W冥铁，前一轮未售完的冥铁将加至本轮继续出售。\n \n4、每一位不低于70级的玩家每一轮可进行#G3次#W兑换，上一轮未兑换的次数也将加至本轮可兑换的次数中。\n \n5、兑换后获得的四级冥铁为不绑定。"
x570079_var_QuestName1					= "#Y【兑换】四级冥铁#W\n  你需要花费2块三级冥铁和10两现金来换取1块四级冥铁，确定要兑换么？"
x570079_var_IsEnableId    = 1090
x570079_var_MenuSlect					= {}
x570079_var_WriteLogtoggle    = 0
x570079_var_MingTieItem					= {
{itemid = 11000605, name = "三级冥铁"},
{itemid = 11000606, name = "四级冥铁"}
} 


function x570079_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

	local minOfDay = GetMinOfDay()
	local nlevel = GetLevel( varMap, varPlayer)
	
	if GetGameOpenById( x570079_var_IsEnableId) <= 0 then
    return
  end
  
  TalkAppendButton(varMap, x570079_var_FileId, x570079_var_IntroName, 13, 2)
  
	if minOfDay < 1350 then 
		return
	end
	
	if minOfDay > 1355 and minOfDay < 1360 then
		return
	end
	
	if minOfDay > 1365 and minOfDay < 1370 then
		return
	end	
	
	if minOfDay > 1375 then
	     	return
	end	
	
	if nlevel < 70 then
		return
	end
	TalkAppendButton(varMap, x570079_var_FileId, x570079_var_QuestName, 3, 1)		
end


function x570079_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest, varidx)
	if x570079_var_WriteLogtoggle == 1 then
		Msg2Player(varMap, varPlayer, "vartoday="..GetDayOfYear(), 8, 2)
		Msg2Player(varMap, varPlayer, "timecount="..x570079_GetMD( varMap, varPlayer,MD_EXCHANGE_SIJIMINGTIE_TIMECOUNT), 8, 2)
		Msg2Player(varMap, varPlayer, "wheelcount="..x570079_GetMD( varMap, varPlayer, MD_EXCHANGE_SIJIMINGTIE_TIMECOUNT1), 8, 2)
		Msg2Player(varMap, varPlayer, "date="..x570079_GetMD( varMap, varPlayer, MD_EXCHANGE_SIJIMINGTIE_DATE), 8, 2)
		Msg2Player(varMap, varPlayer, "countrycount="..GetCountryParam(varMap, 2, CD_HUODONG_XINNIAN), 8, 2)		
	end	
	if varidx == 1 then
		x570079_var_MenuSlect[GetGUID(varMap, varPlayer)] = varidx
		if x570079_var_MenuSlect[GetGUID(varMap, varPlayer)] == 1 then
			StartTalkTask(varMap)
				TalkAppendString(varMap,x570079_var_QuestName1)
			StopTalkTask()
			DeliverTalkInfo(varMap, varPlayer, varTalknpc, x570079_var_FileId, -1)	
		end	
	elseif varidx == 2 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,x570079_var_Introduction)
			StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc, x570079_var_FileId, x570079_var_FileId, 1)		
	end
end 


function x570079_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	local minOfDay = GetMinOfDay()
	local nlevel = GetLevel( varMap, varPlayer)
	
	if GetGameOpenById( x570079_var_IsEnableId) <= 0 then
    return
  end
  
	if minOfDay < 1350 then 
		return
	end
	
	if minOfDay > 1355 and minOfDay < 1360 then
		return
	end
	
	if minOfDay > 1365 and minOfDay < 1370 then
		return
	end	
	
	if minOfDay > 1375 then
		return
	end	
	
	if nlevel < 70 then
		return
	end

	local GetItemNum = GetItemCount(varMap, varPlayer, x570079_var_MingTieItem[1].itemid)
	local wheelcount = x570079_GetMD( varMap, varPlayer, MD_EXCHANGE_SIJIMINGTIE_TIMECOUNT1)
	

		
	
	if x570079_GetDayCount_SiJiMingTie(varMap, varPlayer) == 1 and wheelcount >= 3 then
		Msg2Player( varMap, varPlayer, "今天次数已满", 8, 2)
		Msg2Player( varMap, varPlayer, "今天次数已满", 8, 3)			
		return	
	end		
			
	local wheelcount = x570079_GetMD( varMap, varPlayer, MD_EXCHANGE_SIJIMINGTIE_TIMECOUNT1)	
	if minOfDay >= 1350 and minOfDay <= 1355  then
		if wheelcount == 1 or GetCountryParam(varMap, 2, CD_HUODONG_XINNIAN) < -60 then
			Msg2Player( varMap, varPlayer, "本轮次数已满", 8, 2)
			Msg2Player( varMap, varPlayer, "本轮次数已满", 8, 3)			
			return	
		end
	end

	if minOfDay >= 1360 and minOfDay <= 1365 then
		if wheelcount == 2 or GetCountryParam(varMap, 2, CD_HUODONG_XINNIAN) < -120 then
			Msg2Player( varMap, varPlayer, "本轮次数已满", 8, 2)
			Msg2Player( varMap, varPlayer, "本轮次数已满", 8, 3)			
			return	
		end
	end
		
	if minOfDay >= 1370 and minOfDay <= 1375  then
		if wheelcount == 3 or GetCountryParam(varMap, 2, CD_HUODONG_XINNIAN) < -180 then
			Msg2Player( varMap, varPlayer, "本轮次数已满", 8, 2)
			Msg2Player( varMap, varPlayer, "本轮次数已满", 8, 3)			
			return	
		end
	end
	
	if GetItemNum < 2 then
		Msg2Player( varMap, varPlayer, format("你没有足够的#R%s", x570079_var_MingTieItem[1].name), 8, 2)
		Msg2Player( varMap, varPlayer, format("你没有足够的#R%s", x570079_var_MingTieItem[1].name), 8, 3)			
		return
	end
	
	if GetMoney(varMap, varPlayer, 2) < 10000 then
		Msg2Player( varMap, varPlayer, "你没有足够的#R现金", 8, 2)
		Msg2Player( varMap, varPlayer, "你没有足够的#R现金", 8, 3)			
		return	
	end				
	x570079_SiJiMingTieExchange(varMap, varPlayer)
end

function x570079_SiJiMingTieExchange(varMap, varPlayer)
	local timecount = x570079_GetMD( varMap, varPlayer, MD_EXCHANGE_SIJIMINGTIE_TIMECOUNT)
	local wheelcount = x570079_GetMD( varMap, varPlayer, MD_EXCHANGE_SIJIMINGTIE_TIMECOUNT1)
	local CountryCount = GetCountryParam(varMap, 2, CD_HUODONG_XINNIAN)
	local minOfDay = GetMinOfDay()
    StartItemTask( varMap)
    ItemAppend( varMap, x570079_var_MingTieItem[2].itemid, 1)
    local result = StopItemTask( varMap, varPlayer)
    if result == 0 then
        Msg2Player( varMap, varPlayer, "背包已满，无法领取任务", 8, 3)
        Msg2Player( varMap, varPlayer, "背包已满，无法领取任务", 8, 2)
        return 1
    end
	if DelItem(varMap, varPlayer, x570079_var_MingTieItem[1].itemid, 2) ~= 1  then return end   
	if CostMoney(varMap, varPlayer, 2, 10000)   ~= 1 then return end 
  DeliverItemListSendToPlayer( varMap, varPlayer)	
  local str = format("兑换完成，你获得1个#R#{_ITEM%d}",x570079_var_MingTieItem[2].itemid)
	Msg2Player(varMap, varPlayer, str, 8, 3)
  GamePlayScriptLog(varMap, varPlayer, 2550) 
    if timecount < 2 then
    	x570079_SetMD( varMap, varPlayer, MD_EXCHANGE_SIJIMINGTIE_TIMECOUNT, timecount + 1)
    	x570079_GetTimeCount_SiJiMingTie(varMap, varPlayer)
    else
     	x570079_SetMD( varMap, varPlayer, MD_EXCHANGE_SIJIMINGTIE_TIMECOUNT, 0)
     	x570079_GetTimeCount_SiJiMingTie(varMap, varPlayer)
     	if  wheelcount  < 3 then  	
    		x570079_SetMD( varMap, varPlayer, MD_EXCHANGE_SIJIMINGTIE_TIMECOUNT1, wheelcount + 1)
    	end
    end
    local daycount = x570079_GetMD( varMap, varPlayer, MD_EXCHANGE_SIJIMINGTIE_DATE)
    if daycount <= 511  then
    	x570079_SetMD( varMap, varPlayer, MD_EXCHANGE_SIJIMINGTIE_DATE, GetDayOfYear())
    end    
end


function x570079_GetDayCount_SiJiMingTie(varMap, varPlayer)

	local varToday = GetDayOfYear()
	local varLastday = x570079_GetMD( varMap, varPlayer, MD_EXCHANGE_SIJIMINGTIE_DATE)

	if varLastday ~= varToday then
		x570079_SetMD( varMap, varPlayer, MD_EXCHANGE_SIJIMINGTIE_TIMECOUNT, 0)
		x570079_SetMD( varMap, varPlayer, MD_EXCHANGE_SIJIMINGTIE_TIMECOUNT1, 0)
		if GetDayOfYear() ~= GetCountryParam(varMap, 1, CD_INDEX_LAODONGJIE_JIFEN) then
			SetCountryParam(varMap, 2, CD_HUODONG_XINNIAN,-1)
			SetCountryParam(varMap, 1, CD_INDEX_LAODONGJIE_JIFEN, varToday)
		end
		return 0
	else

		return 1
	end



end

function x570079_GetTimeCount_SiJiMingTie(varMap, varPlayer)
	local CountryCount = GetCountryParam(varMap, 2, CD_HUODONG_XINNIAN)
--	if GetCountryParam(varMap, 3, CD_HUODONG_XINNIAN) ~= -310823 then     --3号国家变量为标志位
--		SetCountryParam(varMap, 3, CD_HUODONG_XINNIAN,-310823)
--		SetCountryParam(varMap, 0, CD_HUODONG_XINNIAN,0)                   --清理0号国家变量（存全服积分使用）
--		SetCountryParam(varMap, 1, CD_HUODONG_XINNIAN,500) 							--清理1号国家变量，1号变量作为活动触发时间的比对变量使用，所以设为500
--	end
	SetCountryParam(varMap, 2, CD_HUODONG_XINNIAN,CountryCount - 1) 								--清理2号国家变量（未使用）
	return CountryCount  
end

function x570079_GetMD( varMap, varPlayer, mdName)
    return GetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3] )
end

function x570079_SetMD( varMap, varPlayer, mdName, value)
    SetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3], value)
end
