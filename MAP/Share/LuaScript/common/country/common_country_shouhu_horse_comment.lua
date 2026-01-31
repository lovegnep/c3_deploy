
x300653_var_FileId 					= 	300653  
 
function x300653_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,300653,"【守护坐骑说明】",1)	
end




function x300653_ProcEventEntry( varMap, varPlayer, varTalknpc)		
		
		StartTalkTask(varMap)
			local Readme_1 = "#Y【守护坐骑说明】#r#W #r"			
			
			local Readme_2 = "\t如果您是#G青龙之主或朱雀之主#W，您可以在我这里领取#R守护坐骑#W。#r"
			
			local Readme_3 = "\t领取守护坐骑时，您的#R坐骑栏内#W不能有守护坐骑。随着等级的提升如果想#G重新领取#W更高级别的守护坐骑。须将已有的守护坐骑#G放生#W。#r"
			
			local Readme_4 ="\t我们国家的守护坐骑有：#G30级坐骑，40级坐骑，50级坐骑，60级坐骑，70级坐骑，80级坐骑，90级坐骑，100级，110级，120级，130级，140级，150级，160级坐骑#W。#r"
			
			local Readme_5="\t领取时，会根据#R您当前的等级#W在您的坐骑栏内添加相应等级的坐骑。#r"
			
			local Readme_6="\t基于可能发生的并服管理或当您在游戏中失去统领资格时，守护坐骑将消失，并且无法提供补偿津贴，敬请理解与见谅。#r"
			
			local varReadme = Readme_1..Readme_2..Readme_3..Readme_4..Readme_5..Readme_6
			
		TalkAppendString( varMap,varReadme)
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc);
		
		
end




function x300653_ProcAcceptCheck( varMap, varPlayer, varTalknpc )

end






function x300653_ProcAccept( varMap, varPlayer )
end



function x300653_ProcQuestAbandon( varMap, varPlayer, varQuest )
end



function x300653_ProcContinue( varMap, varPlayer, varTalknpc )
end



function x300653_CheckSubmit( varMap, varPlayer )
end



function x300653_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end



function x300653_ProcKillObject( varMap, varPlayer, varObjData, varObj, varQuest )
end



function x300653_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end



function x300653_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
