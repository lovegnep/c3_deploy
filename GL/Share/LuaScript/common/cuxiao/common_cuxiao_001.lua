
x585001_var_FileId          		= 585001
x585001_var_BonusItem		       		= 12030425
x585001_var_CostFee								= 55000	
x585001_var_QuestName       		= "购买星紫大礼包#R(55两现金)"
x585001_var_NoMoney								= "对不起，您的现金不足，无法购买！"
x585001_var_Readme								= "\n\t“#Y星紫大礼包#W”的销售日期是#R12月8日开始至12月14日#W结束。\n\t#R售价：55两现金#W。\n\t在购买期间内，所有用户都只能购买#R一次#W。\n\t星紫大礼包为#R绑定物品#W。使用右键点击后，将获得#G钻石原石4个和紫檀木炭20个#W。所获得道具均为#R绑定道具#W！"
x585001_var_DateLimit							= {
																		{varY=2009,m=12,d=8},
																		{varY=2009,m=12,d=9},
																		{varY=2009,m=12,d=10},
																		{varY=2009,m=12,d=11},
																		{varY=2009,m=12,d=12},
																		{varY=2009,m=12,d=13},
																		{varY=2009,m=12,d=14},
																	}
x585001_var_GameId								= 2500



																																		
function x585001_CheckDateValid()
	
	local varY,m,d = GetYearMonthDay()
	for varI,item in x585001_var_DateLimit do
		
		if varY == item.varY and m == item.m and d == item.d then
			return 1
		end
		
	end
	
	return 0
	
end




function x585001_GetCurrentWeek()
	
	
	local nCurrentTime = (GetCurrentTime()+8*3600)/86400 - 5  
	local nWeek = floor(nCurrentTime / 7)		 
	
	return nWeek
end




function x585001_GetLastWeek( varMap,varPlayer)
	return GetPlayerGameData(varMap,varPlayer,MD_CUXIAOBAO_12_WEEK[1],MD_CUXIAOBAO_12_WEEK[2],MD_CUXIAOBAO_12_WEEK[3])	
end




function x585001_SetLastWeek( varMap,varPlayer)
	
	
	local nCurWeek = x585001_GetCurrentWeek()
	
	
	if x585001_GetLastWeek(varMap,varPlayer ) ~= nCurWeek then
		
		
		SetPlayerGameData(varMap,varPlayer,MD_CUXIAOBAO_12_WEEK[1],MD_CUXIAOBAO_12_WEEK[2],MD_CUXIAOBAO_12_WEEK[3],nCurWeek)
		
		
		for varI,item in MD_CUXIAOBAO_12_WEEK_DAY do
			SetPlayerGameData(varMap,varPlayer,item[1],item[2],item[3],0)
		end
	end	
end




function x585001_GetLastWeek_WD(varMap,varPlayer)
	
	
	local nWeek = GetWeek()+1
	local item = MD_CUXIAOBAO_12_WEEK_DAY[nWeek]
	return GetPlayerGameData(varMap,varPlayer,item[1],item[2],item[3])
end




function x585001_SetLastWeek_WD(varMap,varPlayer)
	
	
	local nWeek = GetWeek()+1
	local item = MD_CUXIAOBAO_12_WEEK_DAY[nWeek]
	SetPlayerGameData(varMap,varPlayer,item[1],item[2],item[3],1)
end





function x585001_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	if x585001_CheckDateValid() == 0 then
		return
	end
	
	if GetGameOpenById(1028 ) == 0 then
		return
	end

	TalkAppendButton(varMap,x585001_var_FileId,x585001_var_QuestName,3,-1);
	
end



function x585001_PayMoney(varMap,varPlayer,value,OP_Type)

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




function x585001_IsWeekGive( varMap,varPlayer )
	
	
	local nCurWeek = x585001_GetCurrentWeek()
	
	
	if x585001_GetLastWeek(varMap,varPlayer ) == nCurWeek then
		
		
		for varI,item in MD_CUXIAOBAO_12_WEEK_DAY do
			if GetPlayerGameData(varMap,varPlayer,item[1],item[2],item[3]) == 1 then
				return 1
			end
		end
	end	
	
	
	return 0;
	
end




function x585001_GiveBonus( varMap,varPlayer )

	if x585001_CheckDateValid() == 0 then
		return
	end
	
	if GetGameOpenById( 1028 ) == 0 then
		return
	end


		StartItemTask(varMap)
			ItemAppendBind(varMap,x585001_var_BonusItem,1)	
		local varRet = StopItemTask(varMap,varPlayer)
		if varRet > 0 then
		
			if x585001_PayMoney(varMap,varPlayer,x585001_var_CostFee,308) == 1 then		
		
				StartTalkTask(varMap)
				TalkAppendString(varMap,format("恭喜您获得了礼包道具！扣除了%d两现金！",x585001_var_CostFee/1000))
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				DeliverItemListSendToPlayer(varMap,varPlayer)
				GamePlayScriptLog( varMap, varPlayer, x585001_var_GameId)
				return 1			
			else
				StartTalkTask(varMap,varPlayer)
					TalkAppendString(varMap,x585001_var_NoMoney)	
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




function x585001_ProcEventEntry( varMap, varPlayer, varTalknpc,varScript,idExt )

		if x585001_CheckDateValid() == 0 then
			return
		end

		
		StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..x585001_var_QuestName)
		TalkAppendString(varMap,x585001_var_Readme);
		AddQuestItemBonus(varMap, x585001_var_BonusItem, 1)
	  StopTalkTask(varMap)
		DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x585001_var_FileId, x585001_var_FileId);
		return	
end




function x585001_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end




function x585001_ProcAccept( varMap, varPlayer )
	
	if x585001_CheckDateValid() == 0 then
		return
	end
	
	if GetGameOpenById(1028 ) == 0 then
		return
	end
	
	
	local nCurWeek = x585001_GetCurrentWeek()
	local nLastWeek = x585001_GetLastWeek(varMap,varPlayer )
	
	if nCurWeek == nLastWeek then
		
		
		
		if x585001_GetLastWeek_WD(varMap,varPlayer ) == 1 or x585001_IsWeekGive( varMap,varPlayer ) == 1 then
			
			
			StartTalkTask(varMap)
			TalkAppendString(varMap,"您已经购买了本周礼包，无法进行多次购买！");			
		    StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			return	
		else
			
			
			if x585001_GiveBonus( varMap,varPlayer ) == 1 then
				x585001_SetLastWeek_WD(varMap,varPlayer)
			end
			
			return
		end
		
		
		
	elseif nCurWeek > nLastWeek then
		
		
		
		if x585001_GiveBonus( varMap,varPlayer ) == 1 then
			x585001_SetLastWeek(varMap,varPlayer)
			x585001_SetLastWeek_WD(varMap,varPlayer)
		end
		
		return
		
	else
		return
	end
end




function x585001_ProcQuestAbandon( varMap, varPlayer, varQuest )
end




function x585001_ProcContinue( varMap, varPlayer, varTalknpc )
end




function x585001_CheckSubmit( varMap, varPlayer )
end




function x585001_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end




function x585001_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end




function x585001_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x585001_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
