--挂酒版新兵速成
--DECLARE_QUEST_INFO_START--
x310224_var_FileId 					= 310224
x310224_var_LevelLess 				= 45 
x310224_var_LevelMax					= 110
x310224_var_MissionName				=	"大萨满的祝福"
x310224_var_DemandItem 				=	{}
x310224_var_ExpBonus 					= 0
x310224_var_BonusMoney1 			=	0
x310224_var_BonusMoney2 			=	0
x310224_var_BonusMoney3 			=	0
x310224_var_BonusMoney4 			=	0
x310224_var_BonusMoney5 			=	0
x310224_var_BonusMoney6 			=	0
x310224_var_BonusMoney8 			=	0 
x310224_var_BonusItem					=	{}
x310224_var_BonusChoiceItem 	=	{}
x310224_var_MaxCount					=	5	--每天任务限制
--DECLARE_QUEST_INFO_STOP-- 

x310224_var_GameId 						= 1101
x310224_BuffId = {7766,7768,7769,7770,7771}														
														
x310224_var_ExpTable       ={
													10         ,
													45         ,
													140        ,
													325        ,
													630        ,
													1085       ,
													1720       ,
													2565       ,
													3650       ,
													5005       ,
													6660       ,
													8645       ,
													10990      ,
													13725      ,
													16880      ,
													20485      ,
													24570      ,
													29165      ,
													34300      ,
													68956      ,
													95810      ,
													120000     ,
													150579     ,
													187824     ,
													201192     ,
													222841     ,
													259924     ,
													302592     ,
													310990     ,
													1251143    ,
													1320651    ,
													1390160    ,
													1469597    ,
													1539105    ,
													1618543    ,
													1697980    ,
													1777418    ,
													1856856    ,
													3813009    ,
													4855871    ,
													5085377    ,
													5302804    ,
													5544390    ,
													5785976    ,
													6039640    ,
													6293305    ,
													6559050    ,
													6824794    ,
													13939491   ,
													11446321   ,
													11908062   ,
													12381955   ,
													12880149   ,
													19672605   ,
													16027280   ,
													16646985   ,
													17278842   ,
													17935000   ,
													27364242   ,
													28024350   ,
													34189707   ,
													41700232   ,
													50847380   ,
													61985378   ,
													94430849   ,
													105471995  ,
													117777061  ,
													131488420  ,
													200133111  ,
													203278075  ,
													247418457  ,
													301083868  ,
													366318707  ,
													445604125  ,
													903251606  ,
													1006824457 ,
													1122079362 ,
													1250317003 ,
													1392981379 ,
													1415855064 ,
													1449169301 ,
													1482483538 ,
													1515797774 ,
													1549112011 ,
													1582426248 ,
													1615740485 ,
													1649054722 ,
													1682368958 ,
													1731996576 ,
													2251595549 ,
													2476755104 ,
													2724430614 ,
													2996873675 ,
													4495310513 ,
													4720076039 ,
													4956079841 ,
													5203883833 ,
													5464078024 ,
													7376505333 ,
													7430265312 ,
													8173291842 ,
													8336757679 ,
													8503492832 ,
													8673562689 ,
													9891497937 ,
													10815327896,
													11643634453,
													12176507143,
													13140372085,
													14827581638,
													15568960719,
													16503098363,
													17658315248,
													19070980468,
													20787368710,
													21826737146,
													23136341374,
													24755885271,
													26736356092,
													29142628141,
													32056890955,
													33980304412,
													36019122677,
													38180270038,
													40471086240,
													42899351414,
													45473312499,
													48201711249,
													51093813924,
													54159442760,
													54159442760,
													54159442760,
													54159442760,
													54159442760,
													54159442760,
													54159442760,
													54159442760,
													54159442760,
													54159442760,
													54159442760,
													54159442760,
													54159442760,
													54159442760,
													54159442760,
													54159442760,
													54159442760,
													54159442760,
													54159442760,
													54159442760,
													54159442760,
													54159442760,
													54159442760,
													54159442760,
													54159442760,
													54159442760,
													54159442760,
													54159442760,
													54159442760,
													54159442760,
													54159442760,

}

