

--DECLARE_QUEST_INFO_START--

x300778_var_FileId =  300778 					
x300778_var_QuestKind 				= 	1                       
x300778_var_LevelLess					= 	40                      
x300778_var_QuestName				= 	"敌国夺旗"
x300778_var_QuestTarget				= 	""
x300778_var_QuestInfo				= 	""
x300778_var_ContinueInfo				= 	""
x300778_var_QuestCompleted			= 	""
x300778_var_QuestHelp				=	""          
x300778_var_ExtTarget					=	{ {type=20,n=1,target="敌国夺旗"}}
x300778_var_ExpBonus					= 	0;
x300778_var_BonusItem					=	{}	
x300778_var_BonusMoney1               = 	0
x300778_var_BonusMoney2               =   0
x300778_var_BonusMoney3               =   0
x300778_var_Exp_Drop               =   10
x300778_var_BonusChoiceItem           =   {}

--DECLARE_QUEST_INFO_STOP--


x300778_var_CountryDunhuang = 351 
x300778_var_CountryLoulan = 51
x300778_var_CountryKunlun = 251
x300778_var_CountryLaiyin = 151
x300778_var_QuestId1 = 7599
x300778_var_QuestId2 = 7596
x300778_var_QuestId3 = 7598
x300778_var_QuestId4 = 7597

x300778_var_DayCountLimited			= 1
x300778_var_QuestBonusInfo			= 	"#Y获得经验#R%d#Y的奖励。"

function x300778_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	
end


function x300778_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest, varIndex )

	if varIndex ~= -1 then
		varQuest = varIndex
	end

	if IsHaveQuestNM( varMap, varPlayer, varQuest ) == 0 then	
		local varRet = QuestCheckAcceptNM( varMap, varPlayer, varTalknpc, varQuest )
		if varRet > 0 then	
			
			x300778_DispatchQuestInfo( varMap, varPlayer, varTalknpc, varQuest )
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
		if x300778_IsSuccessed( varMap, varPlayer, varQuest )>0 then
			
			x300778_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,varQuest )
		else
			
			x300778_DispatchContinueInfo( varMap, varPlayer, varTalknpc,varQuest )
		end
	end
end



function x300778_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
	if	IsHaveQuestNM( varMap, varPlayer, x300778_var_QuestId1 ) > 0 or IsHaveQuestNM( varMap, varPlayer, x300778_var_QuestId2 ) > 0 or IsHaveQuestNM( varMap, varPlayer, x300778_var_QuestId3 ) > 0 or IsHaveQuestNM( varMap, varPlayer, x300778_var_QuestId4 ) > 0 then
			StartTalkTask(varMap)
			local varText = "您已经接过了【国家】敌国夺旗任务，还未完成，不能再接取"
			TalkAppendString( varMap, varText )
			StopTalkTask( varMap )
			DeliverTalkTips( varMap, varPlayer )
			Msg2Player(varMap,varPlayer,"您已经接过了【国家】敌国夺旗任务，还未完成，不能再接取",8,2)
			return
	end

	if IsHaveQuestNM( varMap, varPlayer, varQuest ) > 0 then	
		return 0
	end
	
	local varDayCount =0;

	if varQuest == x300778_var_QuestId1 then
		varDayCount = x300778_GetDayCount(varMap, varPlayer, DQ_DUOQI_DUNHUANG_DATE,DQ_DUOQI_DUNHUANG_DAYCOUNT)
	elseif varQuest == x300778_var_QuestId2 then
		varDayCount = x300778_GetDayCount(varMap, varPlayer, DQ_DUOQI_LOULAN_DATE,DQ_DUOQI_LOULAN_DAYCOUNT)
	elseif varQuest == x300778_var_QuestId3 then
		varDayCount = x300778_GetDayCount(varMap, varPlayer, DQ_DUOQI_KUNLUN_DATE,DQ_DUOQI_KUNLUN_DAYCOUNT)
	elseif varQuest == x300778_var_QuestId4 then
		varDayCount = x300778_GetDayCount(varMap, varPlayer, DQ_DUOQI_LAIYIN_DATE,DQ_DUOQI_LAIYIN_DAYCOUNT)
	else
		return -1;
	end

	if varDayCount>=x300778_var_DayCountLimited then
		StartTalkTask(varMap);
			TalkAppendString(varMap, "当日次数超过1次，请明日来接");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		return 0;
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
		varRet = AddQuestNM( varMap, varPlayer, varQuest ) 
		if varRet > 0 then
			StartTalkTask(varMap);
				TalkAppendString(varMap, "您接受了任务:【国家】敌国夺旗");
			StopTalkTask();
			DeliverTalkTips(varMap, varPlayer);
			Msg2Player(varMap,varPlayer,"您接受了任务:【国家】敌国夺旗",8,2)
			GamePlayScriptLog(varMap, varPlayer, 141)
			return 1
		elseif varRet == 0 then
			local varText = "任务获取失败，添加失败"
			StartTalkTask(varMap)
			TalkAppendString(varMap, varText);
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		elseif varRet == -1 then
			local varText = "背包已满,请整理后再来接任务"
			StartTalkTask(varMap)
			TalkAppendString(varMap, varText);
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		elseif varRet == -2 then
			local varText = "任务已满，添加任务失败"
			StartTalkTask(varMap)
			TalkAppendString(varMap, varText);
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
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



