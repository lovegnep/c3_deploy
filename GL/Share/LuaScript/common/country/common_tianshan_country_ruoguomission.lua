




--DECLARE_QUEST_INFO_START--


x310213_var_QuestId 				= 	7745                     
x310213_var_FileId 					= 	310213                  
x310213_var_QuestKind 				= 	1                       
x310213_var_LevelLess					= 	25                      


x310213_var_QuestName				= 	"【个人】弱国任务"
x310213_var_QuestName1				= 	"这个......上算干坤？"
x310213_var_QuestTarget				= 	"\t解决国家目前所遇到的麻烦，使国家早日强盛繁荣！"
x310213_var_QuestInfo				= 	""
x310213_var_ContinueInfo				= 	""
x310213_var_QuestCompleted			= 	""
x310213_var_QuestHelp				=	"根据情报，东瀛岛国的忍者们似乎在城外埋伏。\n\t（本任务每小时可以完成一次。）"          


x310213_var_ExtTarget					=	{ {type=20,n=1,target="【个人】弱国任务"}}



x310213_var_ExpBonus					= 	0;
x310213_var_BonusItem					=	{}	

x310213_var_BonusMoney1               = 	0
x310213_var_BonusMoney2               =   0
x310213_var_BonusMoney3               =   0
--2013-09-04 18：30 降低经验倍率10为5
x300213_var_Exp_Drop               =   5

x310213_var_BonusChoiceItem           =   {}


--DECLARE_QUEST_INFO_STOP--


x310213_var_DayCountLimited			=	3

x310213_var_EnterTime					=	{                       
											{min=1*60+0,  max=23*60+59},
										}


x310213_var_ReplyNpcId = 126021

x310213_var_GameId	= 1021






x310213_var_BonusChoiceItem2   = {}



x310213_var_ItemId_Caiji =	13011008
x310213_var_ItemCount_Caiji = 1


x310213_var_ShouJi_Count	= 17
x310213_var_ShouJi_list = {
							12010200,
							12020001,
							12020002,
							12020003,
							12020004,
							12020005,
							12020006,
							12010300,
							12052531,
							12052471,
							12052481,
							12052491,
							11000100,
							11000110,
							14030001,
							14030006,
							14030011

						}


x310213_var_NeedKillCount	= 20*4

x310213_var_GpTypeStart = 711

x310213_var_NpcId			= 4



function x310213_GetQuestId( varMap, varPlayer )
	return x310213_var_QuestId
end

function x310213_Getruoguo(varMap, varPlayer )
	local maxlevel = GetTopListInfo_MaxLevel(GetWorldID(varMap, varPlayer))
	local nCountryIdx = GetCurCountry(varMap, varPlayer);
	
	local selfscore = GetCountryParam(varMap, nCountryIdx, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	
	local loulanscore   = GetCountryParam(varMap, 0, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	local tianshanscore = GetCountryParam(varMap, 1, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	local kunlunscore   = GetCountryParam(varMap, 2, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	local dunhuangscore = GetCountryParam(varMap, 3, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	local allscore		= loulanscore + tianshanscore + kunlunscore + dunhuangscore
	if maxlevel >= 70 then
		if selfscore <= allscore * 0.2 and selfscore > 0 and allscore > 0 then
			return 1
		else
			return 0
		end
	else 
		return 0
	end
	
end

function x310213_Getqiangguo(varMap, varPlayer )
	if GetCountryParam(varMap, 0,CD_STRONG_WEAK_LEVEL ) == 0 then
		return 0
	elseif GetCountryParam(varMap, 1,CD_STRONG_WEAK_LEVEL ) == 0 then
		return 1
	elseif GetCountryParam(varMap, 2,CD_STRONG_WEAK_LEVEL ) == 0 then
		return 2
	elseif GetCountryParam(varMap, 3,CD_STRONG_WEAK_LEVEL ) == 0 then
		return 3
	end
end

function x310213_GetTianfu(varMap, varPlayer )

	local lingdicha = 0
	local nCountryIdx = GetCurCountry(varMap, varPlayer);
	local qiangguo = x310213_Getqiangguo(varMap, varPlayer )
	local nLairdCount,nLairdSumLevel =  LuaCallNoclosure(888888,"GetCountryLairdSceneInfo",varMap,qiangguo)
	local nLairdCount1,nLairdSumLevel1 =  LuaCallNoclosure(888888,"GetCountryLairdSceneInfo", varMap, nCountryIdx)
	if nLairdCount > 0 then
		lingdicha = nLairdCount - nLairdCount1
	end
		
	local varLevel = GetLevel(varMap, varPlayer)
	local tianfu = floor(ceil(lingdicha / 2) * varLevel * 7.5 * 7)
	return tianfu

end



function x310213_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	if GetGameOpenById(x310213_var_GameId)<=0 then
		return
	end

	if IsPlayerStateNormal(varMap,varPlayer ) <= 0 then
		return
	end

	local varLevel = GetLevel( varMap,varPlayer )
    if varLevel < x310213_var_LevelLess then
       return
    end

	local varMyQuest = x310213_GetQuestId( varMap, varPlayer )
	local ruoguoopen = IsOpenWeakCountryCheck()
	local ruoguo = x310213_Getruoguo(varMap, varPlayer )
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) == 0 then
		if ruoguoopen == 1 then
			if ruoguo == 1 then
				TalkAppendButton(varMap, varMyQuest, x310213_var_QuestName,8,1);
			else
				return
			end
		elseif ruoguoopen == 0 then
		local varCountry = GetCurCountry(varMap, varPlayer)

		local nRank = GetCountryRank(varCountry)
		
		if nRank ==3 then
			TalkAppendButton(varMap, varMyQuest, x310213_var_QuestName,8,1);
		else
			return
		end
		end
		
	else
		local varState = GetQuestStateNM(varMap, varPlayer, varTalknpc, varMyQuest);

		
		TalkAppendButton(varMap, varMyQuest, x310213_var_QuestName,varState,varState);

	end


	DeliverTalkMenu(varMap, varPlayer, varTalknpc)


	
end





function x310213_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest, varExt )
	
	if GetGameOpenById(x310213_var_GameId)<=0 then
		x310213_ShowTips(varMap, varPlayer, "此活动未开启")
		return
	end

	local varMyQuest = x310213_GetQuestId( varMap, varPlayer )	
	
	

	
	
	
		
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) == 0 then
		local varCountry = GetCurCountry(varMap, varPlayer)
		local ruoguoopen = IsOpenWeakCountryCheck()
		local ruoguo = x310213_Getruoguo(varMap, varPlayer )
		local varCountry = GetCurCountry(varMap, varPlayer)

		local nRank = GetCountryRank(varCountry)
		if ruoguoopen == 1 then
			if ruoguo == 1 then
				x310213_DispatchQuestInfo( varMap, varPlayer, varTalknpc, varMyQuest, 0 )
			end
		elseif ruoguoopen == 0 then
		if nRank ==3 then
			x310213_DispatchQuestInfo( varMap, varPlayer, varTalknpc, varMyQuest, 0 )
		end
		end		
	else
		if varExt==7 then 
			x310213_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,varMyQuest )
			
			
		else
			
			x310213_DispatchContinueInfo( varMap, varPlayer, varTalknpc,varMyQuest )
		end
	end
	
end


function x310213_ProcAcceptCheck(varMap, varPlayer, varTalknpc, varQuest )
	
	if GetGameOpenById(x310213_var_GameId)<=0 then
		
		return 0;
	end
	return 1;

end

function x310213_CheckRequest(varMap, varPlayer)
	if GetGameOpenById(x310213_var_GameId)<=0 then
		x310213_ShowTips(varMap, varPlayer, "此活动未开启")
		return 0
	end

	local varMyQuest = x310213_GetQuestId( varMap, varPlayer )

	if GetLevel(varMap, varPlayer) <x310213_var_LevelLess then
		x310213_ShowTips(varMap, varPlayer, "等级不足")
		return 0
	end

	local ruoguoopen = IsOpenWeakCountryCheck()
	local ruoguo = x310213_Getruoguo(varMap, varPlayer )
	local varCountry = GetCurCountry(varMap, varPlayer)
	local nRank = GetCountryRank(varCountry)
	if ruoguoopen == 1 then
		if ruoguo ~=1 then
	
	
			x310213_ShowTips(varMap, varPlayer, "你所在国家不是弱国，不可以接此任务")
			return 0;
		end
	elseif ruoguoopen == 0 then
	if nRank ~=3 then
		x310213_ShowTips(varMap, varPlayer, "你所在国家不是弱国，不可以接此任务")
		return 0;
	end
	end

	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) > 0 then
		x310213_ShowTips(varMap, varPlayer, "你已经有这个任务，请先完成这个任务")
		return 0;
	end

	
	local week = GetWeek()
	if week==1 then
		local bInTime = 0
		local hour,minute,sec =GetHourMinSec();
		local nowtime = hour*60+minute
		
		for varI, item in x310213_var_EnterTime do
			if nowtime >= item.min and nowtime <= item.max then
				bInTime = 1
			end
		end

		if bInTime == 0 then
			x310213_ShowTips(varMap, varPlayer, "很抱歉，排行榜更新期间不允许接弱国任务，请01:00后再来")
			return 0;
		end
	end
	

	if x310213_var_DayCountLimited >0 then
		local varDayCount = x310213_GetDayCount(varMap, varPlayer)
		if varDayCount>= x310213_var_DayCountLimited then
			x310213_ShowTips(varMap, varPlayer, "很抱歉，您本周已经完成过三次【个人】弱国任务了，不能再来接取了！")
			return 0;
		end
	end

	

	return 1;

