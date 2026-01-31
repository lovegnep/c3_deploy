





--DECLARE_QUEST_INFO_START--
x300517_var_FileId = 300517
x300517_var_QuestIdPre =-1
x300517_var_QuestId = 8053
x300517_var_LevelLess	= 	30 
x300517_var_Name	={}
x300517_var_QuestName="【个人】收集材料"	
x300517_var_QuestCompleted="\t年轻人，你做的相当不错！给，这是你应得的报酬。"					
x300517_var_Mis_Count   = 1								
x300517_var_Mis_CollectCount   = 1				
x300517_var_MaxSigleCycle_Count   = 4
x300517_var_LevelMod   = 10
x300517_var_BonusMoney1 =0
x300517_var_BonusMoney2 =0
x300517_var_BonusMoney3 =0
x300517_var_BonusMoney4 =0
x300517_var_BonusMoney5 =0
x300517_var_BonusMoney6 =0
x300517_var_BonusItem	=	{}
x300517_var_BonusChoiceItem ={}
x300517_var_ExpBonus = 60
x300517_var_ItemMinBonus = 2
x300517_var_ItemMaxBonus = 4
x300517_var_NpcGUID ={}

x300517_var_QuestHelp = "\t#W该任务十环为一轮，每天只能完成一轮。在任务中，也许材料收集人会#G多次向你收集同一物品#W，满足他的需求，你将会获得丰厚的奖励。\n\t#G如果你放弃了任务，当天无法再次领取收集材料任务了。"


x300517_var_QuestTable =    {
                                { maxLevel = 40,  item = {11020001,11020002,11030001}},
                                { maxLevel = 50,  item = {11020001,11020002,11030001,11020006,11020007}},
                                { maxLevel = 60,  item = {11020001,11020002,11030001,11020006,11020007,11020010,11020011,11030003}},
                                { maxLevel = 70,  item = {11020006,11020007,11020010,11020011,11030003,11020014,11020015,11030005}},
                                { maxLevel = 80,  item = {11020006,11020007,11020010,11020011,11030003,11020014,11020015,11030005,11030007}},
                                { maxLevel = 90,  item = {11020006,11020007,11020010,11020011,11030003,11020014,11020015,11030005,11030007}},
                                { maxLevel = 100, item = {11020006,11020007,11020010,11020011,11030003,11020014,11020015,11030005,11030007}},
                                { maxLevel = 110, item = {11020006,11020007,11020010,11020011,11030003,11020014,11020015,11030005,11030007}},
                                { maxLevel = 120, item = {11020006,11020007,11020010,11020011,11030003,11020014,11020015,11030005,11030007}},
                                { maxLevel = 130, item = {11020006,11020007,11020010,11020011,11030003,11020014,11020015,11030005,11030007}},
                                { maxLevel = 140, item = {11020006,11020007,11020010,11020011,11030003,11020014,11020015,11030005,11030007}},
                                { maxLevel = 150, item = {11020006,11020007,11020010,11020011,11030003,11020014,11020015,11030005,11030007}},
                                { maxLevel = 160, item = {11020006,11020007,11020010,11020011,11030003,11020014,11020015,11030005,11030007}},                                
                            }     


x300517_var_ItemTable =    {
                                { maxLevel = 45,  item = 11050001},
                                { maxLevel = 66,  item = 11050002},
                                { maxLevel = 160, item = 11050003},                                
                            } 
--DECLARE_QUEST_INFO_STOP--


function x300517_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	if IsQuestHaveDoneNM( varMap, varPlayer, varQuest ) > 0 then
			return
	end
	if IsHaveQuestNM(varMap,varPlayer, varQuest) <= 0 then
			if GetLevel(varMap, varPlayer) >= x300517_var_LevelLess then
					local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x300517_var_QuestId)
					TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x300517_var_QuestId, varState, -1 )
			end
	else
			local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x300517_var_QuestId)
			TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x300517_var_QuestId, varState, -1 )
	end
end



