

--DECLARE_QUEST_INFO_START--
x310320_var_FileId = 310320

x310320_var_QuestId = 9045 

x310320_var_QuestName="【个人】暴龙大作战"
x310320_var_QuestTarget				= "选择支持@npc_145001或@npc_145002" 
x310320_var_QuestCompleted			= "\t恩，本次暴龙大作战结束了，你会获得双倍的奖励吗？让我们拭目以待......"
x310320_var_QuestInfo				= "\t嘿，你好！我是这儿的暴龙管理员！\n\t想参加暴龙大作战吗？那你得先了解一下规则：\n\t你可以在暴红或者暴蓝中选择加入一方，在任务时间结束之前，你可以去找另一边的暴龙转换你支援的对象。\n\t最后，我会根据支援的人数来判断胜负。\n\t注意：#G支持人数#R较少#G的暴龙会获得#R胜利#G，获得双倍的奖励！而支持人数较多的暴龙，只会获得普通的奖励！#W任务结束时一定不要离线，否则要等到下次任务结束时才能完成本任务。"            
x310320_var_ContinueInfo				= "\t别心急，过一会儿我就会宣布胜负！"  
  
x310320_var_QuestHelp				= "#G支持人数较少的暴龙会获得胜利，获得双倍的奖励！而支持人数较多的暴龙，只会获得普通的奖励！"          

x300320_var_strQuestAbandon         = "您放弃了任务：【个人】暴龙大作战"


--DECLARE_QUEST_INFO_STOP--

x310320_var_QuestTarget1				= "  选择支持@npc_145001或@npc_145002"       
x310320_var_QuestCompleted1			= "\t恭喜你！由于你选择的暴龙支持人数较少，你在本次暴龙大作战中赢得了双倍的奖励！"
x310320_var_QuestCompleted2			= "\t很遗憾！由于你选择的暴龙支持人数太多，你在本次暴龙大作战中获得了普通的奖励！" 
x310320_var_HongNum	= 0
x310320_var_LanNum	= 0
x310320_var_MinLevel	= 65
x310320_var_MaxLevel	= 84

x310320_var_HongBuff		= 7536
x310320_var_LanBuff		= 7537


x310320_var_TotalTime	= 10 * 60  

x310320_var_State		= 0

x310320_var_CostGold	= 3000 
x310320_var_IsEnableId = 1039


x310320_var_AcceptQuestLogID        = 1631

x310320_var_FinishQuestLogID        = 1632

x310320_var_SelfId        = 0


x310320_var_CoffExp      =125000






function x310320_ProcMapPlayerNewConnectEnter( varMap, varPlayer)
	local varToday = GetDayOfYear()
    local hour = GetHourMinSec()
    
	local varLastday = GetPlayerGameData(varMap, varPlayer, MD_YOULECHANG_DATE[1], MD_YOULECHANG_DATE[2], MD_YOULECHANG_DATE[3])
	if hour == 23 or hour < 9 or varToday ~= varLastday then
		
		
		CancelSpecificImpact( varMap, varPlayer, x310320_var_LanBuff)
		CancelSpecificImpact( varMap, varPlayer, x310320_var_HongBuff)
		
		SendSpecificImpactToUnit( varMap, varPlayer, varPlayer, varPlayer, 8400, 0)
	end
end



function x310320_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	x310320_var_SelfId        = varPlayer
	if IsHaveQuest(varMap,varPlayer, x310320_var_QuestId) <= 0 then
		if GetLevel( varMap, varPlayer) < x310320_var_MinLevel then 
	 		return 0
		end
	end	
	
	
	
       
   
    
    
		local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x310320_var_QuestId)
		TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x310320_var_QuestId, varState, 0 )
	
	TalkAppendButton(varMap,x310320_var_QuestId,"【暴龙大作战说明】" ,0,1)
	
end
function x310320_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
	
end

function x310320_GetHongNum(varMap ,varPlayer)
	return x310320_var_HongNum
end

