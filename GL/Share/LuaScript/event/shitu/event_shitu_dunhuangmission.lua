
x310304_var_FileId = 310304
x310304_var_QuestType = {
EnterPos = 1,
UseItem = 2,
KillMonster = 3
}
x310304_var_LookAtPosId = 82052
x310304_var_QuestId = {
{varId = 9525,type = x310304_var_QuestType.EnterPos},
{varId = 9526,type = x310304_var_QuestType.UseItem},
{varId = 9527,type = x310304_var_QuestType.KillMonster}
}

x310304_var_UseItemPos = {
{varId = 82053, varX = 129, z = 228},
{varId = 82054, varX = 191, z = 220},
{varId = 82055, varX = 35, z = 162}
}
x310304_var_QuestName = "【师徒】师徒齐心"
x310304_var_areaId = 3
x310304_var_MasterDistance = 15
x310304_var_QuestItem = 12030029
x310304_var_FirstQuestId = x310304_var_QuestId[1].varId
x310304_var_SecondQuestId = x310304_var_QuestId[2].varId
x310304_var_ThirdQuestId = x310304_var_QuestId[3].varId
x310304_var_LimitTimes = 1
x310304_var_Monster = {
{varLevel = 50, monster = 3230},
{varLevel = 55, monster = 3231},
{varLevel = 60, monster = 3232},
{varLevel = 65, monster = 3233},
{varLevel = 70, monster = 3234},
{varLevel = 75, monster = 3235},
{varLevel = 80, monster = 3236}
}

x310304_var_MonsterAI = 6
x310304_var_MonsterAliveTime = 10*60*1000
x310304_var_GoodBadValue = 2000
x310304_var_ExpRate = 30000
function x310304_GetMonsterId(varLevel)
	local varId = -1
	for varI, item in x310304_var_Monster do
		if varLevel >= item.varLevel then
			varId = item.monster
		end
	end
	return varId
end

function x310304_GetQuestTimes(varMap, varPlayer)
	if GetPlayerGameData(varMap, varPlayer, MD_MASTER_PRENTICE_COM_DAY[1], MD_MASTER_PRENTICE_COM_DAY[2], MD_MASTER_PRENTICE_COM_DAY[3]) ~= GetDayOfYear() then
		return 0
	else
		return GetPlayerGameData(varMap, varPlayer, MD_MASTER_PRENTICE_COM_TIMES[1], MD_MASTER_PRENTICE_COM_TIMES[2], MD_MASTER_PRENTICE_COM_TIMES[3])
	end
end

function x310304_HaveWhichQuest(varMap, varPlayer)
	for varI, item in x310304_var_QuestId do
		if IsHaveQuestNM( varMap, varPlayer, item.varId ) == 1 then
			return item.varId
		end
	end
	return -1
end

function x310304_HaveDoneWhichQuest(varMap, varPlayer)
	for varI, item in x310304_var_QuestId do
		if IsHaveQuestNM( varMap, varPlayer, item.varId ) == 1 then
			local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, item.varId )
			if GetQuestParam( varMap, varPlayer, varQuestIdx, 7 ) == 1 then
				return item.varId
			end
		end
	end
	return -1
end

function x310304_GetQuestType(varMap, varPlayer)
	for varI, item in x310304_var_QuestId do
		if IsHaveQuestNM( varMap, varPlayer, item.varId ) == 1 then
			return item.type
		end
	end
	return -1
end

function x310304_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	local varLevel = GetLevel(varMap, varPlayer)
	
	if varLevel < 20 then
		return
	end
	varQuest = x310304_var_FirstQuestId
	local varState = 8
	local haveQuestId = x310304_HaveWhichQuest(varMap, varPlayer)
	local haveDoneQuestId = x310304_HaveDoneWhichQuest(varMap, varPlayer)
	if haveQuestId > 0 then
		varState = 6
		varQuest = haveQuestId
	end
	
	if haveDoneQuestId > 0 then
		varState = 7
	end
	TalkAppendButton(varMap, varQuest, x310304_var_QuestName, varState, -1)
	
end

function x310304_GetMasterObjId(varMap, varPlayer)
	if nil ~= x310304_IsMasterHere(varMap, varPlayer) then
		return -1
	end
	local varTeamSize = GetTeamSize(varMap, varPlayer)
	local varMasterObj = -1
	for varI = 0, varTeamSize - 1 do
		local varTalknpc = GetTeamMemberId(varMap, varPlayer, varI)
		if 1 == IsInDist(varMap, varPlayer, varTalknpc, x310304_var_MasterDistance) then
			if 1 == GetObjType(varMap, varTalknpc) and 1 == IsMaster(varMap, varPlayer, varTalknpc) then
				varMasterObj = varTalknpc
			end
		end
	end
	
	return varMasterObj
	
