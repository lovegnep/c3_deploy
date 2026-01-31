





x300730_var_DayCountLimited = 1

x300730_var_FileId = 300730
x300730_var_QuestName = "【国家】国家守边"


x300730_var_SceneIdList = {51,151,251,351}
function x300730_ProcEnumEvent( varMap, varPlayer, varTalknpc, varIndex )
	local varCountry = GetCurCountry( varMap, varPlayer )
	local Level = GetLevel(varMap, varPlayer)
	if Level >= 40 then
		if varCountry<=3 and varCountry>=0 then
			if varMap == x300730_var_SceneIdList[varCountry+1] then
		
				TalkAppendButton(varMap,x300730_var_FileId, x300730_var_QuestName, 8)
			end
		end
	end
end

function x300730_ProcEventEntry( varMap , varPlayer , varTalknpc , varState , varIndex )
	
	local varCountry = GetCurCountry( varMap, varPlayer )
	
		StartTalkTask(varMap)

			local varReadme ="#Y【国家】国家守边#r"
			local Readme2 = "#Y【国家】国家守边#r";
			local Readme3 = "你还没有完成国家守边任务！"

			local strHaveQuestText = "  你已经接受了国家守边任务，赶快去完成吧！#r";
			local quest1 = "【国家】国家守边"
			local quest2 = "【国家】国家守边"
			local quest3 = "【国家】国家守边"
			local quest4 = "【国家】国家守边"

			local quest2submit1 = "【国家】国家守边"
			local quest2submit2 = "【国家】国家守边"
			local quest2submit3 = "【国家】国家守边"
			local quest2submit4 = "【国家】国家守边"

			local varScript = 300738

			
			local varQuestId1 = 7564  
			local varQuestId2 = 7570	 	
			local varQuestId3 = 7576
			local varQuestId4 = 7585

			
			local shoubian_questId1 = 7563  
			local shoubian_questId2 = 7569	 	
			local shoubian_questId3 = 7575
			local shoubian_questId4 = 7584

			
			local quest2submitId1 = 7565  
			local quest2submitId2 = 7571	 	
			local quest2submitId3 = 7577
			local quest2submitId4 = 7586
			

			
			
			
			

			local nCurrentDayCount = x300730_GetDayCount(varMap, varPlayer)

			if nCurrentDayCount>=x300730_var_DayCountLimited then
				
				
				
				
				
				
			end

			

			
			if varCountry == 0 then
				
				if IsHaveQuestNM( varMap, varPlayer, quest2submitId1) >0 then
					TalkAppendString(varMap,Readme2)
					TalkAppendString(varMap,"  由于外族不断侵扰我国边塞，使得边塞的形势极不稳定。凡我国有志之士，都有责任前往边塞，打击外族的入侵！")
					local state1 = GetQuestStateNM(varMap, varPlayer, varTalknpc, quest2submitId1)
					TalkAppendButton(varMap, varScript, quest2submit1, state1, quest2submitId1,2)
				elseif IsHaveQuestNM( varMap, varPlayer, shoubian_questId1) >0 then
					TalkAppendString(varMap,Readme3)
				
				else
					
					if IsHaveQuestNM( varMap, varPlayer, varQuestId1 )==0 then
						TalkAppendString(varMap,varReadme)
						TalkAppendString(varMap,"  由于外族不断侵扰我国边塞，使得边塞的形势极不稳定。凡我国有志之士，都有责任前往边塞，打击外族的入侵！")
						local state1 = GetQuestStateNM(varMap, varPlayer, varTalknpc, varQuestId1)
						TalkAppendButton(varMap, varScript, quest1, state1, varQuestId1,2)
					else
						local localexp = (GetLevel( varMap, varPlayer )) * 100*3.6*15
						TalkAppendString(varMap,"#Y【国家】国家守边")
						TalkAppendString(varMap,strHaveQuestText)
						TalkAppendString(varMap,"#Y任务奖励：")
						TalkAppendString(varMap,"  经验值："..localexp.."点#r  荣誉值：50点")
					end
				end
				
				
				

			elseif varCountry == 1 then

				if IsHaveQuestNM( varMap, varPlayer, quest2submitId2) >0 then
					TalkAppendString(varMap,Readme2)
					TalkAppendString(varMap,"  由于外族不断侵扰我国边塞，使得边塞的形势极不稳定。凡我国有志之士，都有责任前往边塞，打击外族的入侵！")
					local state1 = GetQuestStateNM(varMap, varPlayer, varTalknpc, quest2submitId2)
					TalkAppendButton(varMap, varScript, quest2submit2, state1, quest2submitId2)
				elseif IsHaveQuestNM( varMap, varPlayer, shoubian_questId2) >0 then
					TalkAppendString(varMap,Readme3)
				
				else

					if IsHaveQuestNM( varMap, varPlayer, varQuestId2 )==0 then
						TalkAppendString(varMap,varReadme)
						TalkAppendString(varMap,"  由于外族不断侵扰我国边塞，使得边塞的形势极不稳定。凡我国有志之士，都有责任前往边塞，打击外族的入侵！")
						local state2 = GetQuestStateNM(varMap, varPlayer, varTalknpc, varQuestId2)
						TalkAppendButton(varMap, varScript, quest2, state2, varQuestId2)
					else
						local localexp = (GetLevel( varMap, varPlayer )) * 100*3.6*15
						TalkAppendString(varMap,"#Y【国家】国家守边")
						TalkAppendString(varMap,strHaveQuestText)
						TalkAppendString(varMap,"#Y任务奖励：")
						TalkAppendString(varMap,"  经验值："..localexp.."点#r  荣誉值：50点")
					end
				end

			elseif varCountry == 2 then

				if IsHaveQuestNM( varMap, varPlayer, quest2submitId3) >0 then
					TalkAppendString(varMap,Readme2)
					TalkAppendString(varMap,"  由于外族不断侵扰我国边塞，使得边塞的形势极不稳定。凡我国有志之士，都有责任前往边塞，打击外族的入侵！")
					local state1 = GetQuestStateNM(varMap, varPlayer, varTalknpc, quest2submitId3)
					TalkAppendButton(varMap, varScript, quest2submit3, state1, quest2submitId3)
				elseif IsHaveQuestNM( varMap, varPlayer, shoubian_questId3) >0 then
					TalkAppendString(varMap,Readme3)
				
				else	

					if IsHaveQuestNM( varMap, varPlayer, varQuestId3 )==0 then
						TalkAppendString(varMap,varReadme)
						TalkAppendString(varMap,"  由于外族不断侵扰我国边塞，使得边塞的形势极不稳定。凡我国有志之士，都有责任前往边塞，打击外族的入侵！")
						local state3= GetQuestStateNM(varMap, varPlayer, varTalknpc, varQuestId3)
						TalkAppendButton(varMap, varScript, quest3, state3, varQuestId3)
					else
						local localexp = (GetLevel( varMap, varPlayer )) * 100*3.6*15
						TalkAppendString(varMap,"#Y【国家】国家守边")
						TalkAppendString(varMap,strHaveQuestText)
						TalkAppendString(varMap,"#Y任务奖励：")
						TalkAppendString(varMap,"  经验值："..localexp.."点#r  荣誉值：50点")
					end
				end

			elseif varCountry == 3 then

				if IsHaveQuestNM( varMap, varPlayer, quest2submitId4) >0 then
					TalkAppendString(varMap,Readme2)
					TalkAppendString(varMap,"  由于外族不断侵扰我国边塞，使得边塞的形势极不稳定。凡我国有志之士，都有责任前往边塞，打击外族的入侵！")
					local state1 = GetQuestStateNM(varMap, varPlayer, varTalknpc, quest2submitId4)
					TalkAppendButton(varMap, varScript, quest2submit4, state1, quest2submitId4)
				elseif IsHaveQuestNM( varMap, varPlayer, shoubian_questId4) >0 then
					TalkAppendString(varMap,Readme3)
				
				else

					if IsHaveQuestNM( varMap, varPlayer, varQuestId4 )==0 then
						TalkAppendString(varMap,varReadme)
						TalkAppendString(varMap,"  由于外族不断侵扰我国边塞，使得边塞的形势极不稳定。凡我国有志之士，都有责任前往边塞，打击外族的入侵！")
						local state4 = GetQuestStateNM(varMap, varPlayer, varTalknpc, varQuestId4)
						TalkAppendButton(varMap, varScript, quest4, state4, varQuestId4)
					else
						local localexp = (GetLevel( varMap, varPlayer )) * 100*3.6*15
						TalkAppendString(varMap,"#Y【国家】国家守边")
						TalkAppendString(varMap,strHaveQuestText)
						TalkAppendString(varMap,"#Y任务奖励：")
						TalkAppendString(varMap,"  经验值："..localexp.."点#r  荣誉值：50点")
					end
				end
			end

		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
end





function x300730_GetDayCount(varMap, varPlayer)



	local varToday = GetDayOfYear()
	local varLastday = GetPlayerGameData(varMap, varPlayer, DQ_SHOUBIAN_DATE[1], DQ_SHOUBIAN_DATE[2],DQ_SHOUBIAN_DATE[3] );
	
	if varLastday ~= varToday then
		return 0
	end

	local varDaycount = GetPlayerGameData(varMap, varPlayer, DQ_SHOUBIAN_DAYCOUNT[1], DQ_SHOUBIAN_DAYCOUNT[2],DQ_SHOUBIAN_DAYCOUNT[3] );
	return varDaycount;

	

end
