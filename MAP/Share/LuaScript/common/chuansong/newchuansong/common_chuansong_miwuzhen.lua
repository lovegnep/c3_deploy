function x550529_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	TalkAppendButton(varMap,550529,"离开迷雾镇",0,1)
  
								
								
								
end


function x550529_ProcEventEntry( varMap, varPlayer, varTalknpc,varState,varIndex)	

if varIndex == 1 then

	local Readme_1 = "#Y离开迷雾镇#r"
	
	local Readme_2 = "\t#W您好，您可以通过我离开迷雾镇，请问您是否要离开？"
	
	local varReadme = Readme_1..Readme_2

	StartTalkTask(varMap);TalkAppendString(varMap,varReadme);StopTalkTask(varMap);DeliverTalkInfo(varMap, varPlayer, varTalknpc, 550529, -1)
	
	end
	
end



function x550529_ProcAcceptCheck( varMap, varPlayer, varTalknpc )

	local x550529pos = random(1,2)
	
	local x550529posX = 0
	
	local x550529posY = 0

				if GetCurCountry(varMap,varPlayer) == 0 then
						
						x550529posX= 381 + x550529pos
						
						x550529posY= 69 + x550529pos
						
						NewWorld(varMap,varPlayer,50,x550529posX,x550529posY,550529)	
						
				elseif GetCurCountry(varMap,varPlayer) == 1 then
										
						x550529posX= 381 + x550529pos
						
						x550529posY= 69 + x550529pos

						NewWorld(varMap,varPlayer,150,x550529posX,x550529posY,550529)
						
				elseif GetCurCountry(varMap,varPlayer) == 2 then
								
						x550529posX= 381 + x550529pos
						
						x550529posY= 69 + x550529pos
						
						NewWorld(varMap,varPlayer,250,x550529posX,x550529posY,550529)
						
				elseif GetCurCountry(varMap,varPlayer) == 3 then

						x550529posX= 381 + x550529pos
						
						x550529posY= 69 + x550529pos
						
						NewWorld(varMap,varPlayer,350,x550529posX,x550529posY,550529)
						
				end
	
end
























function x550529_ProcAccept( varMap, varPlayer )
end




function x550529_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x550529_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x550529_CheckSubmit( varMap, varPlayer )

end




function x550529_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x550529_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x550529_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x550529_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end







