

 
--DECLARE_QUEST_INFO_START--



--DECLARE_QUEST_INFO_START--

x300880_var_FileId 					= 	300880                  


x300880_var_QuestKind 				= 	1                       
x300880_var_LevelLess					= 	40                      





x300880_var_QuestName				= 	"敌国除奸"
x300880_var_QuestTarget				= 	""
x300880_var_QuestInfo				= 	""
x300880_var_ContinueInfo				= 	""
x300880_var_QuestCompleted			= 	""
x300880_var_QuestHelp				=	""          


x300880_var_ExtTarget					=	{ {type=20,n=1,target="杀死张五常"}}



x300880_var_ExpBonus					= 	0;
x300880_var_BonusItem					=	{}	

x300880_var_BonusMoney1               = 	0
x300880_var_BonusMoney2               =   0
x300880_var_BonusMoney3               =   0
x300880_var_Exp_Drop               =   10
x300880_var_BonusChoiceItem           =   {}


--DECLARE_QUEST_INFO_STOP--

x300880_var_CountryDunhuang = 351 
x300880_var_CountryLoulan = 51
x300880_var_CountryKunlun = 251
x300880_var_CountryLaiyin = 151

x300880_var_QuestId1 = 7660		
x300880_var_QuestId2 = 7651		
x300880_var_QuestId3 = 7657		
x300880_var_QuestId4 = 7654		

x300880_var_DayCountLimited			= 1


x300880_var_QuestBonusInfo			= 	"#Y获得经验#R%d#Y的奖励。"

function x300880_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	
end


function x300880_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest, varIndex )

	if varIndex ~= -1 then
		varQuest = varIndex
	end

	if IsHaveQuestNM( varMap, varPlayer, varQuest ) == 0 then	
		
		local varRet = QuestCheckAcceptNM( varMap, varPlayer, varTalknpc, varQuest )
		if varRet > 0 then	
			
			x300880_DispatchQuestInfo( varMap, varPlayer, varTalknpc, varQuest )
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
		
		if x300880_IsSuccessed( varMap, varPlayer, varQuest )>0 then
			
			x300880_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,varQuest )
		else
			
			x300880_DispatchContinueInfo( varMap, varPlayer, varTalknpc,varQuest )
		end
	end
end



function x300880_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
	if IsHaveQuestNM( varMap, varPlayer, varQuest ) > 0 then	
		return 0
	end
	local missionId = LuaCallNoclosure(310004, "ReturnHaveQuestID", varMap, varPlayer, 1)
	if	missionId ~= -1 or IsHaveQuestNM( varMap, varPlayer, x300880_var_QuestId1 ) > 0 or IsHaveQuestNM( varMap, varPlayer, x300880_var_QuestId2 ) > 0 or IsHaveQuestNM( varMap, varPlayer, x300880_var_QuestId3 ) > 0 or IsHaveQuestNM( varMap, varPlayer, x300880_var_QuestId4 ) > 0 then
		StartTalkTask(varMap)
		local varText = "您已经接过了【国家】敌国除奸任务，还未完成，不能再接取！"
		TalkAppendString( varMap, varText )
		StopTalkTask( varMap )
		DeliverTalkTips( varMap, varPlayer )
		Msg2Player(varMap,varPlayer,"您已经接过了【国家】敌国除奸任务，还未完成，不能再接取！",8,2)
		return
	end

	local varDayCount =0;

	if varQuest == x300880_var_QuestId1 then
		varDayCount = x300880_GetDayCount(varMap, varPlayer, DQ_CITAN_DUNHUANG_DATE,DQ_CITAN_DUNHUANG_DAYCOUNT)
	elseif varQuest == x300880_var_QuestId2 then
		varDayCount = x300880_GetDayCount(varMap, varPlayer, DQ_CITAN_LOULAN_DATE,DQ_CITAN_LOULAN_DAYCOUNT)
	elseif varQuest == x300880_var_QuestId3 then
		varDayCount = x300880_GetDayCount(varMap, varPlayer, DQ_CITAN_KUNLUN_DATE,DQ_CITAN_KUNLUN_DAYCOUNT)
	elseif varQuest == x300880_var_QuestId4 then
		varDayCount = x300880_GetDayCount(varMap, varPlayer, DQ_CITAN_LAIYIN_DATE,DQ_CITAN_LAIYIN_DAYCOUNT)
	else
		return -1;
	end

	if varDayCount>=x300880_var_DayCountLimited then
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
	
		
		local varFullQuest = IsQuestFullNM(varMap,varPlayer)
		
		if varFullQuest>0 then
			StartTalkTask(varMap);
				TalkAppendString(varMap, "任务已满，无法接受任务");
			StopTalkTask();
			DeliverTalkTips(varMap, varPlayer);
			return 0
		end
		
		
		varRet = AddQuestNM( varMap, varPlayer, varQuest ) 
		
		if varRet > 0 then
			StartTalkTask(varMap);
				TalkAppendString(varMap, "您接受了任务:【国家】敌国除奸");
			StopTalkTask();
			DeliverTalkTips(varMap, varPlayer);
			Msg2Player(varMap,varPlayer,"您接受了任务:【国家】敌国除奸",8,2)
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



