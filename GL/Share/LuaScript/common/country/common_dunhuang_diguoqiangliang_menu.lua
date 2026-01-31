x300893_var_FileId = 300893
x300893_var_QuestName = "【国家】敌国情报"

x300893_var_DayCountLimited	=	1


x300893_var_SceneIdList = {51,151,251,351}
function x300893_ProcEnumEvent( varMap, varPlayer, varTalknpc, varIndex )
	local varCountry = GetCurCountry( varMap, varPlayer )
	local Level = GetLevel(varMap, varPlayer)
	if Level >= 40 then
		if varCountry<=3 and varCountry>=0 then
			if varMap == x300893_var_SceneIdList[varCountry+1] then
		
				TalkAppendButton(varMap,x300893_var_FileId, x300893_var_QuestName, 8)
			end
		end
	end
end

function x300893_ProcEventEntry( varMap , varPlayer , varTalknpc , varState , varIndex )

	local varCountry = GetCurCountry( varMap, varPlayer )
		StartTalkTask(varMap)
			local varReadme ="#Y【国家】敌国情报"
			local quest1 = "楼兰情报"
			local quest2 = "天山情报"
			local quest3 = "昆仑情报"
			local quest4 = "敦煌情报"

			local varScript = 300881

			local varQuestId1 = 7652
			local varQuestId2 = 7655
			local varQuestId3 = 7658
			local varQuestId4 = 7661

			local state1 = GetQuestStateNM(varMap, varPlayer, varTalknpc, varQuestId1);
			local state2 = GetQuestStateNM(varMap, varPlayer, varTalknpc, varQuestId2);
			local state3 = GetQuestStateNM(varMap, varPlayer, varTalknpc, varQuestId3);
			local state4 = GetQuestStateNM(varMap, varPlayer, varTalknpc, varQuestId4);

			local nDayCount1 = x300893_GetDayCount(varMap, varPlayer, DQ_MIBAO_LOULAN_DATE,DQ_MIBAO_LOULAN_DAYCOUNT)
			local nDayCount2 = x300893_GetDayCount(varMap, varPlayer, DQ_MIBAO_LAIYIN_DATE,DQ_MIBAO_LAIYIN_DAYCOUNT)
			local nDayCount3 = x300893_GetDayCount(varMap, varPlayer, DQ_MIBAO_KUNLUN_DATE,DQ_MIBAO_KUNLUN_DAYCOUNT)
			local nDayCount4 = x300893_GetDayCount(varMap, varPlayer, DQ_MIBAO_DUNHUANG_DATE,DQ_MIBAO_DUNHUANG_DAYCOUNT)


			if varCountry == 0 then
				if nDayCount2>=x300893_var_DayCountLimited and nDayCount3>=x300893_var_DayCountLimited and nDayCount4>=x300893_var_DayCountLimited then
					StartTalkTask(varMap);
						TalkAppendString(varMap, "很抱歉，您已经接取了三个国家的任务，请明日再来！");
					StopTalkTask();
					DeliverTalkTips(varMap, varPlayer);
					Msg2Player(varMap,varPlayer,"很抱歉，您已经接取了三个国家的任务，请明日再来！",8,2);
					return 0;

				end
			elseif varCountry == 1 then
				if nDayCount1>=x300893_var_DayCountLimited and nDayCount3>=x300893_var_DayCountLimited and nDayCount4>=x300893_var_DayCountLimited then
					StartTalkTask(varMap);
						TalkAppendString(varMap, "很抱歉，您已经接取了三个国家的任务，请明日再来！");
					StopTalkTask();
					DeliverTalkTips(varMap, varPlayer);
					Msg2Player(varMap,varPlayer,"很抱歉，您已经接取了三个国家的任务，请明日再来！",8,2);
					return 0;

				end
			elseif varCountry == 2 then
				if nDayCount1>=x300893_var_DayCountLimited and nDayCount2>=x300893_var_DayCountLimited and nDayCount4>=x300893_var_DayCountLimited then
					StartTalkTask(varMap);
						TalkAppendString(varMap, "很抱歉，您已经接取了三个国家的任务，请明日再来！");
					StopTalkTask();
					DeliverTalkTips(varMap, varPlayer);
					Msg2Player(varMap,varPlayer,"很抱歉，您已经接取了三个国家的任务，请明日再来！",8,2);
					return 0;

				end
			elseif varCountry == 3 then
				if nDayCount1>=x300893_var_DayCountLimited and nDayCount2>=x300893_var_DayCountLimited and nDayCount3>=x300893_var_DayCountLimited then
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
			TalkAppendString(varMap,"\t知己知彼，百战不殆。我们的密探常常会送回一些重要的情报。")
			if varCountry == 0 then
				if nDayCount2<x300893_var_DayCountLimited then
					TalkAppendButton(varMap, varScript, quest2, state2, varQuestId2)
				end
				if nDayCount3<x300893_var_DayCountLimited then
					TalkAppendButton(varMap, varScript, quest3, state3, varQuestId3)
				end
				if nDayCount4<x300893_var_DayCountLimited then
					TalkAppendButton(varMap, varScript, quest4, state4, varQuestId4)
				end

			elseif varCountry == 1 then
				if nDayCount1<x300893_var_DayCountLimited then
					TalkAppendButton(varMap, varScript, quest1, state1, varQuestId1)
				end
				if nDayCount3<x300893_var_DayCountLimited then
					TalkAppendButton(varMap, varScript, quest3, state3, varQuestId3)
				end
				if nDayCount4<x300893_var_DayCountLimited then
					TalkAppendButton(varMap, varScript, quest4, state4, varQuestId4)
				end
			elseif varCountry == 2 then
				if nDayCount1<x300893_var_DayCountLimited then
					TalkAppendButton(varMap, varScript, quest1, state1, varQuestId1)
				end
				if nDayCount2<x300893_var_DayCountLimited then
					TalkAppendButton(varMap, varScript, quest2, state2, varQuestId2)
				end
				if nDayCount4<x300893_var_DayCountLimited then
					TalkAppendButton(varMap, varScript, quest4, state4, varQuestId4)
				end
			elseif varCountry == 3 then
				if nDayCount1<x300893_var_DayCountLimited then
					TalkAppendButton(varMap, varScript, quest1, state1, varQuestId1)
				end
				if nDayCount2<x300893_var_DayCountLimited then
					TalkAppendButton(varMap, varScript, quest2, state2, varQuestId2)
				end
				if nDayCount3<x300893_var_DayCountLimited then
					TalkAppendButton(varMap, varScript, quest3, state3, varQuestId3)
				end
			end
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
end





function x300893_GetDayCount(varMap, varPlayer, nDayIndex, nDayCountIndex)



	local varToday = GetDayOfYear()
	local varLastday = GetPlayerGameData(varMap, varPlayer, nDayIndex[1], nDayIndex[2],nDayIndex[3] );
	
	if varLastday ~= varToday then
		return 0
	end

	local varDaycount = GetPlayerGameData(varMap, varPlayer, nDayCountIndex[1], nDayCountIndex[2],nDayCountIndex[3] );
	return varDaycount;

	

end
