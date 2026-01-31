

--DECLARE_QUEST_INFO_START--
x304003_var_MissionIdList 		= {                     --任务ID
																		{Country=0,MissionId=10612},
																		{Country=1,MissionId=10613},
																		{Country=2,MissionId=10614},
																		{Country=3,MissionId=10615},

															}
x304003_var_Target={123838,126138,129740,132164 }

														
x304003_var_FileId 					= 	304003                  
                    
x304003_var_LevelLess					= 	50                      
x304003_var_LevelMax          =   59

x304003_var_QuestName				= 	"【练兵】新兵速成"

x304003_var_MaxKillNum				= 30

x304003_var_MaxCount					= 1

--DECLARE_QUEST_INFO_STOP--
x304003_var_ExpTable       ={
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
function x304003_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	if IsHaveQuest( varMap, varPlayer, x304003_GetMissionId( varMap, varPlayer ) ) <= 0 then
		return
	end
	
	if IsHaveQuest( varMap, varPlayer, x304003_GetMissionId( varMap, varPlayer ) ) <= 0 then
		local level = GetLevel( varMap, varPlayer )
		if level < x304003_var_LevelLess or level > x304003_var_LevelMax then
			return 
		end	
	end
		
	local  questState = GetQuestStateNM(varMap, varPlayer, varTalknpc, x304003_GetMissionId( varMap, varPlayer ))
	TalkAppendButtonNM(varMap, varPlayer, varTalknpc, x304003_GetMissionId( varMap, varPlayer ), questState);
	
end


function x304003_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest )

--	if GetTopListInfo_MaxLevel( GetWorldID( varMap, varPlayer) ) < 65 then
--		StartTalkTask(varMap);
--		TalkAppendString(varMap, "服务器等级第一名达到65级，才可开启新兵速成任务");
--		StopTalkTask();
--		DeliverTalkTips(varMap, varPlayer);
--		Msg2Player(varMap,varPlayer,"服务器等级第一名达到65级，才可开启新兵速成任务",8,2)	
--		return
--	end
--	if GetLevel(varMap, varPlayer) < x304003_var_LevelLess then
--		StartTalkTask(varMap);
--		TalkAppendString(varMap, "你等级过低，不能领取任务");
--		StopTalkTask();
--		DeliverTalkTips(varMap, varPlayer);
--		Msg2Player(varMap,varPlayer,"你等级过低，不能领取任务",8,2)
--		return
--	end
--
--	if GetLevel(varMap, varPlayer) > x304003_var_LevelMax then
--		StartTalkTask(varMap);
--		TalkAppendString(varMap, "你等级过高，不能领取任务");
--		StopTalkTask();
--		DeliverTalkTips(varMap, varPlayer);
--		Msg2Player(varMap,varPlayer,"你等级过高，不能领取任务",8,2)
--		return
--	end	
	local IsHaveExp = GetExp(varMap, varPlayer)
	local Selflevel = GetLevel( varMap, varPlayer )
	if IsHaveExp >= x304003_var_ExpTable[Selflevel] then 
		StartTalkTask(varMap);
		TalkAppendString(varMap, "您的剩余经验超过了当前升级所需经验，请升级后再试");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer,"您的剩余经验超过了当前升级所需经验，请升级后再试",8,2)	
		return
	end	
	
	if IsHaveQuestNM( varMap, varPlayer, varQuest ) == 0 then	

		x304003_DispatchQuestInfo( varMap, varPlayer, varTalknpc, varQuest )
		
	
	else 
		local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )
		local killcount = GetQuestParam(varMap, varPlayer, varQuestIdx, 0)
		if killcount == x304003_var_MaxKillNum then
			x304003_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,varQuest )
			
		else
			x304003_DispatchContinueInfo( varMap, varPlayer, varTalknpc,varQuest )
			
		end
	end
end