function x300880_ProcQuestSubmit( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	
	if IsHaveQuestNM( varMap, varPlayer, varQuest ) == 0 then	
		return 0
	end

	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )
	local varRet = x300880_IsSuccessed( varMap, varPlayer, varQuest ); 
	if varRet > 0 then 
		
		return x300880_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	end
	return 0
end


function x300880_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
    
    if varQuest == nil or varQuest < 0 then
        return 0
    end
    
    if IsHaveQuestNM( varMap,varPlayer,varQuest )<= 0 then
        return 0
    end
    
	local varRet = QuestComplateNM( varMap, varPlayer, varTalknpc, varQuest, varButtonClick ) 
	if varRet == 1 then 
		
		if varQuest == x300880_var_QuestId1 then
			x300880_SetDayCount(varMap, varPlayer, DQ_CITAN_DUNHUANG_DATE,DQ_CITAN_DUNHUANG_DAYCOUNT)
		elseif varQuest == x300880_var_QuestId2 then
			x300880_SetDayCount(varMap, varPlayer, DQ_CITAN_LOULAN_DATE,DQ_CITAN_LOULAN_DAYCOUNT)
		elseif varQuest == x300880_var_QuestId3 then
			x300880_SetDayCount(varMap, varPlayer, DQ_CITAN_KUNLUN_DATE,DQ_CITAN_KUNLUN_DAYCOUNT)
		elseif varQuest == x300880_var_QuestId4 then
			x300880_SetDayCount(varMap, varPlayer, DQ_CITAN_LAIYIN_DATE,DQ_CITAN_LAIYIN_DAYCOUNT)
		else
			return -1;
		end

		StartTalkTask(varMap);
			TalkAppendString(varMap, "您完成了任务:【国家】敌国除奸");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer,"您完成了任务:【国家】敌国除奸",8,2)

		x300880_GiveReward(varMap,varPlayer)
		DelQuestNM( varMap, varPlayer, varQuest )
		LuaCallNoclosure(802005,"AddActivityQuest",varMap, varPlayer, 0,4)
		LuaCallNoclosure(888895,"EventActivity",varMap, varPlayer,4)
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
					if x300880_IsRuoGuo(varMap, varPlayer) == 1 then
						if x300880_IsMinGuo(varMap, varPlayer) == 1 then
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
			
			
			
			local strMsg = format("CGL:<Info>x300880_QuestComplate varMap=%d,varCountry=%d", varMap, varCountry )
    		WriteLog( 1, strMsg )
		end
		return 1 
	else 
		StartTalkTask(varMap);
			TalkAppendString(varMap, "完成任务错误");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		return 0
	end
	return 0
end

