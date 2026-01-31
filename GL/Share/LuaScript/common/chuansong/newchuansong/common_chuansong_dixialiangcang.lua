function x550502_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	TalkAppendButton(varMap,550502,"离开粮仓",0,1)
  
								
								
								
end


function x550502_ProcEventEntry( varMap, varPlayer, varTalknpc,varState,varIndex)	

if varIndex == 1 then

	local Readme_1 = "#Y传送回本国边塞#r"
	
	local Readme_2 = "\t#W您好，您可以透过我传送回本国边塞，但是需要您付给我#G50文银卡#W作为路费。#r"
	
	local Readme_3 = "#r您是否要回到边塞？"
	
	local varReadme = Readme_1..Readme_2..Readme_3	

	StartTalkTask(varMap);TalkAppendString(varMap,varReadme);StopTalkTask(varMap);DeliverTalkInfo(varMap, varPlayer, varTalknpc, 550502, -1)
	
	end
	
end



function x550502_ProcAcceptCheck( varMap, varPlayer, varTalknpc )


	local x550502posX = 0
	local x550502posY = 0
	local x550502pos = random(1,2)

	if GetMoney(varMap, varPlayer, 1) >= 50 then
	
				if GetCurCountry(varMap,varPlayer) == 0 then

						x550502posX= 273 + x550502pos
						
						x550502posY= 233 + x550502pos
						
						CostMoney( varMap , varPlayer , 1 , 50,302 )

						NewWorld(varMap,varPlayer,51,x550502posX,x550502posY, 550502)	
						
				elseif GetCurCountry(varMap,varPlayer) == 1 then
				
						x550502posX= 273 + x550502pos
						
						x550502posY= 233 + x550502pos

						CostMoney( varMap , varPlayer, 1 , 50,302 )
						
						NewWorld(varMap,varPlayer,151,x550502posX,x550502posY, 550502)
						
				elseif GetCurCountry(varMap,varPlayer) == 2 then
				
						x550502posX= 273 + x550502pos
						
						x550502posY= 233 + x550502pos
						
						CostMoney( varMap , varPlayer, 1 , 50,302 )
						
						NewWorld(varMap,varPlayer,251,x550502posX,x550502posY, 550502)
						
				elseif GetCurCountry(varMap,varPlayer) == 3 then

						x550502posX= 273 + x550502pos
						
						x550502posY= 233 + x550502pos
						
						CostMoney( varMap , varPlayer, 1 , 50,302 )
						
						NewWorld(varMap,varPlayer,351,x550502posX,x550502posY, 550502)
						
				end
		
	else
	
		Msg2Player(varMap,varPlayer,"很抱歉，您包裹中的银卡不够支付路费，无法使用回国传送！",8,2)	
	
	end
	
end
























function x550502_ProcAccept( varMap, varPlayer )
end




function x550502_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x550502_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x550502_CheckSubmit( varMap, varPlayer )

end




function x550502_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x550502_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x550502_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x550502_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end







