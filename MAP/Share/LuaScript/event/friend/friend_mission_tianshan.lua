
--DECLARE_QUEST_INFO_START--

x300722_var_FileId = 300722                 
x300722_var_LevelLess					= 	30

--DECLARE_QUEST_INFO_STOP--



x300722_var_QuestId = 1201

x300722_var_SubQuest = {
[0] = 6547,
[1] = 6522,
[2] = 6523,
[3] = 6524,
[4] = 6525,
[5] = 6526,
[6] = 6527,
[7] = 6527,
[8] = 6527,
}

x300722_var_addFriendPoint = 150
x300722_var_QuestName ="【好友】意气相投"
x300722_var_ParamIndexBegin = 2
x300722_var_ParamIndexEnd = 6
function x300722_CalcQuestEXP(varMap, varPlayer)
	
	local haveSubQuestId = x300722_HaveWhichSubQuest(varMap, varPlayer)
	if haveSubQuestId <= 0 then
		return 0
	end
	
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, haveSubQuestId )
	
	local totalFriendpoint = 0
	for varI=x300722_var_ParamIndexBegin, x300722_var_ParamIndexEnd do
			local guid = GetQuestParam( varMap, varPlayer, varQuestIdx, varI )
			guid = tonumber(format("%u",guid))
			if guid > 0 and GetFriendName(varMap, varPlayer, guid) ~= "" then
				local point = GetFriendPointByGuid(varMap, varPlayer, guid)
				totalFriendpoint = totalFriendpoint + point
			end
	end
	totalFriendpoint = floor(totalFriendpoint / 5)
	local varLevel = GetLevel(varMap, varPlayer)
	local varExp = 0
	if totalFriendpoint >= 0 and totalFriendpoint <= 500 then
		varExp = varLevel*2800
	elseif totalFriendpoint >= 501 and totalFriendpoint <= 2000 then
		varExp = varLevel*3200
	elseif totalFriendpoint >= 2001 and totalFriendpoint <= 5000 then
		varExp = varLevel*3600
	elseif totalFriendpoint >= 5001 and totalFriendpoint <= 10000 then
		varExp = varLevel*4000
	elseif totalFriendpoint >= 10001 and totalFriendpoint <= 17000 then
		varExp = varLevel*4400
	elseif totalFriendpoint >= 17001 and totalFriendpoint <= 27000 then
		varExp = varLevel*4800
	elseif totalFriendpoint >= 27001 and totalFriendpoint <= 40000 then
		varExp = varLevel*5200
	elseif totalFriendpoint >= 40001 and totalFriendpoint <= 58000 then
		varExp = varLevel*5600
	elseif totalFriendpoint >= 58001 and totalFriendpoint <= 80000 then
		varExp = varLevel*6000
	elseif totalFriendpoint >= 80001 and totalFriendpoint <= 99999 then
		varExp = varLevel*6400
	end
	return varExp
end

function x300722_SetCompleteTimes(varMap, varPlayer, times)
	SetPlayerGameData(varMap, varPlayer, MD_FRIEND_MISSION_COMPLETE_TIMES[1], MD_FRIEND_MISSION_COMPLETE_TIMES[2], MD_FRIEND_MISSION_COMPLETE_TIMES[3], times)
end

function x300722_SetCompleteDay(varMap, varPlayer)
		SetPlayerGameData(varMap, varPlayer, MD_FRIEND_MISSION_COMPLETE_DATE[1], MD_FRIEND_MISSION_COMPLETE_DATE[2], MD_FRIEND_MISSION_COMPLETE_DATE[3], GetDayOfYear())
		x300722_SetCompleteTimes(varMap, varPlayer, 1)
end

function x300722_GetCompleteDay(varMap, varPlayer)
		return GetPlayerGameData(varMap, varPlayer, MD_FRIEND_MISSION_COMPLETE_DATE[1], MD_FRIEND_MISSION_COMPLETE_DATE[2], MD_FRIEND_MISSION_COMPLETE_DATE[3] )
end

function x300722_SetKillMonsterNum(varMap, varPlayer, varNum)
		SetPlayerGameData(varMap, varPlayer, MD_FRIEND_MISSION_KILLMONSTER_NUM[1], MD_FRIEND_MISSION_KILLMONSTER_NUM[2], MD_FRIEND_MISSION_KILLMONSTER_NUM[3], varNum)
		x300722_KillMonsterRefresh(varMap, varPlayer)