function x300880_GiveReward(varMap,varPlayer)
		LuaCallNoclosure(888895,"EventActivity",varMap, varPlayer,20)
 local varRandom = random (1,5) 
 if x300880_IsRuoGuo(varMap, varPlayer) == 1 then
	if x300880_IsMinGuo(varMap, varPlayer) == 1 then
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
	local nExpBonus1 = 100*5*varLevel*3*x300880_var_Exp_Drop;
	local nExpBonus2 = varLevel*2200*x300880_var_Exp_Drop;
	local varExpBonus = 0;
	if GetLevel(varMap, varPlayer) >=40 and GetLevel(varMap, varPlayer) < 70 then
		varExpBonus = nExpBonus1;
	elseif GetLevel(varMap, varPlayer) >=70 then
		varExpBonus = nExpBonus2;
	end
	
    if varExpBonus > 0 then
		AddExp(varMap, varPlayer, varExpBonus);
		AddHonor(varMap, varPlayer, 75);
		StartTalkTask(varMap);
		TalkAppendString(varMap, "#o获得#R经验"..varExpBonus.."点#o的奖励");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		StartTalkTask(varMap);
		TalkAppendString(varMap, "#o获得#R荣誉75点#o的奖励");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
  		Msg2Player(varMap,varPlayer,"#o获得#R经验"..varExpBonus.."点#o的奖励#r#o获得#R荣誉75点#o的奖励",4,2)
  		LuaCallNoclosure( 256271, "Finishchujian", varMap, varPlayer)
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
				local nLairdHornorBonus = floor((nLairdSumLevel*0.02)*75)
				
				
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


function x300880_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID,varQuestIdx, varQuest )
	if IsHaveQuestNM( varMap, varPlayer, varQuest) == 0 then	
		return
	end
		
	
	
	
		
		
	
end

 




function x300880_ProcQuestAbandon( varMap, varPlayer,varQuest )
	if IsHaveQuestNM( varMap, varPlayer, varQuest ) <= 0 then
		return -1;
	end

	if varQuest == x300880_var_QuestId1 then
		x300880_SetDayCount(varMap, varPlayer, DQ_CITAN_DUNHUANG_DATE,DQ_CITAN_DUNHUANG_DAYCOUNT)
	elseif varQuest == x300880_var_QuestId2 then
		x300880_SetDayCount(varMap, varPlayer, DQ_CITAN_LOULAN_DATE,DQ_CITAN_LOULAN_DAYCOUNT)
	elseif varQuest == x300880_var_QuestId3 then
		x300880_SetDayCount(varMap, varPlayer, DQ_CITAN_KUNLUN_DATE,DQ_CITAN_KUNLUN_DAYCOUNT)
	elseif varQuest == x300880_var_QuestId4 then
		x300880_SetDayCount(varMap, varPlayer, DQ_CITAN_LAIYIN_DATE,DQ_CITAN_LAIYIN_DAYCOUNT)
	else
		return -1;
	end

	local varRet = 0
	varRet = DelQuestNM( varMap, varPlayer, varQuest )
	if varRet == 1 then
		StartTalkTask(varMap);
			TalkAppendString(varMap, "您放弃了任务:【国家】敌国除奸");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer,"您放弃了任务:【国家】敌国除奸",8,2)
	end
end


function x300880_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
	
	
	if x300880_CountryCheck( varMap, varPlayer, varQuest ) < 0 then
		return -1;
	end

	if varObjData ~= 9525 then
		return -1;
	end

	
	
	

	local varX,z = GetWorldPos(varMap,varPlayer)
	local KilledNum =  GetNearCountryCount(varMap, varPlayer,varX,z,20)  

	

	
	
	
	for varI = 0, KilledNum-1 do
		local humanObjId = GetNearCountryMember(varMap, varPlayer,varI);
		
		if humanObjId ~= -1 then
			if IsPlayerStateNormal(varMap, humanObjId) > 0 then
				if GetHp(varMap, humanObjId) > 0 then
					if IsHaveQuestNM( varMap, humanObjId, varQuest ) > 0 then	
						x300880_ProcKillTheNpc( varMap, humanObjId, varQuest )
					end
				end
			end
		end
	end

	
end

function x300880_IsSuccessed( varMap, varPlayer, varQuest )
	if IsHaveQuestNM( varMap, varPlayer, varQuest ) > 0 then
		
		local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )
		local iRet = GetQuestParam(varMap, varPlayer, varQuestIdx, 0);
		
		if iRet>0 then
			return 1;
		end
		return 0;
	else
		return 0;
	end
end

function x300880_ProcKillTheNpc(varMap, varPlayer, varQuest)
	if IsHaveQuestNM( varMap, varPlayer, varQuest ) > 0 then
	
		if x300880_IsSuccessed( varMap, varPlayer, varQuest ) >0 then
			return 0;
		end
		local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )
		StartTalkTask(varMap)
		local varText = "您杀死了张五常：1/1";
		if varText == nil then
			varText = "";
		end
		TalkAppendString( varMap, varText )
		StopTalkTask( varMap )
		DeliverTalkTips( varMap, varPlayer )
		Msg2Player(varMap,varPlayer,"您杀死了张五常。",8,2)
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 1 )
		
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1 )
		x300880_QuestLogRefresh( varMap, varPlayer, varQuest)
	end	