end

function x310304_IsMasterHere(varMap, varPlayer)
	local varTeamSize = GetTeamSize(varMap, varPlayer)
	if (varTeamSize < 2) then
		return "你的队伍中不足2人，无法进行本任务。";
	end
	
	local isMasterHere = 0
	for varI = 0, varTeamSize - 1 do
		local varTalknpc = GetTeamMemberId(varMap, varPlayer, varI)
		if 1 == IsInDist(varMap, varPlayer, varTalknpc, x310304_var_MasterDistance) then
			if 1 == GetObjType(varMap, varTalknpc) and 1 == IsMaster(varMap, varPlayer, varTalknpc) then
				isMasterHere = 1
			end
		end
	end
	
	if 0 == isMasterHere then
		return "你的师傅不在队伍中或者不在附近，无法进行本任务。";
	end
	return nil
end

function x310304_IsCanSubmit( varMap, varPlayer )
	local varTeamSize = GetTeamSize(varMap, varPlayer)
	if (varTeamSize < 2) then
		return "你的队伍中不足2人，无法提交本任务。";
	end
	
	local isMasterHere = 0
	for varI = 0, varTeamSize - 1 do
		local varTalknpc = GetTeamMemberId(varMap, varPlayer, varI)
		if 1 == IsInDist(varMap, varPlayer, varTalknpc, x310304_var_MasterDistance) then
			if 1 == GetObjType(varMap, varTalknpc) and 1 == IsMaster(varMap, varPlayer, varTalknpc) then
				isMasterHere = 1
			end
		end
	end
	
	if 0 == isMasterHere then
		return "你的师傅不在队伍中或者不在附近，无法提交本任务。";
	end
	return nil
end

function x310304_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest, varIndex )
	local haveQuestId = x310304_HaveWhichQuest(varMap, varPlayer)
	local haveDoneQuestId = x310304_HaveDoneWhichQuest(varMap, varPlayer)
	if haveDoneQuestId > 0 then
		local varStr = x310304_IsCanSubmit( varMap, varPlayer )
		if varStr ~= nil then
			Msg2Player(varMap,varPlayer,varStr,8,2)
			StartTalkTask(varMap);
			TalkAppendString(varMap, varStr);
			StopTalkTask();
			DeliverTalkTips(varMap, varPlayer);
			return
		end
		StartTalkTask(varMap)
		TalkAppendString(varMap,"\t恭喜您，完成了师徒任务！")
		local varExp = x310304_CalculateExp(varMap, varPlayer)
		local szAward = "\n#Y奖励内容：\n#W经验值:"..varExp.."点"
		TalkAppendString(varMap, szAward)
		StopTalkTask()
		DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x310304_var_FileId, varQuest);
		return
	end
	if haveQuestId > 0 then
		StartTalkTask(varMap)
		if x310304_var_QuestType.EnterPos == x310304_GetQuestType(varMap, varPlayer) then
			TalkAppendString(varMap,"#y这么快就回来了？你们一定还没有侦查清楚。")
		else
			TalkAppendString(varMap,"#Y你还没有完成任务。")
		end
		StopTalkTask()
		DeliverTalkRequire(varMap, varPlayer, varTalknpc, x310304_var_FileId, varQuest,0);
	  return
	end
	StartTalkTask(varMap)
	TalkAppendString(varMap,"#Y师徒任务")
	local varStr = format("\t很高兴你们师徒两人能一起来我这里。\n\t最近王国境内有不少盗匪出没，有传言说，这些盗匪其实是受了海都大王的蛊惑才会频频作乱。\n\t为了弄清真相，你们师徒两人前去侦查一番如何？\n\t师傅获得威望奖励，徒弟获得经验奖励，师傅每带1名徒弟完成任务都会获得%s威望。徒弟每天只可接%s次任务，师傅没有任务，但师傅必须在徒弟身边，徒弟才能进行任务。", x310304_var_GoodBadValue, x310304_var_LimitTimes)
	TalkAppendString(varMap,varStr)
	TalkAppendString(varMap,"#Y任务目标：")
	local target = "\t#w到圣山东麓侦查敌军，然后使用狼烟并杀死头领。"
	TalkAppendString(varMap,target)
	TalkAppendString(varMap,"#Y任务奖励：")
	local varExp = x310304_CalculateExp(varMap, varPlayer)
	TalkAppendString(varMap,format("\t#W徒弟获得经验：徒弟等级*%s点", x310304_var_ExpRate))
	TalkAppendString(varMap,format("\t#W师傅获得威望：%s点", x310304_var_GoodBadValue))
	StopTalkTask()

	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x310304_var_FirstQuestId, -1)
