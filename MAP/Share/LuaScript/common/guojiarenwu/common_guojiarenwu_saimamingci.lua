--DECLARE_QUEST_INFO_START-- 
x430608_var_FileId 					= 	430608
x430608_var_QuestName				= 	"【赛马】名次查询" 
x430608_var_QuestInfo				= 	""

--Gameopen
x430608_var_GameOpen = 1099

--DECLARE_QUEST_INFO_STOP--

function x430608_ProcEnumEvent( varMap, varPlayer, varTalknpc )
	
	TalkAppendButton( varMap,x430608_var_FileId, x430608_var_QuestName,0, -1 )

end

function x430608_ProcEventEntry(varMap, varPlayer,varTalknpc)	
		StartTalkTask(varMap)
		local Readme_1 = "#Y【赛马】本月名次查询#r#W"
		local mingciinfo = ""
	
		if GetGameOpenById( x430608_var_GameOpen ) <= 0 then
			mingciinfo = "赛马名次尚未统计出来，暂时无法查询"
		else
			local name=""
			local count = {}
			local year,month,day = GetYearMonthDay()
			local RecordeMonth = 0;
			for idx = 0, 3 do
				RecordeMonth = GetCountryParamByBit(idx,CD_COUNTYY_SAIMA_COUNT,28,4)
				if (RecordeMonth ~= month) then
					SetCountryParam(varMap,idx,CD_COUNTYY_SAIMA_COUNT,month)
				end
				name = GetCountryName(idx)
				for nMingci = 1, 4 do
					count[nMingci] = GetCountryParamByBit(idx,CD_COUNTYY_SAIMA_COUNT,(nMingci-1)*6,6)
				end
				mingciinfo = mingciinfo .. "#W" .. name .. "：\n#R第1名：" .. count[1] .. "次；" .. "第2名" .. count[2] .. "次；".. "第3名" .. count[3] .. "次；\n"
			end
		end
		
		TalkAppendString(varMap, Readme_1);
		TalkAppendString(varMap, mingciinfo);
		StopTalkTask(varMap);
		DeliverTalkInfo( varMap, varPlayer, varTalknpc, x430608_var_FileId, -1 );
end 

function x430608_ProcAcceptCheck( varMap, varPlayer, varTalknpc )

end

function x430608_ProcAccept( varMap, varPlayer )
end

function x430608_ProcQuestAbandon( varMap, varPlayer, varQuest )
end

function x430608_ProcContinue( varMap, varPlayer, varTalknpc )
end

function x430608_CheckSubmit( varMap, varPlayer )
end

function x430608_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end

function x430608_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end

function x430608_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end

function x430608_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
