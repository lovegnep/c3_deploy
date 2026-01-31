--DECLARE_QUEST_INFO_START--

x304005_var_FileId 	  = 304005
x304005_var_QuestKind 				= 	1                       
x304005_var_Mis_Count   = 1
x304005_var_QuestId = {10620,10621,10622,10623 }


x304005_var_ExtTarget					=	{ {type=20,n=1,target="作战物资"} }

x304005_var_ContinueInfo				= 	"\t如果不清除这些阿兰人，送往中国的贡品就不会按时完成。"
x304005_var_QuestCompleted			= 	"\t您已经将战利物资安全护送到此！请收下您应得的奖励！"

x304005_var_QuestName = "【练兵】护送物资"
x304005_var_LevelLess = 60
x304005_var_LevelMax  = 69
x304005_var_BusScriptId = 304006

x304005_var_QuestInfo = "\t正如你所见，我国的边塞常年处在征战之中，虽然我国国力强盛，但征战之时难免有所损耗，为了支援边塞的战士们持续作战，我这里急需人手运送物资，你若有心为国效力，便把这些物资送到边塞去吧。"
x304005_var_QuestHelp = "\t#G护送途中如果你离开物资马车过远，马车会因无人引导而停止前进！\n\t#G如果马车受到袭击被摧毁，任务失败！#G如果你离开马车超过5分钟，马车将丢失，任务失败！"
x304005_var_SubmitNPCGUID = {125551,128560,131561,134557 }

x304005_var_ExpTable       ={
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


--DECLARE_QUEST_INFO_STOP--
							

function x304005_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	local CountryID = GetCurCountry( varMap, varPlayer )
	local level = GetLevel( varMap, varPlayer )
		if level < x304005_var_LevelLess or level > x304005_var_LevelMax then
			return 
		end	
	if IsHaveQuest( varMap, varPlayer, x304005_var_QuestId[CountryID+1] ) <= 0 then
			return
	end
	if IsHaveQuest( varMap, varPlayer, x304005_var_QuestId[CountryID+1] ) <= 0 then
		local varTalkNpcGUID = GetMonsterGUID(varMap,varTalknpc)
		if x304005_var_SubmitNPCGUID[CountryID+1] ~= varTalkNpcGUID then
			local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x304005_var_QuestId[CountryID+1])
			TalkAppendButton(varMap,x304005_var_QuestId[CountryID+1],x304005_var_QuestName,varState,0);
		end
	end

end


function x304005_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest,varExtIdx )
--	if GetLevel(varMap, varPlayer) < x304005_var_LevelLess then
--		StartTalkTask(varMap);
--		TalkAppendString(varMap, "你等级过低，不能领取任务");
--		StopTalkTask();
--		DeliverTalkTips(varMap, varPlayer);
--		Msg2Player(varMap,varPlayer,"你等级过低，不能领取任务",8,2)
--		return
--	end
--
--	if GetLevel(varMap, varPlayer) > x304005_var_LevelMax then
--		StartTalkTask(varMap);
--		TalkAppendString(varMap, "你等级过高，不能领取任务");
--		StopTalkTask();
--		DeliverTalkTips(varMap, varPlayer);
--		Msg2Player(varMap,varPlayer,"你等级过高，不能领取任务",8,2)
--		return
--	end
--	local varLevelMax = GetTopListInfo_MaxLevel( GetWorldID( varMap, varPlayer) )
--	if GetLevel(varMap, varPlayer) > ( varLevelMax-5) then
--		StartTalkTask(varMap);
--		TalkAppendString(varMap, "你等级过高，不能领取任务");
--		StopTalkTask();
--		DeliverTalkTips(varMap, varPlayer);
--		Msg2Player(varMap,varPlayer,"你等级过高，不能领取任务",8,2)
--		return
--	end 
		
	local IsHaveExp = GetExp(varMap, varPlayer)
	local Selflevel = GetLevel( varMap, varPlayer )
	if IsHaveExp >= x304005_var_ExpTable[Selflevel] then 
		StartTalkTask(varMap);
		TalkAppendString(varMap, "您的剩余经验超过了当前升级所需经验，请升级后再试");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer,"您的剩余经验超过了当前升级所需经验，请升级后再试",8,2)	
		return
	end	


	local CountryID = GetCurCountry( varMap, varPlayer )

	local varHaveQuest	= IsHaveQuestNM(varMap, varPlayer, x304005_var_QuestId[CountryID+1])
	local varTalkNpcGUID = GetMonsterGUID(varMap,varTalknpc)
	
	if x304005_var_SubmitNPCGUID[CountryID+1] ~= varTalkNpcGUID then
	
		if(varHaveQuest > 0) then
			local varDone = x304005_CheckSubmit(varMap, varPlayer, varTalknpc);
			if(varDone > 0) then
				if varExtIdx ~= -1 then
					x304005_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,0) 
				end
			else
				if varExtIdx ~= -1 then
					x304005_DispatchContinueInfo( varMap, varPlayer, varTalknpc,0 ) 
				end
			end
		else
			if x304005_var_SubmitNPCGUID[CountryID+1] ~= varTalkNpcGUID then
				x304005_DispatchQuestInfo( varMap, varPlayer, varTalknpc,0 )	
			else
				

				
				StartTalkTask(varMap)
				TalkAppendString(varMap,"你没有此任务！")
				StopTalkTask()
				DeliverTalkMenu(varMap,varPlayer,varTalknpc);
			end
		end
	else
	
		if(varHaveQuest > 0) then
			x304005_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,0) 
		
		
			
			
			
			
		end
	end
	
