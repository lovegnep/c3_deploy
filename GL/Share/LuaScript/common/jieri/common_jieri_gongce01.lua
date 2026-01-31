

x350000_var_FileId = 350000
x350000_var_QuestName = "领取迎公测礼包"
x350000_var_QuestDay = {	{ day=710,min = 1200,	max = 1320,	varFlag = 1},
													{ day=711,min = 1200,	max = 1320,	varFlag = 2},
													{ day=712,min = 1200,	max = 1320,	varFlag = 3},
													{ day=713,min = 1200,	max = 1320,	varFlag = 4},
													{ day=714,min = 1200,	max = 1320,	varFlag = 5},
													{ day=715,min = 1200,	max = 1320,	varFlag = 6},
													{ day=716,min = 1200,	max = 1320,	varFlag = 7},
													{ day=717,min = 1200,	max = 1320,	varFlag = 8}
												}
x350000_var_QuestReadme1 = "\t《成吉思汗3 恶狼传说》将于7月17日进入公开测试阶段，为了欢迎广大玩家进行游戏，并提出您宝贵的意见，在迎接公测倒计时一周的时间里，每天晚间8点至10点阶段都可以新手村和王国领奖大使处领取“迎公测礼包”。\n\t届时所有20级以上的玩家都可以获得一定数额的银卡奖励，同时也有机会获得商城道具！\n\t幸运多多，切莫错失良机！"
x350000_var_QuestReadme2 = "\t《成吉思汗3 恶狼传说》迎公测礼包在每天#g20:00#w至#g22:00#w间领取，每个时段您都可以领取到一只礼包，届时所有20级以上的玩家都可以获得一定数额的银卡奖励，同时也有机会获得商城道具！请您准时领取。"
x350000_var_QuestReadme3 = "\t您已经领取了今天的迎公测礼包！\n\t《成吉思汗3 恶狼传说》迎公测礼包在每天#g20:00#w至#g22:00#w间领取，每个时段您都可以领取到一只礼包，届时所有20级以上的玩家都可以获得一定数额的银卡奖励，同时也有机会获得商城道具！请您准时领取。"
x350000_var_ItemBonus1			=	{{zhiye=-1,varId=12030326,varNum=1}}
x350000_var_ItemBonus2			=	{{zhiye=-1,varId=12030326,varNum=1}}
x350000_var_LevelMin			= 20


function x350000_CheckDayValid( varMap,varPlayer)

	local year,month,day = GetYearMonthDay()
	local nTime =GetMinOfDay()
	local nDay = month*100+day
	local nLevel = GetLevel(varMap,varPlayer)

	if nLevel >= x350000_var_LevelMin then
		for varI,item in x350000_var_QuestDay do
			if nDay == item.day and nTime >= item.min and nTime <= item.max then 
				return item.varFlag
			end
		end	
	end
	
	return 0
	
end

function x350000_CheckHaveGetBonus( varMap,varPlayer,varFlag )

	local year,month,day = GetYearMonthDay()
	local nTime =GetMinOfDay()
	
	local nMD ={}
	for varI,item in MD_GONGCE01_DATE do
		nMD[varI] = GetPlayerGameData(varMap,varPlayer,item[1],item[2],item[3])
	end
	
	return nMD[varFlag]
	
end







function x350000_ProcEventEntry(varMap, varPlayer, varTalknpc)	

	
	local varIndex = x350000_CheckDayValid( varMap,varPlayer )

	if varIndex >= 1 then
		
		if x350000_CheckHaveGetBonus( varMap,varPlayer,varIndex) == 0 then
		
			
			StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y"..x350000_var_QuestName)
				TalkAppendString(varMap,x350000_var_QuestReadme1)
			StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x350000_var_FileId, x350000_var_FileId)
			
			return
			 		
		else
				
			
			StartTalkTask(varMap)
				TalkAppendString(varMap,x350000_var_QuestReadme3)
			StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
			
			return
				
		end
		
	end


	
	StartTalkTask(varMap)
		TalkAppendString(varMap,x350000_var_QuestReadme2)
	StopTalkTask()
	DeliverTalkMenu(varMap, varPlayer, varTalknpc)
	
end







function x350000_CheckMD( varMap,varPlayer )

	local varIndex = x350000_CheckDayValid( varMap,varPlayer )

	if varIndex < 1 then
		return		
	end

	local year,month,day = GetYearMonthDay()
	local nTime =GetMinOfDay()
	
	local nMD ={}
	for varI,item in MD_GONGCE01_DATE do
		nMD[varI] = GetPlayerGameData(varMap,varPlayer,item[1],item[2],item[3])
	end
	
	local nDay = month*100+day
	
	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= x350000_var_LevelMin then
		for varI,item in x350000_var_QuestDay do
			if item.day == nDay and nTime >= item.min and nTime <= item.max and nMD[item.varFlag]==0 then
				if x350000_GiveBonus(varMap,varPlayer,item.varFlag) == 1 then
					SetPlayerGameData(varMap,varPlayer,MD_GONGCE01_DATE[item.varFlag][1],MD_GONGCE01_DATE[item.varFlag][2],MD_GONGCE01_DATE[item.varFlag][3],1)
					return
				end
			end
		end
	end

end







function x350000_CheckDay( varMap,varPlayer )

	local year,month,day = GetYearMonthDay()
	local nDay = month*100+day
	
	for varI,item in x350000_var_QuestDay do
		if item.day == nDay then
			return 1
		end
	end
	
	return 0

end







function x350000_GiveBonus( varMap,varPlayer,varFlag)

	if varFlag == 1 or varFlag == 3 or varFlag == 5 or varFlag == 7 then
		
		StartItemTask( varMap )
			for varI,itm in x350000_var_ItemBonus1 do
				ItemAppendBind( varMap, itm.varId, itm.varNum )	
			end
		local varRet = StopItemTask( varMap, varPlayer )
		if varRet > 0 then
			DeliverItemListSendToPlayer(varMap,varPlayer) 
			return 1
		else
			StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y"..x350000_var_QuestName)
				TalkAppendString(varMap,x350000_var_QuestReadme2)
			StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varPlayer, x350000_var_FileId, -1)
			return 0
		end
		
	elseif varFlag == 2 or varFlag == 4 or varFlag == 6 or varFlag == 8 then
		
		StartItemTask( varMap )
			for varI,itm in x350000_var_ItemBonus2 do
				ItemAppendBind( varMap, itm.varId, itm.varNum )	
			end
		local varRet = StopItemTask( varMap, varPlayer )
		if varRet > 0 then
			DeliverItemListSendToPlayer(varMap,varPlayer)
			return 1
		else
			StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y"..x350000_var_QuestName)
				TalkAppendString(varMap,x350000_var_QuestReadme2)
			StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varPlayer, x350000_var_FileId, -1)
			return 0
		end
	end
	
	return 0
	
end







function x350000_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

		if x350000_CheckDay( varMap,varPlayer ) == 1 then
			TalkAppendButton(varMap, x350000_var_FileId, x350000_var_QuestName,3,1)
		else 
			return
		end

end









function x350000_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	return 1
end


function x350000_ProcAccept( varMap, varPlayer, varTalknpc )

	x350000_CheckMD( varMap,varPlayer )
	
end









function x350000_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x350000_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x350000_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x350000_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x350000_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x350000_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
