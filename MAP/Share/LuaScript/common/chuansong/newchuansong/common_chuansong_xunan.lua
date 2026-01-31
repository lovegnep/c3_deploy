
x550528_var_QuestId 				= 	7550                    

function x550528_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	TalkAppendButton(varMap,550528,"进入迷雾镇",0,1)
end


function x550528_ProcEventEntry( varMap, varPlayer, varTalknpc,varState,varIndex)	

	if varIndex == 1 then

		local Readme_1 = "#Y迷雾镇#r"
	
		local Readme_2 = "\t#W我是把守迷雾镇的“追命巡捕”，您可以通过我传送进入迷雾镇#r #r"
	
		local Readme_3 = "#r您是否要进入迷雾镇？"
	
		local varReadme = Readme_1..Readme_2..Readme_3	

		StartTalkTask(varMap);TalkAppendString(varMap,varReadme);StopTalkTask(varMap);DeliverTalkInfo(varMap, varPlayer, varTalknpc, 550528, -1)
	
	end
	
end



function x550528_ProcAcceptCheck( varMap, varPlayer, varTalknpc )

	local posX = 0

	local posY = 0

	local varHaveQuest = IsHaveQuestNM(varMap, varPlayer, x550528_var_QuestId);

	if varHaveQuest > 0 then		

			local pos = random(1,2)

			local Num = random(1,7)

			if 	Num == 1 then

					posX= 198 + pos

					posY= 27 +  pos

					NewWorld(varMap,varPlayer,95,posX,posY,550528)
					
			elseif Num == 2 then

					posX= 235 + pos

					posY= 63 +  pos

					NewWorld(varMap,varPlayer,95,posX,posY,550528)

			elseif Num == 3 then

					posX= 225 + pos

					posY= 165 +  pos

					NewWorld(varMap,varPlayer,95,posX,posY,550528)

			elseif Num == 4 then

					posX= 153 + pos

					posY= 224 +  pos

					NewWorld(varMap,varPlayer,95,posX,posY,550528)

			elseif Num == 5 then

					posX= 37 + pos

					posY= 220 +  pos

					NewWorld(varMap,varPlayer,95,posX,posY,550528)

			elseif Num == 6 then

					posX= 37 + pos

					posY= 133 +  pos

					NewWorld(varMap,varPlayer,95,posX,posY,550528)

			elseif Num == 7 then

					posX= 31 + pos

					posY= 45 +  pos

					NewWorld(varMap,varPlayer,95,posX,posY,550528)

			end

	else
    	StartTalkTask( varMap)
		TalkAppendString( varMap, "很抱歉，您未领取“巡案任务”不能进入迷雾镇！" )
    	StopTalkTask()
        DeliverTalkTips( varMap, varPlayer)

		Msg2Player( varMap, varPlayer, "很抱歉，您未领取“巡案任务”不能进入迷雾镇！", 8, 2)
        

	end	

end


