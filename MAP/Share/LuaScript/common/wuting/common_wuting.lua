






--DECLARE_QUEST_INFO_START--

x300160_var_FileId 				= 300160
x300160_var_QuestName			= "【美】大都美丽会"
x300160_var_QuestAbandonName	= "离开【美丽会】"

x300160_var_LevelLess				= 40

x300160_var_AimSceneList	= {
							{ varMap = 14, varX = 31, z = 49, cenx = 32, cenz = 35, r = 9 }
}

x300160_var_OpenTime2 = 1380

x300160_var_EndTime2  = 540

x300160_var_OpenTimeStartH2 = 23

x300160_var_OpenTimeStartM2 = 0

x300160_var_OpenTimeEndH2 = 9

x300160_var_OpenTimeEndM2 = 0

x300160_var_CloseTime     = 5
--DECLARE_QUEST_INFO_STOP--

x300160_var_QuestInfo           = "\t美丽会是大都的一大特色，在这里浪漫与激情并存！本场所在每天#G23：00-09:00#W开放。#W\n\t您在开放时间进入美丽会时将会收取您#G#{_MONEY%d}#W现银或银卡的入场费！您可以在美丽会服务员，酒保或小兔侍女处购买美酒提高您获得的奖励！\n\t点击以下按钮选择形象进入美丽会，在美丽会关闭前#G5分钟#W您将不能进入！尊贵的客人，是否需要我引领您进入美丽会？"
x300160_var_QuestContinueInfo   = "\t尊贵的来宾，非常感谢您的光临，如果您选择离开，您在本场结束前可以免费再次进入，您需要离开美丽会吗？"

x300160_var_EnterFeeRate		= 200

x300160_var_BackSceneId	=	0


x300160_var_PosTable              = {
                                    { varX = 209 , z = 230}, 
                                    { varX = 290 , z = 214}, 
                                    { varX = 223, z = 261}, 
                                    { varX = 276, z = 264 }, 
									{ varX = 255, z = 258 },
}

x300160_var_ErrorMessage			= "\t条件不符！"
x300160_var_ErrorMessage_Money	= "\t你没有足够现银或银卡！"
x300160_var_ErrorMessage_Level	= format("很抱歉，您的等级不足%d级，不能进入美丽会", x300160_var_LevelLess)

x300160_var_ErrorMessage_OutRange	= "请进入舞池跳舞！"
x300160_var_ErrorMessage_Close	= "\t很抱歉，美丽会开放时间为每天23:00-09:00，请在开放时间内入场！"
x300160_var_ErrorMessage_ProtectCar = "\t很抱歉，运镖状态不能进入美丽会！"
x300160_var_ErrorMessage_HaveBuff = "很抱歉，变身状态不能进入美丽会！"
x300160_var_ErrorMessage_Dress    = "您在穿着时装状态下不能进入美丽会！"
x300160_var_ErrorMessage_HideFace = "您在蒙面状态下不能进入美丽会！"

x300160_var_AddExpMessage = "您获得#R经验%d点#cEFC800的奖励"
x300160_var_AddExpMessage1 = "您获得#R声望%d点#cEFC800的奖励"
x300160_var_AddExpMessage2 = "您获得#R威望%d点#cEFC800的奖励"
x300160_var_ActiveMessage	= "尽情的跳舞吧！"
x300160_var_FadeOutMessage= "奖励状态消失，您需要购买相应道具继续获得奖励"


x300160_var_BaseBuffId        = 7646

x300160_var_XPBuffId          = 7647

x300160_var_DoubleXPBuffId    = 7648

x300160_var_CreditBuffId      = 7649

x300160_var_DoubleCreditBuffId= 7650

x300160_var_4ManaBuffId       = 7644

x300160_var_8ManaBuffId       = 7645

x300160_var_10H8XP            = 7667

x300160_var_10H8Credit        = 7666

x300160_var_10H8Mana          = 7665

x300160_var_10H4XP            = 7668

x300160_var_10H4Credit        = 7669





x300160_OK					= 0
x300160_OK_ABANDON			= 1
x300160_ERROR_UNKNOWN		= -1

x300160_FAILED_LEVEL		= 10
x300160_FAILED_OPEN			= 11
x300160_FAILED_YUNBIAO      = 14
x300160_FAILED_CHANGEBODY   = 15
x300160_FAILED_DRESS        = 16
x300160_FAILED_HIDEFACE     = 17

x300160_var_actionId			= 180

x300160_var_DressEquip_Pos    = 14


