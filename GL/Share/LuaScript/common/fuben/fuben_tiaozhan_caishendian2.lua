
--DECLARE_QUEST_INFO_START--

x701114_var_FileId 					= 	701114                  

x701114_var_QuestIdList					=   {5213, 5234,5455,5476}

x701114_var_LevelLess					= 	65                      


x701114_var_QuestName				= 	"【个人】挑战财神殿（二）"

x701114_var_QuestTarget				= 	"target1"
x701114_var_QuestInfo				= 	"info1"
x701114_var_ContinueInfo				= 	"continue1"
x701114_var_QuestCompleted			= 	"complete1"
x701114_var_QuestHelp				=	"help1"          


--DECLARE_QUEST_INFO_STOP--


x701114_var_QuestStart				= 5200
x701114_var_QuestEnd				= 5283


x701114_var_GamePlayId				=  1065
x701114_var_KillCount = 3
x701114_var_KillType = {{varName="mosnter1", type=35512},{varName="mosnter2", type=35511},{varName="mosnter3", type=35510}}
x701114_var_ReplyNpc = 123744

function  x701114_GetQuestId(varMap, varPlayer)
	local varCountry = GetCurCountry( varMap, varPlayer )

	return x701114_var_QuestIdList[varCountry+1]
end

function  x701114_GetMyHaveQuestId( varMap, varPlayer)


	for varI=x701114_var_QuestStart, x701114_var_QuestEnd do
		if IsHaveQuestNM( varMap, varPlayer, varI ) > 0 then
			return varI
		end
	end

	return 0
end

function x701114_CheckAvaliableFuben(varMap, varPlayer)
	if x701114_GetMyHaveQuestId( varMap, varPlayer) == 0 then
		return 0;
	end

	if GetSceneType(varMap)~=1 then 
		return 0;
	end

	if GetFubenData_Param(varMap, 254 ) ~=2 then 
		return 0;
	end
	return 1
end

function x701114_ShowTips(varMap, varPlayer, varStr)
	StartTalkTask(varMap);
		TalkAppendString(varMap,varStr);
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
end

function x701114_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )


	if IsQuestHaveDone(varMap, varPlayer, varQuest) > 0 then
		return 0
	end

	local nLevel = GetLevel(varMap, varPlayer)

	if nLevel<x701114_var_LevelLess then
		return
	end
	
	if IsHaveQuestNM( varMap, varPlayer, varQuest ) == 0 then
		local  questState = GetQuestStateNM(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButtonNM(varMap, varPlayer, varTalknpc, varQuest, questState,questState);
	else
		
		local  questState = GetQuestStateNM(varMap, varPlayer, varTalknpc, varQuest)
		
		TalkAppendButtonNM(varMap, varPlayer, varTalknpc, varQuest, questState,questState);

	end
	
end


function x701114_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest, varExt )
	
	if IsHaveQuestNM( varMap, varPlayer, varQuest ) == 0 then	

		x701114_DispatchQuestInfo( varMap, varPlayer, varTalknpc, varQuest )
	
	else 
		
		if varExt == 7 then
			x701114_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,varQuest )
		
		else
			x701114_DispatchContinueInfo( varMap, varPlayer, varTalknpc,varQuest )
			
		end
	end
end



function x701114_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
	if IsHaveQuestNM( varMap, varPlayer, varQuest ) > 0 then	
		return 0
	end

	if x701114_GetMyHaveQuestId( varMap, varPlayer)>0 then
		x701114_ShowTips(varMap, varPlayer, "你有其他挑战副本任务，不能领取")
		return 0
	end

	if IsQuestHaveDone(varMap, varPlayer, varQuest) > 0 then
		return 0
	end


	if GetLevel(varMap, varPlayer) < x701114_var_LevelLess then
		StartTalkTask(varMap);
		TalkAppendString(varMap, "你等级过低，不能领取任务");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer,"你等级过低，不能领取任务",8,2)
		return 0
	end

	
	local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,varQuest  )
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
	if varRet <=0 then 
		return 0
	end

	
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
		TalkAppendString(varMap, "您接受了任务:"..x701114_var_QuestName);
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer,"您接受了任务:"..x701114_var_QuestName,8,2)

		return 1
	else
		
		StartTalkTask(varMap);
		TalkAppendString(varMap, "接受任务错误");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
	
	
	end
	
	return 0
