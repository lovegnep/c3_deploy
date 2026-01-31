
x800150_var_FileId = 800150

x800150_var_QuestName="战车宝石合成[新]"
	
function x800150_ProcEventEntry( varMap, varPlayer, varTalknpc )	

end

function x800150_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x800150_var_FileId,x800150_var_QuestName,3);
end

function x800150_ProcItemWanfa( varMap, varPlayer, varWanfaType )
    
end
