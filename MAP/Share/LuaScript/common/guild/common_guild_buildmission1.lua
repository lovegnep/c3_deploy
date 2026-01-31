







x300670_var_FileId = 300670
x300670_var_AbandonTime = 5

x300670_var_QuestName = "【帮会】帮会内政"

x300670_var_QuestCommentId	=	9031	
x300670_var_VirtualQuestId_Low	=	10000
x300670_var_VirtualQuestId_High	=	10000
x300670_var_QuestRangeStart	=	10001
x300670_var_QuestRangeEnd		= 10258
x300670_var_QuestCommentMessage	=	"\t帮会内政任务，您只需要按照帮会任务发布人的要求完成任务，就可以获得#G经验#W和#G帮贡#W的奖励。\n\t#G（随着玩家等级的增加，帮会内政任务的难度也会增加，所以，#Y20-50#G级的玩家是最合适完成此任务的。）"
x300670_var_QuestCommentWrongPlace =    "\t请你到大都帮会任务发布官处接任务"
x300670_var_QuestNPCObjId_Low		= 138533
x300670_var_QuestNPCObjId_High		= 138533
x300670_var_LevelLess             = 20 

x300670_ProceRoundCount = 10		
x300670_HighBonusCircleCount = 10	


x300670_CountrySceneList	= {50, 150, 250, 350}
x300670_CapitalSceneId		= 0
x300670_LevelToCapital		= 300	
x300670_MisParam_NPCData	= 1	
x300670_MisParam_FindData	= 2	
x300670_var_DeliverTargetCount	= 3	
x300670_AddGuildExpValue	= 1
x300670_MaxAddGuildExp		= 100
x300670_DeliverQuestTarget	= "找到"
x300670_DeliverTextFind		= "您已经找到了@npc_%d (%d/3)"
x300670_var_QuestCommentAfterAbandon = "\t很抱歉，你今天已经放弃过本任务，明天再来吧。"
x300670_var_QuestCommentAfterEnough = "\t你今天已经做过%d次帮会任务，做出的贡献够多了，明天再来帮忙吧。"
x300670_var_DeliverTargetNPC	= { 
					{
					    { varTalknpc = 	138516, Dialog = "\t这点小事情也要来找我……\n\t好吧!一会我就带人去看看。"	}, 
					    { varTalknpc = 	138806, Dialog = "\t没有问题，我的朋友，很高兴能帮上你们的忙。"	}, 
					    { varTalknpc = 	138802, Dialog = "\t这个……最近我已经忙的焦头烂额了。\n\t这样吧，我处理完这事就过去。"	}, 
					    { varTalknpc = 	138600, Dialog = "\t我很乐意帮忙~不过，请稍等，小女子梳妆完毕，自会前往。"	}, 
					    { varTalknpc = 	138822, Dialog = "\t你们要大采购么？要不要我带上货单？"	}, 
					    { varTalknpc = 	138812, Dialog = "\t真主会保佑你的，我的孩子，我这就动身。"	}, 
					    { varTalknpc = 	138800, Dialog = "\t我会去的……不过，要等我的主子不在这里的时候。"	}, 
					},
					{
					    { varTalknpc = 	138817, Dialog = "\t巴吉让你来的？好吧，我正想去找他，上次他从我这里订购的货物，到现在帐也没付清！"	}, 
					    { varTalknpc = 	138824, Dialog = "\t我金算盘一秒钟几十万金币上下，一会我派几个手下过去，这点小事，我就不亲自出马了！"	}, 
					    { varTalknpc = 	138588, Dialog = "\t押运官的职责让我不能轻易离开，不过我可以让那些来押运的家伙帮点小忙……"	}, 
					    { varTalknpc = 	138814, Dialog = "\t帮忙？有报酬么？一会我派个护卫去看看，没有赚头的生意我从来不做！"	}, 
					    { varTalknpc = 	138500, Dialog = "\t啊？为什么要来找我？"	}, 
					    { varTalknpc = 	138276, Dialog = "\t这事情……我要先请示我们族长，不过我相信他一定会同意的。"	}, 
					    { varTalknpc = 	138270, Dialog = "\t好，你们帮的人都是我的老顾客，我一定准时到。"	}, 
					},
					{
					    { varTalknpc = 	138190, Dialog = "\t好的好的，等我找回那几个淘气的孩子，我就过去。"	}, 
					    { varTalknpc = 	138155, Dialog = "\t很高兴能为贵帮帮忙，我准备一下马上就到。"	}, 
					    { varTalknpc = 	138166, Dialog = "\t需要我的帮助？没问题！我术忽台是出了名的好说话。"	}, 
					    { varTalknpc = 	138170, Dialog = "\t很高兴能为贵帮进些微薄之力，我准备一下马上就到。"	}, 
					    { varTalknpc = 	138655, Dialog = "\t我从不问江湖事，不过你们帮主的面子我还是要给的。\n\t好吧，你先回去，我随后就到。"	}, 
					    { varTalknpc = 	138000, Dialog = "\t有人请其其格帮忙？好啊，不过我要带上我的小羊羔~"	}
					},
				}

x300670_var_RewardList		= {
					{ step = 1, exprate = 3000, bangg = 1},
					{ step = 2, exprate = 3000, bangg = 2},
					{ step = 3, exprate = 3000, bangg = 3},
					{ step = 4, exprate = 3000, bangg = 4},
					{ step = 5, exprate = 3000, bangg = 5},
					{ step = 6, exprate = 3000, bangg = 6},
					{ step = 7, exprate = 3000, bangg = 7},
					{ step = 8, exprate = 3000, bangg = 8},
					{ step = 9, exprate = 3000, bangg = 9},
					{ step = 10, exprate = 3000, bangg = 10},
				}
x300670_var_DefaultQuestId	=	9030