--**********************************
function x310224_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	if GetGameOpenById(x310224_var_GameId) ~= 1 then
		return
	end
		TalkAppendButton(varMap, x310224_var_FileId, x310224_var_MissionName,3,1)

end


function x310224_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	
	if GetGameOpenById(x310224_var_GameId) ~= 1 then
		return
	end
	if GetTopListInfo_MaxLevel( GetWorldID( varMap, varPlayer) ) < 65 then
		StartTalkTask(varMap);
		TalkAppendString(varMap, "服务器等级第一名达到65级，才可开启此功能");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer,"服务器等级第一名达到65级，才可开启此功能",8,2)	
		return
	end
	if GetLevel(varMap, varPlayer) < x310224_var_LevelLess then
		StartTalkTask(varMap);
		TalkAppendString(varMap, "您的等级过低，无法使用此功能");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer,"您的等级过低，无法使用此功能",8,2)
		return
	end

	if GetLevel(varMap, varPlayer) > x310224_var_LevelMax then
		StartTalkTask(varMap);
		TalkAppendString(varMap, "您的等级过高，无法使用此功能");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer,"您的等级过高，无法使用此功能",8,2)
		return
	end
	
	local varLevelMax = GetTopListInfo_MaxLevel( GetWorldID( varMap, varPlayer) )
	if GetLevel(varMap, varPlayer) >= ( varLevelMax-5) then
		StartTalkTask(varMap);
		TalkAppendString(varMap, "您的等级与排行榜第一名的差距过小，无法使用此功能");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer,"您的等级与排行榜第一名的差距过小，无法使用此功能",8,2)
		return
	end
	
	local IsHaveExp = GetExp(varMap, varPlayer)
	local Selflevel = GetLevel( varMap, varPlayer )
	if IsHaveExp >= x310224_var_ExpTable[Selflevel] then 
		StartTalkTask(varMap);
		TalkAppendString(varMap, "您的剩余经验超过了当前升级所需经验，无法使用此功能");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer,"您的剩余经验超过了当前升级所需经验，无法使用此功能",8,2)	
		return
	end		
	
	local varDaycount = x310224_GetDayCount(varMap, varPlayer)
	if varDaycount >= x310224_var_MaxCount then
		StartTalkTask(varMap);
		TalkAppendString(varMap, "每日只能接受五次祝福，请明日再来");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer,"每日只能接受五次祝福，请明日再来",8,2)	
		return 0
	end		
	for i ,item in x310224_BuffId do
		if IsHaveSpecificImpact(varMap, varPlayer, item) > 0 then 
			StartTalkTask(varMap);
			TalkAppendString(varMap, "您已经接受了大萨满的祝福，请稍后再来");
			StopTalkTask();
			DeliverTalkTips(varMap, varPlayer);
			Msg2Player(varMap,varPlayer,"您已经接受了大萨满的祝福，请稍后再来",8,2)	
			return 0
		end	
	end	
	if extid == 1 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y大萨满的祝福")
		TalkAppendString(varMap,"\t你是否有心为国效力，却一直苦于自己不够强大。\n\t我可以耗费一些灵力，为我国的勇士们提供一种便捷的提升自身实力的方法。不过，补充消耗的灵力也需要一笔很大的开销，所以，除了每天第一次免费之外，其余的次数，你需要花费一定的金卡。")
    local cost = x310224_GetCost(varMap, varPlayer)
    local expbouns = x310224_GetMissionExpBonus(varMap, varPlayer )
 		TalkAppendString(varMap," ")
    TalkAppendString( varMap, format( "#Y需要金卡#W:#{_MONEY%d}", cost) )
    TalkAppendString( varMap, format( "#Y奖励经验值#W:%d", expbouns) )
		TalkAppendButton(varMap, x310224_var_FileId, "确定接受大萨满的祝福",3,2)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x310224_var_FileId, x310224_var_MissionName)
	elseif extid == 2 then
		if GetMoney(varMap, varPlayer,3) < x310224_GetCost(varMap, varPlayer) then
			StartTalkTask(varMap);
			TalkAppendString(varMap, "您的金卡不足，无法使用此功能");
			StopTalkTask();
			DeliverTalkTips(varMap, varPlayer);
			Msg2Player(varMap,varPlayer,"您的金卡不足，无法使用此功能",8,2)
			return 0
		end	
		local cash = GetMoney(varMap, varPlayer,3)
		if cash >= x310224_GetCost(varMap, varPlayer) then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y大萨满的祝福")
			TalkAppendString(varMap,"")
			TalkAppendString(varMap,"\t您接受了大萨满的祝福。")
			if x310224_GetCost(varMap, varPlayer) > 0 then
				CostMoney(varMap, varPlayer, 3, x310224_GetCost(varMap, varPlayer))
				--AddMoney(varMap, varPlayer, 3, x310224_GetCost(varMap, varPlayer), 3721)
				local varReadme = format("领取大萨满的祝福花费了#{_MONEY%d}金卡", x310224_GetCost(varMap, varPlayer) )
				Msg2Player( varMap, varPlayer, varReadme, 8, 2 )				
				GamePlayScriptLog( varMap, varPlayer, 3720+varDaycount)
				WriteLog(1, format("x310224_ProcEventEntry CostMoneyok --- varMap = %d, varPlayer = %d, DayCount = %d, Money = %d",varMap, varPlayer, varDaycount, x310224_GetCost(varMap, varPlayer)))
			end
			SendSpecificImpactToUnit(varMap, varPlayer,varPlayer,varPlayer, x310224_BuffId[varDaycount+1],0 )
			x310224_SetDayCount(varMap, varPlayer)
			StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer,varTalknpc,x310224_var_FileId, x310224_var_MissionName)
		else
			WriteLog(1, format("x310224_ProcEventEntry CostMoneyError!!!! --- varMap = %d, varPlayer = %d, DayCount = %d, Money = %d",varMap, varPlayer, varDaycount, cash))
		end
	end	
