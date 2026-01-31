x310112_var_FileId = 310112
x310112_var_QuestName="青龙战场传送"

x310112_var_QingLong_Signup                  	= 200     
x310112_var_QingLong_WaitBattle              	= 201     
x310112_var_QingLong_BeginBattle             	= 202     
x310112_var_QingLong_EndBattle               	= 203     

function x310112_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	
    if GetMergeDBToggle() == 1 then
        return
    end
    
  
	local UpdateDBflag = GetUpdateDBBeforeToggle()
	if UpdateDBflag==1 then
		return
	end
    
    
    
    
    

    
    if GetBattleSceneToggle( BATTLESCENE_TYPE_QINGLONGBATTLELITE ) == 0 then
        return
    end

	local guild = GetGuildID(varMap, varPlayer)
	if guild == -1 then
		return 1
	end
	
	
    local nHumanGUID = GetPlayerGUID( varMap,varPlayer )
    local nCountryId,nKingGUID,szKingName,nCountryGold = GetCountrySimpleData( varMap,varPlayer )
    if nKingGUID <= 0 or nHumanGUID == nKingGUID then
    	return    	
    end
	
	
	local nBattleStatus = LuaCallNoclosure(310110,"GetBattleState",varMap)
    if nBattleStatus ~= x310112_var_QingLong_BeginBattle then
    	return 1
    end

    if LuaCallNoclosure(310110,"GetBattleEnterSceneFlag",varMap) ~= 1 then
       return 1
    end

	TalkAppendButton(varMap,x310112_var_FileId,x310112_var_QuestName,3);
end


function x310112_ProcEventEntry( varMap, varPlayer, varTalknpc )
    
    
    local nBattleStatus = LuaCallNoclosure(310110,"GetBattleState",varMap)
    if nBattleStatus ~= x310112_var_QingLong_BeginBattle then
 		StartTalkTask(varMap)
		TalkAppendString(varMap, "战场未开放！");
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 1
	end

    local guild = GetGuildID(varMap, varPlayer)
	if guild == -1 then
        StartTalkTask(varMap)
		TalkAppendString(varMap, "没有帮会,不能申请进入战场！");
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 1
	end


    if LuaCallNoclosure(310110,"GetBattleEnterSceneFlag",varMap) ~= 1 then
        
        StartTalkTask(varMap)
		TalkAppendString(varMap, "现在不能进入战场！");
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
        return 1
    end

	
    if GetMergeDBToggle() == 1 then
        return
    end
    
  
	local UpdateDBflag = GetUpdateDBBeforeToggle()
	if UpdateDBflag==1 then
		return
	end
    
    
    
    
    

    
    if GetBattleSceneToggle( BATTLESCENE_TYPE_QINGLONGBATTLELITE ) == 0 then
       return
    end
    
    
    local nHumanGUID = GetPlayerGUID( varMap,varPlayer )
    local nCountryId,nKingGUID,szKingName,nCountryGold = GetCountrySimpleData( varMap,varPlayer )
    if nKingGUID <= 0 or nHumanGUID == nKingGUID then
    	return    	
    end
    

    
    local varState,varMsg = LuaCallNoclosure(800021,"BattleTransCheckPlayerState", varMap,varPlayer )
    if varState == 1 then
        
        StartTalkTask(varMap)
        TalkAppendString( varMap, varMsg );
        StopTalkTask(varMap)
        DeliverTalkTips(varMap,varPlayer)
        return 1
    end

    StartTalkTask( varMap )
    TalkAppendString( varMap, "确认要进入青龙战场吗？" )
    StopTalkTask( varMap )
    DeliverTalkInfo( varMap, varPlayer, varTalknpc, x310112_var_FileId,-1 )

    return 1
end




function x310112_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end




function x310112_ProcAccept( varMap, varPlayer )

	
    if GetMergeDBToggle() == 1 then
        return
    end
    
  
	local UpdateDBflag = GetUpdateDBBeforeToggle()
	if UpdateDBflag==1 then
		return
	end
    
    
    
    
    

    
    if GetBattleSceneToggle( BATTLESCENE_TYPE_QINGLONGBATTLELITE ) == 0 then
        return
    end
    
    
    local nHumanGUID = GetPlayerGUID( varMap,varPlayer )
    local nCountryId,nKingGUID,szKingName,nCountryGold = GetCountrySimpleData( varMap,varPlayer )
    if nKingGUID <= 0 or nHumanGUID == nKingGUID then
    	return    	
    end
	
	local nBattleStatus = LuaCallNoclosure(310110,"GetBattleState",varMap)
    if nBattleStatus ~= x310112_var_QingLong_BeginBattle then
    	return
    end

    local guild = GetGuildID(varMap, varPlayer)
	if guild == -1 then
		return
	end

    if LuaCallNoclosure(310110,"GetBattleEnterSceneFlag",varMap) ~= 1 then
        return
    end

    
    local varState,varMsg = LuaCallNoclosure(800021,"BattleTransCheckPlayerState", varMap,varPlayer )
    if varState == 1 then
        return
    end

    
    GameBattleRequestEnterScene(varMap, varPlayer,1) 