function x310320_SetHongNumInc(varMap ,varPlayer, inc)
	x310320_var_HongNum = x310320_var_HongNum + inc
	if x310320_var_HongNum <= 0 then
		x310320_var_HongNum = 0
	end
	return x310320_var_HongNum
end

function x310320_GetLanNum(varMap ,varPlayer)
	
	return x310320_var_LanNum
end

function x310320_SetLanNumInc(varMap ,varPlayer, inc)
	x310320_var_LanNum = x310320_var_LanNum + inc
	if x310320_var_LanNum <= 0 then
		x310320_var_LanNum = 0
	end
	
	return x310320_var_LanNum
end



function x310320_CheckTime(varMap ,varPlayer, varTalknpc)
	local hour,minute,sec =GetHourMinSec();
	if hour >= 12 and hour <= 22 and minute >= 0 and minute < 10 then
		return 1
	end
	return 0
end

function x310320_GetCountMD(varMap ,varPlayer)
	local varToday = GetDayOfYear()
	local varLastday = GetPlayerGameData(varMap, varPlayer, MD_HONGLAN_DATE[1], MD_HONGLAN_DATE[2], MD_HONGLAN_DATE[3])
	if varToday == varLastday then
		local varCount = GetPlayerGameData(varMap, varPlayer, MD_HONGLAN_COUNT[1], MD_HONGLAN_COUNT[2], MD_HONGLAN_COUNT[3])
		return varCount
	else
		SetPlayerGameData(varMap,varPlayer,MD_HONGLAN_DATE[1],MD_HONGLAN_DATE[2],MD_HONGLAN_DATE[3], varToday)
       	SetPlayerGameData(varMap,varPlayer,MD_HONGLAN_COUNT[1],MD_HONGLAN_COUNT[2],MD_HONGLAN_COUNT[3], 0)    
		return 0
    end  
end

function x310320_IncCountMD(varMap ,varPlayer)
	local varToday = GetDayOfYear()
	local varLastday = GetPlayerGameData(varMap, varPlayer, MD_HONGLAN_DATE[1], MD_HONGLAN_DATE[2], MD_HONGLAN_DATE[3])
	if varToday == varLastday then
		local varCount = GetPlayerGameData(varMap, varPlayer, MD_HONGLAN_COUNT[1], MD_HONGLAN_COUNT[2], MD_HONGLAN_COUNT[3])
		varCount = varCount + 1
		SetPlayerGameData(varMap,varPlayer,MD_HONGLAN_COUNT[1],MD_HONGLAN_COUNT[2],MD_HONGLAN_COUNT[3], varCount)
		return varCount
	else
		SetPlayerGameData(varMap,varPlayer,MD_HONGLAN_DATE[1],MD_HONGLAN_DATE[2],MD_HONGLAN_DATE[3], varToday)
       	SetPlayerGameData(varMap,varPlayer,MD_HONGLAN_COUNT[1],MD_HONGLAN_COUNT[2],MD_HONGLAN_COUNT[3], 1)    
       	return 1
    end  
end
function x310320_GetHonglanState(varMap ,varPlayer)
	return x310320_var_State
end

function x310320_DecCountMD(varMap ,varPlayer)
	local varCount = GetPlayerGameData(varMap, varPlayer, MD_HONGLAN_COUNT[1], MD_HONGLAN_COUNT[2], MD_HONGLAN_COUNT[3])
	varCount = varCount - 1
	if varCount <= 0 then
		varCount = 0
	end
	SetPlayerGameData(varMap,varPlayer,MD_HONGLAN_COUNT[1],MD_HONGLAN_COUNT[2],MD_HONGLAN_COUNT[3], varCount)
	return varCount
end

function x310320_IsWinner(varMap ,varPlayer )	
	if x310320_var_HongNum > x310320_var_LanNum then
		if IsHaveSpecificImpact( varMap, varPlayer, x310320_var_LanBuff) == 1 then
			return 1
		else
			return 0
		end
	elseif x310320_var_HongNum < x310320_var_LanNum then
		if IsHaveSpecificImpact( varMap, varPlayer, x310320_var_HongBuff) == 1 then
			return 1
		else
			return 0
		end
	else
		return 0
	end
	
