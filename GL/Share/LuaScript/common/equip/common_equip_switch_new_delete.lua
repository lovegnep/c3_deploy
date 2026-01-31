--装备全职转职之删除源装备脚本

--DECLARE_QUEST_INFO_START--

x800148_var_FileId = 800148


x800148_var_QuestName="装备转换(删除源装备)"

--DECLARE_QUEST_INFO_STOP--


function x800148_ProcEventEntry( varMap, varPlayer, varTalknpc )	

end




function x800148_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x800148_var_FileId, x800148_var_QuestName,3);
end


