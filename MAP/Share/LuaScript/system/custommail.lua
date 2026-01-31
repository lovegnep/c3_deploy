



x888889_var_FileId = 888889


function x888889_ExecutePost( varMap, varPlayer, param0, varParam1, varParam2, varParam3 )
	param0 = tonumber(format("%u",param0))
	varParam1 = tonumber(format("%u",varParam1))
	varParam2 = tonumber(format("%u",varParam2))
	varParam3 = tonumber(format("%u",varParam3))
	
	if param0 == MAIL_REPUDIATE then
		x888889_Mail_Repudiate( varMap, varPlayer, param0, varParam1, varParam2, varParam3 )
	elseif param0 == MAIL_BETRAYMASTER then
		x888889_Mail_BetrayMaster( varMap, varPlayer, param0, varParam1, varParam2, varParam3 )
	elseif param0 == MAIL_EXPELPRENTICE then
		x888889_Mail_ExpelPrentice( varMap, varPlayer, param0, varParam1, varParam2, varParam3 )
	elseif param0 == MAIL_UPDATE_ATTR then
		UpdateAttr(varMap, varPlayer, param0, varParam1, varParam2, varParam3)
	elseif param0 == MAIL_UNSWEAR then
		x888889_Mail_Unswear(varMap, varPlayer, param0, varParam1, varParam2, varParam3)
	elseif param0 == MAIL_PRENTICE_EXP then
		x888889_Mail_PrenticeProfExp(varMap, varPlayer, param0, varParam1, varParam2, varParam3)
	elseif param0 == MAIL_LEAVE_GUILD then
	 	x888889_Mail_LeaveGuild(varMap, varPlayer, param0, varParam1, varParam2, varParam3)  
	elseif param0 == MAIL_GIVE_MONEY then	
		x888889_Mail_GiveMoney(varMap, varPlayer, param0, varParam1, varParam2, varParam3)  
	elseif param0 == MAIL_GIVE_ITEM then	
		x888889_Mail_GiveItem(varMap, varPlayer, param0, varParam1, varParam2, varParam3) 
	elseif param0 == MAIL_DELETE_MISSION then	
		x888889_Mail_DeleteQuest(varMap, varPlayer, param0, varParam1, varParam2, varParam3) 
	elseif param0 == MAIL_GIVE_MONEY2MASTER then	
		x888889_Mail_GiveMoney2Master(varMap, varPlayer, param0, varParam1, varParam2, varParam3) 
	elseif param0 == MAIL_GIVE_EXP then	
		x888889_Mail_GiveExp(varMap, varPlayer, param0, varParam1, varParam2, varParam3) 
	elseif param0 == MAIL_MASTER_AWARD then	
		x888889_Mail_MasterAward(varMap, varPlayer, param0, varParam1, varParam2, varParam3) 
	elseif param0 == MAIL_RECRUIT_DELET then
		LuaCallNoclosure( 802007, "Mail_RecruitDelet", varMap, varPlayer, param0, varParam1, varParam2, varParam3) ;
	end

end


function x888889_Mail_PrenticeProfExp( varMap, varPlayer, command, PrenticeGuid, Exps, zero )
	
	if Exps > 0 then
		LuaAddPrenticeProExp( varMap, varPlayer, PrenticeGuid, Exps )
	end
end

function x888889_Mail_Unswear( varMap, varPlayer, command, betrayerGuid, alldismiss, zero )

	
	local FriendPoint = GetFriendPointByGUID( varMap, varPlayer, betrayerGuid )
	if FriendPoint > 500 then
		SetFriendPointByGUID( varMap, varPlayer, betrayerGuid, 500 )
	end
	
	
	Unswear( varMap, varPlayer, betrayerGuid )
	
	
	if tonumber(alldismiss) == 1 then
		AwardJieBaiTitle( varMap, varPlayer, "" )
		DeliverAllTitle( varMap, varPlayer )
	end
end

