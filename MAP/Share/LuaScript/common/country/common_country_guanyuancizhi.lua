
x310200_var_FileId = 310200



x310200_var_QuestName="【国家】官员辞职"





function x310200_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	if  CountryGetOfficial(varMap,varPlayer)~=6 
	and CountryGetOfficial(varMap,varPlayer)~=5
	and CountryGetOfficial(varMap,varPlayer)~=4
	and CountryGetOfficial(varMap,varPlayer)~=3
	and CountryGetOfficial(varMap,varPlayer)~=2	then
		return
	end
	TalkAppendButton(varMap,x310200_var_FileId,x310200_var_QuestName,3)
end
function x310200_ProcEventEntry( varMap, varPlayer, varTalknpc )	

	local Readme_1 = "#Y【国家】官员辞职#W#r #r"	
	local Readme_2 = "\t作为一名国家官员，不仅仅是荣誉，也是一种#G责任#W。 #r"
	local Readme_3 = "\t如果你因为一时不快不再想担任你目前的国家职务，那么我建议你冷静下来再做决定，如果你已经经过了#G深思熟虑#W，那么我可以帮你办理辞去国家职务的手续。#r"
	local Readme_4 = "\t不过国王和王后是不可以辞职的，只有大将军、左丞、右相、金牌左捕、金牌右捕可以辞职。#r"
	local varReadme = Readme_1..Readme_2..Readme_3..Readme_4		
	StartTalkTask(varMap)
	TalkAppendString(varMap, varReadme)
	StopTalkTask(varMap)
	DeliverTalkMenu(varMap,varPlayer,varTalknpc)
	DeliverTalkInfo( varMap, varPlayer, varTalknpc, x310200_var_FileId, -1 )
	
end










function x310200_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1
end




function x310200_ProcAccept( varMap, varPlayer )
	if  CountryGetOfficial(varMap,varPlayer)~=6 
	and CountryGetOfficial(varMap,varPlayer)~=5
	and CountryGetOfficial(varMap,varPlayer)~=4
	and CountryGetOfficial(varMap,varPlayer)~=3
	and CountryGetOfficial(varMap,varPlayer)~=2	then
		return
	end
		DismissCountryOfficial_Self(varMap, varPlayer)
		Msg2Player( varMap,varPlayer, "恭喜您，辞职完成。", 8, 2 )	
end




function x310200_ProcQuestAbandon( varMap, varPlayer, varQuest )	
end




function x310200_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x310200_CheckSubmit( varMap, varPlayer )

end




function x310200_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x310200_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x310200_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x310200_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