function x304003_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )

	if GetTopListInfo_MaxLevel( GetWorldID( varMap, varPlayer) ) < 65 then
		StartTalkTask(varMap);
		TalkAppendString(varMap, "服务器等级第一名达到65级，才可开启新兵速成任务");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer,"服务器等级第一名达到65级，才可开启新兵速成任务",8,2)	
		return
	end
	if GetLevel(varMap, varPlayer) < x304003_var_LevelLess then
		StartTalkTask(varMap);
		TalkAppendString(varMap, "你等级过低，不能领取任务");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer,"你等级过低，不能领取任务",8,2)
		return
	end

	if GetLevel(varMap, varPlayer) > x304003_var_LevelMax then
		StartTalkTask(varMap);
		TalkAppendString(varMap, "你等级过高，不能领取任务");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer,"你等级过高，不能领取任务",8,2)
		return
	end	
	local IsHaveExp = GetExp(varMap, varPlayer)
	local Selflevel = GetLevel( varMap, varPlayer )
	if IsHaveExp >= x304003_var_ExpTable[Selflevel] then 
		StartTalkTask(varMap);
		TalkAppendString(varMap, "您的剩余经验超过了当前升级所需经验，无法领取任务");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer,"您的剩余经验超过了当前升级所需经验，无法领取任务",8,2)	
		return
	end		
	
	if IsHaveQuestNM( varMap, varPlayer, x304003_GetMissionId( varMap, varPlayer ) ) > 0 then	
		return 0
	end
	if GetLevel(varMap, varPlayer) < x304003_var_LevelLess then
		StartTalkTask(varMap);
		TalkAppendString(varMap, "你等级过低，不能领取任务");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer,"你等级过低，不能领取任务",8,2)
		return 0
	end

	if GetLevel(varMap, varPlayer) > x304003_var_LevelMax then
		StartTalkTask(varMap);
		TalkAppendString(varMap, "你等级过高，不能领取任务");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer,"你等级过高，不能领取任务",8,2)
		return 0
	end 

	local varDaycount = x304003_GetDayCount(varMap, varPlayer)
	if varDaycount >= x304003_var_MaxCount then
		StartTalkTask(varMap);
			TalkAppendString(varMap, "每日只能接取一次此任务，请明日再来");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		return 0
	end

	local varRet = QuestCheckAcceptNM( varMap, varPlayer, varTalknpc, x304003_GetMissionId( varMap, varPlayer ) ) 
	if varRet > 0 then 
		varRet = AddQuestNM( varMap, varPlayer, x304003_GetMissionId( varMap, varPlayer ) ) 
		if varRet > 0 then
			x304003_ProcQuestLogRefresh( varMap, varPlayer, x304003_GetMissionId( varMap, varPlayer ))

			StartTalkTask(varMap);
				TalkAppendString(varMap, "您接受了任务:【练兵】新兵速成");
			StopTalkTask();
			DeliverTalkTips(varMap, varPlayer);
			Msg2Player(varMap,varPlayer,"您接受了任务:【练兵】新兵速成",8,2)
			return 1
		elseif varRet == -2 then
			StartTalkTask(varMap);
				TalkAppendString(varMap, "任务已满，无法接受任务");
			StopTalkTask();
			DeliverTalkTips(varMap, varPlayer);
			return 0
		else
			StartTalkTask(varMap);
				TalkAppendString(varMap, "接受任务错误");
			StopTalkTask();		
			DeliverTalkTips(varMap, varPlayer);
			return 0
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



function x304003_ProcQuestSubmit( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
    
    if varQuest == nil or varQuest < 0 then
        return 0
    end
    
    if IsHaveQuestNM( varMap,varPlayer,varQuest )<= 0 then
        return 0
    end
    
	local varRet = QuestComplateNM( varMap, varPlayer, varTalknpc, varQuest, varButtonClick ) 
	if varRet == 1 then 
		x304003_SetDayCount(varMap, varPlayer)
		
		StartTalkTask(varMap);
			TalkAppendString(varMap, "您完成了任务:【练兵】新兵速成");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer,"您完成了任务:【练兵】新兵速成",8,2)

		x304003_GiveReward(varMap,varPlayer)
		
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

function x304003_GiveReward(varMap,varPlayer)

	local varExpBonus = x304003_GetExp( varMap, varPlayer )
	
	AddExp(varMap, varPlayer, varExpBonus)
	StartTalkTask(varMap);
		TalkAppendString(varMap, "#o获得#R经验"..varExpBonus.."点#o的奖励");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
	Msg2Player(varMap,varPlayer,"#o获得#R经验"..varExpBonus.."点#o的奖励",4,2)
end


function x304003_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID,varQuestIdx, varQuest )
--	if IsHaveQuestNM( varMap, varPlayer, varQuest) == 0 then	
--		return
--	end
--		
--	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest)
--	local submitGuid = GetQuestSubmitNPCGUIDNM( varMap, varPlayer, varQuestIdx )
--	if varTalkNpcGUID == submitGuid then	
--		local questState = GetQuestStateNM(varMap, varPlayer, varTalknpc, varQuest)
--		TalkAppendButtonNM( varMap, varPlayer, varTalknpc, varQuest, questState, -1 ) 
--	end
end

 




function x304003_ProcQuestAbandon( varMap, varPlayer,varQuest )
	if IsHaveQuestNM( varMap, varPlayer, varQuest ) <= 0 then
		return -1;
	end

	local varRet = 0
	varRet = DelQuestNM( varMap, varPlayer, varQuest )
	if varRet == 1 then
		x304003_SetDayCount(varMap, varPlayer)
		StartTalkTask(varMap);
			TalkAppendString(varMap, "您放弃了任务:【练兵】新兵速成");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer,"您放弃了任务:【练兵】新兵速成",8,2)
	end
