
x300902_var_FileId = 300902
x300902_var_QuestName = "【国家】敌国夺旗"

x300902_var_DayCountLimited = 1

x300902_var_SceneIdList = {51,151,251,351}
function x300902_ProcEnumEvent( varMap, varPlayer, varTalknpc, varIndex )
	local varCountry = GetCurCountry( varMap, varPlayer )
	local Level = GetLevel(varMap, varPlayer)
	if Level >= 40 then
		if varCountry<=3 and varCountry>=0 then
			if varMap == x300902_var_SceneIdList[varCountry+1] then
		
				TalkAppendButton(varMap,x300902_var_FileId, x300902_var_QuestName, 8)
			end
		end
	end
end

function x300902_ProcEventEntry( varMap , varPlayer , varTalknpc , varState , varIndex )
	local varCountry = GetCurCountry( varMap, varPlayer )

		StartTalkTask(varMap)
			local varReadme ="#Y【国家】敌国夺旗"
			local quest1 = "楼兰夺旗"
			local quest2 = "天山夺旗"
			local quest3 = "昆仑夺旗"
			local quest4 = "敦煌夺旗"

			local varScript = 300890

			local varQuestId1 = 7694
			local varQuestId2 = 7695
			local varQuestId3 = 7696
			local varQuestId4 = 7697

			local state1 = GetQuestStateNM(varMap, varPlayer, varTalknpc, varQuestId1);
			local state2 = GetQuestStateNM(varMap, varPlayer, varTalknpc, varQuestId2);
			local state3 = GetQuestStateNM(varMap, varPlayer, varTalknpc, varQuestId3);
			local state4 = GetQuestStateNM(varMap, varPlayer, varTalknpc, varQuestId4);

			local nDayCount1 = x300902_GetDayCount(varMap, varPlayer, DQ_DUOQI_LOULAN_DATE,DQ_DUOQI_LOULAN_DAYCOUNT)
			local nDayCount2 = x300902_GetDayCount(varMap, varPlayer, DQ_DUOQI_LAIYIN_DATE,DQ_DUOQI_LAIYIN_DAYCOUNT)
			local nDayCount3 = x300902_GetDayCount(varMap, varPlayer, DQ_DUOQI_KUNLUN_DATE,DQ_DUOQI_KUNLUN_DAYCOUNT)
			local nDayCount4 = x300902_GetDayCount(varMap, varPlayer, DQ_DUOQI_DUNHUANG_DATE,DQ_DUOQI_DUNHUANG_DAYCOUNT)

		


			if varCountry == 0 then
				if nDayCount2>=x300902_var_DayCountLimited and nDayCount3>=x300902_var_DayCountLimited and nDayCount4>=x300902_var_DayCountLimited then
					StartTalkTask(varMap);
						TalkAppendString(varMap, "很抱歉，您已经接取了三个国家的任务，请明日再来");
					StopTalkTask();
					DeliverTalkTips(varMap, varPlayer);
					Msg2Player(varMap,varPlayer,"很抱歉，您已经接取了三个国家的任务，请明日再来",8,2);
					return 0;

				end
			elseif varCountry == 1 then
				if nDayCount1>=x300902_var_DayCountLimited and nDayCount3>=x300902_var_DayCountLimited and nDayCount4>=x300902_var_DayCountLimited then
					StartTalkTask(varMap);
						TalkAppendString(varMap, "很抱歉，您已经接取了三个国家的任务，请明日再来");
					StopTalkTask();
					DeliverTalkTips(varMap, varPlayer);
					Msg2Player(varMap,varPlayer,"很抱歉，您已经接取了三个国家的任务，请明日再来",8,2);
					return 0;

				end
			elseif varCountry == 2 then
				if nDayCount1>=x300902_var_DayCountLimited and nDayCount2>=x300902_var_DayCountLimited and nDayCount4>=x300902_var_DayCountLimited then
					StartTalkTask(varMap);
						TalkAppendString(varMap, "很抱歉，您已经接取了三个国家的任务，请明日再来");
					StopTalkTask();
					DeliverTalkTips(varMap, varPlayer);
					Msg2Player(varMap,varPlayer,"很抱歉，您已经接取了三个国家的任务，请明日再来",8,2);
					return 0;

				end
			elseif varCountry == 3 then
				if nDayCount1>=x300902_var_DayCountLimited and nDayCount2>=x300902_var_DayCountLimited and nDayCount3>=x300902_var_DayCountLimited then
					StartTalkTask(varMap);
						TalkAppendString(varMap, "很抱歉，您已经接取了三个国家的任务，请明日再来");
					StopTalkTask();
					DeliverTalkTips(varMap, varPlayer);
					Msg2Player(varMap,varPlayer,"很抱歉，您已经接取了三个国家的任务，请明日再来",8,2);
					return 0;

				end
			end

			TalkAppendString(varMap,varReadme)
			TalkAppendString(varMap,"")
			TalkAppendString(varMap,"\t兵者，攻心为上。若想要打击敌人的士气，最好的办法莫过于夺取他们的军旗！")
			if varCountry == 0 then

				if nDayCount2<x300902_var_DayCountLimited then
					TalkAppendButton(varMap, varScript, quest2, state2, varQuestId2)
				end
				if nDayCount3<x300902_var_DayCountLimited then
					TalkAppendButton(varMap, varScript, quest3, state3, varQuestId3)
				end
				if nDayCount4<x300902_var_DayCountLimited then
					TalkAppendButton(varMap, varScript, quest4, state4, varQuestId4)
				end
				
			elseif varCountry == 1 then
				if nDayCount1<x300902_var_DayCountLimited then	
					TalkAppendButton(varMap, varScript, quest1, state1, varQuestId1)
				end
				if nDayCount3<x300902_var_DayCountLimited then
					TalkAppendButton(varMap, varScript, quest3, state3, varQuestId3)
				end
				if nDayCount4<x300902_var_DayCountLimited then
					TalkAppendButton(varMap, varScript, quest4, state4, varQuestId4)
				end
			elseif varCountry == 2 then
				if nDayCount1<x300902_var_DayCountLimited then
					TalkAppendButton(varMap, varScript, quest1, state1, varQuestId1)
				end
				if nDayCount2<x300902_var_DayCountLimited then
					TalkAppendButton(varMap, varScript, quest2, state2, varQuestId2)
				end
				if nDayCount4<x300902_var_DayCountLimited then
					TalkAppendButton(varMap, varScript, quest4, state4, varQuestId4)
				end
			elseif varCountry == 3 then
				if nDayCount1<x300902_var_DayCountLimited then
					TalkAppendButton(varMap, varScript, quest1, state1, varQuestId1)
				end
				if nDayCount2<x300902_var_DayCountLimited then
					TalkAppendButton(varMap, varScript, quest2, state2, varQuestId2)
				end
				if nDayCount3<x300902_var_DayCountLimited then
					TalkAppendButton(varMap, varScript, quest3, state3, varQuestId3)
				end
			end
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
end




function x300902_GetLastDay(varMap, varPlayer, nMDIndex, nOffset, nSize)
	local varLastday = GetPlayerGameData(varMap, varPlayer, nMDIndex, nOffset, nSize)
	return varLastday
end




function x300902_GetLastDayCount(varMap, varPlayer, nMDIndex, nOffset, nSize)
	local varDaycount =  GetPlayerGameData(varMap, varPlayer, nMDIndex, nOffset, nSize)
	return varDaycount
end




function x300902_GetDayCount(varMap, varPlayer, nMDDayIndex, nMDCountIndex)
	local varToday = GetDayOfYear()
	local varLastday = x300902_GetLastDay(varMap, varPlayer, nMDDayIndex[1], nMDDayIndex[2], nMDDayIndex[3])

	
	if varToday ~= varLastday then
		return 0
	end

	local varDaycount = x300902_GetLastDayCount(varMap, varPlayer, nMDCountIndex[1], nMDCountIndex[2], nMDCountIndex[3])
	return varDaycount
end