x300670_var_QuestIdList	=	{
					{
						varLevel	=	{ min=20, max=29 },
						rate	=	{ 50, 100 },
						varQuest = {
								
								{9030},	
								
								{ 10001, 10002, 10003, 10004, 10005, 10006, 10007, 10008, 10009 },
						}
					},
					{
						varLevel	=	{ min=30, max=39 },
						rate	=	{ 50, 100 },
						varQuest = {
								
								{9030},	
								
								{ 10015, 10016, 10017, 10018, 10019, 10020, 10021, 10022, 10023, 10024, 10025, 10026, 10027, 10028, 10029 },
						}
					},
					{
						varLevel	=	{ min=40, max=49 },
						rate	=	{ 50, 100 },
						varQuest = {
								
								{9030},	
								
								{ 10035, 10036, 10037, 10038, 10039, 10040, 10041, 10042, 10043, 10044, 10045, 10046, 10047, 10048, 10049, 10050, 10051, 10052, 10053, 10054, 10055, 10056, 10057, 10058, 10059, 10060, 10061, 10062, 10063, 10064, 10065, 10066, 10067 },
						}
					},
					{
						varLevel	=	{ min=50, max=59 },
						rate	=	{ 50, 100 },
						varQuest = {
								
								{9030},	
								
								{ 10075, 10076, 10077, 10078, 10079, 10080, 10081, 10082, 10083, 10084, 10085, 10086, 10087, 10088, 10089, 10090, 10091, 10092, 10093, 10094, 10095, 10096, 10097, 10098, 10099, 10100, 10101, 10102, 10103, 10104, 10105, 10106, 10107 },
						}
					},
					{
						varLevel	=	{ min=60, max=69 },
						rate	=	{ 50, 100 },
						varQuest = {
								
								{9030},	
								
								{ 10205, 10206, 10207, 10208, 10209, 10210, 10211, 10212, 10213, 10214, 10215, 10216, 10217, 10218, 10219, 10220, 10221, 10222, 10223, 10224, 10225, 10226, 10227, 10228 },
						}
					},
					{
						varLevel	=	{ min=70, max=9999 },
						rate	=	{ 50, 100 },
						varQuest = {
								
								{9030},	
								
								{ 10235, 10236, 10237, 10238, 10239, 10240, 10241, 10242, 10243, 10244, 10245, 10246, 10247, 10248, 10249, 10250, 10251, 10252, 10253, 10254, 10255, 10256, 10257, 10258 },
						}
					},
				}

function x300670_GenerateRandomQuest(varMap, varPlayer, varTalknpc)

	local varQuest = x300670_var_DefaultQuestId;
	local varLevel = GetLevel(varMap, varPlayer);
 	
	local newtype = 0;
	local randval = random(0, 99);
	for varI, setitem in x300670_var_QuestIdList do
	
		
		if varLevel >= setitem.varLevel.min and varLevel <= setitem.varLevel.max then
			
				
					
					
				
			
			newtype = 2
			randval = random(1, getn(setitem.varQuest[newtype]));
			varQuest = setitem.varQuest[newtype][randval];
			break;
		end
	end

	if newtype == 0 then	
		return 0;
	end

	if varQuest < x300670_var_QuestRangeStart or varQuest > x300670_var_QuestRangeEnd then
		varQuest = x300670_var_QuestRangeStart;
	end
	





	
	
	newtype = 1
	x300670_SetMD (varMap, varPlayer, MD_BANGHUI_RANDMISSIONID, varQuest)
	
	return varQuest, newtype;
end

function x300670_GetRandQuestId(varMap, varPlayer)
	return x300670_GetMD(varMap, varPlayer, MD_BANGHUI_RANDMISSIONID)
end

function x300670_ProcAcceptCheck(varMap, varPlayer, varTalknpc, varQuest)

	varQuest = x300670_GetRandQuestId(varMap, varPlayer);

	if IsHaveQuestNM(varMap, varPlayer, varQuest) > 0 then
		return 0;
	end
	return 1;

end

function x300670_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	local varRet = 0;

	
	
	

	
	local userlevel = GetLevel(varMap, varPlayer);
	if userlevel < x300670_var_LevelLess then
		return 0
	end
        
	TalkAppendButtonNM(varMap, varPlayer, varTalknpc, x300670_var_QuestCommentId, 13, -1)

	local GuildId = GetGuildID(varMap, varPlayer)
	if GuildId < 0 then
		return 0
	end

	local randQuestId = x300670_GetRandQuestId(varMap, varPlayer)
	if randQuestId > 0 then
		if IsHaveQuestNM(varMap, varPlayer, randQuestId) > 0 then
			return 0;	
		end
	end

	local virtualMisId
	if x300670_CountrySceneList[GetCurCountry(varMap, varPlayer)+1] == varMap then
		virtualMisId = x300670_var_VirtualQuestId_Low;
	elseif varMap == x300670_CapitalSceneId then
		virtualMisId = x300670_var_VirtualQuestId_High;
	else
		return 0;
	end

	
	if (userlevel >= x300670_LevelToCapital and virtualMisId == x300670_var_VirtualQuestId_Low) then
		TalkAppendButton( varMap, x300670_var_VirtualQuestId_Low, x300670_var_QuestName, 13)
		return 0;
	end
	
	
	if QuestCheckAcceptNM( varMap, varPlayer, varTalknpc, virtualMisId ) > 0 then
		x300670_AddQuestTextByState(varMap, varPlayer, varTalknpc, virtualMisId);
	end

	return varRet;
end


