

x300624_var_QuestName="【国家】国民召集"
x300624_var_CostIncrement = 5			


x300624_var_FileId = 300624
x300624_var_CostMoney = 500*1000             
x300624_var_CountryID = 0             
x300624_var_TuchengzhanQuestID = 7559            

x300624_var_CountryCheck = { 51, 151, 251, 351 }

x300624_var_QuestScript = "在敌国的活动中，大将军可以通过我进行国民的召集，每日可召集次数及所需金钱如下："
x300624_var_QuestFreeCount = 1

function x300624_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	if( CountryGetOfficial(varMap, varPlayer) == 6 ) then
		TalkAppendButton(varMap,x300624_var_FileId,x300624_var_QuestName,3)
    end
end



function x300624_ProcEventEntry( varMap, varPlayer, varTalknpc )
local camp = GetSceneCamp(varMap)
local minute = GetMinOfDay()	         
local weekIdx = GetWeek()
      
if minute >= 900 and minute < 1020 then
	if x300624_IsRuoGuo(varMap, varPlayer,camp) == 1 then
		if x300624_IsBenGuo(varMap, varPlayer,camp) == 0 then
			--if x300624_IsGuoYun(varMap, varPlayer,camp) == 1 then
				if x300624_IsLianMeng(varMap, varPlayer,camp) == 0 then
					if weekIdx == 6 then
						if IsHaveQuestNM(varMap, varPlayer, x300624_var_TuchengzhanQuestID ) <= 0 then
							Msg2Player(varMap,varPlayer,"15：00到17：00为弱国保护时间，没有屠城战任务且不为联盟的异国玩家无法在弱国使用召集！",8,2)
							Msg2Player(varMap,varPlayer,"15：00到17：00为弱国保护时间，没有屠城战任务且不为联盟的异国玩家无法在弱国使用召集！",8,3)		
					return
				end
					else					
						Msg2Player(varMap,varPlayer,"15：00到17：00为弱国保护时间，不为联盟的异国玩家无法在弱国使用召集！",8 ,2)
						Msg2Player(varMap,varPlayer,"15：00到17：00为弱国保护时间，不为联盟的异国玩家无法在弱国使用召集！",8 ,3)
						return
					end
				end
			--end
		end
	end	
end
 	
 	GetCountryQuestData(varMap,varPlayer,CD_INDEX_DESTROY_ISSUE_TIME, x300624_var_FileId,-1,"ProcReturn1")
end


function x300624_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
  	GetCountryQuestData(varMap,varPlayer,CD_INDEX_DESTROY_ISSUE_COUNT, x300624_var_FileId,-1,"ProcReturn3")
end


function x300624_ProcReturn1(varMap, varPlayer,QuestData,varQuest)

	local varCurDayTime = GetDayTime()
	if QuestData ~= varCurDayTime then					
 		local CountryID = GetCurCountry(varMap,varPlayer)
		SetCountryQuestData(varMap, CountryID, CD_INDEX_DESTROY_ISSUE_TIME, varCurDayTime)
		SetCountryQuestData(varMap, CountryID, CD_INDEX_DESTROY_ISSUE_COUNT,0)
	end
	
	GetCountryQuestData(varMap,varPlayer,CD_INDEX_DESTROY_ISSUE_COUNT, x300624_var_FileId,-1,"ProcReturn2")

	DeliverTalkMenu(varMap, varPlayer, -1)
end



