

x270111_var_FileId = 270111   
x270111_var_QuestName = ""
x270111_var_QuestInfo = ""
x270111_var_QuestError = ""

--DECLARE_QUEST_INFO_STOP--



function x270111_ProcEventEntry( varMap, varPlayer, varTalknpc ,varScript,seleteId)	
			if seleteId == 11 then 
				ScriptXCRecruiMsg(varMap, varPlayer, 56)
			end
end


function x270111_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	local a =	LuaCallNoclosure( 802007, "IsServerOpen",varMap, varPlayer)
	if a == 1 then
		TalkAppendButton(varMap,x270111_var_FileId,"【招募】功能",3,11)
	end

				

end

function x270111_ProcAccept( varMap, varPlayer )
end

function x270111_Accept( varMap, varPlayer, varTalknpc ,seleteId )
	return
--此处加入事件触发
end
		
function x270111_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1

end





function x270111_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x270111_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x270111_CheckSubmit( varMap, varPlayer )

end




function x270111_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x270111_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x270111_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x270111_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
