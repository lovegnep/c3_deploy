

--DECLARE_QUEST_INFO_START--
x413102_var_FileId = 413102
x413102_var_QuestId = 1004
x413102_var_QuestKind = 13
x413102_var_LevelLess	= 	15 
x413102_var_Name	="豁儿赤" 
x413102_var_DemandItem ={{varId=11990007,varNum=4}}
x413102_var_ExtTarget={{type=20,n=1,target="得到4个神秘蜘蛛牙"}}
x413102_var_QuestHelp =	""
x413102_var_QuestName="神秘的蜘蛛牙"
x413102_var_QuestInfo="    如果你能带来四个神秘的蜘蛛牙，我不会亏待你的。"  
x413102_var_QuestCompleted="    很好的施法材料，这是你的奖励。"					
x413102_var_ContinueInfo=""
x413102_var_BonusMoney1 =40
x413102_var_BonusMoney2 =0
x413102_var_BonusMoney3 =0
x413102_var_BonusItem	=	{}
x413102_var_BonusChoiceItem ={10016002,10026002,10036002,10046002,10056002,10066002,10352002,10362002,10372002,10382002,10392002,10402002}
x413102_var_ExpBonus = 0

--DECLARE_QUEST_INFO_STOP--







function x413102_ProcEventEntry(varMap, varPlayer, varTalknpc)	

	if GetItemCount(varMap,varPlayer,x413102_var_DemandItem[1].varId) > 3 then
		StartTalkTask(varMap)
        TalkAppendString(varMap,x413102_var_QuestCompleted)
		    if x413102_var_BonusMoney1 > 0 then
					AddQuestMoneyBonus1(varMap, x413102_var_BonusMoney1 )
			end
			for varI=0, 11 do
				if GetZhiye( varMap, varPlayer)==varI then
						local ii =varI+1
					    AddQuestItemBonus(varMap, x413102_var_BonusChoiceItem[ii], 1)
				end
			end
		StopTalkTask()
        DeliverTalkContinue(varMap, varPlayer, varTalknpc, x413102_var_FileId, x413102_var_QuestId)
 	elseif GetItemCount(varMap,varPlayer,x413102_var_DemandItem[1].varId) < 4 then
  		StartTalkTask(varMap)
        TalkAppendString(varMap,x413102_var_QuestInfo)
		StopTalkTask()
        DeliverTalkMenu(varMap, varPlayer, varTalknpc)
  
  end
end









function x413102_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)


	if  x413102_CheckPushList(varMap, varPlayer, varTalknpc) > 0 then
		TalkAppendButton(varMap, x413102_var_FileId, x413102_var_QuestName,8)
	end
	
end









function x413102_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

					return 1

end








function x413102_CheckPushList(varMap, varPlayer, varTalknpc)
        		if IsQuestHaveDone(varMap, varPlayer, x413102_var_QuestId) == 0 then
        		           		return 1
       	end
       return 0
	
end







function x413102_ProcAccept(varMap, varPlayer)

	                                                  
     	                                    
	     
end









function x413102_ProcQuestAbandon(varMap, varPlayer, varQuest)

	

end









function x413102_CheckSubmit( varMap, varPlayer, varTalknpc)
	

end









function x413102_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

		
		
		for varI=0, 11 do
			if GetZhiye( varMap, varPlayer)==varI then
					local ii =varI+1
					
					StartItemTask(varMap)
					ItemAppend( varMap, x413102_var_BonusChoiceItem[ii], 1 )
					local varRet = StopItemTask(varMap,varPlayer)
					if varRet > 0 then
						
						DeliverItemListSendToPlayer(varMap,varPlayer)
						AddMoney( varMap, varPlayer, 1, x413102_var_BonusMoney1 )
						if DelItem(varMap, varPlayer, x413102_var_DemandItem[1].varId, x413102_var_DemandItem[1].varNum) ~= 1 then return 0 end
						QuestCom(varMap, varPlayer, x413102_var_QuestId)
					else
						StartTalkTask(varMap)
						TalkAppendString(varMap,"物品栏已满，无法得到任务物品！")
						StopTalkTask(varMap)
						DeliverTalkTips(varMap,varPlayer)
					end
			end
		end
	
	

	
end









function x413102_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
	 

end









function x413102_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x413102_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end