function x300778_ProcQuestSubmit( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	
	if IsHaveQuestNM( varMap, varPlayer, varQuest ) == 0 then	
		return 0
	end

	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )
	local varRet = x300778_IsSuccessed( varMap, varPlayer, varQuest ); 
	if varRet > 0 then 
		
		return x300778_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	end
	return 0
end


function x300778_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
		
		if varQuest == x300778_var_QuestId1 then
			x300778_SetDayCount(varMap, varPlayer, DQ_DUOQI_DUNHUANG_DATE,DQ_DUOQI_DUNHUANG_DAYCOUNT)
		elseif varQuest == x300778_var_QuestId2 then
			x300778_SetDayCount(varMap, varPlayer, DQ_DUOQI_LOULAN_DATE,DQ_DUOQI_LOULAN_DAYCOUNT)
		elseif varQuest == x300778_var_QuestId3 then
			x300778_SetDayCount(varMap, varPlayer, DQ_DUOQI_KUNLUN_DATE,DQ_DUOQI_KUNLUN_DAYCOUNT)
		elseif varQuest == x300778_var_QuestId4 then
			x300778_SetDayCount(varMap, varPlayer, DQ_DUOQI_LAIYIN_DATE,DQ_DUOQI_LAIYIN_DAYCOUNT)
		else
			return -1;
		end

		StartTalkTask(varMap);
			TalkAppendString(varMap, "您完成了任务:【国家】敌国夺旗");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer,"您完成了任务:【国家】敌国夺旗",8,2)
		LuaCallNoclosure(802005,"AddActivityQuest",varMap, varPlayer, 0,4)
		LuaCallNoclosure(888895,"EventActivity",varMap, varPlayer,4)
		
		x300778_GiveReward(varMap,varPlayer)
		DelQuestNM( varMap, varPlayer, varQuest )
		GamePlayScriptLog(varMap, varPlayer, 142)
 
		CancelSpecificImpact(varMap, varPlayer, 7702);
	
		
		AddCountryStrength(varMap, varPlayer, 1)	
		StartTalkTask(varMap);
		TalkAppendString(varMap, "恭喜，您为国家实力榜贡献了#R1个#O积分。");
		StopTalkTask(varMap);
		DeliverTalkTips(varMap,varPlayer);
		Msg2Player(varMap,varPlayer,"恭喜，您为国家实力榜贡献了#R1个#O积分。",8,2)		
		
		if CountryIsFortuneTime(varMap, varPlayer, 1) > 0 then
			local varCountry = GetCurCountry(varMap, varPlayer)
			SetCountryQuestData(varMap, varCountry, CD_INDEX_CHUGUO_COUNT, 1, 1 )
				
				AddExploit(varMap, varPlayer, 1)
					if x300778_IsRuoGuo(varMap, varPlayer) == 1 then
						if x300778_IsMinGuo(varMap, varPlayer) == 1 then
							AddExploit(varMap, varPlayer, 1)
							Msg2Player(varMap,varPlayer,"#o弱国额外获得#R功勋1点#o的奖励",8,2)
							Msg2Player(varMap,varPlayer,"#o弱国额外获得#R功勋1点#o的奖励",8,3)
						end
					end					
				StartTalkTask(varMap);
				TalkAppendString(varMap, "#o获得#R功勋1点#o的奖励");
				StopTalkTask(varMap);
				DeliverTalkTips(varMap,varPlayer);
				Msg2Player(varMap,varPlayer,"#o获得#R功勋1点#o的奖励",8,2)			
			
			
			
			local strMsg = format("CGL:<Info>x300778_QuestComplate varMap=%d,varCountry=%d", varMap, varCountry )
    		WriteLog( 1, strMsg )
		end
		
	return 0
