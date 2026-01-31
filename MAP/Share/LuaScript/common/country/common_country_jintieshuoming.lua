
x300792_var_FileId 					= 	300792   
x300792_var_QuestName0= "【介绍】领取军饷"
x300792_var_QuestName1= "【介绍】国民津贴"
x300792_var_QuestName2= "【介绍】帮会津贴"
x300792_var_QuestName3= "【介绍】出国津贴" 
x300792_var_QuestName4= "【介绍】国运津贴" 	
x300792_var_QuestName5= "【介绍】守护津贴" 							   
function x300792_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,300792,"【介绍】津贴介绍",1)	
end




function x300792_ProcEventEntry( varMap, varPlayer, varTalknpc)		
		
		StartTalkTask(varMap)
			local Readme_1 = "#Y【介绍】津贴介绍#r#W"			
			
			local Readme_2 = "\t津贴是给予为国家做出贡献的国民的一种奖励。 #r"
			
			local Readme_3 = "\t请点击下列对应按钮，您可以查询津贴相关资讯:"
			
			
			local varReadme = Readme_1..Readme_2..Readme_3
		TalkAppendButton(varMap,300831 ,x300792_var_QuestName0,1);
		TalkAppendButton(varMap,300793 ,x300792_var_QuestName1,1);
		TalkAppendButton(varMap,300794 ,x300792_var_QuestName2,1);
		TalkAppendButton(varMap,300795 ,x300792_var_QuestName3,1);
		TalkAppendButton(varMap,300796 ,x300792_var_QuestName4,1);
		TalkAppendButton(varMap,300799 ,x300792_var_QuestName5,1);
		TalkAppendString( varMap,varReadme)
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc);
end




function x300792_ProcAcceptCheck( varMap, varPlayer, varTalknpc )

end






function x300792_ProcAccept( varMap, varPlayer )
end



function x300792_ProcQuestAbandon( varMap, varPlayer, varQuest )
end



function x300792_ProcContinue( varMap, varPlayer, varTalknpc )
end



function x300792_CheckSubmit( varMap, varPlayer )
end



function x300792_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end



function x300792_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end



function x300792_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end



function x300792_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