function x300670_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest)

	if varQuest == x300670_var_QuestCommentId then
	
		QuestCom(varMap, varPlayer, x300670_var_QuestCommentId)
		x300670_DisplayQuestEventMessage (varMap, varPlayer, varTalknpc, varQuest, x300670_var_QuestCommentMessage)		
		return 0;
	end

	x300670_CheckDayChanged (varMap, varPlayer)
	local highcircle = x300670_GetMD(varMap, varPlayer, MD_BANGHUI_HIGH)
	if highcircle == x300670_HighBonusCircleCount + 1 then
		StartTalkTask( varMap)
			TalkAppendString( varMap, "#Y"..x300670_var_QuestName)
			TalkAppendString( varMap, x300670_var_QuestCommentAfterAbandon )
			DeliverTalkInfoNM( varMap, varPlayer, varTalknpc, x300670_var_FileId, varQuest, 1)
		StopTalkTask()
		return 0;
	elseif highcircle >= x300670_HighBonusCircleCount then
		StartTalkTask( varMap)
			TalkAppendString( varMap, "#Y"..x300670_var_QuestName)
			local varStr = format (x300670_var_QuestCommentAfterEnough, x300670_HighBonusCircleCount) 
			TalkAppendString( varMap, varStr )
			DeliverTalkInfoNM( varMap, varPlayer, varTalknpc, x300670_var_FileId, varQuest, 1)
		StopTalkTask()
		return 0;		
	end

	
	local userlevel = GetLevel(varMap, varPlayer);
	if (userlevel >= x300670_LevelToCapital and varQuest == x300670_var_VirtualQuestId_Low) then
		StartTalkTask( varMap)
			TalkAppendString( varMap, "#Y"..x300670_var_QuestName)
			TalkAppendString( varMap, x300670_var_QuestCommentWrongPlace )
			DeliverTalkInfoNM( varMap, varPlayer, varTalknpc, x300670_var_FileId, varQuest, 1)
		StopTalkTask()
		return 0;	
	end

	local varRet = 0;
	if x300670_CheckAbandonPenaltyOff (varMap, varPlayer, varTalknpc ) <= 0 then
		return 0;
	end

	if varQuest == x300670_var_VirtualQuestId_Low or varQuest == x300670_var_VirtualQuestId_High then	
		StartTalkTask( varMap)
		
			TalkAppendString( varMap, "#Y"..x300670_var_QuestName)
		
			TalkAppendString( varMap, GetQuestDescNM (varMap, varPlayer, varQuest))
			TalkAppendString( varMap, " " )
		
			local curlevel = GetLevel(varMap, varPlayer)
			local varExp = x300670_GetExpAward ( varMap, varPlayer, curlevel );
			local money,bangg = x300670_GetMoneyAward ( varMap, varPlayer, curlevel );
			local varStr
			if(varExp > 0) then
				AddQuestExpBonus(varMap, varExp)
			end
			if(money > 0) then
				AddQuestMoneyBonus2(varMap, money)
			end
			if(bangg > 0) then
				AddQuestMoneyBonus8(varMap, bangg)
			end
		
			TalkAppendString( varMap, "#c00FF00小提示:" )
			TalkAppendString( varMap, "#c00FF00如果想要了解本任务的细节，请点击帮会内政任务说明按钮。" )
		StopTalkTask()
		varRet = DeliverTalkInfoNM( varMap, varPlayer, varTalknpc, x300670_var_FileId, varQuest)
		return 0;
	else
		local randQuestId = x300670_GetRandQuestId(varMap, varPlayer)
		if randQuestId == 0 or IsHaveQuestNM( varMap, varPlayer, randQuestId ) == 0 then	
			return 0
		end
		
		varRet = x300670_ShowQuestInfoByState(varMap, varPlayer, varTalknpc, randQuestId)
	end
  
	return varRet;
end



function x300670_ProcQuestSubmit( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )

	varQuest = x300670_GetRandQuestId(varMap, varPlayer);
	if varQuest == nil or varQuest <= 0 then
        	return 0
    	end

	if IsHaveQuestNM( varMap, varPlayer, varQuest ) == 0 then	
		return 0
	 end

	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )

	
	local varRet = 0

	local targetGuid = GetMonsterGUID( varMap, varTalknpc)
	local reply_npcid = GetQuestSubmitNPCGUIDNM(varMap, varPlayer, varQuestIdx)
	if targetGuid == reply_npcid then		
		varRet = 1
	else
		return 
	end
	
	
	if varRet == 0 then
		return
	end

	local isFinish = GetQuestParam( varMap, varPlayer, varQuestIdx, 7)
	if (isFinish ~= 1) then
		return
	end

	
	local moneytype = 0;
	local curlevel = GetLevel(varMap, varPlayer) 
	local varExp = x300670_GetExpAward ( varMap, varPlayer, curlevel );
	local money,bangg = x300670_GetMoneyAward ( varMap, varPlayer, curlevel );

	
	varRet = CircleQuestComplateNM( varMap, varPlayer, varTalknpc, varQuest);
	
	if varRet == 1 then 
		
		local varCircle, highcircle = x300670_SetRounds(varMap, varPlayer)
		x300670_DisplayCircleMessage (varMap, varPlayer, varQuest)
		QuestUnCom( varMap, varPlayer, x300670_var_VirtualQuestId_Low)
		QuestUnCom( varMap, varPlayer, x300670_var_VirtualQuestId_High)
		x300670_SetMD(varMap, varPlayer, MD_BANGHUI_RANDMISSIONID, 0)

		x300670_DisplayCompleteMessage(varMap, varPlayer, varTalknpc, varQuest);
		
		if varExp > 0 then
			AddExp(varMap, varPlayer, varExp)
		end
		
		if money > 0 then
			AddMoney(varMap, varPlayer, moneytype, money)
		end
		
		if bangg > 0 then
			AddGuildUserPoint(varMap, varPlayer, bangg)
		end
		
		moneytype = 1
		local honorType = 4
		x300670_DisplayAwardInfo(varMap, varPlayer, varTalknpc, -1, -1, moneytype, money, varExp, honorType, bangg)
		
			
			
			
				
				
			

	else 
		x300670_DisplayCompleteQuestErrorMessage(varMap, varPlayer, varRet);
		return 0
	end

	return 1;
end

function x300670_ProcCallBackGetAddExpDate( varMap, varPlayer, QuestData, varQuest, varTalknpc )
	
	local curDate = GetDayTime()
	if (curDate ~= QuestData) then
		local GuildId = GetGuildID(varMap, varPlayer)
		if GuildId < 0 then
			return
		else
			SetGuildQuestData(varMap,GuildId,GD_GUILD_INDEX_ADDEXP_VALUE,x300670_AddGuildExpValue)
			SetGuildQuestData(varMap,GuildId,GD_GUILD_INDEX_ADDEXP_DATE, curDate)
		end
		
		
		
		
	else
		GetGuildQuestData(varMap, varPlayer, GD_GUILD_INDEX_ADDEXP_VALUE, x300670_var_FileId,varQuest,"ProcCallBackGetAddExpValue",0)
	end
end


function x300670_ProcCallBackGetAddExpValue( varMap, varPlayer, QuestData, varQuest, varTalknpc )
	
	if QuestData + x300670_AddGuildExpValue > x300670_MaxAddGuildExp then
		return
	end

	local GuildId = GetGuildID(varMap, varPlayer)
	if GuildId < 0 then
		return
	end

	SetGuildQuestData(varMap,GuildId,GD_GUILD_INDEX_ADDEXP_VALUE, QuestData + x300670_AddGuildExpValue)
	
	
	
	
end


