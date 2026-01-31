
x310162_var_FileId 		= 310162
x310162_var_QuestId     = 9320
x310163_var_DengmiQuestId	= 9315			
x310162_var_TianfuItems				= {11010100,11010101,11010102}

function x310162_Yizhesanyou_Reward( varMap, varPlayer)
    
    local rewardExt = 0
    local itemExt = 0

    SetPlayerGameData( varMap, varPlayer, MD_YIZHESANYOU_DATE[ 1], MD_YIZHESANYOU_DATE[ 2], MD_YIZHESANYOU_DATE[ 3], GetDayOfYear() )

    local playerLevel = GetLevel( varMap, varPlayer)
	local xp = playerLevel * 7000
    if xp > 0 then
        AddExp( varMap, varPlayer, xp)
        Msg2Player( varMap, varPlayer, format( "获得#R经验%d点#cffcf00的奖励", xp).."。", 8, 2)
        Msg2Player( varMap, varPlayer, format( "获得#R经验%d点#cffcf00的奖励", xp), 8, 3)
        	local multi = x310162_IsMulti( varMap, varPlayer)
        	if multi > 0 then
        		AddExp( varMap, varPlayer, floor(xp*multi))
        		Msg2Player( varMap, varPlayer, format( "低于排行榜最后一名10级，额外获得#R%s#cffcc00点经验奖励。", floor(xp*multi)), 8, 2)
        		Msg2Player( varMap, varPlayer, format( "低于排行榜最后一名10级，额外获得#R%s#cffcc00点经验奖励。", floor(xp*multi)), 8, 3)
        	end 				
    end
    
    SetShengWang( varMap, varPlayer, GetShengWang( varMap, varPlayer) + 150)
    Msg2Player( varMap, varPlayer, format( "获得#R%d点声望#cffcf00的奖励", 150).."。", 8, 2)
    Msg2Player( varMap, varPlayer, format( "获得#R%d点声望#cffcf00的奖励", 150), 8, 3)
    
    local varCount = GetPlayerGameData( varMap, varPlayer, MD_YIZHESANYOU_COUNTER[ 1], MD_YIZHESANYOU_COUNTER[ 2], MD_YIZHESANYOU_COUNTER[ 3] )
    SetPlayerGameData( varMap, varPlayer, MD_YIZHESANYOU_COUNTER[ 1], MD_YIZHESANYOU_COUNTER[ 2], MD_YIZHESANYOU_COUNTER[ 3], varCount + 1)
    local value = random( 1, 100)
    if value > 20 and value <= 40 then
        StartItemTask( varMap)
        ItemAppend( varMap, 12030107, 1)
        if StopItemTask( varMap, varPlayer) <= 0 then
            Msg2Player( varMap, varPlayer, "你完成了【德】益者三友。由于你的背包已满，无法获得藏宝图奖励。", 8, 2)
        else
            DeliverItemListSendToPlayer( varMap, varPlayer)
        end
    end
    x310162_AddTianfuItem( varMap, varPlayer)
   
   local playerLevel = GetLevel( varMap, varPlayer)
	 if playerLevel >=60 then 
		local randbai = random( 1, 10)
		if randbai == 1 then
			local bai = 12030143
			local bai80 = 12030144
			StartItemTask( varMap)
			if playerLevel >=80 then
				bai = bai80
			end	
			ItemAppendBind( varMap, bai, 1)	
			if StopItemTask( varMap, varPlayer) > 0 then
				DeliverItemListSendToPlayer( varMap, varPlayer)
				Msg2Player( varMap, varPlayer,format( "你完成了【德】益者三友，幸运的获得了1个@item_%d", bai), 8, 3)
			else
				Msg2Player( varMap, varPlayer, format( "你的背包已满，无法获得@item_%d奖励", bai), 8, 3)
			end
		end	
    end     
    
    LuaCallNoclosure( 256224, "Finishyizhe", varMap, varPlayer)
    Msg2Player( varMap, varPlayer, format( "你完成了【德】益者三友"), 8, 3)
end