end

function x310304_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
	local varStr = x310304_DoAccept( varMap, varPlayer )
	if varStr ~= nil then
		Msg2Player(varMap,varPlayer,varStr,8,2)
		StartTalkTask(varMap);
		TalkAppendString(varMap, varStr);
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		return
	end
	
	local masterObjId = x310304_GetMasterObjId(varMap, varPlayer)
	local szPrenticeName = GetName(varMap, varPlayer)
	local szMsg = format("%s接受了师徒任务，请你协助完成任务，会有威望奖励。", szPrenticeName)
	
	Msg2Player(varMap, masterObjId, szMsg, 8, 2)
	StartTalkTask(varMap);
	TalkAppendString(varMap, szMsg);
	StopTalkTask();
	DeliverTalkTips(varMap, masterObjId);
	
end

function x310304_DoAccept( varMap, varPlayer )
	
	local varLevel = GetLevel(varMap, varPlayer)
	
	if varLevel >= 50 and 0 >= IsHavePrentice(varMap, varPlayer) then
		return "你还不是师傅,收了徒弟之后再来找我吧。"
	end
	
	if 1 == IsHavePrentice(varMap, varPlayer) then
		return "请让你的徒弟来接取本任务。";
	end
	
	local varTeamSize = GetTeamSize(varMap, varPlayer)
	if (varTeamSize < 2) then
		return "你的队伍中不足2人，无法接取本任务。";
	end
	
	local isMasterHere = 0
	for varI = 0, varTeamSize - 1 do
		local varTalknpc = GetTeamMemberId(varMap, varPlayer, varI)
		if 1 == IsInDist(varMap, varPlayer, varTalknpc, x310304_var_MasterDistance) then
			if 1 == GetObjType(varMap, varTalknpc) and 1 == IsMaster(varMap, varPlayer, varTalknpc) then
				isMasterHere = 1
			end
		end
	end
	
	if 0 == isMasterHere then
		return "你的师傅不在队伍中或者不在附近，无法接取本任务。";
	end
	
	if IsQuestFullNM(varMap, varPlayer) == 1 then
		return "很抱歉，你的任务已经满了，无法领取本任务。"
	end
	
	if x310304_GetQuestTimes(varMap, varPlayer) >= x310304_var_LimitTimes then
		return format("很抱歉，本日的任务次数已经达到%s次，无法领取本任务。", x310304_var_LimitTimes)
	end
	local errorCode = AddQuestNM( varMap, varPlayer, x310304_var_FirstQuestId )
	if errorCode ~= 1 then
		return "添加任务失败！"
	end
	
	if GetPlayerGameData(varMap, varPlayer, MD_MASTER_PRENTICE_COM_DAY[1], MD_MASTER_PRENTICE_COM_DAY[2], MD_MASTER_PRENTICE_COM_DAY[3]) ~= GetDayOfYear() then
		SetPlayerGameData(varMap, varPlayer, MD_MASTER_PRENTICE_COM_DAY[1], MD_MASTER_PRENTICE_COM_DAY[2], MD_MASTER_PRENTICE_COM_DAY[3], GetDayOfYear())
		SetPlayerGameData(varMap, varPlayer, MD_MASTER_PRENTICE_COM_TIMES[1], MD_MASTER_PRENTICE_COM_TIMES[2], MD_MASTER_PRENTICE_COM_TIMES[3], 1)
	else
		local times = GetPlayerGameData(varMap, varPlayer, MD_MASTER_PRENTICE_COM_TIMES[1], MD_MASTER_PRENTICE_COM_TIMES[2], MD_MASTER_PRENTICE_COM_TIMES[3])
		times = times + 1
		SetPlayerGameData(varMap, varPlayer, MD_MASTER_PRENTICE_COM_TIMES[1], MD_MASTER_PRENTICE_COM_TIMES[2], MD_MASTER_PRENTICE_COM_TIMES[3], times)
	end
	
	GamePlayScriptLog(varMap, varPlayer, 1291)
	return nil