end


function x310224_GetMissionExpBonus(varMap, varPlayer )

	local varLevel = GetLevel(varMap, varPlayer)
	local muli = x310224_GetExpBonusMuil(varMap, varPlayer )
	local awardexp = 0
	if varLevel < 70 then 
		awardexp = 100 * 1.5 * varLevel / 6 * 4 * 2 * 3600 * muli
	elseif varLevel < 80 then 
		awardexp = 100 * 2.7 * varLevel / 6 * 4 * 2 * 3600 * muli
	elseif varLevel < 90 then 
		awardexp = 100 * 5.4 * varLevel / 6 * 4 * 2 * 3600 * muli
	elseif varLevel >= 90 then 
	 	awardexp = 100 * 5.4 * varLevel / 6 * 5.2 * 2 * 3600 * muli
	end 
	local varDaycount =x310224_GetDayCount(varMap,varPlayer)
	if  varDaycount == 0 then
		awardexp = floor(awardexp/15*1) 
	elseif varDaycount == 1 then
		awardexp = floor(awardexp/15*2) 
	elseif varDaycount == 2 then
		awardexp = floor(awardexp/15*3) 
	elseif varDaycount == 3 then
		awardexp = floor(awardexp/15*4) 
	elseif varDaycount >= 4 then
		awardexp = floor(awardexp/15*5) 
	end
	return awardexp	
end

function x310224_GetDayCount(varMap, varPlayer)
	if x310224_var_MaxCount > 0 then
		local varToday = GetDayOfYear()
		local varLastday = GetPlayerGameData(varMap, varPlayer, MD_QUEST_SUCHENGNEW_DAY[1], MD_QUEST_SUCHENGNEW_DAY[2], MD_QUEST_SUCHENGNEW_DAY[3])
		if varLastday ~= varToday then
			return 0
		end

		local varDaycount =  GetPlayerGameData(varMap, varPlayer, MD_QUEST_SUCHENGNEW_DAYCOUNT[1], MD_QUEST_SUCHENGNEW_DAYCOUNT[2], MD_QUEST_SUCHENGNEW_DAYCOUNT[3])
		return varDaycount

	end
	return 0
end


