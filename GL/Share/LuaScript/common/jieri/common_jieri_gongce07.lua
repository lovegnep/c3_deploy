

x350006_var_FileId = 350006
x350006_var_QuestName = "领取节庆礼包"
x350006_var_QuestDay = {	{ day=1125,min = 1200,	max = 1320,	varFlag=1},
													{ day=1126,min = 1200,	max = 1320,	varFlag=2},
													{ day=1127,min = 1200,	max = 1320,	varFlag=3}
												}
x350006_var_QuestDayTest = {	{ day=1121,min = 1200,	max = 1320,	varFlag=1},
													{ day=1122,min = 1200,	max = 1320,	varFlag=2},
													{ day=1123,min = 1200,	max = 1320,	varFlag=3}
												}
x350006_var_QuestReadme = "\t在感恩节期间，为表达对广大玩家的感谢和祝福，感恩节期间【即11月21日至11月23日】每天晚间8点至10点阶段都可以新手村和王国领奖大使处领取“节庆礼包”。\n\t届时所有30级以上的玩家都可以获得节庆礼包1个！请您准时领取。\n\t幸运多多，切莫错失良机！"
x350006_var_QuestReadme1 = "\t在感恩节期间，为表达对广大玩家的感谢和祝福，感恩节期间【即11月25日至11月27日】每天晚间8点至10点阶段都可以新手村和王国领奖大使处领取“节庆礼包”。\n\t届时所有30级以上的玩家都可以获得节庆礼包1个！请您准时领取。\n\t幸运多多，切莫错失良机！"
x350006_var_QuestReadme2 = "\t节庆礼包在每天#G20:00#W至#G22:00#W间领取，每个时段您都可以领取到1个节庆礼包！请您准时领取。"
x350006_var_QuestReadme3 = "\t您已经领取了今天的节庆礼包！\n\t节庆礼包在每天#G20:00#W至#G22:00#W间领取，每个时段您都可以领取到1个节庆礼包！请您准时领取。"
x350006_var_LevelMin				= 30
x350006_var_RandomItemBonus		=	 12030421



x350006_var_MD					= MD_GANEN


function x350006_CheckDayValid( varMap,varPlayer)

	local year,month,day = GetYearMonthDay()
	local nTime =GetMinOfDay()
	local nDay = month*100+day
	local nLevel = GetLevel(varMap,varPlayer)

	if GetTestServerToggle() == 1 then	
		if nLevel >= x350006_var_LevelMin then			
			for varI,item in x350006_var_QuestDayTest do
				if nDay == item.day and nTime >= item.min and nTime <= item.max then 
					return item.varFlag
				end
			end	
		end
	else	
		if nLevel >= x350006_var_LevelMin then			
			for varI,item in x350006_var_QuestDay do
				if nDay == item.day and nTime >= item.min and nTime <= item.max then 
					return item.varFlag
				end
			end	
		end
	end








		
	return 0
	
end

function x350006_CheckHaveGetBonus( varMap,varPlayer,varFlag )

	local year,month,day = GetYearMonthDay()
	local nTime =GetMinOfDay()
	
	local nMD ={}
	for varI,item in x350006_var_MD do
		nMD[varI] = GetPlayerGameData(varMap,varPlayer,item[1],item[2],item[3])
	end
	
	return nMD[varFlag]
	
end







function x350006_ProcEventEntry(varMap, varPlayer, varTalknpc)	

	
	local varIndex = x350006_CheckDayValid( varMap,varPlayer )

	if varIndex >= 1 then
		
		if x350006_CheckHaveGetBonus( varMap,varPlayer,varIndex) == 0 then
			if GetTestServerToggle() == 1 then
				
				StartTalkTask(varMap)
					TalkAppendString(varMap,"#Y"..x350006_var_QuestName)
					TalkAppendString(varMap,x350006_var_QuestReadme)
				StopTalkTask()
				DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x350006_var_FileId, x350006_var_FileId)			
			else
				
				StartTalkTask(varMap)
					TalkAppendString(varMap,"#Y"..x350006_var_QuestName)
					TalkAppendString(varMap,x350006_var_QuestReadme1)
				StopTalkTask()
				DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x350006_var_FileId, x350006_var_FileId)			
			end
			
			return
			 		
		else
				
			
			StartTalkTask(varMap)
				TalkAppendString(varMap,x350006_var_QuestReadme3)
			StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
			
			return
				
		end
		
	end


	
	StartTalkTask(varMap)
		TalkAppendString(varMap,x350006_var_QuestReadme2)
	StopTalkTask()
	DeliverTalkMenu(varMap, varPlayer, varTalknpc)
	