x300160_var_ForbidArray = {
                            7606, 
                            7605, 
							7607, 
							7608, 
							7609, 
							7610, 
							7611, 
							7612, 
							7613, 
							7614, 
							7615, 
							7616, 
							7617, 
							7618, 
							7619, 
							7620, 
							7621, 
							7622, 
							7623, 
							7624, 
							7625, 
							7626, 
							7627, 
							7628, 
                            7516, 
                            7517, 
}


x300160_var_Dancer1_Male      = 7651
x300160_var_Dancer2_Male      = 7652
x300160_var_Dancer3_Male      = 7653
x300160_var_Dancer1_Female    = 7654
x300160_var_Dancer2_Female    = 7655
x300160_var_Dancer3_Female    = 7656


x300160_var_BuffMaxTime       = 36000000


x300160_var_MaxInverval       = 840


x300160_var_KickNumber        = 100

x300160_var_AdditionalLevel   = 90


function x300160_ProcUseItem( varMap, varPlayer, buffId)
    
    local amountTime = GetImpactContinuanceByDataIndex( varMap, varPlayer, buffId)
    if amountTime > 0 then
        
        local remainTime = amountTime - GetImpactContinuanceElapsed( varMap, varPlayer, buffId)
        
        local newTime = 1800000 + remainTime
        if newTime > x300160_var_BuffMaxTime then
            newTime = x300160_var_BuffMaxTime
        end
        SetImpactContinuanceByDataIndex( varMap, varPlayer, buffId, newTime)
        ResetImpactContinuanceElapsed( varMap, varPlayer, buffId)
        RefreshImpactByDataIndex( varMap, varPlayer,buffId)
        return
    else
        SendSpecificImpactToUnit( varMap, varPlayer, varPlayer, varPlayer, buffId, 0)
    end
end


function x300160_ProcTimerDoingStart( varMap, varAct, varParam1, varParam2, varParam3, varParam4, Param5)
    SetSystemTimerTick( varMap, 300160, "BroadCast", varAct, 10 * 1000)
end

function x300160_BroadCast( varMap, varAct, varTime)
    local curTime = GetMinOfDay()

    if curTime > x300160_var_OpenTime2 or curTime < x300160_var_EndTime2 then
        LuaThisScenceM2Wrold( varMap, "#R营业时间将在09：00结束", 1, 1)
        SetSystemTimerTick( varMap, 300160, "BroadCast", varAct, 10 * 1000)
    else
    	local varHumanCount = GetScenePlayerCount( varMap)
        local varContinue = 0

        if varHumanCount > 0 then
            
            if varHumanCount > x300160_var_KickNumber then
                varHumanCount = x300160_var_KickNumber
                varContinue = 1
            end
            for varI = 0, varHumanCount do
                local varObj = GetScenePlayerObjId( varMap,varI)
                if varObj >= 0 then
                    
                    SetPlayerMutexState( varMap, varObj, PLAYER_STATE_DANCERY, 0)
                    GamePlayScriptLog( varMap, varObj, 42)

                    x300160_ChangeBody( varMap, varObj, 0, 0)

                    local strLog = format( "WTL: %s has been kick out dancery with sw(%d), ww(%d), xp=", GetName( varMap, varObj), GetShengWang( varMap, varObj), GetPlayerGoodBadValue( varMap, varObj) )
                    strLog = strLog..GetExp( varMap, varObj)
                    WriteLog( 1, strLog)

                    local r1 = random( -5, 5)
                    local r2 = random( -5, 5)
                    local varIndex = random( 1, getn( x300160_var_PosTable) )
                    NewWorld( varMap, varObj, 0, x300160_var_PosTable[ varIndex].varX+r1, x300160_var_PosTable[ varIndex].z+r2, 300160)
                end
            end
            
            if varContinue == 1 then
                SetSystemTimerTick( varMap, 300160, "BroadCast", varAct, 5 * 1000)
            end
        end
    end
end


function x300160_IsSameTime( varMap, varPlayer)
    
    local lastTime = x300160_GetEnterMinute( varMap, varPlayer)
    local curTime = GetMinOfYear()
    local costEnter = 1
    local year, month, day = GetYearMonthDay()
    if curTime < lastTime then
        
        if mod( year, 4) == 0 then
            
            if curTime + 527040 - lastTime >= x300160_var_MaxInverval then
                costEnter = 0
            end
        else
            if curTime + 525600 - lastTime >= x300160_var_MaxInverval then
                costEnter = 0
            end
        end
    else
        local lastYear = GetPlayerGameData( varMap, varPlayer, MD_WUTING_LAST_YEAR[ 1], MD_WUTING_LAST_YEAR[ 2], MD_WUTING_LAST_YEAR[ 3] )
        if lastYear == 0 then
            
            costEnter = 0
        else
            if year == ( lastYear + 2000) then
                if curTime - lastTime >= x300160_var_MaxInverval then
                    costEnter = 0
                end
            else
                
                costEnter = 0
            end
        end
    end

    return costEnter
