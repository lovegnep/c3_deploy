

x350004_var_FileId = 350004
x350004_var_QuestName = "领取中秋礼包"
x350004_var_QuestDay = {	{ day=1001,min = 1200,	max = 1320,	varFlag=1},
							{ day=1002,min = 1200,	max = 1320,	varFlag=2},
							{ day=1003,min = 1200,	max = 1320,	varFlag=3},
							{ day=1004,min = 1200,	max = 1320,	varFlag=4},
							{ day=1005,min = 1200,	max = 1320,	varFlag=5},
							{ day=1006,min = 1200,	max = 1320,	varFlag=6},
							{ day=1007,min = 1200,	max = 1320,	varFlag=7},
							{ day=1008,min = 1200,	max = 1320,	varFlag=8}
						}
x350004_var_QuestReadme1 = "\t八月十五月正南、瓜果石榴列满盘。中秋佳节是我国的传统节日，月饼作为中秋节美食之一，象征着合家团圆和美满幸福，为表达对广大玩家的感谢和祝福，中秋国庆期间【即10月1日至10月8日】每天晚间8点至10点阶段都可以新手村和王国领奖大使处领取“中秋礼包”。\n\t届时所有30级以上的玩家都可以获得一定数量的月饼，同时也有机会获得商城道具！请您准时领取。\n\t幸运多多，切莫错失良机！"
x350004_var_QuestReadme2 = "\t《成吉思汗3 恶狼传说》中秋礼包在每天#g20:00#w至#g22:00#w间领取，每个时段您都可以领取到一只礼包，届时所有30级以上的玩家都可以获得一定数量的月饼，同时也有机会获得商城道具！请您准时领取。"
x350004_var_QuestReadme3 = "\t您已经领取了今天的中秋礼包！\n\t《成吉思汗3 恶狼传说》中秋礼包在每天#g20:00#w至#g22:00#w间领取，每天您都可以领取到一只礼包，届时所有30级以上的玩家都可以获得一定数量的月饼，同时也有机会获得商城道具！请您准时领取。"

x350004_var_LevelMin				= 30
x350004_var_RandomItemBonus		=	{
										{varId=12030201,rnd=10,varNum=1},
										{varId=12041101,rnd=30,varNum=1},
										{varId=11970021,rnd=20,varNum=1},
										{varId=12054300,rnd=20,varNum=1},
										{varId=12030209,rnd=5,varNum=1},
										{varId=12010020,rnd=5,varNum=1},
										{varId=12041103,rnd=5,varNum=1},
										{varId=12030200,rnd=5,varNum=1},
									}



x350004_var_MD					= MD_ZHONGQIU


function x350004_CheckDayValid( varMap,varPlayer)

	local year,month,day = GetYearMonthDay()
	local nTime =GetMinOfDay()
	local nDay = month*100+day
	local nLevel = GetLevel(varMap,varPlayer)

	if nLevel >= x350004_var_LevelMin then			
		for varI,item in x350004_var_QuestDay do
			if nDay == item.day and nTime >= item.min and nTime <= item.max then 
				return item.varFlag
			end
		end	
	end
		
	return 0
	
end

function x350004_CheckHaveGetBonus( varMap,varPlayer,varFlag )

	local year,month,day = GetYearMonthDay()
	local nTime =GetMinOfDay()
	
	local nMD ={}
	for varI,item in x350004_var_MD do
		nMD[varI] = GetPlayerGameData(varMap,varPlayer,item[1],item[2],item[3])
	end
	
	return nMD[varFlag]
	
end






function x350004_Yuebing(varMap,varPlayer)
	
	local nLevel = GetLevel(varMap,varPlayer)
	local yuebing = -1
	if nLevel < 40  then
		yuebing = 12030251
	elseif nLevel >=40 and nLevel < 50 then
		yuebing = 12030252
	elseif nLevel >=50 and nLevel < 60 then	
		yuebing = 12030253
	elseif nLevel >=60 and nLevel < 70 then
		yuebing = 12030254
	elseif nLevel >=70 and nLevel < 80 then
		yuebing = 12030255
	elseif nLevel >=80 and nLevel < 90 then
		yuebing = 12030256
	elseif nLevel >=90 and nLevel < 100 then
		yuebing = 12030257
	end
	
	return yuebing

end






function x350004_GetRandomBonus()
	
	local nMaxRandom = -1
	local nCurIndex = -1
	for varI,item in x350004_var_RandomItemBonus do
		
		local rnd = random(1,item.rnd)
		
		if rnd > nMaxRandom then
			nMaxRandom = rnd
			nCurIndex = varI
		end
	end
	
	
	if nCurIndex == -1 then
		return -1
	end
	
	local n = getn(x350004_var_RandomItemBonus)
	if nCurIndex < 1 or nCurIndex > n then
		return -1
	end
	
	
	return x350004_var_RandomItemBonus[nCurIndex].varId,x350004_var_RandomItemBonus[nCurIndex].varNum
	