end


function x701114_ProcQuestSubmit( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	if IsHaveQuestNM( varMap, varPlayer, varQuest ) <= 0 then
		return 0
	end


	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )

	local varIndex = GetQuestParam( varMap, varPlayer, varQuestIdx, 5 )

	if x701114_CheckSubmit( varMap, varPlayer, varQuest )>0 then
		
		local varRet = DelQuestNM( varMap, varPlayer, varQuest )

		if varRet>0 then
			QuestCom(varMap, varPlayer, varQuest)   
			local varStr = "您完成了任务:"..x701114_var_QuestName;
			x701114_ShowTips(varMap, varPlayer, varStr)
			Msg2Player(varMap,varPlayer,varStr,8,2)

			x701114_GiveReward(varMap,varPlayer)

			GamePlayScriptLog(varMap, varPlayer, x701114_var_GamePlayId)
			
		else
			x701114_ShowTips(varMap, varPlayer, "交任务失败")
		end
		
	end

	return 0
end

function x701114_CheckSubmit( varMap, varPlayer, varQuest )
	if IsHaveQuestNM( varMap, varPlayer, varQuest ) <= 0 then
		return 0
	end

	return 1;


end




function x701114_ProcQuestAbandon( varMap, varPlayer,varQuest )
	
	if IsHaveQuestNM( varMap, varPlayer, varQuest ) <= 0 then
		return 0
	end

	if x701114_GetMyHaveQuestId( varMap, varPlayer ) <= 0 then	
		return 0
	end
	
	
	
	DelQuestNM( varMap, varPlayer, varQuest )
	StartTalkTask(varMap);
		TalkAppendString(varMap, "您放弃了任务:"..x701114_var_QuestName);
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
	Msg2Player(varMap,varPlayer,"您放弃了任务:"..x701114_var_QuestName,8,2)


end

function x701114_GiveReward(varMap,varPlayer)

	local varExpBonus = x701114_GetExp( varMap, varPlayer )
	
	AddExp(varMap, varPlayer, varExpBonus)
	StartTalkTask(varMap);
		TalkAppendString(varMap, "#o获得#R经验"..varExpBonus.."点#o的奖励");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
	Msg2Player(varMap,varPlayer,"#o获得#R经验"..varExpBonus.."点#o的奖励",4,2)
end


function x701114_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID,varQuestIdx, varQuest )
	if IsHaveQuestNM( varMap, varPlayer, varQuest) == 0 then	
		return
	end
end




function x701114_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
	
end


function x701114_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
	return 0
end



function x701114_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	return 1
end




function x701114_DispatchQuestInfo( varMap, varPlayer, varTalknpc, varQuest)
	
	
	StartTalkTask(varMap)

	TalkAppendString(varMap,"#Y"..x701114_var_QuestName)
	
	
	TalkAppendString(varMap,x701114_var_QuestInfo)
	TalkAppendString(varMap," ")
	TalkAppendString(varMap,x701114_var_QuestTarget)
	TalkAppendString(varMap," ")
	TalkAppendString(varMap,x701114_var_QuestHelp)

	
	
			
	StopTalkTask()
	DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x701114_var_FileId, varQuest,0);
end





function x701114_DispatchContinueInfo( varMap, varPlayer, varTalknpc,varQuest )

	
	StartTalkTask(varMap)

	TalkAppendString(varMap,"#Y"..x701114_var_QuestName)
	
	
	TalkAppendString(varMap, x701114_var_ContinueInfo)
	TalkAppendString(varMap," ")


			
	StopTalkTask()
	DeliverTalkRequire(varMap, varPlayer, varTalknpc, x701114_var_FileId, varQuest,0);
end