function x310162_Dengmi_Reward( varMap, varPlayer)

	local nCurDay = GetDayOfYear()
	SetPlayerGameData(varMap,varPlayer,MD_DENGMI_DATE[1],MD_DENGMI_DATE[2],MD_DENGMI_DATE[3],nCurDay)
	
	local varLevel = GetLevel(varMap,varPlayer)
	local varName = GetName(varMap,varPlayer)

	if varName == nil then
		varName = "ErrorName"
	end
	
	
	
	
	local score = GetPlayerGameData(varMap,varPlayer,MD_DENGMI_SCORE[1],MD_DENGMI_SCORE[2],MD_DENGMI_SCORE[3])
	local bonusExp = varLevel*7000
	AddExp(varMap,varPlayer,bonusExp)

	local varMsg = format("您获得了#R%d点经验值#cffcf00的奖励",bonusExp)

	LuaScenceM2Player(varMap, varPlayer, varMsg, varName , 2,1)
    LuaScenceM2Player(varMap, varPlayer, varMsg, varName , 3,1)
          local multi = x310162_IsMulti( varMap, varPlayer)
        	if multi > 0 then
        		AddExp( varMap, varPlayer, floor(bonusExp*multi))
        		Msg2Player( varMap, varPlayer, format( "低于排行榜最后一名10级，额外获得#R%s#cffcc00点经验奖励。", floor(bonusExp*multi)), 8, 2)
        		Msg2Player( varMap, varPlayer, format( "低于排行榜最后一名10级，额外获得#R%s#cffcc00点经验奖励。", floor(bonusExp*multi)), 8, 3)
        	end 


















    local bonusMoney = varLevel*300
    local buff 	=	9011
    local buff1 =	9013
    local buff2 =	9012
    if IsHaveSpecificImpact( varMap, varPlayer, buff) == 1 or IsHaveSpecificImpact( varMap, varPlayer, buff1) == 1  or IsHaveSpecificImpact( varMap, varPlayer, buff2) == 1 then
        AddMoney( varMap, varPlayer, 0, bonusMoney, x310162_var_FileId)
    else
        AddMoney( varMap, varPlayer, 1, bonusMoney, x310162_var_FileId)
    end

    StartItemTask( varMap)
    ItemAppend( varMap, 12030107, 2)
    local varRes = StopItemTask( varMap, varPlayer)
    if varRes > 0 then
        DeliverItemListSendToPlayer( varMap, varPlayer)
    else
        LuaScenceM2Player( varMap, varPlayer, "#cffcf00物品栏已满，无法得到奖励物品！", varName , 2, 1)
        LuaScenceM2Player( varMap, varPlayer, "#cffcf00物品栏已满，无法得到奖励物品！", varName , 3, 1)
    end
	x310162_AddTianfuItem( varMap, varPlayer)
   local varLevel = GetLevel( varMap, varPlayer)--完成10%奖励百宝囊
	 if varLevel >=60 then 
		local randbai = random( 1, 10)
		if randbai == 1 then
			local bai = 12030143
			local bai80 = 12030144
			StartItemTask( varMap)
			if varLevel >=80 then
				bai = bai80
			end	
			ItemAppendBind( varMap, bai, 1)	
			if StopItemTask( varMap, varPlayer) > 0 then
				DeliverItemListSendToPlayer( varMap, varPlayer)
				Msg2Player( varMap, varPlayer,format( "你完成了【智】天坛灯谜会，幸运的获得了1个@item_%d", bai), 8, 3)
			else
				Msg2Player( varMap, varPlayer, format( "你的背包已满，无法获得@item_%d奖励", bai), 8, 3)
			end
		end	
    end 	
	
    SetPlayerGameData( varMap, varPlayer, MD_QUEST_DENGMI_COUNT[1], MD_QUEST_DENGMI_COUNT[2], MD_QUEST_DENGMI_COUNT[3], 10)
    SetPlayerGameData( varMap, varPlayer, MD_QUEST_DENGMI_DATE[1], MD_QUEST_DENGMI_DATE[2], MD_QUEST_DENGMI_DATE[3], GetDayOfYear() )
end

