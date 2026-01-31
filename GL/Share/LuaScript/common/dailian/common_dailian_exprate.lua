

--DECLARE_QUEST_INFO_START--

x800025_var_FileId = 800025
--DECLARE_QUEST_INFO_STOP--


function x800025_SubTrainExpRate( varMap, varLevel, attack, mode, constant )	
	local mode = mode/10
	local Exp
	if varLevel < 10 then
		Exp = ceil(varLevel*attack*mode*2)
	else
		Exp = ceil(varLevel*varLevel*attack*mode/5)
	end
	
	if Exp > 0 then
		return Exp
	else
		return 0
	end
end








function x800025_ProcEventEntry( varMap, varPlayer, varTalknpc )	

end




function x800025_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

end





function x800025_ProcAcceptCheck( varMap, varPlayer, varTalknpc )

end




function x800025_ProcAccept( varMap, varPlayer )

end




function x800025_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x800025_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x800025_CheckSubmit( varMap, varPlayer )

end




function x800025_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x800025_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x800025_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x800025_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