end


function x300160_ProcMapPlayerNewConnectEnter( varMap, varPlayer)
    if x300160_IsOpenTime( 1) == 0 or x300160_IsSameTime( varMap, varPlayer) == 0 then
        
        
        
        
        
        
        SetPlayerRuntimeData( varMap, varPlayer, RD_DANCERY_BODYID, 1)
        SendSpecificImpactToUnit( varMap, varPlayer, varPlayer, varPlayer, 8401, 0)
    else
        
        x300160_ChangeBody( varMap, varPlayer, x300160_GetChangeID( varMap, varPlayer), 1)
        
        SetPlayerMutexState( varMap, varPlayer, PLAYER_STATE_DANCERY, 1)
    end
    if GetPlayerGameData( varMap, varPlayer, MD_WUTING_OFFLINE_FLAG[ 1], MD_WUTING_OFFLINE_FLAG[ 2], MD_WUTING_OFFLINE_FLAG[ 3] ) == 1 then
        LuaCallNoclosure( 300178, "ProcMapPlayerNewConnectEnter", varMap, varPlayer)
    end
end

function x300160_ChangeBody( varMap, varPlayer, changeID, op)
    local sex = GetSex( varMap, varPlayer)
    if op == 1 then
        if changeID == 2 then
            if sex == 1 then
                SendSpecificImpactToUnit( varMap, varPlayer, varPlayer, varPlayer, x300160_var_Dancer1_Male, 0)
            else
                SendSpecificImpactToUnit( varMap, varPlayer, varPlayer, varPlayer, x300160_var_Dancer1_Female, 0)
            end
        elseif changeID == 3 then
            if sex == 1 then
                SendSpecificImpactToUnit( varMap, varPlayer, varPlayer, varPlayer, x300160_var_Dancer2_Male, 0)
            else
                SendSpecificImpactToUnit( varMap, varPlayer, varPlayer, varPlayer, x300160_var_Dancer2_Female, 0)
            end
        elseif changeID == 4 then
            if sex == 1 then
                SendSpecificImpactToUnit( varMap, varPlayer, varPlayer, varPlayer, x300160_var_Dancer3_Male, 0)
            else
                SendSpecificImpactToUnit( varMap, varPlayer, varPlayer, varPlayer, x300160_var_Dancer3_Female, 0)
            end
        end
    else
        if IsHaveSpecificImpact( varMap, varPlayer, x300160_var_Dancer1_Male) == 1 then
            CancelSpecificImpact( varMap, varPlayer, x300160_var_Dancer1_Male)
        elseif IsHaveSpecificImpact( varMap, varPlayer, x300160_var_Dancer1_Female) == 1 then
            CancelSpecificImpact( varMap, varPlayer, x300160_var_Dancer1_Female)
        elseif IsHaveSpecificImpact( varMap, varPlayer, x300160_var_Dancer2_Male) == 1 then
            CancelSpecificImpact( varMap, varPlayer, x300160_var_Dancer2_Male)
        elseif IsHaveSpecificImpact( varMap, varPlayer, x300160_var_Dancer2_Female) == 1 then
            CancelSpecificImpact( varMap, varPlayer, x300160_var_Dancer2_Female)
        elseif IsHaveSpecificImpact( varMap, varPlayer, x300160_var_Dancer3_Male) == 1 then
            CancelSpecificImpact( varMap, varPlayer, x300160_var_Dancer3_Male)
        elseif IsHaveSpecificImpact( varMap, varPlayer, x300160_var_Dancer3_Female) == 1 then
            CancelSpecificImpact( varMap, varPlayer, x300160_var_Dancer3_Female)
        end
    end
end