function x310162_Tiesan_Reward( varMap, varPlayer)
    local varLevel = GetLevel( varMap, varPlayer)
    local award1 = floor(100*70*varLevel)
    local award2 = floor(100*70*varLevel)
    local award = 0
    if GetLevel(varMap, varPlayer) >=40 and GetLevel(varMap, varPlayer) < 70 then
        award = award1;
    elseif GetLevel(varMap, varPlayer) >=70 then
        award = award2;
    end
    AddExp(varMap, varPlayer, award)
    Msg2Player( varMap, varPlayer, format("#Y获得#R经验%d#Y的奖励", award), 8, 3)
    Msg2Player( varMap, varPlayer, format("#Y获得#R经验%d#Y的奖励。", award), 8, 2)
    	    local multi = x310162_IsMulti( varMap, varPlayer)
        	if multi > 0 then
        		AddExp( varMap, varPlayer, floor(award*multi))
        		Msg2Player( varMap, varPlayer, format( "低于排行榜最后一名10级，额外获得#R%s#cffcc00点经验奖励。", floor(award*multi)), 8, 2)
        		Msg2Player( varMap, varPlayer, format( "低于排行榜最后一名10级，额外获得#R%s#cffcc00点经验奖励。", floor(award*multi)), 8, 3)
        	end 

    local varShengWang = GetShengWang( varMap, varPlayer)
    varShengWang = varShengWang + 200
    SetShengWang( varMap, varPlayer, varShengWang )
    message = format("获得声望%d的奖励。", 200)
    StartTalkTask(varMap);
        TalkAppendString(varMap, message);
    StopTalkTask();
    DeliverTalkTips(varMap, varPlayer);
    Msg2Player(varMap,varPlayer,message,4,2)
    local day = GetDayOfYear()
    SetPlayerGameData(varMap, varPlayer, MD_TIEREN_ACCEPTTIME_DAY[1], MD_TIEREN_ACCEPTTIME_DAY[2], MD_TIEREN_ACCEPTTIME_DAY[3], day)
    SetPlayerGameData(varMap, varPlayer, MD_TIEREN_COMMITTIME[1], MD_TIEREN_COMMITTIME[2], MD_TIEREN_COMMITTIME[3], 1)

	x310162_AddTianfuItem( varMap, varPlayer)
		--完成10%奖励百宝囊
	 if varLevel >=60 then 
		local randbai = random( 1, 10)
		if randbai == 1 then
			local bai = 12030143
			local bai80 = 12030144
			StartItemTask( varMap)
			if varLevel >=80 then
				bai = bai80
			end	
			ItemAppendBind( varMap, bai, 1)	
			if StopItemTask( varMap, varPlayer) > 0 then
				DeliverItemListSendToPlayer( varMap, varPlayer)
				Msg2Player( varMap, varPlayer,format( "你完成了【体】铁人三项，幸运的获得了1个@item_%d", bai), 8, 3)
			else
				Msg2Player( varMap, varPlayer, format( "你的背包已满，无法获得@item_%d奖励", bai), 8, 3)
			end
		end	
    end 
    
    StartItemTask( varMap)
    ItemAppend( varMap, 12030107, 1)
    if StopItemTask( varMap, varPlayer) <= 0 then
        Msg2Player( varMap, varPlayer, "背包已满，无法获得藏宝图奖励。", 8, 2)
    else
        DeliverItemListSendToPlayer( varMap, varPlayer)
        Msg2Player( varMap, varPlayer, "获得一张藏宝图的奖励。", 8, 2)
    end
end

function x310162_Yizhe_Check( varMap, varPlayer)
    local curTime = GetMinOfDay()
    if curTime < 1170 then
        Msg2Player( varMap, varPlayer, "益者三友活动尚未开始，请在嘉年华活动时间19：30——24：00内使用", 8, 3)
        return 0
    end

    
    if IsHaveQuestNM( varMap, varPlayer, 9320) > 0 then
        Msg2Player( varMap, varPlayer, "你已经接受这个任务了，快去完成吧。", 8, 3)
        return 0
    end

	local nCurDay = GetDayOfYear()
    if nCurDay == GetPlayerGameData( varMap, varPlayer, MD_YIZHESANYOU_DATE[ 1], MD_YIZHESANYOU_DATE[ 2], MD_YIZHESANYOU_DATE[ 3] ) then
        if GetPlayerGameData( varMap, varPlayer, MD_YIZHESANYOU_COUNTER[ 1], MD_YIZHESANYOU_COUNTER[ 2], MD_YIZHESANYOU_COUNTER[ 3] ) > 1 then
            Msg2Player( varMap, varPlayer, "今天你已经做过这个任务，不能再使用娱乐币", 8, 3)
            return 0
        end
    else
        SetPlayerGameData( varMap, varPlayer, MD_YIZHESANYOU_DATE[ 1], MD_YIZHESANYOU_DATE[ 2], MD_YIZHESANYOU_DATE[ 3], GetDayOfYear() )
        SetPlayerGameData( varMap, varPlayer, MD_YIZHESANYOU_COUNTER[ 1], MD_YIZHESANYOU_COUNTER[ 2], MD_YIZHESANYOU_COUNTER[ 3], 1)
    end

    return 1