function x300517_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	if IsQuestHaveDoneNM(varMap, varPlayer, x300517_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuestNM(varMap,varPlayer, varQuest) > 0 then
			if x300517_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x300517_var_QuestName)
						local varItemData = x300517_GetCurrentItem(varMap, varPlayer)
						local varCirclesCount = GetPlayerGameData(varMap, varPlayer, MD_SHOUJI_MATERIAL_CYCLECOUNT[1], MD_SHOUJI_MATERIAL_CYCLECOUNT[2], MD_SHOUJI_MATERIAL_CYCLECOUNT[3])
						local varText = format( "快去收集#G%d#W个#G@itemid_%d#W,，别担心，我会给你奖赏的。", varCirclesCount, varItemData )
						TalkAppendString(varMap,varText)
						TalkAppendString( varMap,"\n#Y完成情况：")
						local varItemCount = GetItemCount(varMap,varPlayer,varItemData);
						local varQuestTarget = format( "收集#G@itemid_%d#W(%d/%d)", varItemData , varItemCount, varCirclesCount)
						TalkAppendString(varMap,varQuestTarget)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x300517_var_FileId, x300517_var_QuestId);
			else
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x300517_var_QuestName)
						TalkAppendString(varMap,x300517_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x300517_DispatchQuestInfo( varMap, varPlayer, varTalknpc, 1)
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x300517_var_FileId, x300517_var_QuestId);
			end
  else
  		if  IsNpcHaveQuestNM(varMap, varPlayer, varTalknpc, varQuest) == 1 then
					if x300517_ProcAcceptCheck(varMap, varPlayer, varTalknpc, varQuest) > 0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x300517_var_QuestName)
						TalkAppendString(varMap,"\t我是太子殿下钦命的材料收集官，负责收集各种王国紧缺的材料。凡是上交材料者均有丰厚的赏赐。\n\t嗯，你是来贡献材料的吗？")
						TalkAppendString( varMap,"\n#G小提示：")
						TalkAppendString(varMap,x300517_var_QuestHelp)								
						local varLevel = GetLevel(varMap, varPlayer)
						local varExpBonus = x300517_var_ExpBonus*varLevel*2
						AddQuestExpBonus(varMap, varExpBonus )
		  			StopTalkTask()
						DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x300517_var_FileId, x300517_var_QuestId);
					end
			end
  end
end



function x300517_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
	
	if varQuest == nil or varQuest < 0 then
		return
	end
	
	if IsHaveQuestNM(varMap, varPlayer, varQuest) <= 0 then
		return
	end
	
	local ModNum = x300517_GetModNum(varMap, varPlayer);
	local varQuestName;
	varQuestName = GetQuestNameNM(varMap, varPlayer, varQuest);
	local varMaxcircle = x300517_GetMaxCircleNum(varMap, varPlayer);
	local varCircle = GetPlayerGameData(varMap, varPlayer, MD_SHOUJI_MATERIAL_CYCLE[1], MD_SHOUJI_MATERIAL_CYCLE[2], MD_SHOUJI_MATERIAL_CYCLE[3])
	local varCirclesCount = GetPlayerGameData(varMap, varPlayer, MD_SHOUJI_MATERIAL_CYCLECOUNT[1], MD_SHOUJI_MATERIAL_CYCLECOUNT[2], MD_SHOUJI_MATERIAL_CYCLECOUNT[3])
	
	varQuestName = varQuestName.."("..varCircle;
	varQuestName = varQuestName.."/"..varMaxcircle;
	varQuestName = varQuestName..")";
	
	local varItemData = x300517_GetCurrentItem(varMap, varPlayer)
	local varItemCount = GetItemCount(varMap,varPlayer,varItemData);
	
	local varQuestTarget = format( "  收集#G@itemid_%d#W(%d/%d)", varItemData , varItemCount, varCirclesCount)
	if varQuestTarget == nil then
		varQuestTarget = "";
	end
	
	local varQuestNPC = "@npc_138559"
	
	
	local varQuestProcess = format("你可以通过击败敌人或者与其他玩家交易获得#G@itemid_%d#W", varItemData)
	local varQuestComment = format("\t为了抵御外敌，我们需要更多的材料来进行基础建设。去收集#G@itemid_%d#W给我吧，我会给你奖励的。", varItemData)
	x300517_QuestLogRefresh(varMap, varPlayer, varQuest, "", varQuestName, varQuestTarget, varQuestNPC, varQuestProcess, varQuestComment, x300517_var_QuestHelp);
