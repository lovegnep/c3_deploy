



--DECLARE_QUEST_INFO_START--

x300738_var_FileId 					= 	300738                  


x300738_var_QuestKind 				= 	1                       
x300738_var_LevelLess					= 	40                      

x300738_var_QuestName				= 	""                
x300738_var_QuestTarget				= 	""          
x300738_var_QuestInfo				= 	""            
x300738_var_ContinueInfo				= 	""  
x300738_var_QuestCompleted			= 	""  
x300738_var_QuestHelp				=	""          


x300738_var_ExtTarget					=	{}



x300738_var_ExpBonus		 			= 	0                    	
x300738_var_BonusItem					=	{}	

x300738_var_BonusMoney1               = 	0       
x300738_var_BonusMoney2               =   0       
x300738_var_BonusMoney3               =   0       
x300738_var_BonusMoney4               =   0     
x300738_var_BonusMoney5               =   0     
x300738_var_BonusMoney6               =   0     
x300738_var_Exp_Drop               =   10


x300738_var_BonusChoiceItem           =   {}


--DECLARE_QUEST_INFO_STOP--


x300738_var_DayCountLimited = 1

x300738_var_QuestBonusInfo			= 	"#Y获得经验#R%d#Y的奖励。"


x300738_var_Shoubian = {7563, 7569,7575,7584}
x300738_var_SendMail1 = {7564, 7570,7576,7585}
x300738_var_SendMail2 = {7565, 7571,7577,7586}

x300738_var_ShouBianCountryScene	= {51,151,251,351};

function x300738_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	
end


function x300738_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest, varIndex )
	

	if varIndex ~= -1 then
		varQuest = varIndex
	end

	

	if IsHaveQuestNM( varMap, varPlayer, varQuest ) == 0 then	
		local varQuestId1 = 7564
		local varQuestId2 = 7570
		local varQuestId3 = 7576
		local varQuestId4 = 7585

		
		
		
		

		
		
		
		

		
		if IsHaveQuestNM( varMap, varPlayer, varQuestId1 ) > 0 or IsHaveQuestNM( varMap, varPlayer, varQuestId2 ) > 0 or IsHaveQuestNM( varMap, varPlayer, varQuestId3 ) > 0 or IsHaveQuestNM( varMap, varPlayer, varQuestId4 ) > 0 then			StartTalkTask(varMap)
			local varText = "您已经接过了【国家】国家守边任务，还未完成，不能再接取"
			TalkAppendString( varMap, varText )
			StopTalkTask( varMap )
			DeliverTalkTips( varMap, varPlayer )
			Msg2Player(varMap,varPlayer,"您已经接过了【国家】国家守边任务，还未完成，不能再接取",8,2)
			return
		end

		local nCurrentDayCount = x300738_GetDayCount(varMap, varPlayer)
		
		if nCurrentDayCount>=x300738_var_DayCountLimited then
			
			

			
			
			
			
		end

		
		local varRet = QuestCheckAcceptNM( varMap, varPlayer, varTalknpc, varQuest )
		if varRet > 0 then	
			
			x300738_DispatchQuestInfo( varMap, varPlayer, varTalknpc, varQuest )
		elseif varRet ==-1 then  
			
			StartTalkTask(varMap);
				TalkAppendString(varMap, "你等级过低，不能接收任务");
			StopTalkTask();
			DeliverTalkTips(varMap, varPlayer);
		elseif varRet ==-2 then
			StartTalkTask(varMap);
				TalkAppendString(varMap, "超过最大等级限制");
			StopTalkTask();
			DeliverTalkTips(varMap, varPlayer);

		end
	else 
		local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )
		if QuestCheckSubmitNM( varMap, varPlayer, varTalknpc, varQuest, varQuestIdx ) > 0 then 
			
			x300738_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,varQuest )
		else
			
			x300738_DispatchContinueInfo( varMap, varPlayer, varTalknpc,varQuest )
		end
	end
				
end