end

function x310162_Dengmi_Check( varMap, varPlayer)
    local curTime = GetMinOfDay()
    if curTime < 1170 then
        Msg2Player( varMap, varPlayer, "灯谜活动尚未开始，请在嘉年华活动时间19：30——24：00内使用", 8, 3)
        return 0
    end

	if IsHaveQuest(varMap,varPlayer, x310163_var_DengmiQuestId) > 0 then
		Msg2Player( varMap, varPlayer, "你已经接了天坛灯谜会任务，不能再使用娱乐币", 8, 3)
		return 0
	end
	
	
    if GetPlayerGameData( varMap, varPlayer, MD_DENGMI_DATE[1], MD_DENGMI_DATE[2], MD_DENGMI_DATE[3] ) == GetDayOfYear() and 
       GetPlayerGameData( varMap, varPlayer, MD_DENGMI_SCORE[1], MD_DENGMI_SCORE[2], MD_DENGMI_SCORE[3] ) > 0 then
        Msg2Player( varMap, varPlayer, "你今天已经参加过天坛灯谜会了，不能再使用娱乐币", 8, 3)
        return 0
    end

    return 1
end

function x310162_Tiesan_Check( varMap, varPlayer)
    local curTime = GetMinOfDay()
    if curTime < 1170 then
        Msg2Player( varMap, varPlayer, "铁人三项活动尚未开始，请在嘉年华活动时间19：30——24：00内使用", 8, 3)
        return 0
    end

    if IsHaveQuestNM( varMap, varPlayer, 7537) > 0 or IsHaveQuestNM( varMap, varPlayer, 7538) > 0 or IsHaveQuestNM( varMap, varPlayer, 7539) > 0 or IsHaveQuestNM( varMap, varPlayer, 7551) > 0 or IsHaveQuestNM( varMap, varPlayer, 7552) > 0 then
        Msg2Player( varMap, varPlayer, "你已经接受这个任务了，快去完成吧", 8, 3)
        return 0
    end

	local nCurDay = GetDayOfYear()
    if nCurDay == GetPlayerGameData( varMap, varPlayer, MD_TIEREN_ACCEPTTIME_DAY[ 1], MD_TIEREN_ACCEPTTIME_DAY[ 2], MD_TIEREN_ACCEPTTIME_DAY[ 3] ) then
        if GetPlayerGameData( varMap, varPlayer, MD_TIEREN_COMMITTIME[1], MD_TIEREN_COMMITTIME[2], MD_TIEREN_COMMITTIME[3] ) >= 1 then
            Msg2Player( varMap, varPlayer, "您今天已经领取过铁人三项活动，不能再使用娱乐币", 8, 3)
            return 0
        end
    end

    return 1
end


x310162_var_ScriptTable   = {
                            { guid = 139129, costCount = 40, check = x310162_Yizhe_Check,  proc = x310162_Yizhesanyou_Reward, description = "\t你要用#R40#W枚#{_ITEM11990117}完成一次#G益者三友#W么？\n\t使用嘉年华娱乐币完成益者三友和正常完成益者三友共用当天任务计次，经验奖励,藏宝图奖励与正常完成任务一样。" }, 
                            { guid = 139133, costCount = 40, check = x310162_Dengmi_Check, proc = x310162_Dengmi_Reward,      description = "\t你要用#R40#W枚#{_ITEM11990117}完成今天所有的#G天坛灯谜#W么？\n\t使用嘉年华娱乐币可一次性获得所有灯谜奖励，当日不可再次猜灯谜。" }, 
                            { guid = 139100, costCount = 50, check = x310162_Tiesan_Check, proc = x310162_Tiesan_Reward,      description = "\t你要用#R50#W枚#{_ITEM11990117}完成今天的#G铁人三项#W么？\n\t使用嘉年华娱乐币可以瞬间获得铁人三项的任务奖励，当日不可再次参加铁人三项。" }, 
}

x310162_var_CurrencyID    = 11990117




function x310162_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
    
  local varLevel = GetLevel( varMap, varPlayer)
  if varLevel <40 then
   return
  end
  TalkAppendButton( varMap, x310162_var_FileId, "使用嘉年华娱乐币", 3, 1)
end




