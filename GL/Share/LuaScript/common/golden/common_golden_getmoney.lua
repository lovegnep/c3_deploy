
x800055_var_FileId = 800055
x800055_var_QuestName = "取回现金/现银"


function x800055_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	TalkAppendButton(varMap,800055,x800055_var_QuestName,0,-1)
	
end




function x800055_ProcEventEntry( varMap, varPlayer, varTalknpc,varState,varIndex )	

	
	WorldBankRetakMoney(varMap, varPlayer)

end


function x800055_ProcRetakeResult( varMap, varPlayer, gold,goldNum,siller,sillerNum )
		
	if goldNum >0 then

		local text = "您已经顺利领取了寄售返回的"..goldNum.."笔现金，总计#{_MONEY"..gold.."}现金"	
		StartTalkTask(varMap)
		TalkAppendString(varMap,text );
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,text,8,2)

		
		local year,monty,day = GetYearMonthDay()
		local hour,min,sec	 = GetHourMinSec()

		local szMail = "您于"..year.."年"..monty.."月"..day.."日"..hour.."："
		if min < 10 then
			szMail = szMail.."0"..min.."顺利领取"..goldNum.."笔现金，总计#{_MONEY"..gold.."}现金"
		else
			szMail = szMail..min.."顺利领取"..goldNum.."笔现金，总计#{_MONEY"..gold.."}现金"
		end
		
		SendNormalPost( varMap, varPlayer,GetName(varMap, varPlayer),szMail )

	end

	if sillerNum >0 then

		local text = "您寄售的"..sillerNum.."笔现金已售出，总计获得现银#{_MONEY"..siller.."}"	
		StartTalkTask(varMap)
		TalkAppendString(varMap,text );
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,text,8,2)

		
		local year,monty,day = GetYearMonthDay()
		local hour,min,sec	 = GetHourMinSec()

		local szMail = "您于"..year.."年"..monty.."月"..day.."日"..hour.."："
		if min < 10 then
			szMail = szMail.."0"..min.."顺利领取"..sillerNum.."笔现金获得的收益，总计#{_MONEY"..siller.."}现银"
		else
			szMail = szMail..min.."顺利领取"..sillerNum.."笔现金获得的收益，总计#{_MONEY"..siller.."}现银"
		end

		SendNormalPost( varMap, varPlayer,GetName(varMap, varPlayer),szMail )

	end

	if goldNum<=0 and sillerNum<=0 then
	
		local text = "您没有现银或是退回的现金可领取。"	
		StartTalkTask(varMap)
		TalkAppendString(varMap,text );
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,text,8,2)

	end

	return 1

end



function x800055_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	
	return 1

end





function x800055_ProcAccept( varMap, varPlayer )

end





function x800055_ProcQuestAbandon( varMap, varPlayer, varQuest )
end



function x800055_ProcContinue( varMap, varPlayer, varTalknpc )
end



function x800055_CheckSubmit( varMap, varPlayer )
end



function x800055_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end



function x800055_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end



function x800055_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end



function x800055_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
