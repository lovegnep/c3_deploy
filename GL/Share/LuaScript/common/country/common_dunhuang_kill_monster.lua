
--DECLARE_QUEST_INFO_START--

x300879_var_FileId 					= 	300879                  


x300879_var_QuestKind 				= 	1                       
x300879_var_LevelLess					= 	40                      





x300879_var_QuestName				= 	"敌国刺杀"
x300879_var_QuestTarget				= 	""
x300879_var_QuestInfo				= 	""
x300879_var_ContinueInfo				= 	""
x300879_var_QuestCompleted			= 	""
x300879_var_QuestHelp				=	""          


x300879_var_ExtTarget					=	{ {type=20,n=10,target="获得刺杀"}}



x300879_var_ExpBonus					= 	0;
x300879_var_BonusItem					=	{}	

x300879_var_BonusMoney1               = 	0
x300879_var_BonusMoney2               =   0
x300879_var_BonusMoney3               =   0
x300879_var_Exp_Drop               =   10

x300879_var_BonusChoiceItem           =   {}


--DECLARE_QUEST_INFO_STOP--


x300879_var_KillQuestId =  7007

x300879_var_DayCountLimited   = 1

x300879_var_Mis_Count = 1
x300879_var_ItemID = 13010021         
x300879_var_NeedItem1 = 13011007 
x300879_var_NeedItem2 = 13011008
x300879_var_NeedItemID = 13011009

x300879_var_LevelNeeded = 100

x300879_var_QuestId1 = 7659
x300879_var_QuestId2 = 7650
x300879_var_QuestId3 = 7656
x300879_var_QuestId4 = 7653
x300879_var_CountryDunhuang =  351
x300879_var_CountryLouLan =  51
x300879_var_CountryKunlun = 251
x300879_var_CountryLaiYin = 151


x300879_var_NeedItemCount = 1


x300879_var_QuestBonusInfo			= 	"#Y获得经验#R%d#Y的奖励。"
         
function x300879_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

end


function x300879_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest, varIndex )

	

	if varIndex ~= -1 then
		varQuest = varIndex
	end

	if IsHaveQuestNM( varMap, varPlayer, varQuest ) == 0 then	
		
		
		local varRet = QuestCheckAcceptNM( varMap, varPlayer, varTalknpc, varQuest )
		if varRet > 0 then	
			
			x300879_DispatchQuestInfo( varMap, varPlayer, varTalknpc, varQuest )
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
		
		if x300879_CheckSubmit( varMap, varPlayer, varQuest ) > 0 then 
			
			x300879_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,varQuest )
		else
			
			x300879_DispatchContinueInfo( varMap, varPlayer, varTalknpc,varQuest )
		end
	end
				
end

function x300879_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID,varQuestIdx, varQuest )

	if IsHaveQuestNM( varMap, varPlayer, varQuest) == 0 then	
		return
	end
		
	
	
	
		
		
	
end



function x300879_ProcQuestSubmit( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )

	if IsHaveQuestNM( varMap, varPlayer, varQuest) == 0 then	
		return 0
	end

	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )
	
	if x300879_CheckSubmit( varMap, varPlayer, varQuest )>0 then
		x300879_QuestComplate(varMap, varPlayer, varTalknpc, varButtonClick, varQuest)
	end

	return 0
end

function x300879_CheckSubmit( varMap, varPlayer, varQuest )
	if IsHaveQuestNM( varMap, varPlayer, varQuest) == 0 then
		return 0;
	end

	if varQuest ~= x300879_var_QuestId1 and varQuest ~= x300879_var_QuestId2 and varQuest ~= x300879_var_QuestId3 and varQuest ~= x300879_var_QuestId4 then
		return 0;
	end

	local ItemCnt = GetItemCount( varMap, varPlayer, x300879_var_NeedItemID )

	if ItemCnt<x300879_var_NeedItemCount then
		return 0;
	end

	return 1;


end




