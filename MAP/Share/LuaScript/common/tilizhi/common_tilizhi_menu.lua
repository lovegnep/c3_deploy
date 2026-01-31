--DECLARE_QUEST_INFO_START--
x330009_var_FileId = 330009
x330009_var_QuestNameTable = {
															"体力值完成个人任务",
															"体力值完成国家任务",
															"体力值完成帮会任务",
														 }

--DECLARE_QUEST_INFO_STOP--

function x330009_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x330009_var_FileId, "体力值完成个人任务", 8, 1)
		TalkAppendButton(varMap, x330009_var_FileId, "体力值完成国家任务", 8, 2)
		TalkAppendButton(varMap, x330009_var_FileId, "体力值完成帮会任务", 8, 3)
end


function x330009_ProcEventEntry(varMap, varPlayer, varTalknpc, idScript, idExt)

	StartTalkTask(varMap)
	TalkAppendString(varMap,"#Y"..x330009_var_QuestNameTable[idExt])
	TalkAppendString(varMap,"\t你可以使用体力值轻松完成以下任务，当你的体力值不足时可以通过使用体力丹来回复一定的体力值，体力丹在金币商店#g贵族专属#W区有售。\n#G一个初级体力丹=100体力值\n一个中级体力丹=200体力值\n一个高级体力丹=500体力值#W\n \n每天一共可以使用5个体力丹。")
	if idExt == 1 then
		local flag1 =LuaCallNoclosure(330000, "ProcEnumEventForMenu", varMap, varPlayer, varTalknpc) 
		local flag2 =LuaCallNoclosure(330004, "ProcEnumEventForMenu", varMap, varPlayer, varTalknpc) 
		local flag3 =LuaCallNoclosure(330005, "ProcEnumEventForMenu", varMap, varPlayer, varTalknpc) 
		local flag4 =LuaCallNoclosure(330006, "ProcEnumEventForMenu", varMap, varPlayer, varTalknpc) 
		if (flag1 + flag2 + flag3 + flag4 ) == 0 then
			TalkAppendString( varMap,"\n很抱歉，当前没有满足条件的任务！")
		end
	elseif idExt == 2 then
		local flag1 =LuaCallNoclosure(330044, "ProcEnumEventForMenu", varMap, varPlayer, varTalknpc) 
		local flag2 =LuaCallNoclosure(330020, "ProcEnumEventForMenu", varMap, varPlayer, varTalknpc) 
		local flag3 =LuaCallNoclosure(330024, "ProcEnumEventForMenu", varMap, varPlayer, varTalknpc) 
		local flag4 =LuaCallNoclosure(330028, "ProcEnumEventForMenu", varMap, varPlayer, varTalknpc) 
		local flag5 =LuaCallNoclosure(330032, "ProcEnumEventForMenu", varMap, varPlayer, varTalknpc) 
		local flag6 =LuaCallNoclosure(330019, "ProcEnumEventForMenu", varMap, varPlayer, varTalknpc) 
		local flag7 =LuaCallNoclosure(330001, "ProcEnumEventForMenu", varMap, varPlayer, varTalknpc) 
		local flag8 =LuaCallNoclosure(330002, "ProcEnumEventForMenu", varMap, varPlayer, varTalknpc) 
		local flag9 =LuaCallNoclosure(330003, "ProcEnumEventForMenu", varMap, varPlayer, varTalknpc) 
		if (flag1 + flag2 + flag3 + flag4 + flag5 + flag6 + flag7 + flag8 + flag9) == 0 then
			TalkAppendString( varMap,"\n很抱歉，当前没有满足条件的任务！")
		end
	elseif idExt == 3 then
		local flag1 =LuaCallNoclosure(330007, "ProcEnumEventForMenu", varMap, varPlayer, varTalknpc) 
		local flag2	=LuaCallNoclosure(330054, "ProcEnumEventForMenu", varMap, varPlayer, varTalknpc) 
		local flag3	=LuaCallNoclosure(330055, "ProcEnumEventForMenu", varMap, varPlayer, varTalknpc) 	
		if (flag1 + flag2 + flag3 ) == 0 then
			TalkAppendString( varMap,"\n很抱歉，当前没有满足条件的任务！")
		end
	end
	StopTalkTask()
	DeliverTalkMenu(varMap, varPlayer, varTalknpc)
end



