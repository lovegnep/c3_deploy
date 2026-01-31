
x585000_var_FileId          		= 585000
x585000_var_BonusItem		       		= 12030424
x585000_var_CostFee								= 50000	
x585000_var_QuestName       		= "购买冲星大礼包#R(50两现金)"
x585000_var_NoMoney								= "对不起，您的现金不足，无法购买！"
x585000_var_Readme								= "\n\t“#Y冲星大礼包#W”的销售日期是#R12月1日开始至12月7日#W结束。\n\t#R售价：50两现金#W。\n\t在购买期间内，所有用户都只能购买#R一次#W。\n\t冲星大礼包为#R绑定物品#W。使用右键点击后，将获得#G次生钻石矿2个，原生钻石矿1个和神传水晶50个#W。所获得道具均为#R绑定道具#W！"
x585000_var_DateLimit							= {
																		{varY=2009,m=12,d=1},
																		{varY=2009,m=12,d=2},
																		{varY=2009,m=12,d=3},
																		{varY=2009,m=12,d=4},
																		{varY=2009,m=12,d=5},
																		{varY=2009,m=12,d=6},
																		{varY=2009,m=12,d=7},
																	}
x585000_var_GameId								= 2500



																																		
function x585000_CheckDateValid()
	
	local varY,m,d = GetYearMonthDay()
	for varI,item in x585000_var_DateLimit do
		
		if varY == item.varY and m == item.m and d == item.d then
			return 1
		end
		
	end
	
	return 0
	
end




function x585000_GetCurrentWeek()
	
	
	local nCurrentTime = (GetCurrentTime()+8*3600)/86400 - 5  
	local nWeek = floor(nCurrentTime / 7)		 
	
	return nWeek
end




function x585000_GetLastWeek( varMap,varPlayer)
	return GetPlayerGameData(varMap,varPlayer,MD_CUXIAOBAO_12_WEEK[1],MD_CUXIAOBAO_12_WEEK[2],MD_CUXIAOBAO_12_WEEK[3])	
end




function x585000_SetLastWeek( varMap,varPlayer)
	
	
	local nCurWeek = x585000_GetCurrentWeek()
	
	
	if x585000_GetLastWeek(varMap,varPlayer ) ~= nCurWeek then
		
		
		SetPlayerGameData(varMap,varPlayer,MD_CUXIAOBAO_12_WEEK[1],MD_CUXIAOBAO_12_WEEK[2],MD_CUXIAOBAO_12_WEEK[3],nCurWeek)
		
		
		for varI,item in MD_CUXIAOBAO_12_WEEK_DAY do
			SetPlayerGameData(varMap,varPlayer,item[1],item[2],item[3],0)
		end
	end	
end




function x585000_GetLastWeek_WD(varMap,varPlayer)
	
	
	local nWeek = GetWeek()+1
	local item = MD_CUXIAOBAO_12_WEEK_DAY[nWeek]
	return GetPlayerGameData(varMap,varPlayer,item[1],item[2],item[3])
end




function x585000_SetLastWeek_WD(varMap,varPlayer)
	
	
	local nWeek = GetWeek()+1
	local item = MD_CUXIAOBAO_12_WEEK_DAY[nWeek]
	SetPlayerGameData(varMap,varPlayer,item[1],item[2],item[3],1)
end





function x585000_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	if x585000_CheckDateValid() == 0 then
		return
	end
	
	if GetGameOpenById(1028 ) == 0 then
		return
	end

	TalkAppendButton(varMap,x585000_var_FileId,x585000_var_QuestName,3,-1);
	
end



function x585000_PayMoney(varMap,varPlayer,value,OP_Type)

	local nGoldMode = GetGoldMode( varMap,varPlayer )
	
	if nGoldMode == 1 then		
		if CostMoney(varMap, varPlayer, 2, value,OP_Type) == -1 then
			return 0
		end
	
	elseif nGoldMode == 0 then	

			if CostMoney(varMap, varPlayer, 2, value,OP_Type) == -1 then
				return 0

		end
	else
		return 0
	end	
	
	return 1

