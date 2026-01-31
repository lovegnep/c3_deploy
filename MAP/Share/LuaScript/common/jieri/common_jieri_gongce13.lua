

x350012_var_FileId = 350012
x350012_var_QuestName = "领取年底分红"
x350012_var_QuestDay = {	{ day=1218,min = 1200,	max = 1320,	varFlag=1},
													{ day=1225,min = 1200,	max = 1320,	varFlag=2},
													{ day=0101,min = 1200,	max = 1320,	varFlag=3}
												}
x350012_var_QuestDayTest = {	{ day=1218,min = 1200,	max = 1320,	varFlag=1},
													{ day=1225,min = 1200,	max = 1320,	varFlag=2},
													{ day=0101,min = 1200,	max = 1320,	varFlag=3}
												}
x350012_var_QuestReadme = "\t《成吉思汗：刺陵》资料片于2009年12月18日公开测试，感谢您能够长久如一日地支持《成吉思汗3 恶狼传说》，您的忠诚让我们感动，值此新资料片公测之际，带有10元金卡的刺陵大红包仅代表我们的一点心意，为您的游戏之旅带来更多好运！\n\t12月18日晚间8点至10点阶段您可以在新手村和王国领奖大使处领取“#R年底分红#W”。\n\t届时所有#R60级#W以上的玩家都可以获得年底分红金卡红包！请您准时领取。"
x350012_var_QuestReadme1 = "\t《成吉思汗：刺陵》资料片于2009年12月18日公开测试，感谢您能够长久如一日地支持《成吉思汗3 恶狼传说》，您的忠诚让我们感动，值此新资料片公测之际，带有10元金卡的刺陵大红包仅代表我们的一点心意，为您的游戏之旅带来更多好运！\n\t12月18日晚间8点至10点阶段您可以在新手村和王国领奖大使处领取“#R年底分红#W”。\n\t届时所有WR60级#W以上的玩家都可以获得年底分红金卡红包！请您准时领取。"
x350012_var_QuestReadme2 = "\t晚间8点至10点阶段您可以在新手村和王国领奖大使处领取“#R年底分红#W”。\n\t届时所有#R60级#W以上的玩家都可以获得年底分红金卡红包！请您准时领取。"
x350012_var_QuestReadme3 = "\t您已经领取了今天的年底分红大红包！\n\t年底分红在当天#G20:00#W至#G22:00#W间领取，您将直接获得#R红包内的金卡分红#W！请您准时领取。"
x350012_var_LevelMin				= 60




x350012_var_MD					= MD_FENHONG


function x350012_CheckDayValid( varMap,varPlayer)

	local year,month,day = GetYearMonthDay()
	local nTime =GetMinOfDay()
	local nDay = month*100+day
	local nLevel = GetLevel(varMap,varPlayer)

	if GetTestServerToggle() == 1 then	
		if nLevel >= x350012_var_LevelMin then			
			for varI,item in x350012_var_QuestDayTest do
				if nDay == item.day and nTime >= item.min and nTime <= item.max then 
					return item.varFlag
				end
			end	
		end
	else	
		if nLevel >= x350012_var_LevelMin then			
			for varI,item in x350012_var_QuestDay do
				if nDay == item.day and nTime >= item.min and nTime <= item.max then 
					return item.varFlag
				end
			end	
		end
	end








		
	return 0
	
end

function x350012_CheckHaveGetBonus( varMap,varPlayer,varFlag )

	local year,month,day = GetYearMonthDay()
	local nTime =GetMinOfDay()
	
	local nMD ={}
	for varI,item in x350012_var_MD do
		nMD[varI] = GetPlayerGameData(varMap,varPlayer,item[1],item[2],item[3])
	end
	
	return nMD[varFlag]
	
end