end



function x310213_ProcQuestAccept(varMap, varPlayer, varTalknpc, varQuest)
	local day, week = GetWeek()
	if day == 0 then
        Msg2Player( varMap, varPlayer, "很抱歉，周日不能接受【个人】弱国任务", 8, 3)
        return 0
    end

	if GetGameOpenById(x310213_var_GameId)<=0 then
		x310213_ShowTips(varMap, varPlayer, "此活动未开启")
		return 0;
	end

	if x310213_CheckRequest(varMap, varPlayer)<=0 then
		
		return 0;
	end

	local varMyQuest = x310213_GetQuestId( varMap, varPlayer )

	local questType = x310213_GetQuestType(varMap, varPlayer)


	if questType==2 then
		local myGuid = GetPlayerGUID( varMap,varPlayer )
		GetCountryQuestDataNM(varMap,myGuid,0, CD_INDEX_RUOGUO_SHOUJI_DATE, x310213_var_FileId,-1,"ProcGetRuoguoDate",1)
		return 1
	end

	
	local varFullQuest = IsQuestFullNM(varMap,varPlayer)
	
	if varFullQuest>0 then
		x310213_ShowTips(varMap, varPlayer, "任务已满，无法接受任务")
		return 0
	end
	


	


	

	local varRet = AddQuest( varMap, varPlayer, varMyQuest, x310213_var_FileId, 1, 0, 1,0)
		
	if varRet > 0 then
		local varStr = "您接受了任务："..x310213_var_QuestName;
		x310213_ShowTips(varMap, varPlayer, varStr)
		Msg2Player(varMap,varPlayer,varStr,8,2)
		
		local varMyQuest = x310213_GetQuestId( varMap, varPlayer )
		local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 5, 0 )

		x310213_GiveSubQuest(varMap, varPlayer, varTalknpc, varMyQuest,questType,-1)
		GamePlayScriptLog(varMap, varPlayer, 1271)
		return 1
	else
		
		x310213_ShowTips(varMap, varPlayer, "接受任务错误")
	
	end


end

function x310213_GetQuestType(varMap, varPlayer)

	local nLastFlag = GetPlayerGameData(varMap, varPlayer, MD_RUOGUO_NEW_TASK_FLAG[1], MD_RUOGUO_NEW_TASK_FLAG[2], MD_RUOGUO_NEW_TASK_FLAG[3])

	if nLastFlag==0 then
		
		return 1
	elseif nLastFlag==1 then
		return 2
	elseif nLastFlag==2 then
		return 3
	else
		
	end
	
	
  
end

function x310213_SaveQuestType(varMap, varPlayer)

	local nLastFlag = GetPlayerGameData(varMap, varPlayer, MD_RUOGUO_NEW_TASK_FLAG[1], MD_RUOGUO_NEW_TASK_FLAG[2], MD_RUOGUO_NEW_TASK_FLAG[3])

	if nLastFlag<2 then
		
		SetPlayerGameData(varMap, varPlayer, MD_RUOGUO_NEW_TASK_FLAG[1], MD_RUOGUO_NEW_TASK_FLAG[2], MD_RUOGUO_NEW_TASK_FLAG[3],nLastFlag+1)
	else
		SetPlayerGameData(varMap, varPlayer, MD_RUOGUO_NEW_TASK_FLAG[1], MD_RUOGUO_NEW_TASK_FLAG[2], MD_RUOGUO_NEW_TASK_FLAG[3],0)
	end
	
	
  
end