end

function x300778_GiveReward(varMap,varPlayer)
		LuaCallNoclosure(888895,"EventActivity",varMap, varPlayer,16)
local varRandom = random (1,5)
	if x300778_IsRuoGuo(varMap, varPlayer) == 1 then
		if x300778_IsMinGuo(varMap, varPlayer) == 1 then
			if varRandom == 1 then
			StartItemTask( varMap )
			ItemAppendBind( varMap, 12035211, 1 )
			local varRet = StopItemTask( varMap, varPlayer )
					if varRet > 0 then
						DeliverItemListSendToPlayer(varMap,varPlayer)
						local message = format("恭喜您获得了物品：#R#{_ITEM%d}", 12035211 )
						StartTalkTask(varMap);
						TalkAppendString(varMap, message);
						StopTalkTask();
						DeliverTalkTips(varMap, varPlayer);
						Msg2Player(varMap,varPlayer, message,4,2)
						GamePlayScriptLog(varMap, varPlayer, 169)
					else
						Msg2Player(varMap,varPlayer,"背包已满，无法获得奖励道具",8,3)
						Msg2Player(varMap,varPlayer,"背包已满，无法获得奖励道具",8,2)
					end
			end
		end
	end
	local varLevel = GetLevel(varMap, varPlayer)
	local nExpBonus1 = 100*3*varLevel*5*x300778_var_Exp_Drop;
	local nExpBonus2 = varLevel*2200*x300778_var_Exp_Drop;
	local varExpBonus = 0;
	if GetLevel(varMap, varPlayer) >=40 and GetLevel(varMap, varPlayer) < 70 then
		varExpBonus = nExpBonus1;
	elseif GetLevel(varMap, varPlayer) >=70 then
		varExpBonus = nExpBonus2;
	end
    if varExpBonus > 0 then
		AddExp(varMap, varPlayer, varExpBonus);
		AddHonor(varMap, varPlayer, 100);
		StartTalkTask(varMap);
		TalkAppendString(varMap, "#o获得#R经验"..varExpBonus.."点#o的奖励");
		StopTalkTask();		
		DeliverTalkTips(varMap, varPlayer);
		StartTalkTask(varMap);
		TalkAppendString(varMap, "#o获得#R荣誉100点#o的奖励");
		StopTalkTask();		
		DeliverTalkTips(varMap, varPlayer);
  		Msg2Player(varMap,varPlayer,"#o获得#R经验"..varExpBonus.."点#o的奖励#r#o获得#R荣誉100点#o的奖励",4,2)
  		LuaCallNoclosure( 256268, "Finishduoqi", varMap, varPlayer)
		local varRet = CountryIsFortuneTime(varMap,varPlayer,1)
		if varRet == 1 then
			AddExp(varMap, varPlayer, varExpBonus);
			
			StartTalkTask(varMap);
			TalkAppendString(varMap, "#o出国令额外获得#R经验"..varExpBonus.."点#o的奖励");
			StopTalkTask();		
			DeliverTalkTips(varMap, varPlayer);
			
			
			
			
			Msg2Player(varMap,varPlayer,"#o出国令额外获得#R经验"..varExpBonus.."点#o的奖励",4,2)
			
			
			
			local varCountry = GetCurCountry(varMap,varPlayer)
			local nLairdCount,nLairdSumLevel =  LuaCallNoclosure(888888,"GetCountryLairdSceneInfo",varMap,varCountry)
			if nLairdCount > 0 then
			
				local nLairdExpBonus = floor((nLairdSumLevel*0.02)*varExpBonus)
				local nLairdHornorBonus = floor((nLairdSumLevel*0.02)*100)
				
				
				AddExp(varMap, varPlayer, nLairdExpBonus);
				AddHonor(varMap, varPlayer, nLairdHornorBonus);
				StartTalkTask(varMap);
				TalkAppendString(varMap, "#o本国领地加成获得#R经验"..nLairdExpBonus.."点#o的奖励");
				StopTalkTask();
				DeliverTalkTips(varMap, varPlayer);
				StartTalkTask(varMap);
				TalkAppendString(varMap, "#o本国领地加成获得#R荣誉"..nLairdHornorBonus.."点#o的奖励");
				StopTalkTask();
				DeliverTalkTips(varMap, varPlayer);
		  		Msg2Player(varMap,varPlayer,"#o本国领地加成获得#R经验"..nLairdExpBonus.."点#o的奖励#r#o本国领地加成获得#R荣誉"..nLairdHornorBonus.."点#o的奖励",4,2)
				
			end
		end		
	end


