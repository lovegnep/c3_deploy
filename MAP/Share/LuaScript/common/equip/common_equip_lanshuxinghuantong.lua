
--DECLARE_QUEST_INFO_START--

x800089_var_FileId = 800089


x800089_var_QuestName="×°±¸»ØÂ¯£¨Ï´À¶£©"

--DECLARE_QUEST_INFO_STOP--




function x800089_ProcEventEntry( varMap, varPlayer, varTalknpc )	
end




function x800089_ProcAcceptCheck( varMap, varPlayer, varTalknpc )

		return 1
		
end

function x800089_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	TalkAppendButton(varMap,x800089_var_FileId,x800089_var_QuestName,3);

end