function x300879_ProcQuestAbandon( varMap, varPlayer,varQuest )
	
	if IsHaveQuestNM( varMap, varPlayer, varQuest ) <= 0 then	
		return 0
	end

	local n = GetItemCount( varMap, varPlayer, x300879_var_NeedItemID );

	if varQuest == x300879_var_QuestId1 then
		x300879_SetDayCount(varMap, varPlayer, DQ_SHAGUAI_DUNHUANG_DATE,DQ_SHAGUAI_DUNHUANG_DAYCOUNT)
	elseif varQuest == x300879_var_QuestId2 then
		x300879_SetDayCount(varMap, varPlayer, DQ_SHAGUAI_LOULAN_DATE,DQ_SHAGUAI_LOULAN_DAYCOUNT)
	elseif varQuest == x300879_var_QuestId3 then
		x300879_SetDayCount(varMap, varPlayer, DQ_SHAGUAI_KUNLUN_DATE,DQ_SHAGUAI_KUNLUN_DAYCOUNT)
	elseif varQuest == x300879_var_QuestId4 then
		x300879_SetDayCount(varMap, varPlayer, DQ_SHAGUAI_LAIYIN_DATE,DQ_SHAGUAI_LAIYIN_DAYCOUNT)
	else
		return -1;
	end
	
	if n > 0 then
		if DelItem(varMap, varPlayer,x300879_var_NeedItemID,n) ~= 1 then return 0 end
		
	end


	DelQuestNM( varMap, varPlayer, varQuest )
	    StartTalkTask(varMap);
		TalkAppendString(varMap, "您放弃了任务:【国家】敌国刺杀");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer,"您放弃了任务:【国家】敌国刺杀",8,2)


end





function x300879_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )

	
	if IsHaveQuestNM( varMap, varPlayer, varQuest ) > 0 then	
		return 0
	end

	local varQuestId1 = LuaCallNoclosure(310004, "ReturnHaveQuestID", varMap, varPlayer, 2)
	if	varQuestId1 ~= -1 or IsHaveQuestNM( varMap, varPlayer, x300879_var_QuestId1 ) > 0 or IsHaveQuestNM( varMap, varPlayer, x300879_var_QuestId2 ) > 0 or IsHaveQuestNM( varMap, varPlayer, x300879_var_QuestId3 ) > 0 or IsHaveQuestNM( varMap, varPlayer, x300879_var_QuestId4 ) > 0 then
		StartTalkTask(varMap)
		local varText = "您已经接过了【国家】敌国刺杀任务，还未完成，不能再接取"
		TalkAppendString( varMap, varText )
		StopTalkTask( varMap )
		DeliverTalkTips( varMap, varPlayer )
		Msg2Player(varMap,varPlayer,"您已经接过了【国家】敌国刺杀任务，还未完成，不能再接取",8,2)
		return
	end

	local varDayCount =0;

	if varQuest == x300879_var_QuestId1 then
		varDayCount = x300879_GetDayCount(varMap, varPlayer, DQ_SHAGUAI_DUNHUANG_DATE,DQ_SHAGUAI_DUNHUANG_DAYCOUNT)
	elseif varQuest == x300879_var_QuestId2 then
		varDayCount = x300879_GetDayCount(varMap, varPlayer, DQ_SHAGUAI_LOULAN_DATE,DQ_SHAGUAI_LOULAN_DAYCOUNT)
	elseif varQuest == x300879_var_QuestId3 then
		varDayCount = x300879_GetDayCount(varMap, varPlayer, DQ_SHAGUAI_KUNLUN_DATE,DQ_SHAGUAI_KUNLUN_DAYCOUNT)
	elseif varQuest == x300879_var_QuestId4 then
		varDayCount = x300879_GetDayCount(varMap, varPlayer, DQ_SHAGUAI_LAIYIN_DATE,DQ_SHAGUAI_LAIYIN_DAYCOUNT)
	else
		return -1;
	end

	if varDayCount>=x300879_var_DayCountLimited then
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
			TalkAppendString(varMap, "您接受了任务:【国家】敌国刺杀");
			StopTalkTask();
			DeliverTalkTips(varMap, varPlayer);
			Msg2Player(varMap,varPlayer,"您接受了任务:【国家】敌国刺杀",8,2)
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