function x300160_ProcIntervalOverEvent( varMap, varPlayer, buffId)
	if x300160_IsOpenTime( 1) == 0 then
        return 0
	end

	if varMap == 14 then
		local varX = GetPlayerWorldX(varMap, varPlayer)
		local z = GetPlayerWorldZ(varMap, varPlayer)
		local item = x300160_var_AimSceneList[ 1]
        local varLevel = GetLevel( varMap, varPlayer)
        
        if IsPlayerMutexState( varMap, varPlayer, PLAYER_STATE_DANCERY) ~= 1 then
            SetPlayerMutexState( varMap, varPlayer, PLAYER_STATE_DANCERY, 1)
        end

        if buffId == x300160_var_BaseBuffId then
            if IsHaveSpecificImpact( varMap, varPlayer, x300160_var_XPBuffId) ~= 1 and 
                IsHaveSpecificImpact( varMap, varPlayer, x300160_var_DoubleXPBuffId) ~= 1 and 
                IsHaveSpecificImpact( varMap, varPlayer, x300160_var_10H4XP) ~= 1 and 
                IsHaveSpecificImpact( varMap, varPlayer, x300160_var_10H8XP) ~= 1 then
                if varLevel >= x300160_var_AdditionalLevel then
                    x300160_AddExp( varMap, varPlayer, 0.65)
                else
                    x300160_AddExp(varMap, varPlayer, 0.5)
                end
            end
            if IsHaveSpecificImpact( varMap, varPlayer, x300160_var_CreditBuffId) ~= 1 and 
                IsHaveSpecificImpact( varMap, varPlayer, x300160_var_DoubleCreditBuffId) ~= 1 and 
                IsHaveSpecificImpact( varMap, varPlayer, x300160_var_10H4Credit) ~= 1 and 
                IsHaveSpecificImpact( varMap, varPlayer, x300160_var_10H8Credit) ~= 1 then
                x300160_AddCredit( varMap, varPlayer, 1)
            end
            
                
            
        elseif buffId == x300160_var_XPBuffId then
            if varLevel >= x300160_var_AdditionalLevel then
                x300160_AddExp(varMap, varPlayer, 2.6)
            else
                x300160_AddExp(varMap, varPlayer, 2)
            end
        elseif buffId == x300160_var_DoubleXPBuffId or buffId == x300160_var_10H8XP then
            if varLevel >= x300160_var_AdditionalLevel then
                x300160_AddExp(varMap, varPlayer, 5.2)
            else
                x300160_AddExp(varMap, varPlayer, 4)
            end
        elseif buffId == x300160_var_CreditBuffId then
            x300160_AddCredit( varMap, varPlayer, 4)
        elseif buffId == x300160_var_DoubleCreditBuffId then
            x300160_AddCredit( varMap, varPlayer, 8)
        elseif buffId == x300160_var_10H8Credit then
            x300160_AddCredit( varMap, varPlayer, 8)
        elseif buffId == x300160_var_8ManaBuffId then
            x300160_AddMana( varMap, varPlayer, 8)
        elseif buffId == x300160_var_10H8Mana then
            x300160_AddMana( varMap, varPlayer, 8)
        elseif buffId == x300160_var_10H4XP then
            if varLevel >= x300160_var_AdditionalLevel then
                x300160_AddExp(varMap, varPlayer, 2.6)
            else
                x300160_AddExp(varMap, varPlayer, 2)
            end
        elseif buffId == x300160_var_10H4Credit then
            x300160_AddCredit( varMap, varPlayer, 4)
        end
        
        ReCallHorse( varMap, varPlayer)
	end
end

function x300160_ProcActiveEvent(varMap, varPlayer)
    if varMap == 14 then
        Msg2Player( varMap, varPlayer, x300160_var_ActiveMessage, 8, 3)
    end
end

