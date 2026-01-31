
--DECLARE_QUEST_INFO_START--
x302527_var_FileId 					= 302527
x302527_var_MissionName				=	"【活动】领奖活动一"
x302527_var_DemandItem 				=	{}
x302527_var_ExpBonus 					= 0

x302527_var_BonusItem					=	{}
x302527_var_BonusChoiceItem 	=	{}
x302527_var_MaxCount					=	1	--每天任务限制
--DECLARE_QUEST_INFO_STOP-- 

x302527_var_GameId 						= 1102
x302527_BuffId = 7767														
x302527_var_FeastId						= 13			

--**********************************
function x302527_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

		local year, month, day = GetYearMonthDay();
		local day1 = GetDayOfYear()
		local hour,min1,sec = GetHourMinSec()
		if year == 2012 and day1 > 263 and day1 <267 then
			TalkAppendButton(varMap, x302527_var_FileId, x302527_var_MissionName,3,1)
		else
			return
		end
end


function x302527_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	
	if GetGameOpenById(x302527_var_GameId) ~= 1 then
		return
	end
	local feastid = GetPlayerGameData( varMap, varPlayer, MD_FEAST_INDEX[ 1], MD_FEAST_INDEX[ 2], MD_FEAST_INDEX[ 3] )
	if feastid < x302527_var_FeastId then
		LuaCallNoclosure(888894,"Feast_SetCurrentId",varMap,varPlayer,x302527_var_FeastId)
		SetPlayerGameData( varMap, varPlayer, MD_FEAST_INDEX[ 1], MD_FEAST_INDEX[ 2], MD_FEAST_INDEX[ 3] ,x302527_var_FeastId)				
	end
	
	if extid == 1 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y【领奖活动一】活动")
		TalkAppendString(varMap,"\n\t#W在9月21日、9月22日和9月23日期间，每日#R20:00#W到#R21:00#W,可参加领奖活动一活动，在活动期间内，每隔10秒钟您将获得一次奖励！更有机会获得#R烈炎碎片、掌门牌#W等稀有物品！\n\t#R此活动需要较多的背包空间！")
		TalkAppendButton(varMap, x302527_var_FileId, "参加【领奖活动一】活动",3,2)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x302527_var_FileId, x302527_var_MissionName)
	elseif extid == 2 then
	--检测是否已有BUFF
		local buffID = IsHaveSpecificImpact( varMap, varPlayer, x302527_BuffId)
		if buffID == 1 then 
			Msg2Player(varMap,varPlayer,"您正在参与领奖活动一活动！",8,3)
			return
		end
	--领取流程
		local year, month, day = GetYearMonthDay();
		local day1 = GetDayOfYear()
		local hour,min1,sec = GetHourMinSec()
		if year == 2012 and  day1 > 263 and day1 <267 then
		
				local varToday = GetDayOfYear()
				local varLastday = GetPlayerGameData(varMap, varPlayer, MD_GETBUFF_DAY2[1], MD_GETBUFF_DAY2[2], MD_GETBUFF_DAY2[3])						
	    	if hour ~= 20 then
					StartTalkTask(varMap);
					TalkAppendString(varMap, "不在活动时间内");
					StopTalkTask();
					DeliverTalkMenu(varMap, varPlayer,varTalknpc,x302527_var_FileId, x302527_var_MissionName)
					Msg2Player(varMap,varPlayer,"不在活动时间内",8,3)
					return 0
				elseif varLastday == varToday then				
						StartTalkTask(varMap);
						TalkAppendString(varMap, "您已领取过！");
						StopTalkTask();
						DeliverTalkMenu(varMap, varPlayer,varTalknpc,x302527_var_FileId, x302527_var_MissionName)
						Msg2Player(varMap, varPlayer,"您已领取过！",8,3)
						return 0
				elseif varLastday ~= varToday then
					StartTalkTask(varMap);
					TalkAppendString(varMap, "#Y【领奖活动一】");
					TalkAppendString(varMap, "");
					TalkAppendString(varMap, "\n\t您顺利参与领奖活动一活动，在接下来的一小时内您将获得奖励物品！");
					StopTalkTask();
					DeliverTalkMenu(varMap, varPlayer,varTalknpc,x302527_var_FileId, x302527_var_MissionName)
					Msg2Player(varMap, varPlayer,"您顺利参与领奖活动一活动！",8,3)
					SendSpecificImpactToUnit(varMap, varPlayer,varPlayer,varPlayer, x302527_BuffId,0 )
					SetPlayerGameData(varMap, varPlayer, MD_GETBUFF_DAY2[1], MD_GETBUFF_DAY2[2], MD_GETBUFF_DAY2[3],varToday)
					StopTalkTask()
					GamePlayScriptLog( varMap, varPlayer, 3796)
				end
				StopTalkTask()
				DeliverTalkMenu(varMap, varPlayer,varTalknpc,x302527_var_FileId, x302527_var_MissionName)
		end
	end	
end


function x302527_GetMissionExpBonus(varMap, varPlayer )

end

function x302527_GetDayCount(varMap, varPlayer)

end


function x302527_SetDayCount(varMap, varPlayer)

end

function x302527_GetCost(varMap, varPlayer)

end

function x302527_GetExpBonusMuil(varMap, varPlayer )

end
