
x303009_var_FileId          		= 303009
x303009_var_Leader_Index      		= 5
x303009_var_QuestName       		="离开战场"
x303009_var_LeaveMessageFix      		="\t您真的要现在离开战场吗?"




function x303009_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	
    if GetMergeDBToggle() == 1 then
        return
    end
    
  
	local UpdateDBflag = GetUpdateDBBeforeToggle()
	if UpdateDBflag==1 then
		return
	end
    
	
	if LuaCallNoclosure(PVP6V6_BATTLE_SCRIPT,"GetBattleSceneType",varMap) < 0 then
		return
	end
	
	
	if LuaCallNoclosure(PVP6V6_BATTLE_SCRIPT,"IsBattleSceneValid",varMap) ~= 1 then
		return
	end
	
	
	TalkAppendButton(varMap,x303009_var_FileId,x303009_var_QuestName,3,-1);
	
end




function x303009_ProcEventEntry( varMap, varPlayer, varTalknpc,varScript,idExt )

	
    if GetMergeDBToggle() == 1 then
        return
    end
    
  
	local UpdateDBflag = GetUpdateDBBeforeToggle()
	if UpdateDBflag==1 then
		return
	end

	
	if LuaCallNoclosure(PVP6V6_BATTLE_SCRIPT,"GetBattleSceneType",varMap) < 0 then
		return
	end
	
	
	if LuaCallNoclosure(PVP6V6_BATTLE_SCRIPT,"IsBattleSceneValid",varMap) ~= 1 then
		return
	end
	
	
	if idExt == -1 then
		
		StartTalkTask(varMap)
			TalkAppendString(varMap,x303009_var_LeaveMessageFix);		
			TalkAppendButton(varMap,x303009_var_FileId,"确定...",3,x303009_var_FileId);		
	    StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
	elseif idExt == x303009_var_FileId then
		
		LuaCallNoclosure(PVP6V6_BATTLE_SCRIPT,"KickPlayer",varMap,varPlayer) 
	end
end




function x303009_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end




function x303009_ProcAccept( varMap, varPlayer )
end




function x303009_ProcQuestAbandon( varMap, varPlayer, varQuest )
end




function x303009_ProcContinue( varMap, varPlayer, varTalknpc )
end




function x303009_CheckSubmit( varMap, varPlayer )
end




function x303009_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end




function x303009_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end




function x303009_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x303009_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
