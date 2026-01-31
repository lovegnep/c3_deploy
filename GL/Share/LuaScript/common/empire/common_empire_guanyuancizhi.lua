
x310277_var_FileId = 310277



x310277_var_QuestName="【帝国】官员辞职"





function x310277_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	
	local pos = GetEmpirePosition( varMap, varPlayer )
	if pos == EMPIRE_POSITION_INVALID or
	   pos == EMPIRE_POSITION_CIVILIAN or
	   pos == EMPIRE_POSITION_EMPEROR or
	   pos == EMPIRE_POSITION_EMPRESS then

        return 
        
    end
	
	TalkAppendButton(varMap,x310277_var_FileId,x310277_var_QuestName,3)
	
end


function x310277_ProcEventEntry( varMap, varPlayer, varTalknpc )	

	local Readme_1 = "#Y【帝国】官员辞职#W"	
	local Readme_2 = "\n\t作为一名帝国官员，不仅仅是荣誉，也是一种#G责任#W。 #r"
	local Readme_3 = "\t如果你因为一时不快不再想担任你目前的帝国职务，那么我建议你冷静下来再做决定，如果你已经经过了#G深思熟虑#W，那么我可以帮你办理辞去帝国职务的手续。#r"
	local Readme_4 = "\t不过皇帝和皇后是不可以辞职的，只有柱国亲王，前将军，左将军，右将军，太师，大司马，大司农，大学士可以辞职。#r"
	local varReadme = Readme_1..Readme_2..Readme_3..Readme_4		
	StartTalkTask(varMap)
	TalkAppendString(varMap, varReadme)
	StopTalkTask(varMap)
	DeliverTalkMenu(varMap,varPlayer,varTalknpc)
	DeliverTalkInfo( varMap, varPlayer, varTalknpc, x310277_var_FileId, -1 )
	
end










function x310277_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1
end




function x310277_ProcAccept( varMap, varPlayer )
	
	local pos = GetEmpirePosition( varMap, varPlayer )
	if pos == EMPIRE_POSITION_INVALID or
	   pos == EMPIRE_POSITION_CIVILIAN or
	   pos == EMPIRE_POSITION_EMPEROR or
	   pos == EMPIRE_POSITION_EMPRESS then
       return 
    end
    
    EmpireOfficerDesmission( varMap, varPlayer )
    Msg2Player( varMap,varPlayer, "恭喜您，辞职完成。", 8, 2 )	
        	
end




function x310277_ProcQuestAbandon( varMap, varPlayer, varQuest )	
end




function x310277_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x310277_CheckSubmit( varMap, varPlayer )

end




function x310277_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x310277_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x310277_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x310277_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
