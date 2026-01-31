
--DECLARE_QUEST_INFO_START--

x300889_var_FileId 					= 	300889                  


x300889_var_QuestKind 				= 	1                       
x300889_var_LevelLess					= 	40                      





x300889_var_QuestName				= 	"敌国情报"
x300889_var_QuestTarget				= 	""
x300889_var_QuestInfo				= 	""
x300889_var_ContinueInfo				= 	""
x300889_var_QuestCompleted			= 	""
x300889_var_QuestHelp				=	""          


x300889_var_ExtTarget					=	{ {type=20,n=10,target="获得情报"}}



x300889_var_ExpBonus					= 	0;
x300889_var_BonusItem					=	{}	

x300889_var_BonusMoney1               = 	0
x300889_var_BonusMoney2               =   0
x300889_var_BonusMoney3               =   0
x300889_var_Exp_Drop               =   10
x300889_var_BonusChoiceItem           =   {}


--DECLARE_QUEST_INFO_STOP--

x300889_var_LevelNeeded = 65

x300889_var_DayCountLimited	=  1

x300889_var_QuestId1 = 7685  
x300889_var_QuestId2 = 7676
x300889_var_QuestId3 = 7682
x300889_var_QuestId4 = 7679
x300889_var_CountryDunhuang =  351
x300889_var_CountryLouLan =  51
x300889_var_CountryKunlun = 251
x300889_var_CountryLaiYin = 151

x300889_var_NeedItemID = 13011006
x300889_var_NeedItemCount = 1

x300889_var_QuestBonusInfo  = 	"#Y获得经验#R%d#Y的奖励。"
              
function x300889_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	
end


function x300889_CheckSubmit( varMap, varPlayer, varQuest )
	if IsHaveQuestNM( varMap, varPlayer, varQuest) == 0 then
		return 0;
	end

	if varQuest ~= x300889_var_QuestId1 and varQuest ~= x300889_var_QuestId2 and varQuest ~= x300889_var_QuestId3 and varQuest ~= x300889_var_QuestId4 then
		return 0;
	end

	local ItemCnt = GetItemCount( varMap, varPlayer, x300889_var_NeedItemID )

	if ItemCnt<x300889_var_NeedItemCount then
		return 0;
	end

	return 1;


end


function x300889_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest, varIndex )
	
	if varIndex ~= -1 then
		varQuest = varIndex
	end

	if IsHaveQuestNM( varMap, varPlayer, varQuest ) == 0 then	
	
		if	IsHaveQuestNM( varMap, varPlayer, x300889_var_QuestId1 ) > 0 or IsHaveQuestNM( varMap, varPlayer, x300889_var_QuestId2 ) > 0 or IsHaveQuestNM( varMap, varPlayer, x300889_var_QuestId3 ) > 0 or IsHaveQuestNM( varMap, varPlayer, x300889_var_QuestId4 ) > 0 then
			
			
			
			
			
			
			
		end
		
			local varRet = QuestCheckAcceptNM( varMap, varPlayer, varTalknpc, varQuest )
			if varRet > 0 then	
				
				x300889_DispatchQuestInfo( varMap, varPlayer, varTalknpc, varQuest )
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
		
		if x300889_CheckSubmit( varMap, varPlayer, varQuest )>0 then
			
			x300889_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,varQuest )
		else
			
			x300889_DispatchContinueInfo( varMap, varPlayer, varTalknpc,varQuest )
		end
	end
		
end