end



function x300880_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
	return 0
end

function x300880_CountryCheck( varMap, varPlayer, varQuest )
	if varQuest == x300880_var_QuestId1 then
		if varMap == x300880_var_CountryDunhuang then
			return 1
		end
	elseif varQuest == x300880_var_QuestId2 then
		if varMap == x300880_var_CountryLoulan then
			return 1
		end
	elseif varQuest == x300880_var_QuestId3 then
		if varMap == x300880_var_CountryKunlun then
			return 1
		end
	elseif varQuest == x300880_var_QuestId4 then
		if varMap == x300880_var_CountryLaiyin then
			return 1
		end
	end
	
	return -1
end


function x300880_ProcLogInOrDie( varMap, varPlayer )
	
   x300880_ProcQuestFailed( varMap, varPlayer )
end



function x300880_ProcQuestFailed( varMap, varPlayer )
	
	x300880_DiGuoCiTanOnDie(varMap, varPlayer)


end


function x300880_DiGuoCiTanOnDie(varMap, varPlayer)
	
	if 0==0 then
		return
	end

	local varQuest = x300880_var_QuestId1
	if IsHaveQuestNM( varMap, varPlayer,varQuest  ) > 0 then	
		local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )
		
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 0 )
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 2 )
	end
	
	varQuest = x300880_var_QuestId2
	if IsHaveQuestNM( varMap, varPlayer,varQuest  ) > 0 then	
		local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 0 )
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 2 )
	end
	
	varQuest = x300880_var_QuestId3
	if IsHaveQuestNM( varMap, varPlayer,varQuest  ) > 0 then	
		local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )

		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 0 )
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 2 )
	end
	
	varQuest = x300880_var_QuestId4
	if IsHaveQuestNM( varMap, varPlayer,varQuest  ) > 0 then	
		local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 0 )
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 2 )
	end
end







function x300880_GetDayCount(varMap, varPlayer, nDayIndex, nDayCountIndex)


	local varToday = GetDayOfYear()
	local varLastday = GetPlayerGameData(varMap, varPlayer, nDayIndex[1], nDayIndex[2],nDayIndex[3] );
	
	if varLastday ~= varToday then
		return 0
	end

	local varDaycount = GetPlayerGameData(varMap, varPlayer, nDayCountIndex[1], nDayCountIndex[2],nDayCountIndex[3] );
	return varDaycount;
	

end




function x300880_SetDayCount(varMap, varPlayer, nDayIndex, nDayCountIndex)

	

	local varToday = GetDayOfYear()

	local varLastday = GetPlayerGameData(varMap, varPlayer, nDayIndex[1], nDayIndex[2], nDayIndex[3])

	if varLastday ~= varToday then
		SetPlayerGameData(varMap, varPlayer, nDayIndex[1], nDayIndex[2], nDayIndex[3], varToday)
		SetPlayerGameData(varMap, varPlayer, nDayCountIndex[1], nDayCountIndex[2], nDayCountIndex[3], 1)
	else
		local varDaycount = GetPlayerGameData(varMap, varPlayer, nDayCountIndex[1], nDayCountIndex[2], nDayCountIndex[3])
		SetPlayerGameData(varMap, varPlayer, nDayCountIndex[1], nDayCountIndex[2], nDayCountIndex[3], varDaycount+1)
	end
	
	
	
end





function x300880_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	return 1
end




