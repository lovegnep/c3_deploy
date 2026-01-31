
x310201_var_FileId = 310201



x310201_var_QuestName="【国家】国王禅让"





function x310201_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	if CountryGetOfficial(varMap,varPlayer)~=8 then
		return
	end
	TalkAppendButton(varMap,x310201_var_FileId,x310201_var_QuestName,3)	
end

function x310201_ProcEventEntry( varMap, varPlayer, varTalknpc )	
      
        
	local Readme_1 = "#Y【国家】国王禅让#W#r #r"	
	local Readme_2 = "\t尊敬的国王陛下，您真的愿意将您所在的尊崇无比的国王位置禅让给您的副帮主吗？#r"
	local Readme_3 = "\t如果你因为一时不快不再想担任国王了，那么我建议你冷静下来再做决定，如果你已经经过了#G深思熟虑#W，那么我可以帮你办理禅让国王的手续。#r"
	local Readme_4 = "\t每周#G除周二和周日以外#W的任何时间，您都可以在我这里进行禅让，但是#G每天#W只能禅让#G一次#W，您需要将您的国王位置和国家大权#G交给#W您的#G副帮主#W吗？#r"
	local varReadme = Readme_1..Readme_2..Readme_3..Readme_4		
	StartTalkTask(varMap)
	TalkAppendString(varMap, varReadme)
	StopTalkTask(varMap)
	DeliverTalkMenu(varMap,varPlayer,varTalknpc)
	DeliverTalkInfo( varMap, varPlayer, varTalknpc, x310201_var_FileId, -1 )
	
end










function x310201_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1
end




function x310201_ProcAccept( varMap, varPlayer )
	if CountryGetOfficial(varMap,varPlayer)~=8 then
		StartTalkTask(varMap)
		TalkAppendString(varMap, "很抱歉，您不是国王，没有禅让王位的权利。")
		DeliverTalkTips(varMap, varPlayer)
		StopTalkTask(varMap)
		Msg2Player(varMap,varPlayer,"很抱歉，您不是国王，没有禅让王位的权利。",8,2)	
		return
	end
	
	if GetWeek() == 0 then
		StartTalkTask(varMap)
		TalkAppendString(varMap, "很抱歉，周日不能进行国王禅让。")
		DeliverTalkTips(varMap, varPlayer)
		StopTalkTask(varMap)
		Msg2Player(varMap,varPlayer,"很抱歉，周日不能进行国王禅让。",8,2)
		return
	end		
	
	if GetWeek() == 2 then
		StartTalkTask(varMap)
		TalkAppendString(varMap, "很抱歉，周二不能进行国王禅让。")
		DeliverTalkTips(varMap, varPlayer)
		StopTalkTask(varMap)
		Msg2Player(varMap,varPlayer,"很抱歉，周二不能进行国王禅让。",8,2)
		return
	end
		CountryGuildDemise(varMap, varPlayer)
		
end




function x310201_ProcQuestAbandon( varMap, varPlayer, varQuest )	
end




function x310201_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x310201_CheckSubmit( varMap, varPlayer )

end




function x310201_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x310201_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x310201_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x310201_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