function x300624_ProcReturn2(varMap, varPlayer,QuestData,varQuest)
	
	local varCountry = GetCurCountry(varMap, varPlayer)

	local nRank = GetCountryRank(varCountry)

	if QuestData<0 then
		QuestData = 0
	end
	
	local preList = {}

	 for varI=1, QuestData do
		preList[varI] = "#r#d"
	 end

	 for varI=QuestData+1, 7 do
		preList[varI] = "#r#W"
	 end

	if nRank == 3 then 
		 StartTalkTask(varMap)
	 	
	 	 local showtext = x300624_var_QuestScript.."#r    ";


	 	 showtext = showtext .. preList[1].."第1次召集：免费"
		 showtext = showtext .. preList[2].."第2次召集：免费"
		 showtext = showtext .. preList[3].."第3次召集：免费"
	 	 showtext = showtext .. preList[4].."第4次召集：国家金钱250两"
	 	 showtext = showtext .. preList[5].."第5次召集：国家金钱250两"
	 	 showtext = showtext .. preList[6].."第6次召集：国家金钱250两"
	 	 showtext = showtext .. preList[7].."第7次召集：国家金钱250两"
	 	 TalkAppendString(varMap, showtext);
	 	 StopTalkTask(varMap)
	 	 DeliverTalkInfo( varMap, varPlayer, -1, x300624_var_FileId,-1 )

	elseif nRank == 2 then 
		 StartTalkTask(varMap)
	 	
	 	 local showtext = x300624_var_QuestScript.."#r    ";

	 	 showtext = showtext .. preList[1].."第1次召集：免费"
		 showtext = showtext .. preList[2].."第2次召集：免费"
	 	 showtext = showtext .. preList[3].."第3次召集：国家金钱375两"
	 	 showtext = showtext .. preList[4].."第4次召集：国家金钱375两"
	 	 showtext = showtext .. preList[5].."第5次召集：国家金钱375两"
	 	 showtext = showtext .. preList[6].."第6次召集：国家金钱375两"
	 	 TalkAppendString(varMap, showtext);
	 	 StopTalkTask(varMap)
	 	 DeliverTalkInfo( varMap, varPlayer, -1, x300624_var_FileId,-1 )
	else
		 StartTalkTask(varMap)
	 	
	 	 local showtext = x300624_var_QuestScript.."#r    ";

	 	 showtext = showtext .. preList[1].."第1次召集：免费"
	 	 showtext = showtext .. preList[2].."第2次召集：国家金钱500两"
	 	 showtext = showtext .. preList[3].."第3次召集：国家金钱500两"
	 	 showtext = showtext .. preList[4].."第4次召集：国家金钱500两"
	 	 showtext = showtext .. preList[5].."第5次召集：国家金钱500两"
	 	 TalkAppendString(varMap, showtext);
	 	 StopTalkTask(varMap)
	 	 DeliverTalkInfo( varMap, varPlayer, -1, x300624_var_FileId,-1 )
	end

end
              


function x300624_ProcReturn3(varMap, varPlayer,QuestData,varQuest)
	local varCountry = GetCurCountry(varMap, varPlayer)

	local nRank = GetCountryRank(varCountry)
	
	local nDayLimited = 5
	local nFreeCount =1
	local nNeedMoney = 500*1000

	if nRank ==3 then
		nFreeCount = 3
		nNeedMoney = 250*1000
		nDayLimited = 7
	elseif nRank ==2 then
		nFreeCount = 2
		nNeedMoney = 375*1000
		nDayLimited = 6
	end

	if x300624_GetDayCount(varMap, varPlayer)>=nDayLimited then
		StartTalkTask(varMap)
			TalkAppendString( varMap, format("很抱歉，大将军召集今天已发布%d次！",nDayLimited) )
		StopTalkTask( varMap )
		DeliverTalkTips( varMap, varPlayer )
			
		return
	end

	if( CountryGetOfficial(varMap, varPlayer) ~= 6 ) then
		StartTalkTask(varMap)
			TalkAppendString( varMap,"很抱歉，只有大将军才能发布国民召集！" )
		StopTalkTask( varMap )
		DeliverTalkTips( varMap, varPlayer )
			
		return
	end

	if (QuestData < nFreeCount) then
		local CountryID = GetCurCountry(varMap,varPlayer)

		SetCountryQuestData(varMap, CountryID, CD_INDEX_DESTROY_ISSUE_COUNT,1,1)
		SetCountryQuestData(varMap, CountryID, CD_INDEX_DESTROY_ISSUE_SCENE, varMap)
		KingIssue(varMap, varPlayer) 
		
		local varMsg = "大将军发布了召集令";
		local countryid = GetCurCountry(varMap,varPlayer)
		LuaAllScenceM2Country(varMap,varMsg,countryid,5,0)		
	else

  	local countryId = GetCurCountry(varMap,varPlayer)
  	local cost = nNeedMoney 
	 	if GetCountryResource(varMap, varPlayer, 2) < cost then
			StartTalkTask(varMap)
			TalkAppendString( varMap, "很抱歉，你的国家金钱不足，不可以召集！" )
			StopTalkTask( varMap )
			DeliverTalkTips( varMap, varPlayer )
			Msg2Player(varMap,varPlayer,"很抱歉，你的国家金钱不足，不可以召集！",8,2)
			return
		else
	    SubCountryResourceWithRecall(varMap, countryId, 2, cost, x300624_var_FileId, "ProcSubCountryResValid", varPlayer)
		end  
 	end