function x300670_GetExpAward(varMap, varPlayer, startlevel)

	x300670_CheckDayChanged(varMap, varPlayer)
	local varCircle = x300670_GetMD(varMap, varPlayer, MD_BANGHUI_CIRCLE)
	
	
	varCircle = varCircle + 1
	if (varCircle > x300670_ProceRoundCount) then
		varCircle = 1
	end

	local exp_rate = 	x300670_var_RewardList[varCircle].exprate
	local BonusExp = startlevel * exp_rate
	
	
	
	
	return BonusExp;

end


function x300670_GetMoneyAward(varMap, varPlayer, startlevel)

	x300670_CheckDayChanged(varMap, varPlayer)	
	local varCircle = x300670_GetMD(varMap, varPlayer, MD_BANGHUI_CIRCLE)	


	varCircle = varCircle + 1	
	if (varCircle > x300670_ProceRoundCount) then	
		varCircle = 1
	end	

		
	local BonusMoney = 0	
	local bangg = x300670_var_RewardList[varCircle].bangg
	
	
	
	
	
	return BonusMoney,bangg;	

end





















function x300670_ProcCanCompleteQuest ( varMap, varPlayer, varTalknpc, varQuest )

	StartTalkTask(varMap);
		
		TalkAppendString(varMap, "#Y"..x300670_var_QuestName)
		
		TalkAppendString(varMap, GetQuestSuccessNM(varMap, varPlayer, varQuest))
		
		local curlevel = GetLevel(varMap, varPlayer)
		local varExp = x300670_GetExpAward ( varMap, varPlayer, curlevel );
		local money,bangg = x300670_GetMoneyAward ( varMap, varPlayer, curlevel );
		if(varExp > 0) then
			AddQuestExpBonus(varMap, varExp)
		end
		if(money > 0) then
			AddQuestMoneyBonus2(varMap, money)
		end
		if(bangg > 0) then
			AddQuestMoneyBonus8(varMap, bangg)
		end
	StopTalkTask();
	DeliverTalkContinueNM( varMap, varPlayer, varTalknpc, x300670_var_FileId, varQuest )
end


function x300670_CheckAbandonPenaltyOff ( varMap, varPlayer, varTalknpc )

	local curMinute = GetMinOfDay() + 1	
	local curDay = GetDayOfYear()		
	
	local varLastday =  x300670_GetMD(varMap, varPlayer, MD_BANGHUI_LASTDAY)
	local lastMinute =  x300670_GetMD(varMap, varPlayer, MD_BANGHUI_ABANDON)

	if (lastMinute == 0) then 
		return 1;
	end

	local bCanAccept = 1
	if (varLastday == curDay) then		
		if (curMinute >= lastMinute)  and  (curMinute - lastMinute < x300670_var_AbandonTime) then 
			bCanAccept = 0
		end
	elseif (curDay - varLastday == 1) or (varLastday == 365 and curDay == 0) then	
		if 1441 - lastMinute + curMinute <= x300670_var_AbandonTime then
			bCanAccept = 0
		end
	end
	

	if (bCanAccept == 0) then
		
		local varStr = format("#Y"..x300670_var_QuestName.."#W\n\t你放弃任务不足%d分钟，不能接受任务！" , x300670_var_AbandonTime);
		StartTalkTask(varMap);
			TalkAppendString(varMap, varStr);
		StopTalkTask(varMap);
		DeliverTalkMenu(varMap, varPlayer, varTalknpc);
		return 0
	end

	
	if( lastMinute ~= 0 ) then 
		x300670_SetMD(varMap, varPlayer, MD_BANGHUI_ABANDON, 0)
	end

	return 1;
end


function x300670_ShowQuestInfoByState( varMap, varPlayer, varTalknpc, varQuest )

	if IsHaveQuestNM( varMap, varPlayer, varQuest ) == 0 then	
		local varRet = QuestCheckAcceptNM( varMap, varPlayer, varTalknpc, varQuest )
		if varRet > 0 then	
			if IsQuestFullNM(varMap, varPlayer)==1 then
				Msg2Player(varMap, varPlayer, "#Y你已经接了太多的任务", 8, 3)
				Msg2Player(varMap, varPlayer, "#Y你已经接了太多的任务", 8, 2)
				return 0
			end
			return x300670_AutoAccept ( varMap, varPlayer, varTalknpc, varQuest )
		else
			x300670_DisplayQuestAcceptErrorMessage(varMap, varPlayer, varRet);
			return 0;
		end
	else 
		local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )
		local isFinish = GetQuestParam( varMap, varPlayer, varQuestIdx, 7)
		if isFinish == 1 then
			x300670_ProcCanCompleteQuest ( varMap, varPlayer, varTalknpc, varQuest )
		else
			x300670_ShowQuestContinueInfo( varMap, varPlayer, varTalknpc, varQuest ) 
		end
		return 0;
	end
	
	return 0;
end

function x300670_ShowQuestContinueInfo( varMap, varPlayer, varTalknpc, varQuest) 

	
	if x300670_IsDeliver(varQuest) == 1 then 
		local targetGuid = GetMonsterGUID( varMap, varTalknpc)
		local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, varQuest);
		local npcdata = GetQuestParam( varMap, varPlayer, varQuestIdx, x300670_MisParam_NPCData)
		local finddata = GetQuestParam( varMap, varPlayer, varQuestIdx, x300670_MisParam_FindData)
		local j =1
		local findnpc = 0
		local findcount = 0
		local dialog = ""
		for varI=1, x300670_var_DeliverTargetCount do

			if varI > getn(x300670_var_DeliverTargetNPC) then
				break
			end
			
			local npcindex = floor (mod(npcdata , j*16) / j)				
			local isNotFind = floor (mod(finddata, j*16) / j)
			if isNotFind == 0 then
				findcount = findcount + 1
			else

				if npcindex < 1 or npcindex > getn(x300670_var_DeliverTargetNPC[varI]) then		
					finddata = x300670_ComFindingNPC(varI, finddata)				
					findcount = findcount + 1
				else										
					local varTalknpc = x300670_var_DeliverTargetNPC[varI][npcindex].varTalknpc			
					if varTalknpc == targetGuid then						
						finddata = x300670_ComFindingNPC(varI, finddata)			
						findnpc = 1
						findcount = findcount + 1
						dialog = x300670_var_DeliverTargetNPC[varI][npcindex].Dialog
					end
				end
			end
			j = j * 16
		end

		if findnpc == 1 then
			SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300670_MisParam_FindData, finddata)

			local varStr = format("#Y"..x300670_DeliverTextFind, targetGuid, findcount);
			Msg2Player(varMap, varPlayer, varStr, 8, 3)

			if finddata == 0 then									
				SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 1)
				SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1)
				Msg2Player(varMap, varPlayer, "任务已完成，回报帮会任务管理员吧！", 8, 3)
			end

			StartTalkTask(varMap);
				
				TalkAppendString(varMap, "#Y"..x300670_var_QuestName)
				
				TalkAppendString(varMap, dialog)
			StopTalkTask();
			DeliverTalkInfoNM( varMap, varPlayer, varTalknpc, x300670_var_FileId, varQuest, 1)
			
			x300670_ProcQuestLogRefresh(varMap, varPlayer, varQuest)
			return
		end
	end
	
	QuestNotComplateInfoNM( varMap, varPlayer, varTalknpc, varQuest ) 
