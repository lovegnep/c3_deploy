

x800203_var_FileId = 800203   
x800203_var_QuestName = ""
x800203_var_QuestInfo = ""
x800203_var_QuestError = ""

--DECLARE_QUEST_INFO_STOP--



function x800203_ProcEventEntry( varMap, varPlayer, varTalknpc ,varScript,seleteId)	

end


function x800203_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

			local a =	LuaCallNoclosure( 800200, "IsServerOpen", varMap, varPlayer)
			if a == 1 then
					TalkAppendButton(varMap,x800203_var_FileId,"好友庄园",3,1)
			end

				

end

function x800203_ProcAccept( varMap, varPlayer )
end

function x800203_Accept( varMap, varPlayer, varTalknpc ,seleteId )
	return
--此处加入事件触发
end
		
function x800203_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1

end





function x800203_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x800203_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x800203_CheckSubmit( varMap, varPlayer )

end




function x800203_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x800203_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x800203_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x800203_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
