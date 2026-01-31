

x300627_var_GatherPointTypeId = 128 		
x300627_var_MinLimitLevel = 40   	
x300627_var_ItemId = 13011006 	
x300627_var_ItemCount = 1	     	
		
x300627_var_QuestId = 7034

x300627_var_CountryDunhuang = 376 
x300627_var_CountryLoulan = 76
x300627_var_CountryKunlun = 276
x300627_var_CountryLaiyin = 176

x300627_var_QuestId1 = 7661
x300627_var_QuestId2 = 7652
x300627_var_QuestId3 = 7658
x300627_var_QuestId4 = 7655

x300627_var_QuestId5 = 7673
x300627_var_QuestId6 = 7664
x300627_var_QuestId7 = 7670
x300627_var_QuestId8 = 7667

x300627_var_QuestId9 = 7580
x300627_var_QuestId10 = 7562
x300627_var_QuestId11 = 7574
x300627_var_QuestId12 = 7568

x300627_var_QuestId13 = 7685
x300627_var_QuestId14 = 7676
x300627_var_QuestId15 = 7682
x300627_var_QuestId16 = 7679


function 	x300627_ProcGpCreate(varMap,varGpType,varX,varY)
	SetGrowPointCurrSeedNum( varMap, varGpType, 201 )
	local varBoxId = ItemBoxEnterScene(varX, varY, x300627_var_GatherPointTypeId, varMap, 0, x300627_var_ItemId)
end




function	 x300627_ProcGpOpen(varMap,varPlayer,varTalknpc)
	
    return x300627_ProcGpOpenItemBox(varMap, varPlayer, varTalknpc, x300627_var_GatherPointTypeId, x300627_var_ItemId)	
end




function	 x300627_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return   x300627_ProcGuildRecycle( varMap, varPlayer, varTalknpc, x300627_var_GatherPointTypeId, x300627_var_ItemId )
end





function	x300627_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	
end




function	x300627_OpenCheck(varMap,varPlayer,AbilityId,AblityLevel)
	
end





function x300627_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	local varQuest = -1
	if IsHaveQuestNM( varMap, varPlayer, x300627_var_QuestId1 ) > 0 then
		varQuest = x300627_var_QuestId1
	end	

	if IsHaveQuestNM( varMap, varPlayer, x300627_var_QuestId2 ) > 0 then
		varQuest = x300627_var_QuestId2
	end	

	if IsHaveQuestNM( varMap, varPlayer, x300627_var_QuestId3 ) > 0 then
		varQuest = x300627_var_QuestId3
	end	
	
	if IsHaveQuestNM( varMap, varPlayer, x300627_var_QuestId4 ) > 0 then
		varQuest = x300627_var_QuestId4
	end	
	
	if IsHaveQuestNM( varMap, varPlayer, x300627_var_QuestId5 ) > 0 then
		varQuest = x300627_var_QuestId5
	end	
	
	if IsHaveQuestNM( varMap, varPlayer, x300627_var_QuestId6 ) > 0 then
		varQuest = x300627_var_QuestId6
	end	
	
	if IsHaveQuestNM( varMap, varPlayer, x300627_var_QuestId7 ) > 0 then
		varQuest = x300627_var_QuestId7
	end	
	
	if IsHaveQuestNM( varMap, varPlayer, x300627_var_QuestId8 ) > 0 then
		varQuest = x300627_var_QuestId8
	end	
	
	if IsHaveQuestNM( varMap, varPlayer, x300627_var_QuestId9 ) > 0 then
		varQuest = x300627_var_QuestId9
	end	
	
	if IsHaveQuestNM( varMap, varPlayer, x300627_var_QuestId10 ) > 0 then
		varQuest = x300627_var_QuestId10
	end	
	
	if IsHaveQuestNM( varMap, varPlayer, x300627_var_QuestId11 ) > 0 then
		varQuest = x300627_var_QuestId11
	end	
	
	if IsHaveQuestNM( varMap, varPlayer, x300627_var_QuestId12 ) > 0 then
		varQuest = x300627_var_QuestId12
	end	
	
	if IsHaveQuestNM( varMap, varPlayer, x300627_var_QuestId13 ) > 0 then
		varQuest = x300627_var_QuestId13
	end	
	
	if IsHaveQuestNM( varMap, varPlayer, x300627_var_QuestId14 ) > 0 then
		varQuest = x300627_var_QuestId14
	end	
	
	if IsHaveQuestNM( varMap, varPlayer, x300627_var_QuestId15 ) > 0 then
		varQuest = x300627_var_QuestId15
	end	
	
	if IsHaveQuestNM( varMap, varPlayer, x300627_var_QuestId16 ) > 0 then
		varQuest = x300627_var_QuestId16
	end	

	if varQuest == -1 then
		return 1
	end

	if x300627_CountryCheck( varMap, varPlayer, varQuest ) < 0 then
		return 1
	end
	
	if GetItemCount( varMap, varPlayer, x300627_var_ItemId ) > 0 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"您已经获得情报了,赶快去回复任务吧！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,"您已经获得情报了,赶快去回复任务吧！",8,2)
		
		return 1
	end
	 
	
	
		
		
	

	if GetLevel(varMap, varPlayer) < x300627_var_MinLimitLevel then  		
		StartTalkTask(varMap)
		TalkAppendString(varMap,"您还没到45级")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 1
	end

	return 0
end


