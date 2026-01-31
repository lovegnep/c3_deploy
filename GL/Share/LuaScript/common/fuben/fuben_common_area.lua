



x700105_var_FileId			=	700105





function x700105_TeleportWangCheng(varMap, varPlayer)
		local selfcountry =GetCurCountry( varMap, varPlayer)
        TimerCommand( varMap, varPlayer, 1, 7010, 3, -1, -1, -1 )
        TimerCommand( varMap, varPlayer, 2, 7010, 3, -1, -1, -1 )
		if selfcountry == 0 then
        	NewWorld( varMap, varPlayer, selfcountry * 100 + 50, 300 + random( 0, 5), 63 + random( 0, 5), x700105_var_FileId)
		elseif selfcountry ==1 then
			NewWorld( varMap, varPlayer, selfcountry * 100 + 50, 300 + random( 0, 5), 63 + random( 0, 5), x700105_var_FileId)
		elseif selfcountry ==2 then
			NewWorld( varMap, varPlayer, selfcountry * 100 + 50, 300 + random( 0, 5), 63 + random( 0, 5), x700105_var_FileId)
		elseif selfcountry ==3 then
			NewWorld( varMap, varPlayer, selfcountry * 100 + 50, 300 + random( 0, 5), 63 + random( 0, 5), x700105_var_FileId)
		end
end


function x700105_ProcEventEntry(varMap, varPlayer, varTalknpc,varQuest, nFlag)

	
	
	SetPlayerRuntimeData(varMap,varPlayer,RD_COMMON_NPCID, nFlag)
	local varScriptFileId = GetFubenData_Param(varMap, 1)
	if nFlag == 2 then
		StartTalkTask(varMap)
		local desc = LuaCallNoclosure(700081,"GetNextLoopFubenDesc", varMap, varPlayer, varScriptFileId)
		
		TalkAppendString(varMap,desc)
		StopTalkTask(varMap)
		
		
		
		
		DeliverTalkInfoNM(varMap, varPlayer, varPlayer, x700105_var_FileId, varQuest)
	elseif nFlag == 1 then
		
		local desc = LuaCallNoclosure(700081,"GetTeleportWangchengDesc", varMap, varPlayer, varScriptFileId)
		StartTalkTask(varMap)
		TalkAppendString(varMap,desc)
		StopTalkTask(varMap)
		
		DeliverTalkInfoNM(varMap, varPlayer, varPlayer, x700105_var_FileId, varQuest)
	end
end


function x700105_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest)
	local nFlag = GetPlayerRuntimeData(varMap,varPlayer,RD_COMMON_NPCID)
	local varScriptFileId = GetFubenData_Param(varMap, 1)
	if nFlag == 2 then
		LuaCallNoclosure(700081,"NextLoopFuben", varMap, varPlayer, varScriptFileId)
	elseif nFlag == 1 then
		if varScriptFileId == 700193 then --家园副本,重新进入家园
			local nGUID = GetGUID(varMap, varPlayer)
			EnterGarden(varMap, varPlayer, nGUID, 1)
		else
			x700105_TeleportWangCheng(varMap, varPlayer)
		end		
	end
end


function x700105_PopupFubenMenu( varMap, varPlayer, nEnter, varQuest, varScriptFileId, bLastLoop  )
	
	if nEnter == 0 then  
		
		local desc = LuaCallNoclosure(700081,"GetLeaveFubenDesc", varMap, varPlayer, varScriptFileId)
		StartTalkTask(varMap)
		TalkAppendString(varMap,desc)
		
		if bLastLoop == nil or bLastLoop == 0 then
			TalkAppendButton(varMap,varQuest,"进入下一环", 0, 2)
		else
			TalkAppendButton(varMap,varQuest,"返回王城", 0, 1)
		end
		StopTalkTask(varMap)
		
		DeliverTalkMenu(varMap,varPlayer,varPlayer)
	elseif nEnter == 1 then    
		local desc = LuaCallNoclosure(700081,"GetEnterFubenDesc", varMap, varPlayer, varScriptFileId)
		StartTalkTask(varMap)
		
		
		TalkAppendString(varMap,desc)
		if varScriptFileId == 700193 then
			TalkAppendButton(varMap,varQuest,"返回庄园", 0, 1)	
		else
			TalkAppendButton(varMap,varQuest,"返回王城", 0, 1)	
		end	
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varPlayer)
	end
end	