end

function x300722_GetKillMonsterNum(varMap, varPlayer)
	return GetPlayerGameData(varMap, varPlayer, MD_FRIEND_MISSION_KILLMONSTER_NUM[1], MD_FRIEND_MISSION_KILLMONSTER_NUM[2],MD_FRIEND_MISSION_KILLMONSTER_NUM[3] )
end

function x300722_AddKillMonsterNum(varMap, varPlayer, varNum)
	varNum = varNum + x300722_GetKillMonsterNum(varMap, varPlayer)
	x300722_SetKillMonsterNum(varMap, varPlayer, varNum)
end
	
function x300722_GetSubQuestId(humanLevel)
	local questLevel = 0
	if  40  <= humanLevel and  humanLevel <= 50 then
		questLevel = 1
	elseif 50 < humanLevel and  humanLevel <= 60 then
		questLevel = 2
	elseif 60 < humanLevel and  humanLevel <= 70 then
		questLevel = 3
	elseif 70 < humanLevel and  humanLevel <= 80 then
		questLevel = 4
	elseif 80 < humanLevel and  humanLevel <= 90 then
		questLevel = 5
	elseif 90 < humanLevel and  humanLevel <= 100 then
		questLevel = 6
	elseif 100 < humanLevel and  humanLevel <= 110 then
		questLevel = 7
	elseif 110 < humanLevel then
		questLevel = 8
	end
	
	return x300722_var_SubQuest[questLevel]
end

function x300722_DeleteAllSubQuest( varMap, varPlayer )
	for varI, quest in x300722_var_SubQuest do
		DelQuestNM( varMap, varPlayer, quest )
	end
end

function x300722_IsSubQuest( varMap, varPlayer, varQuest )
	for varI, quest in x300722_var_SubQuest do
		if tonumber(varQuest) == tonumber(quest) then
			return 1
		end
	end
	return -1
end

function x300722_HaveWhichSubQuest(varMap, varPlayer)
	for varI, quest in x300722_var_SubQuest do
		if IsHaveQuestNM( varMap, varPlayer, quest ) == 1 then
			return quest
		end
	end
	return -1
end

function x300722_IsHaveSubQuest(varMap, varPlayer)
	for varI, quest in x300722_var_SubQuest do
		if IsHaveQuestNM( varMap, varPlayer, quest ) == 1 then
			return 1
		end
	end
	return -1
end

function x300722_HaveDoneWhichSubQuest(varMap, varPlayer, varTalknpc)

	for varI, quest in x300722_var_SubQuest do
		local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, quest )
		if GetQuestParam( varMap, varPlayer, varQuestIdx, 7 ) == 1 then
			return quest
		end
		if IsHaveQuestNM( varMap, varPlayer, quest ) == 1 and QuestCheckSubmitNM( varMap, varPlayer, varTalknpc, quest, varQuestIdx ) > 0 then
			return quest
		end 
	end
	return -1
end







