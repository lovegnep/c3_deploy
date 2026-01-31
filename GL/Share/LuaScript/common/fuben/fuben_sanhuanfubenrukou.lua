
x700096_var_FileId = 700096
x700096_var_QuestName = "【队伍】三环副本"

x700096_var_LevelLimited = 20

x700096_var_LimitMember = 1

x700096_var_SanHuan_Fuben_Len = 7
x700096_var_SanHuan_Fuben_list = { 
							{varName="【队伍】祝家庄",		varScript = 700030, nlevel = 60},
							{varName="【队伍】财神殿",		varScript = 700003, nlevel = 50},
							{varName="【队伍】和氏璧",		varScript = 700024, nlevel = 40},
							{varName="【队伍】囚龙岛",		varScript = 700028, nlevel = 20},
							{varName="【队伍】探索战神墓",	varScript = 700084, nlevel = 35},
							{varName="【队伍】印度河",	    varScript = 700087, nlevel = 55},
							{varName="【队伍】教堂的秘密",	varScript = 700090, nlevel = 45},
							
						}

function x700096_ProcEnumEvent( varMap, varPlayer, varTalknpc, varIndex )
	
	local nLevel = GetLevel(varMap, varPlayer)
	if nLevel < x700096_var_LevelLimited then

		return
		
	end	

	TalkAppendButton(varMap,x700096_var_FileId, x700096_var_QuestName, 14, 0)
end

function x700096_ProcEventEntry( varMap , varPlayer , varTalknpc , varState , varExt )
	
	if varExt == nil then
		return
	end


	x700096_DispatchSanHuanMode(varMap , varPlayer , varTalknpc  , varExt)
	
end

function x700096_DispatchSanHuanMode(varMap , varPlayer , varTalknpc  , varExt)
	if varExt == nil then
		return
	end

	local nLevel = GetLevel(varMap, varPlayer)
	if nLevel < x700096_var_LevelLimited then
		return
	end

	
	if varExt == 0 then
		StartTalkTask(varMap)
			TalkAppendString(varMap,"\t只要你和几个志同道合的朋友一起组队，我就可以送你们进入三环副本，获得高额经验值，还有可能获得极其稀有的异形坐骑。\n\t此外，我这里还有单人三环副本（试炼）、英雄模式三环副本（高难度）和三番三环副本供你选择。")
			TalkAppendButton(varMap,x700096_var_FileId, "【队伍】普通三环副本", 14, 1)
			TalkAppendButton(varMap,x700096_var_FileId, "【队伍】三番三环副本", 14, 2)
			
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer, varTalknpc)
	else
		x700096_DispatchDetailMode(varMap , varPlayer , varTalknpc  , varExt)
	end
	
end

function x700096_DispatchDetailMode(varMap , varPlayer , varTalknpc  , varExt)

	if varExt == nil then
		return
	end

	StartTalkTask(varMap)
		
		if varExt ==1 then
			TalkAppendString(varMap,"#Y"..x700096_var_QuestName.."普通模式")
		elseif varExt ==2 then
			TalkAppendString(varMap,"#Y"..x700096_var_QuestName.."三番模式")
		elseif varExt ==3 then
			TalkAppendString(varMap,"#Y"..x700096_var_QuestName.."周三番模式")
		else
			return
		end
		
		TalkAppendString(varMap,"\n\t每周一共可以进行21次普通三环副本。使用三番令进入三环副本，消耗3次本周的三环副本次数，同时获得3次普通副本的奖励。若本周剩余三环副本次数不足3次，则不可使用三番令。")

		if varExt ==1 then
			TalkAppendString(varMap,"\n#Y开放时间：#W全天开放！\n#Y友情提示：#W3人以上的队伍，才能进入该副本！\n#Y副本说明：#W在这个副本中，你可以获得大量经验奖励！")
		elseif varExt ==2 then
			TalkAppendString(varMap,"\n#Y开放时间：#W全天开放！\n#Y友情提示：#W3人以上的队伍，才能进入该副本！\n#Y副本说明：#W在这个副本中，你可以获得普通三番副本3倍的经验奖励！")
		elseif varExt ==3 then
			TalkAppendString(varMap,"副本说明："..x700096_var_QuestName.."周三番模式")
		else
			return
		end

		x700096_SaveSanhuanFubenTalkMode(varMap, varPlayer, varExt)


	StopTalkTask()

	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x700096_var_FileId, -1);
end




function x700096_ProcAcceptCheck( varMap, varPlayer, varTalknpc )

	local nLevel = GetLevel(varMap, varPlayer)
	if nLevel < x700096_var_LevelLimited then
		return 0
	end

    return 1
end