function x310213_GiveSubQuest(varMap, varPlayer, varTalknpc, varQuest, questType,nItemIndex)
	
	if GetGameOpenById(x310213_var_GameId)<=0 then
		x310213_ShowTips(varMap, varPlayer, "此活动未开启")
		return 0;
	end
	local varMyQuest = x310213_GetQuestId( varMap, varPlayer )

	
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )
	SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 0 )
	SetQuestByIndex( varMap, varPlayer, varQuestIdx, 5, 1 )  
	SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 0 )

	
	SetQuestByIndex( varMap, varPlayer, varQuestIdx, 1, questType )
	SetQuestByIndex( varMap, varPlayer, varQuestIdx, 2, 0 )
	SetQuestByIndex( varMap, varPlayer, varQuestIdx, 3, 0 )

	x310213_SaveQuestType(varMap, varPlayer)

	
	if questType==1 then
		local nLevel = GetLevel(varMap, varPlayer)
		
		local nGpIndex =0
		if nLevel<30 then
			nGpIndex = 1
		elseif nLevel<40 then
			nGpIndex = 2
		elseif nLevel<50 then
			nGpIndex = 3
		elseif nLevel<60 then
			nGpIndex = 4
		elseif nLevel<70 then
			nGpIndex = 5
		else
			nGpIndex = 6
		end

		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 3, nGpIndex )

		
	elseif questType==2 then

		
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 4, nItemIndex )

		local varCount = 1

		if nItemIndex<=8 then
			varCount =3
		end

		varCount = varCount*4

		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 3, varCount )
			



		x310213_ProcQuestItemChanged( varMap, varPlayer, x310213_var_ShouJi_list[nItemIndex], varMyQuest, -1, varCount)



		
		
	end

	if varTalknpc~=nil  then

		if varTalknpc>0 then
	
			x310213_ShowSubQuest( varMap, varPlayer, varTalknpc,varQuest, nItemIndex )
		end
	end

	x310213_QuestLogRefresh( varMap, varPlayer, varMyQuest );


end



function x310213_ProcGetRuoguoDate(varMap, varPlayer,QuestData,varQuest)

	
	
	local thisweek = x310213_GetWeekOfYear()

	

	if thisweek~=QuestData then
		SetCountryQuestData(varMap, 0, CD_INDEX_RUOGUO_SHOUJI_DATE,thisweek)

		local nItemIndex =random(1, x310213_var_ShouJi_Count)

		SetCountryQuestData(varMap, 0, CD_INDEX_RUOGUO_SHOUJI_FLAG,nItemIndex)

		x310213_ProcCompleteFlag(varMap, varPlayer, nItemIndex)
		
	else
		local myGuid = GetPlayerGUID( varMap,varPlayer )
		GetCountryQuestDataNM(varMap,myGuid,0, CD_INDEX_RUOGUO_SHOUJI_FLAG, x310213_var_FileId,-1,"ProcGetRuoguoShoujiFlag",1)
	end

	
end

function x310213_ProcGetRuoguoShoujiFlag(varMap, varPlayer,QuestData,varQuest)

	

	x310213_ProcCompleteFlag(varMap, varPlayer, QuestData)
	
end


function x310213_ProcCompleteFlag(varMap, varPlayer, nItemIndex)

	
	
	if nItemIndex<0 or nItemIndex>x310213_var_ShouJi_Count then
		return
	end

	if GetGameOpenById(x310213_var_GameId)<=0 then
		x310213_ShowTips(varMap, varPlayer, "【个人】弱国任务未开启")
		return 0;
	end


	local questType = x310213_GetQuestType(varMap, varPlayer)

	if questType~=2 then
		return
	end

	if x310213_CheckRequest(varMap, varPlayer)<=0 then
		
		return 0;
	end

	local varMyQuest = x310213_GetQuestId( varMap, varPlayer )

	


	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) > 0 then
		return
	end

	
	local varFullQuest = IsQuestFullNM(varMap,varPlayer)
	
	if varFullQuest>0 then
		x310213_ShowTips(varMap, varPlayer, "任务已满，无法接受任务")
		return 0
	end
	

	
	

	

	local varRet = AddQuest( varMap, varPlayer, varMyQuest, x310213_var_FileId, 1, 0, 1,0)
		
	if varRet > 0 then
		local varStr = "您接受了任务："..x310213_var_QuestName;
		x310213_ShowTips(varMap, varPlayer, varStr)
		Msg2Player(varMap,varPlayer,varStr,8,2)
		
		local varMyQuest = x310213_GetQuestId( varMap, varPlayer )
		local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 5, 0 )

		x310213_GiveSubQuest(varMap, varPlayer, -1, varMyQuest,questType,nItemIndex)
		GamePlayScriptLog(varMap, varPlayer, 1271)
		return 1
	else
		
		x310213_ShowTips(varMap, varPlayer, "接受任务错误")
	
	end



end

function x310213_ShowTips(varMap, varPlayer, varStr)
	StartTalkTask(varMap);
		TalkAppendString(varMap,varStr);
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
end

function x310213_ProcQuestAbandon( varMap, varPlayer, varQuest )

	local varMyQuest = x310213_GetQuestId( varMap, varPlayer )
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) <= 0 then	
		return 0
	end

	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )


	local value2 = GetQuestParam( varMap, varPlayer, varQuestIdx, 1 )


	

	local varRet = DelQuestNM( varMap, varPlayer, varMyQuest )

	if varRet>0 then

		local varStr = "您放弃了任务:"..x310213_var_QuestName;
	    x310213_ShowTips(varMap, varPlayer, varStr)
		Msg2Player(varMap,varPlayer,varStr,8,2)

		if value2==1 then
		
			local Num = GetItemCount( varMap, varPlayer, x310213_var_ItemId_Caiji )

			if Num>0 then
				if DelItem(varMap, varPlayer, x310213_var_ItemId_Caiji, Num) ~= 1 then return 0 end
			end	
		elseif value2==2 then
			
			
			
			

			
			
			
			
		end

		x310213_SetDayCount(varMap, varPlayer)

		
		
	else
		x310213_ShowTips(varMap, varPlayer, "放弃任务失败")
	end

	
end



function x310213_ProcQuestSubmit( varMap, varPlayer, varTalknpc, varRadioSelected, varQuest )
	
	
	
	if GetGameOpenById(x310213_var_GameId)<=0 then
		x310213_ShowTips(varMap, varPlayer, "此活动未开启")
		return 0;
	end

	local day, week = GetWeek()
	if day == 0 then
        Msg2Player( varMap, varPlayer, "很抱歉，周日不能交付【个人】弱国任务", 8, 3)
        return
    end

	local varMyQuest = x310213_GetQuestId( varMap, varPlayer )

	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) <= 0 then	
		return 0
	end

	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )


	local value2 = GetQuestParam( varMap, varPlayer, varQuestIdx, 1 )

	local nItemIndex=-1
	local varCount = 0
	if value2==2 then
		nItemIndex =GetQuestParam( varMap, varPlayer, varQuestIdx, 4 )
		varCount =GetQuestParam( varMap, varPlayer, varQuestIdx, 3 )
	end
	
	if x310213_CheckSubmit(varMap, varPlayer )>0 then
		
		local varRet = DelQuestNM( varMap, varPlayer, varMyQuest )

		if varRet>0 then

			local varStr = "您完成了任务:"..x310213_var_QuestName;
			x310213_ShowTips(varMap, varPlayer, varStr)
			Msg2Player(varMap,varPlayer,varStr,8,2)

			
			
			x310213_GiveReward(varMap,varPlayer, value2,nItemIndex,varCount)


			x310213_SetDayCount(varMap, varPlayer)
			x310213_SetDaySuccessCount(varMap, varPlayer)


			GamePlayScriptLog(varMap, varPlayer, 1272)
			
		else
			x310213_ShowTips(varMap, varPlayer, "交任务失败")
		end
		
	end