end




function x585000_IsWeekGive( varMap,varPlayer )
	
	
	local nCurWeek = x585000_GetCurrentWeek()
	
	
	if x585000_GetLastWeek(varMap,varPlayer ) == nCurWeek then
		
		
		for varI,item in MD_CUXIAOBAO_12_WEEK_DAY do
			if GetPlayerGameData(varMap,varPlayer,item[1],item[2],item[3]) == 1 then
				return 1
			end
		end
	end	
	
	
	return 0;
	
end




function x585000_GiveBonus( varMap,varPlayer )

	if x585000_CheckDateValid() == 0 then
		return
	end
	
	if GetGameOpenById( 1028 ) == 0 then
		return
	end


		StartItemTask(varMap)
			ItemAppendBind(varMap,x585000_var_BonusItem,1)	
		local varRet = StopItemTask(varMap,varPlayer)
		if varRet > 0 then
		
			if x585000_PayMoney(varMap,varPlayer,x585000_var_CostFee,308) == 1 then		
		
				StartTalkTask(varMap)
				TalkAppendString(varMap,format("恭喜您获得了礼包道具！扣除了%d两现金！",x585000_var_CostFee/1000))
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				DeliverItemListSendToPlayer(varMap,varPlayer)
				GamePlayScriptLog( varMap, varPlayer, x585000_var_GameId)
				return 1			
			else
				StartTalkTask(varMap,varPlayer)
					TalkAppendString(varMap,x585000_var_NoMoney)	
				StopTalkTask()
				DeliverTalkTips(varMap,varPlayer)
			end		

		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"背包已满，无法得到物品！您需要至少有1个背包空间！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			return 0
		end	


end




function x585000_ProcEventEntry( varMap, varPlayer, varTalknpc,varScript,idExt )

		if x585000_CheckDateValid() == 0 then
			return
		end

		
		StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..x585000_var_QuestName)
		TalkAppendString(varMap,x585000_var_Readme);
		AddQuestItemBonus(varMap, x585000_var_BonusItem, 1)
	  StopTalkTask(varMap)
		DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x585000_var_FileId, x585000_var_FileId);
		return	
end




function x585000_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end




function x585000_ProcAccept( varMap, varPlayer )
	
	if x585000_CheckDateValid() == 0 then
		return
	end
	
	if GetGameOpenById(1028 ) == 0 then
		return
	end
	
	
	local nCurWeek = x585000_GetCurrentWeek()
	local nLastWeek = x585000_GetLastWeek(varMap,varPlayer )
	local nWeekDay = GetWeek() + 1
	
	if nCurWeek == nLastWeek then
		
		
		
		if x585000_GetLastWeek_WD(varMap,varPlayer ) == 1 or x585000_IsWeekGive( varMap,varPlayer ) == 1 then
			
			
			StartTalkTask(varMap)
			TalkAppendString(varMap,"您已经购买了本周礼包，无法进行多次购买！");			
		    StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			return	
		else
			
			if x585000_GiveBonus( varMap,varPlayer ) == 1 then
				x585000_SetLastWeek_WD(varMap,varPlayer)
			end
			
			return
		end
		
		
		
	elseif nCurWeek > nLastWeek then
		
		
		
		if x585000_GiveBonus( varMap,varPlayer ) == 1 then
			x585000_SetLastWeek(varMap,varPlayer)
			x585000_SetLastWeek_WD(varMap,varPlayer)
		end
		
		return
		
	else
		return
	end
end




function x585000_ProcQuestAbandon( varMap, varPlayer, varQuest )
end




function x585000_ProcContinue( varMap, varPlayer, varTalknpc )
end




function x585000_CheckSubmit( varMap, varPlayer )
end




function x585000_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end




function x585000_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end




function x585000_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x585000_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