function x300880_DispatchQuestInfo( varMap, varPlayer, varTalknpc, varQuest)

	StartTalkTask(varMap)
	local localexp1 = (GetLevel( varMap, varPlayer )) * 100*5*3*x300880_var_Exp_Drop	
	local localexp2 = (GetLevel( varMap, varPlayer )) * 2200*x300880_var_Exp_Drop
	local localexp = 0
	if GetLevel(varMap, varPlayer) >=40 and GetLevel(varMap, varPlayer) < 70 then
		localexp = localexp1;
	elseif GetLevel(varMap, varPlayer) >=70 then
		localexp = localexp2;
	end
		if varQuest == x300880_var_QuestId1 then
			TalkAppendString(varMap,"#Y【国家】敦煌除奸")
			
			
			TalkAppendString(varMap,"   经过我们的多番打探，这叛贼张五常，化装成了一家商会的大掌柜，藏匿在敦煌王国边塞。此事宜早不宜迟，你立刻出发，干掉那叛徒！")
			TalkAppendString(varMap," ")

			
			TalkAppendString( varMap,"#Y任务目标：")
			TalkAppendString( varMap,"  在本国边塞找到@npc_134511，传送到敦煌边塞，杀死敦煌边塞的大掌柜张五常。")
			TalkAppendString( varMap," ")

			TalkAppendString(varMap,"#Y任务奖励：")
			TalkAppendString(varMap,"  经验值："..localexp.."点#r  荣誉值：75点")
			TalkAppendString(varMap," ")
			
		elseif varQuest == x300880_var_QuestId2 then
			TalkAppendString(varMap,"#Y【国家】楼兰除奸")
			
			
			TalkAppendString(varMap,"   经过我们的多番打探，这叛贼张五常，化装成了一家商会的大掌柜，藏匿在楼兰王国边塞。此事宜早不宜迟，你立刻出发，干掉那叛徒！")
			TalkAppendString(varMap," ")

			
			TalkAppendString( varMap,"#Y任务目标：")
			TalkAppendString( varMap,"  在本国边塞找到@npc_134511，传送到楼兰边塞，杀死楼兰边塞的大掌柜张五常。")
			TalkAppendString( varMap," ")

			TalkAppendString(varMap,"#Y任务奖励：")
			TalkAppendString(varMap,"  经验值："..localexp.."点#r  荣誉值：75点")
			TalkAppendString(varMap," ")
			
		elseif varQuest == x300880_var_QuestId3 then
			TalkAppendString(varMap,"#y【国家】昆仑除奸")
			
			
			TalkAppendString(varMap,"   经过我们的多番打探，这叛贼张五常，化装成了一家商会的大掌柜，藏匿在昆仑王国边塞。此事宜早不宜迟，你立刻出发，干掉那叛徒！")
			TalkAppendString(varMap," ")

			
			TalkAppendString( varMap,"#Y任务目标：")
			TalkAppendString( varMap,"  在本国边塞找到@npc_134511，传送到昆仑边塞，杀死昆仑边塞的大掌柜张五常。")
			TalkAppendString( varMap," ")

			TalkAppendString(varMap,"#Y任务奖励：")
			TalkAppendString(varMap,"  经验值："..localexp.."点#r  荣誉值：75点")
			TalkAppendString(varMap," ")
			
		elseif varQuest == x300880_var_QuestId4 then
			TalkAppendString(varMap,"#Y【国家】天山除奸")
			
			
			TalkAppendString(varMap,"   经过我们的多番打探，这叛贼张五常，化装成了一家商会的大掌柜，藏匿在天山王国边塞。此事宜早不宜迟，你立刻出发，干掉那叛徒！")
			TalkAppendString(varMap," ")

			
			TalkAppendString( varMap,"#Y任务目标：")
			TalkAppendString( varMap,"  在本国边塞找到@npc_134511，传送到天山边塞，杀死天山边塞的大掌柜张五常。")
			TalkAppendString( varMap," ")

			TalkAppendString(varMap,"#Y任务奖励：")
			TalkAppendString(varMap,"  经验值："..localexp.."点#r  荣誉值：75点")
			TalkAppendString(varMap," ")
			
		else
			return -1;
		end
		
			
		
		

	StopTalkTask()
	DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x300880_var_FileId, varQuest,0);
end