end



function x310213_GiveReward(varMap,varPlayer,value2, varExt, nExt2)
	
	if GetGameOpenById(x310213_var_GameId)<=0 then
		x310213_ShowTips(varMap, varPlayer, "此活动未开启")
		return 0;
	end


	
	

	if value2==1 then
	
		local Num = GetItemCount( varMap, varPlayer, x310213_var_ItemId_Caiji )

		if Num>0 then
			if DelItem(varMap, varPlayer, x310213_var_ItemId_Caiji, Num) ~= 1 then return 0 end
		end
	elseif value2==2 then
		
		local Num = GetItemCount( varMap, varPlayer, x310213_var_ShouJi_list[varExt] )
		
		

		if Num>=nExt2 then

			if DelItem(varMap, varPlayer, x310213_var_ShouJi_list[varExt] , nExt2) ~= 1 then return 0 end
		end
		
	end
	

	local daySuccessCount = x310213_GetDaySuccessCount(varMap, varPlayer)+1
	local varLevel = GetLevel(varMap, varPlayer)
	local nCountryIdx = GetCurCountry(varMap, varPlayer);
	local selfscore = GetCountryParam(varMap, nCountryIdx, CD_LASTWEEK_STRONG_WEAK_JIFEN)	
	local loulanscore   = GetCountryParam(varMap, 0, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	local tianshanscore = GetCountryParam(varMap, 1, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	local kunlunscore   = GetCountryParam(varMap, 2, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	local dunhuangscore = GetCountryParam(varMap, 3, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	local allscore		= loulanscore + tianshanscore + kunlunscore + dunhuangscore
	local multi = 0
	if selfscore > 0 and allscore > 0 then
		 multi = allscore*0.25/selfscore
	end
	local tf = x310213_GetTianfu(varMap, varPlayer )
	local varExp1 = varLevel * 10000*4*x300213_var_Exp_Drop
	local exp2 = varLevel * 20000*4*x300213_var_Exp_Drop
	local exp3 = varLevel * 30000*4*x300213_var_Exp_Drop
	local varExp_multi1 = floor(varLevel * 10000*4*multi)
	local exp_multi2 =floor(varLevel * 20000*4*multi)
	local exp_multi3 = floor(varLevel * 30000*4*multi)
	if varExp_multi1 >= varExp1*2 then 
		varExp_multi1 = varExp1*2
	end
	if exp_multi2 >= exp2*2 then
		exp_multi2 = exp2*2
	end
	if exp_multi3 >= exp3*2 then
		exp_multi3 = exp3*2
	end	
	if daySuccessCount==1 then
		AddExp(varMap,varPlayer,varExp1)
		Msg2Player(varMap,varPlayer, "#o您获得了#R经验"..varExp1.."点#o的奖励",8,3);
		Msg2Player(varMap,varPlayer,"#o您完成了【个人】弱国任务任务，获得了#R经验"..varExp1.."点#o的奖励",4,2)
			if x310213_IsMinGuo(varMap, varPlayer) == 1 then
				AddExp(varMap,varPlayer,varExp_multi1)
  			Msg2Player(varMap, varPlayer,"#o弱国额外获得#R经验"..varExp_multi1.."点#o的奖励",8,3);
  			Msg2Player( varMap, varPlayer, "#o弱国额外获得#R"..varExp_multi1.."#cffcc00点经验", 8, 2)
  		end  		
	elseif daySuccessCount==2 then
		AddExp(varMap,varPlayer,exp2)
		Msg2Player(varMap,varPlayer, "#o您获得了#R经验"..exp2.."点#o的奖励",8,3);
		Msg2Player(varMap,varPlayer,"#o您完成了【个人】弱国任务 ，获得了#R经验"..exp2.."点#o的奖励",4,2)
  			if x310213_IsMinGuo(varMap, varPlayer) == 1 then
  				AddExp(varMap,varPlayer,exp_multi2)
  				Msg2Player(	varMap, varPlayer,"#o弱国额外获得#R经验"..exp_multi2.."点#o的奖励",8,3);
  				Msg2Player( varMap, varPlayer,"#o弱国额外获得#R"..exp_multi2.."#cffcc00点经验", 8, 2)  
  			end	
	elseif daySuccessCount==3 then
		local ruoguoopen = IsOpenWeakCountryCheck()
		if ruoguoopen == 1 then
			if varLevel >=40 then
				StartItemTask(varMap)
				ItemAppendBind( varMap, 12035211, 1 )
				local varRet = StopItemTask(varMap,varPlayer)
				if varRet > 0 then	
					DeliverItemListSendToPlayer(varMap,varPlayer)
				else
					Msg2Player(varMap,varPlayer,"物品栏已满，无法得到任务物品！",8,2)
					Msg2Player(varMap,varPlayer,"物品栏已满，无法得到任务物品！",8,3)
				end
			end
			
			if varLevel>=80 then
				if tf > 0 then
				local refixtf = AddInherenceExp( varMap, varPlayer, tf)
				Msg2Player( varMap, varPlayer, format( "弱国额外获得#R天赋%s点#o的奖励。", refixtf), 4, 2)
				StartTalkTask(varMap);
				TalkAppendString(varMap, "#o弱国额外获得#R天赋"..refixtf.."点#o的奖励");
				StopTalkTask();
				DeliverTalkTips(varMap, varPlayer);
			end
		end		
		end		
		AddExp(varMap,varPlayer,exp3)
		Msg2Player(varMap,varPlayer, "#o您获得了#R经验"..exp3.."点#o的奖励",8,3);
		Msg2Player(varMap,varPlayer,"#o您完成了【个人】弱国任务，获得了#R经验"..exp3.."点#o的奖励",4,2)
			 	if x310213_IsMinGuo(varMap, varPlayer) == 1 then
  				AddExp(varMap,varPlayer,exp_multi3)
  				Msg2Player(varMap, varPlayer,"#o弱国额外获得#R经验"..exp_multi3.."点#o的奖励",8,3);
  				Msg2Player( varMap, varPlayer, "#o弱国额外获得#R"..exp_multi3.."#cffcc00点经验", 8, 2)
  			end 		
		

	else
		return
	end

	
	

	
	
	
	
end



function x310213_CheckSubmit(varMap, varPlayer )
	
	if GetGameOpenById(x310213_var_GameId)<=0 then
		x310213_ShowTips(varMap, varPlayer, "此活动未开启")
		return 0;
	end

	local varMyQuest = x310213_GetQuestId( varMap, varPlayer )
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) <= 0 then	
		return 0
	end

	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )
	local varCompleted = GetQuestParam( varMap, varPlayer, varQuestIdx, 7 )


	local value2 = GetQuestParam( varMap, varPlayer, varQuestIdx, 1 )
	

	if (varCompleted)<=0 then
		return 0
	end

	if value2==1 then
		local Num = GetItemCount( varMap, varPlayer, x310213_var_ItemId_Caiji )
			
		if Num>=x310213_var_ItemCount_Caiji then
			return 1
		
		end

	elseif value2==2 then
		
		local nItemIndex = GetQuestParam( varMap, varPlayer, varQuestIdx, 4 )
		local Num = GetItemCount( varMap, varPlayer, x310213_var_ShouJi_list[nItemIndex] )

		local varCount = GetQuestParam( varMap, varPlayer, varQuestIdx, 3 )
		
		if  Num>=varCount then
			return 1
		end
		
		
	elseif value2==3 then
		local value1 = GetQuestParam( varMap, varPlayer, varQuestIdx, 0 )
		if value1>=x310213_var_NeedKillCount then
			return 1
		end
	end

	return 0;
end






function x310213_DispatchQuestInfo( varMap, varPlayer, varTalknpc, varQuest, varExt )

	
	
	StartTalkTask(varMap)

		
	
	TalkAppendString(varMap,"#Y"..x310213_var_QuestName)
	TalkAppendString(varMap,"\n\t#Y@myname#W，我们的国家目前正在遭受内忧外患的折磨，这严重影响了国家的发展，使得国家的实力每况愈下，在四大王国中，我们目前的实力排在最后。\n\t当等级排行榜第一名达到#R70级#W时，会开启弱国任务，只有每个国民都行动起来，积极为国家做出自己的贡献，才能摆脱这种局面，将我国变为强国！\n\t为此，我这里有一些任务需要你去完成。\n\t#G（本任务一周可领取三次，周日不可领取或交付本任务。）")
	TalkAppendString(varMap," ")
	TalkAppendString( varMap,"#Y任务目标:")
			
	TalkAppendString( varMap,x310213_var_QuestTarget)
	TalkAppendString(varMap," ")

	
	local varLevel = GetLevel(varMap, varPlayer)
	local varExpBonus = varLevel*0;
	local daySuccessCount = x310213_GetDaySuccessCount(varMap, varPlayer)+1
	local tianfu =x310213_GetTianfu(varMap, varPlayer )
	local tianfu1 =	RefixInherenceExp(varMap, varPlayer, tianfu)
	
	if daySuccessCount==1 then
		varExpBonus = varLevel * 10000
	elseif daySuccessCount==2 then
		varExpBonus = varLevel * 20000
	elseif daySuccessCount==3 then
		varExpBonus = varLevel * 30000
		local ruoguoopen = IsOpenWeakCountryCheck()
		if ruoguoopen == 1 then
			if varLevel >=40 then
				AddQuestItemBonus(varMap, 12035211 ,1 )
			end
			if varLevel >= 80 then
				if tianfu > 0 then
				AddQuestInherenceExpBonus(varMap,tianfu1)
			end
		end
		end
	else
		
	end

	varExpBonus = varExpBonus*4*x300213_var_Exp_Drop
	
	if varExpBonus > 0 then
		AddQuestExpBonus( varMap, varExpBonus)
	end

	

	StopTalkTask()
	
	DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x310213_var_FileId, varQuest,0);
end





function x310213_DispatchContinueInfo( varMap, varPlayer, varTalknpc,varQuest )

	local varMyQuest = x310213_GetQuestId( varMap, varPlayer )
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) <= 0 then	
		return 0
	end

	
	
	
	StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..x310213_var_QuestName)
		TalkAppendString(varMap," ")
		TalkAppendString(varMap,"\t您还没有完成本次任务，请赶快去完成吧！")
	
		

	StopTalkTask()
	DeliverTalkRequire(varMap, varPlayer, varTalknpc, x310213_var_FileId, varQuest,0);
	