end


function x300624_ProcSubCountryResValid(varMap, varCountry, varIndex, varResult, varPlayer)
	
	local countryId = GetCurCountry(varMap,varPlayer)
	if (varResult == 0) then
  	local cost = nNeedMoney 
	 	if GetCountryResource(varMap, varPlayer, 2) < cost then
			StartTalkTask(varMap)
			TalkAppendString( varMap, "很抱歉，你的国家金钱不足，不可以召集！" )
			StopTalkTask( varMap )
			DeliverTalkTips( varMap, varPlayer )
			Msg2Player(varMap,varPlayer,"很抱歉，你的国家金钱不足，不可以召集！", 8, 2)
			return
		else
	    SubCountryResourceWithRecall(varMap, countryId, 2, cost, x300624_var_FileId, "ProcSubCountryResValid", varPlayer)
		end
	elseif (varResult == 1) then
		SetCountryQuestData(varMap, countryId, CD_INDEX_DESTROY_ISSUE_COUNT,1,1)
		SetCountryQuestData(varMap, countryId, CD_INDEX_DESTROY_ISSUE_SCENE, varMap)
		KingIssue(varMap, varPlayer) 
		
		local varMsg = "大将军发布了召集令";
		LuaAllScenceM2Country(varMap, varMsg, countryId, 5, 0)
	end
	
end


-- 被召集者状态检查
function x300624_CheckEnable( varMap, varPlayer)
    if IsHaveSpecificImpact( varMap, varPlayer, 7629) == 1 then
        Msg2Player( varMap, varPlayer, "您有战车加护效果，不能进行此操作", 8, 3)
        Msg2Player( varMap, varPlayer, "您有战车加护效果，不能进行此操作", 8, 2)
        return 0
    end

    return 1
end


function x300624_GetDayCount(varMap, varPlayer)
	local varCountry = GetCurCountry(varMap, varPlayer)

	local varToday = GetDayTime()
	local varLastday = GetCountryParam(varMap, varCountry, CD_INDEX_DESTROY_ISSUE_TIME)
	
	
	if varLastday ~= varToday then
		return 0
	end
	
	local varDaycount = GetCountryParam(varMap, varCountry, CD_INDEX_DESTROY_ISSUE_COUNT)
	
	return varDaycount;
end




function x300624_SetDayCount(varMap, varPlayer)
	local varCountry = GetCurCountry(varMap, varPlayer)

	local varToday = GetDayTime()

	local varLastday = GetCountryParam(varMap, varCountry, CD_INDEX_DESTROY_ISSUE_TIME)

	if varLastday ~= varToday then
		SetCountryParam(varMap, varCountry, CD_INDEX_DESTROY_ISSUE_TIME, varToday)
		SetCountryParam(varMap, varCountry, CD_INDEX_DESTROY_ISSUE_COUNT, 1)
	else
		local varDaycount = GetCountryParam(varMap, varCountry, CD_INDEX_DESTROY_ISSUE_COUNT)
		SetCountryParam(varMap, varCountry, CD_INDEX_DESTROY_ISSUE_COUNT, varDaycount+1)
	end