function x300879_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
	
	
	if x300879_CountryCheck( varMap, varPlayer, varQuest ) < 0 then
		return -1;
	end

	if varObjData ~= 9510 then
		return -1;
	end

	local sign = 0;
	local varItemCount=0;
	local varItem=0;
	local ItemRand=0;
	local ItemDropNum=0;
	local droprand = 0;
	
	local NeedKilledNum, InstIndex, ObjName = GetQuestNeedKillObjInfoNM( varMap, varPlayer, varQuest, varObjData, varObj )
	
	
	
	


		if NeedKilledNum >= 0 then
			local varX,z = GetWorldPos(varMap,varPlayer)
			
			local KilledNum =  GetNearCountryCount(varMap, varPlayer,varX,z,20)  
			
			
			for varI = 0, KilledNum-1 do
				local humanObjId = GetNearCountryMember(varMap, varPlayer,varI) 
				
				if humanObjId ~= -1 then
					if IsPlayerStateNormal(varMap, humanObjId) > 0 then
						if GetHp(varMap, humanObjId) > 0 then
							if IsHaveQuestNM( varMap, humanObjId, varQuest ) > 0 then	
								
								if InstIndex >= 0 then
									if sign == 0 then
										
										varItemCount, varItem, ItemRand, ItemDropNum = GetQuestItemNM( varMap, humanObjId, varQuest, InstIndex )
										
										
										
										
										droprand = random(100)
										sign = 1;
									end
									
											
									if HaveItem( varMap, humanObjId, varItem ) <  x300879_var_NeedItemCount then 
									
										if varItemCount > 0 then
											
											if droprand<= ItemRand then
											
												StartItemTask(varMap)
												ItemAppend( varMap, varItem, 1 )
												local varRet = StopItemTask(varMap,humanObjId)
												if varRet > 0 then
													
													DeliverItemListSendToPlayer(varMap,humanObjId)
													
												else
													StartTalkTask(varMap)
													TalkAppendString(varMap,"物品栏已满，无法得到任务物品！")
													StopTalkTask(varMap)
													DeliverTalkTips(varMap,humanObjId)
												end
											end
												
										end
										
									end
								end
							end
						end
					end
				end
			end
		end

	return 0
	
end



function x300879_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )

	
	
	
	
	
	

	if IsPlayerStateNormal(varMap, varPlayer) == 0 then
		return 
	end

	if GetHp(varMap, varPlayer) <= 0 then
		return
	end

	
	if varQuest == nil or varQuest < 0 then
        return 
    end
    
    if IsHaveQuestNM(varMap,varPlayer,varQuest) <= 0 then
        return 
    end

	local NeedNum, ObjIndex = GetQuestNeedItemNumNM( varMap, varPlayer, varQuest, varItemData )
	
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )

	if NeedNum > 0 then
		local Num = GetItemCount( varMap, varPlayer, varItemData ) 
		if Num < x300879_var_NeedItemCount then 
			
			local varText = format("您杀死了边塞主将: %d/%d#r获得了物品：将军令", Num, NeedNum)
			if varText == nil then
				varText = "";
			end
			
			
			
   			SetQuestByIndex( varMap, varPlayer, varQuestIdx, ObjIndex, Num )         
			SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 0 )
			x300879_QuestLogRefresh( varMap, varPlayer, varQuest)
		elseif Num >= x300879_var_NeedItemCount then
			
			StartTalkTask(varMap)
			local varText = format( "您杀死了边塞主将: %d/%d", Num, NeedNum )
			if varText == nil then
				varText = "";
			end
			TalkAppendString( varMap, varText )
			StopTalkTask( varMap )
			DeliverTalkTips( varMap, varPlayer )
			StartTalkTask(varMap)
			TalkAppendString( varMap, "获得了物品：将军令" )
			StopTalkTask( varMap )
			DeliverTalkTips( varMap, varPlayer )
			
			SetQuestByIndex( varMap, varPlayer, varQuestIdx, ObjIndex, x300879_var_NeedItemCount )         

			SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1 )
			x300879_QuestLogRefresh( varMap, varPlayer, varQuest)
		end
	end
	return 0
	