function x300160_ProcFadeOutEvent(varMap, varPlayer, buff)
    if varMap == 14 then
		if buff == 7646 then
	    	local varStr = x300160_var_FadeOutMessage;
	        StartTalkTask( varMap);
	            TalkAppendString( varMap, varStr);
	        StopTalkTask( varMap);
	        DeliverTalkTips( varMap, varPlayer);
	    	local varReadme = "您身上的基础奖励状态消失！"
	    	Msg2Player(varMap,varPlayer,varReadme,8,2)
		end
		if buff == 7647 then
	    	local varStr = x300160_var_FadeOutMessage;
	        StartTalkTask( varMap);
	            TalkAppendString( varMap, varStr);
	        StopTalkTask( varMap);
	        DeliverTalkTips( varMap, varPlayer);
	    	local varReadme = "您身上的4倍经验状态消失，您可以在在美丽会内的酒保或小兔侍女处购买杰克丹尼来继续获得奖励！"
	    	Msg2Player(varMap,varPlayer,varReadme,8,2)
		end
		if buff == 7648 or buff == x300160_var_10H8XP then
	    	local varStr = x300160_var_FadeOutMessage;
	        StartTalkTask( varMap);
	            TalkAppendString( varMap, varStr);
	        StopTalkTask( varMap);
	        DeliverTalkTips( varMap, varPlayer);
	    	local varReadme = "您身上的8倍经验状态消失，您可以在美丽会内的酒保或小兔侍女处购买芝华士来继续获得奖励！"
	    	Msg2Player(varMap,varPlayer,varReadme,8,2)
		end
		if buff == 7649 then
			local varStr = x300160_var_FadeOutMessage;
	        StartTalkTask( varMap);
	        TalkAppendString( varMap, varStr);
	        StopTalkTask( varMap);
	        DeliverTalkTips( varMap, varPlayer);
	    	local varReadme = "您身上的4倍声望状态消失，您可以在美丽会内的酒保或小兔侍女处购买路易十三来继续获得奖励！"
	    	Msg2Player(varMap,varPlayer,varReadme,8,2)
		end
		if buff == 7650 or buff == x300160_var_10H8Credit then
	    	local varStr = x300160_var_FadeOutMessage;
	        StartTalkTask( varMap);
	            TalkAppendString( varMap, varStr);
	        StopTalkTask( varMap);
	        DeliverTalkTips( varMap, varPlayer);
	    	local varReadme = "您身上的8倍声望状态消失，您可以在美丽会内的酒保或小兔侍女处购买轩尼诗理查来继续获得奖励！"
	    	Msg2Player(varMap,varPlayer,varReadme,8,2)
		end
        if buff == x300160_var_4ManaBuffId then
            Msg2Player( varMap, varPlayer, x300160_var_FadeOutMessage, 8, 3)
	    	Msg2Player( varMap, varPlayer, "您身上的威望状态消失，您可以在美丽会内的酒保或小兔侍女处购买黑雪茄来继续获得奖励！", 8, 2)
        end
        if buff == x300160_var_8ManaBuffId or buff == x300160_var_10H8Mana then
            Msg2Player( varMap, varPlayer, x300160_var_FadeOutMessage, 8, 3)
	    	Msg2Player( varMap, varPlayer, "您身上的威望状态消失，您可以在美丽会内的酒保或小兔侍女处购买哈瓦那雪茄来继续获得奖励！", 8, 2)
        end
	end
	 if varMap ~= 14 then
		if buff == 7646 then
			StartTalkTask( varMap);
	        TalkAppendString( varMap, "您身上的跳舞基础奖励状态已经消失！");
	        StopTalkTask( varMap);
	        DeliverTalkTips( varMap, varPlayer);
	    	local varReadme = "您身上的跳舞基础奖励状态已经消失！"
	    	Msg2Player(varMap,varPlayer,varReadme,8,2)
		end
		
		if buff == 7647 then
			StartTalkTask( varMap);
	        TalkAppendString( varMap, "您身上的跳舞4倍经验状态已经消失！");
	        StopTalkTask( varMap);
	        DeliverTalkTips( varMap, varPlayer);
	    	local varReadme = "您身上的跳舞4倍经验状态已经消失！"
	    	Msg2Player(varMap,varPlayer,varReadme,8,2)
		end
		if buff == 7648 or buff == x300160_var_10H8XP then
			StartTalkTask( varMap);
	        TalkAppendString( varMap, "您身上的跳舞8倍经验状态已经消失！");
	        StopTalkTask( varMap);
	        DeliverTalkTips( varMap, varPlayer);
	    	local varReadme = "您身上的跳舞8倍经验状态已经消失！"
	    	Msg2Player(varMap,varPlayer,varReadme,8,2)
		end
		if buff == 7649 then
			StartTalkTask( varMap);
	        TalkAppendString( varMap, "您身上的跳舞4倍声望状态已经消失！");
	        StopTalkTask( varMap);
	        DeliverTalkTips( varMap, varPlayer);
	    	local varReadme = "您身上的跳舞4倍声望状态已经消失！"
	    	Msg2Player(varMap,varPlayer,varReadme,8,2)
		end
		if buff == 7650 or buff == x300160_var_10H8Credit then
			StartTalkTask( varMap);
	        TalkAppendString( varMap, "您身上的跳舞8倍声望状态已经消失！");
	        StopTalkTask( varMap);
	        DeliverTalkTips( varMap, varPlayer);
	    	local varReadme = "您身上的跳舞8倍声望状态已经消失！"
	    	Msg2Player(varMap,varPlayer,varReadme,8,2)
		end
        if buff == x300160_var_4ManaBuffId then
            Msg2Player( varMap, varPlayer, "您身上的威望状态消失！", 8, 3)
	    	Msg2Player( varMap, varPlayer, "您身上的威望状态消失！", 8, 2)
        end
        if buff == x300160_var_8ManaBuffId or buff == x300160_var_10H8Mana then
            Msg2Player( varMap, varPlayer, "您身上的威望状态消失！", 8, 3)
	    	Msg2Player( varMap, varPlayer, "您身上的威望状态消失！", 8, 2)
        end
    end
