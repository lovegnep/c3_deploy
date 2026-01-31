
x800053_var_FileId = 800053
x800053_var_QuestName = "购买现金"


function x800053_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	TalkAppendButton(varMap,800053,x800053_var_QuestName,0,-1)
	
end




function x800053_ProcEventEntry( varMap, varPlayer, varTalknpc,varState,varIndex )	

	
	GetWorldShopMerchandiseInfo(varMap, varPlayer,0)
	
end



function x800053_ProcIsCanBuy( varMap, varPlayer,price )
	
	if IsInLoginProtectTime(varMap, varPlayer) == 1 then
		local text = "你还处于安全保护时间内，不能这样做！"
		StartTalkTask(varMap)
		TalkAppendString(varMap,text );
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,text,8,2)
		return 	0
	end

	if GetMoney(varMap, varPlayer,0) < price then
		
		local text = "你的现银不足#{_MONEY"..price.."},购买失败"
		StartTalkTask(varMap)
		TalkAppendString(varMap,text );
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,text,8,2)
		return 0

	end

	return 1

end



function x800053_ProcBuyResult( varMap, varPlayer,shopId,price,result )
	
	if result == 3 then			
		
		local gold,charge,varNum = GetWorldShopConfigInfo(varMap, varPlayer,shopId)

		local text = "某人在现金寄售NPC处花费了#{_MONEY"..price.."}现银，购买了#{_MONEY"..gold.."}现金！"
		LuaAllScenceM2Wrold(varMap,text,2,1)	

		
		local year,monty,day = GetYearMonthDay()
		local hour,min,sec	 = GetHourMinSec()

		local szMail = "您于"..year.."年"..monty.."月"..day.."日"..hour.."："
		if min < 10 then
			szMail = szMail.."0"..min.."花费了#{_MONEY"..price.."}现银，购买了#{_MONEY"..gold.."}现金"	
		else
			szMail = szMail..min.."花费了#{_MONEY"..price.."}现银，购买了#{_MONEY"..gold.."}现金"	
		end

		SendNormalPost( varMap, varPlayer,GetName(varMap, varPlayer),szMail )

	elseif result == 4 then		
		
		local text = "该金票已发生变动，购买失败，请重新选择"
		StartTalkTask(varMap)
		TalkAppendString(varMap,text );
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,text,8,2)

		
		GetWorldShopMerchandiseInfo(varMap, varPlayer,shopId)

	elseif result == 5 then		

		local text = "银行已满，购买失败"
		StartTalkTask(varMap)
		TalkAppendString(varMap,text );
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,text,8,2)	
	end

end


function x800053_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	
	return 1

end





function x800053_ProcAccept( varMap, varPlayer )
end




function x800053_ProcQuestAbandon( varMap, varPlayer, varQuest )
end



function x800053_ProcContinue( varMap, varPlayer, varTalknpc )
end



function x800053_CheckSubmit( varMap, varPlayer )
end



function x800053_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end



function x800053_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end



function x800053_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end



function x800053_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