end


function x304005_DispatchQuestInfo( varMap, varPlayer, varTalknpc,varIndex )
	local CountryID = GetCurCountry( varMap, varPlayer )

	StartTalkTask( varMap);
		
		TalkAppendString(varMap, "#Y"..x304005_var_QuestName);
		TalkAppendString(varMap, x304005_var_QuestInfo )
		
		TalkAppendString( varMap, "#Y任务目标：")
		TalkAppendString( varMap, "  将马车交给@npc_"..x304005_var_SubmitNPCGUID[CountryID+1])
		TalkAppendString( varMap, " ")
		
		if x304005_var_QuestHelp ~= "" then
			TalkAppendString(varMap, "#Y任务提示：")
			TalkAppendString(varMap, x304005_var_QuestHelp )
		end
		
		
		
		local varExperience = x304005_CalcExperience(varMap, varPlayer)
		if varExperience > 0 then
			AddQuestExpBonus( varMap, varExperience)
		end

	StopTalkTask(varMap);

	DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x304005_var_FileId,  x304005_var_QuestId[CountryID+1]);
end





function x304005_DispatchContinueInfo( varMap, varPlayer, varTalknpc,varIndex )
	local CountryID = GetCurCountry( varMap, varPlayer )
	
	StartTalkTask(varMap)

		
		TalkAppendString(varMap,"#Y"..x304005_var_QuestName)
		TalkAppendString(varMap,x304005_var_QuestInfo)
		TalkAppendString(varMap," ")

		
		TalkAppendString( varMap,"#Y完成情况：")
		TalkAppendString(varMap, "未完成");

  		

		
		local varExperience = x304005_CalcExperience(varMap, varPlayer)
		if varExperience > 0 then
			AddQuestExpBonus( varMap, varExperience)
		end

	StopTalkTask()
	DeliverTalkRequire(varMap, varPlayer, varTalknpc, x304005_var_FileId, x304005_var_QuestId[CountryID+1],0);

end





function x304005_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,varIndex )
	local CountryID = GetCurCountry( varMap, varPlayer )
	
	StartTalkTask(varMap)

		
		TalkAppendString(varMap,"#Y"..x304005_var_QuestName)
		TalkAppendString(varMap,x304005_var_QuestCompleted)
		TalkAppendString(varMap," ")

		
		local varExperience = x304005_CalcExperience(varMap, varPlayer)
		if varExperience > 0 then
			AddQuestExpBonus( varMap, varExperience)
		end
			
	StopTalkTask(varMap)
	DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x304005_var_FileId , x304005_var_QuestId[CountryID+1]);

