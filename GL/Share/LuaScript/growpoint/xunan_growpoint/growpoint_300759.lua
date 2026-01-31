x300803_var_FileId  = 300803
x300803_var_Buf1   = -1 
x300803_var_Buf2   = -1 

x300803_var_QuestId 	= 7558			
x300803_var_ItemId 		= 13011605		
x300803_var_FileId 		= 300759		

x300803_var_UseSceneID	= 350			
x300803_var_UsePosX		= 122			
x300803_var_UsePosZ		= 58





function x300803_ProcEventEntry( varMap, varPlayer, varBagIdx )

	local varX,z = GetWorldPos (varMap,varPlayer)
	if(x300803_var_UseSceneID == varMap and abs(x300803_var_UsePosX - varX) < 30 and abs(x300803_var_UsePosZ - z) < 30) then
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"此处不能使用该物品！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 0;
	end
	
	local varHaveQuest	= IsHaveQuestNM(varMap, varPlayer, x300803_var_QuestId);
	if(varHaveQuest > 0) then
	    local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, x300803_var_QuestId);
		local varDone = GetQuestParam(varMap, varPlayer, varQuestIdx, 7);
		if(varDone == 0) then
			return LuaCallNoclosure( x300803_var_FileId, "ProcPositionUseItem", varMap, varPlayer, x300803_var_QuestId, x300803_var_ItemId );
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"您已经完成这个任务")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"您没有这个任务")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end
	return 0;
end


function x300803_ProcIsSpellLikeScript( varMap, varPlayer)
 
	return 0; 
	
	
end

function x300803_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x300803_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x300803_ProcDeplete( varMap, varPlayer )

	return 1
end

function x300803_ProcActivateOnce( varMap, varPlayer )
end

function x300803_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