end





function x310320_CheckSubmit( varMap, varPlayer, varTalknpc)
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x310320_var_QuestId)

    if GetQuestParam( varMap, varPlayer, varQuestIdx, 0) == 1 and GetQuestParam( varMap, varPlayer, varQuestIdx, 7) == 1 then
        return 1
    else
        return 0
    end
end


function x310320_ProcEventEntry(varMap ,varPlayer, varTalknpc,idScript,idExt )	
	local varLevel = GetLevel( varMap, varPlayer)
	local varExp   = varLevel * x310320_var_CoffExp
	
	if idExt == 0 then
		if IsQuestHaveDone(varMap, varPlayer, x310320_var_QuestId) > 0 then
			StartTalkTask(varMap)
        	TalkAppendString(varMap,"你所参与的暴龙大作战已经结束，快去找暴龙大作战任务发布人提交任务吧！")
        	StopTalkTask(varMap)
        	DeliverTalkMenu(varMap,varPlayer,varTalknpc)
			return
		end
		
		if IsHaveQuest(varMap,varPlayer, x310320_var_QuestId) > 0 then
			local varDone = x310320_CheckSubmit( varMap, varPlayer, varTalknpc)
            if varDone > 0 then
                x310320_DispatchCompletedInfo( varMap, varPlayer, varTalknpc) 
            else
                x310320_DispatchContinueInfo( varMap, varPlayer, varTalknpc) 
            end
            
            




			return
		end
		
		
		
		
		StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..x310320_var_QuestName)
        TalkAppendString(varMap,x310320_var_QuestInfo)
        TalkAppendString( varMap,"#Y任务目标:")
        TalkAppendString( varMap,x310320_var_QuestTarget)
        
        AddQuestExpBonus(varMap, varExp )
        
		
        
        StopTalkTask(varMap)
        
        DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x310320_var_FileId, x310320_var_QuestId)
        

	elseif idExt == 1 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y【暴龙大作战任务说明】")
        TalkAppendString(varMap,"#Y接取任务：\n\t#W65级以上的玩家，每周六、日12：00-晚上22：00每逢整点可以接取任务，每次开放#Y10分钟#W，共开启10次任务。\n\t每个玩家每天最多可以接取三次任务。第一次接取任务免费，其后的两次均要花费#R3两现金/金卡#W。")
        TalkAppendString(varMap,"#Y玩法过程：\n\t#W接取任务后，你需要先在暴红或暴蓝两只暴龙中选择支持一方，在任务时间结束之前（整点开放后10分钟内），可以随时找另一只暴龙转换你的支持对象。\n\t在任务时间结束后，#G支持人数#R较少#G的暴龙会获得胜利，获得#R双倍的奖励#G！而支持人数#R较多#G的暴龙，只会获得普通的奖励！")
        StopTalkTask(varMap)
        DeliverTalkMenu(varMap,varPlayer,varTalknpc)
    elseif idExt == 2 then
    	if x310320_CheckSubmit( varMap, varPlayer, varTalknpc) ~= 1 then
    		StartTalkTask(varMap)
	        TalkAppendString(varMap,"任务未结束")
	        StopTalkTask(varMap)
	        DeliverTalkMenu(varMap,varPlayer,varTalknpc)
    		return
    	end
    	if x310320_IsWinner(varMap ,varPlayer ) == 1 then
    		StartTalkTask(varMap)
	        TalkAppendString(varMap,"赢方")
	        StopTalkTask(varMap)
	        DeliverTalkMenu(varMap,varPlayer,varTalknpc)
    	else
	    	StartTalkTask(varMap)
	        TalkAppendString(varMap,"输方")
	        StopTalkTask(varMap)
	        DeliverTalkMenu(varMap,varPlayer,varTalknpc)
    	end
	end
	

end