function x700096_ProcAccept( varMap, varPlayer )
	if x700096_CheckCommonTeamCondition(varMap, varPlayer)<=0 then
		return
	end

	local varMode = x700096_GetSanhuanFubenTalkMode(varMap, varPlayer)

	if varMode<=0 or varMode>3 then
		return
	end

	local nRandom = x700096_GetRandom(varMap, varPlayer)

	if nRandom<=0 then
		return
	end

	local varScriptFileId = x700096_var_SanHuan_Fuben_list[7].varScript 
	
	varMode = varMode -1
	LuaCallNoclosure(FUBEN_COMMON_SCRIPT, "ProcRequestEnterFuben", varMap, varPlayer, varMode, 0, varScriptFileId, 0);
	
	
	local varMsg = format("x700096_ProcAccept 三环, varMap = %d, varName = %s, varMode = %d, varScriptFileId = %d", varMap,GetName(varMap, varPlayer), varMode,varScriptFileId);

	WriteLog(1,varMsg)



end

function x700096_GetRandom(varMap, varPlayer)
	local nLevel = x700096_GetTeamMinLevel(varMap, varPlayer)
	
	local randomlist = {}
	local varCount = 0
	local varIndex = 0
	for varI, item in x700096_var_SanHuan_Fuben_list do
		varIndex = varIndex + 1
		if nLevel>=item.nlevel then
			varCount = varCount +1
			randomlist[varCount] = varIndex
		end
	end

	if varCount ==0 then
		return 0
	end

	return randomlist[random(1,varCount)]
end

function x700096_GetTeamMinLevel(varMap, varPlayer)

	if IsTeamLeader(varMap, varPlayer) <= 0 then
		local nLevel = GetLevel(varMap, varPlayer)
		return nLevel
	end

	local teamid = GetTeamId(varMap, varPlayer);
	local teamnum = GetTeamSize(varMap, varPlayer);
	local nearteamnum = GetNearTeamCount(varMap, varPlayer);
	
	local nMinLevel = 200
	for varI = 0, teamnum - 1 do
		local memberId = GetNearTeamMember(varMap, varPlayer, varI);
		
		local nLevel = GetLevel(varMap, memberId)

		if nLevel<nMinLevel then
			nMinLevel = nLevel
		end
	end

	return nMinLevel
end

function x700096_CheckCommonTeamCondition(varMap, varPlayer)
	local teamid = GetTeamId(varMap, varPlayer);
	local teamnum = GetTeamSize(varMap, varPlayer);
	local nearteamnum = GetNearTeamCount(varMap, varPlayer);

	local varStr = "";
	local bPassed = 1;

	if IsTeamLeader(varMap, varPlayer) <= 0 then
		varStr	= "你不是队长！"
		bPassed = 0
	elseif x700081_CheckAllMemberNear( varMap,varPlayer) <= 0 then
		varStr	= "需要所有的队友在附近！"
		bPassed = 0
	elseif teamid < 0 then
		varStr	= "你不在队伍中！"
		bPassed = 0
	elseif teamnum < x700096_var_LimitMember then
		varStr	= format("你的队伍不足%d人！", x700096_var_LimitMember)
		bPassed = 0
	elseif nearteamnum < x700096_var_LimitMember then
		varStr	= format("附近队友不足%d人！", x700096_var_LimitMember)
		bPassed = 0
	else

		for varI = 0, teamnum - 1 do
			local memberId = GetNearTeamMember(varMap, varPlayer, varI);
			
			local nLevel = GetLevel(varMap, memberId)

			if nLevel<x700096_var_LevelLimited then
				local strName = GetName(varMap, memberId)
				varStr = format("队友%s等级低于%d级，不能进入副本！", strName,x700096_var_LevelLimited)
				bPassed = 0

				break;
			end
		end
		

	end

	if bPassed == 1 then
		return 1;
	else
		if varStr ~= "" then
			StartTalkTask(varMap);
				TalkAppendString(varMap, varStr);
			StopTalkTask();
			DeliverTalkTips(varMap, varPlayer);
			return 0;
		end
	end


	return 1;
end


function x700096_SaveSanhuanFubenTalkMode(varMap, varPlayer, nValue)
	SetPlayerGameData(varMap, varPlayer, MD_SANHUAN_FUBEN_TALK_MODE[1], MD_SANHUAN_FUBEN_TALK_MODE[2], MD_SANHUAN_FUBEN_TALK_MODE[3], nValue)
end

function x700096_GetSanhuanFubenTalkMode(varMap, varPlayer)
	return GetPlayerGameData(varMap, varPlayer, MD_SANHUAN_FUBEN_TALK_MODE[1], MD_SANHUAN_FUBEN_TALK_MODE[2], MD_SANHUAN_FUBEN_TALK_MODE[3])
end