end


function x300778_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID,varQuestIdx, varQuest )
	if IsHaveQuestNM( varMap, varPlayer, varQuest) == 0 then	
		return
	end
		
	
	
	
		
		
	
end

 




function x300778_ProcQuestAbandon( varMap, varPlayer,varQuest )
	if IsHaveQuestNM( varMap, varPlayer, varQuest ) <= 0 then
		return -1;
	end

	if varQuest == x300778_var_QuestId1 then
		x300778_SetDayCount(varMap, varPlayer, DQ_DUOQI_DUNHUANG_DATE,DQ_DUOQI_DUNHUANG_DAYCOUNT)
	elseif varQuest == x300778_var_QuestId2 then
		x300778_SetDayCount(varMap, varPlayer, DQ_DUOQI_LOULAN_DATE,DQ_DUOQI_LOULAN_DAYCOUNT)
	elseif varQuest == x300778_var_QuestId3 then
		x300778_SetDayCount(varMap, varPlayer, DQ_DUOQI_KUNLUN_DATE,DQ_DUOQI_KUNLUN_DAYCOUNT)
	elseif varQuest == x300778_var_QuestId4 then
		x300778_SetDayCount(varMap, varPlayer, DQ_DUOQI_LAIYIN_DATE,DQ_DUOQI_LAIYIN_DAYCOUNT)
	else
		return -1;
	end

	local varRet = 0
	varRet = DelQuestNM( varMap, varPlayer, varQuest )
	if varRet == 1 then
		CancelSpecificImpact(varMap, varPlayer, 7702);
		StartTalkTask(varMap);
			TalkAppendString(varMap, "您放弃了任务:【国家】敌国夺旗");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer,"您放弃了任务:【国家】敌国夺旗",8,2)
	end
end


function x300778_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
	

end

function x300778_IsSuccessed( varMap, varPlayer, varQuest )
	if IsHaveQuestNM( varMap, varPlayer, varQuest ) > 0 then
		
		local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )
		local iRet = GetQuestParam(varMap, varPlayer, varQuestIdx, 0);
		
		if iRet>0 then
			if IsHaveSpecificImpact( varMap, varPlayer, 7702 ) > 0 then
				return 1;
			end
		end
	end

	return 0
end



function x300778_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
	return 0
end

function x300778_CountryCheck( varMap, varPlayer, varQuest )
	if varQuest == x300778_var_QuestId1 then
		if varMap == x300778_var_CountryDunhuang then
			return 1
		end
	elseif varQuest == x300778_var_QuestId2 then
		if varMap == x300778_var_CountryLoulan then
			return 1
		end
	elseif varQuest == x300778_var_QuestId3 then
		if varMap == x300778_var_CountryKunlun then
			return 1
		end
	elseif varQuest == x300778_var_QuestId4 then
		if varMap == x300778_var_CountryLaiyin then
			return 1
		end
	end
	
	return -1
end


