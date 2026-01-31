
--DECLARE_QUEST_INFO_START--
x302596_var_FileId 					= 302596
x302596_var_MissionName				=	"【活动】领奖活动二"
x302596_var_DemandItem 				=	{}
x302596_var_ExpBonus 					= 0

x302596_var_BonusItem					=	{}
x302596_var_BonusChoiceItem 	=	{}
x302596_var_MaxCount					=	1	--每天任务限制
--DECLARE_QUEST_INFO_STOP-- 

x302596_var_GameId 						= 1102
x302596_BuffId = 7798														
x302596_var_FeastId						= 13			

--**********************************
function x302596_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

		local year, month, day = GetYearMonthDay();
		local day1 = GetDayOfYear()
		local hour,min1,sec = GetHourMinSec()
		if year == 2012 and day1 > 270 and day1 <274 then
			TalkAppendButton(varMap, x302596_var_FileId, x302596_var_MissionName,3,1)
		else
			return
		end
end


function x302596_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	
	if GetGameOpenById(x302596_var_GameId) ~= 1 then
		return
	end
	local feastid = GetPlayerGameData( varMap, varPlayer, MD_FEAST_INDEX[ 1], MD_FEAST_INDEX[ 2], MD_FEAST_INDEX[ 3] )
	if feastid < x302596_var_FeastId then
		LuaCallNoclosure(888894,"Feast_SetCurrentId",varMap,varPlayer,x302596_var_FeastId)
		SetPlayerGameData( varMap, varPlayer, MD_FEAST_INDEX[ 1], MD_FEAST_INDEX[ 2], MD_FEAST_INDEX[ 3] ,x302596_var_FeastId)				
	end
	
	if extid == 1 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y【领奖活动二】活动")
		TalkAppendString(varMap,"\n\t#W在9月28、9月29日和9月30日期间，每日#R20:00#W到#R21:00#W,可参加领奖活动二活动，在活动期间内，每隔10秒钟您将获得一次奖励！更有机会获得#R烈炎碎片、掌门牌#W等稀有物品！\n\t#R此活动需要较多的背包空间！")
		TalkAppendButton(varMap, x302596_var_FileId, "参加【领奖活动二】活动",3,2)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x302596_var_FileId, x302596_var_MissionName)
	elseif extid == 2 then
	--检测是否已有BUFF
		local buffID = IsHaveSpecificImpact( varMap, varPlayer, x302596_BuffId)
		if buffID == 1 then 
			Msg2Player(varMap,varPlayer,"您正在参与领奖活动二活动！",8,3)
			return
		end
	--领取流程
		local year, month, day = GetYearMonthDay();
		local day1 = GetDayOfYear()
		local hour,min1,sec = GetHourMinSec()
		if year == 2012 and  day1 > 270 and day1 <274 then
		
				local varToday = GetDayOfYear()
				local varLastday = GetPlayerGameData(varMap, varPlayer, MD_GETBUFF_DAY2[1], MD_GETBUFF_DAY2[2], MD_GETBUFF_DAY2[3])						
	    	if hour ~= 20 then
					StartTalkTask(varMap);
					TalkAppendString(varMap, "不在活动时间内");
					StopTalkTask();
					DeliverTalkMenu(varMap, varPlayer,varTalknpc,x302596_var_FileId, x302596_var_MissionName)
					Msg2Player(varMap,varPlayer,"不在活动时间内",8,3)
					return 0
				elseif varLastday == varToday then				
						StartTalkTask(varMap);
						TalkAppendString(varMap, "您已领取过！");
						StopTalkTask();
						DeliverTalkMenu(varMap, varPlayer,varTalknpc,x302596_var_FileId, x302596_var_MissionName)
						Msg2Player(varMap, varPlayer,"您已领取过！",8,3)
						return 0
				elseif varLastday ~= varToday then
					StartTalkTask(varMap);
					TalkAppendString(varMap, "#Y【领奖活动二】");
					TalkAppendString(varMap, "");
					TalkAppendString(varMap, "\n\t您顺利参与领奖活动二活动，在接下来的一小时内您将获得奖励物品！");
					StopTalkTask();
					DeliverTalkMenu(varMap, varPlayer,varTalknpc,x302596_var_FileId, x302596_var_MissionName)
					Msg2Player(varMap, varPlayer,"您顺利参与领奖活动二活动！",8,3)
					SendSpecificImpactToUnit(varMap, varPlayer,varPlayer,varPlayer, x302596_BuffId,0 )
					SetPlayerGameData(varMap, varPlayer, MD_GETBUFF_DAY2[1], MD_GETBUFF_DAY2[2], MD_GETBUFF_DAY2[3],varToday)
					StopTalkTask()
					GamePlayScriptLog( varMap, varPlayer, 3796)
				end
				StopTalkTask()
				DeliverTalkMenu(varMap, varPlayer,varTalknpc,x302596_var_FileId, x302596_var_MissionName)
		end
	end	
end


function x302596_GetMissionExpBonus(varMap, varPlayer )

end

function x302596_GetDayCount(varMap, varPlayer)

end


function x302596_SetDayCount(varMap, varPlayer)

end

function x302596_GetCost(varMap, varPlayer)

end

function x302596_GetExpBonusMuil(varMap, varPlayer )

end
