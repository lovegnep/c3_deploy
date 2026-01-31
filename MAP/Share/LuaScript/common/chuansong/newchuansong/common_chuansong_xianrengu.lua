function x550523_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	TalkAppendButton(varMap,550523,"传送回国",0,1)
  
								
								
								
end


function x550523_ProcEventEntry( varMap, varPlayer, varTalknpc,varState,varIndex)

if varIndex == 1 then

	local Readme_1 = "#Y传送回本国边塞#r"

	local Readme_2 = "\t#W您好，您可以通过我传送回本国边塞，但是需要您付给我#G100文银卡#W作为路费。#r"

	local Readme_3 = "#r您是否要回到边塞？"

	local varReadme = Readme_1..Readme_2..Readme_3

	StartTalkTask(varMap);TalkAppendString(varMap,varReadme);StopTalkTask(varMap);DeliverTalkInfo(varMap, varPlayer, varTalknpc, 550523, -1)

	end

end



function x550523_ProcAcceptCheck( varMap, varPlayer, varTalknpc )

	local x550523pos = random(1,3)
	
	local x550523posX = 0
	
	local x550523posY = 0
	

	if GetMoney(varMap, varPlayer, 1) >= 100 then

				if GetCurCountry(varMap,varPlayer) == 0 then

						x550523posX= 349 + x550523pos

						x550523posY= 489 + x550523pos

						CostMoney( varMap , varPlayer , 1 , 100,302 )

						NewWorld(varMap,varPlayer,51,x550523posX,x550523posY,550523)

				elseif GetCurCountry(varMap,varPlayer) == 1 then

						x550523posX= 349 + x550523pos

						x550523posY= 489 + x550523pos

						CostMoney( varMap , varPlayer, 1 , 100,302 )

						NewWorld(varMap,varPlayer,151,x550523posX,x550523posY,550523)

				elseif GetCurCountry(varMap,varPlayer) == 2 then

						x550523posX= 349 + x550523pos

						x550523posY= 489 + x550523pos

						CostMoney( varMap , varPlayer, 1 , 100,302 )

						NewWorld(varMap,varPlayer,251,x550523posX,x550523posY,550523)

				elseif GetCurCountry(varMap,varPlayer) == 3 then

						x550523posX= 349 + x550523pos

						x550523posY= 489 + x550523pos

						CostMoney( varMap , varPlayer, 1 , 100,302 )

						NewWorld(varMap,varPlayer,351,x550523posX,x550523posY,550523)

				end

	else

		Msg2Player(varMap,varPlayer,"很抱歉，您包裹中的银卡不够支付路费，无法使用回国传送！",8,2)

	end

end
























function x550523_ProcAccept( varMap, varPlayer )
end




function x550523_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x550523_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x550523_CheckSubmit( varMap, varPlayer )

end




function x550523_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x550523_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x550523_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x550523_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end







