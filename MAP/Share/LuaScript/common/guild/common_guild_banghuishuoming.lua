
x300785_var_FileId 					= 	300785   
x300785_var_QuestName0= "【介绍】帮贡"
x300785_var_QuestName1= "【介绍】帮会等级" 
x300785_var_QuestName2= "【介绍】帮会经验"
x300785_var_QuestName3= "【介绍】帮会金钱"

x300785_var_QuestName5= "【介绍】帮会使命点"
x300785_var_QuestName6= "【介绍】帮会属性天赋"					  
					   
function x300785_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,300785,"【介绍】帮会说明",1)	
end




function x300785_ProcEventEntry( varMap, varPlayer, varTalknpc)		
		
		StartTalkTask(varMap)
			local Readme_1 = "#Y【介绍】帮会说明#r#W #r"			
			
			local Readme_2 = "\t如果您想在成吉思汗的世界里建立宏图霸业，创建或加入一个强大的帮会是您梦想成真的基础。 #r"
			
			local Readme_3 = "\t请点击下列对应按钮，您可以查询帮会相关信息:"
			
			
			local varReadme = Readme_1..Readme_2..Readme_3
		TalkAppendButton(varMap,300790 ,x300785_var_QuestName0,1);
		TalkAppendButton(varMap,300786 ,x300785_var_QuestName1,1);
		TalkAppendButton(varMap,300787 ,x300785_var_QuestName2,1);
		TalkAppendButton(varMap,300788 ,x300785_var_QuestName3,1);
		
		TalkAppendButton(varMap,300789 ,x300785_var_QuestName5,1);
		TalkAppendButton(varMap,300719 ,x300785_var_QuestName6,1);
		TalkAppendString( varMap,varReadme)
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc);
		
		
end




function x300785_ProcAcceptCheck( varMap, varPlayer, varTalknpc )

end






function x300785_ProcAccept( varMap, varPlayer )
end



function x300785_ProcQuestAbandon( varMap, varPlayer, varQuest )
end



function x300785_ProcContinue( varMap, varPlayer, varTalknpc )
end



function x300785_CheckSubmit( varMap, varPlayer )
end



function x300785_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end



function x300785_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end



function x300785_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end



function x300785_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