end










function x310213_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,varQuest )
	local varMyQuest = x310213_GetQuestId( varMap, varPlayer )
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) <= 0 then	
		return 0
	end

	
	

	StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..x310213_var_QuestName)
		TalkAppendString(varMap,"\t#Y@myname#W，感谢你所做出的贡献，相信在大家的共同努力下，我们的国家一定会很快强盛起来。")
	
	
	
	
	local varLevel = GetLevel(varMap, varPlayer)
	local varExpBonus = varLevel*0;

	varExpBonus = varExpBonus*4*x300213_var_Exp_Drop
	
	if varExpBonus > 0 then
		AddQuestExpBonus( varMap, varExpBonus)
	end

	
		
	StopTalkTask()
	
	DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x310213_var_FileId, varQuest);

end





function x310213_ShowSubQuest( varMap, varPlayer, varTalknpc,varQuest, varExt )


	
	local varMyQuest = x310213_GetQuestId( varMap, varPlayer )
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) <= 0 then	
		return 0
	end

	
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )
	local value2 = GetQuestParam( varMap, varPlayer, varQuestIdx, 1 )


	
	StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..x310213_var_QuestName)
		
		if value2==1 then
			local str1 = " "

			local nGpIndex = GetQuestParam( varMap, varPlayer, varQuestIdx, 3)

			if nGpIndex==1 then
				str1 = "请到gp1寻找找寻这种珍贵药材"
			elseif nGpIndex==2 then
				str1 = "请到gp2寻找找寻这种珍贵药材" 
			elseif nGpIndex==3 then
				str1 = "请到gp3寻找找寻这种珍贵药材" 
			elseif nGpIndex==4 then
				str1 = "请到gp4寻找找寻这种珍贵药材" 
			elseif nGpIndex==5 then
				str1 = "请到gp5寻找找寻这种珍贵药材" 
			elseif nGpIndex==6 then
				str1 = "请到gp6寻找找寻这种珍贵药材" 
			else
				
			end
			TalkAppendString(varMap,str1)
		elseif value2==2 then
			local nItemIndex = GetQuestParam( varMap, varPlayer, varQuestIdx, 4 )
	

			
			local varStr = format("收集4个@itemid_%d",x310213_var_ShouJi_list[nItemIndex])

			
			TalkAppendString(varMap,varStr)
		elseif value2==3 then
			local varStr = "杀怪...."
			TalkAppendString(varMap,varStr)
		else
			return 0
		end
		
	
		

	StopTalkTask()
	DeliverTalkRequire(varMap, varPlayer, varTalknpc, x310213_var_FileId, varMyQuest,0);
	


end