function x300889_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
	if IsHaveQuestNM( varMap, varPlayer, varQuest ) > 0 then	
		return 0
	end

	

	if	IsHaveQuestNM( varMap, varPlayer, x300889_var_QuestId1 ) > 0 or IsHaveQuestNM( varMap, varPlayer, x300889_var_QuestId2 ) > 0 or IsHaveQuestNM( varMap, varPlayer, x300889_var_QuestId3 ) > 0 or IsHaveQuestNM( varMap, varPlayer, x300889_var_QuestId4 ) > 0 then
			StartTalkTask(varMap)
			local varText = "您已经接过了【国家】敌国情报任务，还未完成，不能再接取！"
			TalkAppendString( varMap, varText )
			StopTalkTask( varMap )
			DeliverTalkTips( varMap, varPlayer )
			Msg2Player(varMap,varPlayer,"您已经接过了【国家】敌国情报任务，还未完成，不能再接取！",8,2)
			return
	end

	local varDayCount =0;

	if varQuest == x300889_var_QuestId1 then
		varDayCount = x300889_GetDayCount(varMap, varPlayer, DQ_MIBAO_DUNHUANG_DATE,DQ_MIBAO_DUNHUANG_DAYCOUNT)
	elseif varQuest == x300889_var_QuestId2 then
		varDayCount = x300889_GetDayCount(varMap, varPlayer, DQ_MIBAO_LOULAN_DATE,DQ_MIBAO_LOULAN_DAYCOUNT)
	elseif varQuest == x300889_var_QuestId3 then
		varDayCount = x300889_GetDayCount(varMap, varPlayer, DQ_MIBAO_KUNLUN_DATE,DQ_MIBAO_KUNLUN_DAYCOUNT)
	elseif varQuest == x300889_var_QuestId4 then
		varDayCount = x300889_GetDayCount(varMap, varPlayer, DQ_MIBAO_LAIYIN_DATE,DQ_MIBAO_LAIYIN_DAYCOUNT)
	else
		return -1;
	end

	if varDayCount>=x300889_var_DayCountLimited then
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
			return 0;
		end
		
	
		varRet = AddQuestNM( varMap, varPlayer, varQuest ) 
		if varRet > 0 then
			
			
			StartTalkTask(varMap);
				TalkAppendString(varMap, "您接受了任务:【国家】敌国情报");
			StopTalkTask();
			DeliverTalkTips(varMap, varPlayer);
			Msg2Player(varMap,varPlayer,"您接受了任务:【国家】敌国情报",8,2)

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



function x300889_ProcQuestSubmit( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	
	if IsHaveQuestNM( varMap, varPlayer, varQuest ) == 0 then	
		return 0
	end

	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )
	local varRet = x300889_CheckSubmit( varMap, varPlayer, varQuest ) 
	if varRet > 0 then 
		return x300889_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	end
	return 0
end


function x300889_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
    
    if varQuest == nil or varQuest < 0 then
        return 0
    end
    
    if IsHaveQuestNM( varMap,varPlayer,varQuest )<= 0 then
        return 0
    end
    
	local varRet = QuestComplateNM( varMap, varPlayer, varTalknpc, varQuest, varButtonClick ) 
	if varRet == 1 then 
		


		local ItemCnt = GetItemCount( varMap, varPlayer, x300889_var_NeedItemID )
		if ItemCnt > 0 then 
			if DelItem(varMap, varPlayer,x300889_var_NeedItemID,ItemCnt)	 ~= 1 then return 0 end
		else	
		end	
		

		if varQuest == x300889_var_QuestId1 then
			x300889_SetDayCount(varMap, varPlayer, DQ_MIBAO_DUNHUANG_DATE,DQ_MIBAO_DUNHUANG_DAYCOUNT)
		elseif varQuest == x300889_var_QuestId2 then
			x300889_SetDayCount(varMap, varPlayer, DQ_MIBAO_LOULAN_DATE,DQ_MIBAO_LOULAN_DAYCOUNT)
		elseif varQuest == x300889_var_QuestId3 then
			x300889_SetDayCount(varMap, varPlayer, DQ_MIBAO_KUNLUN_DATE,DQ_MIBAO_KUNLUN_DAYCOUNT)
		elseif varQuest == x300889_var_QuestId4 then
			x300889_SetDayCount(varMap, varPlayer, DQ_MIBAO_LAIYIN_DATE,DQ_MIBAO_LAIYIN_DAYCOUNT)
		else
			return -1;
		end

		
		StartTalkTask(varMap);
			TalkAppendString(varMap, "您完成了任务:【国家】敌国情报");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer,"您完成了任务:【国家】敌国情报",8,2)
		
		x300889_GiveReward(varMap,varPlayer)
		DelQuestNM( varMap, varPlayer, varQuest )
		LuaCallNoclosure(802005,"AddActivityQuest",varMap, varPlayer, 0,4)
		LuaCallNoclosure(888895,"EventActivity",varMap, varPlayer,4)
		
		AddCountryStrength(varMap, varPlayer, 1)	
		StartTalkTask(varMap);
		TalkAppendString(varMap, "恭喜，您为国家实力榜贡献了#R1个#o积分。");
		StopTalkTask(varMap);
		DeliverTalkTips(varMap,varPlayer);
		Msg2Player(varMap,varPlayer,"恭喜，您为国家实力榜贡献了#R1个#o积分。",8,2)		
		
		if CountryIsFortuneTime(varMap, varPlayer, 1) > 0 then
			local varCountry = GetCurCountry(varMap, varPlayer)
			SetCountryQuestData(varMap, varCountry, CD_INDEX_CHUGUO_COUNT, 1, 1 )	
			
			
			
			
			
				
				AddExploit(varMap, varPlayer, 1)
					if x300889_IsRuoGuo(varMap, varPlayer) == 1 then
						if x300889_IsMinGuo(varMap, varPlayer) == 1 then
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
			
		
			local strMsg = format("CGL:<Info>x300889_QuestComplate varMap=%d,varCountry=%d", varMap, varCountry )
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


