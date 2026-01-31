
x300361_var_FileId 					= 300361
x300361_var_QuestName				= "【师徒】收徒"
x300361_var_MasterLevelMin		= 50
x300361_var_PrenticeLevelMin	= 20
x300361_var_MasterPrenticeLevelConfine	= 10

function x300361_IsCanBaiShi(varMap, varPlayer)

	if (IsCaptain(varMap, varPlayer)) ~= 1 then
		return "只有队长才能申请收徒。";
	end
	
	if (GetTeamSize(varMap, varPlayer) ~= 2) then
		return "需要师徒二人组队来找我。";
	end
	
	
	local varTalknpc = GetTeamSceneMember(varMap, varPlayer, 0);
	
	if IsInDist(varMap, varPlayer, varTalknpc, 10) ~= 1 then
		return "师徒二人必须都在此附近。";
	end
	
	
	if GetLevel(varMap, varPlayer) < x300361_var_MasterLevelMin then
		return format("师傅等级必须达到%d级。", x300361_var_MasterLevelMin);
	end
	
	
	if GetLevel(varMap, varTalknpc) < x300361_var_PrenticeLevelMin then
		return format("徒弟等级达到%d级才能拜师。", x300361_var_PrenticeLevelMin);
	end
	
	
	if GetLevel(varMap, varPlayer) - GetLevel(varMap, varTalknpc) < x300361_var_MasterPrenticeLevelConfine then
		return format("师傅必须比徒弟高%d级才能拜师。", x300361_var_MasterPrenticeLevelConfine);
	end

	
	if IsHaveMaster(varMap, varTalknpc) == 1 then
		return "对方已经有师傅，无法拜师。";
	end
	
	
	local iTime = GetPrenticeBetrayTime(varMap, varPlayer);
	iTime = iTime/3600;
	if iTime > 0 and iTime < MASTER_PRENTICE_TIME_LIMIT then
		local nHour = x300361_GetModifiedHour(iTime)
		return format("师傅%.1f小时后才能再次收徒。", nHour);
	end
	
	
	iTime = GetMasterBetrayTime(varMap, varTalknpc);
	iTime = iTime/3600;	
	if iTime > 0 and iTime < MASTER_PRENTICE_TIME_LIMIT then
		local nHour = x300361_GetModifiedHour(iTime)
		return format("徒弟%.1f小时后才能再次拜师。", nHour);
	end
	
	
	if IsPrenticeFull(varMap, varPlayer) == 1 then
		return "徒弟已经满了。";
	end

	
	if IsFriend(varMap, varPlayer, varTalknpc) ~= 1 or IsFriend(varMap, varTalknpc, varPlayer) ~= 1 then
		return "相互加为好友才能拜师。";
	end	

	
	if IsSpouses(varMap, varPlayer, varTalknpc) == 1 then
		return  "夫妻关系不能拜师。";
	end
	
	
	if IsMaster(varMap, varPlayer, varTalknpc) == 1 then
		return "对方是你的师傅，无法拜师。";
	end

	return nil;

end

function x300361_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	TalkAppendButton(varMap,x300361_var_FileId,x300361_var_QuestName,3,0);
end

function x300361_ProcEventEntry(varMap, varPlayer, varTalknpc)

	StartTalkTask(varMap);
	TalkAppendString(varMap, "#Y【师徒】收徒#W\n\t当你满足成为师傅的条件时，可以与你想收为弟子的玩家组队来到我这里（师傅必须为队长），我帮助你们结成师徒关系。\n\t建立师徒关系后，师徒双方都能够获得#G各种好处#W，不要错过哦！");
	StopTalkTask();
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x300361_var_FileId,-1);
	
end

function x300361_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

	return 1;

end

function x300361_ProcAccept(varMap, varPlayer, varTalknpc)

	local varRet = x300361_IsCanBaiShi(varMap, varPlayer);
	
	if varRet ~= nil then
		Msg2Player(varMap,varPlayer,varRet,8,2)
		Msg2Player(varMap,varPlayer,varRet,8,3)
	else
		
		local varTalknpc = GetTeamSceneMember(varMap, varPlayer, 0);
		Aprentice(varMap, varTalknpc, varPlayer);		
		Msg2Player(varMap, varPlayer, "恭喜收徒完成！师傅要努力教好你的徒儿。",8,2);
		Msg2Player(varMap, varTalknpc, "恭喜拜师完成！",8,2);
		Msg2Player(varMap, varPlayer, "恭喜收徒完成！师傅要努力教好你的徒儿。",8,3);
		Msg2Player(varMap, varTalknpc, "恭喜拜师完成！",8,3);
		--在线好友,师徒,夫妻加成更新
		LuaCallNoclosure(802003, "SetOlineData", varMap, varTalknpc, 0, 15)
	end

end


function x300361_GetModifiedHour(iTime)
		local  nHour   = (MASTER_PRENTICE_TIME_LIMIT - iTime)
		local  nMinute = nHour*60
		if     nMinute <  6 then
			nHour = 0.1
		end
		
		return nHour
end
