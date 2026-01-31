
function x300720_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

			TalkAppendButton(varMap,300720,"【帮会】帮会介绍",0,1)

  
								
								
								

end


function x300720_ProcEventEntry( varMap, varPlayer, varTalknpc,varState,varIndex)	

	if varIndex == 1 then
	
			StartTalkTask(varMap)

			local Readme_1 = "#Y帮会介绍#r#W #r"			
			
			local Readme_2 = "一，如果#G创建帮会#W您必须满足三个条件#r #r"
			
			local Readme_3 = "\t建立帮会需要#G30级#W以上。#r #r"
			
			local Readme_4 = "\t您需要花费#G5两金卡#W。#r #r"
			
			local Readme_5 = "\t您需要拥有#G“帮会令”#W。#r #r"
			
			local Readme_6 = "二，如果#G加入帮会#W您必须满足一个条件#r #r"
			
			local Readme_7 = "\t加入帮会需要#G20级#W以上。#r #r"

			local Readme_8 = "三，#g创建帮会#w完成#g10天后#w如果人数#g未达到10人#w系统将#g自动解散帮会#w。#r #r"	
			
			local Readme_9=  "四，#g帮会令：#w您需要打败边境的#g令火鸟#w。（王城420，190附近），#w并有#g一定几率获得。"
			
			local varReadme = Readme_1..Readme_2..Readme_3..Readme_4..Readme_5..Readme_6..Readme_7..Readme_8..Readme_9
			
			TalkAppendString( varMap,varReadme)
			
			StopTalkTask(varMap)

			DeliverTalkMenu(varMap,varPlayer,varTalknpc)	
			
	end
	
end



function x300720_ProcAcceptCheck( varMap, varPlayer, varTalknpc )

		

end

























function x300720_ProcAccept( varMap, varMap )

end




function x300720_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x300720_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x300720_CheckSubmit( varMap, varPlayer )

end




function x300720_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x300720_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x300720_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x300720_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end


