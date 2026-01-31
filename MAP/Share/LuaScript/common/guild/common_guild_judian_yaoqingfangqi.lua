x300940_var_FileId 					= 300940
x300940_var_QuestName				= "【国家】放弃领主战外援" 
x300940_var_Leader_Index              = 5

x300940_var_Laird_Signup                  	= 300     
x300940_var_Laird_WaitBattle              	= 301     
x300940_var_Laird_BeginBattle             	= 302     
x300940_var_Laird_EndBattle               	= 303     



function x300940_ProcEnumEvent( varMap, varPlayer, varTalknpc )

	local nBattleStatus = LuaCallNoclosure(300918,"GetBattleState",varMap)
	if nBattleStatus ~= x300940_var_Laird_Signup then
		return
	end
	
	local bPlayerAid = LuaCallNoclosure(300918,"IsPlayerInPlayerAidList",varMap,varPlayer)
	if bPlayerAid ~= 1 then
		return
	end
    
    
    TalkAppendButton(varMap,x300940_var_FileId,x300940_var_QuestName,3,x300940_var_FileId);
    
end




function x300940_ProcEventEntry(varMap, varPlayer,varTalknpc,varScript,idExt )
	
	if idExt ==  x300940_var_FileId then
	
		local nBattleStatus = LuaCallNoclosure(300918,"GetBattleState",varMap)
		if nBattleStatus ~= x300940_var_Laird_Signup then
			StartTalkTask(varMap)
			TalkAppendString(varMap, "#Y【国家】领主战场外援放弃#W#r\t活动没有开始。");
			StopTalkTask(varMap)
			DeliverTalkMenu(varMap,varPlayer,varTalknpc)
			return
		end
		
		
		local bPlayerAid = LuaCallNoclosure(300918,"IsPlayerInPlayerAidList",varMap,varPlayer)
		if bPlayerAid ~= 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap, "#Y【国家】领主战场外援放弃#W#r\t您不是外援。");
			StopTalkTask(varMap)
			DeliverTalkMenu(varMap,varPlayer,varTalknpc)
			return
		end
		
		StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】领主战场外援放弃#W#r\t您将放弃外援身份。您确定要这么做吗?");
		TalkAppendButton(varMap,x300940_var_FileId,"确定...",3);
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		
		return 0
		
	else
	
		local nBattleStatus = LuaCallNoclosure(300918,"GetBattleState",varMap)
		if nBattleStatus ~= x300940_var_Laird_Signup then
			return
		end
		
		local bPlayerAid = LuaCallNoclosure(300918,"IsPlayerInPlayerAidList",varMap,varPlayer)
		if bPlayerAid ~= 1 then
			return
		end
		
		
		GameBattleLairdRequestCanclePlayerAidByPlayerAid(varMap,varPlayer)
		
		StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】领主战场外援放弃#W#r\t请求已经完成提交。");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		
		return 0
		
	end
	
	

end 




function x300940_ProcAcceptCheck( varMap, varPlayer, varTalknpc )

end




function x300940_ProcAccept( varMap, varPlayer )
end




function x300940_ProcQuestAbandon( varMap, varPlayer, varQuest )
end




function x300940_ProcContinue( varMap, varPlayer, varTalknpc )
end




function x300940_CheckSubmit( varMap, varPlayer )
end




function x300940_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end




function x300940_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end




function x300940_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x300940_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