function x888889_Mail_Repudiate( varMap, varPlayer, param0, varParam1, varParam2, varParam3 )
	
	local TITLE_MARRY = 4
	
	DeleteTitle(varMap, varPlayer, TITLE_MARRY)
	
	local SpouseGUID = GetSpouseGUID( varMap, varPlayer )
	if varParam1 ~= SpouseGUID and SpouseGUID ~= tonumber(format("%u",-1)) then 
		return
	end
	local spouseName = GetFriendName(varMap, varPlayer, SpouseGUID)
	
	if spouseName ~= "" then
		local varRet = format("%s与您解除了夫妻关系。", spouseName)
		Msg2Player(varMap,varPlayer,varRet,8,2)
		StartTalkTask(varMap);
		TalkAppendString(varMap, varRet);
		StopTalkTask();
	end
	
	
	Divorce( varMap, varPlayer )
	
	for varI , varQuest in SPOUSE_TASK do
		if varQuest == SPOUSE_TASK[2] and 1 == IsHaveQuest(varMap, varPlayer, varQuest) and GetSex(varMap, varPlayer) == 1 then			
			local varBusID  =  GetBusId(varMap, varPlayer)
			if varBusID ~= -1 then
				DeleteBus(varMap, varBusID,1)
			end
		end
		if varQuest == SPOUSE_TASK[3] and 1 == IsHaveQuest(varMap, varPlayer, varQuest) then
			if DelItem(varMap, varPlayer, SPOUSE_TASK_POSITION_USE_ITEM, 1) ~= 1 then return 0 end
		end
		if 1 == IsHaveQuest(varMap, varPlayer, varQuest) then
			DelQuestNM( varMap, varPlayer, varQuest )
		end
	end

end

function x888889_Mail_BetrayMaster( varMap, varPlayer, param0, varParam1, varParam2, varParam3 )
	
	local Msg
	local PrenticeName	= GetFriendName( varMap, varPlayer, varParam1 )
	if 0 == varParam2 then
		
		
			
			
		
	elseif 1 == varParam2 and PrenticeName ~= "" then
		Msg = format("很遗憾，您的徒弟%s解除了与您的师徒关系。", PrenticeName);
		Msg2Player(varMap,varPlayer,Msg,8,2)
	elseif 2 == varParam2 and PrenticeName ~= "" then
		Msg = format("很遗憾，由于您的徒弟3天未登录游戏，系统解除了您与徒弟%s的师徒关系。", PrenticeName);
		Msg2Player(varMap,varPlayer,Msg,8,2)
	end
	local isPrentice = 0
	local varIndex = 0
	while varIndex < MAX_PRENTICE_NUM do
		if GetPrenticeGUID(varMap, varPlayer, varIndex) == varParam1 then
			isPrentice = 1
			break
		end
		varIndex = varIndex + 1
	end
	if 0 == isPrentice then 
		return
	end
	local isFinishPrenticeship = 0 
	if 0 == varParam2 then
		
	end
	ExpelPrentice( varMap, varPlayer, varParam1, isFinishPrenticeship )
end

function x888889_Mail_ExpelPrentice( varMap, varPlayer, param0, varParam1, varParam2, varParam3 )
	
	local Msg
	local targetGUID = GetMasterGUID(varMap, varPlayer);
	if targetGUID == -1 then
		return
	end
	local MasterName = GetFriendName( varMap, varPlayer, targetGUID )
	if 0 == varParam1 then
		Msg = format("很遗憾，由于您的师傅3天未登录游戏，系统解除了您与师傅%s的师徒关系。", MasterName);
		Msg2Player(varMap,varPlayer,Msg,8,2)
	elseif 1 == varParam1 then
		Msg = format("很遗憾，您的师傅%s解除了与您的师徒关系。", MasterName);
		Msg2Player(varMap,varPlayer,Msg,8,2)
	end

	if targetGUID ~= varParam2 then 
		return
	end
	local TITLE_PRENTICE = 5
	DeleteTitle(varMap, varPlayer, TITLE_PRENTICE)
	BetrayMaster( varMap, varPlayer )
end

function x888889_Mail_GiveMoney(varMap, varPlayer, param0, varParam1, varParam2, varParam3)
	AddMoney(varMap, varPlayer, varParam1, varParam2)
end


function x888889_Mail_GiveMoney2Master(varMap, varPlayer, param0, varParam1, varParam2, varParam3)
	AddMoney(varMap, varPlayer, varParam1, varParam2)
end


function x888889_Mail_LeaveGuild( varMap, varPlayer, param0, varParam1, varParam2, varParam3 )

	LuaCallNoclosure( SCENE_SCRIPT_ID, "ProcLeaveGuild", varMap, varPlayer,0 )
	
