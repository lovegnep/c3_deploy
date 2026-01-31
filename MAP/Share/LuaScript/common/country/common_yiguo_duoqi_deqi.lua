
x300779_var_FileId = 300779
x300779_var_QuestName = "¶áÈ¡¾üÆì"

function x300779_ProcEnumEvent( varMap, varPlayer, varTalknpc, varIndex )

	local varQuestId1 = 7686
	local varQuestId2 = 7687
	local varQuestId3 = 7688
	local varQuestId4 = 7689	

	local varQuestId5 = 7690
	local varQuestId6 = 7691
	local varQuestId7 = 7692
	local varQuestId8 = 7693

	local varQuestId9 = 7596
	local questId10 = 7597
	local questId11 = 7598
	local questId12 = 7599	

	local questId13 = 7694
	local questId14 = 7695
	local questId15 = 7696
	local questId16 = 7697

	local scene1 = 51
	local scene2 = 151
	local scene3 = 251
	local scene4 = 351

	local varQuest =-1	

	if varMap == scene1 then
		if IsHaveQuestNM( varMap, varPlayer, varQuestId1 ) ==0 and IsHaveQuestNM( varMap, varPlayer, varQuestId5 ) ==0 and IsHaveQuestNM( varMap, varPlayer, varQuestId9 ) ==0 and IsHaveQuestNM( varMap, varPlayer, questId13 ) == 0 then
			return
		else 
			TalkAppendButton(varMap,x300779_var_FileId, x300779_var_QuestName, 5)
		end
	elseif varMap == scene2 then
		if IsHaveQuestNM( varMap, varPlayer, varQuestId2 ) ==0 and IsHaveQuestNM( varMap, varPlayer, varQuestId6 ) ==0 and IsHaveQuestNM( varMap, varPlayer, questId10 ) ==0 and IsHaveQuestNM( varMap, varPlayer, questId14 ) == 0 then
			return
		else 
			TalkAppendButton(varMap,x300779_var_FileId, x300779_var_QuestName, 5)
		end
	elseif varMap == scene3 then
		if IsHaveQuestNM( varMap, varPlayer, varQuestId3 ) ==0 and IsHaveQuestNM( varMap, varPlayer, varQuestId7 ) ==0 and IsHaveQuestNM( varMap, varPlayer, questId11 ) ==0 and IsHaveQuestNM( varMap, varPlayer, questId15 ) == 0 then
			return
		else 
			TalkAppendButton(varMap,x300779_var_FileId, x300779_var_QuestName, 5)
		end
	elseif varMap == scene4 then
		if IsHaveQuestNM( varMap, varPlayer, varQuestId4 )	==0 and IsHaveQuestNM( varMap, varPlayer, varQuestId8 ) ==0 and IsHaveQuestNM( varMap, varPlayer, questId12 ) ==0 and IsHaveQuestNM( varMap, varPlayer, questId16 ) == 0 then
			return
		else 
			TalkAppendButton(varMap,x300779_var_FileId, x300779_var_QuestName, 5)
		end
	end
end


function x300779_ProcEventEntry( varMap , varPlayer , varTalknpc , varState , varIndex )

	local varQuestId1 = 7686
	local varQuestId2 = 7687
	local varQuestId3 = 7688
	local varQuestId4 = 7689	

	local varQuestId5 = 7690
	local varQuestId6 = 7691
	local varQuestId7 = 7692
	local varQuestId8 = 7693

	local varQuestId9 = 7596
	local questId10 = 7597
	local questId11 = 7598
	local questId12 = 7599	

	local questId13 = 7694
	local questId14 = 7695
	local questId15 = 7696
	local questId16 = 7697

	local scene1 = 51
	local scene2 = 151
	local scene3 = 251
	local scene4 = 351

	local varQuest =-1	

	if varMap == scene1 then
		
		if 		IsHaveQuestNM( varMap, varPlayer, varQuestId1 ) == 1 then
				varQuest = varQuestId1
		elseif 	IsHaveQuestNM( varMap, varPlayer, varQuestId5 ) == 1 then
				varQuest = varQuestId5
		elseif 	IsHaveQuestNM( varMap, varPlayer, varQuestId9 ) == 1 then
				varQuest = varQuestId9
		elseif 	IsHaveQuestNM( varMap, varPlayer, questId13 ) == 1 then
				varQuest = questId13	    
		end
		
	elseif varMap == scene2 then
		
		if 		IsHaveQuestNM( varMap, varPlayer, varQuestId2 ) == 1 then
				varQuest = varQuestId2
		elseif 	IsHaveQuestNM( varMap, varPlayer, varQuestId6 ) == 1 then
				varQuest = varQuestId6
		elseif 	IsHaveQuestNM( varMap, varPlayer, questId10 ) == 1 then
				varQuest = questId10
		elseif 	IsHaveQuestNM( varMap, varPlayer, questId14 ) == 1 then
				varQuest = questId14	    
		end
		
	elseif varMap == scene3 then
		
		if 		IsHaveQuestNM( varMap, varPlayer, varQuestId3 ) == 1 then
				varQuest = varQuestId3
		elseif 	IsHaveQuestNM( varMap, varPlayer, varQuestId7 ) == 1 then
				varQuest = varQuestId7
		elseif 	IsHaveQuestNM( varMap, varPlayer, questId11 ) == 1 then
				varQuest = questId11
		elseif 	IsHaveQuestNM( varMap, varPlayer, questId15 ) == 1 then
				varQuest = questId15    
		end
		
	elseif varMap == scene4 then
		
		if 		IsHaveQuestNM( varMap, varPlayer, varQuestId4 ) == 1 then
				varQuest = varQuestId4
		elseif 	IsHaveQuestNM( varMap, varPlayer, varQuestId8 ) == 1 then
				varQuest = varQuestId8
		elseif 	IsHaveQuestNM( varMap, varPlayer, questId12 ) == 1 then
				varQuest = questId12
		elseif 	IsHaveQuestNM( varMap, varPlayer, questId16 ) == 1 then
				varQuest = questId16    
		end
	end

	if varQuest == -1 then
	
		return
	end


	if IsHaveSpecificImpact( varMap, varPlayer, 7702 ) == 0 then
			SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, 7702, 0);

			SetQuestParam(varMap, varPlayer, varQuest, 0, 1)
			SetQuestParam(varMap, varPlayer, varQuest, 7, 1)

	end
		

end