end


function x300670_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest)

	
	local userlevel = GetLevel(varMap, varPlayer);
	if (userlevel >= x300670_LevelToCapital and varQuest == x300670_var_VirtualQuestId_Low) then
		StartTalkTask( varMap)
			TalkAppendString( varMap, "#Y"..x300670_var_QuestName)
			TalkAppendString( varMap, x300670_var_QuestCommentWrongPlace )
			DeliverTalkInfoNM( varMap, varPlayer, varTalknpc, x300670_var_FileId, varQuest, 1)
		StopTalkTask()
		return 0;	
	end

	local randQuestId = x300670_GetRandQuestId(varMap, varPlayer)
	if randQuestId == 0 then
		
		local questType
		randQuestId, questType = x300670_GenerateRandomQuest ( varMap, varPlayer, varTalknpc );

	end

	if (randQuestId == 0) then
		return 0;
	end

	
	local varRet = x300670_ShowQuestInfoByState(varMap, varPlayer, varTalknpc, randQuestId)
	return 1;
end


function x300670_AutoAccept( varMap, varPlayer, varTalknpc, varQuest )
	
	if IsHaveQuestNM( varMap, varPlayer, varQuest ) > 0 then
		return 1
	end
	
	
	local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer, varQuest )
	if varFrontQuest1 ~= -1 then
		if IsQuestHaveDoneNM( varMap, varPlayer, varFrontQuest1 ) == 0 then
			return 
		end
	end
	if varFrontQuest2 ~= -1 then
		if IsQuestHaveDoneNM( varMap, varPlayer, varFrontQuest2 ) == 0 then
			return 
		end
	end
	if varFrontQuest3 ~= -1 then
		if IsQuestHaveDoneNM( varMap, varPlayer, varFrontQuest3 ) == 0 then
			return
		end
	end

	
	
	local varRet
	if x300670_IsDeliver( varQuest ) == 1 then
		varRet = AddQuest( varMap, varPlayer, varQuest, 300670, 0, 0, 0, 1)
	else
		varRet = AddQuestNM( varMap, varPlayer, varQuest ) 
	end
	if varRet > 0 then
		x300670_AfterAccept( varMap, varPlayer, varTalknpc, varQuest)
	else
		x300670_DisplayAddQuestErrorMessage(varMap, varPlayer, varRet);
	end
	return varRet
end


function x300670_AfterAccept( varMap, varPlayer, varTalknpc, varQuest)

	local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, varQuest);

	
	local userlevel = GetLevel(varMap, varPlayer)
	local virtualMisId;
	if ( userlevel < x300670_LevelToCapital ) then
		virtualMisId = x300670_var_VirtualQuestId_Low
	else
		virtualMisId = x300670_var_VirtualQuestId_High
	end

	QuestCom( varMap, varPlayer, x300670_var_VirtualQuestId_Low)
	QuestCom( varMap, varPlayer, x300670_var_VirtualQuestId_High)

	x300670_DisplayAcceptMessage(varMap, varPlayer, varQuest);
	for varI = 0, 4 do
		local varMap, PosX, PosZ, tips = GetAskWayPosNM(varMap, varPlayer, varQuest, varI)
		if varMap ~= -1 then
			LuaCallNoclosure( UTILITY_SCRIPT, "AskTheWayPos", varMap, varPlayer, varMap, PosX, PosZ, tips )
		end
	end

	
	
	
	StartTalkTask( varMap)
		
		TalkAppendString( varMap, "#Y"..x300670_var_QuestName)
		
		TalkAppendString( varMap, GetQuestDescNM (varMap, varPlayer, varQuest))
		TalkAppendString( varMap, " " )
		
		TalkAppendString( varMap, "#Y任务目标：" )

		if x300670_IsDeliver(varQuest) == 1 then						
			local j = 1
			local npcdata = 0
			local finddata = 0
			for varI=1, x300670_var_DeliverTargetCount do
				if varI > getn(x300670_var_DeliverTargetNPC) then
					break
				end

				local npcindex = random(1, getn(x300670_var_DeliverTargetNPC[varI]))		
				npcdata = npcdata + npcindex * j					
				finddata = finddata + 1 * j						
				local varTalknpc = x300670_var_DeliverTargetNPC[varI][npcindex].varTalknpc			
				local varStr = x300670_DeliverQuestTarget.."@npc_"..varTalknpc
				TalkAppendString( varMap, varStr )

				j = j * 16
			end

			SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300670_MisParam_NPCData, npcdata)
			SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300670_MisParam_FindData, finddata)

		elseif x300670_IsCollect(varQuest) == 1 then
			
			local szTarget1,szTarget2,szTarget3,szTarget4,szTarget5 = GetQuestTargetNM(varMap, varPlayer, varQuest)
			if (szTarget1 ~= "") then
				TalkAppendString( varMap, szTarget1 )
			end
			if (szTarget2 ~= "") then
				TalkAppendString( varMap, szTarget2 )
			end
			if (szTarget3 ~= "") then
				TalkAppendString( varMap, szTarget3 )
			end
			if (szTarget4 ~= "") then
				TalkAppendString( varMap, szTarget4 )
			end
			if (szTarget5 ~= "") then
				TalkAppendString( varMap, szTarget5 )
			end
		end
		TalkAppendString( varMap, " ")	

	StopTalkTask()
	       
	DeliverTalkInfoNM( varMap, varPlayer, varTalknpc, x300670_var_FileId, varQuest, 1)

  
	local varRet = 0
	if x300670_IsDeliver(varQuest) == 1 then 
		varRet = 0
	elseif x300670_IsCollect(varQuest) == 1 then
		varRet = QuestCheckSubmitNM( varMap, varPlayer, varTalknpc, varQuest, varQuestIdx ) 
	end

  
	if (varRet > 0) then
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 1)
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1)
	else
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 0)
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 0)
	end









		
