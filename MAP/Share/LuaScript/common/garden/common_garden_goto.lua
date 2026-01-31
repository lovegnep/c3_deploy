

x800202_var_FileId = 800202   
x800202_var_QuestName = ""
x800202_var_QuestInfo = ""
x800202_var_QuestError = ""

--DECLARE_QUEST_INFO_STOP--



function x800202_ProcEventEntry( varMap, varPlayer, varTalknpc ,varScript,seleteId)	

end


function x800202_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
			local a =	LuaCallNoclosure( 800200, "IsServerOpen", varMap, varPlayer)
			if a == 1 then
					TalkAppendButton(varMap,x800202_var_FileId,"½øÈë×¯Ô°",3,1);
			end

				

end

function x800202_ProcAccept( varMap, varPlayer )
end

function x800202_Accept( varMap, varPlayer, varTalknpc ,seleteId )
	return
end
		
function x800202_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1

end





function x800202_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x800202_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x800202_CheckSubmit( varMap, varPlayer )

end




function x800202_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x800202_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x800202_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x800202_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