end



function x300517_ProcAcceptCheck(varMap, varPlayer, varTalknpc, varQuest)
	local varLevel = GetLevel(varMap,varPlayer);
	if ( varLevel < x300517_var_LevelLess ) then
		StartTalkTask(varMap)
		TalkAppendString(varMap, "您的等级不够，不能领取任务！");
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 0;
	end
	
	local varHaveQuest	= IsHaveQuestNM(varMap, varPlayer, varQuest);
	if(varHaveQuest > 0) then
		return 0;
	else
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
		end
		local varToday = GetDayOfYear()
		local varLastday = GetPlayerGameData(varMap, varPlayer, MD_SHOUJI_MATERIAL_DATE[1], MD_SHOUJI_MATERIAL_DATE[2], MD_SHOUJI_MATERIAL_DATE[3])
		if varLastday ~= varToday then
			return 1
		end
		if x300517_IsAbdon(varMap, varPlayer) > 0 then
			StartTalkTask(varMap)
			TalkAppendString(varMap, "放弃任务后当天无法领取收集材料任务");
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			return 0
		end
		local varDaycount =  GetPlayerGameData(varMap, varPlayer, MD_SHOUJI_MATERIAL_COUNT[1], MD_SHOUJI_MATERIAL_COUNT[2], MD_SHOUJI_MATERIAL_COUNT[3])
		if varDaycount >= x300517_var_Mis_Count then
			  StartTalkTask(varMap)
				TalkAppendString(varMap, "收集材料任务一天只能做10次");
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				Msg2Player(varMap, varPlayer, "收集材料任务一天只能做10次", 0, 2)
				return 0
		end
		return 1;
	end

end



function x300517_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsHaveQuestNM(varMap, varPlayer, varQuest) > 0 then
				return 
		end
		if IsQuestFullNM(varMap, varPlayer) > 0 then
			return
		end
		
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,varQuest  )
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
		
		local varRet = QuestCheckAcceptNM( varMap, varPlayer, varTalknpc, varQuest ) 
		if varRet > 0 then 
			if x300517_ProcAcceptCheck(varMap, varPlayer, varTalknpc, varQuest) > 0 then
				if DelQuest(varMap, varPlayer, x300517_var_QuestId) > 0 then
						if  IsNpcHaveQuestNM(varMap, varPlayer, varTalknpc, varQuest) == 1 then
								if x300517_ProcAcceptCheck(varMap, varPlayer, varTalknpc, varQuest) > 0 then
									StartTalkTask(varMap)
						  		local varItemData = x300517_GetRandItem(varMap, varPlayer)
						  		x300517_AcceptThisCycle(varMap, varPlayer)
						  		if AddQuest( varMap, varPlayer, x300517_var_QuestId, x300517_var_FileId, 0, 0, 1) > 0 then
										x300517_SetCurrentItem(varMap, varPlayer, varItemData)
							 			x300517_Msg2toplayer( varMap, varPlayer,0)
							  		xx300517_DisplayCircleMessage(varMap, varPlayer, varQuest)
										TalkAppendString(varMap,"#Y"..x300517_var_QuestName)
										local varText = format( "\t嗯，我看看，我们现在很需要#G@itemid_%d#W，收集给我吧，我会给你奖励的。", varItemData )
										TalkAppendString(varMap,varText)
										TalkAppendString( varMap,"\n#Y任务目标：")
										varText = format( "收集一个#G@itemid_%d#W", varItemData )
										if varText == nil then
											varText = "";
										end
										TalkAppendString( varMap,varText)
						  			StopTalkTask()
										DeliverTalkMenu(varMap, varPlayer, varTalknpc, x300517_var_FileId, x300517_var_QuestId);
										x300517_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
									end
								end
						end
				end
		 	end                                                                    
	  end