function x300738_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
	
	if IsHaveQuestNM( varMap, varPlayer, varQuest) >0 then
		return 0;
	end

	local nCurrentDayCount = x300738_GetDayCount(varMap, varPlayer)

	if nCurrentDayCount>=x300738_var_DayCountLimited then
		StartTalkTask(varMap);
			TalkAppendString(varMap, "很抱歉，您已经接取过了【国家】国家守边任务，请明日来接");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer,"很抱歉，您已经接取过了【国家】国家守边任务，请明日来接",8,2)
		return 0;
	end



	local varRet = QuestCheckAcceptNM( varMap, varPlayer, varTalknpc, varQuest )
	
	
		local varFullQuest = IsQuestFullNM(varMap,varPlayer)
		
		if varFullQuest>0 then
			StartTalkTask(varMap);
				TalkAppendString(varMap, "任务已满，无法接受任务");
			StopTalkTask();
			DeliverTalkTips(varMap, varPlayer);
			return 0;
		end
		
	
	if varRet > 0 then	
	elseif varRet ==-1 then  
		
		StartTalkTask(varMap);
			TalkAppendString(varMap, "你等级过低，不能接收任务");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		return 0;
	elseif varRet ==-2 then
		StartTalkTask(varMap);
			TalkAppendString(varMap, "超过最大等级限制");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);

		return 0;

	end

	

	if IsHaveQuestNM( varMap, varPlayer, varQuest ) > 0 then	
		return 0
	end
	
	
	local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer, varQuest )
	if varFrontQuest1 ~= -1 then
		if IsQuestHaveDoneNM( varMap, varPlayer, varFrontQuest1 ) == 0 then
			return 0
		end
	end
	if varFrontQuest2 ~= -1 then
		if IsQuestHaveDoneNM( varMap, varPlayer, varFrontQuest2 ) == 0 then
			return 0
		end
	end
	if varFrontQuest3 ~= -1 then
		if IsQuestHaveDoneNM( varMap, varPlayer, varFrontQuest3 ) == 0 then
			return 0
		end
	end

	local varRet = QuestCheckAcceptNM( varMap, varPlayer, varTalknpc, varQuest ) 
	if varRet > 0 then 
	
		
		local varFullQuest = IsQuestFullNM(varMap,varPlayer)
		
		if varFullQuest>0 then
			StartTalkTask(varMap);
				TalkAppendString(varMap, "任务已满，无法接受任务");
			StopTalkTask();
			DeliverTalkTips(varMap, varPlayer);
			return 0;
		end
		
	
		varRet = AddQuestNM( varMap, varPlayer, varQuest ) 
		if varRet > 0 then
			StartTalkTask(varMap);
				TalkAppendString(varMap, "您接受了任务:【国家】国家守边");
			StopTalkTask();
			DeliverTalkTips(varMap, varPlayer);

			Msg2Player(varMap,varPlayer,"您接受了任务:【国家】国家守边",8,2)

			local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )
			SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1 )
			return 1
		else
			StartTalkTask(varMap);
				TalkAppendString(varMap, "接受任务错误");
			StopTalkTask();
			DeliverTalkTips(varMap, varPlayer);
		end
	elseif varRet ==-1 then  
		
		StartTalkTask(varMap);
			TalkAppendString(varMap, "你等级过低，不能接收任务");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
	elseif varRet ==-2 then
		StartTalkTask(varMap);
			TalkAppendString(varMap, "超过最大等级限制");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);

	end

	return 0
end

function x300738_SceneCheck(varMap, varPlayer)


	local varCountry = GetCurCountry(varMap, varPlayer)
	if x300738_var_ShouBianCountryScene[varCountry+1] == varMap then
		return 1
	end
	return -1
end

