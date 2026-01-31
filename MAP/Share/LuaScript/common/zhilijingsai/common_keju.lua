x920001_var_FileId = 920001







x920001_var_QuestName="¿Æ¾Ù22"

--DECLARE_QUEST_INFO_STOP--



function x920001_ProcEventEntry( varMap, varPlayer, varTalknpc )	
		QuizAsk(varMap, varPlayer, 1, 20, 20); 
end




function x920001_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x920001_var_FileId,x920001_var_QuestName);
end





function x920001_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x920001_ProcAccept( varMap, varPlayer )

end




function x920001_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x920001_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x920001_CheckSubmit( varMap, varPlayer )

end




function x920001_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x920001_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x920001_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x920001_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end


function x920001_ProcAnswer( varMap, varPlayer, varStepIdx, varQuestionIdx, varAnswerIdx)
		local varCount;
		local varCode;
		
		
		varCode = QuizCheck(varMap, varQuestionIdx, varAnswerIdx);
		
		
		if (varCode == 0) then
		
				varCount = GetQuizWrongCount(varMap, varPlayer);
				varCount = varCount + 1;
				SetQuizWrongCount( varMap, varPlayer, varCount);
		elseif (varCode == 1) then
		
				varCount = GetQuizRightCount(varMap, varPlayer);
				varCount = varCount + 1;
				SetQuizRightCount( varMap, varPlayer, varCount);
		end
		
		
		QuizResult(varMap, varPlayer, varStepIdx, varCode, varCount);
		varStepIdx = varStepIdx + 1;
		if varStepIdx <= 20 then
			QuizAsk(varMap, varPlayer, varStepIdx, 20, 20);
		end
		
end