end


function x304003_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
	local ObjName = GetName(varMap, varObj)

	local HumenNum = GetMonsterOwnerCount( varMap, varObj ) 
		for varI = 0, HumenNum-1 do
				local humanObjId = GetMonsterOwnerID( varMap, varObj, varI ) 
				
				if humanObjId ~= -1 then
					if  GetLevel(varMap, humanObjId) - GetLevel(varMap, varObj) <= 5 then
						if  GetHp(varMap, humanObjId) > 0 then
							if IsHaveQuestNM( varMap, humanObjId, varQuest ) > 0 then	
								local varText = "";
								local varQuestIdx = GetQuestIndexByID( varMap, humanObjId, x304003_GetMissionId( varMap, varPlayer ) )
								local KilledNum = GetQuestParam( varMap, humanObjId, varQuestIdx, 0 )												
							    if KilledNum == x304003_var_MaxKillNum-1 then
								    SetQuestByIndex( varMap, humanObjId, varQuestIdx, 0, KilledNum+1 )
									SetQuestByIndex( varMap, humanObjId, varQuestIdx, 7, 1 )
									StartTalkTask(varMap)
									if ObjName == "" then
										varText = format( "#cffcf00【练兵】新兵速成：您击毙了怪物(%d/%d)", KilledNum+1, x304003_var_MaxKillNum )
									else
										varText = format( "#cffcf00【练兵】新兵速成：您击毙了%s(%d/%d)", ObjName, KilledNum+1, x304003_var_MaxKillNum )
									end
									TalkAppendString( varMap, varText )
									StopTalkTask( varMap )
									DeliverTalkTips( varMap, humanObjId )
									x304003_ProcQuestLogRefresh( varMap, humanObjId, varQuest)
								elseif KilledNum < x304003_var_MaxKillNum-1 then
									SetQuestByIndex( varMap, humanObjId, varQuestIdx, 0, KilledNum+1 )
									StartTalkTask(varMap)
									if ObjName == "" then
										varText = format( "#cffcf00【练兵】新兵速成：您击毙了怪物(%d/%d)", KilledNum+1, x304003_var_MaxKillNum )
									else
										varText = format( "#cffcf00【练兵】新兵速成：您击毙了%s(%d/%d)", ObjName, KilledNum+1, x304003_var_MaxKillNum )
									end
									TalkAppendString( varMap, varText )
									StopTalkTask( varMap )
									DeliverTalkTips( varMap, humanObjId )
									x304003_ProcQuestLogRefresh( varMap, humanObjId, varQuest)
							    end
							end
					    end
				    end
				end
				
				
		end

	
end


function x304003_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
	return 0
end



function x304003_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	return 1
end


function x304003_DispatchQuestInfo( varMap, varPlayer, varTalknpc, varQuest)
	local awardexp = x304003_GetExp( varMap, varPlayer )
	
	StartTalkTask(varMap)

	TalkAppendString(varMap,"#Y【练兵】新兵速成")
	
	
	TalkAppendString(varMap,"   当等级排行榜第一名达到#R65级#W时，会开启新兵速成任务。最近，四国之间的矛盾渐渐加深了，我需要更多的士兵来保卫我们的国家。我可以帮助你迅速变成一个训练有素的士兵。\n\t消灭等级不比你低5级以上的30只怪物，你就可以完成新兵的训练。")
	TalkAppendString(varMap," ")

	
	TalkAppendString( varMap,"#Y任务目标：")
	TalkAppendString( varMap,"   消灭等级不比你低5级以上的30只怪物，你就可以完成新兵的训练。")

	TalkAppendString( varMap,"   \n#G小提示：\n如果目前拥有的经验超过当前升级所需经验将不能接取此任务。")
	TalkAppendString( varMap," ")
	
	
	
	AddQuestExpBonus(varMap,  awardexp);
			
	StopTalkTask()
	DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x304003_var_FileId, varQuest,0);
end




function x304003_DispatchContinueInfo( varMap, varPlayer, varTalknpc,varQuest )

	
	
	
		
	
	
	StartTalkTask(varMap)

	TalkAppendString(varMap,"#Y【练兵】新兵速成")
	
	
	TalkAppendString(varMap,"   时间紧迫，你还是快去杀怪吧。")
	TalkAppendString(varMap," ")

	
	
	
	
			
	StopTalkTask()
	DeliverTalkRequire(varMap, varPlayer, varTalknpc, x304003_var_FileId, varQuest,0);