function x300722_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest, varIndex )
	local haveSubQuestId = x300722_HaveWhichSubQuest(varMap, varPlayer)
	local haveDoneQuestId = -1
	if haveSubQuestId > 0 then
		haveDoneQuestId = x300722_HaveDoneWhichSubQuest(varMap, varPlayer, varTalknpc)
	end
	
	local varExp = x300722_CalcQuestEXP(varMap, varPlayer)
	
	if haveDoneQuestId > 0 then
		StartTalkTask(varMap)
		
		TalkAppendString(varMap,"#Y【好友】意气相投")
		TalkAppendString(varMap,"\t恭喜您，完成了意气相投！#r")

		TalkAppendString(varMap,"#Y任务奖励：")
		TalkAppendString(varMap, "\t好友度:"..x300722_var_addFriendPoint.."点")
		TalkAppendString(varMap, "\t经验值:"..varExp.."点")
		StopTalkTask()
	  DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x300722_var_FileId, varQuest);
	  return
	end
	
	if haveSubQuestId > 0 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y【好友】意气相投")
		TalkAppendString(varMap,"\t您还没有杀死200只怪，赶快去完成吧！#r")
		TalkAppendString(varMap,"#Y任务奖励：")
		TalkAppendString(varMap, "\t好友度:"..x300722_var_addFriendPoint.."点")
		TalkAppendString(varMap, "\t经验值:"..varExp.."点")
		StopTalkTask()
		DeliverTalkRequire(varMap, varPlayer, varTalknpc, x300722_var_FileId, varQuest,0);
		return
	end
	
	StartTalkTask(varMap)
	TalkAppendString(varMap,"#Y【好友】意气相投")
	
	
	
	TalkAppendString(varMap,"\t在这个世界上有很多意气相投的人愿意结为好友，为了让大家能够更快地相互了解，更快地增加好友度，您可以组队来我这里领取意气相投任务。即使队伍中有陌生人，只要接了意气相投任务就会把你们自动加为好友。\n\t顺利的完成任务，将会增加组队好友之间的好友度。如果组队的好友越多，好友度越高，获得的经验也越多。")
	
	TalkAppendString(varMap,"#Y任务目标：")
	TalkAppendString(varMap,"\t顺利领取任务，杀死200只相应的指定怪！#r")
	
	TalkAppendString(varMap,"#Y任务奖励：")
	TalkAppendString(varMap, "\t好友度:"..x300722_var_addFriendPoint.."点")
	TalkAppendString(varMap, "\t经验值:好友度越高，经验值越高。")
	
	StopTalkTask()

	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x300722_var_QuestId, -1)

end









function x300722_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	if GetLevel(varMap, varPlayer) < 30 then
		return
	end
	local haveSubQuestId = x300722_HaveWhichSubQuest(varMap, varPlayer)
	local haveDoneQuestId = -1
	local varState = 8
	if haveSubQuestId > 0 then
		haveDoneQuestId = x300722_HaveDoneWhichSubQuest(varMap, varPlayer, varTalknpc)
	end
	
	if haveDoneQuestId > 0 then
		varState = 7
	
	elseif haveSubQuestId > 0 then
		varState = 6
	end
	TalkAppendButton(varMap, x300722_var_QuestId, x300722_var_QuestName, varState, -1)
	
end









function x300722_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

	
		return 1
	
end








function x300722_CheckPushList(varMap, varPlayer, varTalknpc)
	return 1
end

