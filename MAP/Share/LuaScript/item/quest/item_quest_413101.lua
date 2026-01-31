

--DECLARE_QUEST_INFO_START--
x413101_var_FileId = 413101
x413101_var_QuestId = 1003
x413101_var_QuestKind = 13
x413101_var_LevelLess	= 	15 
x413101_var_Name	="窑口守门人" 
x413101_var_DemandItem ={{varId=13010082,varNum=1}}
x413101_var_ExtTarget={{type=20,n=1,target="得到一封红螺堂密信"}}
x413101_var_QuestHelp =	""
x413101_var_QuestName="赤蛇鞭"
x413101_var_QuestInfo="\t我的赤蛇鞭本来放在雕像上的，结果被阿兰人抢走了，到窑口里面可以找到他们，帮我夺回赤蛇鞭吧。"  
x413101_var_QuestCompleted="\t好的谢谢你了！"					
x413101_var_ContinueInfo=""
x413101_var_BonusMoney1 =1000
x413101_var_BonusMoney2 =0
x413101_var_BonusMoney3 =0
x413101_var_BonusItem	=	{}
x413101_var_BonusChoiceItem ={}
x413101_var_ExpBonus = 0

--DECLARE_QUEST_INFO_STOP--







function x413101_ProcEventEntry(varMap, varPlayer, varTalknpc)	

	if GetItemCount(varMap,varPlayer,x413101_var_DemandItem[1].varId) > 0 then
				StartTalkTask(varMap)
        TalkAppendString(varMap,x413101_var_QuestCompleted)
		    if x413101_var_BonusMoney1 > 0 then
		    local addmoney =x413101_var_BonusMoney1*GetLevel(varMap, varPlayer)
							AddQuestMoneyBonus1(varMap, addmoney )
				end
		    StopTalkTask()
        DeliverTalkContinue(varMap, varPlayer, varTalknpc, x413101_var_FileId, x413101_var_QuestId)
  elseif GetItemCount(varMap,varPlayer,x413101_var_DemandItem[1].varId) == 0 then
  			StartTalkTask(varMap)
        TalkAppendString(varMap,x413101_var_QuestInfo)
		    StopTalkTask()
        DeliverTalkMenu(varMap, varPlayer, varTalknpc)
  
  end
end









function x413101_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)


	if  x413101_CheckPushList(varMap, varPlayer, varTalknpc) > 0 then
		TalkAppendButton(varMap, x413101_var_FileId, x413101_var_QuestName,8)
	end
	
end









function x413101_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

					return 1

end








function x413101_CheckPushList(varMap, varPlayer, varTalknpc)
        		           		return 1
      
	
end







function x413101_ProcAccept(varMap, varPlayer)

	                                                  
     	                                    
	     
end









function x413101_ProcQuestAbandon(varMap, varPlayer, varQuest)

	

end









function x413101_CheckSubmit( varMap, varPlayer, varTalknpc)
	

end









function x413101_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
		local addmoney =x413101_var_BonusMoney1*GetLevel(varMap, varPlayer)
		
		AddMoney( varMap, varPlayer, 0, addmoney )
		if DelItem(varMap, varPlayer, x413101_var_DemandItem[1].varId, x413101_var_DemandItem[1].varNum) ~= 1 then return 0 end
	
	

	
end









function x413101_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
	 

end









function x413101_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x413101_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end


