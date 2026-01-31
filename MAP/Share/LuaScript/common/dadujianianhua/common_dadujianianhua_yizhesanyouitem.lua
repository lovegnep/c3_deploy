x310166_var_FileId = 310166
x310166_var_ScriptName = "提交高丽贡书"	

x310166_var_ScripText = "\t和贡品一起丢失的还有三册贡书，里面记载着贡品的名称和数量。\n\t#Y@myname#W，请帮我把三册贡书找回来好吗？\n \n#G(完成大都NPC[益者三友]全美丽#G的任务过程中有几率得到高丽贡书。)"

x310166_var_Item = {12030080, 12030081, 12030082}


x310166_var_OpenTime                  = 1170

x310166_var_EndTime                   = 1440

function x310166_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap, x310166_var_FileId, x310166_var_ScriptName,3)
end

function x310166_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest )
	local varExp = GetLevel( varMap, varPlayer)*7000
	StartTalkTask( varMap)
    TalkAppendString( varMap, "#Y"..x310166_var_ScriptName)
    TalkAppendString(varMap, x310166_var_ScripText)
    TalkAppendString( varMap, "\n#Y奖励内容：#W")
    TalkAppendString( varMap, "经验值:"..varExp )
    
    DeliverTalkInfo(varMap, varPlayer, varTalknpc, x310166_var_FileId, -1)
end


function x310166_CheckItem( varMap, varPlayer)

	for varI, item in x310166_var_Item do
		if HaveItemInBag( varMap, varPlayer, item ) <= 0 then
			return 0
		end
	end
	return 1
end

function x310166_ProcAcceptCheck( varMap, varPlayer, varTalknpc)

	local nowTime = GetMinOfDay()
    if nowTime < x310166_var_OpenTime or nowTime >= x310166_var_EndTime then
		local varMsg = "只有在每日的#G19：30--2400#cffcf00ず矗ユ蔼腞癪"
        Msg2Player( varMap, varPlayer, varMsg, 8, 2)
        Msg2Player( varMap, varPlayer, varMsg, 8, 3)
		return
    end

	local varLastday = GetPlayerGameData(varMap, varPlayer, MD_YIZHESANYOU_ITEM_DAY[1], MD_YIZHESANYOU_ITEM_DAY[2], MD_YIZHESANYOU_ITEM_DAY[3])

	local varToday = GetDayOfYear()
	if varToday == varLastday then 
		local varMsg = "您今天已经提交过高丽贡书了，请明天再来。"
        Msg2Player( varMap, varPlayer, varMsg, 8, 2)
        Msg2Player( varMap, varPlayer, varMsg, 8, 3)
        return
	end
		

    if x310166_CheckItem( varMap, varPlayer) == 1 then
		for varI, item in x310166_var_Item do
			if DelItem( varMap, varPlayer, item, 1 ) ~= 1 then return 0 end
		end
		
		SetPlayerGameData(varMap, varPlayer, MD_YIZHESANYOU_ITEM_DAY[1], MD_YIZHESANYOU_ITEM_DAY[2], MD_YIZHESANYOU_ITEM_DAY[3], varToday)
		
		local varExp = GetLevel( varMap, varPlayer)*7000
		AddExp( varMap, varPlayer, varExp)
        Msg2Player( varMap, varPlayer, format( "获得#R经验%d点#cffcf00的奖励", varExp).."。", 8, 2)
        Msg2Player( varMap, varPlayer, format( "获得#R经验%d点#cffcf00的奖励", varExp), 8, 3)
        
        
        --【个人】益者三友的国书
 	    if IsHaveQuestNM( varMap, varPlayer, 1403 ) > 0 then
	        local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, 1403) 
	        local QuestNum = GetQuestParam( varMap, varPlayer, varQuestIdx, 3)                                                        
	        SetQuestByIndex(varMap,varPlayer,varQuestIdx, 3, QuestNum + 1)				        

	        if GetQuestParam( varMap, varPlayer, varQuestIdx, 3) >= 1 then
	        	SetQuestByIndex(varMap,varPlayer,varQuestIdx, 7, 1)  
	        	SetQuestByIndex(varMap,varPlayer,varQuestIdx, 0, 1)	        	      
	        end 
	        LuaCallNoclosure( 330052, "ProcQuestLogRefresh", varMap, varPlayer)  	
	    end
	           
    else
        Msg2Player( varMap, varPlayer, "您身上没有全套的高丽贡书，提交失败", 8, 2)
        Msg2Player( varMap, varPlayer, "您身上没有全套的高丽贡书，提交失败", 8, 3)
	end
end