function x300889_GiveReward(varMap,varPlayer)
		LuaCallNoclosure(888895,"EventActivity",varMap, varPlayer,19)
		
 local varRandom = random (1,5)
	if x300889_IsRuoGuo(varMap, varPlayer) == 1 then  
		if x300889_IsMinGuo(varMap, varPlayer) == 1 then
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
	local nExpBonus1 = 100*2.6*varLevel*5*x300889_var_Exp_Drop;
	local nExpBonus2 = varLevel*1750*x300889_var_Exp_Drop;
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
  		LuaCallNoclosure( 256269, "Finishqingbao", varMap, varPlayer)
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

function x300889_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID,varQuestIdx, varQuest )

	if IsHaveQuestNM( varMap, varPlayer, varQuest) == 0 then	
		return
	end
		
	
	
	
		
		
	
end




function x300889_ProcQuestAbandon( varMap, varPlayer,varQuest )
	local varRet = 0

	if varQuest == x300889_var_QuestId1 then
		x300889_SetDayCount(varMap, varPlayer, DQ_MIBAO_DUNHUANG_DATE,DQ_MIBAO_DUNHUANG_DAYCOUNT)
	elseif varQuest == x300889_var_QuestId2 then
		x300889_SetDayCount(varMap, varPlayer, DQ_MIBAO_LOULAN_DATE,DQ_MIBAO_LOULAN_DAYCOUNT)
	elseif varQuest == x300889_var_QuestId3 then
		x300889_SetDayCount(varMap, varPlayer, DQ_MIBAO_KUNLUN_DATE,DQ_MIBAO_KUNLUN_DAYCOUNT)
	elseif varQuest == x300889_var_QuestId4 then
		x300889_SetDayCount(varMap, varPlayer, DQ_MIBAO_LAIYIN_DATE,DQ_MIBAO_LAIYIN_DAYCOUNT)
	else
		return -1;
	end

	varRet = DelQuestNM( varMap, varPlayer, varQuest )
	if varRet == 1 then
		
		StartTalkTask(varMap);
			TalkAppendString(varMap, "您放弃了任务:【国家】敌国情报");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer,"您放弃了任务:【国家】敌国情报",8,2)
	end
end


function x300889_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end



function x300889_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
    
    if varQuest == nil or varQuest < 0 then
        return 0
    end
    
    if IsHaveQuestNM(varMap,varPlayer,varQuest) <= 0 then
        return 0
    end
    
	
	local NeedNum, ObjIndex = GetQuestNeedItemNumNM( varMap, varPlayer, varQuest, varItemData )
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )

	if NeedNum > 0 then
		local Num = GetItemCount( varMap, varPlayer, varItemData )
		
		if Num < NeedNum then 
 			SetQuestByIndex( varMap, varPlayer, varQuestIdx, ObjIndex, Num )         
			SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 0 )
			x300889_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
		elseif Num >= NeedNum then
			
			SetQuestByIndex( varMap, varPlayer, varQuestIdx, ObjIndex, NeedNum )         
			local MisCareNPC = QuestCareNPCNM( varMap, varPlayer, varQuestIdx )
			if MisCareNPC == 0 then 
				local varRet = QuestCheckSubmitNM( varMap, varPlayer, varPlayer, varQuest, varQuestIdx ) 
				if varRet > 0 then 
					x300889_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
					return x300889_QuestComplate( varMap, varPlayer, varPlayer, -1, varQuest )
				end
			end

			x300889_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
		end
	end

