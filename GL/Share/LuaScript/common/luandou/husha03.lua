
x589003_var_FileId 	= 589003
x589003_var_Name 	= "#R【开启】大乱斗"
if x589003_var_CountList == nil then x589003_var_CountList = {} end
x589003_var_MaxCount = 1
function x589003_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,589003,"#R【开启】大乱斗",3,1)
end

function x589003_ProcEventEntry( varMap, varPlayer, varTalknpc,varState,varIndex)	

if varIndex == 1 then
 
 
	local Readme_1 = "#Y大乱斗开启功能#r"
 
	local Readme_2 = "\t#G开启时间：周一、周二、周三、周四、周五、周六和周日#R8:00~22:00#W任何玩家可以来我这里使用此功能。#r"
	
	local Readme_3 = "\t#R开启大乱斗活动后！场景内所有玩家在8点-23点之间将获得怒杀状态，可以击杀本国和敌国任何玩家#r"
	
		
	local varReadme = Readme_1..Readme_2..Readme_3

	StartTalkTask(varMap);TalkAppendString(varMap,varReadme);StopTalkTask(varMap);DeliverTalkInfo(varMap, varPlayer, varTalknpc, 589003, -1)
	
	end
	
end



function x589003_ProcAcceptCheck( varMap, varPlayer, varTalknpc )

	local minOfDay = GetMinOfDay()
	local weekIdx = GetWeek()

	if weekIdx~=0 and weekIdx~=1 and weekIdx~=2 and weekIdx~=3 and weekIdx~=4 and weekIdx~=5 and weekIdx~=6 then
		Msg2Player(varMap,varPlayer,"只有周一、周二、周三、周四、周五、周六和周日#R8:00~22:00才能开启！",8,2)
		Msg2Player(varMap,varPlayer,"只有周一、周二、周三、周四、周五、周六和周日#R8:00~22:00才能开启！",8,3)
		return
	end
	
	if minOfDay < 480 then
		Msg2Player(varMap,varPlayer,"只有周一、周二、周三、周四、周五、周六和周日#R8:00~22:00才能开启！",8,2)
		Msg2Player(varMap,varPlayer,"只有周一、周二、周三、周四、周五、周六和周日#R8:00~22:00才能开启！",8,3)
		return
	end
	
	if minOfDay > 1320 then
		Msg2Player(varMap,varPlayer,"只有周一、周二、周三、周四、周五、周六和周日#G8:00~22:00才能开启！",8,2)
		Msg2Player(varMap,varPlayer,"只有周一、周二、周三、周四、周五、周六和周日#G8:00~22:00才能开启！",8,3)
		return
	end
	local restcount = x589003_GetRestCount(varMap, varPlayer)
		if restcount < 0 then
			Msg2Player(varMap,varPlayer,"请下一小时再来",8,2);
			Msg2Player(varMap,varPlayer,"请下一小时再来",8,3);
			return
		end

	ChangeMapRestrictiveMode(varMap, 2) --开

	if 527 == varMap then
			local varMsg1 = "#kN#G大乱斗#o互杀#G模式#S开启#B！驯兽师和冥王出现在印度河！"
			LuaAllScenceM2Wrold(varMap, varMsg1, CHAT_PLANE_SCROLL, 1)
			LuaAllScenceM2Wrold(varMap, varMsg1, CHAT_LEFTDOWN, 1)
			LuaAllScenceM2Wrold(varMap, varMsg1, CHAT_MAIN_RIGHTDOWN, 1)
			CreateMonster(varMap, 18090, 111+random(20,50),124-random(20,50), 31, -1, -1, x589003_var_FileId, 21, 25*60*1000, random(0,20), "", "爆坐骑", -1)
			CreateMonster(varMap, 18091, 111+random(20,50),124-random(20,50), 31, -1, -1, x589003_var_FileId, 21, 25*60*1000, random(0,20), "", "爆坐骑", -1)
			CreateMonster(varMap, 18092, 111+random(20,50),124-random(20,50), 31, -1, -1, x589003_var_FileId, 21, 25*60*1000, random(0,20), "", "爆坐骑", -1)
			CreateMonster(varMap, 18093, 111+random(20,50),124-random(20,50), 31, -1, -1, x589003_var_FileId, 21, 25*60*1000, random(0,20), "", "爆坐骑", -1)
			CreateMonster(varMap, 18094, 111+random(20,50),124-random(20,50), 31, -1, -1, x589003_var_FileId, 21, 25*60*1000, random(0,20), "", "爆坐骑", -1)
			CreateMonster(varMap, 18095, 111+random(20,50),124-random(20,50), 31, -1, -1, x589003_var_FileId, 21, 25*60*1000, random(0,20), "", "爆坐骑", -1)
			
			CreateMonster(varMap, 3247, 111+random(20,50),124-random(20,50), 31, -1, -1, x589003_var_FileId, 21, 25*60*1000, random(0,20), "", "爆道具", -1)
			CreateMonster(varMap, 3248, 111+random(20,50),124-random(20,50), 31, -1, -1, x589003_var_FileId, 21, 25*60*1000, random(0,20), "", "爆道具", -1)
			CreateMonster(varMap, 3249, 111+random(20,50),124-random(20,50), 31, -1, -1, x589003_var_FileId, 21, 25*60*1000, random(0,20), "", "爆道具", -1)
			
			
			
	else
			local varMsg1 = "#kN#G大乱斗#o互杀#G模式#S开启#B！"
			LuaAllScenceM2Wrold(varMap, varMsg1, CHAT_PLANE_SCROLL, 1)
			LuaAllScenceM2Wrold(varMap, varMsg1, CHAT_LEFTDOWN, 1)
			LuaAllScenceM2Wrold(varMap, varMsg1, CHAT_MAIN_RIGHTDOWN, 1)
	end

end

function x589003_GetRestCount(varMap, varPlayer)
	local guid = GetGUID(varMap, varPlayer)
	local hour, min, second = GetHourMinSec()
	if hour ~= x589003_var_CurHour then
		x589003_var_CountList = {}
		x589003_var_CurHour = hour
	end
	
	local count = x589003_var_CountList[guid]
	if count == nil then
		count = x589003_var_MaxCount
	end
	x589003_var_CountList[guid] = count - 1
	return count - 1
end

function x589003_ProcAccept( varMap, varPlayer )
end

function x589003_ProcQuestAbandon( varMap, varPlayer, varQuest )

end

function x589003_ProcContinue( varMap, varPlayer, varTalknpc )

end

function x589003_CheckSubmit( varMap, varPlayer )

end

function x589003_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end

function x589003_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end

function x589003_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end

function x589003_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
