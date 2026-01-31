

--DECLARE_QUEST_INFO_START--
x413103_var_FileId = 413103
x413103_var_QuestId = 1005
x413103_var_QuestKind = 13
x413103_var_LevelLess	= 	15 
x413103_var_Name	="金国俘虏" 
x413103_var_DemandItem ={{varId=11990008,varNum=6}}
x413103_var_ExtTarget={{type=20,n=1,target="得到一封红螺堂密信"}}
x413103_var_QuestHelp =	""
x413103_var_QuestName="【支线】塔塔尔宝石"
x413103_var_QuestInfo="    不要杀我，如果你给我带来6颗塔塔尔宝石我会报答你的。"  
x413103_var_QuestCompleted="\t多谢你了，这个宝贝就送给你吧。"					
x413103_var_ContinueInfo=""
x413103_var_BonusMoney1 =40
x413103_var_BonusMoney2 =0
x413103_var_BonusMoney3 =0
x413103_var_BonusItem	=	{}
x413103_var_BonusChoiceItem ={10206004,10206005,10206006,10206007,10206008,10206009,10206013,10206014,10206015,10206016,10206017,10206018}
x413103_var_ExpBonus = 0

--DECLARE_QUEST_INFO_STOP--







function x413103_ProcEventEntry(varMap, varPlayer, varTalknpc)	

	if GetItemCount(varMap,varPlayer,x413103_var_DemandItem[1].varId) > 5 then
				StartTalkTask(varMap)
				 	TalkAppendString(varMap,"#Y"..x413103_var_QuestName.."\n")
        			TalkAppendString(varMap,x413103_var_QuestCompleted)
		    if x413103_var_BonusMoney1 > 0 then
							AddQuestMoneyBonus1(varMap, x413103_var_BonusMoney1 )
				end
				for varI=0, 11 do
						if GetZhiye( varMap, varPlayer)==varI then
						local ii =varI+1
					    		AddQuestItemBonus(varMap, x413103_var_BonusChoiceItem[ii], 1)
					  end
				end
		    StopTalkTask()
        DeliverTalkContinue(varMap, varPlayer, varTalknpc, x413103_var_FileId, x413103_var_QuestId)
  elseif GetItemCount(varMap,varPlayer,x413103_var_DemandItem[1].varId) < 6 then
  			StartTalkTask(varMap)
        TalkAppendString(varMap,x413103_var_QuestInfo)
		    StopTalkTask()
        DeliverTalkMenu(varMap, varPlayer, varTalknpc)
  
  end
end









function x413103_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)


	if  x413103_CheckPushList(varMap, varPlayer, varTalknpc) > 0 then
		TalkAppendButton(varMap, x413103_var_FileId, x413103_var_QuestName,8)
	end
	
end









function x413103_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

					return 1

end








function x413103_CheckPushList(varMap, varPlayer, varTalknpc)
        		if IsQuestHaveDone(varMap, varPlayer, x413103_var_QuestId) == 0 then
        		           		return 1
        		 end
        return 0
	
end







function x413103_ProcAccept(varMap, varPlayer)

	                                                  
     	                                    
	     
end









function x413103_ProcQuestAbandon(varMap, varPlayer, varQuest)

	

end









function x413103_CheckSubmit( varMap, varPlayer, varTalknpc)
	

end









function x413103_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

		
		
		for varI=0, 11 do
						if GetZhiye( varMap, varPlayer)==varI then
								local ii =varI+1
					    		StartItemTask(varMap)
								ItemAppend( varMap, x413103_var_BonusChoiceItem[ii], 1 )
								local varRet = StopItemTask(varMap,varPlayer)
								if varRet > 0 then
										DeliverItemListSendToPlayer(varMap,varPlayer)
										AddMoney( varMap, varPlayer, 1, x413103_var_BonusMoney1 )
										if DelItem(varMap, varPlayer, x413103_var_DemandItem[1].varId, x413103_var_DemandItem[1].varNum) ~= 1 then return 0 end
										QuestCom(varMap, varPlayer, x413103_var_QuestId)
								else
										StartTalkTask(varMap)
										TalkAppendString(varMap,"物品栏已满，无法得到任务物品！")
										StopTalkTask(varMap)
										DeliverTalkTips(varMap,varPlayer)
								end
					  end
		end
	
	

	
end









function x413103_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
	 

end









function x413103_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x413103_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end