function x350012_ProcEventEntry(varMap, varPlayer, varTalknpc)	

	
	local varIndex = x350012_CheckDayValid( varMap,varPlayer )

	if varIndex >= 1 then
			
		local	strInfo1 = x350012_var_QuestReadme
		local	strInfo2 = "\t逢圣诞之际，大家与亲朋好友共用节日的快乐，与兄弟姐妹一起尽情享受《成吉思汗：刺陵》给我们带来的无限欢乐！\n\t回首过去，您为《成吉思汗3 恶狼传说》付出了很多很多，也为属国建立了无数功勋。这些点点滴滴都被我们牢记于心，带有20元金卡的圣诞大红包送给您，感谢您对我们的支持和鼓励！\n\t#G12月25日晚间8点至10点阶段#W您可以在新手村和王国领奖大使处领取“#R年底分红#W”。\n\t届时所有#R60级#W以上的玩家都可以获得年底分红金卡红包！请您准时领取。"
		local strInfo3 = "\t元旦历来是中国的传统节日，在爆竹与烟花、恭喜与贺喜的喜庆气氛中，我们共同迎接《成吉思汗3 恶狼传说》创造的更大辉煌！\n\t光阴茬苒，我们迎来新的一年！在您伴随《成吉思汗3 恶狼传说》共同成长的数百个日夜里，我们感受到了您对她深切的爱意，这个满怀感激的带有30元金卡的元旦大红包助您在来年继续加油，勇攀巅峰！\n\t1月1日晚间8点至10点阶段您可以在新手村和王国领奖大使处领取“#R年底分红#W”。\n\t届时所有#R60级#W以上的玩家都可以获得年底分红金卡红包！请您准时领取。"
		
		if x350012_CheckHaveGetBonus( varMap,varPlayer,varIndex) == 0 then
			if GetTestServerToggle() == 1 then
				
				if varIndex == 1 then
					StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x350012_var_QuestName)
						TalkAppendString(varMap,x350012_var_QuestReadme)
					StopTalkTask()
					DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x350012_var_FileId, x350012_var_FileId)				
				elseif varIndex == 2 then
					StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x350012_var_QuestName)
						TalkAppendString(varMap,strInfo2)
					StopTalkTask()
					DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x350012_var_FileId, x350012_var_FileId)					
				elseif varIndex == 3 then
					StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x350012_var_QuestName)
						TalkAppendString(varMap,strInfo3)
					StopTalkTask()
					DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x350012_var_FileId, x350012_var_FileId)					
				end
			
			else
				
				if varIndex == 1 then
				StartTalkTask(varMap)
					TalkAppendString(varMap,"#Y"..x350012_var_QuestName)
					TalkAppendString(varMap,x350012_var_QuestReadme)
				StopTalkTask()
				DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x350012_var_FileId, x350012_var_FileId)						
				elseif varIndex == 2 then
				StartTalkTask(varMap)
					TalkAppendString(varMap,"#Y"..x350012_var_QuestName)
					TalkAppendString(varMap,strInfo2)
				StopTalkTask()
				DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x350012_var_FileId, x350012_var_FileId)						
				elseif varIndex == 3 then
				StartTalkTask(varMap)
					TalkAppendString(varMap,"#Y"..x350012_var_QuestName)
					TalkAppendString(varMap,strInfo3)
				StopTalkTask()
				DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x350012_var_FileId, x350012_var_FileId)						
				end
				
	
			end
			
			return
			 		
		else
				
			
			StartTalkTask(varMap)
				TalkAppendString(varMap,x350012_var_QuestReadme3)
			StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
			
			return
				
		end
		
	end


	
	StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..x350012_var_QuestName)
		TalkAppendString(varMap,x350012_var_QuestReadme2)
	StopTalkTask()
	DeliverTalkMenu(varMap, varPlayer, varTalknpc)
	
end







function x350012_CheckMD( varMap,varPlayer )

	local varIndex = x350012_CheckDayValid( varMap,varPlayer )

	if varIndex < 1 then
		return		
	end

	local year,month,day = GetYearMonthDay()
	local nTime =GetMinOfDay()
	
	local nMD ={}
	for varI,item in x350012_var_MD do
		nMD[varI] = GetPlayerGameData(varMap,varPlayer,item[1],item[2],item[3])
	end
	
	local nDay = month*100+day
	
	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= x350012_var_LevelMin then

	if GetTestServerToggle() == 1 then
		for varI,item in x350012_var_QuestDayTest do
			if item.day == nDay and nTime >= item.min and nTime <= item.max and nMD[item.varFlag]==0 then
				if x350012_GiveBonus(varMap,varPlayer,item.varFlag) == 1 then
					SetPlayerGameData(varMap,varPlayer,x350012_var_MD[item.varFlag][1],x350012_var_MD[item.varFlag][2],x350012_var_MD[item.varFlag][3],1)
					return
				end
			end
		end
	else
		for varI,item in x350012_var_QuestDay do
			if item.day == nDay and nTime >= item.min and nTime <= item.max and nMD[item.varFlag]==0 then
				if x350012_GiveBonus(varMap,varPlayer,item.varFlag) == 1 then
					SetPlayerGameData(varMap,varPlayer,x350012_var_MD[item.varFlag][1],x350012_var_MD[item.varFlag][2],x350012_var_MD[item.varFlag][3],1)
					return
				end
			end
		end
	end
	
	








	end
	
end







function x350012_CheckDay( varMap,varPlayer )

	local year,month,day = GetYearMonthDay()
	local nDay = month*100+day

	if GetTestServerToggle() == 1 then
		for varI,item in x350012_var_QuestDayTest do
			if item.day == nDay then
				return 1
			end
		end
	else
		for varI,item in x350012_var_QuestDay do
			if item.day == nDay then
				return 1
			end
		end
	end
	





	
	return 0

end







function x350012_GiveBonus( varMap,varPlayer,varFlag)

	if varFlag == 1 then
		
		AddMoney( varMap, varPlayer, 3, 10000,101)	
		Msg2Player( varMap, varPlayer, "恭喜您获得刺陵资料片大红包金卡10两！", 8, 3)
		return 1
				
	elseif varFlag == 2 then
		
		AddMoney( varMap, varPlayer, 3, 20000,101)	
		Msg2Player( varMap, varPlayer, "恭喜您获得圣诞大红包金卡20两！", 8, 3)
		return 1
	elseif varFlag == 3 then
		
		AddMoney( varMap, varPlayer, 3, 30000,101)	
		Msg2Player( varMap, varPlayer, "恭喜您获得元旦大红包金卡30两！", 8, 3)
		return 1			

	end
	
	return 0
	
end







function x350012_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		if x350012_CheckDay( varMap,varPlayer ) == 1 then
			TalkAppendButton(varMap, x350012_var_FileId, x350012_var_QuestName,3,1)
		else 
			return
		end

end









function x350012_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	return 1
end


function x350012_ProcAccept( varMap, varPlayer, varTalknpc )

	x350012_CheckMD( varMap,varPlayer )
	
end









function x350012_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x350012_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x350012_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x350012_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x350012_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x350012_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