function x701114_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,varQuest )
	local awardexp = x701114_GetExp( varMap, varPlayer )
	
	StartTalkTask(varMap)

	TalkAppendString(varMap,"#Y"..x701114_var_QuestName)
	
	
	TalkAppendString(varMap, x701114_var_QuestCompleted)
	TalkAppendString(varMap," ")

	AddQuestExpBonus(varMap,  awardexp);
			
	StopTalkTask()
	DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x701114_var_FileId, varQuest);

end



function x701114_ProcQuestLogRefresh( varMap, varPlayer, varQuest)

	if IsHaveQuestNM( varMap, varPlayer, varQuest ) <= 0 then
		return
	end

	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )
	
	local varStr=""
	for varI=0, x701114_var_KillCount-1 do

		
		local nValue = GetQuestParam( varMap, varPlayer, varQuestIdx, varI )

		local strTemp = "击杀@npc_123744中的#G"..x701114_var_KillType[varI+1].varName;
		
		if nValue>0 then
			strTemp = strTemp.."#G("..nValue.."/1)"
			strTemp = "#G"..strTemp
		else
			strTemp = strTemp.."#W("..nValue.."/1)"
			strTemp = "#W"..strTemp
		end

		varStr  = varStr..strTemp

		if varI<x701114_var_KillCount-1 then
			varStr = varStr.."\n"
		end
		
	end

	
	StartTalkTask(varMap)	
		

		
			
	AddQuestLogCustomText( varMap,
							"",						
							x701114_var_QuestName,        
							varStr,		
							"@npc_"..x701114_var_ReplyNpc,			
							x701114_var_QuestTarget,
							x701114_var_QuestInfo,	
							x701114_var_QuestHelp					
							)
	StopTalkTask()
	DeliverTalkRefreshQuest(varMap, varPlayer, varQuest);
		
	
end


function x701114_GetExp( varMap, varPlayer )
	local varLevel = GetLevel(varMap, varPlayer)
	local maxlevel = GetTopListInfo_MaxLevel(GetWorldID(varMap, varPlayer))
	local awardexp = 0
	if maxlevel > 0 then
			if varLevel < 75 then
				awardexp = maxlevel*108000
			elseif varLevel >=75 then
				awardexp = maxlevel*194400
		end
	end
	return awardexp
end


function x700028_ShowTipsToAll(varMap, varStr)

	local humancount = GetFuben_PlayerCount(varMap);

	
	for varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI);
		
		StartTalkTask(varMap);
			TalkAppendString(varMap,varStr);
		StopTalkTask();
		DeliverTalkTips(varMap, humanId);
	end
end




function x701114_ProcSceneBossDie(varMap, varIndex, varObj)
	
	
	if GetSceneType(varMap)~=1 then 
		return 0;
	end

	if GetFubenData_Param(varMap, 254 ) ~=2 then 
		return 0;
	end


	local humancount = GetFuben_PlayerCount(varMap);

	
	for varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI);
		
		x701114_ProcBossDie(varMap, humanId, varIndex, varObj)
	end
end

function x701114_ProcBossDie(varMap, varPlayer, varIndex, varObj)
	
	local varQuest = x701114_GetQuestId(varMap, varPlayer)
	if varIndex== nil then
		return
	end

	if varIndex<0 or varIndex>=7 then
		return
	end
	
	if x701114_CheckAvaliableFuben(varMap, varPlayer)<=0 then
		return
	end

	if IsHaveQuestNM( varMap, varPlayer, varQuest ) <= 0 then
		return
	end

	if GetFubenData_Param(varMap, 15 ) >0 then 
		return
	end

	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )
	

	SetQuestByIndex( varMap, varPlayer, varQuestIdx, varIndex, 1 )
			

	local bAllCompleted = 1
	
	
	for varI=0, x701114_var_KillCount-1 do

		if varI ~= varIndex then
			local nValue = GetQuestParam( varMap, varPlayer, varQuestIdx, varI )

			if nValue<=0 then
				bAllCompleted = 0
				break;
			end
		end
		
	end

	if bAllCompleted>0 then
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1 )
	end


	x701114_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
end