end




function x300160_IsInDancery(varMap, varPlayer)

	for varI, item in x300160_var_AimSceneList do
		if varMap == item.varMap then
			return varI;
		end
	end
	return 0;

end




function x300160_AddExp(varMap, varPlayer, times)
    
    local varLevel = GetLevel( varMap, varPlayer)
	
	if varLevel < 70 then
		local xp = 100 * 1.5 * varLevel / 6 * times
		
		AddExp( varMap, varPlayer, xp)
		
		Msg2Player( varMap, varPlayer, format( x300160_var_AddExpMessage, xp), 8, 3)
	end
	if varLevel >=70 and varLevel < 80 then
		local xp = 100 * 2.7 * varLevel / 6 * times
		
		AddExp( varMap, varPlayer, xp)
		
		Msg2Player( varMap, varPlayer, format( x300160_var_AddExpMessage, xp), 8, 3)
	end
	if varLevel >=80 then
		local xp = 100 * 5.4 * varLevel / 6 * times
		
		AddExp( varMap, varPlayer, xp)
		
		Msg2Player( varMap, varPlayer, format( x300160_var_AddExpMessage, xp), 8, 3)
	end
end

function x300160_AddCredit( varMap, varPlayer, times)
    local credits = 1 * times
    SetShengWang( varMap, varPlayer, GetShengWang( varMap, varPlayer) + credits)
    Msg2Player( varMap, varPlayer, format( x300160_var_AddExpMessage1, credits), 8, 3)
    
end

function x300160_AddMana( varMap, varPlayer, times)
    SetPlayerGoodBadValue( varMap, varPlayer, GetPlayerGoodBadValue( varMap, varPlayer) + times)
    Msg2Player( varMap, varPlayer, format( x300160_var_AddExpMessage2, times), 8, 3)
end



function x300160_IsOpenTime( bInDanceRoom)
    if bInDanceRoom == 1 then
        local curTime = GetMinOfDay()
        if curTime >= x300160_var_OpenTime2 or curTime < x300160_var_EndTime2 then
            return 1
        end
    else
        local curTime = GetMinOfDay()
        if curTime >= x300160_var_OpenTime2 or curTime < x300160_var_EndTime2 - x300160_var_CloseTime then
            return 1
        end
    end

    return 0
end




function x300160_SafeNPCCheck( varMap, varPlayer)

	if x300160_IsInDancery(varMap, varPlayer) > 0 then
        
		return x300160_OK_ABANDON
	end
	
	if GetLevel(varMap, varPlayer) < x300160_var_LevelLess then
		return x300160_FAILED_LEVEL, x300160_var_ErrorMessage_Level
	end
	
    if x300160_IsOpenTime( 0) == 0 then
        local strOpenTime = "非常抱歉，官府规定我们的营业时间为#G%02d: %02d—%02d: %02d#cffcf00，请在营业时间前来光临！"
        local varStr = format( strOpenTime, 
                                    x300160_var_OpenTimeStartH2, x300160_var_OpenTimeStartM2, x300160_var_OpenTimeEndH2, x300160_var_OpenTimeEndM2)
        return x300160_FAILED_OPEN, varStr
    end
    
    if IsBusMember( varMap, varPlayer) == 1 then
        return x300160_FAILED_YUNBIAO, x300160_var_ErrorMessage_ProtectCar
    end
    
    if x300160_IsSpecialImpace( varMap, varPlayer) == 1 then
        return x300160_FAILED_CHANGEBODY, x300160_var_ErrorMessage_HaveBuff
    end
    
    if GetEquipItemID(varMap, varPlayer, x300160_var_DressEquip_Pos) ~= -1 then
        return x300160_FAILED_DRESS, x300160_var_ErrorMessage_Dress
    end
    
    if IsHideName( varMap, varPlayer) > 0 then
        return x300160_FAILED_HIDEFACE, x300160_var_ErrorMessage_HideFace
    end

    return x300160_OK

end