function x310224_SetDayCount(varMap, varPlayer)
	local varToday = GetDayOfYear()
	local varLastday = GetPlayerGameData(varMap, varPlayer, MD_QUEST_SUCHENGNEW_DAY[1], MD_QUEST_SUCHENGNEW_DAY[2], MD_QUEST_SUCHENGNEW_DAY[3])
	if varLastday ~= varToday then
		SetPlayerGameData(varMap, varPlayer, MD_QUEST_SUCHENGNEW_DAY[1], MD_QUEST_SUCHENGNEW_DAY[2], MD_QUEST_SUCHENGNEW_DAY[3], varToday)
		SetPlayerGameData(varMap, varPlayer, MD_QUEST_SUCHENGNEW_DAYCOUNT[1], MD_QUEST_SUCHENGNEW_DAYCOUNT[2], MD_QUEST_SUCHENGNEW_DAYCOUNT[3], 1)
	else
		local varDaycount = GetPlayerGameData(varMap, varPlayer, MD_QUEST_SUCHENGNEW_DAYCOUNT[1], MD_QUEST_SUCHENGNEW_DAYCOUNT[2], MD_QUEST_SUCHENGNEW_DAYCOUNT[3])
		SetPlayerGameData(varMap, varPlayer, MD_QUEST_SUCHENGNEW_DAYCOUNT[1], MD_QUEST_SUCHENGNEW_DAYCOUNT[2], MD_QUEST_SUCHENGNEW_DAYCOUNT[3], varDaycount+1)
	end
end

function x310224_GetCost(varMap, varPlayer)
	local varDaycount =x310224_GetDayCount(varMap,varPlayer)
	local cost = 0
	if  varDaycount == 1 then
		cost = 5000*5
	elseif varDaycount == 2 then
		cost = 10000*5
	elseif varDaycount == 3 then
		cost = 20000*5
	elseif varDaycount == 4 then
		cost = 40000*5
	elseif varDaycount >= 5 then
		cost = 40000*5	
	end
	return cost
end

function x310224_GetExpBonusMuil(varMap, varPlayer )
	local varLevelMax = GetTopListInfo_MaxLevel( GetWorldID( varMap, varPlayer) )
	local level = GetLevel(varMap, varPlayer)	
	local Muil = 1
	if varLevelMax < 70 then 
		if level < 50 then
			Muil = 1.2
		end
	elseif varLevelMax < 80 then 
		if level < 50 then
			Muil = 1.5
		elseif level < 60 then
			Muil = 1.2		
		end
	elseif varLevelMax < 90 then 
		if level < 50 then
			Muil = 1.9
		elseif level < 60 then
			Muil = 1.5	
		elseif level < 70 then
			Muil = 1.2	
		end
	elseif varLevelMax < 100 then 
		if level < 50 then
			Muil = 2.5
		elseif level < 60 then
			Muil = 2
		elseif level < 70 then
			Muil = 1.6	
		elseif level < 80 then
			Muil = 1.3			
		end
	elseif varLevelMax < 110 then 
		if level < 50 then
			Muil = 3.2
		elseif level < 60 then
			Muil = 2.6		
		elseif level < 70 then
			Muil = 2.1	
		elseif level < 80 then
			Muil = 1.7	
		elseif level < 90 then
			Muil = 1.4							
		end
	elseif varLevelMax < 120 then 
		if level < 50 then
			Muil = 3.9
		elseif level < 60 then
			Muil = 3.2		
		elseif level < 70 then
			Muil = 2.6
		elseif level < 80 then
			Muil = 2.1
		elseif level < 90 then
			Muil = 1.7
		elseif level < 100 then
			Muil = 1.4
		end
	elseif varLevelMax >= 120 then 
		if level < 50 then
			Muil = 4.5
		elseif level < 60 then
			Muil = 3.7		
		elseif level < 70 then
			Muil = 3
		elseif level < 80 then
			Muil = 2.4
		elseif level < 90 then
			Muil = 1.9
		elseif level < 100 then
			Muil = 1.5
		elseif level < 110 then
			Muil = 1.2
		end		
	end 
	return Muil
end