end


function xx300517_DisplayCircleMessage(varMap, varPlayer, varQuest)

	local varCircles = GetPlayerGameData(varMap, varPlayer, MD_SHOUJI_MATERIAL_CYCLE[1], MD_SHOUJI_MATERIAL_CYCLE[2], MD_SHOUJI_MATERIAL_CYCLE[3])
	local varMaxcircles = x300517_GetMaxCircleNum( varMap, varPlayer )

  local varStr;
	varStr = format( "环数: %d/%d", varCircles, varMaxcircles );

	Msg2Player(varMap, varPlayer, varStr, 0, 3);
	
	if varCircles == 1 then
		GamePlayScriptLog(varMap, varPlayer, 701)
	end
	
	if varCircles == 5 then
		GamePlayScriptLog(varMap, varPlayer, 711)
	end
	
	if varCircles == 10 then
		GamePlayScriptLog(varMap, varPlayer, 721)
	end
end



function x300517_CheckSubmit( varMap, varPlayer, varTalknpc)
		local varItemData = x300517_GetCurrentItem(varMap, varPlayer)
		local varRecycleCount = GetPlayerGameData(varMap, varPlayer, MD_SHOUJI_MATERIAL_CYCLECOUNT[1], MD_SHOUJI_MATERIAL_CYCLECOUNT[2], MD_SHOUJI_MATERIAL_CYCLECOUNT[3])
		if GetItemCount(varMap,varPlayer,varItemData) >= varRecycleCount then
					local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x300517_var_QuestId)                                                  
	    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
	    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	    		return 1
	  else
	  			local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x300517_var_QuestId)                                                  
	    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,0)
	    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,0)
	  end
	  return 0
end