function x300722_DoAccept( varMap, varPlayer )
	
	local week = GetWeek()
	if week ~= 1 and week ~= 3 then
		return "只有周一、周三才能领取本任务。"
	end
	
	local bLeader = IsTeamLeader( varMap, varPlayer )
	if bLeader ~= 1 then
		return "你不是队长，只有队长才能领取本任务。"
	end
	
	local varTeamSize = GetTeamSize(varMap, varPlayer)
	if (varTeamSize < 2) then
		return "你的队伍中不足2人，无法接取本任务。";
	end
	
	local nearTeamSize = GetNearTeamCount(varMap, varPlayer)
	if varTeamSize ~= nearTeamSize then
		return "很抱歉，所有队员必须都在附近，否则无法接此任务。"
	end
	
	for varI = 0, varTeamSize - 1 do
		local varTalknpc = GetNearTeamMember(varMap, varPlayer, varI)
		if IsInDist(varMap, varPlayer, varTalknpc, 10) ~= 1 then
			return "很抱歉，所有队员必须都在附近，否则无法接此任务。"
		end
	end
	
	for varI = 0, varTeamSize - 1 do
		local varTalknpc = GetNearTeamMember(varMap, varPlayer, varI)
		local targetLevel = GetLevel(varMap, varTalknpc)
		if targetLevel < 30 then
			return "你的队伍中有人不足30级，无法领取本任务。"
		end
	end
	
	local varToday = GetDayOfYear()
	local completeDay = x300722_GetCompleteDay(varMap, varPlayer)
	if( completeDay == varToday) then
		return "你已经领取了本任务，今天无法接取本任务了。"
	end
	
	for varI = 0, varTeamSize - 1 do
		local varTalknpc = GetNearTeamMember(varMap, varPlayer, varI)
		local completeDay = x300722_GetCompleteDay(varMap, varTalknpc)
		if( completeDay == varToday) then
			return "你队伍中有人领取了本任务，今天无法接取本任务。"
		end
	end
	
	local curLevel = 200
	for varI = 0, varTeamSize - 1 do
		local varTalknpc = GetNearTeamMember(varMap, varPlayer, varI)
		local targetLevel = GetLevel(varMap, varTalknpc)
		if targetLevel <= curLevel then
			curLevel = targetLevel
		end
	end
	local averageLevel = curLevel 
	local varQuest = x300722_GetSubQuestId(averageLevel)
	
	local varHaveQuest = x300722_IsHaveSubQuest(varMap, varPlayer)
	if varHaveQuest == 1 then
		return "你已经接取了本任务，快去完成吧。"
	end
	
	for varI = 0, varTeamSize - 1 do
		local varTalknpc = GetNearTeamMember(varMap, varPlayer, varI)
		local varHaveQuest = x300722_IsHaveSubQuest(varMap, varTalknpc)
		if varHaveQuest == 1 then
			return "你队伍中有人有本任务，无法接取本任务。"
		end
	end
	
	for varI = 0, varTeamSize - 1 do
		local varTalknpc = GetNearTeamMember(varMap, varPlayer, varI)
		if IsQuestFullNM(varMap, varTalknpc) == 1 then
			return "很抱歉，您队伍中有人任务已经满了，无法领取本任务。"
		end
	end
	
	for varI = 0, varTeamSize - 1 do
	
		local aId = GetNearTeamMember(varMap, varPlayer, varI)
		local aName = GetName(varMap, aId)
		
		local varStr = format("您领取了任务:%s", x300722_var_QuestName)
		Msg2Player(varMap,aId,varStr,8,2)
		StartTalkTask(varMap);
		TalkAppendString(varMap, varStr);
		StopTalkTask();
		DeliverTalkTips(varMap, aId);
		
		for j = varI + 1, varTeamSize - 1 do
			local bId = GetNearTeamMember(varMap, varPlayer, j)
			local bName = GetName(varMap, bId)
			if IsFriend(varMap, aId, bId) ~= 1 then
				AddFriend(varMap, aId, bName, 0)
			else
				local point = GetFriendPoint(varMap, aId, bId)
				
			end
			if IsFriend(varMap, bId, aId) ~= 1 then
				AddFriend(varMap, bId, aName, 0)
			else
				local point = GetFriendPoint(varMap, bId, aId)
				
			end
			
			
			
			
			
			
			
			
			
			
		end
		
		local errorCode = AddQuestNM( varMap, aId, varQuest )
		if errorCode ~= 1 then
			Msg2Player(varMap,aId,"添加任务失败！",8,2)
		end
		QuestCom(varMap,aId,x300722_var_QuestId)
		x300722_SetCompleteDay(varMap, aId, varToday)
		x300722_SetKillMonsterNum(varMap, aId, 0)
		
	end
	
	for varI = 0, varTeamSize - 1 do
		local aId = GetNearTeamMember(varMap, varPlayer, varI)
		local varQuestIdx = GetQuestIndexByID( varMap, aId, varQuest )
		local aName = GetName(varMap,aId)
		
		local varMsg = "FriendLog:accept Name="..aName.." GUID="..GetGUID(varMap,aId).." varQuest="..varQuest.." =>"
		local paramIndex = x300722_var_ParamIndexBegin
		for j = 0, varTeamSize - 1 do
			local bId = GetNearTeamMember(varMap, varPlayer, j)
			if bId ~= aId then
				SetQuestByIndex( varMap, aId, varQuestIdx, paramIndex, GetGUID(varMap, bId) )
				
				paramIndex = paramIndex + 1
				
				varMsg = varMsg.." ["..(paramIndex-1).."]GUID="..GetGUID(varMap,bId).." Name="..GetName(varMap,bId)
			end
		end
		
		WriteLog(1,varMsg)
	end
	
	
	
	return nil
end






function x300722_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
	local varStr = x300722_DoAccept( varMap, varPlayer )
	if varStr ~= nil then
		Msg2Player(varMap,varPlayer,varStr,8,2)
		StartTalkTask(varMap);
		TalkAppendString(varMap, varStr);
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
	end
	
end









