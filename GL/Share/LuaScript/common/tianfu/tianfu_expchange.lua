
x570043_var_FileId 					= 570043
x570043_var_ExpRate 					= 10000
x570043_var_MoneyRate 					= 10000
x570043_var_QuestName				= "天赋修炼"

function x570043_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	TalkAppendButton(varMap, x570043_var_FileId, x570043_var_QuestName,3,0);
end

function x570043_NeedExpAndMoney(varMap, varPlayer)
	local nLevel = GetLevel(varMap, varPlayer)
	local nExp = GetExp(varMap, varPlayer)
	
	local nInherenceExp = 0
	local nInherenceLevel = GetInherenceLevel(varMap, varPlayer)
	local nInherenceLevelUpNeedExp = GetInherenceLevelUpNeedExp(varMap, varPlayer)
	local nNeedMoney = GetInherenceLevelUpNeedMoney(varMap, varPlayer)
	local nNeedInherenceExp = nInherenceLevelUpNeedExp - nInherenceExp

	if nNeedInherenceExp <= 0 then
		return 0, 0, 0
	end
	
	local nA = nLevel - 69 - nInherenceLevel / 4
	if nA <= 0 then
		return 0, 0, 0
	else nA = 1
	end
	
	
	
	local nM = x570043_var_ExpRate / nA
	local nNeedExp = floor(nNeedInherenceExp * nM)
	
	nNeedMoney = floor(nNeedMoney)
	if nNeedMoney < 0 then
		nNeedMoney = 0
	end
	
	if nNeedExp > 0 and nNeedMoney > 0 then
		return nNeedExp, nNeedMoney, nNeedInherenceExp
	end
	
	return 0, 0, 0
end

function x570043_ProcEventEntry(varMap, varPlayer, varTalknpc)
	SetPlayerRuntimeData(varMap,varPlayer,RD_COMMON_NPCID,varTalknpc)
	local varExp , money, addInherenceExp = x570043_NeedExpAndMoney(varMap, varPlayer)
	local nInherenceLevel = GetInherenceLevel(varMap, varPlayer)
	if 0 == varExp and 0 == money then
		StartTalkTask(varMap);
		TalkAppendString(varMap, "#Y【天赋修炼】\n\t#W天赋等级增加，可以提升玩家自身控制技能的命中率，降低对方玩家控制技能的命中率，每级造成的影响为0.5%。70级以上的玩家才可以开始修炼天赋！多多修炼提升天赋等级，您才能拥有万夫不当之勇！\n\t您当前的天赋等级为#R"..nInherenceLevel.."#W级。\n\t#R以您目前的等级，已经无法再提升天赋等级了！请您提升自身等级后，再来升级天赋！");
		StopTalkTask();
		DeliverTalkMenu(varMap, varPlayer, varTalknpc);
		return
	end
	
	local nitem = GetInherenceLevelUpNeedItem(varMap, varPlayer)
	local varStr = ""
	if nitem > 0 then
		varStr = format("#Y【天赋修炼】\n\t#W天赋等级增加，可以提升玩家自身控制技能的命中率，降低对方玩家控制技能的命中率，每级造成的影响为0.5%%。60级以上的玩家才可以开始修炼天赋！多多修炼提升天赋等级，您才能拥有万夫不当之勇！\n\t您目前的天赋等级为#R%d#W级,每次修炼可提升1级天赋等级。\n \n\t升级需要消耗#R%s#W点经验。\n\t需要消耗#R#{_MONEY%d}#W银子。\n\t需要消耗物品@item_%d. \n \n\t是否确定要升级天赋？",nInherenceLevel, varExp, money, nitem)
	else
		varStr = format("#Y【天赋修炼】\n\t#W天赋等级增加，可以提升玩家自身控制技能的命中率，降低对方玩家控制技能的命中率，每级造成的影响为0.5%%。60级以上的玩家才可以开始修炼天赋！多多修炼提升天赋等级，您才能拥有万夫不当之勇！\n\t您目前的天赋等级为#R%d#W级,每次修炼可提升1级天赋等级。\n \n\t升级需要消耗#R%s#W点经验。\n\t需要消耗#R#{_MONEY%d}#W银子。\n \n\t是否确定要升级天赋？",nInherenceLevel, varExp, money)
	end
	StartTalkTask(varMap)
	TalkAppendString(varMap, varStr)
	StopTalkTask()
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x570043_var_FileId,-1);
	