end


function x300889_CountryCheck( varMap, varPlayer, varQuest )
	if varQuest == x300889_var_QuestId1 then
		if varMap == x300889_var_CountryDunhuang then
			return 1
		end
	elseif varQuest == x300889_var_QuestId2 then
		if varMap == x300889_var_CountryLouLan then
			return 1
		end
	elseif varQuest == x300889_var_QuestId3 then
		if varMap == x300889_var_CountryKunlun then
			return 1
		end
	elseif varQuest == x300889_var_QuestId4 then
		if varMap == x300889_var_CountryLaiYin then
			return 1
		end
	end

	return -1
	
end

function x300889_ProcLogInOrDie( varMap, varPlayer )
	
   x300889_ProcQuestFailed( varMap, varPlayer )
end



function x300889_ProcQuestFailed( varMap, varPlayer )
	
	x300889_DiGuoQiangLiangOnDie(varMap, varPlayer)

end

function x300889_DiGuoQiangLiangOnDie( varMap, varPlayer )
	if 0==0 then
		return
	end

	local varQuest = x300889_var_QuestId1
	local varItem = x300889_var_NeedItemID;
	if IsHaveQuestNM( varMap, varPlayer,varQuest  ) > 0 then	
		
		local ItemCnt = GetItemCount( varMap, varPlayer, varItem )
		if ItemCnt > 0 then 
			
		else
			local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )
			SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 0 )
		end
		return
	end
	varQuest = x300889_var_QuestId2
	if IsHaveQuestNM( varMap, varPlayer,varQuest  ) > 0 then	
		
		local ItemCnt = GetItemCount( varMap, varPlayer, varItem )
		if ItemCnt > 0 then 
			
		else
			local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )
			SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 0 )
		end
		return
	end
	varQuest = x300889_var_QuestId3
	if IsHaveQuestNM( varMap, varPlayer,varQuest  ) > 0 then	
		
		local ItemCnt = GetItemCount( varMap, varPlayer, varItem )
		if ItemCnt > 0 then 
			
		else
			local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )
			SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 0 )
		end
		return
	end
	varQuest = x300889_var_QuestId4
	if IsHaveQuestNM( varMap, varPlayer,varQuest  ) > 0 then	
		
		local ItemCnt = GetItemCount( varMap, varPlayer, varItem )
		if ItemCnt > 0 then 
			
		else
			local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )
			SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 0 )
		end
		return
	end
end





function x300889_GetDayCount(varMap, varPlayer, nDayIndex, nDayCountIndex)



	local varToday = GetDayOfYear()
	local varLastday = GetPlayerGameData(varMap, varPlayer, nDayIndex[1], nDayIndex[2],nDayIndex[3] );
	
	if varLastday ~= varToday then
		return 0
	end

	local varDaycount = GetPlayerGameData(varMap, varPlayer, nDayCountIndex[1], nDayCountIndex[2],nDayCountIndex[3] );
	return varDaycount;

	

end




function x300889_SetDayCount(varMap, varPlayer, nDayIndex, nDayCountIndex)

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





function x300889_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	return 1
end