function x310213_QuestLogRefresh( varMap, varPlayer, varQuest)
	
	
		
	StartTalkTask(varMap)	
			
		
	AddQuestLogCustomText( varMap,
							"",						
							x310213_GetQuestName(varMap,varPlayer),        
							x310213_GetQuestTask(varMap,varPlayer),		
							"@npc_"..x310213_GetReplyNpcId(varMap,varPlayer),			
							x310213_GetQuestMethod(varMap,varPlayer),               
							x310213_GetQuestText(varMap,varPlayer),	
							x310213_GetQuestHelp(varMap,varPlayer)					
							)

	
	local varLevel = GetLevel(varMap, varPlayer)
	local varExpBonus = varLevel*0;
	local daySuccessCount = x310213_GetDaySuccessCount(varMap, varPlayer)+1
	local tianfu = x310213_GetTianfu(varMap, varPlayer )
	local tianfu1 =	RefixInherenceExp(varMap, varPlayer, tianfu)
	
	if daySuccessCount==1 then
		varExpBonus = varLevel * 10000
	elseif daySuccessCount==2 then
		varExpBonus = varLevel * 20000
	elseif daySuccessCount==3 then
		varExpBonus = varLevel * 30000
		local ruoguoopen = IsOpenWeakCountryCheck()
		if ruoguoopen == 1 then
			if varLevel >=40 then
				AddQuestItemBonus(varMap, 12035211 , 1 )
			end
			if varLevel >= 80 then
				if tianfu > 0 then
				AddQuestInherenceExpBonus(varMap,tianfu1)
				end
			end
		end
	else
		return
	end
	
	varExpBonus = varExpBonus*4

	if varExpBonus > 0 then
		AddQuestExpBonus( varMap, varExpBonus)
	end

	
	StopTalkTask()
	DeliverTalkRefreshQuest(varMap, varPlayer, varQuest);
	

end

function x310213_GetQuestName(varMap,varPlayer)
	

	return x310213_var_QuestName;
end

function x310213_GetQuestTask(varMap,varPlayer)
	local varMyQuest = x310213_GetQuestId( varMap, varPlayer )
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )

	
	
	local value1 = GetQuestParam( varMap, varPlayer, varQuestIdx, 0 )

	local value2 = GetQuestParam( varMap, varPlayer, varQuestIdx, 1 )

	

	local strTable = "  ";
	local str1 = ""

	if value2==1 then
		local nGpIndex = GetQuestParam( varMap, varPlayer, varQuestIdx, 3)

		if nGpIndex==1 then
			str1 = "  请到王城寻找@npc_81010(%d/%d)"
		elseif nGpIndex==2 then
			str1 = "  请到王城寻找@npc_81011(%d/%d)" 
		elseif nGpIndex==3 then
			str1 = "  请到边塞寻找@npc_81012(%d/%d)" 
		elseif nGpIndex==4 then
			str1 = "  请到大都寻找@npc_81013(%d/%d)" 
		elseif nGpIndex==5 then
			str1 = "  请到威海港寻找@npc_85058(%d/%d)" 
		elseif nGpIndex==6 then
			str1 = "  请到威海港寻找@npc_85059(%d/%d)" 
		else
			
		end

		str1 = format(str1,value1,x310213_var_ItemCount_Caiji)

		
	elseif value2==2 then
		local nItemIndex = GetQuestParam( varMap, varPlayer, varQuestIdx, 4 )
		
		local varCount = GetQuestParam( varMap, varPlayer, varQuestIdx, 3 )
	
		if value1>=varCount then
			value1 = varCount
		else
			
		end
			
		str1 = format("  收集@itemid_%d(%d/%d)",x310213_var_ShouJi_list[nItemIndex],value1,varCount)
	elseif value2==3 then
		str1 = format("  杀死不低于自己等级的怪物(%d/%d)", value1, x310213_var_NeedKillCount)
	end

	if value1>=1 then
		str1 = "#G"..str1
	else
		str1 = "#W"..str1
	end

	return str1
end

function x310213_GetReplyNpcId(varMap,varPlayer)
	return x310213_var_ReplyNpcId;
end

function x310213_GetQuestMethod(varMap,varPlayer)
	local varMyQuest = x310213_GetQuestId( varMap, varPlayer )
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )


	local value2 = GetQuestParam( varMap, varPlayer, varQuestIdx, 1 )

	

	local strTable = "  ";
	local str1 = ""

	if value2==1 then

		local nGpIndex = GetQuestParam( varMap, varPlayer, varQuestIdx, 3)

		if nGpIndex==1 then
			str1 = "请到王城寻找@npc_81010"
		elseif nGpIndex==2 then
			str1 = "请到王城寻找@npc_81011" 
		elseif nGpIndex==3 then
			str1 = "请到边塞寻找@npc_81012" 
		elseif nGpIndex==4 then
			str1 = "请到大都寻找@npc_81013" 
		elseif nGpIndex==5 then
			str1 = "请到威海港寻找@npc_85058" 
		elseif nGpIndex==6 then
			str1 = "请到威海港寻找@npc_85059" 
		else
			
		end
		
	elseif value2==2 then
		local nItemIndex = GetQuestParam( varMap, varPlayer, varQuestIdx, 4 )
		
		local varCount = GetQuestParam( varMap, varPlayer, varQuestIdx, 3 )

			
		str1 = format("收集%d个@itemid_%d。",varCount,x310213_var_ShouJi_list[nItemIndex])
		
		
	elseif value2==3 then
		str1 = "杀死不低于自己等级的怪物80只。"
	end

	return str1
end

function x310213_GetQuestText(varMap,varPlayer)
	
	local varMyQuest = x310213_GetQuestId( varMap, varPlayer )
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )


	local value2 = GetQuestParam( varMap, varPlayer, varQuestIdx, 1 )

	

	local strTable = "  ";
	local str1 = ""

	if value2==1 then
		str1 = "\t国家现在急需一些珍贵的药材来配置良药，以治疗正在国内蔓延的一种疾病，我想这么有侠义心肠的你一定愿意帮我去寻找这些急需的药材吧。"
	elseif value2==2 then
		local nItemIndex = GetQuestParam( varMap, varPlayer, varQuestIdx, 4 )
	

			
		str1 = format("\t为了对抗外来的侵犯，国家急需一些补给物资来加强国防能力，请快去找些@itemid_%d捐献给国库。",x310213_var_ShouJi_list[nItemIndex])
		
	elseif value2==3 then
		str1 = "国家总是被一些怪人和怪兽骚扰，使国民生活在恐慌之中，请去好好教训下这些怪物，为民除害。"
	end
	
	return str1	
end

function x310213_GetQuestHelp(varMap,varPlayer)
	local varMyQuest = x310213_GetQuestId( varMap, varPlayer )
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )


	local value2 = GetQuestParam( varMap, varPlayer, varQuestIdx, 1 )

	

	local strTable = "  ";
	local str1 = ""

	if value2==1 then
		
		local nGpIndex = GetQuestParam( varMap, varPlayer, varQuestIdx, 3)

		if nGpIndex==1 then
			str1 = "请在王城内找到国家所需要的药材"
		elseif nGpIndex==2 then
			str1 = "请在王城内找到国家所需要的药材" 
		elseif nGpIndex==3 then
			str1 = "请在边塞找到国家所需要的药材" 
		elseif nGpIndex==4 then
			str1 = "请在大都找到国家所需要的药材" 
		elseif nGpIndex==5 then
			str1 = "请在威海港找到国家所需要的药材" 
		elseif nGpIndex==6 then
			str1 = "请在威海港找到国家所需要的药材" 
		else
			
		end
	elseif value2==2 then
		local nItemIndex = GetQuestParam( varMap, varPlayer, varQuestIdx, 4 )
	

			
		str1 = format("@itemid_%d可以通过生活技能产出或从其他玩家那里购买获得。",x310213_var_ShouJi_list[nItemIndex])
	elseif value2==3 then
		str1 = "杀死大于等于自己等级的怪物即可。"
	end
	
	return str1