end


function x300879_QuestComplate(varMap, varPlayer, varTalknpc, varButtonClick, varQuest)

    if varQuest == nil or varQuest < 0 then
        return 0
    end
    
    if IsHaveQuestNM( varMap,varPlayer,varQuest )<= 0 then
        return 0
    end
    

	local varRet = QuestComplateNM( varMap, varPlayer, varTalknpc, varQuest, varButtonClick ) 
	if varRet == 1 then 
		if varQuest == x300879_var_QuestId1 then
			x300879_SetDayCount(varMap, varPlayer, DQ_SHAGUAI_DUNHUANG_DATE,DQ_SHAGUAI_DUNHUANG_DAYCOUNT)
		elseif varQuest == x300879_var_QuestId2 then
			x300879_SetDayCount(varMap, varPlayer, DQ_SHAGUAI_LOULAN_DATE,DQ_SHAGUAI_LOULAN_DAYCOUNT)
		elseif varQuest == x300879_var_QuestId3 then
			x300879_SetDayCount(varMap, varPlayer, DQ_SHAGUAI_KUNLUN_DATE,DQ_SHAGUAI_KUNLUN_DAYCOUNT)
		elseif varQuest == x300879_var_QuestId4 then
			x300879_SetDayCount(varMap, varPlayer, DQ_SHAGUAI_LAIYIN_DATE,DQ_SHAGUAI_LAIYIN_DAYCOUNT)
		else
			return -1;
		end
		
		local ItemCnt = GetItemCount( varMap, varPlayer, x300879_var_NeedItemID )
		if ItemCnt > 0 then 
			if DelItem(varMap, varPlayer,x300879_var_NeedItemID,ItemCnt)	 ~= 1 then return 0 end
		else	
		end	
		
		
		
		StartTalkTask(varMap);
		TalkAppendString(varMap, "您完成了任务:【国家】敌国刺杀");
		StopTalkTask();
		Msg2Player(varMap,varPlayer,"您完成了任务:【国家】敌国刺杀",8,2)

		DeliverTalkTips(varMap, varPlayer);


		x300879_GiveReward(varMap,varPlayer)
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
					if x300879_IsRuoGuo(varMap, varPlayer) == 1 then     
						if x300879_IsMinGuo(varMap, varPlayer) == 1 then
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
			
		
			
			local strMsg = format("CGL:<Info>x300879_QuestComplate varMap=%d,varCountry=%d", varMap, varCountry )
    		WriteLog( 1, strMsg )
		end
		
		return 1 
	else 
		
		StartTalkTask(varMap);
			TalkAppendString(varMap, "任务完成错误");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		return 0
	end
	return 0

end

function x300879_GiveReward(varMap,varPlayer)
		LuaCallNoclosure(888895,"EventActivity",varMap, varPlayer,17)
 local varRandom = random (1,5)
 if x300879_IsRuoGuo(varMap, varPlayer) == 1 then
	if x300879_IsMinGuo(varMap, varPlayer) == 1 then
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
	local nExpBonus1 = 100*2.6*varLevel*5*x300879_var_Exp_Drop;
	local nExpBonus2 = 1750*varLevel*x300879_var_Exp_Drop;
	local varExpBonus = 0;
	if GetLevel(varMap, varPlayer) >=40 and GetLevel(varMap, varPlayer) < 70 then
		varExpBonus = nExpBonus1;
	elseif GetLevel(varMap, varPlayer) >=70 then
		varExpBonus = nExpBonus2;
	end
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
  		Msg2Player(varMap,varPlayer,"#o获得#R经验"..varExpBonus.."点#o的奖励#r#o获得#R荣誉50点#o的奖励",4,2)
  			LuaCallNoclosure( 256271, "Finishcisha", varMap, varPlayer)
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
				local nLairdHornorBonus = floor((nLairdSumLevel*0.02)*50)
				
				
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

function x300879_ProcLogInOrDie( varMap, varPlayer )
	
   x300879_ProcQuestFailed( varMap, varPlayer )
