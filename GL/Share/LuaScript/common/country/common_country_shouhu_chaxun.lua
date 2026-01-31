x300319_var_QuestName = "【国家】本国守护查询"
x300319_var_FileId = 300319







function x300319_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	
	TalkAppendButton(varMap, x300319_var_FileId, x300319_var_QuestName,3)
	
end

function x300319_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	
	x300319_DispatchPlayInfo( varMap, varPlayer, varTalknpc )
end





function x300319_DispatchPlayInfo( varMap, varPlayer, varTalknpc )

	local guild1 = GetCountrySpecialGuild(varMap, varPlayer,0)
	local guild2 = GetCountrySpecialGuild(varMap, varPlayer,1)
	
	local leaderName1 = "暂无"
	local leaderName2 = "暂无"
	local guildName1 = "暂无"
	local guildName2 = "暂无"
	
	if guild1>=0 then
		guildName1 = GetGuildName(guild1)
		leaderName1 = GetGuildLeaderName(guild1)
	end

	if guild2>=0 then
		guildName2 = GetGuildName(guild2)
		leaderName2 = GetGuildLeaderName(guild2)
	end

	StartTalkTask(varMap)

		
		TalkAppendString(varMap,"#Y"..x300319_var_QuestName)
		TalkAppendString(varMap,"\n")
		TalkAppendString(varMap,"#G青龙之主：#W"..leaderName1)
		TalkAppendString(varMap,"#G青龙守护帮会：#W"..guildName1)
		TalkAppendString(varMap,"\n")
		TalkAppendString(varMap,"#G朱雀之主：#W"..leaderName2)
		TalkAppendString(varMap,"#G朱雀守护帮会：#W"..guildName2)
		

		


	StopTalkTask()



	DeliverTalkRequire(varMap, varPlayer, varTalknpc, x300319_var_FileId, 0,0);
end