function x310320_DispatchContinueInfo( varMap, varPlayer, varTalknpc)
	StartTalkTask( varMap)
    TalkAppendString( varMap, "#Y"..x310320_var_QuestName)
    TalkAppendString( varMap, x310320_var_ContinueInfo)
    TalkAppendString( varMap, " ")
 
    DeliverTalkMenu( varMap, varPlayer, varTalknpc)
	
end




function x310320_DispatchCompletedInfo( varMap, varPlayer, varTalknpc)
	StartTalkTask( varMap)
    TalkAppendString( varMap, "#Y"..x310320_var_QuestName)
    TalkAppendString( varMap, x310320_var_QuestCompleted)
    TalkAppendString( varMap, " ")
    local varLevel = GetLevel( varMap, varPlayer)
    
	StopTalkTask( varMap)
    DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x310320_var_FileId, x310320_var_QuestId)
end

function x310320_DispatchQuestInfo( varMap, varPlayer, varTalknpc)
	
	StartTalkTask( varMap)

    
    TalkAppendString( varMap, "#Y"..x310320_var_QuestName)
    TalkAppendString( varMap, x310320_var_QuestInfo)
    TalkAppendString( varMap, " ")
           
    
    TalkAppendString( varMap, "#Y任务目标：")
    TalkAppendString( varMap, x310320_var_QuestTarget)
    TalkAppendString( varMap, " ")

    
    if x310320_var_QuestHelp ~= "" then
        TalkAppendString( varMap, "#Y任务提示：")
        TalkAppendString( varMap, x310320_var_QuestHelp)
        TalkAppendString( varMap, " ")
    end                 

	StopTalkTask()
	DeliverTalkInfoNM( varMap, varPlayer, varTalknpc, x310320_var_FileId, x310320_var_QuestId)
end

function x310320_ProcTimerDoingStart( varMap, TimerId, varParam1, varParam2, varParam3, varParam4, Param5)
	
    SetSystemTimerTick( varMap, 310320, "ProcTimer", TimerId, 10000)
    LuaAllScenceM2Wrold (varMap, "新一轮暴龙大作战开始了！各位玩家可以通过大都南的天上人间传送人（128，70）进入天上人间·麒麟，找到暴龙大作战发布人（70，59）参加！", 1, 1)
    
end