end


function x888889_Mail_GiveItem(varMap, varPlayer, param0, varParam1, varParam2, varParam3)

	StartItemTask(varMap)
	ItemAppend( varMap, varParam1, varParam2 )
	local varRet = StopItemTask(varMap,varPlayer)
	if varRet > 0 then
		DeliverItemListSendToPlayer(varMap,varPlayer)
	end
	
end


function x888889_Mail_GiveExp(varMap, varPlayer, param0, varParam1, varParam2, varParam3)
	AddExp(varMap, varPlayer, varParam1);
end

function x888889_Mail_SetQuestData(varMap, varPlayer)
		SetPlayerGameData(varMap, varPlayer, MD_SPOUSE_MISSION_DATE[1][1], MD_SPOUSE_MISSION_DATE[1][2], MD_SPOUSE_MISSION_DATE[1][3], GetDayOfYear())
end




function x888889_Mail_DeleteQuest(varMap, varPlayer, param0, varParam1, varParam2, varParam3)
	 if 1 == IsHaveQuest(varMap, varPlayer, varParam1) then
	 		if tonumber(varParam1) == tonumber(SPOUSE_TASK[2]) and tonumber(varParam2) == tonumber(0) then
				local varText = "由于您的配偶离开#g探亲的小孩#w#w#cefc800时间过久，孩童走失了，任务失败！"
				StartTalkTask(varMap)
				TalkAppendString(varMap, varText);
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				Msg2Player(varMap,varPlayer,varText,8,2)
				DelQuestNM( varMap, varPlayer, varParam1 )
				x888889_Mail_SetQuestData(varMap, varPlayer)
			elseif tonumber(varParam1) == tonumber(SPOUSE_TASK[2]) and tonumber(varParam2) == tonumber(1) then
				local varText = "由于您的配偶放弃了夫妻任务，任务失败！"
				StartTalkTask(varMap)
				TalkAppendString(varMap, varText);
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				Msg2Player(varMap,varPlayer,varText,8,2)
				DelQuestNM( varMap, varPlayer, varParam1 )
				x888889_Mail_SetQuestData(varMap, varPlayer)
				local varBusID  =  GetBusId(varMap, varPlayer)
				if varBusID ~= -1 and GetSex(varMap, varPlayer) == 1 then
			   	
					DeleteBus(varMap, varBusID,1)
				end
			
			elseif tonumber(varParam1) == tonumber(SPOUSE_TASK[1]) or tonumber(varParam1) == tonumber(SPOUSE_TASK[3]) then
				local varText = "由于您的配偶放弃了夫妻任务，任务失败！"
				StartTalkTask(varMap)
				TalkAppendString(varMap, varText);
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				Msg2Player(varMap,varPlayer,varText,8,2)
				DelQuestNM( varMap, varPlayer, varParam1 )
				x888889_Mail_SetQuestData(varMap, varPlayer)
				if tonumber(varParam1) == tonumber(SPOUSE_TASK[3]) then
					if DelItem(varMap, varPlayer, SPOUSE_TASK_POSITION_USE_ITEM, 1) ~= 1 then return 0 end
				end
			end
		end
end


function x888889_Mail_MasterAward(varMap, varPlayer, param0, varParam1, varParam2, varParam3)
	AddExp(varMap, varPlayer, varParam1);

	local value = GetPlayerGoodBadValue(varMap, varPlayer)
	value = value + varParam2
	SetPlayerGoodBadValue(varMap, varPlayer, value)

	if varParam3 == 0 then
		local targetGUID = GetMasterGUID(varMap, varPlayer);
		if targetGUID == tonumber(-1) then
			return
		end
		
		local MasterName = GetFriendName( varMap, varPlayer, targetGUID )
		if MasterName == "" then
			return
		end
	
		local selfName	= GetName( varMap, varPlayer )

		local nExp = varParam1 * 30 / 100
		local nCachet = varParam2 * 30 / 100
	
		SendScriptPost( varMap, MasterName, MAIL_MASTER_AWARD, nExp, nCachet, 1, varPlayer )
		local szMsg = format("恭喜您!由于您徒弟%s的徒弟升级，您获得了%d点经验和%d点威望的奖励。", selfName,nExp,nCachet)
		
		SendSystemPost( varMap, MasterName, szMsg )
	end
end