function x300778_ProcLogInOrDie( varMap, varPlayer )
	local varQuest = x300778_var_QuestId1
	if IsHaveQuestNM( varMap, varPlayer,varQuest  ) > 0 then	
		if IsHaveSpecificImpact( varMap, varPlayer, 7702 ) > 0 then
			local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )
			SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 0 )
			SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 2 )
			CancelSpecificImpact(varMap, varPlayer, 7702);
			x300778_ProcQuestLogRefresh( varMap,varPlayer,varQuest)
			StartTalkTask(varMap);TalkAppendString(varMap,"您的敌国夺旗任务已失败，请重新领旗");StopTalkTask(varMap);DeliverTalkTips(varMap,varPlayer);
			Msg2Player(varMap,varPlayer,"您的敌国夺旗任务已失败，请重新领旗",8,2)
			SetQuestParam( varMap,varPlayer,varQuest,7,0)
		end
	end
	
	local varQuest = x300778_var_QuestId2
	if IsHaveQuestNM( varMap, varPlayer,varQuest  ) > 0 then	
		if IsHaveSpecificImpact( varMap, varPlayer, 7702 ) > 0 then
			local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )
			SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 0 )
			SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 2 )
			CancelSpecificImpact(varMap, varPlayer, 7702);
			x300778_ProcQuestLogRefresh( varMap,varPlayer,varQuest)
			StartTalkTask(varMap);TalkAppendString(varMap,"您的敌国夺旗任务已失败，请重新领旗");
			StopTalkTask(varMap);DeliverTalkTips(varMap,varPlayer);
			Msg2Player(varMap,varPlayer,"您的敌国夺旗任务已失败，请重新领旗",8,2)
			SetQuestParam( varMap,varPlayer,varQuest,7,0)
		end
	end
	
	local varQuest = x300778_var_QuestId3
	if IsHaveQuestNM( varMap, varPlayer,varQuest  ) > 0 then	
		if IsHaveSpecificImpact( varMap, varPlayer, 7702 ) > 0 then
			local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )
			SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 0 )
			SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 2 )
			CancelSpecificImpact(varMap, varPlayer, 7702);
			x300778_ProcQuestLogRefresh( varMap,varPlayer,varQuest)
			StartTalkTask(varMap);TalkAppendString(varMap,"您的敌国夺旗任务已失败，请重新领旗");
			StopTalkTask(varMap);DeliverTalkTips(varMap,varPlayer);
			Msg2Player(varMap,varPlayer,"您的敌国夺旗任务已失败，请重新领旗",8,2)
			SetQuestParam( varMap,varPlayer,varQuest,7,0)
		end
	end
	
	local varQuest = x300778_var_QuestId4
	if IsHaveQuestNM( varMap, varPlayer,varQuest  ) > 0 then	
		if IsHaveSpecificImpact( varMap, varPlayer, 7702 ) > 0 then
			local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )
			SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 0 )
			SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 2 )
			CancelSpecificImpact(varMap, varPlayer, 7702);
			x300778_ProcQuestLogRefresh( varMap,varPlayer,varQuest)
			StartTalkTask(varMap);TalkAppendString(varMap,"您的敌国夺旗任务已失败，请重新领旗");
			StopTalkTask(varMap);DeliverTalkTips(varMap,varPlayer);
			Msg2Player(varMap,varPlayer,"您的敌国夺旗任务已失败，请重新领旗",8,2)
			SetQuestParam( varMap,varPlayer,varQuest,7,0)
		end
	end
  
end

function x300778_ProcQuestLogRefresh( varMap,varPlayer,varQuest)
	
	
	

	
	
	
	local varRet = x300778_IsSuccessed( varMap, varPlayer, varQuest )
	local varStr = "";

	if varQuest == x300778_var_QuestId1 then
		if varRet>0 then
			varStr = "  从@npc_30003到敦煌边塞夺取@npc_30031（1/1）"
		else
			varStr = "  从@npc_30003到敦煌边塞夺取@npc_30031（0/1）"
		end
	elseif varQuest == x300778_var_QuestId2 then
		if varRet>0 then
			varStr = "  从@npc_30000到楼兰边塞夺取@npc_30028（1/1）"
		else
			varStr = "  从@npc_30000到楼兰边塞夺取@npc_30028（0/1）"
		end
	elseif varQuest == x300778_var_QuestId3 then
		if varRet>0 then
			varStr = "  从@npc_30002到昆仑边塞夺取@npc_30030（1/1）"
		else
			varStr = "  从@npc_30002到昆仑边塞夺取@npc_30030（0/1）"
		end
	elseif varQuest == x300778_var_QuestId4 then
		if varRet>0 then
			varStr = "  从@npc_30001到天山边塞夺取@npc_30029（1/1）"
		else
			varStr = "  从@npc_30001到天山边塞夺取@npc_30029（0/1）"
		end
	else
		return -1;
	end


	StartTalkTask(varMap)	
		local varLevel = GetLevel(varMap, varPlayer)
		local ExpBonus1 = 100*5*3 * varLevel*x300778_var_Exp_Drop
		local ExpBonus2 = 2200 * varLevel*x300778_var_Exp_Drop
		local varExpBonus = 0
		if GetLevel(varMap, varPlayer) >=40 and GetLevel(varMap, varPlayer) < 70 then
			varExpBonus = ExpBonus1;
		elseif GetLevel(varMap, varPlayer) >=70 then
			varExpBonus = ExpBonus2;
		end
	    if varExpBonus > 0 then
			AddQuestExpBonus(varMap,  varExpBonus);
			AddQuestMoneyBonus6(varMap, 100 )
		end		
		
	AddQuestLogCustomText( varMap,
							"",						
							"【国家】敌国夺旗",        
							varStr,		
							"@npc_125500",			
							"通过@npc_125509潜入敌国，到边塞（126，123）附近夺取军旗。",               
							"兵者，攻心为上。若想要打击敌人的士气，最好的办法莫过于夺取他们的军旗！",	
							"当您在出国令期间回复任务时，你将获得双倍的奖励！当任务失败时，您可以重新去敌国边塞战旗处获得战旗！"					
							)
	StopTalkTask()
	DeliverTalkRefreshQuest(varMap, varPlayer, varQuest);