end

function x310304_CalculateExp(varMap, varPlayer)
	local varLevel = GetLevel(varMap, varPlayer)
	local varExp = varLevel * x310304_var_ExpRate
	return varExp
end

function x310304_ProcQuestSubmit( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	local haveQuestId = x310304_HaveWhichQuest(varMap, varPlayer)
	local questType = x310304_GetQuestType(varMap, varPlayer)
	if questType < 0 then
		return
	end
	
	local varStr = x310304_IsCanSubmit( varMap, varPlayer )
	if varStr ~= nil then
		Msg2Player(varMap,varPlayer,varStr,8,2)
		StartTalkTask(varMap);
		TalkAppendString(varMap, varStr);
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		return
	end
	
	if x310304_var_QuestType.KillMonster == questType then
		
		if GetPlayerGameData(varMap, varPlayer, MD_MASTER_PRENTICE_COM_DAY[1], MD_MASTER_PRENTICE_COM_DAY[2], MD_MASTER_PRENTICE_COM_DAY[3]) ~= GetDayOfYear() then
			SetPlayerGameData(varMap, varPlayer, MD_MASTER_PRENTICE_COM_DAY[1], MD_MASTER_PRENTICE_COM_DAY[2], MD_MASTER_PRENTICE_COM_DAY[3], GetDayOfYear())
			SetPlayerGameData(varMap, varPlayer, MD_MASTER_PRENTICE_COM_TIMES[1], MD_MASTER_PRENTICE_COM_TIMES[2], MD_MASTER_PRENTICE_COM_TIMES[3], 1)
		end
		
		DelQuestNM( varMap, varPlayer, haveQuestId )
		
		local masterObjId = x310304_GetMasterObjId(varMap, varPlayer)
		local value = GetPlayerGoodBadValue(varMap, masterObjId)
		value = value + x310304_var_GoodBadValue
		SetPlayerGoodBadValue(varMap, masterObjId, value)
		local varStr = format("你的徒弟已完成任务你获得%d点威望。", x310304_var_GoodBadValue)
		Msg2Player(varMap,masterObjId,varStr,8,2)
		StartTalkTask(varMap);
		TalkAppendString(varMap, varStr);
		StopTalkTask();
		DeliverTalkTips(varMap, masterObjId);
		
		local varExp = x310304_CalculateExp(varMap, varPlayer)
		AddExp(varMap, varPlayer, varExp);
		varStr = format("你已完成任务你获得%d点经验的奖励。", varExp)
		Msg2Player(varMap,varPlayer,varStr,8,2)
		StartTalkTask(varMap);
		TalkAppendString(varMap, varStr);
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		GamePlayScriptLog(varMap, varPlayer, 1292)
	else
		DelQuestNM( varMap, varPlayer, haveQuestId )
		AddQuestNM( varMap, varPlayer, x310304_var_SecondQuestId )
		local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x310304_var_SecondQuestId )
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 0 )
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 6, random(1,3) )
	end
end

function x310304_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )

	if IsHaveQuestNM( varMap, varPlayer, varQuest) == 0 then	
		return
	end
	
end

function x310304_ProcAreaEntered( varMap, varPlayer, areaId, varQuest )
	if areaId ~= x310304_var_areaId then
		return
	end
	local varQuestIdx
	local questType = x310304_GetQuestType(varMap, varPlayer)
	local varQuest = x310304_HaveWhichQuest(varMap, varPlayer)
	if questType == x310304_var_QuestType.EnterPos then
		varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )
		if 1 == GetQuestParam( varMap, varPlayer, varQuestIdx, 7 ) then
			return
		end
		
		local varRet = x310304_IsMasterHere(varMap, varPlayer)
		if nil ~= varRet then
			Msg2Player(varMap,varPlayer,varRet,8,2)
			StartTalkTask(varMap);
			TalkAppendString(varMap, varRet);
			StopTalkTask();
			DeliverTalkTips(varMap, varPlayer);
			return
		end
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 1 )
	else
		return
	end
	
	if varQuest > 0 and 1 ~= GetQuestParam( varMap, varPlayer, varQuestIdx, 7 ) then
		
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1 )
		local varStr = "#Y侦查完毕，可以提交任务了。"
		Msg2Player(varMap,varPlayer,varStr,8,2)
		StartTalkTask(varMap);
		TalkAppendString(varMap, varStr);
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
	end