end

function x570043_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

	return 1;

end

function x570043_ProcAccept(varMap, varPlayer, varTalknpc)

	local nNeedExp , nNeedMoney, addInherenceExp = x570043_NeedExpAndMoney(varMap, varPlayer)
	local nExp = GetExp(varMap, varPlayer)
	local varStr = nil
	local nMoney = GetMoney(varMap, varPlayer, 0) + GetMoney(varMap, varPlayer, 1)
	if nExp < nNeedExp then
		varStr = "您的经验不足！"
	elseif nMoney < nNeedMoney then
		varStr = "您的银子不足！"
	end
	
	if varStr ~= nil then
		StartTalkTask(varMap);
		TalkAppendString(varMap, varStr);
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer,varStr,8,2)
		return
	end

	local nitem = GetInherenceLevelUpNeedItem(varMap, varPlayer)
	if nitem > 0 then
		local varItemCount = GetItemCountInBag( varMap, varPlayer, nitem)
		if varItemCount < 1 then
			varStr = format("没有足够的@item_%d",nitem)
			StartTalkTask(varMap);
			TalkAppendString(varMap, varStr);
			StopTalkTask();
			DeliverTalkTips(varMap, varPlayer);
			Msg2Player(varMap,varPlayer,varStr,8,2)
			return
		end
	end
	
	local nSiller = GetMoney(varMap, varPlayer, 0)
	local nBindSiller = GetMoney(varMap, varPlayer, 1)
	local nCostSiller = 0
	local nCostBindSiller = 0
	
	local SillerMode = GetSillerMode(varMap, varPlayer)
	if 1 == SillerMode then 
		if nSiller < nNeedMoney then
			nCostSiller = nSiller
			nCostBindSiller = nNeedMoney - nCostSiller
		else
			nCostSiller = nNeedMoney
		end
	else 
		if nBindSiller < nNeedMoney then
			nCostBindSiller = nBindSiller
			nCostSiller = nNeedMoney - nBindSiller
		else
			nCostBindSiller = nNeedMoney
		end
	end
	
	DecreaseExp(varMap, varPlayer, nNeedExp)
	GamePlayScriptLog(varMap, varPlayer, 1561)
	CostMoney(varMap, varPlayer, 1, nCostBindSiller)
	CostMoney(varMap, varPlayer, 0, nCostSiller)
	GamePlayScriptLog(varMap, varPlayer, 1571)
	
	if nitem > 0 then
		local varRet = DelItemByIDInBag(varMap,varPlayer,nitem,1)
		if varRet <= 0 then
			StartTalkTask(varMap)
				TalkAppendString(varMap,format("#cffcf0删除@item_%d失败",nitem))
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)					
			return
		end
	end

	AddInherenceExp(varMap, varPlayer, addInherenceExp)
	GamePlayScriptLog(varMap, varPlayer, 1581)
	local nInherenceLevel = GetInherenceLevel(varMap, varPlayer)
	local varMsg = "恭喜你！天赋升级完成！当前天赋等级为#G"..nInherenceLevel.."#Y级！"
		StartTalkTask(varMap);
		TalkAppendString(varMap, varMsg);
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer,varMsg,8,2)
	
	local varTalknpc = GetPlayerRuntimeData(varMap,varPlayer,RD_COMMON_NPCID)
	local targetGUID = GetMonsterGUID(varMap, varTalknpc)
	StartTalkTask(varMap)
	local npcType = GetMonsterDataID(varMap,varTalknpc)

		local varText = "&&"..targetGUID.."&&"

		TalkAppendString(varMap,varText);
		OnNPCClickedQuestNM(varMap,varPlayer,varTalknpc, targetGUID)
		ShowNpcQuestEventList(varMap,varPlayer,varTalknpc)
	StopTalkTask(varMap)
	DeliverTalkMenu(varMap,varPlayer,varTalknpc)
end
