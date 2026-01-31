

--DECLARE_QUEST_INFO_START--

x910016_var_FileId = 910016




x910016_var_QuestName="30级声望装"


x910016_var_ZhiYeItemBonus1={{varId=10014001,varNum=1},{varId=10074001,varNum=1},{varId=10204001,varNum=1},{varId=10214001,varNum=1},{varId=10224001,varNum=1},{varId=10234001,varNum=1}}
x910016_var_ZhiYeItemBonus2={{varId=10244001,varNum=1},{varId=10254001,varNum=1},{varId=10264001,varNum=1},{varId=10274001,varNum=1},{varId=10284001,varNum=1},{varId=10294001,varNum=1}}

--DECLARE_QUEST_INFO_STOP--



function x910016_ProcEventEntry( varMap, varPlayer, varTalknpc )	
	StartTalkTask(varMap)
			local zhiye = GetZhiye(varMap, varPlayer)
			

			local varRet
			StartItemTask(varMap)
				for varI, item in x910016_var_ZhiYeItemBonus1 do
					if varI < 3 then
						ItemAppend( varMap,item.varId+10000*zhiye, item.varNum )
					else
						ItemAppend( varMap,item.varId+10*zhiye, item.varNum )
					end
				end			
			varRet = StopItemTask(varMap,varPlayer)
			if varRet > 0 then
				DeliverItemListSendToPlayer(varMap,varPlayer)
				StartItemTask(varMap)
					for varI, item in x910016_var_ZhiYeItemBonus2 do
						ItemAppend( varMap,item.varId+10*zhiye, item.varNum )
					end
				varRet = StopItemTask(varMap,varPlayer)
				
				if varRet > 0 then
					DeliverItemListSendToPlayer(varMap,varPlayer)
					StartTalkTask(varMap)
						local varText = "你获得了一套30级声望装"
						TalkAppendString(varMap,varText);
					StopTalkTask(varMap)
					DeliverTalkTips(varMap,varPlayer)	
					TalkAppendString(varMap,"这是30级声望装，你收好了！")
				else
				
					StartTalkTask(varMap)
						local varText = "背包空间不足，无法获得全部物品。"
						TalkAppendString(varMap,varText);
					StopTalkTask(varMap)
					DeliverTalkTips(varMap,varPlayer)
					TalkAppendString(varMap,"这是一部分30级声望装！")
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




function x910016_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x910016_var_FileId,x910016_var_QuestName);
end






function x910016_ProcAccept( varMap, varPlayer )
end




function x910016_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x910016_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x910016_CheckSubmit( varMap, varPlayer )

end




function x910016_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x910016_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x910016_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x910016_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