end



function x300879_ProcQuestFailed( varMap, varPlayer )
	
	x300879_CountryKillOnDie(varMap, varPlayer)

end

function x300879_CountryKillOnDie( varMap, varPlayer )
	
	if 0==0 then
		return
	end
	

	
	local varQuest = -1
	if IsHaveQuestNM( varMap, varPlayer, x300879_var_QuestId1 ) > 0 then
		varQuest = x300879_var_QuestId1
	elseif IsHaveQuestNM( varMap, varPlayer, x300879_var_QuestId2 ) > 0 then
		varQuest = x300879_var_QuestId2
	elseif IsHaveQuestNM( varMap, varPlayer, x300879_var_QuestId3 ) > 0 then
		varQuest = x300879_var_QuestId3
	elseif IsHaveQuestNM( varMap, varPlayer, x300879_var_QuestId4 ) > 0 then
		varQuest = x300879_var_QuestId4
	end
	if varQuest  ~= -1 then
		if GetItemCount( varMap, varPlayer,x300879_var_NeedItemID ) > 0 then  
			return 0;
		end
		local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 0 )
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 1, 0 )
	end
	
end

function x300879_CountryCheck( varMap, varPlayer, varQuest )
	if varQuest == x300879_var_QuestId1 then
		if varMap == x300879_var_CountryDunhuang then
			return 1
		end
	elseif varQuest == x300879_var_QuestId2 then
		if varMap == x300879_var_CountryLouLan then
			return 1
		end
	elseif varQuest == x300879_var_QuestId3 then
		if varMap == x300879_var_CountryKunlun then
			return 1
		end
	elseif varQuest == x300879_var_QuestId4 then
		if varMap == x300879_var_CountryLaiYin then
			return 1
		end
	end
	return -1
end

function x300879_ProcQuestLogRefresh( varMap,varPlayer,varQuest)
	
	local varStr = "#G本国金盾大元帅"
    StartTalkTask(varMap)
        AddQuestLogCustomText( varMap,
                                "",                    
                                "",                 
                                "",               
                                varStr,                         
                                "",                   
                                "",                
                                ""        
                                )

	StopTalkTask()
	DeliverTalkRefreshQuest(varMap, varPlayer, varQuest);
end





function x300879_GetDayCount(varMap, varPlayer, nDayIndex, nDayCountIndex)



	local varToday = GetDayOfYear()
	local varLastday = GetPlayerGameData(varMap, varPlayer, nDayIndex[1], nDayIndex[2],nDayIndex[3] );
	
	if varLastday ~= varToday then
		return 0
	end

	local varDaycount = GetPlayerGameData(varMap, varPlayer, nDayCountIndex[1], nDayCountIndex[2],nDayCountIndex[3] );
	return varDaycount;

	

end




function x300879_SetDayCount(varMap, varPlayer, nDayIndex, nDayCountIndex)

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





function x300879_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	return 1
end