end



function x310213_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
	
	x310213_QuestLogRefresh( varMap, varPlayer, varQuest );
end


function x310213_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID,varQuestIdx, varQuest )
	
	
	
	
	

	
end






function x310213_GetDayCount(varMap, varPlayer)



	local thisweek = x310213_GetWeekOfYear()

	
	local lastweek = GetPlayerGameData(varMap, varPlayer, MD_RUOGUO_NEW_DATE[1], MD_RUOGUO_NEW_DATE[2],MD_RUOGUO_NEW_DATE[3] );
	

	if lastweek ~= thisweek then
		return 0
	end

	local weekcount = GetPlayerGameData(varMap, varPlayer, MD_RUOGUO_NEW_DAYCOUNT[1], MD_RUOGUO_NEW_DAYCOUNT[2],MD_RUOGUO_NEW_DAYCOUNT[3] );

	
	return weekcount;



	

end




function x310213_SetDayCount(varMap, varPlayer)

	local thisweek = x310213_GetWeekOfYear()

	local lastweek = GetPlayerGameData(varMap, varPlayer, MD_RUOGUO_NEW_DATE[1], MD_RUOGUO_NEW_DATE[2], MD_RUOGUO_NEW_DATE[3])

	
	if lastweek ~= thisweek then
		SetPlayerGameData(varMap, varPlayer, MD_RUOGUO_NEW_DATE[1], MD_RUOGUO_NEW_DATE[2], MD_RUOGUO_NEW_DATE[3], thisweek)
		SetPlayerGameData(varMap, varPlayer, MD_RUOGUO_NEW_DAYCOUNT[1], MD_RUOGUO_NEW_DAYCOUNT[2], MD_RUOGUO_NEW_DAYCOUNT[3], 1)
		SetPlayerGameData(varMap, varPlayer, MD_RUOGUO_NEW_DAY_SUCCESS_COUNT[1], MD_RUOGUO_NEW_DAY_SUCCESS_COUNT[2], MD_RUOGUO_NEW_DAY_SUCCESS_COUNT[3], 0)
	else
		local weekcount = GetPlayerGameData(varMap, varPlayer, MD_RUOGUO_NEW_DAYCOUNT[1], MD_RUOGUO_NEW_DAYCOUNT[2], MD_RUOGUO_NEW_DAYCOUNT[3])
		SetPlayerGameData(varMap, varPlayer, MD_RUOGUO_NEW_DAYCOUNT[1], MD_RUOGUO_NEW_DAYCOUNT[2], MD_RUOGUO_NEW_DAYCOUNT[3], weekcount+1)
	end
	
	
	
end




function x310213_GetDaySuccessCount(varMap, varPlayer)



	local thisweek = x310213_GetWeekOfYear()
	local lastweek = GetPlayerGameData(varMap, varPlayer, MD_RUOGUO_NEW_DATE[1], MD_RUOGUO_NEW_DATE[2],MD_RUOGUO_NEW_DATE[3] );
	
	if lastweek ~= thisweek then
		return 0
	end

	local weekcount = GetPlayerGameData(varMap, varPlayer, MD_RUOGUO_NEW_DAY_SUCCESS_COUNT[1], MD_RUOGUO_NEW_DAY_SUCCESS_COUNT[2],MD_RUOGUO_NEW_DAY_SUCCESS_COUNT[3] );
	return weekcount;



	

end




function x310213_SetDaySuccessCount(varMap, varPlayer)

	local thisweek = x310213_GetWeekOfYear()

	local lastweek = GetPlayerGameData(varMap, varPlayer, MD_RUOGUO_NEW_DATE[1], MD_RUOGUO_NEW_DATE[2], MD_RUOGUO_NEW_DATE[3])

	if lastweek ~= thisweek then
		
		SetPlayerGameData(varMap, varPlayer, MD_RUOGUO_NEW_DAY_SUCCESS_COUNT[1], MD_RUOGUO_NEW_DAY_SUCCESS_COUNT[2], MD_RUOGUO_NEW_DAY_SUCCESS_COUNT[3], 1)
	else
		local weekcount = GetPlayerGameData(varMap, varPlayer, MD_RUOGUO_NEW_DAY_SUCCESS_COUNT[1], MD_RUOGUO_NEW_DAY_SUCCESS_COUNT[2], MD_RUOGUO_NEW_DAY_SUCCESS_COUNT[3])
		SetPlayerGameData(varMap, varPlayer, MD_RUOGUO_NEW_DAY_SUCCESS_COUNT[1], MD_RUOGUO_NEW_DAY_SUCCESS_COUNT[2], MD_RUOGUO_NEW_DAY_SUCCESS_COUNT[3], weekcount+1)
	end
	
	
	
end

function x310213_CheckSceneOnKill(varMap, varPlayer)
	return 1
end






function x310213_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
	
	local varMyQuest = x310213_GetQuestId( varMap, varPlayer )

	

	
	

	local HumenNum = GetMonsterOwnerCount( varMap, varObj ) 
	for varI = 0, HumenNum-1 do
		local humanObjId = GetMonsterOwnerID( varMap, varObj, varI ) 
		if humanObjId ~= -1 then
			if IsHaveQuestNM( varMap, humanObjId, varMyQuest ) > 0 then	
				x310213_ProcValidKillObject( varMap, humanObjId, varObjData, varObj, varMyQuest )
			end
		end
	end
	
end

function x310213_ProcValidKillObject( varMap, varPlayer, varObjData, varObj, varQuest )

	if x310213_CheckSceneOnKill(varMap, varPlayer)<=0 then
		return 0;
	end



	local varMyQuest = x310213_GetQuestId( varMap, varPlayer )
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )

	
	local varCompleted = GetQuestParam( varMap, varPlayer, varQuestIdx, 7 )

	if varCompleted>0 then
		return
	end

	local value2 = GetQuestParam( varMap, varPlayer, varQuestIdx, 1 )


	
	if value2~=3 then
		return
	end

	
	local level1 = GetLevel(varMap,varObj)
	local level2 = GetLevel(varMap,varPlayer)

	if level1<level2 then
		return 
	end
	
	local value1 = GetQuestParam( varMap, varPlayer, varQuestIdx, 0 )

	

	SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, value1+1 )

	if (value1+1)>=x310213_var_NeedKillCount then
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1 )
	end

	x310213_ShowTips(varMap, varPlayer, format("【个人】弱国任务杀怪(%d/%d)",value1+1,x310213_var_NeedKillCount))

	x310213_QuestLogRefresh( varMap, varPlayer, varMyQuest );
	
