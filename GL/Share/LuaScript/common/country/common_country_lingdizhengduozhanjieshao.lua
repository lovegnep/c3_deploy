
x300765_var_FileId 					= 	300765  
x300765_var_QuestName0= "【领地介绍】"
x300765_var_QuestName1= "【报名条件】"
x300765_var_QuestName2= "【领地争夺战规则】"

function x300765_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,300765,"【领地争夺战说明】",1)	
end




function x300765_ProcEventEntry( varMap, varPlayer, varTalknpc)		
			StartTalkTask(varMap)
			local Readme_1 = "#Y【领地争夺战说明】#r#W #r"						
			local Readme_2 = "\t如果您想在成吉思汗的世界里体验攻城掠地的快感，就要对领地具有一定的了解才能得心应手。 #r"			
			local Readme_3 = "\t请点击下列对应按钮，您可以查询领地相关资讯:"			
			local varReadme = Readme_1..Readme_2..Readme_3
			
			TalkAppendButton(varMap,300935 ,x300765_var_QuestName0,1);
			TalkAppendButton(varMap,300936 ,x300765_var_QuestName1,1);		
			TalkAppendButton(varMap,300937 ,x300765_var_QuestName2,1);			
			TalkAppendString( varMap,varReadme)
			StopTalkTask(varMap)
			DeliverTalkMenu(varMap,varPlayer,varTalknpc);
end



function x300765_ProcAcceptCheck( varMap, varPlayer, varTalknpc )

end






function x300765_ProcAccept( varMap, varPlayer )
end



function x300765_ProcQuestAbandon( varMap, varPlayer, varQuest )
end



function x300765_ProcContinue( varMap, varPlayer, varTalknpc )
end



function x300765_CheckSubmit( varMap, varPlayer )
end



function x300765_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end



function x300765_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end



function x300765_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end



function x300765_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