end







function x350004_ProcEventEntry(varMap, varPlayer, varTalknpc)	

	
	local varIndex = x350004_CheckDayValid( varMap,varPlayer )

	if varIndex >= 1 then
		
		if x350004_CheckHaveGetBonus( varMap,varPlayer,varIndex) == 0 then

			
			StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y"..x350004_var_QuestName)
				TalkAppendString(varMap,x350004_var_QuestReadme1)
			StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x350004_var_FileId, x350004_var_FileId)
			
			return
			 		
		else
				
			
			StartTalkTask(varMap)
				TalkAppendString(varMap,x350004_var_QuestReadme3)
			StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
			
			return
				
		end
		
	end


	
	StartTalkTask(varMap)
		TalkAppendString(varMap,x350004_var_QuestReadme2)
	StopTalkTask()
	DeliverTalkMenu(varMap, varPlayer, varTalknpc)
	
end







function x350004_CheckMD( varMap,varPlayer )

	local varIndex = x350004_CheckDayValid( varMap,varPlayer )

	if varIndex < 1 then
		return		
	end

	local year,month,day = GetYearMonthDay()
	local nTime =GetMinOfDay()
	
	local nMD ={}
	for varI,item in x350004_var_MD do
		nMD[varI] = GetPlayerGameData(varMap,varPlayer,item[1],item[2],item[3])
	end
	
	local nDay = month*100+day
	
	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= x350004_var_LevelMin then
		for varI,item in x350004_var_QuestDay do
			if item.day == nDay and nTime >= item.min and nTime <= item.max and nMD[item.varFlag]==0 then
				if x350004_GiveBonus(varMap,varPlayer,item.varFlag) == 1 then
					SetPlayerGameData(varMap,varPlayer,x350004_var_MD[item.varFlag][1],x350004_var_MD[item.varFlag][2],x350004_var_MD[item.varFlag][3],1)
					return
				end
			end
		end
	end
	
end







function x350004_CheckDay( varMap,varPlayer )

	local year,month,day = GetYearMonthDay()
	local nDay = month*100+day
	
	for varI,item in x350004_var_QuestDay do
		if item.day == nDay then
			return 1
		end
	end
	
	return 0

end







function x350004_GiveBonus( varMap,varPlayer,varFlag)

	if varFlag == 1 or varFlag == 3 or varFlag == 5 or varFlag == 7 then
		
		StartItemTask( varMap )
		
		
		local nRandItem,nRandItemNum = x350004_GetRandomBonus()
		if nRandItem ~= -1 then
			ItemAppendBind( varMap,nRandItem, nRandItemNum )	
		end
		
		
		local yuebing = x350004_Yuebing(varMap,varPlayer)	
		if yuebing ~= -1 then
			ItemAppendBind( varMap,yuebing, random(2,4) )	
		end		
				
		local varRet = StopItemTask( varMap, varPlayer )
		if varRet > 0 then
			DeliverItemListSendToPlayer(varMap,varPlayer) 
			return 1
		else
			StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y"..x350004_var_QuestName)
				TalkAppendString(varMap,x350004_var_QuestReadme2)
			StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varPlayer, x350004_var_FileId, -1)
			return 0
		end
		
	elseif varFlag == 2 or varFlag == 4 or varFlag == 6 or varFlag == 8 then
		
		StartItemTask( varMap )

		
		local nRandItem,nRandItemNum = x350004_GetRandomBonus()
		if nRandItem ~= -1 then
			ItemAppendBind( varMap,nRandItem, nRandItemNum )	
		end
		
		
		local yuebing = x350004_Yuebing(varMap,varPlayer)	
		if yuebing ~= -1 then
			ItemAppendBind( varMap,yuebing, random(2,4) )	
		end		
		
		local varRet = StopItemTask( varMap, varPlayer )
		if varRet > 0 then
			DeliverItemListSendToPlayer(varMap,varPlayer)
			return 1
		else
			StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y"..x350004_var_QuestName)
				TalkAppendString(varMap,x350004_var_QuestReadme2)
			StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varPlayer, x350004_var_FileId, -1)
			return 0
		end
	end
	
	return 0
	
end







function x350004_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		if x350004_CheckDay( varMap,varPlayer ) == 1 then
			TalkAppendButton(varMap, x350004_var_FileId, x350004_var_QuestName,3,1)
		else 
			return
		end

end









function x350004_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	return 1
end


function x350004_ProcAccept( varMap, varPlayer, varTalknpc )

	x350004_CheckMD( varMap,varPlayer )
	
end









function x350004_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x350004_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x350004_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x350004_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x350004_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x350004_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