function x300738_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID,varQuestIdx, varQuest )
	
	if  x300738_SceneCheck(varMap, varPlayer)<0 then
		return
	end
	
	local varQuestId1 = 7564
	local varQuestId2 = 7570
	local varQuestId3 = 7576
	local varQuestId4 = 7585

	
	if varQuest ~= varQuestId1 and varQuest ~= varQuestId2 and varQuest ~= varQuestId3 and varQuest ~= varQuestId4  then
		return
	end


	if IsHaveQuestNM( varMap, varPlayer, varQuest ) == 0 then	
		return
	end

	local npcName = GetName( varMap, varTalknpc )
	if npcName == "" then	
		return
	end

	local guid = GetQuestSubmitNPCGUIDNM( varMap, varPlayer, varQuestIdx )
	local  questState = GetQuestStateNM(varMap, varPlayer, varTalknpc, varQuest)
	
	if guid == varTalkNpcGUID then	
		TalkAppendButtonNM( varMap, varPlayer, varTalknpc, varQuest, questState, -1 ) 
		
		
	end
	

	
	
	
end



function x300738_ProcQuestSubmit( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )

	

	if IsHaveQuestNM( varMap, varPlayer, varQuest ) == 0 then	
		return 0
	end

	
	
	local varQuestId1 = 7565
	local varQuestId2 = 7571
	local varQuestId3 = 7577
	local varQuestId4 = 7586
	
	if varQuest == varQuestId1 or varQuest == varQuestId2 or varQuest == varQuestId3 or varQuest == varQuestId4  then  
		local varRet = x300738_CheckSubmitSongxin2(varMap, varPlayer,varQuest )
		if varRet<=0 then
			return -1;
		end
		x300738_SetDayCount(varMap, varPlayer)
		Msg2Player(varMap,varPlayer,"您完成了任务:【国家】国家守边",8,2)
		StartTalkTask(varMap);
			TalkAppendString(varMap, "您完成了任务:【国家】国家守边");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		x300738_GiveReward(varMap,varPlayer)
		DelQuestNM( varMap, varPlayer, varQuest )
		return 1;
	end

	varQuestId1 = 7564
	varQuestId2 = 7570
	varQuestId3 = 7576
	varQuestId4 = 7585

	
	
	if varQuest == varQuestId1 or varQuest == varQuestId2 or varQuest == varQuestId3 or varQuest == varQuestId4  then  
		
		 

		 
		 
		 DelQuestNM( varMap, varPlayer, varQuest )


		 local varCountry = GetCurCountry(varMap, varPlayer);
		 
		 local iQuestID = x300738_var_Shoubian[varCountry+1] ;
			

		 
		 
		
		
		
		

		 LuaCallNoclosure(300734, "ProcQuestAccept", varMap, varPlayer, varTalknpc, iQuestID)
	end
	 

	
end

function x300738_CheckSubmitSongxin2(varMap, varPlayer,varQuest )
	if IsHaveQuestNM( varMap, varPlayer, varQuest ) == 0 then	
		return 0
	end

	return 1;
	
end


function x300738_GiveReward(varMap,varPlayer)
	
	local varLevel = GetLevel(varMap, varPlayer)
	local varExpBonus = 100*3.6*varLevel*15*x300738_var_Exp_Drop;
    if varExpBonus > 0 then
		AddExp(varMap, varPlayer, varExpBonus);
		AddHonor(varMap, varPlayer, 50);
		StartTalkTask(varMap);
		TalkAppendString(varMap, "#o获得#R经验"..varExpBonus.."点#o的奖励");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		StartTalkTask(varMap);
		TalkAppendString(varMap, "#o获得#R荣誉50点#o的奖励");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		local varReadme = "#o获得#R经验"..varExpBonus.."点#o的奖励#r#o获得#R荣誉50点#o的奖励"
  		Msg2Player(varMap,varPlayer,varReadme,4,2)
		local varRet = CountryIsFortuneTime(varMap,varPlayer,0)
		if varRet==1 then
			AddExp(varMap, varPlayer, varExpBonus);
			
			StartTalkTask(varMap);
			TalkAppendString(varMap, "#o国运令额外获得#R经验"..varExpBonus.."点#o的奖励");
			StopTalkTask();
			DeliverTalkTips(varMap, varPlayer);
			
			
			
			
			Msg2Player(varMap,varPlayer,"#o国运令额外获得#R经验"..varExpBonus.."点#o的奖励",4,2)
		end
	end

	