function x310320_ProcQuestFinish( varMap )
		
	local varHumanCount = GetScenePlayerCount( varMap)
    if varHumanCount > 0 then
        for varI = 0, varHumanCount do
            local varObj = GetScenePlayerObjId( varMap,varI)
            if varObj >= 0 then
            	if IsHaveQuest(varMap,varObj, x310320_var_QuestId) > 0 then
	                CancelSpecificImpact( varMap, varObj, x310320_var_LanBuff)
	                CancelSpecificImpact( varMap, varObj, x310320_var_HongBuff)
                local varQuestIdx = GetQuestIndexByID( varMap, varObj, x310320_var_QuestId)               
                if x310320_IsWinner(varMap,varObj) == 1 then   
                	SetQuestByIndex( varMap, varObj, varQuestIdx, 6, 1)
                else
                	SetQuestByIndex( varMap, varObj, varQuestIdx, 6, 0)                	
                end
                if x310320_var_HongNum > x310320_var_LanNum then
                	Msg2Player( varMap, varObj, format("本轮暴龙大作战已经结束，#G暴红与暴蓝#R的支持人数比是#G%d比%d#R。",x310320_var_HongNum,x310320_var_LanNum), 0, 1)
        					Msg2Player( varMap, varObj, format("本轮暴龙大作战已经结束，暴红与暴蓝的支持人数比是#G%d比%d#cffcf00。",x310320_var_HongNum,x310320_var_LanNum), 0, 2)
        					Msg2Player( varMap, varObj, format("所有#G暴蓝#R的支持者可以获得双倍的奖励！",x310320_var_HongNum,x310320_var_LanNum), 0, 1)
        					Msg2Player( varMap, varObj, format("所有#G暴蓝#cffcf00的支持者可以获得双倍的奖励！",x310320_var_HongNum,x310320_var_LanNum), 0, 2)
                elseif  x310320_var_LanNum > x310320_var_HongNum then
                	Msg2Player( varMap, varObj, format("本轮暴龙大作战已经结束，#G暴红与暴蓝#R的支持人数比是#G%d比%d#R。",x310320_var_HongNum,x310320_var_LanNum), 0, 1)
        					Msg2Player( varMap, varObj, format("本轮暴龙大作战已经结束，暴红与暴蓝的支持人数比是#G%d比%d#cffcf00。",x310320_var_HongNum,x310320_var_LanNum), 0, 2)
        					Msg2Player( varMap, varObj, format("所有#G暴红#R的支持者可以获得双倍的奖励！",x310320_var_HongNum,x310320_var_LanNum), 0, 1)
        					Msg2Player( varMap, varObj, format("所有#G暴红#cffcf00的支持者可以获得双倍的奖励！",x310320_var_HongNum,x310320_var_LanNum), 0, 2)
        				else
        					Msg2Player( varMap, varObj, format("本轮暴龙大作战已经结束，#G暴红与暴蓝#R的支持人数比是#G%d比%d#R。",x310320_var_HongNum,x310320_var_LanNum), 0, 1)
        					Msg2Player( varMap, varObj, format("本轮暴龙大作战已经结束，暴红与暴蓝的支持人数比是#G%d比%d#cffcf00。",x310320_var_HongNum,x310320_var_LanNum), 0, 2)
        					Msg2Player( varMap, varObj, format("双方支持者都只能获得普通的奖励！",x310320_var_HongNum,x310320_var_LanNum), 0, 1)
        					Msg2Player( varMap, varObj, format("双方支持者都只能获得普通的奖励！",x310320_var_HongNum,x310320_var_LanNum), 0, 2)
        				end	
                SetQuestByIndex( varMap, varObj, varQuestIdx, 0, 1)
        		SetQuestByIndex( varMap, varObj, varQuestIdx, 7, 1)
        		
        		
	        	end
            end
        end
    end
    
    if x310320_var_HongNum > x310320_var_LanNum then
       LuaThisScenceM2Wrold( varMap, format("暴蓝获胜！",x310320_var_HongNum,x310320_var_LanNum), 5, 1)
    elseif  x310320_var_LanNum > x310320_var_HongNum then
      LuaThisScenceM2Wrold( varMap, format("暴红获胜！",x310320_var_HongNum,x310320_var_LanNum), 5, 1)
    else
      LuaThisScenceM2Wrold( varMap, format("暴蓝暴红未分胜负！",x310320_var_HongNum,x310320_var_LanNum), 5, 1)
    end	
    
  x310320_var_HongNum	= 0
	x310320_var_LanNum	= 0
end

function x310320_ProcTimer( varMap, TimerId, varTime)
	
	local hour,minute,sec =GetHourMinSec();
	if hour >= 12 and hour <= 22 and minute >= 0 and minute <= 10 then
		x310320_var_State = 1
	else
		x310320_var_State = 0
	end
	
	local varMsg = format("start timer minute =%d sec =%d",minute,sec)
	
	local varHumanCount = GetScenePlayerCount( varMap)
    if varHumanCount > 0 then
        for varI = 0, varHumanCount do
            local varObj = GetScenePlayerObjId( varMap,varI)
            if varObj >= 0 then
               
            end
        end
    end
    
	
	
	if hour >= 12 and hour <= 22 and minute == 10 then
		
		
			
			
			x310320_ProcQuestFinish( varMap )
			x310320_var_State = 0
			return
		
	end
	
	SetSystemTimerTick( varMap, 310320, "ProcTimer", TimerId, 1000)
end