end

function x310304_ProcMapTimerTick( varMap, varPlayer )

end


function x310304_ProcAreaLeaved( varMap, varPlayer, varScript, varQuest )

end

function x310304_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest, nChangeType)
	if varQuest == nil or varQuest < 0 then
      return
  end
  
  if IsHaveQuestNM(varMap,varPlayer,varQuest) <= 0 then
      return
  end
  
  if varItemData ~= x310304_var_QuestItem then
  	return
  end
  
  local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )
  if 1 == nChangeType then 
  	if x310304_var_QuestType.UseItem == GetQuestParam( varMap, varPlayer, varQuestIdx, 6 ) then
			SetQuestByIndex( varMap, varPlayer, varQuestIdx, 6, GetQuestParam( varMap, varPlayer, varQuestIdx, 6 ) - 1 )
		end
  else
		if x310304_var_QuestType.BuyItem == GetQuestParam( varMap, varPlayer, varQuestIdx, 6 ) then
			SetQuestByIndex( varMap, varPlayer, varQuestIdx, 6, GetQuestParam( varMap, varPlayer, varQuestIdx, 6 ) + 1 )
		end
	end
	
end

function x310304_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	local haveQuestId = x310304_HaveWhichQuest(varMap, varPlayer)
	local questType = x310304_GetQuestType(varMap, varPlayer)
	
	if haveQuestId <= 0 then
		return
	end
	
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, haveQuestId )
	
	if x310304_var_QuestType.UseItem ~= questType and x310304_var_QuestType.KillMonster ~= questType then
		return
	end
	
	if x310304_var_QuestType.KillMonster == questType and GetQuestParam( varMap, varPlayer, varQuestIdx, 7 ) == 1 then
		return
	end
	
	local scene = 50
	local varCountry = GetCurCountry(varMap,varPlayer)
	if 100*varCountry+scene ~= varMap then 
		return 0
	end
	local posIndex = GetQuestParam( varMap, varPlayer, varQuestIdx, 6 )
	local posx = x310304_var_UseItemPos[posIndex].varX
	local posz = x310304_var_UseItemPos[posIndex].z
	local radii = 10
	
	local PlayerPosX,PlayerPosZ = GetWorldPos( varMap, varPlayer )
	
	if posx > 0 then 
		local distanceRet = radii * radii - (posx - PlayerPosX) * (posx - PlayerPosX) - (posz - PlayerPosZ) * (posz - PlayerPosZ)
		if distanceRet <= 0 then
			local varText = format("很抱歉，这里不能使用该物品，请到@sceneid_%d(%d,%d)处使用!", varMap, posx, posz )
			StartTalkTask(varMap)
			TalkAppendString(varMap, varText)
			StopTalkTask(varMap)
			DeliverTalkTips(varMap, varPlayer)
			return 0
		end
	end
	
	local varRet = x310304_IsMasterHere(varMap, varPlayer)
	if nil ~= varRet then
			Msg2Player(varMap,varPlayer,varRet,8,2)
			StartTalkTask(varMap);
			TalkAppendString(varMap, varRet);
			StopTalkTask();
			DeliverTalkTips(varMap, varPlayer);
			return
	end

	StartTalkTask(varMap)
	TalkAppendString(varMap, "前方出现任务目标")
	StopTalkTask(varMap)
	DeliverTalkTips(varMap, varPlayer)
	
	local masterObjId = x310304_GetMasterObjId(varMap, varPlayer)
	local masterLevel = GetLevel(varMap, masterObjId)
	local monsterId = x310304_GetMonsterId(masterLevel)
	
	if monsterId > 0 then
	CreateMonster(varMap, monsterId, PlayerPosX , PlayerPosZ, x310304_var_MonsterAI, -1, -1, -1, 21, x310304_var_MonsterAliveTime);
	end
	
	if EraseItem(varMap, varPlayer, varBagIdx) ~= 1 then return 0 end

	
	if varImpact ~= -1 then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, varImpact, 0);
	end
	
	if x310304_var_QuestType.UseItem == questType then
		DelQuestNM( varMap, varPlayer, haveQuestId )
		AddQuestNM( varMap, varPlayer, x310304_var_ThirdQuestId )
		local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x310304_var_ThirdQuestId )
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 5, monsterId )
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 6, posIndex )
	elseif x310304_var_QuestType.KillMonster == questType then
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 5, monsterId )
	end
	
	return 1