end





function x300778_GetLastDay(varMap, varPlayer, nMDIndex, nOffset, nSize)
	local varLastday = GetPlayerGameData(varMap, varPlayer, nMDIndex, nOffset, nSize)
	return varLastday
end




function x300778_GetLastDayCount(varMap, varPlayer, nMDIndex, nOffset, nSize)
	local varDaycount =  GetPlayerGameData(varMap, varPlayer, nMDIndex, nOffset, nSize)
	return varDaycount
end




function x300778_GetDayCount(varMap, varPlayer, nMDDayIndex, nMDCountIndex)
	local varToday = GetDayOfYear()
	local varLastday = x300778_GetLastDay(varMap, varPlayer, nMDDayIndex[1], nMDDayIndex[2], nMDDayIndex[3])

	
	if varToday ~= varLastday then
		return 0
	end

	local varDaycount = x300778_GetLastDayCount(varMap, varPlayer, nMDCountIndex[1], nMDCountIndex[2], nMDCountIndex[3])
	return varDaycount
end




function x300778_SetLastDay(varMap, varPlayer, nMDIndex, nOffset, nSize, day)
	SetPlayerGameData(varMap, varPlayer, nMDIndex, nOffset, nSize, day)
end




function x300778_SetLastDayCount(varMap, varPlayer, nMDIndex, nOffset, nSize, varCount)
	SetPlayerGameData(varMap, varPlayer, nMDIndex, nOffset, nSize, varCount)
end




function x300778_SetDayCount(varMap, varPlayer, nMDDayIndex, nMDCountIndex)
	local varToday = GetDayOfYear()
	local varLastday = x300778_GetLastDay(varMap, varPlayer, nMDDayIndex[1], nMDDayIndex[2], nMDDayIndex[3])

	
	if varToday ~= varLastday then
		x300778_SetLastDay(varMap, varPlayer, nMDDayIndex[1], nMDDayIndex[2], nMDDayIndex[3], varToday)
		x300778_SetLastDayCount(varMap, varPlayer, nMDCountIndex[1], nMDCountIndex[2], nMDCountIndex[3], 1)
		return
	end

	
	local varDaycount = x300778_GetLastDayCount(varMap, varPlayer, nMDDayIndex[1], nMDDayIndex[2], nMDDayIndex[3]) + 1
	x300778_SetLastDayCount(varMap, varPlayer, nMDCountIndex[1], nMDCountIndex[2], nMDCountIndex[3], varDaycount)

end


