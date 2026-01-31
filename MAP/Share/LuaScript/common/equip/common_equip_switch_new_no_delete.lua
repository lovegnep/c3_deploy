--装备全职转职之不删除源装备脚本

--DECLARE_QUEST_INFO_START--

x800147_var_FileId = 800147


x800147_var_QuestName="装备转换(不删源装备)"

--DECLARE_QUEST_INFO_STOP--



function x800147_ProcEventEntry( varMap, varPlayer, varTalknpc )	

end





function x800147_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x800147_var_FileId, x800147_var_QuestName,3);
end
