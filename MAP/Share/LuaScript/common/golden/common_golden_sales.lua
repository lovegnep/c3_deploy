
x800054_var_FileId = 800054
x800054_var_QuestName = "寄售现金"


function x800054_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	TalkAppendButton(varMap,x800054_var_FileId,x800054_var_QuestName,0,-1)
	
end




function x800054_ProcEventEntry( varMap, varPlayer, varTalknpc,varState,varIndex )	

	if GetMergeDBToggle() == 1 then
		local text = "为配合并服，现金寄售暂时关闭，并服完成后即可正常使用"
		StartTalkTask(varMap)
		TalkAppendString(varMap,text );
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,text,8,2)
		return 	
	end
	
	if GetUpdateDBBeforeToggle() == 1 then
		local text = "为配合资料库升级，现金寄售暂时关闭，升级完成后即可正常使用"
		StartTalkTask(varMap)
		TalkAppendString(varMap,text );
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,text,8,2)
		return 	
	end
	
	if GetWorldGoldShopToggle() == 0 then
		local text = "现金寄售模块已关闭"
		StartTalkTask(varMap)
		TalkAppendString(varMap,text );
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,text,8,2)
		return 	
	end
	
	
	OpenWorldShopSell(varMap, varPlayer,0)
	
end



function x800054_ProcIsCanSell( varMap, varPlayer,shopId )
	
	if IsInLoginProtectTime(varMap, varPlayer) == 1 then
		local text = "你还处于安全保护时间内，不能这样做！"
		StartTalkTask(varMap)
		TalkAppendString(varMap,text );
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,text,8,2)
		return 	0
	end

	if GetMergeDBToggle() == 1 then
		local text = "为配合并服，现金寄售暂时关闭，并服完成后即可正常使用"
		StartTalkTask(varMap)
		TalkAppendString(varMap,text );
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,text,8,2)
		return 	0
	end
	
	if GetUpdateDBBeforeToggle() == 1 then
		local text = "为配合资料库升级，现金寄售暂时关闭，升级完成后即可正常使用"
		StartTalkTask(varMap)
		TalkAppendString(varMap,text );
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,text,8,2)
		return 	0
	end
	
	if GetWorldGoldShopToggle() == 0 then
		local text = "现金寄售模块已关闭"
		StartTalkTask(varMap)
		TalkAppendString(varMap,text );
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,text,8,2)
		return 	
	end

	
	local gold,charge,varNum = GetWorldShopConfigInfo(varMap, varPlayer,shopId)
	local costGold = gold + charge

	if costGold <= 0 or gold <=0 or charge <=0 then
		
		return 0
	end
	
	if GetMoney(varMap, varPlayer,2) < costGold then
		
		local text = "你的现金不足#{_MONEY"..costGold.."},寄售失败"
		StartTalkTask(varMap)
		TalkAppendString(varMap,text );
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,text,8,2)
		return 0

	end

	return 1

end



function x800054_ProcSellResult( varMap, varPlayer,shopId,price,result )
	
	if result == 0 then			
		
		local text = "寄售列表已满，请你过一段时间再来寄售现金"
		StartTalkTask(varMap)
		TalkAppendString(varMap,text );
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,text,8,2)

	elseif result == 1 then		
		
		local gold,charge,varNum = GetWorldShopConfigInfo(varMap, varPlayer,shopId)

		local text = "你已经有"..varNum.."笔寄售还在等待成交中，不能再寄售"
		StartTalkTask(varMap)
		TalkAppendString(varMap,text );
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,text,8,2)
		
	elseif result == 2 then		

		local gold,charge,varNum = GetWorldShopConfigInfo(varMap, varPlayer,shopId)

		local text = "某人在现金寄售NPC处寄售了#{_MONEY"..gold.."}现金，标价为#{_MONEY"..price.."}现银。需要的朋友，快去抢购吧！"
		LuaAllScenceM2Wrold(varMap,text,2,1)
		
		
		local year,monty,day = GetYearMonthDay()
		local hour,min,sec	 = GetHourMinSec()

		local szMail = "您于"..year.."年"..monty.."月"..day.."日"..hour.."："
		if min < 10 then
			
			szMail = szMail.."0"..min.."寄售了#{_MONEY"..gold.."}现金，标价为#{_MONEY"..price.."}现银"
		else
			szMail = szMail..min.."寄售了#{_MONEY"..gold.."}现金，标价为#{_MONEY"..price.."}现银"
		end
		
		SendNormalPost( varMap, varPlayer,GetName(varMap, varPlayer),szMail )

	elseif result == 5 then		

		local text = "银行已满，请你过一段时间再来寄售或购买现金"
		StartTalkTask(varMap)
		TalkAppendString(varMap,text );
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,text,8,2)
	end

end


function x800054_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	
	return 1

end





function x800054_ProcAccept( varMap, varPlayer )

end




function x800054_ProcQuestAbandon( varMap, varPlayer, varQuest )
end



function x800054_ProcContinue( varMap, varPlayer, varTalknpc )
end



function x800054_CheckSubmit( varMap, varPlayer )
end



function x800054_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end



function x800054_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end



function x800054_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end



function x800054_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