function x300517_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x300517_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x300517_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
  end
	local varCirclesCount = GetPlayerGameData(varMap, varPlayer, MD_SHOUJI_MATERIAL_CYCLECOUNT[1], MD_SHOUJI_MATERIAL_CYCLECOUNT[2], MD_SHOUJI_MATERIAL_CYCLECOUNT[3])
	local varCircles = GetPlayerGameData(varMap, varPlayer, MD_SHOUJI_MATERIAL_CYCLE[1], MD_SHOUJI_MATERIAL_CYCLE[2], MD_SHOUJI_MATERIAL_CYCLE[3])
	if varCirclesCount < x300517_var_MaxSigleCycle_Count then
		local randnum = random(1, 100)
 		if randnum > 50 then
 			x300517_GetBonus( varMap, varPlayer, varTalknpc)
 			local varItemData = x300517_GetCurrentItem(varMap, varPlayer)
			SetPlayerGameData(varMap, varPlayer, MD_SHOUJI_MATERIAL_CYCLECOUNT[1], MD_SHOUJI_MATERIAL_CYCLECOUNT[2], MD_SHOUJI_MATERIAL_CYCLECOUNT[3],varCirclesCount+1)
			local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x300517_var_QuestId)
	  	if DelItem( varMap,varPlayer,varItemData, varCirclesCount )      ~= 1 then return 0 end
			SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,0)
	    SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,0)
	    varCirclesCount = varCirclesCount + 1
			StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x300517_var_QuestName)
			local varStr;
			varStr = format("\t刚得到的消息，我们对#G@itemid_%d#W的需求又上升了。你能再为国家收集#G%d#W个#G@itemid_%d#W吗？", varItemData ,varCirclesCount,varItemData);
			TalkAppendString(varMap,varStr)
			TalkAppendString(varMap,"\n#Y任务目标：")
			varStr = format( "收集#G%d#W个#G@itemid_%d#W", varCirclesCount, varItemData )
			TalkAppendString(varMap,varStr )
			TalkAppendString(varMap,"\n#G小提示:#W")
			varStr = format( "这是本环的第%d次,最多可能连续做%d次", varCirclesCount ,x300517_var_MaxSigleCycle_Count);
			TalkAppendString(varMap,varStr )
			TalkAppendString(varMap,"\n#Y奖励内容：")
			local varLevel = x300517_GetAcceptLevel(varMap, varPlayer)
			local varExpBonus = x300517_var_ExpBonus*varLevel*2^varCirclesCount
			varStr = format( "经验值: %d", varExpBonus)
			TalkAppendString(varMap,varStr )
			StopTalkTask(varMap)
			
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x300517_var_FileId, x300517_var_QuestId);
			x300517_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
			return
		end
  end
  local varItemData = x300517_GetCurrentItem(varMap, varPlayer)
  if DelQuest(varMap, varPlayer, x300517_var_QuestId) > 0 then
		x300517_Msg2toplayer( varMap, varPlayer,2)
		x300517_GetBonus( varMap, varPlayer, varTalknpc)
		local varMaxcircles = x300517_GetMaxCircleNum( varMap, varPlayer )
		if varCircles >= varMaxcircles then
			x300517_SetDayComplete(varMap, varPlayer)
			local varLevel = x300517_GetAcceptLevel(varMap, varPlayer)
			for varI, item in x300517_var_ItemTable do
				if varLevel < item.maxLevel then
					 StartItemTask(varMap)
					 local varRandNum = random(x300517_var_ItemMinBonus, x300517_var_ItemMaxBonus)
					 ItemAppend( varMap, item.item, varRandNum )
					 local varRet = StopItemTask( varMap, varPlayer )
					 if varRet == 1 then
							DeliverItemListSendToPlayer( varMap, varPlayer )
							Msg2Player(varMap, varPlayer, format("你获得了物品#R@itemid_%d#Y的奖励", item.item),4,3)
							Msg2Player(varMap, varPlayer, format("你获得了物品#R@itemid_%d#Y的奖励", item.item),4,2)
					 end
					 break
				end
			end
			GamePlayScriptLog(varMap, varPlayer, 722)
		end
		if varCircles == 1 then
			GamePlayScriptLog(varMap, varPlayer, 702)
		end 
		if varCircles == 5 then
			GamePlayScriptLog(varMap, varPlayer, 712)
		end
	  if DelItem( varMap,varPlayer,varItemData, varCirclesCount ) ~= 1 then return 0 end
		SetPlayerGameData(varMap, varPlayer, MD_SHOUJI_MATERIAL_CYCLECOUNT[1], MD_SHOUJI_MATERIAL_CYCLECOUNT[2], MD_SHOUJI_MATERIAL_CYCLECOUNT[3], 0)
	end
end



function x300517_GetBonus( varMap, varPlayer,varTalknpc)
	  if x300517_var_ExpBonus > 0 then
			local varRecycleCount = GetPlayerGameData(varMap, varPlayer, MD_SHOUJI_MATERIAL_CYCLECOUNT[1], MD_SHOUJI_MATERIAL_CYCLECOUNT[2], MD_SHOUJI_MATERIAL_CYCLECOUNT[3])
			
			local varLevel = x300517_GetAcceptLevel(varMap, varPlayer)
			local varExpBonus = x300517_var_ExpBonus*varLevel*2^varRecycleCount
			AddExp(varMap, varPlayer, varExpBonus);
			Msg2Player(varMap, varPlayer, "#Y获得#R经验"..varExpBonus.."#Y的奖励", 0, 2)
  	end
		if x300517_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x300517_var_BonusMoney1 )
	  end
		if x300517_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x300517_var_BonusMoney2 )
	  end
		if x300517_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x300517_var_BonusMoney3 )
		end
		if x300517_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x300517_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x300517_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x300517_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x300517_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x300517_var_BonusMoney6)
		end
end