end
function x300624_IsRuoGuo(varMap, varPlayer,camp)
  local maxlevel = GetTopListInfo_MaxLevel(GetWorldID(varMap, varPlayer))
	local loulanscore   = GetCountryParam(varMap, 0, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	local tianshanscore = GetCountryParam(varMap, 1, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	local kunlunscore   = GetCountryParam(varMap, 2, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	local dunhuangscore = GetCountryParam(varMap, 3, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	local allscore		= loulanscore + tianshanscore + kunlunscore + dunhuangscore
	local myscore = 0
	if camp == 16 then
			 myscore = loulanscore
  elseif camp == 17 then
			 myscore = tianshanscore
	elseif camp == 18 then
			 myscore = kunlunscore
	elseif camp == 19 then
			 myscore = dunhuangscore
	else 
		   return 0
  end
	if maxlevel >= 70 then
			if myscore <= allscore*0.2 then
				if x300624_IsMinGuo(varMap, varPlayer,camp) == 1 then
	 	 			return 1
	 	 		end
			end
	end
	return 0
end
function x300624_IsBenGuo(varMap, varPlayer,camp)
local country = GetCurCountry(varMap, varPlayer )
	if camp == 16 then
 		if country == 0 then
 			return 1
 		else 
 			return 0
 		end
	elseif camp == 17 then
		if country == 1 then
	 	 return 1
		else
			return 0
		end
	elseif camp == 18 then
		if country == 2 then
		 return 1
		else
		 return 0
		end
	elseif camp ==19 then
		if country == 3 then
		 return 1
		else
		 return 0
		end
	else
  	return 1
	end
end
function x300624_IsGuoYun(varMap, varPlayer,camp)
	if camp == 16 then countryid = 0
		elseif camp == 17 then countryid = 1 
		elseif camp == 18 then countryid = 2
		elseif camp == 19 then countryid = 3
	else
 		return 0
	end
	if CountryIsFortuneTimeEx(countryid,0) > 0 or CountryIsFortuneTimeEx(countryid,1) > 0 then
		return 1
	end
  return 0
end
function x300624_IsLianMeng(varMap, varPlayer,camp)
local countryid
	if camp == 16 then countryid = 0
		elseif camp == 17 then countryid = 1 
		elseif camp == 18 then countryid = 2
		elseif camp == 19 then countryid = 3
	else
 		return 1
	end
	local varCountryID = GetCurCountry(varMap, varPlayer )
		if  IsLeague( varCountryID, countryid ) == 1 then
			return 1
		else
			return 0
		end
	return 1			
end
function x300624_IsMinGuo(varMap, varPlayer,camp)
local countryid
	if camp == 16 then countryid = 0
		elseif camp == 17 then countryid = 1 
		elseif camp == 18 then countryid = 2
		elseif camp == 19 then countryid = 3
	else
 		return 0
	end
	local loulanscore   = GetCountryParam(varMap, 0, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	local tianshanscore = GetCountryParam(varMap, 1, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	local kunlunscore   = GetCountryParam(varMap, 2, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	local dunhuangscore = GetCountryParam(varMap, 3, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	local allscore		= loulanscore + tianshanscore + kunlunscore + dunhuangscore
	local MinGuo = GetCountryParam(varMap, countryid, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	local Onlyvalue = 0
		for varI = 0, 3 do
			if GetCountryParam(varMap, varI, CD_LASTWEEK_STRONG_WEAK_JIFEN) <= MinGuo then
				Onlyvalue = Onlyvalue + 1
			end
		end
		if Onlyvalue == 1 then
			return 1
		end
	return 0
end
