

--DECLARE_QUEST_INFO_START--

x910017_var_FileId = 910017




x910017_var_QuestName="110级荣誉装"


x910017_var_ZhiYeItemBonus1={{varId=10014001,varNum=1},{varId=10074001,varNum=1},{varId=10204001,varNum=1},{varId=10214001,varNum=1},{varId=10224001,varNum=1},{varId=10234001,varNum=1}}
x910017_var_ZhiYeItemBonus2={{varId=10244001,varNum=1},{varId=10254001,varNum=1},{varId=10264001,varNum=1},{varId=10274001,varNum=1},{varId=10284001,varNum=1},{varId=10294001,varNum=1}}

--DECLARE_QUEST_INFO_STOP--



function x910017_ProcEventEntry( varMap, varPlayer, varTalknpc )	
	StartTalkTask(varMap)
			local zhiye = GetZhiye(varMap, varPlayer)
			
			local varRet
			StartItemTask(varMap)
				for varI, item in x910017_var_ZhiYeItemBonus1 do
					if varI < 3 then
						ItemAppend( varMap,item.varId+10000*zhiye-1000+2, item.varNum )
					else
						ItemAppend( varMap,item.varId+10*zhiye-1000+2, item.varNum )
					end
				end			
			varRet = StopItemTask(varMap,varPlayer)
			if varRet > 0 then
				DeliverItemListSendToPlayer(varMap,varPlayer)
				StartItemTask(varMap)
					for varI, item in x910017_var_ZhiYeItemBonus2 do
						ItemAppend( varMap,item.varId+10*zhiye-1000+2, item.varNum )
					end
				varRet = StopItemTask(varMap,varPlayer)
				
				if varRet > 0 then
					DeliverItemListSendToPlayer(varMap,varPlayer)
					StartTalkTask(varMap)
						local varText = "你获得了一套110级荣誉装"
						TalkAppendString(varMap,varText);
					StopTalkTask(varMap)
					DeliverTalkTips(varMap,varPlayer)	
					TalkAppendString(varMap,"这是110级荣誉装，你收好了！")
				else
				
					StartTalkTask(varMap)
						local varText = "背包空间不足，无法获得全部物品。"
						TalkAppendString(varMap,varText);
					StopTalkTask(varMap)
					DeliverTalkTips(varMap,varPlayer)
					TalkAppendString(varMap,"这是一部分110级荣誉装！")
				end	
			else
				StartTalkTask(varMap)
					local varText = "背包空间不足，无法获得物品。"
					TalkAppendString(varMap,varText);
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				TalkAppendString(varMap,"你整理下背包再来找我领取套装吧！")
			end							
	StopTalkTask(varMap)
	DeliverTalkMenu(varMap,varPlayer,varTalknpc)
end




function x910017_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x910017_var_FileId,x910017_var_QuestName);
end






function x910017_ProcAccept( varMap, varPlayer )
end




function x910017_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x910017_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x910017_CheckSubmit( varMap, varPlayer )

end




function x910017_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x910017_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x910017_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x910017_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