function x300517_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x300517_var_QuestId) <= 0 then
				return 
		end
		x300517_SetDayComplete( varMap, varPlayer)
		SetPlayerGameData(varMap, varPlayer, MD_SHOUJI_MATERIAL_ABDON[1], MD_SHOUJI_MATERIAL_ABDON[2], MD_SHOUJI_MATERIAL_ABDON[3], 1)
		DelQuest(varMap, varPlayer, x300517_var_QuestId)
	  x300517_Msg2toplayer( varMap, varPlayer,1)
end

function x300517_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x300517_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x300517_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
end

function x300517_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x300517_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
		x300517_ProcQuestLogRefresh(varMap, varPlayer, x300517_var_QuestId)
		local varItemData = x300517_GetCurrentItem(varMap, varPlayer)
		local varRecycleCount = GetPlayerGameData(varMap, varPlayer, MD_SHOUJI_MATERIAL_CYCLECOUNT[1], MD_SHOUJI_MATERIAL_CYCLECOUNT[2], MD_SHOUJI_MATERIAL_CYCLECOUNT[3])
		if GetItemCount(varMap,varPlayer,varItemData) >= varRecycleCount then
					local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x300517_var_QuestId)                                                  
	    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,GetItemCount(varMap,varPlayer,varItemData))
	    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	    		
	  else
	  			local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x300517_var_QuestId)                                                 
	    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,GetItemCount(varMap,varPlayer,varItemData))
	    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,0)
	  end
end


function x300517_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )

end

function x300517_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x300517_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x300517_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x300517_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x300517_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x300517_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end




function x300517_GetModNum(varMap, varPlayer)
	return 10
end




function x300517_GetRandItem(varMap, varPlayer)
	local varLevel = GetLevel(varMap, varPlayer)
	for varI, item in x300517_var_QuestTable do
		if varLevel < item.maxLevel then
			local varCount = getn( item.item )
			local varRandNum = random(1, varCount)
			return item.item[varRandNum]
		end
	end
end




function x300517_GetCurrentItem(varMap, varPlayer)
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300517_var_QuestId );
	local rst = GetQuestParam( varMap, varPlayer, varQuestIdx, 5)
	return rst
end




function x300517_SetCurrentItem(varMap, varPlayer, varItem)
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300517_var_QuestId );
	SetQuestByIndex(varMap,varPlayer,varQuestIdx,5,varItem)
end



function x300517_DispatchQuestInfo( varMap, varPlayer, varTalknpc ,varContinue)
		if x300517_var_ExpBonus> 0 then
			local varLevel = x300517_GetAcceptLevel(varMap, varPlayer)
		  if varContinue > 0 then
				local varRecycleCount = GetPlayerGameData(varMap, varPlayer, MD_SHOUJI_MATERIAL_CYCLECOUNT[1], MD_SHOUJI_MATERIAL_CYCLECOUNT[2], MD_SHOUJI_MATERIAL_CYCLECOUNT[3])
				
				local varExpBonus = x300517_var_ExpBonus*varLevel*2^varRecycleCount
				AddQuestExpBonus(varMap, varExpBonus )
			else
				AddQuestExpBonus(varMap, x300517_var_ExpBonus*varLevel*2 )
			end
		end
		if x300517_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x300517_var_BonusMoney1 )
		end
		if x300517_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x300517_var_BonusMoney2 )
		end
		if x300517_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x300517_var_BonusMoney3 )
		end
		if x300517_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x300517_var_BonusMoney4 )
		end
		if x300517_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x300517_var_BonusMoney5 )
		end
		if x300517_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x300517_var_BonusMoney6 )
		end
		for varI, item in x300517_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for varI, item in x300517_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end



function x300517_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务："..x300517_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务："..x300517_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务："..x300517_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务："..x300517_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务："..x300517_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务："..x300517_var_QuestName.."！", 0, 3)
				if x300517_var_ExpBonus > 0 then
					
  			end
				if x300517_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x300517_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x300517_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x300517_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x300517_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x300517_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x300517_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x300517_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x300517_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x300517_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x300517_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x300517_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end




