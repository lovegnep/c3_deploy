
--DECLARE_QUEST_INFO_START--
x310251_var_FileId 					= 310251
x310251_var_MissionName				=	"线上奖励"
x310251_var_DemandItem 				=	{}
x310251_var_ExpBonus 					= 0

x310251_var_BonusItem					=	{}
x310251_var_BonusChoiceItem 	=	{}
x310251_var_MaxCount					=	1	--每天任务限制
--DECLARE_QUEST_INFO_STOP-- 

x310251_var_GameId 						= 1102
x310251_BuffId = 7767														
														

--**********************************
function x310251_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	if GetGameOpenById(x310251_var_GameId) ~= 1 then
		return
	end
		local year, month, day = GetYearMonthDay();
		local day1 = GetDayOfYear()
		local hour,min1,sec = GetHourMinSec()
		if year == 2012 and day1 >= 119 and day1 <= 121 then
			TalkAppendButton(varMap, x310251_var_FileId, x310251_var_MissionName,3,1)
		else
			return
		end
end


function x310251_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	
	if GetGameOpenById(x310251_var_GameId) ~= 1 then
		return
	end
	return

	if extid == 1 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y线上奖励活动")
		TalkAppendString(varMap,"\t#W在4月29日至5月1日，每晚#R9:00#W到#R22:00#W,可领取线上获奖BUFF，有机会获得惊喜奖励！")   
		TalkAppendButton(varMap, x310251_var_FileId, "领取奖励",3,2)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x310251_var_FileId, x310251_var_MissionName)
	elseif extid == 2 then
	--检测是否已有BUFF
		local buffID = IsHaveSpecificImpact( varMap, varPlayer, x310251_BuffId)
		if buffID == 1 then 
			Msg2Player(varMap,varPlayer,"您已在领奖中，请稍后再试！",8,3)
			return
		end
	--领取流程
		local year, month, day = GetYearMonthDay();
		local day1 = GetDayOfYear()
		local hour,min1,sec = GetHourMinSec()
		if year == 2012 and day1 >= 119 and day1 <= 121 then
		
				local varToday = GetDayOfYear()
				local varLastday = GetPlayerGameData(varMap, varPlayer, MD_GETBUFF_DAY1[1], MD_GETBUFF_DAY1[2], MD_GETBUFF_DAY1[3])						
	    	if hour < 9 or hour >21 then
					StartTalkTask(varMap);
					TalkAppendString(varMap, "不在活动时间内");
					StopTalkTask();
					DeliverTalkMenu(varMap, varPlayer,varTalknpc,x310251_var_FileId, x310251_var_MissionName)
					Msg2Player(varMap,varPlayer,"不在活动时间内",8,3)
					return 0
				elseif varLastday == varToday then				
						StartTalkTask(varMap);
						TalkAppendString(varMap, "您已领取过！");
						StopTalkTask();
						DeliverTalkMenu(varMap, varPlayer,varTalknpc,x310251_var_FileId, x310251_var_MissionName)
						Msg2Player(varMap, varPlayer,"您已领取过！",8,3)
						return 0
				elseif varLastday ~= varToday then
					StartTalkTask(varMap);
					TalkAppendString(varMap, "获得线上获奖资格！");
					StopTalkTask();
					DeliverTalkMenu(varMap, varPlayer,varTalknpc,x310251_var_FileId, x310251_var_MissionName)
					Msg2Player(varMap, varPlayer,"获得线上获奖资格！",8,3)
					SendSpecificImpactToUnit(varMap, varPlayer,varPlayer,varPlayer, x310251_BuffId,0 )
					SetPlayerGameData(varMap, varPlayer, MD_GETBUFF_DAY1[1], MD_GETBUFF_DAY1[2], MD_GETBUFF_DAY1[3],varToday)
					StopTalkTask()
					GamePlayScriptLog( varMap, varPlayer, 3735)
				end
				StopTalkTask()
				DeliverTalkMenu(varMap, varPlayer,varTalknpc,x310251_var_FileId, x310251_var_MissionName)
		end
	end	
end


function x310251_GetMissionExpBonus(varMap, varPlayer )

end

function x310251_GetDayCount(varMap, varPlayer)

end


function x310251_SetDayCount(varMap, varPlayer)

end

function x310251_GetCost(varMap, varPlayer)

end

function x310251_GetExpBonusMuil(varMap, varPlayer )

end
