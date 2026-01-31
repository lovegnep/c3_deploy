
x303122_var_FileId = 303122

x303122_var_QuestName="【帮会】跨服帮会战查询"
x303122_var_QuestName0="【跨服帮会战场】"

--Gameopen
x303122_var_GameOpen = 1096


--DECLARE_QUEST_INFO_STOP--



function x303122_ProcEventEntry( varMap, varPlayer, varTalknpc )
	
  if GetMergeDBToggle() == 1 then
      return
  end
    
  
	local UpdateDBflag = GetUpdateDBBeforeToggle()
	if UpdateDBflag==1 then
		return
	end
    
    
  if GetBattleSceneToggle( BATTLESCENE_TYPE_GUILDBATTLE ) == 0 then
    return
  end
  
	local curWeek = MGuildBattleSeasonWeek()
	local curCount = GetMGuildNumOfBattleCurSeason()
	--local curWeek = 0
	--local curCount = 0

	local Readme_1   = "#Y【查询】跨服帮会战场#W"
	local Readme_2   = " #W现在是本赛季的#G第"..curWeek.."周#W，已经进行过#G"..curCount.."场#W比赛。"

	x303122_var_QuestContent_1 = Readme_1
	x303122_var_QuestContent_2 = Readme_2
	
	StartTalkTask(varMap);
	TalkAppendString(varMap,x303122_var_QuestContent_1)
	TalkAppendString(varMap,x303122_var_QuestContent_2)
	
	StopTalkTask(varMap);DeliverTalkMenu(varMap,varPlayer,varTalknpc)
	
end




function x303122_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	if GetGameOpenById( x303122_var_GameOpen ) <= 0 then
    return
  end
	
  if GetMergeDBToggle() == 1 then
    return
  end
    
  
	local UpdateDBflag = GetUpdateDBBeforeToggle()
	if UpdateDBflag==1 then
		return
	end
    
    
  if GetBattleSceneToggle( BATTLESCENE_TYPE_GUILDBATTLE ) == 0 then
    return
  end
    
	TalkAppendButton(varMap,x303122_var_FileId,x303122_var_QuestName,3);

	
end





function x303122_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x303122_ProcAccept( varMap, varPlayer )

end




function x303122_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x303122_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x303122_CheckSubmit( varMap, varPlayer )

end




function x303122_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x303122_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x303122_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x303122_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