function x300880_DispatchContinueInfo( varMap, varPlayer, varTalknpc,varQuest )

	

	StartTalkTask(varMap)
	local localexp1 = (GetLevel( varMap, varPlayer )) * 100*5*3*x300880_var_Exp_Drop
	local localexp2 = (GetLevel( varMap, varPlayer )) * 2200*x300880_var_Exp_Drop
	local localexp = 0
	if GetLevel(varMap, varPlayer) >=40 and GetLevel(varMap, varPlayer) < 70 then
		localexp = localexp1;
	elseif GetLevel(varMap, varPlayer) >=70 then
		localexp = localexp2;
	end
		if varQuest == x300880_var_QuestId1 then
			TalkAppendString(varMap,"#Y【国家】敦煌除奸")
		
			
			TalkAppendString(varMap,"   时间紧迫，你还是快去敦煌王国吧。")
			TalkAppendString(varMap," ")

			TalkAppendString(varMap,"#Y任务奖励：")
			TalkAppendString(varMap,"  经验值："..localexp.."点#r  荣誉值：75点")
			TalkAppendString(varMap," ")
		elseif varQuest == x300880_var_QuestId2 then
			TalkAppendString(varMap,"#Y【国家】楼兰除奸")
		
			
			TalkAppendString(varMap,"   时间紧迫，你还是快去楼兰王国吧。")
			TalkAppendString(varMap," ")

			TalkAppendString(varMap,"#Y任务奖励：")
			TalkAppendString(varMap,"  经验值："..localexp.."点#r  荣誉值：75点")
			TalkAppendString(varMap," ")
		elseif varQuest == x300880_var_QuestId3 then
			TalkAppendString(varMap,"#y【国家】昆仑除奸")
		
			
			TalkAppendString(varMap,"   时间紧迫，你还是快去昆仑王国吧。")
			TalkAppendString(varMap," ")

			TalkAppendString(varMap,"#Y任务奖励：")
			TalkAppendString(varMap,"  经验值："..localexp.."点#r  荣誉值：75点")
			TalkAppendString(varMap," ")
		elseif varQuest == x300880_var_QuestId4 then
			TalkAppendString(varMap,"#Y【国家】天山除奸")
		
			
			TalkAppendString(varMap,"   时间紧迫，你还是快去天山王国吧。")
			TalkAppendString(varMap," ")

			TalkAppendString(varMap,"#Y任务奖励：")
			TalkAppendString(varMap,"  经验值："..localexp.."点#r  荣誉值：75点")
			TalkAppendString(varMap," ")
		else
			return -1;
		end
		

	StopTalkTask()
	DeliverTalkRequire(varMap, varPlayer, varTalknpc, x300880_var_FileId, varQuest,0);
	


end




function x300880_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,varQuest )
	

	StartTalkTask(varMap)
	local localexp1 = (GetLevel( varMap, varPlayer )) * 100*5*3
	local localexp2 = (GetLevel( varMap, varPlayer )) * 2200
	local localexp = 0
	if GetLevel(varMap, varPlayer) >=40 and GetLevel(varMap, varPlayer) < 70 then
		localexp = localexp1;
	elseif GetLevel(varMap, varPlayer) >=70 then
		localexp = localexp2;
	end
		if varQuest == x300880_var_QuestId1 then
			
			TalkAppendString(varMap,"#Y【国家】敦煌除奸")
			TalkAppendString(varMap,"   这就是叛徒应有的下场，你又为我们国家立下一功！")
			TalkAppendString(varMap," ")

			TalkAppendString(varMap,"#Y任务奖励：")
			TalkAppendString(varMap,"  经验值："..localexp.."点#r  荣誉值：75点")
			TalkAppendString(varMap," ")
		elseif varQuest == x300880_var_QuestId2 then
			
			TalkAppendString(varMap,"#Y【国家】楼兰除奸")
			TalkAppendString(varMap,"   这就是叛徒应有的下场，你又为我们国家立下一功！")
			TalkAppendString(varMap," ")

			TalkAppendString(varMap,"#Y任务奖励：")
			TalkAppendString(varMap,"  经验值："..localexp.."点#r  荣誉值：75点")
			TalkAppendString(varMap," ")
		elseif varQuest == x300880_var_QuestId3 then
			
			TalkAppendString(varMap,"#y【国家】昆仑除奸")
			TalkAppendString(varMap,"   这就是叛徒应有的下场，你又为我们国家立下一功！")
			TalkAppendString(varMap," ")

			TalkAppendString(varMap,"#Y任务奖励：")
			TalkAppendString(varMap,"  经验值："..localexp.."点#r  荣誉值：75点")
			TalkAppendString(varMap," ")
		elseif varQuest == x300880_var_QuestId4 then
			
			TalkAppendString(varMap,"#Y【国家】天山除奸")
			TalkAppendString(varMap,"   这就是叛徒应有的下场，你又为我们国家立下一功！")
			TalkAppendString(varMap," ")

			TalkAppendString(varMap,"#Y任务奖励：")
			TalkAppendString(varMap,"  经验值："..localexp.."点#r  荣誉值：75点")
			TalkAppendString(varMap," ")
		else
			return -1;
		end

		
		
		
	StopTalkTask()
	DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x300880_var_FileId, varQuest);