end


function x300738_ProcQuestAbandon( varMap, varPlayer, varQuest )
	
	local varQuestId1 = 7564
	local varQuestId2 = 7570
	local varQuestId3 = 7576
	local varQuestId4 = 7585
	if IsHaveQuestNM( varMap, varPlayer, varQuest ) > 0 then
		DelQuestNM( varMap, varPlayer, varQuest )

		local varQuestName ="【国家】国家守边"
	
		local varStr = "你放弃了任务:"..varQuestName;
		StartTalkTask(varMap)
		TalkAppendString( varMap, varStr )
		StopTalkTask( varMap )
		DeliverTalkTips( varMap, varPlayer )
		Msg2Player( varMap, varPlayer, varStr, 4, 2 )

		x300738_SetDayCount(varMap, varPlayer)
		
	end
end

function x300738_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
	LuaCallNoclosure(QUEST_SCRIPT, "ProcQuestItemChanged", varMap, varPlayer, varItemData, varQuest )
end




function x300738_GetDayCount(varMap, varPlayer)



	local varToday = GetDayOfYear()
	local varLastday = GetPlayerGameData(varMap, varPlayer, DQ_SHOUBIAN_DATE[1], DQ_SHOUBIAN_DATE[2],DQ_SHOUBIAN_DATE[3] );
	
	if varLastday ~= varToday then
		return 0
	end

	local varDaycount = GetPlayerGameData(varMap, varPlayer, DQ_SHOUBIAN_DAYCOUNT[1], DQ_SHOUBIAN_DAYCOUNT[2],DQ_SHOUBIAN_DAYCOUNT[3] );
	return varDaycount;
	

end




function x300738_SetDayCount(varMap, varPlayer)

	local varToday = GetDayOfYear()

	local varLastday = GetPlayerGameData(varMap, varPlayer, DQ_SHOUBIAN_DATE[1], DQ_SHOUBIAN_DATE[2], DQ_SHOUBIAN_DATE[3])

	if varLastday ~= varToday then
		SetPlayerGameData(varMap, varPlayer, DQ_SHOUBIAN_DATE[1], DQ_SHOUBIAN_DATE[2], DQ_SHOUBIAN_DATE[3], varToday)
		SetPlayerGameData(varMap, varPlayer, DQ_SHOUBIAN_DAYCOUNT[1], DQ_SHOUBIAN_DAYCOUNT[2], DQ_SHOUBIAN_DAYCOUNT[3], 1)
	else
		local varDaycount = GetPlayerGameData(varMap, varPlayer, DQ_SHOUBIAN_DAYCOUNT[1], DQ_SHOUBIAN_DAYCOUNT[2], DQ_SHOUBIAN_DAYCOUNT[3])
		SetPlayerGameData(varMap, varPlayer, DQ_SHOUBIAN_DAYCOUNT[1], DQ_SHOUBIAN_DAYCOUNT[2], DQ_SHOUBIAN_DAYCOUNT[3], varDaycount+1)
	end
	
	
	
end





function x300738_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	return 1
end




function x300738_DispatchQuestInfo( varMap, varPlayer, varTalknpc, varQuest )

	StartTalkTask(varMap)
		
		TalkAppendString(varMap,"#Y【国家】国家守边")
		TalkAppendString( varMap,"  我国正面临着敌国严重的骚扰和威胁，需要大家共同出力，守卫边塞。你需要到本国边塞的明安处领取国家守边任务，完成后找我回复。你愿意接受此任务？#r")

		TalkAppendString(varMap,"#Y任务目标：")
		TalkAppendString(varMap,"  到本国边塞的明安处领取国家守边任务，完成守边后找我回复，完成整个国家守边任务！#r" )
		
		TalkAppendString(varMap,"#Y任务小提示：")
		TalkAppendString(varMap,"  当您在国运令期间回复任务时，你将获得双倍的奖励！")

	StopTalkTask()
	DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x300738_var_FileId, varQuest);
end