end

function x300670_SetRounds(varMap, varPlayer)

	local highcircle = x300670_GetMD(varMap, varPlayer, MD_BANGHUI_HIGH)
	local lastCircle = x300670_GetMD(varMap, varPlayer, MD_BANGHUI_CIRCLE)

	
	
	
	
	
	
	

	if highcircle < x300670_HighBonusCircleCount then
		highcircle = highcircle + 1
		x300670_SetMD(varMap, varPlayer, MD_BANGHUI_HIGH, highcircle)
	end
	
	if lastCircle >= x300670_ProceRoundCount then	
		lastCircle = 1;			
	else						
		lastCircle = lastCircle + 1;
	end	

	x300670_SetMD(varMap, varPlayer, MD_BANGHUI_CIRCLE, lastCircle)

	return lastCircle,0
end

function x300670_GetMP(varMap, varPlayer, varQuest, constMP)
	local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, varQuest);
	return GetQuestParam(varMap, varPlayer, varQuestIdx, constMP);
end

function x300670_DisplayAcceptMessage(varMap, varPlayer, varQuest)
	local varStr = format("你接受了任务：%s", x300670_var_QuestName);
	Msg2Player(varMap, varPlayer, varStr, 8, 3)
	Msg2Player(varMap, varPlayer, varStr, 8, 2)
	return 1;
end

function x300670_DisplayAddQuestErrorMessage(varMap, varPlayer, varRet)
	local varStr;
	if varRet == 0 then
		varStr = "添加任务失败！"
	elseif varRet == -1 then
		varStr = "背包已满,请整理后再来接任务！"
	elseif varRet == -2 then
		varStr = "任务已达到上限，无法接新的任务！"
	elseif varRet == -3 then
		varStr = "金钱不足，无法接新的任务！"
	end

	Msg2Player(varMap, varPlayer, varStr, 8, 3)
	return varRet;
end

function x300670_DisplayQuestAcceptErrorMessage(varMap, varPlayer, varRet)

	local varStr = "未知错误，无法接新的任务！"
	if varRet == -1 then
		varStr = "等级不足，无法接新的任务！"
	elseif varRet == -2 then
		varStr = "等级过高，无法接新的任务！"
	elseif varRet == -3 then
		varStr = "金钱不足，无法接新的任务！"
	elseif varRet == -4 then
		varStr = "你不是本国玩家，无法接新的任务！"
	elseif varRet == -5 then
		varStr = "职业类型不符，无法接新的任务！"
	elseif varRet == -6 then
		varStr = "阵营不符，无法接新的任务！"
	elseif varRet == -7 then
		varStr = "此人无此任务！"
	end
	
	Msg2Player(varMap, varPlayer, varStr, 8, 3)
	return varRet;
	
end

function x300670_ProcQuestLogRefresh( varMap, varPlayer, varQuest )

	local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, varQuest);
	
	local strName;
	strName = x300670_var_QuestName;
	local varCircle = x300670_GetMD(varMap, varPlayer, MD_BANGHUI_CIRCLE)
	if (varCircle >= x300670_ProceRoundCount) then
		varCircle = 1
	else
		varCircle = varCircle + 1
	end
	strName = strName.."("..varCircle;
	strName = strName.."/"..x300670_ProceRoundCount;
	strName = strName..")";

	local reply_npcid = GetQuestSubmitNPCGUIDNM(varMap, varPlayer, varQuestIdx)
	if (reply_npcid < 0) then
		return
	end
	local strReplyNPC = format("@npc_%d", reply_npcid)
	
	StartTalkTask(varMap);
		local szQuestTarget = ""
		if x300670_IsDeliver(varQuest) == 1 then
			
			local npcdata = GetQuestParam( varMap, varPlayer, varQuestIdx, x300670_MisParam_NPCData)
			local finddata = GetQuestParam( varMap, varPlayer, varQuestIdx, x300670_MisParam_FindData)

			local j = 1
			for varI=1, x300670_var_DeliverTargetCount do

				if varI > getn(x300670_var_DeliverTargetNPC) then
					break
				end

				local npcindex = floor(mod (npcdata , j*16) / j)						
				local isNotFind = floor(mod (finddata , j*16) / j)						
				j = j * 16
				if npcindex < 1 or npcindex > getn(x300670_var_DeliverTargetNPC[varI]) then		
				
				else										
					local varTalknpc = x300670_var_DeliverTargetNPC[varI][npcindex].varTalknpc			
					if isNotFind == 1 then
						szQuestTarget = szQuestTarget.."  #W"..x300670_DeliverQuestTarget.."@npc_"..varTalknpc.."(0/1)"
					else
						szQuestTarget = szQuestTarget.."  #G"..x300670_DeliverQuestTarget.."@npc_"..varTalknpc.."(1/1)"
					end
					if varI < x300670_var_DeliverTargetCount then
						szQuestTarget = szQuestTarget.."\n"
					end
				end
			end
		elseif x300670_IsCollect(varQuest) == 1 then
			
		end

		AddQuestLogCustomText(varMap, "", strName, szQuestTarget, strReplyNPC, "", "", "");

		
		local curlevel = GetLevel(varMap, varPlayer)
		local varExp = x300670_GetExpAward ( varMap, varPlayer, curlevel );
		local money,bangg = x300670_GetMoneyAward ( varMap, varPlayer, curlevel );
		if(varExp > 0) then
			AddQuestExpBonus(varMap, varExp)
		end
		if(money > 0) then
			AddQuestMoneyBonus2(varMap, money)
		end
		if(bangg > 0) then
			AddQuestMoneyBonus8(varMap, bangg)
		end
	StopTalkTask();
	DeliverTalkRefreshQuest(varMap, varPlayer, varQuest);
end

function x300670_DisplayCircleMessage(varMap, varPlayer, varQuest )

	local varCircles = x300670_GetMD(varMap, varPlayer, MD_BANGHUI_CIRCLE)
	

	local varStr = format( "环数: %d/%d", varCircles, x300670_ProceRoundCount );
	
	
	
	Msg2Player(varMap, varPlayer, varStr, 8, 3)

end