function x300160_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest)
    local varStr
    
    if x300160_IsInDancery( varMap, varPlayer) > 0 then
        varStr = x300160_var_QuestAbandonName;
    else
        varStr = x300160_var_QuestName;
    end
    TalkAppendButton( varMap, x300160_var_FileId, varStr, 14, 1)
end


function x300160_EnterScene( varMap, varPlayer)
    if varMap == 14 then
        x300160_ChangeBody( varMap, varPlayer, x300160_GetChangeID( varMap, varPlayer), 1)
    end
end




function x300160_GetEnterFee( varMap, varPlayer)

	return GetLevel( varMap, varPlayer) * x300160_var_EnterFeeRate;

end




function x300160_ProcEventEntry( varMap, varPlayer, varTalknpc, idScript, idExt)

	local varStr = "#Y"..x300160_var_QuestName.."#W\n";

	if x300160_IsInDancery( varMap, varPlayer) > 0 then
		varStr = varStr..x300160_var_QuestContinueInfo;
		StartTalkTask( varMap);
			TalkAppendString( varMap, varStr);
		StopTalkTask( varMap);
        DeliverTalkInfo( varMap, varPlayer, varTalknpc, x300160_var_FileId, -1)
	else
        if idExt == 1 then
            varStr = varStr..format( x300160_var_QuestInfo, x300160_GetEnterFee( varMap, varPlayer) )
            StartTalkTask( varMap);
                TalkAppendString( varMap, varStr);

                if x300160_IsSameTime( varMap, varPlayer) == 0 then
                    TalkAppendButton( varMap, x300160_var_FileId, format( "变换天舞者（#{_MONEY%d}）", x300160_GetEnterFee( varMap, varPlayer) ),  3, 2)
                    TalkAppendButton( varMap, x300160_var_FileId, format( "变换狂舞者（#{_MONEY%d}）", x300160_GetEnterFee( varMap, varPlayer) ),  3, 3)
                    TalkAppendButton( varMap, x300160_var_FileId, format( "变换风舞者（#{_MONEY%d}）", x300160_GetEnterFee( varMap, varPlayer) ),  3, 4)
                else                                                 
                    TalkAppendButton( varMap, x300160_var_FileId, "变换天舞者",  3, 2)
                    TalkAppendButton( varMap, x300160_var_FileId, "变换狂舞者",  3, 3)
                    TalkAppendButton( varMap, x300160_var_FileId, "变换风舞者",  3, 4)
                end
            StopTalkTask( varMap);
            DeliverTalkMenu( varMap, varPlayer, varTalknpc)
        else
            x300160_EnterDancery( varMap, varPlayer)
            x300160_SetChangeID( varMap, varPlayer, idExt)
        end
	end

end

function x300160_EnterDancery( varMap, varPlayer)
    local checkResult, strCheck = x300160_SafeNPCCheck( varMap, varPlayer)
    if checkResult ~= x300160_OK then
        Msg2Player( varMap, varPlayer, strCheck, 8, 3)
        return
    end

    
    local curDay = GetDayOfYear()
    
    local curMinute = GetMinOfYear()
    
    local costEnter = 0
    
    -- 舞厅进入计数
    local wutingnum = x300160_GetMD( varMap, varPlayer, MD_2011CJBC_WUTING)
    local freenum = x300160_GetMD( varMap, varPlayer, MD_2011CJBC_WUTINGFREE)       
    if x300160_IsSameTime( varMap, varPlayer) == 0 then
        
        if x300160_CostFee( varMap, varPlayer) <= 0 then
            
            Msg2Player( varMap, varPlayer, x300160_var_ErrorMessage_Money, 8, 3)
            return
        --春节补偿（进入舞厅）数值计算
        elseif curDay >= 24 and curDay < 45 and wutingnum < 22 then
        	x300160_SetMD( varMap, varPlayer, MD_2011CJBC_WUTING, wutingnum + 1)   
        	x300160_SetMD( varMap, varPlayer, MD_2011CJBC_WUTINGFREE, freenum + 1)        	  
        end
        costEnter = 1
        
        x300160_SetEnterMinute( varMap, varPlayer, curMinute)
        local varY, m, d = GetYearMonthDay()
        SetPlayerGameData( varMap, varPlayer, MD_WUTING_LAST_YEAR[ 1], MD_WUTING_LAST_YEAR[ 2], MD_WUTING_LAST_YEAR[ 3], varY - 2000)
    end

    
    

    local strLog = format( "WTL: %s enter dancery with sw(%d), ww(%d), xp=", GetName( varMap, varPlayer), GetShengWang( varMap, varPlayer), GetPlayerGoodBadValue( varMap, varPlayer) )
    strLog = strLog..GetExp( varMap, varPlayer)
    WriteLog( 1, strLog)

    
	local aimscene, aimx, aimz = x300160_GetAimSceneInfo(varMap, varPlayer);
	NewWorld(varMap, varPlayer, aimscene, aimx, aimz, 300160)

    
    
    

    
    

	GamePlayScriptLog( varMap, varPlayer, 41)