end

function x310112_ProcQingLongBattleChangeScene(varMap,varPlayer,nRetCode,newSceneID,nBattleCamp)
	
	if nRetCode == 0 then
		
		
		if varMap == PK_PUNISH_PRISON_SCENE_ID then
			StartTalkTask(varMap)
			local varText = "监狱里还不老实,想走,没门。"
			TalkAppendString( varMap, varText )
			StopTalkTask( varMap )
			DeliverTalkTips( varMap, varPlayer )
			return
		end
	
	    local PosX = 100
	    local PosZ = 100
	
	
	    if varMap == newSceneID then
	        
	        if Flag == 0 then
			    SetPos( varMap , varPlayer , 47 , 218 )
	        else
	            SetPos( varMap , varPlayer , 209,35 )
	        end
		else
	        
	        
	        local varState,varMsg = LuaCallNoclosure(800021,"BattleTransCheckPlayerState", varMap,varPlayer )
	        if varState == 1 then
	            
	            StartTalkTask(varMap)
	            TalkAppendString( varMap, varMsg );
	            StopTalkTask(varMap)
	            DeliverTalkTips(varMap,varPlayer)
	            return
	        end
	        
	        
			if LuaCallNoclosure(COUNTRY_BATTLE_LITE_SCRIPT,"CheckCountryBattleLiteSceneTrans",varMap,varPlayer,newSceneID) == 0 then
				return
			end
	
	        
	        local nCurX,nCurZ = GetWorldPos( varMap,varPlayer )
	        SetPlayerRuntimeData(varMap,varPlayer,RD_HUMAN_SCENE_PRE,varMap + 1)
	        SetPlayerRuntimeData(varMap,varPlayer,RD_HUMAN_POSX_PRE,nCurX)
	        SetPlayerRuntimeData(varMap,varPlayer,RD_HUMAN_POSZ_PRE,nCurZ)
	        SetPlayerRuntimeData(varMap,varPlayer,RD_BATTLESCENE_ENTER_FLAG,1)

			NewWorld( varMap , varPlayer , newSceneID , PosX , PosZ,310112 )
		end
		
	else
		x310112_ProcQingLongBattleTransError(varMap,varPlayer,nRetCode )
	end
end

function x310112_ProcQingLongBattleTransError(varMap,varPlayer,nRetCode )

	if nRetCode == 200 then
		
		StartTalkTask(varMap)
		TalkAppendString( varMap, "没有开始")
		StopTalkTask( varMap )
		DeliverTalkTips( varMap, varPlayer )
		
	elseif nRetCode == 201 then
	
		StartTalkTask(varMap)
		TalkAppendString( varMap, "没有帮会")
		StopTalkTask( varMap )
		DeliverTalkTips( varMap, varPlayer )

	elseif nRetCode == 202 then
		
		StartTalkTask(varMap)
		TalkAppendString( varMap, "帮会没有报名")
		StopTalkTask( varMap )
		DeliverTalkTips( varMap, varPlayer )
		
	elseif nRetCode == 203 then
		
		StartTalkTask(varMap)
		TalkAppendString( varMap, "战场已经结束")
		StopTalkTask( varMap )
		DeliverTalkTips( varMap, varPlayer )
		
	elseif nRetCode == 204 then
		
		StartTalkTask(varMap)
		TalkAppendString( varMap, "轮空")
		StopTalkTask( varMap )
		DeliverTalkTips( varMap, varPlayer )
		
	elseif nRetCode == 205 then
	
		StartTalkTask(varMap)
		TalkAppendString( varMap, "进场景时间已过")
		StopTalkTask( varMap )
		DeliverTalkTips( varMap, varPlayer )
		
	elseif nRetCode == 206 then
		
		StartTalkTask(varMap)
		TalkAppendString( varMap, "玩家已经进入过场景了")
		StopTalkTask( varMap )
		DeliverTalkTips( varMap, varPlayer )
		
	elseif nRetCode == 207 then
		
		StartTalkTask(varMap)
		TalkAppendString( varMap, "战场玩家已达上限")
		StopTalkTask( varMap )
		DeliverTalkTips( varMap, varPlayer )
		
	else
		
		StartTalkTask(varMap)
		TalkAppendString( varMap, "未知错误")
		StopTalkTask( varMap )
		DeliverTalkTips( varMap, varPlayer )
		
	end

end




function x310112_ProcQuestAbandon( varMap, varPlayer, varQuest )
end




function x310112_ProcContinue( varMap, varPlayer, varTalknpc )
end




function x310112_CheckSubmit( varMap, varPlayer )
end




function x310112_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end