function x300879_DispatchQuestInfo( varMap, varPlayer, varTalknpc, varQuest)

	StartTalkTask(varMap)
	local localexp1 = (GetLevel( varMap, varPlayer )) * 100*2.6*5*x300879_var_Exp_Drop	
	local localexp2 = (GetLevel( varMap, varPlayer )) * 1750*x300879_var_Exp_Drop
	local localexp = 0
	if GetLevel(varMap, varPlayer) >=40 and GetLevel(varMap, varPlayer) < 70 then
		localexp = localexp1;
	elseif GetLevel(varMap, varPlayer) >=70 then
		localexp = localexp2;
	end
		if varQuest == x300879_var_QuestId1 then
			TalkAppendString(varMap,"#Y【国家】敦煌刺杀")
			
			
			TalkAppendString(varMap,"   敦煌的边塞主将，正带领着他的手下们，在敦煌边塞的（36，53）处巡查。趁此良机，你悄悄潜入那里，干掉边塞主将！当然，别忘了把他随身携带的那枚#G将军令#W带回来！")
			TalkAppendString(varMap," ")

			
			TalkAppendString( varMap,"#Y任务目标：")
			TalkAppendString( varMap,"  在本国边塞找到@npc_134511，传送到敦煌边塞，杀死敦煌边塞（36，53）处的边塞主将，获得将军令。")
			TalkAppendString( varMap," ")

			TalkAppendString(varMap,"#Y任务奖励：")
			TalkAppendString(varMap,"  经验值："..localexp.."点#r  荣誉值：50点")
			TalkAppendString(varMap," ")
			
		elseif varQuest == x300879_var_QuestId2 then
			TalkAppendString(varMap,"#Y【国家】楼兰刺杀")
			
			
			TalkAppendString(varMap,"   楼兰的边塞主将，正带领着他的手下们，在楼兰边塞的（211，173）处巡查。趁此良机，你悄悄潜入那里，干掉边塞主将！当然，别忘了把他随身携带的那枚#G将军令#W带回来！")
			TalkAppendString(varMap," ")

			
			TalkAppendString( varMap,"#Y任务目标：")
			TalkAppendString( varMap,"  在本国边塞找到@npc_134511，传送到楼兰边塞，杀死楼兰边塞（211，173）处的边塞主将，获得将军令。")
			TalkAppendString( varMap," ")

			TalkAppendString(varMap,"#Y任务奖励：")
			TalkAppendString(varMap,"  经验值："..localexp.."点#r  荣誉值：50点")
			TalkAppendString(varMap," ")
			
		elseif varQuest == x300879_var_QuestId3 then
			TalkAppendString(varMap,"#y【国家】昆仑刺杀")
			
			
			TalkAppendString(varMap,"   昆仑的边塞主将，正带领着他的手下们，在昆仑边塞的（212，58）处巡查。趁此良机，你悄悄潜入那里，干掉边塞主将！当然，别忘了把他随身携带的那枚#G将军令#W带回来！")
			TalkAppendString(varMap," ")

			
			TalkAppendString( varMap,"#Y任务目标：")
			TalkAppendString( varMap,"  在本国边塞找到@npc_134511，传送到昆仑边塞，杀死昆仑边塞（212，58）处的边塞主将，获得将军令。")
			TalkAppendString( varMap," ")

			TalkAppendString(varMap,"#Y任务奖励：")
			TalkAppendString(varMap,"  经验值："..localexp.."点#r  荣誉值：50点")
			TalkAppendString(varMap," ")
			
		elseif varQuest == x300879_var_QuestId4 then
			TalkAppendString(varMap,"#Y【国家】天山刺杀")
			
			
			TalkAppendString(varMap,"   天山的边塞主将，正带领着他的手下们，在天山边塞的（36，201）处巡查。趁此良机，你悄悄潜入那里，干掉边塞主将！当然，别忘了把他随身携带的那枚#G将军令#W带回来！")
			TalkAppendString(varMap," ")

			
			TalkAppendString( varMap,"#Y任务目标：")
			TalkAppendString( varMap,"  在本国边塞找到@npc_134511，传送到天山边塞，杀死天山边塞（36，201）处的边塞主将，获得将军令。")
			TalkAppendString( varMap," ")

			TalkAppendString(varMap,"#Y任务奖励：")
			TalkAppendString(varMap,"  经验值："..localexp.."点#r  荣誉值：50点")
			TalkAppendString(varMap," ")

		else
			return -1;
		end
		
			
		
		

	StopTalkTask()
	DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x300879_var_FileId, varQuest,0);
end




