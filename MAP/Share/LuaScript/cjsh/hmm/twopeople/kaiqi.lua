
x930176_var_FileId 	= 930176
x930176_var_Name 	= "#R【开启】大乱斗"
if x930176_var_CountList == nil then x930176_var_CountList = {} end
x930176_var_MaxCount = 1
function x930176_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,930176,"#R【开启】大乱斗",3,1)
end

function x930176_ProcEventEntry( varMap, varPlayer, varTalknpc,varState,varIndex)	

if varIndex == 1 then
 
 
	local Readme_1 = "#Y大乱斗开启功能#r"
 
	local Readme_2 = "\t#G开启时间：周一、周二、周三、周四、周五、周六和周日#R8:00~22:00#W任何玩家可以来我这里使用此功能。#r"
	
	local Readme_3 = "\t#R开启大乱斗活动后！场景内所有玩家在8点-23点之间将获得怒杀状态，可以击杀本国和敌国任何玩家#r"
	
		
	local varReadme = Readme_1..Readme_2..Readme_3

	StartTalkTask(varMap);
    TalkAppendString(varMap,varReadme);
    StopTalkTask(varMap);
    DeliverTalkInfo(varMap, varPlayer, varTalknpc, 930176, -1)
	
	end
	
end



function x930176_ProcAcceptCheck( varMap, varPlayer, varTalknpc )

	local minOfDay = GetMinOfDay()
	local weekIdx = GetWeek()

	ChangeMapRestrictiveMode(varMap, 2) --开

    local varMsg1 = "#kN#G大乱斗#o互杀#G模式#S开启#B！"
    LuaAllScenceM2Wrold(varMap, varMsg1, CHAT_PLANE_SCROLL, 1)
    LuaAllScenceM2Wrold(varMap, varMsg1, CHAT_LEFTDOWN, 1)
    LuaAllScenceM2Wrold(varMap, varMsg1, CHAT_MAIN_RIGHTDOWN, 1)

end


function x930176_ProcAccept( varMap, varPlayer )
end

function x930176_ProcQuestAbandon( varMap, varPlayer, varQuest )

end

function x930176_ProcContinue( varMap, varPlayer, varTalknpc )

end

function x930176_CheckSubmit( varMap, varPlayer )

end

function x930176_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end

function x930176_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end

function x930176_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end

function x930176_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