end










function x310213_ProcGpOpenItemBox(varMap, varPlayer, varTalknpc,growpointId, varItem)
	
	if GetGameOpenById( x310213_var_GameId) <= 0 then
        x310213_ShowTips(varMap, varPlayer, "此活动未开启")
		return 1
    end

	local varMyQuest = x310213_GetQuestId( varMap, varPlayer )

	

	if varMyQuest ~= 7600 and varMyQuest ~=7743 and varMyQuest ~=7744 and varMyQuest ~= 7745 then
		x310213_ShowTips(varMap, varPlayer, "您没有接取【个人】弱国任务，不能采集！")
		return 1
	end

	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )


	local value2 = GetQuestParam( varMap, varPlayer, varQuestIdx, 1 )


	if value2~=1 then
		x310213_ShowTips(varMap, varPlayer, "你没有弱国任务中的采集任务，无法采集")
		return 1
	end

   
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest)
	local varCompleted = GetQuestParam( varMap, varPlayer, varQuestIdx, 7)

	if varCompleted==1 then
		x310213_ShowTips(varMap, varPlayer, "你已完成任务:"..x310213_var_QuestName)
		return 1;
	end

	local nGpIndex = GetQuestParam( varMap, varPlayer, varQuestIdx, 3)

	if nGpIndex~=(growpointId-x310213_var_GpTypeStart+1) then
		
		return 1;
	end

	return 0;
	
end

function x310213_ProcGpRecycle(varMap, varPlayer, varTalknpc,growpointId, varItem)
	
	if GetGameOpenById( x310213_var_GameId) <= 0 then
        x310213_ShowTips(varMap, varPlayer, "此活动未开启")
		return 0
    end

	

	local varMyQuest = x310213_GetQuestId( varMap, varPlayer )

	

	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) == 0 then	
		x310213_ShowTips(varMap, varPlayer, "你没有任务:"..x310213_var_QuestName)
		return 0
	end

	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )


	local value2 = GetQuestParam( varMap, varPlayer, varQuestIdx, 1 )


	if value2~=1 then
		x310213_ShowTips(varMap, varPlayer, "你没有弱国任务中的采集任务，无法采集")
		return 1
	end


   
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest)
	local varCompleted = GetQuestParam( varMap, varPlayer, varQuestIdx, 7)

	if varCompleted==1 then
		x310213_ShowTips(varMap, varPlayer, "你已完成任务:"..x310213_var_QuestName)
		return 0;
	end


	local nGpIndex = GetQuestParam( varMap, varPlayer, varQuestIdx, 3)

	if nGpIndex~=(growpointId-x310213_var_GpTypeStart+1) then
		x310213_ShowTips(varMap, varPlayer, "你应该去采集你相应等级的采集点")
		return 0;
	end


	

	StartItemTask(varMap)
		ItemAppend( varMap, x310213_var_ItemId_Caiji, 1 )
	local varRet = StopItemTask(varMap,varPlayer)
	if varRet > 0 then
		
		DeliverItemListSendToPlayer(varMap,varPlayer)
		
		
		
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"物品栏已满，无法得到任务物品！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)

		
	end

	return 1;
	
end




function x310213_ProcGpProcOver(varMap, varPlayer, varTalknpc)
	
	
	

	return 0;
end

function x310213_OpenCheck(varMap,varPlayer,AbilityId,AblityLevel)

	
end









function x310213_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest, nChangeType, varCount)

    if varQuest == nil or varQuest < 0 then
        return
    end

	local QuestId_dup = varQuest

	

	local varMyQuest = x310213_GetQuestId( varMap, varPlayer )

	varQuest = varMyQuest;
    
    if IsHaveQuestNM(varMap,varPlayer,varQuest) <= 0 then
        return
    end
	

	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )


	local value2 = GetQuestParam( varMap, varPlayer, varQuestIdx, 1 )


	if value2==1 then
		if x310213_var_ItemId_Caiji==varItemData then
			local Num = GetItemCount( varMap, varPlayer, varItemData )
			if Num<=x310213_var_ItemCount_Caiji then
			SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, Num )
			else
				SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, x310213_var_ItemCount_Caiji )
			end
			
			if nChangeType~=nil then
				if nChangeType<=0 then
				else
					local varStr = format("已获得@itemid_%d(%d/%d)",x310213_var_ItemId_Caiji,Num,x310213_var_ItemCount_Caiji)
					
				end
			else
				local varStr = format("已获得@itemid_%d(%d/%d)",x310213_var_ItemId_Caiji,Num,x310213_var_ItemCount_Caiji)
				
				
			end

			if Num>=x310213_var_ItemCount_Caiji then

				local varCompleted = GetQuestParam( varMap, varPlayer, varQuestIdx, 7 )

				if varCompleted<=0 then
				
					SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1 )

					if QuestId_dup~=1 then
						x310213_ShowTips(varMap, varPlayer, "已完成任务:"..x310213_var_QuestName)
					end
				end
			elseif Num<x310213_var_ItemCount_Caiji then
				SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 0 )
			end
		end
		
	elseif value2==2 then
		local nItemIndex = GetQuestParam( varMap, varPlayer, varQuestIdx, 4 )
		

		if varCount==nil then
		
			varCount = GetQuestParam( varMap, varPlayer, varQuestIdx, 3 )
		end

		if x310213_var_ShouJi_list[nItemIndex]==varItemData then
			local Num = GetItemCount( varMap, varPlayer, varItemData )

			if Num<=varCount then
			SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, Num )
			else
				SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, varCount )
			end
			
			

			if Num>=varCount then

				local varCompleted = GetQuestParam( varMap, varPlayer, varQuestIdx, 7 )

				if varCompleted<=0 then
					SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1 )
					if QuestId_dup~=1 then
						x310213_ShowTips(varMap, varPlayer, "已完成任务:"..x310213_var_QuestName)
					end
				end
			elseif Num<varCount then
				SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 0 )
			end
		end
		
	end

	x310213_QuestLogRefresh( varMap, varPlayer, varQuest );

    
	
end


function x310213_GetWeekOfYear()
	return GetWeekIndex()
end
function x310213_IsMinGuo(varMap, varPlayer)
	local loulanscore   = GetCountryParam(varMap, 0, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	local tianshanscore = GetCountryParam(varMap, 1, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	local kunlunscore   = GetCountryParam(varMap, 2, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	local dunhuangscore = GetCountryParam(varMap, 3, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	local allscore		= loulanscore + tianshanscore + kunlunscore + dunhuangscore
	local nCountryIdx = GetCurCountry(varMap, varPlayer);
	local MinGuo = GetCountryParam(varMap, nCountryIdx, CD_LASTWEEK_STRONG_WEAK_JIFEN)
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