end







function x350006_CheckMD( varMap,varPlayer )

	local varIndex = x350006_CheckDayValid( varMap,varPlayer )

	if varIndex < 1 then
		return		
	end

	local year,month,day = GetYearMonthDay()
	local nTime =GetMinOfDay()
	
	local nMD ={}
	for varI,item in x350006_var_MD do
		nMD[varI] = GetPlayerGameData(varMap,varPlayer,item[1],item[2],item[3])
	end
	
	local nDay = month*100+day
	
	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= x350006_var_LevelMin then

	if GetTestServerToggle() == 1 then
		for varI,item in x350006_var_QuestDayTest do
			if item.day == nDay and nTime >= item.min and nTime <= item.max and nMD[item.varFlag]==0 then
				if x350006_GiveBonus(varMap,varPlayer,item.varFlag) == 1 then
					SetPlayerGameData(varMap,varPlayer,x350006_var_MD[item.varFlag][1],x350006_var_MD[item.varFlag][2],x350006_var_MD[item.varFlag][3],1)
					return
				end
			end
		end
	else
		for varI,item in x350006_var_QuestDay do
			if item.day == nDay and nTime >= item.min and nTime <= item.max and nMD[item.varFlag]==0 then
				if x350006_GiveBonus(varMap,varPlayer,item.varFlag) == 1 then
					SetPlayerGameData(varMap,varPlayer,x350006_var_MD[item.varFlag][1],x350006_var_MD[item.varFlag][2],x350006_var_MD[item.varFlag][3],1)
					return
				end
			end
		end
	end
	
	








	end
	
end







function x350006_CheckDay( varMap,varPlayer )

	local year,month,day = GetYearMonthDay()
	local nDay = month*100+day

	if GetTestServerToggle() == 1 then
		for varI,item in x350006_var_QuestDayTest do
			if item.day == nDay then
				return 1
			end
		end
	else
		for varI,item in x350006_var_QuestDay do
			if item.day == nDay then
				return 1
			end
		end
	end
	





	
	return 0

end







function x350006_GiveBonus( varMap,varPlayer,varFlag)

	if varFlag == 1 or varFlag == 3 or varFlag == 5 or varFlag == 7 then
		
		StartItemTask( varMap )
			ItemAppendBind( varMap,x350006_var_RandomItemBonus, 1 )	
			
		local varRet = StopItemTask( varMap, varPlayer )
		if varRet > 0 then
			DeliverItemListSendToPlayer(varMap,varPlayer) 
			return 1
		else
			StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y"..x350006_var_QuestName)
				TalkAppendString(varMap,x350006_var_QuestReadme2)
			StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varPlayer, x350006_var_FileId, -1)
			return 0
		end
		
	elseif varFlag == 2 or varFlag == 4 or varFlag == 6 or varFlag == 8 then
		
		StartItemTask( varMap )
		
			ItemAppendBind( varMap,x350006_var_RandomItemBonus, 1 )	

		local varRet = StopItemTask( varMap, varPlayer )
		if varRet > 0 then
			DeliverItemListSendToPlayer(varMap,varPlayer)
			return 1
		else
			StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y"..x350006_var_QuestName)
				TalkAppendString(varMap,x350006_var_QuestReadme2)
			StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varPlayer, x350006_var_FileId, -1)
			return 0
		end
	end
	
	return 0
	
end







function x350006_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		if x350006_CheckDay( varMap,varPlayer ) == 1 then
			TalkAppendButton(varMap, x350006_var_FileId, x350006_var_QuestName,3,1)
		else 
			return
		end

end









function x350006_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	return 1
end


function x350006_ProcAccept( varMap, varPlayer, varTalknpc )

	x350006_CheckMD( varMap,varPlayer )
	
end









function x350006_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x350006_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x350006_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x350006_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x350006_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x350006_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