function x300670_DisplayCompleteMessage(varMap, varPlayer, varTalknpc, varQuest)
	
	local varQuestName = x300670_var_QuestName;
	local varStr = format( "你完成了任务%s", varQuestName);

	Msg2Player(varMap, varPlayer, varStr, 8, 3)
	return 1;

end

function x300670_DisplayAwardInfo(varMap, varPlayer, varTalknpc, varQuest, varButtonClick, moneyType, money, expAward, honorType, honor)
	
	if varQuest >= 0 then
		moneyType, money, expAward, honorType, honor = AwardMoneyExpHonorNM(varMap, varPlayer, varTalknpc, varQuest, varButtonClick)
	end
	local varStr;

	if expAward > 0 then
		varStr = format("#Y获得#R经验%d#Y的奖励。", expAward);
		Msg2Player(varMap, varPlayer, varStr, 8, 2)
	end

	if money > 0 then
		if moneyType == 0 then 
			varStr = format("#Y获得#R现银#{_MONEY%d}#Y的奖励。", money);
		elseif moneyType == 1 then 
			varStr = format("#Y获得#R银卡#{_MONEY%d}#Y的奖励。", money);
		elseif moneyType == 2 then 
			varStr = format("#Y获得#R现金#{_MONEY%d}#Y的奖励。", money);
		elseif moneyType == 3 then 
			varStr = format("#Y获得#R金卡#{_MONEY%d}#Y的奖励。", money);
		end

		Msg2Player(varMap, varPlayer, varStr, 8, 2)
	end

	if honor > 0 then
		if honorType == 0 then 
			varStr = format("#Y获得#R声望%d#Y的奖励。", honor);
		elseif honorType == 1 then	
			varStr = format("#Y获得#R声望%d#Y的奖励。", honor);
		elseif honorType == 2 then 
			varStr = format("#Y获得#RPK值%d#Y的奖励。", honor);
		elseif honorType == 3 then 
			varStr = format("#Y获得#R荣誉%d#Y的奖励。", honor);
		elseif honorType == 4 then 
			varStr = format("#Y获得#R帮贡%d#Y的奖励。", honor);
		elseif honorType == 5 then 
			varStr = format("#Y获得#R文采%d#Y的奖励。", honor);
		end

		Msg2Player(varMap, varPlayer, varStr, 8, 2)
	end
	return 1;

end


function x300670_DisplayCompleteQuestErrorMessage(varMap, varPlayer, varRet)
	
	local varStr = "未知错误，无法完成任务！"
	if varRet == -2 then
		varStr = "请选择奖励物品！"
	elseif varRet == -3 then
		varStr = "背包已满,请整理后再来交任务！"
	elseif varRet == -4 then
		varStr = "扣除任务物品失败！"
	end

	Msg2Player(varMap, varPlayer, varStr, 8, 3)
	return varRet;

end

function x300670_PushAfterQuest(varMap, varPlayer, varTalknpc, varQuest )
	return 1;
end


function x300670_ProcQuestAbandon( varMap, varPlayer, varQuest )

	varQuest = x300670_GetRandQuestId(varMap, varPlayer);
	if (varQuest == 0 or IsHaveQuestNM( varMap, varPlayer, varQuest ) == 0 ) then
		
		x300670_DelAllWrongQuest(varMap, varPlayer)
		return 0
	end
	local varRet = 0

	local  varQuestIdx = GetQuestIndexByID(varMap, varPlayer, varQuest);
	varRet = DelQuestNM( varMap, varPlayer, varQuest )
	if varRet == 1 then

		QuestUnCom( varMap, varPlayer, x300670_var_VirtualQuestId_Low)
		
		x300670_SetMD(varMap, varPlayer, MD_BANGHUI_LASTDAY, GetDayOfYear())
		x300670_SetMD(varMap, varPlayer, MD_BANGHUI_ABANDON, GetMinOfDay()+1)

		
		x300670_SetMD(varMap, varPlayer, MD_BANGHUI_RANDMISSIONID, 0)
		x300670_SetMD(varMap, varPlayer, MD_BANGHUI_CIRCLE, 0)
		x300670_SetMD(varMap, varPlayer, MD_BANGHUI_HIGH, x300670_HighBonusCircleCount + 1)
		x300670_DisplayAbandonMessage(varMap, varPlayer, varQuest);
	end
	return varRet;
end

function x300670_DelAllWrongQuest(varMap, varPlayer)
	
	local varLevel = GetLevel(varMap, varPlayer)
	for varI, setitem in x300670_var_QuestIdList do
		if varLevel >= setitem.varLevel.min then
			for j, idarray in setitem.varQuest do
				for m, varId in idarray do
					if IsHaveQuestNM( varMap, varPlayer, varId ) > 0 then
						DelQuestNM( varMap, varPlayer, varId )
					end
				end
			end
		end
	end
end

function x300670_DisplayAbandonMessage(varMap, varPlayer, varQuest)
	local varQuestName = x300670_var_QuestName;
	local varStr = format("你放弃了任务%s！", varQuestName);

	Msg2Player(varMap, varPlayer, varStr, 8, 3)
	Msg2Player(varMap, varPlayer, varStr, 8, 2)
	return 1;
end

function x300670_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	
	
	varQuest = x300670_GetRandQuestId(varMap, varPlayer);
	if (varQuest == 0) then
		return 0
	end

	if IsHaveQuestNM( varMap, varPlayer, varQuest ) == 0 then	
		return 0
	end

	local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, varQuest);
	
	if x300670_IsDeliver(varQuest) == 1 then 

		
		local npcdata = GetQuestParam( varMap, varPlayer, varQuestIdx, x300670_MisParam_NPCData)
		local finddata = GetQuestParam( varMap, varPlayer, varQuestIdx, x300670_MisParam_FindData)
		local j =1
		for varI=1, x300670_var_DeliverTargetCount do

			if varI > getn(x300670_var_DeliverTargetNPC) then
				break
			end

			local npcindex = floor(mod (npcdata , j*16) / j)					
			local isNotFind = floor (mod (finddata , j*16) / j)					
			j = j * 16
			if npcindex < 1 or npcindex > getn(x300670_var_DeliverTargetNPC[varI]) then		
			
			else										
				local varTalknpc = x300670_var_DeliverTargetNPC[varI][npcindex].varTalknpc			
				if varTalknpc == varTalkNpcGUID and isNotFind == 1 then				
					TalkAppendButton( varMap, varQuest, x300670_var_QuestName, 13)
					return 1
				end
			end
		end
	end

	local submitguid = GetQuestSubmitNPCGUIDNM( varMap, varPlayer, varQuestIdx )

	
	if submitguid ~= -1 and submitguid == varTalkNpcGUID then	
		x300670_AddQuestTextByState(varMap, varPlayer, varTalknpc, varQuest);
		return 1
	end

	return 0