end




function x304005_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
	if GetLevel(varMap, varPlayer) < x304005_var_LevelLess then
		StartTalkTask(varMap);
		TalkAppendString(varMap, "你等级过低，不能领取任务");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer,"你等级过低，不能领取任务",8,2)
		return
	end

	if GetLevel(varMap, varPlayer) > x304005_var_LevelMax then
		StartTalkTask(varMap);
		TalkAppendString(varMap, "你等级过高，不能领取任务");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer,"你等级过高，不能领取任务",8,2)
		return
	end
	local varLevelMax = GetTopListInfo_MaxLevel( GetWorldID( varMap, varPlayer) )
	if GetLevel(varMap, varPlayer) > ( varLevelMax-5) then
		StartTalkTask(varMap);
		TalkAppendString(varMap, "你等级过高，不能领取任务");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer,"你等级过高，不能领取任务",8,2)
		return
	end 
	
	local IsHaveExp = GetExp(varMap, varPlayer)
	local Selflevel = GetLevel( varMap, varPlayer )
	if IsHaveExp >= x304005_var_ExpTable[Selflevel] then 
		StartTalkTask(varMap);
		TalkAppendString(varMap, "您的剩余经验超过了当前升级所需经验，无法领取任务");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer,"您的剩余经验超过了当前升级所需经验，无法领取任务",8,2)	
		return
	end	


	local CountryID = GetCurCountry( varMap, varPlayer )

	--2011-4-13 by rj 增加对押运交付任务人通过外挂进行的接受任务操作
	local varTalkNpcGUID = GetMonsterGUID(varMap, varTalknpc)
	if varTalkNpcGUID == x304005_var_SubmitNPCGUID[CountryID+1] then
		return
	end

	
	if IsHideName(varMap, varPlayer) > 0 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"抱歉，蒙面状态不能接此任务。")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 0
	end
	
	if IsQuestFullNM( varMap, varPlayer )==1 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"可接任务数量已满")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 0
	end

	local varLevel = GetLevel(varMap, varPlayer)
	if varLevel < x304005_var_LevelLess then
		StartTalkTask(varMap)
		TalkAppendString(varMap, "您的等级不能领取此任务！");
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		local varReadme = "您的等级不能领取此任务！" 
		Msg2Player(varMap,varPlayer,varReadme,8,2)
		return 0
	end


	if IsTeamFollow(varMap, varPlayer) == 1 then
		StartTalkTask(varMap)
		TalkAppendString(varMap, "组队跟随状态下不可以接护送任务");
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		local varReadme = "组队跟随状态下不可以接护送任务！"
		Msg2Player(varMap,varPlayer,varReadme,8,2)
		return 0
	end
	
	if IsBusMember(varMap,varPlayer) == 1 then
		StartTalkTask(varMap)
		TalkAppendString(varMap, "您已处于护送/押运状态，无法领取新的押运任务！");
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		local varReadme = "您已处于护送/押运状态，无法领取新的押运任务！" 
		Msg2Player(varMap,varPlayer,varReadme,8,2)
		return 0
	end

	if x304005_GetDayCount(varMap, varPlayer) >= x304005_var_Mis_Count then
		local varReadme = "很抱歉，您今天任务次数已满，请明天再来做吧！" 
	  	StartTalkTask(varMap)
		TalkAppendString(varMap,varReadme );
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,varReadme,8,2)
		return 0
	end
		
	local varHaveQuest	= IsHaveQuestNM(varMap, varPlayer, x304005_var_QuestId[CountryID+1]);
	if(varHaveQuest > 0) then
		return 0;
	end
	
	
	local varCount = x304005_GetDayCount(varMap, varPlayer)
	LuaCallNoclosure( x304005_var_BusScriptId, "ProcCreateBus", varMap, varPlayer ,x304005_var_QuestId[CountryID+1],varCount+1)

end