function x310320_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
	local varLevel =GetLevel(varMap, varPlayer)
	local varExp   =varLevel *x310320_var_CoffExp
	StartTalkTask( varMap)
	AddQuestLogCustomText( varMap,
                                   x310320_var_QuestName,               
                                   x310320_var_QuestName,               
                                   x310320_var_QuestTarget1,                   				 
                                   "@npc_145000",              
                                   "任务攻略",               
                                   x310320_var_QuestInfo,    
                                   "") 
                                                
                                                
    AddQuestExpBonus( varMap, varExp)
    
    
    StopTalkTask()
	DeliverTalkRefreshQuest( varMap, varPlayer, varQuest)
end


function x310320_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	return 1
end





function x310320_CheckPlayerState( varMap,varPlayer )
    

    local varState
    local ErrorMsg

    varState = IsPlayerStateNormal(varMap,varPlayer )
    if varState == 0 then
        ErrorMsg = "状态异常"
        return 1,ErrorMsg
    end

    varState = IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_MENTALGAME )
    if varState == 1 then
        ErrorMsg = "处于答题状态，不能接受任务"
        return 1,ErrorMsg
    end

    varState = IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_STALL )
    if varState == 1 then
        ErrorMsg = "处于设摊状态，不能接受任务"
        return 1,ErrorMsg
    end

    varState = IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_DIE )
    if varState == 1 then
        ErrorMsg = "处于死亡状态，不能接受任务"
        return 1,ErrorMsg
    end

    varState = IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_CRASHBOX )
    if varState == 1 then
        ErrorMsg = "处于运镖状态，不能接受任务"
        return 1,ErrorMsg
    end

    varState = IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_AUTOPLAY )
    if varState == 1 then
        ErrorMsg = "处于挂机状态，不能接受任务"
        return 1,ErrorMsg
    end

    varState = IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_SUBTRAIN )
    if varState == 1 then
        ErrorMsg = "处于代练状态，不能接受任务"
        return 1,ErrorMsg
    end

    varState = IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_BUS )
    if varState == 1 then
        ErrorMsg = "处于BUS状态，不能接受任务"
        return 1,ErrorMsg
    end

    varState = IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_TONGQUBUFF )
    if varState == 1 then
        ErrorMsg = "处于童趣状态，不能接受任务"
        return 1,ErrorMsg
    end


    return 0

end


