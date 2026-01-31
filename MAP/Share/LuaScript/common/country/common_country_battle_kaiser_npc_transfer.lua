--皇帝战相关处理NPC传送相关脚本
x310127_var_FileId		 											= 310127
x310127_var_HasKaiserScript									=	310122 --有皇帝的脚本
x310127_var_AvailabilityMap									=	SCENE_BATTLE_KAISER

x310127_var_PrintDebugLog										=	0 --debug输出
x310127_var_PrintInfoLog										=	1	--输出基本调用信息日志

x310127_var_DoorButton											=	"出门！" --大门的Button显示

x310127_var_EnableRole											=	1 --防守方

x310127_var_DoorTransferAreaInfo						= 		--大门的传送区域,不同的门跟不同的NPC做索引绑定
{
	[401120] 																	=	
	{ --第一个大门的信息
		var_ToX			=	254,
		var_ToZ			=	231
	},
	[401122] 																	=	
	{ --第2个大门的信息
		var_ToX			=	210,
		var_ToZ			=	184
	},
	[401123] 																	=	
	{ --第3个大门的信息
		var_ToX			=	302,
		var_ToZ			=	184
	},	
	
}

function x310127_ProcEnumEvent(varMap, varPlayer, varTalknpc)
	local isBattleStarted = LuaCallNoclosure(x310127_var_HasKaiserScript, "IsBattleStarted", varMap)
	if (x310127_var_PrintDebugLog == 1) then
		WriteLog(1, format("x310127_ProcEnumEvent Debug --- varMap = %d, varPlayer = %d, varTalknpc = %d, isBattleStarted = %d", 
					varMap, varPlayer, varTalknpc, isBattleStarted))
	end
	
	if (isBattleStarted ~= 1) then
		return	
	end
	
	local role = LuaCallNoclosure(x310127_var_HasKaiserScript, "GetCountryRole", varMap, varPlayer)
	if (x310127_var_PrintDebugLog == 1) then
		WriteLog(1, format("x310127_ProcEnumEvent Debug ---role = %d", 
					role))
	end
	
	if (role == x310127_var_EnableRole) then --防守方
		TalkAppendButton(varMap, x310127_var_FileId, x310127_var_DoorButton, 3, 1)
	end
	
end

--获取皇帝国家
function x310127_GetKaiserCountry()
	return GetEmpireCountry()
end

function x310127_ProcEventEntry(varMap, varPlayer, varTalknpc, idScript, idExt)

	if (x310127_var_PrintDebugLog == 1) then
		WriteLog(1, format("x310127_ProcEventEntry --- varMap = %d, varPlayer = %d, varTalknpc = %d"
			,	varMap, varPlayer, varTalknpc))
	end
	
	if (idExt ~= nil) then
		if (x310127_var_PrintDebugLog == 1) then
			WriteLog(1, format("x310127_ProcEventEntry --- idExt = %d"
				,	idExt))
		end
	
		if (idExt == 1) then --传送
			local isBattleStarted = LuaCallNoclosure(x310127_var_HasKaiserScript, "IsBattleStarted", varMap)
			if (x310127_var_PrintDebugLog == 1) then
				WriteLog(1, format("x310127_ProcEventEntry Debug --- isBattleStarted = %d", 
							isBattleStarted))
			end
			
			if (isBattleStarted ~= 1) then
				return	
			end
			
			local role = LuaCallNoclosure(x310127_var_HasKaiserScript, "GetCountryRole", varMap, varPlayer)
			if (x310127_var_PrintDebugLog == 1) then
				WriteLog(1, format("x310127_ProcEventEntry Debug --- role = %d", 
							role))
			end
			
			if (role ~= x310127_var_EnableRole) then
				return 
			end
		
			local monsterGuid = GetMonsterGUID(varMap, varTalknpc)
			if (x310127_var_PrintDebugLog == 1) then
				WriteLog(1, format("x310127_ProcEventEntry Debug --- monsterGuid = %d", 
							monsterGuid))
			end
			
			local transInfo = x310127_var_DoorTransferAreaInfo[monsterGuid]
			if (transInfo ~= nil) then
				SetPos(varMap, varPlayer, transInfo.var_ToX, transInfo.var_ToZ)		
			end
		end
	end
	
end

function x310127_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	return 1
end

function x310127_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
	if (x310127_var_PrintDebugLog == 1) then
		WriteLog(1, format("x310127_ProcQuestAccept --- varMap = %d, varPlayer = %d, varTalknpc = %d"
			,	varMap, varPlayer, varTalknpc))
	end
	
end

function x310127_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
end

--通知玩家相关提示
function x310127_NoticeToPlayer(varMap, varPlayer, varMsg)
	StartTalkTask(varMap)
	TalkAppendString(varMap, varMsg)
	StopTalkTask(varMap)
	DeliverTalkTips(varMap,varPlayer)
end