end





function x300880_QuestLogRefresh( varMap, varPlayer, varQuest)

	local varRet = x300880_IsSuccessed( varMap, varPlayer, varQuest )
	local varStr = "";

	if varQuest == x300880_var_QuestId1 then
		if varRet>0 then
			varStr = "  从@npc_30015到敦煌边塞杀死@npc_30019（1/1）"
		else
			varStr = "  从@npc_30015到敦煌边塞杀死@npc_30019（0/1）"
		end
	elseif varQuest == x300880_var_QuestId2 then
		if varRet>0 then
			varStr = "  从@npc_30012到楼兰边塞杀死@npc_30016（1/1）"
		else
			varStr = "  从@npc_30012到楼兰边塞杀死@npc_30016（0/1）"
		end
	elseif varQuest == x300880_var_QuestId3 then
		if varRet>0 then
			varStr = "  从@npc_30014到昆仑边塞杀死@npc_30018（1/1）"
		else
			varStr = "  从@npc_30014到昆仑边塞杀死@npc_30018（0/1）"
		end
	elseif varQuest == x300880_var_QuestId4 then
		if varRet>0 then
			varStr = "  从@npc_30013到天山边塞杀死@npc_30017（1/1）"
		else
			varStr = "  从@npc_30013到天山边塞杀死@npc_30017（0/1）"
		end
	else
		return -1;
	end
		
	StartTalkTask(varMap)	
		local varLevel = GetLevel(varMap, varPlayer)
		local ExpBonus1 = 100*5*3 * varLevel*x300880_var_Exp_Drop
		local ExpBonus2 = 2200 * varLevel*x300880_var_Exp_Drop
		local varExpBonus = 0
		if GetLevel(varMap, varPlayer) >=40 and GetLevel(varMap, varPlayer) < 70 then
			varExpBonus = ExpBonus1;
		elseif GetLevel(varMap, varPlayer) >=70 then
			varExpBonus = ExpBonus2;
		end
	    if varExpBonus > 0 then
			AddQuestExpBonus(varMap,  varExpBonus);
			AddQuestMoneyBonus6(varMap, 75 )
		end		
		
	AddQuestLogCustomText( varMap,
							"",						
							"【国家】敌国除奸",        
							varStr,		
							"@npc_134503",			
							"通过@npc_134511潜入敌国，将边塞大掌柜张五常杀死。\n楼兰边塞大掌柜座标（36，203）\n天山边塞大掌柜座标（215，216）\n昆仑边塞大掌柜座标（43，45）\n敦煌边塞大掌柜座标（225，35）",               
							"想不到我们派往敌国的密探统领张五常，被敌人俘虏后竟然背叛了我们！他的手中掌握着我们大量密探的信息，看来只有干掉此人，才能防止我们苦心经营多年的密探网被彻底摧毁。",	
							"当您在出国令期间回复任务时，你将获得双倍的奖励！"					
							)
	StopTalkTask()
	DeliverTalkRefreshQuest(varMap, varPlayer, varQuest);
		

end

function x300880_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
	
	x300880_QuestLogRefresh( varMap, varPlayer, varQuest );
end
function x300880_IsRuoGuo(varMap, varPlayer)
  local maxlevel = GetTopListInfo_MaxLevel(GetWorldID(varMap, varPlayer))
	local loulanscore   = GetCountryParam(varMap, 0, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	local tianshanscore = GetCountryParam(varMap, 1, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	local kunlunscore   = GetCountryParam(varMap, 2, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	local dunhuangscore = GetCountryParam(varMap, 3, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	local allscore		= loulanscore + tianshanscore + kunlunscore + dunhuangscore
	if maxlevel >= 70 then
			if dunhuangscore <= allscore*0.2 then
	 	 		return 1
			end
	end
	return 0
end
function x300880_IsMinGuo(varMap, varPlayer)
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