function x310320_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x310320_var_QuestId)
   	SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 1)
    SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1)
        		
        		
	
	if IsQuestHaveDone(varMap, varPlayer, x310320_var_QuestId) > 0 then
		StartTalkTask(varMap)
        TalkAppendString(varMap,"\t你已经接受【个人】暴龙大作战任务了。")
        StopTalkTask(varMap)
        DeliverTalkMenu(varMap,varPlayer,varTalknpc)
        return 
    end

	local varState,varMsg = x310320_CheckPlayerState( varMap,varPlayer )
    if varState == 1 then
       	StartTalkTask(varMap)
    	TalkAppendString( varMap, varMsg );
    	StopTalkTask(varMap)
    	DeliverTalkTips(varMap,varPlayer)
    	return
    end	

	
    
    local varLevel = GetLevel(varMap, varPlayer)
  if IsNewServer()==1 then
 	 if GetTopListInfo_MinLevel( GetWorldID( varMap, varPlayer) ) > 85 then
 	 	if GetLevel( varMap, varPlayer) > x310320_var_MaxLevel then
 	 		Msg2Player(varMap, varPlayer, "等级过高，无法接取本任务", 0, 2)
   		Msg2Player(varMap, varPlayer, "等级过高，无法接取本任务", 0, 3)   
			return
		end
 	 end	
	elseif IsNewServer()~=1 then
	 if GetLevel( varMap, varPlayer) > x310320_var_MaxLevel then
    	Msg2Player(varMap, varPlayer, "只有低于85级的玩家才能接受本任务", 0, 2)
   		Msg2Player(varMap, varPlayer, "只有低于85级的玩家才能接受本任务", 0, 3)   
			return
	 end
	end
		
		
    if IsQuestFullNM(varMap,varPlayer)==1 then
 				Msg2Player(varMap, varPlayer, "任务已满，添加任务失败", 0, 2)
   			Msg2Player(varMap, varPlayer, "任务已满，添加任务失败", 0, 3)  
        return 
    end
	local varLevel = GetLevel(varMap, varPlayer)
	if GetLevel( varMap, varPlayer) < x310320_var_MinLevel  then
 				Msg2Player(varMap, varPlayer, "只有不低于65级的玩家才能接受任务", 0, 2)
   			Msg2Player(varMap, varPlayer, "只有不低于65级的玩家才能接受任务", 0, 3)      	
		return
	end
	
	local weekDay = GetWeek()
	if weekDay ~= 0 and weekDay ~= 6 then
 				Msg2Player(varMap, varPlayer, "很抱歉，【个人】暴龙大作战在每周六、日开放", 0, 2)
   			Msg2Player(varMap, varPlayer, "很抱歉，【个人】暴龙大作战在每周六、日开放", 0, 3)   	
		return 
	end
	if x310320_CheckTime(varMap ,varPlayer, varTalknpc) < 1 then
 				Msg2Player(varMap, varPlayer, "很抱歉，【个人】暴龙大作战在中午12：00-晚上22：00之间，每逢整点开放", 0, 2)
   			Msg2Player(varMap, varPlayer, "很抱歉，【个人】暴龙大作战在中午12：00-晚上22：00之间，每逢整点开放", 0, 3)     	
		return 
	end
	
	local varCount = x310320_GetCountMD(varMap ,varPlayer)
	if varCount >= 3 then
 				Msg2Player(varMap, varPlayer, "你今天已经做了3次【个人】暴龙大作战了，请改天再来", 0, 2)
   			Msg2Player(varMap, varPlayer, "你今天已经做了3次【个人】暴龙大作战了，请改天再来", 0, 3)
		return
	end
		
	if varCount >= 1 then  
			if GetGoldMode( varMap, varPlayer) == 1 then
			if CostMoney(varMap,varPlayer,2,x310320_var_CostGold,324) ~= -1 then
				Msg2Player(varMap, varPlayer, "领取任务完成，扣除3两现金！", 0, 3)
				Msg2Player(varMap, varPlayer, "领取任务完成，扣除3两现金！", 0, 2)
				Msg2Player(varMap, varPlayer, "扣除3两金币！", 0, 2)
			else
				if CostMoney(varMap,varPlayer,3,x310320_var_CostGold) ~= -1 then
					Msg2Player(varMap, varPlayer, "领取任务完成，扣除3两金卡！", 0, 3)
					Msg2Player(varMap, varPlayer, "领取任务完成，扣除3两金卡！", 0, 2)
					Msg2Player(varMap, varPlayer, "扣除3两金币！", 0, 2)
				else
					StartTalkTask(varMap)
		    	Msg2Player(varMap, varPlayer, "很遗憾，你的现金/金卡不足3两", 0, 3)
					Msg2Player(varMap, varPlayer, "很遗憾，你的现金/金卡不足3两", 0, 2)
		    		return
				end
			end
			end
		else


				if CostMoney(varMap,varPlayer,3,x310320_var_CostGold) ~= -1 then
					Msg2Player(varMap, varPlayer, "领取任务完成，扣除3两金卡！", 0, 3)
					Msg2Player(varMap, varPlayer, "领取任务完成，扣除3两金卡！", 0, 2)
					Msg2Player(varMap, varPlayer, "扣除3两金币！", 0, 2)

			else
				if CostMoney(varMap,varPlayer,2,x310320_var_CostGold,324) ~= -1 then
					Msg2Player(varMap, varPlayer, "领取任务完成，扣除3两现金！", 0, 3)
					Msg2Player(varMap, varPlayer, "领取任务完成，扣除3两现金！", 0, 2)
					Msg2Player(varMap, varPlayer, "扣除3两金币！", 0, 2)
				else
					StartTalkTask(varMap)
		    	Msg2Player(varMap, varPlayer, "很遗憾，你的现金/金卡不足3两", 0, 3)
					Msg2Player(varMap, varPlayer, "很遗憾，你的现金/金卡不足3两", 0, 2)
		    		return
			end
		end
	end
	
	local retmiss = AddQuest( varMap, varPlayer, x310320_var_QuestId, x310320_var_FileId, 0, 0, 0, 1)
   	if retmiss ==0 then
       Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
       return 0
   	end
   	
	
   	x310320_IncCountMD(varMap ,varPlayer)  
   	local hour,minute,sec =GetHourMinSec()   	
    StartTalkTask(varMap)
   	TalkAppendString(varMap,"\t你顺利的接受了【个人】暴龙大作战！你可以去选择支援暴蓝或者暴红这两头暴龙之一，它们就在我的两边。\n\t我要再次提醒你：#G支持人数较少的暴龙会获得胜利！#W本次任务于#Y"..hour.."点10分".."#W结束，请掌控好你的时间。")
   	StopTalkTask(varMap)
   	DeliverTalkMenu(varMap,varPlayer,varTalknpc)
	
	x310320_ProcQuestLogRefresh( varMap, varPlayer, x310320_var_QuestId)
	
	
    GamePlayScriptLog( varMap, varPlayer, x310320_var_AcceptQuestLogID)