function x304005_CheckSubmit(varMap, varPlayer, varTalknpc)
	local CountryID = GetCurCountry( varMap, varPlayer )
	
	local varTalkNpcGUID = GetMonsterGUID(varMap,varTalknpc)

	if x304005_var_SubmitNPCGUID[CountryID+1] ~= varTalkNpcGUID then
		return 0
	end

	return 1;

end




function x304005_ProcAccept( varMap, varPlayer )
	
end



function x304005_ProcQuestSubmit( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	local CountryID = GetCurCountry( varMap, varPlayer )

	if IsQuestHaveDoneNM( varMap, varPlayer, varQuest ) > 0 then 
		return 0
	end

	if IsHaveQuestNM( varMap, varPlayer, varQuest) <= 0 then	
		return 0
	end

	
	local varValid = IsValidMyselfBus(varMap, varPlayer,varQuest)

	if varValid == 0 then
        StartTalkTask(varMap)
		TalkAppendString(varMap, "您护送的马车离您太远了，无法提交任务！");
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		local varReadme = "您护送的马车离您太远了，无法提交任务！"
		Msg2Player(varMap,varPlayer,varReadme,8,2)
		return 0
	end
   
	
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest)
	local varRet = DelQuest( varMap, varPlayer, varQuest) 
	if varRet == 1 then 

		
		local varExperience = x304005_CalcExperience(varMap, varPlayer)
		if varExperience > 0 then
			AddExp(varMap, varPlayer,varExperience)
			local varExp1 = x304005_CalcExperience(varMap, varPlayer)
			local varReadme = "您完成了任务：【练兵】护送物资#r获得#R经验"..varExp1.."点#o的奖励"
			StartTalkTask(varMap)
			TalkAppendString(varMap, "您完成了任务：【练兵】护送物资");
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			StartTalkTask(varMap)
			TalkAppendString(varMap, "获得#R经验"..varExp1.."点#o的奖励");
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			Msg2Player(varMap,varPlayer,varReadme,8,2)
		end
		        
		x304005_SetDayCount(varMap, varPlayer)
		
		local varBusID  =  GetBusId(varMap, varPlayer)
		if varBusID ~= -1 and IsObjValid (varMap,varBusID) == 1 then
			
			if GetBusQuestID(varMap, varBusID) == varQuest then
				DeleteBus(varMap, varBusID,1)
			end
		end 
	end

	return 0
end





function x304005_ProcQuestAbandon( varMap, varPlayer,varQuest )
	local CountryID = GetCurCountry( varMap, varPlayer )

	local varHaveQuest = IsHaveQuestNM(varMap, varPlayer,x304005_var_QuestId[CountryID+1] );
	if varHaveQuest > 0 then

		if IsBusMember(varMap, varPlayer) == 1 then
			local varBusID  =  GetBusId(varMap, varPlayer)
			if varBusID ~= -1 and IsObjValid (varMap,varBusID) == 1 then
				
				if GetBusQuestID(varMap, varBusID) == x304005_var_QuestId[CountryID+1] then
					DeleteBus(varMap, varBusID,1)
				end
			else
				local varReadme = "很抱歉，您与您的护送目标在同一场景才能放弃任务，请先找到您的护送目标再选择放弃！"
				StartTalkTask(varMap)
				TalkAppendString(varMap, "现在不能放弃任务！");
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				Msg2Player(varMap,varPlayer,varReadme,8,2)
				return
			end				
		end

		local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, x304005_var_QuestId[CountryID+1]); 
		DelQuest(varMap, varPlayer, x304005_var_QuestId[CountryID+1]);
						
		

		local varReadme = "您放弃了任务：【练兵】护送物资"
		StartTalkTask(varMap)
		TalkAppendString(varMap, varReadme);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,varReadme,8,2)

		x304005_SetDayCount(varMap, varPlayer)
	end

end


function x304005_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID,varQuestIdx, varQuest )
	local CountryID = GetCurCountry( varMap, varPlayer )
	
	local varHaveQuest = IsHaveQuestNM(varMap, varPlayer,x304005_var_QuestId[CountryID+1] )

	if varHaveQuest > 0 then
		if varTalkNpcGUID == x304005_var_SubmitNPCGUID[CountryID+1] then
			local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x304005_var_QuestId[CountryID+1])
			TalkAppendButton(varMap, x304005_var_QuestId[CountryID+1], x304005_var_QuestName,7,0);
		end
	end

