
x300766_var_FileId 					= 	300766   
x300766_var_QuestName0= "【帮会神兽说明】"
x300766_var_QuestName1= "【帮会暗战说明】"
x300766_var_QuestName2= "【帮会除妖说明】"
x300766_var_QuestName3= "【帮会收集黑木（丹木）说明】"
x300766_var_QuestName4= "【帮会除魔说明】"
x300766_var_QuestName5= "【帮会图腾说明】"
x300766_var_QuestName6= "【帮会跑商说明】" 

x300766_var_QuestName8= "【帮务任务说明】"
x300766_var_QuestName9= "【帮会贡品说明】"	
x300766_var_QuestName10= "【帮会速成说明】"									  

							   
function x300766_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,300766,"【帮会任务说明】",1)	
end




function x300766_ProcEventEntry( varMap, varPlayer, varTalknpc)		
		
		StartTalkTask(varMap)
			local Readme_1 = "#Y【帮会任务说明】#r#W #r"			
			
			local Readme_2 = "\t如果您想在成吉思汗的世界里建立宏图霸业，创建或加入一个强大的帮会是您梦想成真的基础。 #r"
			
			local Readme_3 = "\t请点击下列对应按钮，您可以查询帮会相关信息:"
			
			
			local varReadme = Readme_1..Readme_2..Readme_3
		TalkAppendButton(varMap,300774 ,x300766_var_QuestName0,1);
		TalkAppendButton(varMap,300767 ,x300766_var_QuestName1,1);
		TalkAppendButton(varMap,300768 ,x300766_var_QuestName2,1);
		TalkAppendButton(varMap,300770 ,x300766_var_QuestName4,1);
		TalkAppendButton(varMap,300771 ,x300766_var_QuestName5,1);
		TalkAppendButton(varMap,300704 ,x300766_var_QuestName6,1);
		
		TalkAppendButton(varMap,300773 ,x300766_var_QuestName8,1);
		TalkAppendButton(varMap,300784 ,x300766_var_QuestName9,1);
		TalkAppendButton(varMap,300830 ,x300766_var_QuestName10,1);
		TalkAppendButton(varMap,300769 ,x300766_var_QuestName3,1);		
		TalkAppendString( varMap,varReadme)
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc);
		
		
end




function x300766_ProcAcceptCheck( varMap, varPlayer, varTalknpc )

end






function x300766_ProcAccept( varMap, varPlayer )
end



function x300766_ProcQuestAbandon( varMap, varPlayer, varQuest )
end



function x300766_ProcContinue( varMap, varPlayer, varTalknpc )
end



function x300766_CheckSubmit( varMap, varPlayer )
end



function x300766_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end



function x300766_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end



function x300766_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end



function x300766_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