function x300627_ProcGuildRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
  	
	local varQuest = -1
	if IsHaveQuestNM( varMap, varPlayer, x300627_var_QuestId1 ) > 0 then
		varQuest = x300627_var_QuestId1
	end	

	if IsHaveQuestNM( varMap, varPlayer, x300627_var_QuestId2 ) > 0 then
		varQuest = x300627_var_QuestId2
	end	

	if IsHaveQuestNM( varMap, varPlayer, x300627_var_QuestId3 ) > 0 then
		varQuest = x300627_var_QuestId3
	end	

	if IsHaveQuestNM( varMap, varPlayer, x300627_var_QuestId4 ) > 0 then
		varQuest = x300627_var_QuestId4
	end	
	
	if IsHaveQuestNM( varMap, varPlayer, x300627_var_QuestId5 ) > 0 then
		varQuest = x300627_var_QuestId5
	end	
	
	if IsHaveQuestNM( varMap, varPlayer, x300627_var_QuestId6 ) > 0 then
		varQuest = x300627_var_QuestId6
	end	
	
	if IsHaveQuestNM( varMap, varPlayer, x300627_var_QuestId7 ) > 0 then
		varQuest = x300627_var_QuestId7
	end	
	
	if IsHaveQuestNM( varMap, varPlayer, x300627_var_QuestId8 ) > 0 then
		varQuest = x300627_var_QuestId8
	end	
	
	if IsHaveQuestNM( varMap, varPlayer, x300627_var_QuestId9 ) > 0 then
		varQuest = x300627_var_QuestId9
	end	
	
	if IsHaveQuestNM( varMap, varPlayer, x300627_var_QuestId10 ) > 0 then
		varQuest = x300627_var_QuestId10
	end	
	
	if IsHaveQuestNM( varMap, varPlayer, x300627_var_QuestId11 ) > 0 then
		varQuest = x300627_var_QuestId11
	end	
	
	if IsHaveQuestNM( varMap, varPlayer, x300627_var_QuestId12 ) > 0 then
		varQuest = x300627_var_QuestId12
	end	
	
	if IsHaveQuestNM( varMap, varPlayer, x300627_var_QuestId13 ) > 0 then
		varQuest = x300627_var_QuestId13
	end	
	
	if IsHaveQuestNM( varMap, varPlayer, x300627_var_QuestId14 ) > 0 then
		varQuest = x300627_var_QuestId14
	end	
	
	if IsHaveQuestNM( varMap, varPlayer, x300627_var_QuestId15 ) > 0 then
		varQuest = x300627_var_QuestId15
	end	
	
	if IsHaveQuestNM( varMap, varPlayer, x300627_var_QuestId16 ) > 0 then
		varQuest = x300627_var_QuestId16
	end	
	


	if varQuest == -1 then
		return 1
	end

	local varSeedNum = GetGrowPointCurrSeedNum(varMap, varGpType)
		
	if varSeedNum <= 1 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"密报已经被洗劫一空")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 0
	end

  	local varItemCountNow = GetItemCount( varMap, varPlayer, varNeedItem )
	if varItemCountNow >= x300627_var_ItemCount then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"已经获得密报了，快去交吧")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 0
	end


	
	local varItemAdd = 1

	StartItemTask( varMap )
	ItemAppend( varMap, varNeedItem, varItemAdd )
	local varRet = StopItemTask( varMap, varPlayer )
	if varRet > 0 then
		
		DeliverItemListSendToPlayer(varMap,varPlayer)
		StartTalkTask(varMap)
		TalkAppendString(varMap,"您获得了密报：1/1")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)	
		LuaCallNoclosure( 300733, "ProcGetTargetItem", varMap, varPlayer,varQuest )
		return 1
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"无法得到密报，请整理道具栏！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 0
	end
	
end

function x300627_CountryCheck( varMap, varPlayer, varQuest )
	if varQuest == x300627_var_QuestId1 then
		if varMap == x300627_var_CountryDunhuang then
			return 1
		end
	elseif varQuest == x300627_var_QuestId2 then
		if varMap == x300627_var_CountryLoulan then
			return 1
		end
	elseif varQuest == x300627_var_QuestId3 then
		if varMap == x300627_var_CountryKunlun then
			return 1
		end
	elseif varQuest == x300627_var_QuestId4 then
		if varMap == x300627_var_CountryLaiyin then
			return 1
		end
	end
	
	if varQuest == x300627_var_QuestId5 then
		if varMap == x300627_var_CountryDunhuang then
			return 1
		end
	elseif varQuest == x300627_var_QuestId6 then
		if varMap == x300627_var_CountryLoulan then
			return 1
		end
	elseif varQuest == x300627_var_QuestId7 then
		if varMap == x300627_var_CountryKunlun then
			return 1
		end
	elseif varQuest == x300627_var_QuestId8 then
		if varMap == x300627_var_CountryLaiyin then
			return 1
		end
	end
	
	if varQuest == x300627_var_QuestId9 then
		if varMap == x300627_var_CountryDunhuang then
			return 1
		end
	elseif varQuest == x300627_var_QuestId10 then
		if varMap == x300627_var_CountryLoulan then
			return 1
		end
	elseif varQuest == x300627_var_QuestId11 then
		if varMap == x300627_var_CountryKunlun then
			return 1
		end
	elseif varQuest == x300627_var_QuestId12 then
		if varMap == x300627_var_CountryLaiyin then
			return 1
		end
	end
	
	if varQuest == x300627_var_QuestId13 then
		if varMap == x300627_var_CountryDunhuang then
			return 1
		end
	elseif varQuest == x300627_var_QuestId14 then
		if varMap == x300627_var_CountryLoulan then
			return 1
		end
	elseif varQuest == x300627_var_QuestId15 then
		if varMap == x300627_var_CountryKunlun then
			return 1
		end
	elseif varQuest == x300627_var_QuestId16 then
		if varMap == x300627_var_CountryLaiyin then
			return 1
		end
	end
	return -1
end