end

function x300160_IsSpecialImpace( varMap, varPlayer)
    for varI, buff in x300160_var_ForbidArray do
        if IsHaveSpecificImpact( varMap, varPlayer, buff) == 1 then
            return 1
        end
    end

    return 0
end




function x300160_ProcAcceptCheck( varMap, varPlayer, varTalknpc)
	return 1
end




function x300160_CostFee( varMap, varPlayer)

	local money = x300160_GetEnterFee(varMap, varPlayer);
	
		
	
	
		
	
    if GetSillerMode( varMap, varPlayer ) == 1 then
        if CostMoney( varMap, varPlayer, 0, money) ~= 1 then
            if CostMoney(varMap, varPlayer, 1, money) ~= 1 then
                Msg2Player( varMap, varPlayer, "扣费失败，请稍候再试", 8, 3)
                return 0
            end
        end
    else
        if CostMoney( varMap, varPlayer, 1, money) ~= 1 then
            if CostMoney(varMap, varPlayer, 0, money, 306) ~= 1 then
                Msg2Player( varMap, varPlayer, "扣费失败，请稍候再试", 8, 3)
                return 0
            end
        end
    end

    
    SendSpecificImpactToUnit( varMap, varPlayer, varPlayer, varPlayer, x300160_var_BaseBuffId, 0)

    return 1;

end




function x300160_GetAimSceneInfo(varMap, varPlayer)

	local pAimScene = x300160_var_AimSceneList[1];
	return pAimScene.varMap, pAimScene.varX, pAimScene.z;

end




function x300160_ProcAccept( varMap, varPlayer, varTalknpc)
end

function x300160_GetEnterMinute( varMap, varPlayer)
    return GetPlayerGameData( varMap, varPlayer, MD_WUTING_ENTERMINUTE[ 1], MD_WUTING_ENTERMINUTE[ 2], MD_WUTING_ENTERMINUTE[ 3] )
end

function x300160_SetEnterMinute( varMap, varPlayer, value)
    SetPlayerGameData( varMap, varPlayer, MD_WUTING_ENTERMINUTE[ 1], MD_WUTING_ENTERMINUTE[ 2], MD_WUTING_ENTERMINUTE[ 3], value)
end

function x300160_GetChangeID( varMap, varPlayer)
    return GetPlayerGameData( varMap, varPlayer, MD_WUTING_CHANGEID[ 1], MD_WUTING_CHANGEID[ 2], MD_WUTING_CHANGEID[ 3] )
end

function x300160_SetChangeID( varMap, varPlayer, value)
    SetPlayerGameData( varMap, varPlayer, MD_WUTING_CHANGEID[ 1], MD_WUTING_CHANGEID[ 2], MD_WUTING_CHANGEID[ 3], value)
end




function x300160_TransferBack(varMap, varPlayer)
    
    SetPlayerMutexState( varMap, varPlayer, PLAYER_STATE_DANCERY, 0)

    
    x300160_ChangeBody( varMap, varPlayer, 0, 0)

	local aimscene = x300160_var_BackSceneId;
	local varIndex = random( 1, getn( x300160_var_PosTable) )

    local strLog = format( "WTL: %s leave dancery with sw(%d), ww(%d), xp=", GetName( varMap, varPlayer), GetShengWang( varMap, varPlayer), GetPlayerGoodBadValue( varMap, varPlayer) )
    strLog = strLog..GetExp( varMap, varPlayer)
    WriteLog( 1, strLog)

    NewWorld( varMap, varPlayer, 0, x300160_var_PosTable[ varIndex].varX, x300160_var_PosTable[ varIndex].z, 300160)

	GamePlayScriptLog( varMap, varPlayer, 42)
end




function x300160_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
end

function x300160_ProcAcceptCheck( varMap, varPlayer, varTalknpc)
	x300160_TransferBack(varMap, varPlayer);
end




function x300160_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end




function x300160_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
end




function x300160_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
end


function x300160_GetMD( varMap, varPlayer, mdName)
    return GetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3] )
end

function x300160_SetMD( varMap, varPlayer, mdName, value)
    SetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3], value)
end