end

function x310304_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
	
	local HumanNum = GetMonsterOwnerCount( varMap, varObj ) 
	for varI = 0, HumanNum-1 do
		local humanObjId = GetMonsterOwnerID( varMap, varObj, varI ) 
    if humanObjId ~= -1 then
    	local haveQuestId = x310304_HaveWhichQuest(varMap, humanObjId)
    	local questType = x310304_GetQuestType(varMap, humanObjId)
    	if IsPlayerStateNormal(varMap, humanObjId) > 0 and GetHp(varMap, humanObjId) > 0 and haveQuestId > 0 and x310304_var_QuestType.KillMonster == questType then	
					local varQuestIdx = GetQuestIndexByID( varMap, humanObjId, haveQuestId )
					if GetQuestParam( varMap, humanObjId, varQuestIdx, 5 ) == varObjData then
						local varRet = x310304_IsMasterHere(varMap, humanObjId)
						if nil ~= varRet then
							Msg2Player(varMap,humanObjId,varRet,8,2)
							StartTalkTask(varMap);
							TalkAppendString(varMap, varRet);
							StopTalkTask();
							DeliverTalkTips(varMap, humanObjId);
						else
							SetQuestByIndex( varMap, humanObjId, varQuestIdx, 0, 1 )
							SetQuestByIndex( varMap, humanObjId, varQuestIdx, 7, 1 )
						end
					end
			end
    end
  end
	
end

function x310304_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
	local szQuestTarget = ""
	local szAward = ""
	local questType = x310304_GetQuestType(varMap, varPlayer)
	local varQuest = x310304_HaveWhichQuest(varMap, varPlayer)
	if questType == x310304_var_QuestType.EnterPos then
		local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )
		local curNum = GetQuestParam( varMap, varPlayer, varQuestIdx, 0 )
		local szTarget1 = format("  到圣山东麓@npc_%s",x310304_var_LookAtPosId)
		szQuestTarget = szTarget1..":"..curNum.." / 1"
	elseif questType == x310304_var_QuestType.UseItem then
		local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )
		local curNum = 0
		local posIndex = GetQuestParam( varMap, varPlayer, varQuestIdx, 6 )
		local szTarget1 = format("  到王国#g杂货店#w购买狼烟后去指定地点使用@item_%s@npc_%s",x310304_var_QuestItem,x310304_var_UseItemPos[posIndex].varId)
		szQuestTarget = szTarget1..":"..curNum.." / 1"
	elseif questType == x310304_var_QuestType.KillMonster then
		local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )
		local curNum = GetQuestParam( varMap, varPlayer, varQuestIdx, 0 )
		local szTarget1 = format("  杀死敌军头目")
		szQuestTarget = szTarget1..":"..curNum.." / 1"
	end
	local varExp = x310304_CalculateExp(varMap, varPlayer)
	szAward = "#W\n#Y奖励内容：\n#W经验值:"..varExp.."点"
	StartTalkTask(varMap)

	AddQuestLogCustomText( varMap,
							"",						
							"",        
							szQuestTarget,		
							"",			
							szAward,               
							"",	
							""					
							)
	StopTalkTask()
	DeliverTalkRefreshQuest(varMap, varPlayer, varQuest);
end

function x310304_ProcQuestAbandon(varMap, varPlayer, varQuest)

	DelQuestNM( varMap, varPlayer, varQuest )
	
	local message = "您放弃了师徒任务"
	StartTalkTask(varMap);
		TalkAppendString(varMap, message);
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
	Msg2Player(varMap, varPlayer, message, 4, 2);
	
	if GetPlayerGameData(varMap, varPlayer, MD_MASTER_PRENTICE_COM_DAY[1], MD_MASTER_PRENTICE_COM_DAY[2], MD_MASTER_PRENTICE_COM_DAY[3]) ~= GetDayOfYear() then
		SetPlayerGameData(varMap, varPlayer, MD_MASTER_PRENTICE_COM_DAY[1], MD_MASTER_PRENTICE_COM_DAY[2], MD_MASTER_PRENTICE_COM_DAY[3], GetDayOfYear())
		SetPlayerGameData(varMap, varPlayer, MD_MASTER_PRENTICE_COM_TIMES[1], MD_MASTER_PRENTICE_COM_TIMES[2], MD_MASTER_PRENTICE_COM_TIMES[3], 1)
	end
end
