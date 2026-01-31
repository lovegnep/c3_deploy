
x300727_var_FileId = 300727
x300727_var_QuestName = "【国家】敌国刺杀"

x300727_var_DayCountLimited = 1


x300727_var_SceneIdList = {51,151,251,351}

function x300727_ProcEnumEvent( varMap, varPlayer, varTalknpc, varIndex )
	
	local varCountry = GetCurCountry( varMap, varPlayer )
	local Level = GetLevel(varMap, varPlayer)
	if Level >= 40 then
		if varCountry<=3 and varCountry>=0 then
			if varMap == x300727_var_SceneIdList[varCountry+1] then
		
				TalkAppendButton(varMap,x300727_var_FileId, x300727_var_QuestName, 8)
			end
		end
	end	
end

function x300727_ProcEventEntry( varMap , varPlayer , varTalknpc , varState , varIndex )
	local varCountry = GetCurCountry( varMap, varPlayer )

		StartTalkTask(varMap)
			local varReadme ="#Y【国家】敌国刺杀"
			local quest1 = "楼兰刺杀"
			local quest2 = "天山刺杀"
			local quest3 = "昆仑刺杀"
			local quest4 = "敦煌刺杀"

			local varScript = 300731

			local varQuestId1 = 7560
			local varQuestId2 = 7566
			local varQuestId3 = 7572
			local varQuestId4 = 7578
			local state1 = GetQuestStateNM(varMap, varPlayer, varTalknpc, varQuestId1);
			local state2 = GetQuestStateNM(varMap, varPlayer, varTalknpc, varQuestId2);
			local state3 = GetQuestStateNM(varMap, varPlayer, varTalknpc, varQuestId3);
			local state4 = GetQuestStateNM(varMap, varPlayer, varTalknpc, varQuestId4);
			
			local questNewName1 	= "楼兰刺杀（联盟）"
			local questNewName2 	= "天山刺杀（联盟）"
			local questNewName3 	= "昆仑刺杀（联盟）"
			local questNewName4 	= "敦煌刺杀（联盟）"
			local questNewId1 	= 7795
			local questNewId2 	= 7796
			local questNewId3 	= 7797
			local questNewId4 	= 7798
			local varNewscript 		= 310004

			
			local league = -1
		    for varI = 0, 3 do
		    league = -1
					if LuaCallNoclosure(305015, "CheckCountryColleague", varMap, varCountry, varI) == 1 then
						league = varI
						if league ~= -1 then
							if league == 0 and IsHaveQuestNM(varMap, varPlayer, varQuestId1) == 0 then
								quest1 = questNewName1
								varQuestId1 = questNewId1
								state1 = GetQuestStateNM(varMap, varPlayer, varTalknpc, questNewId1)
							elseif league == 1 and IsHaveQuestNM(varMap, varPlayer, varQuestId2) == 0 then
								quest2 = questNewName2
								varQuestId2 = questNewId2
								state2 = GetQuestStateNM(varMap, varPlayer, varTalknpc, questNewId2)
							elseif league == 2 and IsHaveQuestNM(varMap, varPlayer, varQuestId3) == 0 then
								quest3 = questNewName3
								varQuestId3 = questNewId3
								state3 = GetQuestStateNM(varMap, varPlayer, varTalknpc, questNewId3)
							elseif league == 3 and IsHaveQuestNM(varMap, varPlayer, varQuestId4) == 0 then
								quest4 = questNewName4
								varQuestId4 = questNewId4
								state4 = GetQuestStateNM(varMap, varPlayer, varTalknpc, questNewId4)
							end
						end
					end
				end
			
			
			if IsHaveQuestNM(varMap, varPlayer, questNewId1) == 1 then
				quest1 = questNewName1
				varQuestId1 = questNewId1
				state1 = GetQuestStateNM(varMap, varPlayer, varTalknpc, questNewId1)
			elseif IsHaveQuestNM(varMap, varPlayer, questNewId2) == 1 then 
				quest2 = questNewName2
				varQuestId2 = questNewId2
				state2 = GetQuestStateNM(varMap, varPlayer, varTalknpc, questNewId2)
			elseif IsHaveQuestNM(varMap, varPlayer, questNewId3) == 1 then 
				quest3 = questNewName3
				varQuestId3 = questNewId3
				state3 = GetQuestStateNM(varMap, varPlayer, varTalknpc, questNewId3)
			elseif IsHaveQuestNM(varMap, varPlayer, questNewId4) == 1 then 
				quest4 = questNewName4
				varQuestId4 = questNewId4
				state4 = GetQuestStateNM(varMap, varPlayer, varTalknpc, questNewId4)
			end
			

			local nDayCount1 = x300727_GetDayCount(varMap, varPlayer, DQ_SHAGUAI_LOULAN_DATE,DQ_SHAGUAI_LOULAN_DAYCOUNT)
			local nDayCount2 = x300727_GetDayCount(varMap, varPlayer, DQ_SHAGUAI_LAIYIN_DATE,DQ_SHAGUAI_LAIYIN_DAYCOUNT)
			local nDayCount3 = x300727_GetDayCount(varMap, varPlayer, DQ_SHAGUAI_KUNLUN_DATE,DQ_SHAGUAI_KUNLUN_DAYCOUNT)
			local nDayCount4 = x300727_GetDayCount(varMap, varPlayer, DQ_SHAGUAI_DUNHUANG_DATE,DQ_SHAGUAI_DUNHUANG_DAYCOUNT)
			
			if varCountry == 0 then
				if nDayCount2>=x300727_var_DayCountLimited and nDayCount3>=x300727_var_DayCountLimited and nDayCount4>=x300727_var_DayCountLimited then
					StartTalkTask(varMap);
						TalkAppendString(varMap, "很抱歉，您已经接取了三个国家的任务，请明日再来！");
					StopTalkTask();
					DeliverTalkTips(varMap, varPlayer);
					Msg2Player(varMap,varPlayer,"很抱歉，您已经接取了三个国家的任务，请明日再来！",8,2);
					return 0;

				end
			elseif varCountry == 1 then
				if nDayCount1>=x300727_var_DayCountLimited and nDayCount3>=x300727_var_DayCountLimited and nDayCount4>=x300727_var_DayCountLimited then
					StartTalkTask(varMap);
						TalkAppendString(varMap, "很抱歉，您已经接取了三个国家的任务，请明日再来！");
					StopTalkTask();
					DeliverTalkTips(varMap, varPlayer);
					Msg2Player(varMap,varPlayer,"很抱歉，您已经接取了三个国家的任务，请明日再来！",8,2);
					return 0;

				end
			elseif varCountry == 2 then
				if nDayCount1>=x300727_var_DayCountLimited and nDayCount2>=x300727_var_DayCountLimited and nDayCount4>=x300727_var_DayCountLimited then
					StartTalkTask(varMap);
						TalkAppendString(varMap, "很抱歉，您已经接取了三个国家的任务，请明日再来！");
					StopTalkTask();
					DeliverTalkTips(varMap, varPlayer);
					Msg2Player(varMap,varPlayer,"很抱歉，您已经接取了三个国家的任务，请明日再来！",8,2);
					return 0;

				end
			elseif varCountry == 3 then
				if nDayCount1>=x300727_var_DayCountLimited and nDayCount2>=x300727_var_DayCountLimited and nDayCount3>=x300727_var_DayCountLimited then
					StartTalkTask(varMap);
						TalkAppendString(varMap, "很抱歉，您已经接取了三个国家的任务，请明日再来！");
					StopTalkTask();
					DeliverTalkTips(varMap, varPlayer);
					Msg2Player(varMap,varPlayer,"很抱歉，您已经接取了三个国家的任务，请明日再来！",8,2);
					return 0;

				end
			end
	

			TalkAppendString(varMap,varReadme)
			TalkAppendString(varMap,"")
			TalkAppendString(varMap,"\t近日，敌国的边塞主将突然增派了大量人手巡查他们整个边塞地区，我国暗探损失惨重。\n\t绝不能让这种情况继续下去！你立刻潜入敌国，刺杀他们的主将，如果得手，定能让他们整个边塞军务陷入混乱！")
			if varCountry == 0 then
				if nDayCount2<x300727_var_DayCountLimited then
					if varQuestId2 == questNewId2 then
						TalkAppendButton(varMap, varNewscript, quest2, state2, varQuestId2)
					else
						TalkAppendButton(varMap, varScript, quest2, state2, varQuestId2)
					end
				end
				if nDayCount3<x300727_var_DayCountLimited then				
					if varQuestId3 == questNewId3 then
						TalkAppendButton(varMap, varNewscript, quest3, state3, varQuestId3)
					else
						TalkAppendButton(varMap, varScript, quest3, state3, varQuestId3)
					end
				end
				if nDayCount4<x300727_var_DayCountLimited then
					if varQuestId4 == questNewId4 then
						TalkAppendButton(varMap, varNewscript, quest4, state4, varQuestId4)
					else
						TalkAppendButton(varMap, varScript, quest4, state4, varQuestId4)
					end
				end
				
			elseif varCountry == 1 then
				if nDayCount1<x300727_var_DayCountLimited then				
					if varQuestId1 == questNewId1 then			
						TalkAppendButton(varMap, varNewscript, quest1, state1, varQuestId1)
					else
						TalkAppendButton(varMap, varScript, quest1, state1, varQuestId1)
					end
				end
				if nDayCount3<x300727_var_DayCountLimited then
					if varQuestId3 == questNewId3 then
						TalkAppendButton(varMap, varNewscript, quest3, state3, varQuestId3)
					else
						TalkAppendButton(varMap, varScript, quest3, state3, varQuestId3)
					end
				end
				if nDayCount4<x300727_var_DayCountLimited then	
					if varQuestId4 == questNewId4 then
						TalkAppendButton(varMap, varNewscript, quest4, state4, varQuestId4)
					else
						TalkAppendButton(varMap, varScript, quest4, state4, varQuestId4)
					end
				end
			elseif varCountry == 2 then
				if nDayCount1<x300727_var_DayCountLimited then
					if varQuestId1 == questNewId1 then			
						TalkAppendButton(varMap, varNewscript, quest1, state1, varQuestId1)
					else
						TalkAppendButton(varMap, varScript, quest1, state1, varQuestId1)
					end
				end
				if nDayCount2<x300727_var_DayCountLimited then
					if varQuestId2 == questNewId2 then
						TalkAppendButton(varMap, varNewscript, quest2, state2, varQuestId2)
					else
						TalkAppendButton(varMap, varScript, quest2, state2, varQuestId2)
					end
				end
				if nDayCount4<x300727_var_DayCountLimited then
					if varQuestId4 == questNewId4 then
						TalkAppendButton(varMap, varNewscript, quest4, state4, varQuestId4)
					else
						TalkAppendButton(varMap, varScript, quest4, state4, varQuestId4)
					end
				end
			elseif varCountry == 3 then
				if nDayCount1<x300727_var_DayCountLimited then	
					if varQuestId1 == questNewId1 then			
						TalkAppendButton(varMap, varNewscript, quest1, state1, varQuestId1)
					else
						TalkAppendButton(varMap, varScript, quest1, state1, varQuestId1)
					end
				end
				if nDayCount2<x300727_var_DayCountLimited then
					if varQuestId2 == questNewId2 then
						TalkAppendButton(varMap, varNewscript, quest2, state2, varQuestId2)
					else
						TalkAppendButton(varMap, varScript, quest2, state2, varQuestId2)
					end
				end
				if nDayCount3<x300727_var_DayCountLimited then
					if varQuestId3 == questNewId3 then
						TalkAppendButton(varMap, varNewscript, quest3, state3, varQuestId3)
					else
						TalkAppendButton(varMap, varScript, quest3, state3, varQuestId3)
					end
				end
			end
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
end




function x300727_GetDayCount(varMap, varPlayer, nDayIndex, nDayCountIndex)



	local varToday = GetDayOfYear()
	local varLastday = GetPlayerGameData(varMap, varPlayer, nDayIndex[1], nDayIndex[2],nDayIndex[3] );
	
	if varLastday ~= varToday then
		return 0
	end

	local varDaycount = GetPlayerGameData(varMap, varPlayer, nDayCountIndex[1], nDayCountIndex[2],nDayCountIndex[3] );
	return varDaycount;

	

end