function x300778_DispatchQuestInfo( varMap, varPlayer, varTalknpc, varQuest)

	StartTalkTask(varMap)
	local localexp1 = (GetLevel( varMap, varPlayer )) * 100*5*3*x300778_var_Exp_Drop
	local localexp2 = (GetLevel( varMap, varPlayer )) * 2200*x300778_var_Exp_Drop
	local localexp = 0
	if GetLevel(varMap, varPlayer) >=40 and GetLevel(varMap, varPlayer) < 70 then
		localexp = localexp1;
	elseif GetLevel(varMap, varPlayer) >=70 then
		localexp = localexp2;
	end
		if varQuest == x300778_var_QuestId1 then
			TalkAppendString(varMap,"#Y【国家】敦煌夺旗")
			
			
			TalkAppendString(varMap,"   如果你夺取了敦煌军旗并凯旋而归，不但能强烈动摇敦煌的军心，也能大大鼓舞我军的士气！")
			TalkAppendString(varMap," ")

			
			TalkAppendString( varMap,"#Y任务目标：")
			TalkAppendString( varMap,"  在本国边塞找到@npc_125509，传送到敦煌边塞，到边塞战旗处夺取敌国军旗。")
			TalkAppendString( varMap," ")

			TalkAppendString(varMap,"#Y任务奖励：")
			TalkAppendString(varMap,"  经验值："..localexp.."点#r  荣誉值：100点")
			TalkAppendString(varMap," ")
			
		elseif varQuest == x300778_var_QuestId2 then
			TalkAppendString(varMap,"#Y【国家】楼兰夺旗")
			
			
			TalkAppendString(varMap,"   楼兰边塞的边塞战旗，负责掌管象征着楼兰大军的军旗，如果你夺取了楼兰军旗并凯旋而归，不但能强烈动摇楼兰的军心，也能大大鼓舞我军的士气！")
			TalkAppendString(varMap," ")

			
			TalkAppendString( varMap,"#Y任务目标：")
			TalkAppendString( varMap,"  在本国边塞找到@npc_125509，传送到楼兰边塞，到边塞战旗处夺取敌国军旗。")
			TalkAppendString( varMap," ")

			TalkAppendString(varMap,"#Y任务奖励：")
			TalkAppendString(varMap,"  经验值："..localexp.."点#r  荣誉值：100点")
			TalkAppendString(varMap," ")
			
		elseif varQuest == x300778_var_QuestId3 then
			TalkAppendString(varMap,"#y【国家】昆仑夺旗")
			
			
			TalkAppendString(varMap,"   昆仑边塞的边塞战旗，负责掌管象征着昆仑大军的军旗，如果你夺取了昆仑军旗并凯旋而归，不但能强烈动摇昆仑的军心，也能大大鼓舞我军的士气！")
			TalkAppendString(varMap," ")

			
			TalkAppendString( varMap,"#Y任务目标：")
			TalkAppendString( varMap,"  在本国边塞找到@npc_125509，传送到昆仑边塞，到边塞战旗处夺取敌国军旗。")
			TalkAppendString( varMap," ")

			TalkAppendString(varMap,"#Y任务奖励：")
			TalkAppendString(varMap,"  经验值："..localexp.."点#r  荣誉值：100点")
			TalkAppendString(varMap," ")
			
		elseif varQuest == x300778_var_QuestId4 then
			TalkAppendString(varMap,"#Y【国家】天山夺旗")
			
			
			TalkAppendString(varMap,"   天山边塞的边塞战旗，负责掌管象征着天山大军的军旗，如果你夺取了天山军旗并凯旋而归，不但能强烈动摇天山的军心，也能大大鼓舞我军的士气！")
			TalkAppendString(varMap," ")

			
			TalkAppendString( varMap,"#Y任务目标：")
			TalkAppendString( varMap,"  在本国边塞找到@npc_125509，传送到天山边塞，到边塞战旗处夺取敌国军旗。")
			TalkAppendString( varMap," ")

			TalkAppendString(varMap,"#Y任务奖励：")
			TalkAppendString(varMap,"  经验值："..localexp.."点#r  荣誉值：100点")
			TalkAppendString(varMap," ")
			
		else
			return -1;
		end
		
	StopTalkTask()
	DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x300778_var_FileId, varQuest,0);
end



function x300778_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,varQuest )
	

	StartTalkTask(varMap)
	local localexp1 = (GetLevel( varMap, varPlayer )) * 100*5*3*x300778_var_Exp_Drop
	local localexp2 = (GetLevel( varMap, varPlayer )) * 2200*x300778_var_Exp_Drop
	local localexp = 0
	if GetLevel(varMap, varPlayer) >=40 and GetLevel(varMap, varPlayer) < 70 then
		localexp = localexp1;
	elseif GetLevel(varMap, varPlayer) >=70 then
		localexp = localexp2;
	end
		if varQuest == x300778_var_QuestId1 then
			TalkAppendString(varMap,"#Y【国家】敦煌夺旗")
			TalkAppendString(varMap,"   很好！我们夺来的军旗又多了一面。")
			TalkAppendString(varMap," ")

			TalkAppendString(varMap,"#Y任务奖励：")
			TalkAppendString(varMap,"  经验值："..localexp.."点#r  荣誉值：100点")
			TalkAppendString(varMap," ")
			
		elseif varQuest == x300778_var_QuestId2 then
			TalkAppendString(varMap,"#Y【国家】楼兰夺旗")
			TalkAppendString(varMap,"   很好！我们夺来的军旗又多了一面。")
			TalkAppendString(varMap," ")

			TalkAppendString(varMap,"#Y任务奖励：")
			TalkAppendString(varMap,"  经验值："..localexp.."点#r  荣誉值：100点")
			
		elseif varQuest == x300778_var_QuestId3 then
			TalkAppendString(varMap,"#y【国家】昆仑夺旗")
			TalkAppendString(varMap,"   很好！我们夺来的军旗又多了一面。")
			TalkAppendString(varMap," ")

			TalkAppendString(varMap,"#Y任务奖励：")
			TalkAppendString(varMap,"  经验值："..localexp.."点#r  荣誉值：100点")
			
		elseif varQuest == x300778_var_QuestId4 then
			TalkAppendString(varMap,"#Y【国家】天山夺旗")
			TalkAppendString(varMap,"   很好！我们夺来的军旗又多了一面。")
			TalkAppendString(varMap," ")

			TalkAppendString(varMap,"#Y任务奖励：")
			TalkAppendString(varMap,"  经验值："..localexp.."点#r  荣誉值：100点")
			
		else
			return -1;
		end	
	StopTalkTask()
	DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x300778_var_FileId, varQuest);