function x300722_ProcQuestAbandon(varMap, varPlayer, varQuest)

	x300722_DeleteAllSubQuest( varMap, varPlayer )
	QuestUnCom(varMap,varPlayer,x300722_var_QuestId)
	local varToday = GetDayOfYear()
	x300722_SetCompleteDay(varMap, varPlayer, varToday)
	
	local varQuestName = GetQuestNameNM( varMap, varPlayer, varQuest )
	local message = format("您放弃了任务:%s", varQuestName);
	StartTalkTask(varMap);
		TalkAppendString(varMap, message);
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
	Msg2Player(varMap, varPlayer, message, 4, 2);
end









function x300722_CheckSubmit( varMap, varPlayer, varQuest )
	local haveSubQuestId = x300722_HaveWhichSubQuest(varMap, varPlayer)
	local haveDoneQuestId = -1
	if haveSubQuestId > 0 then
		haveDoneQuestId = x300722_HaveDoneWhichSubQuest(varMap, varPlayer, 1)
	end
	
	if haveDoneQuestId > 0 then
		return 1;
	end
	return 0
end








function x300722_ProcQuestSubmit( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )

	local haveSubQuestId = x300722_HaveWhichSubQuest(varMap, varPlayer)
	local haveDoneQuestId = -1
	if haveSubQuestId > 0 then
		haveDoneQuestId = x300722_HaveDoneWhichSubQuest(varMap, varPlayer, 1)
	end
	
	if haveDoneQuestId == nil or haveDoneQuestId < 0 then
        return 0
    end
    
  if IsHaveQuestNM( varMap,varPlayer,haveDoneQuestId )<= 0 then
      return 0
  end
  
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, haveDoneQuestId )
		
	local varExp = x300722_CalcQuestEXP(varMap, varPlayer)	
	local strTable = {}
	local guidTable = {}
	
	
	local szName =GetName(varMap,varPlayer)
	if szName == nil then szName = "Error" end
	local szLogMsg = "FriendLog:submit Name="..GetName(varMap,varPlayer).." GUID="..GetGUID(varMap,varPlayer).." varQuest="..haveDoneQuestId.." => "
	for varI=x300722_var_ParamIndexBegin, x300722_var_ParamIndexEnd do
			local guid = NumberCastIntToUInt( GetQuestParam( varMap, varPlayer, varQuestIdx, varI ) )
			if guid > 0 and GetFriendName(varMap, varPlayer, guid) ~= "" then
				local varStr = format("你与%s增加了%d点好友度", GetFriendName(varMap, varPlayer, guid), x300722_var_addFriendPoint)
				strTable[varI] = varStr
				guidTable[varI] = guid
				szLogMsg = szLogMsg.."["..varI.."]GUID="..guid.." Name="..GetFriendName(varMap, varPlayer, guid).." "
			else
				szLogMsg = szLogMsg.."["..varI.."]GUID="..guid.." "
			end
	end
	
	
	WriteLog(1,szLogMsg)
		
	local varRet = QuestComplateNM( varMap, varPlayer, varTalknpc, haveDoneQuestId, varButtonClick ) 
	if varRet > 0 then 
		
		StartTalkTask(varMap);
		TalkAppendString(varMap, "您完成了任务:【好友】意气相投");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		DeliverTalkTips(varMap, varPlayer);
		local varMsg = "\n获得#R经验"..varExp.."点#cEFC800的奖励"
		Msg2Player(varMap,varPlayer,"您完成了任务：【好友】意气相投！"..varMsg,8,2)
		
		AddExp(varMap, varPlayer, varExp);
		
		for varI=x300722_var_ParamIndexBegin, x300722_var_ParamIndexEnd do
			if nil ~= guidTable[varI] then
				local guid = guidTable[varI]
				local point = GetFriendPointByGuid(varMap, varPlayer, guid)
				SetFriendPointByGuid(varMap, varPlayer, guid, point + x300722_var_addFriendPoint)
			end
		end
		
		for varI=x300722_var_ParamIndexBegin, x300722_var_ParamIndexEnd do
			if nil ~= strTable[varI] then
				local varStr = strTable[varI]
				StartTalkTask(varMap);
				TalkAppendString(varMap, varStr);
				StopTalkTask();
				DeliverTalkTips(varMap, varPlayer);
				Msg2Player(varMap,varPlayer,varStr,8,2)
			end
		end
		
		DelQuestNM( varMap, varPlayer, haveDoneQuestId )
		local varToday = GetDayOfYear()
		x300722_SetCompleteDay(varMap, varPlayer, varToday)
		QuestUnCom(varMap,varPlayer,x300722_var_QuestId)
		
	end

	return 0
	