function x300889_DispatchQuestInfo( varMap, varPlayer, varTalknpc, varQuest)

	StartTalkTask(varMap)
	local localexp1 = (GetLevel( varMap, varPlayer )) * 100*2.6*5*x300889_var_Exp_Drop
	local localexp2 = (GetLevel( varMap, varPlayer )) * 1750*x300889_var_Exp_Drop
	local localexp = 0
	if GetLevel(varMap, varPlayer) >=40 and GetLevel(varMap, varPlayer) < 70 then
		localexp = localexp1;
	elseif GetLevel(varMap, varPlayer) >=70 then
		localexp = localexp2;
	end
		if varQuest == x300889_var_QuestId1 then
			TalkAppendString(varMap,"#Y【国家】敦煌情报")
			
			
			TalkAppendString(varMap,"   我们的一位暗探，不幸在敦煌被人识破了身份，情急之下，他将最重要的情报藏在了敦煌暗道。\n\t这份情报中有着敌国重要军力的调动情况，你这就前往敦煌暗道，将情报秘密的取回来，当然，你要小心行事，我不想再派出另一位勇士去重复同样的使命。")
			TalkAppendString(varMap," ")

			
			TalkAppendString( varMap,"#Y任务目标：")
			TalkAppendString( varMap,"  在本国边塞找到@npc_128511，传送到敦煌边塞，到敦煌暗道获取密报。")
			TalkAppendString( varMap," ")

			TalkAppendString(varMap,"#Y任务奖励：")
			TalkAppendString(varMap,"  经验值："..localexp.."点#r  荣誉值：75点")
			TalkAppendString(varMap," ")

		elseif varQuest == x300889_var_QuestId2 then
			TalkAppendString(varMap,"#Y【国家】楼兰情报")
			
			
			TalkAppendString(varMap,"   我们的一位暗探，不幸在楼兰被人识破了身份，情急之下，他将最重要的情报藏在了楼兰暗道。\n\t这份情报中有着敌国重要军力的调动情况，你这就前往楼兰暗道，将情报秘密的取回来，当然，你要小心行事，我不想再派出另一位勇士去重复同样的使命。")
			TalkAppendString(varMap," ")

			
			TalkAppendString( varMap,"#Y任务目标：")
			TalkAppendString( varMap,"  在本国边塞找到@npc_128511，传送到楼兰边塞，到楼兰暗道获取密报。")
			TalkAppendString( varMap," ")

			TalkAppendString(varMap,"#Y任务奖励：")
			TalkAppendString(varMap,"  经验值："..localexp.."点#r  荣誉值：75点")
			TalkAppendString(varMap," ")
			
		elseif varQuest == x300889_var_QuestId3 then
			TalkAppendString(varMap,"#y【国家】昆仑情报")
			
			
			TalkAppendString(varMap,"   我们的一位暗探，不幸在昆仑被人识破了身份，情急之下，他将最重要的情报藏在了昆仑暗道。\n\t这份情报中有着敌国重要军力的调动情况，你这就前往昆仑暗道，将情报秘密的取回来，当然，你要小心行事，我不想再派出另一位勇士去重复同样的使命。")
			TalkAppendString(varMap," ")

			
			TalkAppendString( varMap,"#Y任务目标：")
			TalkAppendString( varMap,"  在本国边塞找到@npc_128511，传送到昆仑边塞，到昆仑暗道获取密报。")
			TalkAppendString( varMap," ")

			TalkAppendString(varMap,"#Y任务奖励：")
			TalkAppendString(varMap,"  经验值："..localexp.."点#r  荣誉值：75点")
			TalkAppendString(varMap," ")
			
		elseif varQuest == x300889_var_QuestId4 then
			TalkAppendString(varMap,"#Y【国家】天山情报")
			
			
			TalkAppendString(varMap,"   我们的一位暗探，不幸在天山被人识破了身份，情急之下，他将最重要的情报藏在了天山暗道。\n\t这份情报中有着敌国重要军力的调动情况，你这就前往天山暗道，将情报秘密的取回来，当然，你要小心行事，我不想再派出另一位勇士去重复同样的使命。")
			TalkAppendString(varMap," ")

			
			TalkAppendString( varMap,"#Y任务目标：")
			TalkAppendString( varMap,"  在本国边塞找到@npc_128511，传送到天山边塞，到天山暗道获取密报。")
			TalkAppendString( varMap," ")

			TalkAppendString(varMap,"#Y任务奖励：")
			TalkAppendString(varMap,"  经验值："..localexp.."点#r  荣誉值：75点")
			TalkAppendString(varMap," ")
			
		else
			return -1;
		end
		
			
		
		

	StopTalkTask()
	DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x300889_var_FileId, varQuest,0);