function x300879_DispatchContinueInfo( varMap, varPlayer, varTalknpc,varQuest )

	

	StartTalkTask(varMap)
	local localexp1 = (GetLevel( varMap, varPlayer )) * 100*2.6*5*x300879_var_Exp_Drop
	local localexp2 = (GetLevel( varMap, varPlayer )) * 1750*x300879_var_Exp_Drop
	local localexp = 0
	if GetLevel(varMap, varPlayer) >=40 and GetLevel(varMap, varPlayer) < 70 then
		localexp = localexp1;
	elseif GetLevel(varMap, varPlayer) >=70 then
		localexp = localexp2;
	end
		if varQuest == x300879_var_QuestId1 then
			TalkAppendString(varMap,"#Y【国家】敦煌刺杀")
		
			
			TalkAppendString(varMap,"   你还在磨蹭什么？别让那敦煌边塞的主将跑了！")
			TalkAppendString(varMap," ")

			TalkAppendString(varMap,"#Y任务奖励：")
			TalkAppendString(varMap,"  经验值："..localexp.."点#r  荣誉值：50点")
			TalkAppendString(varMap," ")
		elseif varQuest == x300879_var_QuestId2 then
			TalkAppendString(varMap,"#Y【国家】楼兰刺杀")
		
			
			TalkAppendString(varMap,"   你还在磨蹭什么？别让那楼兰边塞的主将跑了！")
			TalkAppendString(varMap," ")

			TalkAppendString(varMap,"#Y任务奖励：")
			TalkAppendString(varMap,"  经验值："..localexp.."点#r  荣誉值：50点")
			TalkAppendString(varMap," ")
		elseif varQuest == x300879_var_QuestId3 then
			TalkAppendString(varMap,"#y【国家】昆仑刺杀")
		
			
			TalkAppendString(varMap,"   你还在磨蹭什么？别让那昆仑边塞的主将跑了！")
			TalkAppendString(varMap," ")

			TalkAppendString(varMap,"#Y任务奖励：")
			TalkAppendString(varMap,"  经验值："..localexp.."点#r  荣誉值：50点")
			TalkAppendString(varMap," ")
		elseif varQuest == x300879_var_QuestId4 then
			TalkAppendString(varMap,"#Y【国家】天山刺杀")
		
			
			TalkAppendString(varMap,"   你还在磨蹭什么？别让那天山边塞的主将跑了！")
			TalkAppendString(varMap," ")

			TalkAppendString(varMap,"#Y任务奖励：")
			TalkAppendString(varMap,"  经验值："..localexp.."点#r  荣誉值：50点")
			TalkAppendString(varMap," ")
		else
			return -1;
		end
		

	StopTalkTask()
	DeliverTalkRequire(varMap, varPlayer, varTalknpc, x300879_var_FileId, varQuest,0);
	


end




function x300879_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,varQuest )
	

	StartTalkTask(varMap)
	local localexp1 = (GetLevel( varMap, varPlayer )) * 100*2.6*5*x300879_var_Exp_Drop
	local localexp2 = (GetLevel( varMap, varPlayer )) * 1750*x300879_var_Exp_Drop
	local localexp = 0
	if GetLevel(varMap, varPlayer) >=40 and GetLevel(varMap, varPlayer) < 70 then
		localexp = localexp1;
	elseif GetLevel(varMap, varPlayer) >=70 then
		localexp = localexp2;
	end	
		if varQuest == x300879_var_QuestId1 then
			
			TalkAppendString(varMap,"#Y【国家】敦煌刺杀")
			TalkAppendString(varMap,"   多谢你干掉了这敦煌的边塞主将！此次你对国家做出的贡献极大，我定会为你表功。")
			TalkAppendString(varMap," ")

			TalkAppendString(varMap,"#Y任务奖励：")
			TalkAppendString(varMap,"  经验值："..localexp.."点#r  荣誉值：50点")
			TalkAppendString(varMap," ")
		elseif varQuest == x300879_var_QuestId2 then
			
			TalkAppendString(varMap,"#Y【国家】楼兰刺杀")
			TalkAppendString(varMap,"   多谢你干掉了这楼兰的边塞主将！此次你对国家做出的贡献极大，我定会为你表功。")
			TalkAppendString(varMap," ")

			TalkAppendString(varMap,"#Y任务奖励：")
			TalkAppendString(varMap,"  经验值："..localexp.."点#r  荣誉值：50点")
		elseif varQuest == x300879_var_QuestId3 then
			
			TalkAppendString(varMap,"#y【国家】昆仑刺杀")
			TalkAppendString(varMap,"   多谢你干掉了这昆仑的边塞主将！此次你对国家做出的贡献极大，我定会为你表功。")
			TalkAppendString(varMap," ")

			TalkAppendString(varMap,"#Y任务奖励：")
			TalkAppendString(varMap,"  经验值："..localexp.."点#r  荣誉值：50点")
		elseif varQuest == x300879_var_QuestId4 then
			
			TalkAppendString(varMap,"#Y【国家】天山刺杀")
			TalkAppendString(varMap,"   多谢你干掉了这天山的边塞主将！此次你对国家做出的贡献极大，我定会为你表功。")
			TalkAppendString(varMap," ")

			TalkAppendString(varMap,"#Y任务奖励：")
			TalkAppendString(varMap,"  经验值："..localexp.."点#r  荣誉值：50点")
		else
			return -1;
		end

		
		
		
	StopTalkTask()
	DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x300879_var_FileId, varQuest);