end









function x300722_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

	if x300722_IsSubQuest( varMap, varPlayer, varQuest ) < 0 then
		return -1;
	end
	
	local NeedKilledNum, InstIndex, ObjName = GetQuestNeedKillObjInfoNM( varMap, varPlayer, varQuest, varObjData, varObj )
	if NeedKilledNum > 0 then 
		local HumenNum = GetMonsterOwnerCount( varMap, varObj ) 
		for varI = 0, HumenNum-1 do
			local humanObjId = GetMonsterOwnerID( varMap, varObj, varI ) 
        	if humanObjId ~= -1 and IsPlayerStateNormal(varMap, humanObjId) > 0 and GetHp(varMap, humanObjId) > 0 and IsHaveQuestNM( varMap, humanObjId, varQuest ) > 0 then	

          		local varText = "";
         	 	local varQuestIdx = GetQuestIndexByID( varMap, humanObjId, varQuest )
          		local KilledNum = x300722_GetKillMonsterNum(varMap, humanObjId)

                if KilledNum < NeedKilledNum then

                	x300722_AddKillMonsterNum(varMap, humanObjId, 1)
                	
                  	

                  	if KilledNum == NeedKilledNum - 1 then

						StartTalkTask(varMap)

						if ObjName == "" then
						  varText = format( "已经杀死全部的怪物: %d/%d", KilledNum+1, NeedKilledNum )
						else
						  varText = format( "已经杀死全部的%s: %d/%d", ObjName, KilledNum+1, NeedKilledNum )
						end

						TalkAppendString( varMap, varText )
						StopTalkTask( varMap )
						DeliverTalkTips( varMap, humanObjId )

						SetQuestByIndex( varMap, humanObjId, varQuestIdx, 7, 1 )
						x300722_ProcQuestLogRefresh(varMap, humanObjId, -1)

                    else
                        StartTalkTask(varMap)
                        if ObjName == "" then
                            varText = format( "已经杀死怪物: %d/%d", KilledNum+1, NeedKilledNum )
                        else
                            varText = format( "已经杀死%s: %d/%d", ObjName, KilledNum+1, NeedKilledNum )
                        end
                        TalkAppendString( varMap, varText )
                        StopTalkTask( varMap )
                        DeliverTalkTips( varMap, humanObjId )
                        x300722_ProcQuestLogRefresh(varMap, humanObjId, -1)
                    end
                end
	       	end
		end
	end
end









function x300722_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
	

end

function x300722_ProcMapTimerTick(varMap, varPlayer )
	 
		
end

function x300722_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest )
	
end









function x300722_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	
end
function x300722_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )

	if IsHaveQuestNM( varMap, varPlayer, varQuest) == 0 then	
		return
	end
	
end

function x300722_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x300722_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x300722_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x300722_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x300722_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end

function x300722_KillMonsterRefresh(varMap, varPlayer)
	local subQuest = x300722_HaveWhichSubQuest(varMap, varPlayer)
  local szQuestTarget = x300722_GetQuestTarget(varMap, varPlayer)
	StartTalkTask(varMap)

	AddQuestLogCustomText( varMap,
							"",						
							x300722_var_QuestName,        
							szQuestTarget,		
							"",			
							"",               
							"",	
							""					
							)
	StopTalkTask()
	DeliverTalkRefreshQuest(varMap, varPlayer, subQuest);
end