function x310162_ProcEventEntry( varMap ,varPlayer, varTalknpc, idScript, idExt)
    local varId = GetMonsterGUID( varMap, varTalknpc)
    for varI, item in x310162_var_ScriptTable do
    	if varId == 139133 then
	    	local nDate   = GetPlayerGameData(varMap,varPlayer,MD_DENGMI_DATE[1], MD_DENGMI_DATE[2], MD_DENGMI_DATE[3] )
			local nCurDay = GetDayOfYear()
			if nCurDay == nDate then
				StartTalkTask(varMap)
		        TalkAppendString(varMap,"#Y"..x310164_var_QuestName)
		        TalkAppendString(varMap,"每天只能猜谜一次，请明天再来")
		        StopTalkTask()
		        DeliverTalkMenu(varMap, varPlayer, varTalknpc, x310162_var_FileId, x310162_var_QuestId);
		        return
		    end
		    
		    if IsHaveQuest(varMap,varPlayer, x310163_var_DengmiQuestId) > 0 then
		    	StartTalkTask(varMap)
		        TalkAppendString(varMap,"#Y"..x310164_var_QuestName)
		        TalkAppendString(varMap,"你已经接了天坛灯谜会任务，不能再使用娱乐币")
		        StopTalkTask()
		        DeliverTalkMenu(varMap, varPlayer, varTalknpc, x310162_var_FileId, x310162_var_QuestId);
				
				return 0
			end
	
		  
	    end
    
    
        if varId == item.guid then
            StartTalkTask( varMap)
                TalkAppendString( varMap, "#Y嘉年华娱乐币" )
                TalkAppendString( varMap, item.description)
            StopTalkTask()
            DeliverTalkInfo( varMap, varPlayer, varTalknpc, x310162_var_FileId, -1)
            break
        end
    end
end

function x310162_AddTianfuItem( varMap, varPlayer)
	local varLevel = GetLevel( varMap, varPlayer)
	if varLevel >= 80 then
		if random( 1, 100) <= 22 then
			local varIndex = random(1,3)
			StartItemTask( varMap)
	        ItemAppend( varMap, x310162_var_TianfuItems[varIndex], 1)
	        if StopItemTask( varMap, varPlayer) <= 0 then
	            Msg2Player( varMap, varPlayer, "由于你的背包已满，无法获得天赋道具奖励。", 8, 2)
	        else
	            DeliverItemListSendToPlayer( varMap, varPlayer)
	        end
		end
	end
end

function x310162_ProcAcceptCheck( varMap, varPlayer, varTalknpc)
    local varCount = GetItemCount( varMap, varPlayer, x310162_var_CurrencyID)
    local varId = GetMonsterGUID( varMap, varTalknpc)
    




    
    
    local need = 0
    local elem = nil
    for varI, item in x310162_var_ScriptTable do
        if varId == item.guid then
            need = item.costCount
            elem = item
            break
        end
    end

    if varCount >= need then
        if elem.check( varMap, varPlayer) == 1 then
            if DelItem( varMap, varPlayer, 11990117, need) == 1 then
                elem.proc( varMap, varPlayer)
            else
                Msg2Player( varMap, varPlayer, "扣除#{_ITEM11990117}失败", 8, 3)
                return 0
            end
        end
    else
        Msg2Player( varMap, varPlayer, format( "你身上的#{_ITEM11990117}不足%d枚", need), 8, 3)
        return 0
    end

 	
 
    return 1
end




function x310162_ProcAccept( varMap, varPlayer )
end




function x310162_ProcQuestAbandon( varMap, varPlayer, varQuest )
end




function x310162_ProcContinue( varMap, varPlayer, varTalknpc )
end




function x310162_CheckSubmit( varMap, varPlayer )
end




function x310162_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end




function x310162_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x310162_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
function x310162_IsMulti( varMap, varPlayer)
local MaxLevel = GetTopListInfo_MaxLevel( GetWorldID( varMap, varPlayer) )
local MinLevel = GetTopListInfo_MinLevel( GetWorldID( varMap, varPlayer) )
local Level = GetLevel( varMap, varPlayer)
local Dislevel = MinLevel - Level - 10
	if MaxLevel >= 75 then
		if Dislevel > 0 then
			if Level < 50 then
				local multi50 = Dislevel/10
				return multi50
			elseif Level >= 50 and Level < 60 then
				local multi60 = Dislevel*2/10
				return multi60
			elseif Level >= 60 and Level < 75 then
				local multi70 = Dislevel*4/10
				return multi70
			elseif Level >= 75 and Level < 90 then
				local multi80 = Dislevel*8/10
				return multi80
			else 
				return 0
			end
		end
		return 0
	end
	return 0
end