function x300517_GetMaxCircleNum(varMap, varPlayer)
	return 10;
end




function x300517_GetDayComplete(varMap, varPlayer)

	if x300517_var_Mis_Count > 0 then

		local varToday = GetDayOfYear()

		local varLastday = GetPlayerGameData(varMap, varPlayer, MD_SHOUJI_MATERIAL_DATE[1], MD_SHOUJI_MATERIAL_DATE[2], MD_SHOUJI_MATERIAL_DATE[3])

		if varLastday ~= varToday then
			return 0
		end

		local varDaycount =  GetPlayerGameData(varMap, varPlayer, MD_SHOUJI_MATERIAL_COUNT[1], MD_SHOUJI_MATERIAL_COUNT[2], MD_SHOUJI_MATERIAL_COUNT[3])
		return varDaycount

	end

	return 0
end




function x300517_SetDayComplete(varMap, varPlayer)
	local varToday = GetDayOfYear()
	local varLastday = GetPlayerGameData(varMap, varPlayer, MD_SHOUJI_MATERIAL_DATE[1], MD_SHOUJI_MATERIAL_DATE[2], MD_SHOUJI_MATERIAL_DATE[3])
	if varLastday == varToday then
		SetPlayerGameData(varMap, varPlayer, MD_SHOUJI_MATERIAL_DATE[1], MD_SHOUJI_MATERIAL_DATE[2], MD_SHOUJI_MATERIAL_DATE[3], varToday)
	end
	SetPlayerGameData(varMap, varPlayer, MD_SHOUJI_MATERIAL_COUNT[1], MD_SHOUJI_MATERIAL_COUNT[2], MD_SHOUJI_MATERIAL_COUNT[3], 1)
end



function x300517_GetAcceptLevel(varMap, varPlayer)
	local varLevel = GetPlayerGameData(varMap, varPlayer, MD_SHOUJI_MATERIAL_LEVEL[1], MD_SHOUJI_MATERIAL_LEVEL[2], MD_SHOUJI_MATERIAL_LEVEL[3])
	return varLevel
end




function x300517_SetAcceptInfo(varMap, varPlayer)
	local varToday = GetDayOfYear()
	local varLevel = GetLevel(varMap, varPlayer)

	SetPlayerGameData(varMap, varPlayer, MD_SHOUJI_MATERIAL_DATE[1], MD_SHOUJI_MATERIAL_DATE[2], MD_SHOUJI_MATERIAL_DATE[3], varToday)
	SetPlayerGameData(varMap, varPlayer, MD_SHOUJI_MATERIAL_COUNT[1], MD_SHOUJI_MATERIAL_COUNT[2], MD_SHOUJI_MATERIAL_COUNT[3], 0)
	SetPlayerGameData(varMap, varPlayer, MD_SHOUJI_MATERIAL_CYCLE[1], MD_SHOUJI_MATERIAL_CYCLE[2], MD_SHOUJI_MATERIAL_CYCLE[3], 1)
	SetPlayerGameData(varMap, varPlayer, MD_SHOUJI_MATERIAL_CYCLECOUNT[1], MD_SHOUJI_MATERIAL_CYCLECOUNT[2], MD_SHOUJI_MATERIAL_CYCLECOUNT[3], 1)
	SetPlayerGameData(varMap, varPlayer, MD_SHOUJI_MATERIAL_LEVEL[1], MD_SHOUJI_MATERIAL_LEVEL[2], MD_SHOUJI_MATERIAL_LEVEL[3], varLevel)
	SetPlayerGameData(varMap, varPlayer, MD_SHOUJI_MATERIAL_ABDON[1], MD_SHOUJI_MATERIAL_ABDON[2], MD_SHOUJI_MATERIAL_ABDON[3], 0)
end




