
x205011_var_FileId = 205011
x205011_var_QuestName ="【活动】购买超值促销礼包"
x205011_var_NoMoney								= "对不起，您的现金不足，无法购买！"
x205011_var_DateLimit							= {
																		{ minday = 221, maxday = 234, itemid = 12500319, nmoney = 15000, vartext = "\n\t8月09日-8月22日，玩家可在王城[领奖大使]梅伊娜处，消费#R15两#W现金获得#G不求人黄金礼盒#W。\n\t亲爱的玩家，可别错过机会哦。心动不如行动，快来速速抢购吧！"},
																		{ minday = 235, maxday = 248, itemid = 12500324, nmoney = 15000, vartext = "\n\t8月23日-9月05日，玩家可在王城[领奖大使]梅伊娜处，消费#R15两#W现金获得#G至尊炫风黄金礼盒#W。\n\t亲爱的玩家，可别错过机会哦。心动不如行动，快来速速抢购吧！"},
																		{ minday = 249, maxday = 262, itemid = 12031049, nmoney = 15000, vartext = "\n\t9月06日-9月19日，玩家可在王城[领奖大使]梅伊娜处，消费#R15两#W现金获得#G黄金联盟百宝囊#W。\n\t亲爱的玩家，可别错过机会哦。心动不如行动，快来速速抢购吧！"},
																		{ minday = 263, maxday = 276, itemid = 12031052, nmoney = 15000, vartext = "\n\t9月20日-10月3日，玩家可在王城[领奖大使]梅伊娜处，消费#R15两#W现金获得#G大元盛世礼盒#W。\n\t亲爱的玩家，可别错过机会哦。心动不如行动，快来速速抢购吧！"},
																	}
x205011_var_SecondPageButton ={
																{Name="购买%d份礼包", Num=1 },
																{Name="购买%d份礼包", Num=10},
																{Name="购买%d份礼包", Num=50},
															}
x205011_var_Description ="\n\t您选择了购买%d份@item_%d#W，需要消耗现金#{_MONEY%d}。\n \n\t您确定现在就要购买么？"	
x205011_var_ClickIndex ={}																													

--日期段判断
function x205011_GetDate()
	
	local year, month, day = GetYearMonthDay();
	local varToday = GetDayOfYear() 
		for varI,item in x205011_var_DateLimit do		
		if year == 2012 and varToday >= item.minday and varToday <= item.maxday then
				return item.itemid, item.nmoney, item.vartext			
			end
		end
	return 0
end

--支付函数
function x205011_PayMoney(varMap,varPlayer,value)

	local nGoldMode = GetGoldMode( varMap,varPlayer )
	
	if nGoldMode == 1 then		
		if CostMoney(varMap, varPlayer, 2, value) == -1 then
			return 0
		end	
	elseif nGoldMode == 0 then	
		if CostMoney(varMap, varPlayer, 2, value) == -1 then
			return 0
		end
	end
	return 1
	
end

function x205011_GiveBonus( varMap,varPlayer, SelectId)
		local varToday = GetDayOfYear()
		local varitem,varnmoney =	x205011_GetDate()
		varnmoney = varnmoney * x205011_var_SecondPageButton[SelectId].Num
		varNum = x205011_var_SecondPageButton[SelectId].Num
		StartItemTask(varMap)
			ItemAppendBind(varMap,varitem,varNum)	
		local varRet = StopItemTask(varMap,varPlayer)
		if varRet > 0 then
		
			if x205011_PayMoney(varMap,varPlayer,varnmoney) == 1 then		
		
				StartTalkTask(varMap)
				TalkAppendString(varMap,format("恭喜您获得了礼包道具！扣除了#{_MONEY%d}现金！",varnmoney))
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				DeliverItemListSendToPlayer(varMap,varPlayer)
				GamePlayScriptLog( varMap, varPlayer, 2004+SelectId)
				return 1			
			else
				StartTalkTask(varMap,varPlayer)
					TalkAppendString(varMap,x205011_var_NoMoney)	
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




function x205011_ProcEventEntry(varMap, varPlayer, varTalknpc, varScripId , SelectId)
	

	local varitem,varnmoney,vartext =	x205011_GetDate()
	
	
		if x205011_GetDate()  == 0 then
			Msg2Player(varMap,varPlayer,"不在活动时间内！",8,3)
			return
		end
		if SelectId == -1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x205011_var_QuestName)
			TalkAppendString(varMap,vartext);
			for i, item in x205011_var_SecondPageButton do
				TalkAppendButton(varMap, x205011_var_FileId, format(item.Name,item.Num),3, i)
			end
			StopTalkTask(varMap)
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		elseif SelectId >=1 and SelectId <= getn(x205011_var_SecondPageButton) then
			x205011_var_ClickIndex[GetGUID(varMap, varPlayer)]= SelectId
			StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x205011_var_QuestName)
			TalkAppendString(varMap,format(x205011_var_Description,x205011_var_SecondPageButton[SelectId].Num, varitem, varnmoney*x205011_var_SecondPageButton[SelectId].Num))
			AddQuestItemBonus(varMap, varitem, x205011_var_SecondPageButton[SelectId].Num)  
			StopTalkTask(varMap)
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x205011_var_FileId, x205011_var_FileId);
		end
		
end

function x205011_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		if x205011_GetDate()  == 0 then
			return
		end
		TalkAppendButton(varMap, x205011_var_FileId, x205011_var_QuestName,3, -1)
end


function x205011_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
    return 1
end

function x205011_ProcAccept(varMap, varPlayer)
	local SelectId =x205011_var_ClickIndex[GetGUID(varMap, varPlayer)]
	if (SelectId < 1) or (SelectId >getn(x205011_var_SecondPageButton)) then
		return
	end
	if x205011_GetDate()  == 0 then
		Msg2Player(varMap,varPlayer,"不在活动时间内！",8,3)
		return
	end
  if x205011_GiveBonus( varMap,varPlayer, SelectId) == 1 then
  	Msg2Player(varMap,varPlayer,"支付完成!",8,3)
  end                                     		              
end

function x205011_ProcQuestAbandon(varMap, varPlayer, varQuest)

end

function x205011_CheckSubmit( varMap, varPlayer, varTalknpc)

end

function x205011_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end

function x205011_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end

function x205011_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end

function x205011_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