function x300738_DispatchContinueInfo( varMap, varPlayer, varTalknpc,varQuest )

	StartTalkTask(varMap)

		
		TalkAppendString(varMap,"#Y".."国家守边未完成")
		TalkAppendString(varMap,"aaaaaa")
		TalkAppendString(varMap," ")

		
		TalkAppendString( varMap,"#Y任务目标：")
		TalkAppendString( varMap,"未完成提示bbbbbbb")
		TalkAppendString( varMap," ")

		TalkAppendString(varMap,"#Y任务提示：")
		TalkAppendString(varMap,"未完成ccccccc" )
		TalkAppendString(varMap," ")
		

	StopTalkTask()
	DeliverTalkRequire(varMap, varPlayer, varTalknpc, x300738_var_FileId, varQuest,0);
	


end




function x300738_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,varQuest )
	local bSendMail1 = 0
	for varI,item in x300738_var_SendMail1 do
		if item== varQuest then
			bSendMail1 = 1
			break
		end
	end

	StartTalkTask(varMap)
		if bSendMail1 ==1 then
			
			TalkAppendString(varMap,"#Y【国家】国家守边#r")

			TalkAppendString( varMap,"  我国正面临敌国严重的骚扰和威胁，需要大家共同出力，守卫边塞。你愿意接受此任务，守卫边塞一段时间吗？#r")

			TalkAppendString(varMap,"#Y任务目标：")
			TalkAppendString(varMap,"  您接受任务后，经过一段时间即可向我汇报军情，并完成任务得到奖励。当您的计时器变成红色时就可准备找我回复了，如错过时间，任务就会失败，请你注意时间。" )
	
			TalkAppendString(varMap,"#Y任务小提示：")
			TalkAppendString(varMap,"  任务期间死亡，离线或超时，任务自动置成失败状态，找明安重新领取。#r")
			
		else
			local localexp = (GetLevel( varMap, varPlayer )) * 100*3.6*15*x300738_var_Exp_Drop
			
			TalkAppendString(varMap,"#Y【国家】国家守边#r")
			TalkAppendString(varMap,"  感谢您为国家作出的贡献，你将获得大家的敬仰")
			TalkAppendString(varMap," ")

			TalkAppendString(varMap,"#Y任务奖励：")
			TalkAppendString(varMap,"  经验值："..localexp.."点#r  荣誉值：50点")
			
		end
	StopTalkTask()
	DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x300738_var_FileId, varQuest);

end





function x300738_QuestLogRefresh( varMap, varPlayer, varQuest)

	local bSendMail1 = 0
	for varI,item in x300738_var_SendMail1 do
		if item== varQuest then
			bSendMail1 = 1
			break
		end
	end
	
		
	StartTalkTask(varMap)
	
		if bSendMail1>0 then
			AddQuestLogCustomText( varMap,
									"",						
									"【国家】国家守边（1/3）",        
									"  到本国边塞的明安处，他是本国的大将，问问他有什么需要帮忙的！",		
									"@npc_129700",			
									"",               
									"  我国正面临着敌国严重的骚扰和威胁，需要大家共同出力，守卫边塞。你先去找本国边塞的明安，看看他有什么要帮忙的！",	
									""					
									)
		else
			local varLevel = GetLevel(varMap, varPlayer)
			local varExpBonus = 100*3.6*15 * varLevel*x300738_var_Exp_Drop
			if varExpBonus > 0 then
				AddQuestExpBonus(varMap,  varExpBonus);
				AddQuestMoneyBonus6(varMap, 50 )
			end		
			AddQuestLogCustomText( varMap,
									"",						
									"【国家】国家守边（3/3）",        
									"回报边塞的赫鲁。",		
									"@npc_129058",			
									"",               
									"把边塞的情形报告赫鲁。",	
									"当您在国运令期间回复任务时，你将获得双倍的奖励！"					
									)
		end
	StopTalkTask()
	DeliverTalkRefreshQuest(varMap, varPlayer, varQuest);
		

end

function x300738_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
	
	x300738_QuestLogRefresh( varMap, varPlayer, varQuest );
end