end




function x304005_QuestLogRefresh( varMap, varPlayer, varQuest)
	local CountryID = GetCurCountry( varMap, varPlayer )

	local varHaveQuest = IsHaveQuestNM(varMap, varPlayer,x304005_var_QuestId[CountryID+1] );
	if varHaveQuest > 0 then
	
		StartTalkTask(varMap)
		
		local varExperience = x304005_CalcExperience(varMap, varPlayer)
		if varExperience > 0 then
			AddQuestExpBonus( varMap, varExperience)
		end

		AddQuestLogCustomText( varMap,
								"",						
								x304005_var_QuestName,        
								"  将马车交给@npc_"..x304005_var_SubmitNPCGUID[CountryID+1],		
								"@npc_"..x304005_var_SubmitNPCGUID[CountryID+1],			
								"将马车送到王城的@npc_"..x304005_var_SubmitNPCGUID[CountryID+1].."处",               
								x304005_var_QuestInfo,	
								""					
								)
		StopTalkTask(varMap)
		DeliverTalkRefreshQuest(varMap, varPlayer, x304005_var_QuestId[CountryID+1]);
	end

end

function x304005_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
	x304005_QuestLogRefresh( varMap, varPlayer, varQuest );
end




function x304005_GetDayCount(varMap, varPlayer)

	if x304005_var_Mis_Count > 0 then

		local varToday = GetDayOfYear()

		local varLastday = GetPlayerGameData(varMap, varPlayer, MD_QUEST_SUCHENG3_DAY[1], MD_QUEST_SUCHENG3_DAY[2], MD_QUEST_SUCHENG3_DAY[3])

		if varLastday ~= varToday then
			return 0
		end

		local varDaycount =  GetPlayerGameData(varMap, varPlayer, MD_QUEST_SUCHENG3_DAYCOUNT[1], MD_QUEST_SUCHENG3_DAYCOUNT[2], MD_QUEST_SUCHENG3_DAYCOUNT[3])
		return varDaycount

	end

	return 0
end




function x304005_SetDayCount(varMap, varPlayer)
	local varToday = GetDayOfYear()

	local varLastday = GetPlayerGameData(varMap, varPlayer, MD_QUEST_SUCHENG3_DAY[1], MD_QUEST_SUCHENG3_DAY[2], MD_QUEST_SUCHENG3_DAY[3])

	if varLastday ~= varToday then
		SetPlayerGameData(varMap, varPlayer, MD_QUEST_SUCHENG3_DAY[1], MD_QUEST_SUCHENG3_DAY[2], MD_QUEST_SUCHENG3_DAY[3], varToday)
		SetPlayerGameData(varMap, varPlayer, MD_QUEST_SUCHENG3_DAYCOUNT[1], MD_QUEST_SUCHENG3_DAYCOUNT[2], MD_QUEST_SUCHENG3_DAYCOUNT[3], 1)
	else
		local varDaycount = GetPlayerGameData(varMap, varPlayer, MD_QUEST_SUCHENG3_DAYCOUNT[1], MD_QUEST_SUCHENG3_DAYCOUNT[2], MD_QUEST_SUCHENG3_DAYCOUNT[3])
		SetPlayerGameData(varMap, varPlayer, MD_QUEST_SUCHENG3_DAYCOUNT[1], MD_QUEST_SUCHENG3_DAYCOUNT[2], MD_QUEST_SUCHENG3_DAYCOUNT[3], varDaycount+1)
	end
end


function x304005_CalcExperience(varMap, varPlayer)
	local varLevel = GetLevel(varMap, varPlayer)
	local awardexp = 0
	if x304005_var_ExpTable[varLevel] > 0 then
		awardexp = floor(x304005_var_ExpTable[varLevel]/3)
	end
	return awardexp
end