end

function x300670_AddQuestTextByState(varMap, varPlayer, varTalknpc, varQuest)
	local varState = GetQuestStateNM(varMap, varPlayer, varTalknpc, varQuest);
	return TalkAppendButtonNM(varMap, varPlayer, varTalknpc, varQuest, varState, -1);
end

function x300670_DisplayQuestEventMessage(varMap, varPlayer, varTalknpc, varQuest, contentStr)

	local varQuestName;
	if varQuest > 0 then
		varQuestName = x300670_var_QuestName;
	end
	
	local varStr = "#Y";
	if varQuestName ~= nil then
		varStr = varStr..varQuestName;
	end
	varStr = varStr.."#W\n\n"..contentStr;

	StartTalkTask(varMap)
		TalkAppendString(varMap, varStr)
	StopTalkTask(varMap)

	DeliverTalkMenu(varMap, varPlayer, varTalknpc);

end

function x300670_SetMP(varMap, varPlayer, varQuest, constMP, Value)
	local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, varQuest);
	return SetQuestByIndex(varMap, varPlayer, varQuestIdx, constMP, Value);
end


function x300670_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest)
end


function x300670_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )

	varQuest = x300670_GetRandQuestId(varMap, varPlayer);
	if (varQuest == 0) then
		return 0
	end

	if IsHaveQuestNM(varMap, varPlayer, varQuest) == 0 then
		return 0
	end
	local NeedNum, ObjIndex = GetQuestNeedItemNumNM( varMap, varPlayer, varQuest, varItemData )

	if NeedNum > 0 then
		local Num = GetItemCount( varMap, varPlayer, varItemData )
		x300670_DisplayQuestGetItemMessage(varMap, varPlayer, varItemData, varQuest, ObjIndex, Num, NeedNum)
		if Num < NeedNum then 
			x300670_SetMP(varMap, varPlayer, varQuest, ObjIndex, Num);
			x300670_SetMP(varMap,varPlayer,varQuest,7,0)
		elseif Num >= NeedNum then
			if x300670_GetMP(varMap,varPlayer,varQuest,7) == 1 then	
				return 0
			end
			x300670_SetMP(varMap, varPlayer, varQuest, ObjIndex, NeedNum);
			x300670_SetMP(varMap,varPlayer,varQuest,7,1)
			Msg2Player(varMap, varPlayer, "任务已经完成，快点回去汇报吧！", 8, 3)
		end
	end
	return 0
end

function x300670_DisplayQuestGetItemMessage(varMap, varPlayer, varItem, varQuest, ObjIndex, Num, NeedNum)

	local varStr = "";
	local varRet = 1;
	local oldNum = x300670_GetMP(varMap, varPlayer, varQuest, ObjIndex);
	if Num < NeedNum then
		if(Num < oldNum) then
			varStr = "";
		elseif (Num > oldNum) then
			varStr = format("#Y获得物品#G#{_ITEM%d}#Y: %d/%d", varItem, Num, NeedNum );
		end
		varRet = 0;
	elseif Num == NeedNum then
		varStr = format( "#Y已完成获得物品#G#{_ITEM%d}#Y: %d/%d", varItem, Num, NeedNum )
	end
	if varStr ~= "" then
		Msg2Player(varMap, varPlayer, varStr, 8, 3)
	end
	return varRet;

end


function x300670_ProcMapTimerTick( varMap, varPlayer, varScript, varQuest )
	return 1;
end


function x300670_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	return 1
end


function x300670_OpenCheck( varMap, varPlayer, varTalknpc )
	return 1
end

function x300670_SetMD(varMap, varPlayer, MDNAME, value)
	SetPlayerGameData(varMap, varPlayer, MDNAME[1], MDNAME[2], MDNAME[3], value);
end

function x300670_GetMD(varMap, varPlayer, MDNAME)

	return GetPlayerGameData(varMap, varPlayer, MDNAME[1], MDNAME[2], MDNAME[3])
end

function x300670_GiveItemToHuman(varMap, varPlayer, varItem, varCount)

	StartItemTask(varMap)
	ItemAppend( varMap, varItem, varCount )
	local varRet = StopItemTask(varMap,varPlayer)
	if varRet > 0 then
		DeliverItemListSendToPlayer(varMap,varPlayer)
	else
		local varStr = "背包已满，无法得到物品！";
		Msg2Player(varMap, varPlayer, varStr, 8, 3);
		Msg2Player(varMap, varPlayer, varStr, 8, 2)
	end
	return varRet
end


function x300670_CheckDayChanged(varMap, varPlayer)
	local varLastday = x300670_GetMD(varMap, varPlayer, MD_BANGHUI_LASTDAY)
	local varToday = GetDayOfYear()
	if varLastday ~= varToday then	
		x300670_SetMD(varMap, varPlayer, MD_BANGHUI_LASTDAY, varToday)	
		x300670_SetMD(varMap, varPlayer, MD_BANGHUI_HIGH, 0)
	end
end

function x300670_IsDeliver(varQuest)
	if varQuest == 9030 then
		return 1
	else
		return 0
	end
end

function x300670_IsCollect(varQuest)
	if varQuest >= 10001 and varQuest <=10258 then
		return 1
	else
		return 0
	end	
end

function x300670_ComFindingNPC( TargetIndex, finddata )
	if TargetIndex < 1 or TargetIndex > x300670_var_DeliverTargetCount then
		return finddata
	end

	local time_a = 1
	local time_b = 1
	
	if TargetIndex < 8 then
		for varI = 1, TargetIndex do
			time_a = time_a * 16
		end
	end
	for varI = 1, TargetIndex - 1 do
		time_b = time_b * 16
	end
	
	local left
	if TargetIndex >= 8 then
		left = 0
	else
		left = finddata - mod (finddata , time_a)
	end

    local right
	if TargetIndex == 1 then
		right = 0
	else
		right = mod (finddata , time_b)
	end
	return left + right
end