end



function x300778_DispatchContinueInfo( varMap, varPlayer, varTalknpc,varQuest )

	StartTalkTask(varMap)
	local localexp1 = (GetLevel( varMap, varPlayer )) * 100*5*3*x300778_var_Exp_Drop
	local localexp2 = (GetLevel( varMap, varPlayer )) * 2200*x300778_var_Exp_Drop
	local localexp = 0
	if GetLevel(varMap, varPlayer) >=40 and GetLevel(varMap, varPlayer) < 70 then
		localexp = localexp1;
	elseif GetLevel(varMap, varPlayer) >=70 then
		localexp = localexp2;
	end
		if varQuest == x300778_var_QuestId1 then
			TalkAppendString(varMap,"#Y【国家】敦煌夺旗")
		
			
			TalkAppendString(varMap,"   怎么？难道你看到那敦煌军旗下的重重守卫，有所胆怯？")
			TalkAppendString(varMap," ")

			TalkAppendString(varMap,"#Y任务奖励：")
			TalkAppendString(varMap,"  经验值："..localexp.."点#r  荣誉值：100点")
			TalkAppendString(varMap," ")
			
		elseif varQuest == x300778_var_QuestId2 then
			TalkAppendString(varMap,"#Y【国家】楼兰夺旗")
		
			
			TalkAppendString(varMap,"   怎么？难道你看到那楼兰军旗下的重重守卫，有所胆怯？")
			TalkAppendString(varMap," ")

			TalkAppendString(varMap,"#Y任务奖励：")
			TalkAppendString(varMap,"  经验值："..localexp.."点#r  荣誉值：100点")
			TalkAppendString(varMap," ")
			
		elseif varQuest == x300778_var_QuestId3 then
			TalkAppendString(varMap,"#y【国家】昆仑夺旗")
		
			
			TalkAppendString(varMap,"   怎么？难道你看到那昆仑军旗下的重重守卫，有所胆怯？")
			TalkAppendString(varMap," ")

			TalkAppendString(varMap,"#Y任务奖励：")
			TalkAppendString(varMap,"  经验值："..localexp.."点#r  荣誉值：100点")
			TalkAppendString(varMap," ")
			
		elseif varQuest == x300778_var_QuestId4 then
			TalkAppendString(varMap,"#Y【国家】天山夺旗")
		
			
			TalkAppendString(varMap,"   怎么？难道你看到那天山军旗下的重重守卫，有所胆怯？")
			TalkAppendString(varMap," ")

			TalkAppendString(varMap,"#Y任务奖励：")
			TalkAppendString(varMap,"  经验值："..localexp.."点#r  荣誉值：100点")
			TalkAppendString(varMap," ")
			
		else
			return -1;
		end	
	StopTalkTask()
	DeliverTalkRequire(varMap, varPlayer, varTalknpc, x300778_var_FileId, varQuest,0);		
end
function x300778_IsRuoGuo(varMap, varPlayer)
  local maxlevel = GetTopListInfo_MaxLevel(GetWorldID(varMap, varPlayer))
  local nCountryIdx = GetCurCountry(varMap, varPlayer);
	local selfscore = GetCountryParam(varMap, nCountryIdx, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	local loulanscore   = GetCountryParam(varMap, 0, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	local tianshanscore = GetCountryParam(varMap, 1, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	local kunlunscore   = GetCountryParam(varMap, 2, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	local dunhuangscore = GetCountryParam(varMap, 3, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	local allscore		= loulanscore + tianshanscore + kunlunscore + dunhuangscore

	if maxlevel >= 70 then
			if selfscore <= allscore*0.2 then
	 	 		return 1
			end
	end
	return 0
end
function x300778_IsMinGuo(varMap, varPlayer)
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