end

function x310320_ProcQuestAbandon(varMap, varPlayer, varQuest)
    if IsHaveQuest(varMap,varPlayer, x310320_var_QuestId) <= 0 then
        return 
    end
    
    DelQuest( varMap, varPlayer, x310320_var_QuestId)
    Msg2Player(varMap, varPlayer, format("您放弃了任务:%s",x310320_var_QuestName), 0, 2)
    Msg2Player(varMap, varPlayer, format("您放弃了任务:%s",x310320_var_QuestName), 0, 3) 
     
   	
    
   	if IsHaveSpecificImpact( varMap, varPlayer, x310320_var_HongBuff ) == 1 then
   		CancelSpecificImpact( varMap, varPlayer, x310320_var_HongBuff)
		x310320_var_HongNum	= x310320_var_HongNum	- 1
	elseif IsHaveSpecificImpact( varMap, varPlayer, x310320_var_LanBuff) == 1 then
		CancelSpecificImpact( varMap, varPlayer, x310320_var_LanBuff)
		x310320_var_LanNum	= x310320_var_LanNum - 1
	end   		
end




function x310320_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	local varLevel =GetLevel( varMap, varPlayer)
	local varExp 	=x310320_var_CoffExp * varLevel
	if IsHaveQuest(varMap,varPlayer, x310320_var_QuestId) <= 0 then
        StartTalkTask(varMap)
        TalkAppendString(varMap,"您没有这个任务！")
        StopTalkTask(varMap)
        DeliverTalkTips(varMap,varPlayer)
        return 0
	else
		local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x310320_var_QuestId)
   		local IsWin = GetQuestParam( varMap, varPlayer, varQuestIdx, 6)
		if DelQuest(varMap, varPlayer, x310320_var_QuestId) > 0 then
			if IsWin == 1 then
				varExp =varExp*2
    		StartTalkTask(varMap)
	        TalkAppendString(varMap,x310320_var_QuestCompleted1)
	        StopTalkTask(varMap)
	        DeliverTalkMenu(varMap,varPlayer,varTalknpc)
	        AddExp(varMap, varPlayer, varExp)
	      StopTalkTask()
    	else
	    	StartTalkTask(varMap)
	        TalkAppendString(varMap,x310320_var_QuestCompleted2)
	        StopTalkTask(varMap)
	        DeliverTalkMenu(varMap,varPlayer,varTalknpc)
	        AddExp(varMap, varPlayer, varExp)
	      StopTalkTask()  
    	end
    	Msg2Player( varMap, varPlayer, format( "获得#R经验%d点#cffcf00的奖励", varExp).."。", 8, 2)
			Msg2Player( varMap, varPlayer, format( "获得#R经验%d点#cffcf00的奖励", varExp), 8, 3)
       end
	
       
   end
   
   GamePlayScriptLog( varMap, varPlayer, x310320_var_FinishQuestLogID)
   
end

 