function x300722_GetQuestHelp(varMap, varPlayer)
	local subQuest = x300722_HaveWhichSubQuest(varMap, varPlayer)
	local szQuestHelp = ""
	if tonumber(6547) == tonumber(subQuest) then
		szQuestHelp = "到王国迷宫一层消灭200只@npc_90151后向@npc_126055覆命。"
	elseif tonumber(6522) == tonumber(subQuest) then
		szQuestHelp = "到王国迷宫二层消灭200只@npc_90153后向@npc_126055覆命。"
	elseif tonumber(6523) == tonumber(subQuest) then
		szQuestHelp = "到王国迷宫三层消灭200只@npc_90155后向@npc_126055覆命。"
	elseif tonumber(6524) == tonumber(subQuest) then
		szQuestHelp = "到王国迷宫四层消灭200只@npc_90157后向@npc_126055覆命。"
	elseif tonumber(6525) == tonumber(subQuest) then
		szQuestHelp = "到王国迷宫五层消灭200只@npc_90159后向@npc_126055覆命。"
	elseif tonumber(6526) == tonumber(subQuest) then
		szQuestHelp = "到王国迷宫六层消灭200只@npc_90161后向@npc_126055覆命。"
	elseif tonumber(6527) == tonumber(subQuest) then
		szQuestHelp = "到王国迷宫七层消灭200只@npc_90163后向@npc_126055覆命。"
	elseif tonumber(6528) == tonumber(subQuest) then
		szQuestHelp = "到王国迷宫八层消灭200只@npc_14004后向@npc_126055覆命。"
	elseif tonumber(6529) == tonumber(subQuest) then
		szQuestHelp = "到王国迷宫九层消灭200只@npc_14004后向@npc_126055覆命。"
	end
	return szQuestHelp
end

function x300722_GetQuestTarget(varMap, varPlayer)
	local subQuest = x300722_HaveWhichSubQuest(varMap, varPlayer)
	local curKillMonsterNum = x300722_GetKillMonsterNum(varMap, varPlayer)
	local szMonsterNum = "(" .. curKillMonsterNum .. "/200)"
	local szQuestTarget = ""
	if tonumber(6547) == tonumber(subQuest) then
		szQuestTarget = "  除掉200只@npc_90151" .. szMonsterNum
	elseif tonumber(6522) == tonumber(subQuest) then
		szQuestTarget = "  除掉200只@npc_90153" .. szMonsterNum
	elseif tonumber(6523) == tonumber(subQuest) then
		szQuestTarget = "  除掉200只@npc_90155" .. szMonsterNum
	elseif tonumber(6524) == tonumber(subQuest) then
		szQuestTarget = "  除掉200只@npc_90157" .. szMonsterNum
	elseif tonumber(6525) == tonumber(subQuest) then
		szQuestTarget = "  除掉200只@npc_90159" .. szMonsterNum
	elseif tonumber(6526) == tonumber(subQuest) then
		szQuestTarget = "  除掉200只@npc_90161" .. szMonsterNum
	elseif tonumber(6527) == tonumber(subQuest) then
		szQuestTarget = "  除掉200只@npc_90163" .. szMonsterNum
	elseif tonumber(6528) == tonumber(subQuest) then
		szQuestTarget = "  除掉200只@npc_14004" .. szMonsterNum
	elseif tonumber(6529) == tonumber(subQuest) then
		szQuestTarget = "  除掉200只@npc_14004" .. szMonsterNum
	end
	return szQuestTarget
end

function x300722_QuestLogRefresh( varMap, varPlayer, varQuest)
	local subQuest = x300722_HaveWhichSubQuest(varMap, varPlayer)
	local szQuestDesc = "\t为了让大家更多的结识朋友，为了让大家更快的增加好友度，"
	.."您可以组队来找我领取意气相投。哪怕队中有陌生人，只要接取意气相投也会把你们自动加为好友。"
	.."完成本任务，会增加组队间好友的好友度。"
	
	local szQuestHelp = x300722_GetQuestHelp(varMap, varPlayer)
	
	local szQuestTarget = x300722_GetQuestTarget(varMap, varPlayer)
	local szQuestNPC = "@npc_126055"
	local varExp = x300722_CalcQuestEXP(varMap, varPlayer)
	StartTalkTask(varMap)
		local szQuestBonus = "\n#Y\n奖励内容：\n#W好友度:"..x300722_var_addFriendPoint.."点";
		local szQuestExp = "\n#W经验值:"..varExp.."点";
	AddQuestLogCustomText( varMap,
							"标题",						
							x300722_var_QuestName,        
							szQuestTarget,		
							szQuestNPC,			
							szQuestHelp..szQuestBonus..szQuestExp,               
							szQuestDesc,	
							""					
							)
	StopTalkTask()
	DeliverTalkRefreshQuest(varMap, varPlayer, subQuest);
end

function x300722_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
	x300722_QuestLogRefresh( varMap, varPlayer, varQuest );
end