end




function x300889_DispatchContinueInfo( varMap, varPlayer, varTalknpc,varQuest )

	

	StartTalkTask(varMap)
	local localexp1 = (GetLevel( varMap, varPlayer )) * 100*2.6*5*x300889_var_Exp_Drop
	local localexp2 = (GetLevel( varMap, varPlayer )) * 1750*x300889_var_Exp_Drop
	local localexp = 0
	if GetLevel(varMap, varPlayer) >=40 and GetLevel(varMap, varPlayer) < 70 then
		localexp = localexp1;
	elseif GetLevel(varMap, varPlayer) >=70 then
		localexp = localexp2;
	end
		if varQuest == x300889_var_QuestId1 then
			TalkAppendString(varMap,"#Y【国家】敦煌情报")
		
			
			TalkAppendString(varMap,"   时间每过去一分，情报就多一分暴露的危险。")
			TalkAppendString(varMap," ")

			TalkAppendString(varMap,"#Y任务奖励：")
			TalkAppendString(varMap,"  经验值："..localexp.."点#r  荣誉值：75点")
			TalkAppendString(varMap," ")
		elseif varQuest == x300889_var_QuestId2 then
			TalkAppendString(varMap,"#Y【国家】楼兰情报")
		
			
			TalkAppendString(varMap,"   时间每过去一分，情报就多一分暴露的危险。")
			TalkAppendString(varMap," ")

			TalkAppendString(varMap,"#Y任务奖励：")
			TalkAppendString(varMap,"  经验值："..localexp.."点#r  荣誉值：75点")
			TalkAppendString(varMap," ")
		elseif varQuest == x300889_var_QuestId3 then
			TalkAppendString(varMap,"#y【国家】昆仑情报")
		
			
			TalkAppendString(varMap,"   时间每过去一分，情报就多一分暴露的危险。")
			TalkAppendString(varMap," ")

			TalkAppendString(varMap,"#Y任务奖励：")
			TalkAppendString(varMap,"  经验值："..localexp.."点#r  荣誉值：75点")
			TalkAppendString(varMap," ")
		elseif varQuest == x300889_var_QuestId4 then
			TalkAppendString(varMap,"#Y【国家】天山情报")
		
			
			TalkAppendString(varMap,"   时间每过去一分，情报就多一分暴露的危险。")
			TalkAppendString(varMap," ")

			TalkAppendString(varMap,"#Y任务奖励：")
			TalkAppendString(varMap,"  经验值："..localexp.."点#r  荣誉值：75点")
			TalkAppendString(varMap," ")
		else
			return -1;
		end
		

	StopTalkTask()
	DeliverTalkRequire(varMap, varPlayer, varTalknpc, x300889_var_FileId, varQuest,0);
	


end




