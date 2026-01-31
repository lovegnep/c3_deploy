
x300651_var_FileId 					= 	300651  
 
function x300651_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,300651,"【介绍】国王坐骑",1)	
end




function x300651_ProcEventEntry( varMap, varPlayer, varTalknpc)		
		
		StartTalkTask(varMap)
			local Readme_1 = "#Y【介绍】国王坐骑#r#W #r"			
			
			local Readme_2 = "\t如果您是#g国王或王后#w，您可以在我这里领取#R国王坐骑#w。#r"
			
			local Readme_3 = "\t领取国王坐骑时，您的#R坐骑栏内#w不能有国王骑乘。如果有，您可以#R选择放生#w。放生后，您可以#g再次领取国王坐骑#w。#r"
			
			local Readme_4 ="\t我们国家的国王坐骑有：#G30级坐骑，40级坐骑，50级坐骑，60级坐骑，70级坐骑，80级坐骑，90级坐骑，100级，110级，120级，130级，140级，150级，160级坐骑#W。#r"
			
			local Readme_5="\t领取时，会根据#R您当前的等级#W在您的坐骑栏内添加相应等级的坐骑。#r"
			local Readme_6="\t基于可能发生的并服管理或当您在游戏中失去统领资格时，国王坐骑将消失，并且无法提供补偿津贴，敬请理解与见谅。#r"
			
			local varReadme = Readme_1..Readme_2..Readme_3..Readme_4..Readme_5..Readme_6
			
		TalkAppendString( varMap,varReadme)
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc);
		
		
end




function x300651_ProcAcceptCheck( varMap, varPlayer, varTalknpc )

end






function x300651_ProcAccept( varMap, varPlayer )
end



function x300651_ProcQuestAbandon( varMap, varPlayer, varQuest )
end



function x300651_ProcContinue( varMap, varPlayer, varTalknpc )
end



function x300651_CheckSubmit( varMap, varPlayer )
end



function x300651_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end



function x300651_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end



function x300651_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end



function x300651_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
