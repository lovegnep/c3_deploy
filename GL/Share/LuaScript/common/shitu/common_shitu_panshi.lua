





x800012_var_FileId 					= 800012
x800012_var_QuestName				= "【师徒】离开师门"
x800012_var_CostMoneyPanShi		= 5000
x800012_var_CostMoneyType			=	2






function x800012_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	TalkAppendButton(varMap, x800012_var_FileId, x800012_var_QuestName,3,0);
end







function x800012_ProcEventEntry(varMap, varPlayer, varTalknpc)
	local Readme_1 = "#Y【师徒】离开师门#r"
	local Readme_2 = "\t#W我可以帮您解除与师傅的关系。#r您是否要与师傅解除师徒关系？"
	local varReadme = Readme_1..Readme_2
	StartTalkTask(varMap);TalkAppendString(varMap, varReadme);StopTalkTask();DeliverTalkInfo(varMap, varPlayer, varTalknpc, x800012_var_FileId,-1);
	
end







function x800012_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

	return 1;

end







function x800012_ProcAccept(varMap, varPlayer)

	
	if IsHaveMaster(varMap, varPlayer) ~= 1 then
		Msg2Player(varMap,varPlayer,"很抱歉，您不是徒弟，无法解除师徒。",8,2)
		Msg2Player(varMap,varPlayer,"很抱歉，您不是徒弟，无法解除师徒。",8,3)
		return
	end
	
	
	
	local targetGUID = GetMasterGUID(varMap, varPlayer);
	if targetGUID == -1 then
		return
	end
	local MasterName = GetFriendName( varMap, varPlayer, targetGUID )
	
	local mail = format("很遗憾，您的徒弟%s与您解除了师徒关系。", GetName(varMap, varPlayer));
	SendSystemPost(varMap, MasterName, mail);
	
	
	local MyGUID = GetGUID( varMap, varPlayer )
	SendScriptPost( varMap, MasterName, MAIL_BETRAYMASTER, MyGUID, 1, 0, varPlayer )
		
	BetrayMaster(varMap, varPlayer);
	
	local Msg = format("很遗憾，您解除了与师傅%s的师徒关系", MasterName);
	Msg2Player(varMap,varPlayer,Msg,8,2)
	Msg2Player(varMap,varPlayer,Msg,8,3)
	--在线好友,师徒,夫妻加成更新
	LuaCallNoclosure(802003, "SetOlineData", varMap, varPlayer, 0, 16)
end