function x300889_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,varQuest )
	

	StartTalkTask(varMap)
	local localexp1 = (GetLevel( varMap, varPlayer )) * 100*2.6*5*x300889_var_Exp_Drop	
	local localexp2 = (GetLevel( varMap, varPlayer )) * 1750*x300889_var_Exp_Drop
	local localexp = 0
	if GetLevel(varMap, varPlayer) >=40 and GetLevel(varMap, varPlayer) < 70 then
		localexp = localexp1;
	elseif GetLevel(varMap, varPlayer) >=70 then
		localexp = localexp2;
	end
		if varQuest == x300889_var_QuestId1 then
			
			TalkAppendString(varMap,"#Y【国家】敦煌情报")
			TalkAppendString(varMap,"   太好了！有了这份情报，我们就对敦煌边塞的军力部署了如指掌。")
			TalkAppendString(varMap," ")

			TalkAppendString(varMap,"#Y任务奖励：")
			TalkAppendString(varMap,"  经验值："..localexp.."点#r  荣誉值：75点")
			TalkAppendString(varMap," ")
		elseif varQuest == x300889_var_QuestId2 then
			
			TalkAppendString(varMap,"#Y【国家】楼兰情报")
			TalkAppendString(varMap,"   太好了！有了这份情报，我们就对楼兰边塞的军力部署了如指掌。")
			TalkAppendString(varMap," ")

			TalkAppendString(varMap,"#Y任务奖励：")
			TalkAppendString(varMap,"  经验值："..localexp.."点#r  荣誉值：75点")
			TalkAppendString(varMap," ")
		elseif varQuest == x300889_var_QuestId3 then
			
			TalkAppendString(varMap,"#y【国家】昆仑情报")
			TalkAppendString(varMap,"   太好了！有了这份情报，我们就对昆仑边塞的军力部署了如指掌。")
			TalkAppendString(varMap," ")

			TalkAppendString(varMap,"#Y任务奖励：")
			TalkAppendString(varMap,"  经验值："..localexp.."点#r  荣誉值：75点")
			TalkAppendString(varMap," ")
		elseif varQuest == x300889_var_QuestId4 then
			
			TalkAppendString(varMap,"#Y【国家】天山情报")
			TalkAppendString(varMap,"   太好了！有了这份情报，我们就对天山边塞的军力部署了若指掌。")
			TalkAppendString(varMap," ")

			TalkAppendString(varMap,"#Y任务奖励：")
			TalkAppendString(varMap,"  经验值："..localexp.."点#r  荣誉值：75点")
			TalkAppendString(varMap," ")
		else
			return -1;
		end

		
		
		
	StopTalkTask()
	DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x300889_var_FileId, varQuest);

end





function x300889_QuestLogRefresh( varMap, varPlayer, varQuest)

	
	local varRet = x300889_CheckSubmit( varMap, varPlayer, varQuest )

	
	
	local varStr = "";

	if varQuest == x300889_var_QuestId1 then
		
		if varRet>0 then
			varStr = "  从@npc_30007到敦煌暗道获取@npc_30027（1/1）"
		else
			varStr = "  从@npc_30007到敦煌暗道获取@npc_30027（0/1）"
		end
	elseif varQuest == x300889_var_QuestId2 then
		if varRet>0 then
			varStr = "  从@npc_30004到楼兰暗道获取@npc_30024（1/1）"
		else
			varStr = "  从@npc_30004到楼兰暗道获取@npc_30024（0/1）"
		end
	elseif varQuest == x300889_var_QuestId3 then
		if varRet>0 then
			varStr = "  从@npc_30006到昆仑暗道获取@npc_30026（1/1）"
		else
			varStr = "  从@npc_30006到昆仑暗道获取@npc_30026（0/1）"
		end
	elseif varQuest == x300889_var_QuestId4 then
		if varRet>0 then
			varStr = "  从@npc_30005到天山暗道获取@npc_30025（1/1）"
		else
			varStr = "  从@npc_30005到天山暗道获取@npc_30025（0/1）"
		end
	else
		return -1;
	end
		
	StartTalkTask(varMap)	
	local varLevel = GetLevel(varMap, varPlayer)
		local ExpBonus1 = 100*2.6*5 * varLevel*x300889_var_Exp_Drop
		local ExpBonus2 = 1750 * varLevel*x300889_var_Exp_Drop
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
							"【国家】敌国情报",        
							varStr,		
							"@npc_128504",			
							"通过@npc_128511潜入敌国，到暗道获取重要敌情并将情报送回本国。\n楼兰暗道情报座标（150，129）\n天山暗道情报座标（111，133）\n昆仑暗道情报座标（152，137）\n敦煌暗道情报座标（116，134）",               
							"知己知彼，百战不殆。我们的密探常常会送回一些重要的情报。",	
							"当您在出国令期间回复任务时，你将获得双倍的奖励！"					
							)
	StopTalkTask()
	DeliverTalkRefreshQuest(varMap, varPlayer, varQuest);
		

end

function x300889_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
	
	x300889_QuestLogRefresh( varMap, varPlayer, varQuest );
end


function x300889_ProcGetTargetItem( varMap, varPlayer, varQuest)
	
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )
	SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1 )
	x300889_QuestLogRefresh( varMap, varPlayer, varQuest)
end
function x300889_IsRuoGuo(varMap, varPlayer)
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
function x300889_IsMinGuo(varMap, varPlayer)
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