function x300517_AcceptThisCycle(varMap, varPlayer)
	local varToday = GetDayOfYear()
	local varLastday = GetPlayerGameData(varMap, varPlayer, MD_SHOUJI_MATERIAL_DATE[1], MD_SHOUJI_MATERIAL_DATE[2], MD_SHOUJI_MATERIAL_DATE[3])
	if varLastday == varToday then
		local varCircles = GetPlayerGameData(varMap, varPlayer, MD_SHOUJI_MATERIAL_CYCLE[1], MD_SHOUJI_MATERIAL_CYCLE[2], MD_SHOUJI_MATERIAL_CYCLE[3])
		local varLevel = GetLevel(varMap, varPlayer)
		varCircles = varCircles + 1
		SetPlayerGameData(varMap, varPlayer, MD_SHOUJI_MATERIAL_CYCLE[1], MD_SHOUJI_MATERIAL_CYCLE[2], MD_SHOUJI_MATERIAL_CYCLE[3], varCircles)
		SetPlayerGameData(varMap, varPlayer, MD_SHOUJI_MATERIAL_CYCLECOUNT[1], MD_SHOUJI_MATERIAL_CYCLECOUNT[2], MD_SHOUJI_MATERIAL_CYCLECOUNT[3], 1)
		SetPlayerGameData(varMap, varPlayer, MD_SHOUJI_MATERIAL_LEVEL[1], MD_SHOUJI_MATERIAL_LEVEL[2], MD_SHOUJI_MATERIAL_LEVEL[3], varLevel)
		SetPlayerGameData(varMap, varPlayer, MD_SHOUJI_MATERIAL_ABDON[1], MD_SHOUJI_MATERIAL_ABDON[2], MD_SHOUJI_MATERIAL_ABDON[3], 0)
	else
		x300517_SetAcceptInfo(varMap, varPlayer)
	end
end




function x300517_IsAbdon(varMap, varPlayer)
	local varToday = GetDayOfYear()
	local varLastday = GetPlayerGameData(varMap, varPlayer, MD_SHOUJI_MATERIAL_DATE[1], MD_SHOUJI_MATERIAL_DATE[2], MD_SHOUJI_MATERIAL_DATE[3])
	if varLastday == varToday then
		return GetPlayerGameData(varMap, varPlayer, MD_SHOUJI_MATERIAL_ABDON[1], MD_SHOUJI_MATERIAL_ABDON[2], MD_SHOUJI_MATERIAL_ABDON[3])
	else
		return 0
	end
end




function x300517_QuestLogRefresh(varMap, varPlayer, varQuest, varQuestTitle, varQuestName, varQuestTarget, varQuestNPC, varQuestProcess, varQuestComment, varQuestTip)

	if varQuestTitle == nil then
		varQuestTitle = "";
	end
	if varQuestName == nil then
		varQuestName = "";
	end
	if varQuestTarget == nil then
		varQuestTarget = "";
	end
	if varQuestNPC == nil then
		varQuestNPC = "";
	end
	if varQuestProcess == nil then
		varQuestProcess = "";
	end
	if varQuestComment == nil then
		varQuestComment = "";
	end
	if varQuestTip == nil then
		varQuestTip = "";
	end
	StartTalkTask(varMap);
		local varLevel = x300517_GetAcceptLevel(varMap, varPlayer)
		local varRecycleCount = GetPlayerGameData(varMap, varPlayer, MD_SHOUJI_MATERIAL_CYCLECOUNT[1], MD_SHOUJI_MATERIAL_CYCLECOUNT[2], MD_SHOUJI_MATERIAL_CYCLECOUNT[3])
		local varExpBonus = x300517_var_ExpBonus*varLevel*2^varRecycleCount
		AddQuestExpBonus(varMap,varExpBonus)
		
		AddQuestLogCustomText(varMap, varQuestTitle, varQuestName, varQuestTarget, varQuestNPC, varQuestProcess, varQuestComment, varQuestTip);
		
	StopTalkTask();
	DeliverTalkRefreshQuest(varMap, varPlayer, varQuest);

end