end





function x300879_QuestLogRefresh( varMap, varPlayer, varQuest)

	
	local varRet = x300879_CheckSubmit( varMap, varPlayer, varQuest )

	
	
	local varStr = "";

	if varQuest == x300879_var_QuestId1 then
		if varRet>0 then
			varStr = "  从@npc_30015到敦煌边塞杀死@npc_30023（1/1）"
		else
			varStr = "  从@npc_30015到敦煌边塞杀死@npc_30023（0/1）"
		end
	elseif varQuest == x300879_var_QuestId2 then
		if varRet>0 then
			varStr = "  从@npc_30012到楼兰边塞杀死@npc_30020（1/1）"
		else
			varStr = "  从@npc_30012到楼兰边塞杀死@npc_30020（0/1）"
		end
	elseif varQuest == x300879_var_QuestId3 then
		if varRet>0 then
			varStr = "  从@npc_30014到昆仑边塞杀死@npc_30022（1/1）"
		else
			varStr = "  从@npc_30014到昆仑边塞杀死@npc_30022（0/1）"
		end
	elseif varQuest == x300879_var_QuestId4 then
		if varRet>0 then
			varStr = "  从@npc_30013到天山边塞杀死@npc_30021（1/1）"
		else
			varStr = "  从@npc_30013到天山边塞杀死@npc_30021（0/1）"
		end
	else
		return -1;
	end
		
	StartTalkTask(varMap)	
		local varLevel = GetLevel(varMap, varPlayer)
		local ExpBonus1 = 100*2.6*5 * varLevel*x300879_var_Exp_Drop
		local ExpBonus2 = 1750 * varLevel*x300879_var_Exp_Drop
		local varExpBonus = 0
		if GetLevel(varMap, varPlayer) >=40 and GetLevel(varMap, varPlayer) < 70 then
			varExpBonus = ExpBonus1;
		elseif GetLevel(varMap, varPlayer) >=70 then
			varExpBonus = ExpBonus2;
		end
	    if varExpBonus > 0 then
			AddQuestExpBonus(varMap,  varExpBonus);
			AddQuestMoneyBonus6(varMap, 50 )
		end		
	AddQuestLogCustomText( varMap,
							"",						
							"【国家】敌国刺杀",        
							varStr,		
							"@npc_134505",			
							"通过@npc_134511潜入敌国，刺杀边塞的主将。\n楼兰边塞主将座标（211，173）\n天山边塞主将座标（36，201）\n昆仑边塞主将座标（212，58）\n敦煌边塞主将座标（36，53）",               
							"\t近日，敌国的边塞主将突然增派了大量人手巡查他们整个边塞地区，我国暗探损失惨重。\n\t绝不能让这种情况继续下去！你立刻潜入敌国，刺杀他们的主将，如果得手，定能让他们整个边塞军务陷入混乱！",	
							"当您在出国令期间回复任务时，你将获得双倍的奖励！"					
							)
	StopTalkTask()
	DeliverTalkRefreshQuest(varMap, varPlayer, varQuest);
		

end

function x300879_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
	
	x300879_QuestLogRefresh( varMap, varPlayer, varQuest );
end
function x300879_IsRuoGuo(varMap, varPlayer)
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
function x300879_IsMinGuo(varMap, varPlayer)
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