end




function x304003_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,varQuest )
	local awardexp = x304003_GetExp( varMap, varPlayer )
	
	StartTalkTask(varMap)

	TalkAppendString(varMap,"#Y【练兵】新兵速成")
	
	
	TalkAppendString(varMap,"   很好，你被证明是一个合格的新兵。")
	TalkAppendString(varMap," ")

	
	
	AddQuestExpBonus(varMap,  awardexp);
			
	StopTalkTask()
	DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x304003_var_FileId, varQuest);

end

function x304003_ProcQuestLogRefresh( varMap, varPlayer, varQuest)

	if IsHaveQuestNM( varMap, varPlayer, varQuest ) <= 0 then
		return
	end
	local countryID = GetCurCountry(varMap, varPlayer)
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )
	local killcount = GetQuestParam(varMap, varPlayer, varQuestIdx, 0);

	local varStr = "  消灭30只等级适当的怪物("..killcount.."/"..tostring(x304003_var_MaxKillNum)..")";	
	StartTalkTask(varMap)	
		local awardexp = x304003_GetExp( varMap, varPlayer )

		AddQuestExpBonus(varMap,  awardexp);
		
	AddQuestLogCustomText( varMap,
							"",						
							"【练兵】新兵速成",            
							varStr,		
							"@npc_"..x304003_var_Target[countryID+1],			
							"和其他玩家配合可以更快地完成任务。",               
							"最近，四国之间的矛盾渐渐加深了，我需要更多的士兵来保卫我们的国家。我可以帮助你迅速变成一个训练有素的士兵。消灭等级不比你低5级以上的30只怪物，你就可以完成新兵的训练。",	
							"每天可以领取一次新兵速成任务，可以领取该任务的等级下限为50级，等级上限为59级。"					
							)
	StopTalkTask()
	DeliverTalkRefreshQuest(varMap, varPlayer, varQuest);
		
	
end




function x304003_GetDayCount(varMap, varPlayer)
	if x304003_var_MaxCount > 0 then
		local varToday = GetDayOfYear()
		local varLastday = GetPlayerGameData(varMap, varPlayer, MD_QUEST_SUCHENG1_DAY[1], MD_QUEST_SUCHENG1_DAY[2], MD_QUEST_SUCHENG1_DAY[3])
		if varLastday ~= varToday then
			return 0
		end

		local varDaycount =  GetPlayerGameData(varMap, varPlayer, MD_QUEST_SUCHENG1_DAYCOUNT[1], MD_QUEST_SUCHENG1_DAYCOUNT[2], MD_QUEST_SUCHENG1_DAYCOUNT[3])
		return varDaycount

	end
	return 0
end


function x304003_SetDayCount(varMap, varPlayer)
	local varToday = GetDayOfYear()
	local varLastday = GetPlayerGameData(varMap, varPlayer, MD_QUEST_SUCHENG1_DAY[1], MD_QUEST_SUCHENG1_DAY[2], MD_QUEST_SUCHENG1_DAY[3])
	if varLastday ~= varToday then
		SetPlayerGameData(varMap, varPlayer, MD_QUEST_SUCHENG1_DAY[1], MD_QUEST_SUCHENG1_DAY[2], MD_QUEST_SUCHENG1_DAY[3], varToday)
		SetPlayerGameData(varMap, varPlayer, MD_QUEST_SUCHENG1_DAYCOUNT[1], MD_QUEST_SUCHENG1_DAYCOUNT[2], MD_QUEST_SUCHENG1_DAYCOUNT[3], 1)
	else
		local varDaycount = GetPlayerGameData(varMap, varPlayer, MD_QUEST_SUCHENG1_DAYCOUNT[1], MD_QUEST_SUCHENG1_DAYCOUNT[2], MD_QUEST_SUCHENG1_DAYCOUNT[3])
		SetPlayerGameData(varMap, varPlayer, MD_QUEST_SUCHENG1_DAYCOUNT[1], MD_QUEST_SUCHENG1_DAYCOUNT[2], MD_QUEST_SUCHENG1_DAYCOUNT[3], varDaycount+1)
	end
end


function x304003_GetExp( varMap, varPlayer )
	local varLevel = GetLevel(varMap, varPlayer)
	local awardexp = 0
	if x304003_var_ExpTable[varLevel] > 0 then
		awardexp = floor(x304003_var_ExpTable[varLevel]/2)
	end
	return awardexp
end

function x304003_GetMissionId( varMap, varPlayer )
	local TempCountry = GetCurCountry( varMap, varPlayer )
	for i ,item in x304003_var_MissionIdList do
		if item.Country == TempCountry then
			return item.MissionId
		end
	end
end
