

function x800201_ProcEventEntry(varMap, varPlayer, bufIndex, varOpType)

		if varOpType ~= 0 then
			return
		end
		
		if x800201_limitingarden(varMap, varPlayer) ~= 0 then
			WriteLog(1, format("NoNoNo  varMap=%d  PlayerGUID=%X", varMap, GetGUID(varMap,varPlayer)))
			return
		end
		
		WriteLog(1, format("x800201_ProcEventEntry  varMap=%d  PlayerGUID=%X", varMap, GetGUID(varMap,varPlayer)))

		--local nGUID = GetEffectCasterIDByIndex(varMap, varPlayer, bufIndex)

		local nGUID = GetGardenTarGUID(varMap, varPlayer)			


		local szPlayerName = GetName(varMap, varPlayer)
		
		local guid = GetGUID(varMap, varPlayer)		

		if nGUID ~= 0 then 
			EnterGarden(varMap, varPlayer, nGUID)
		end

end

function x800201_limitingarden(mapId, playerId)
	--玩庄在副本、战场内无法进入庄园
	local sceneType = GetSceneType(mapId)
	if	sceneType ~= 0 then
		StartTalkTask(mapId)
    TalkAppendString( mapId, "处于副本或战场中,不能进入庄园" );
    StopTalkTask(mapId)
    DeliverTalkTips(mapId,playerId)	
		return 1
	end
	
	--玩庄变身，战场押运等状态无法搜索
	local state = IsPlayerStateNormal(mapId,playerId )
  if state == 0 then
  	StartTalkTask(mapId)
    TalkAppendString( mapId, "玩庄状态异常,不能进入庄园" );
    StopTalkTask(mapId)
    DeliverTalkTips(mapId,playerId)	
    return 1
  end

  state = IsPlayerMutexState(mapId,playerId,PLAYER_STATE_MENTALGAME )
  if state == 1 then
  	StartTalkTask(mapId)
    TalkAppendString( mapId, "处于答题状态,不能进入庄园" );
    StopTalkTask(mapId)
    DeliverTalkTips(mapId,playerId)	  
    return 1
  end

  state = IsPlayerMutexState(mapId,playerId,PLAYER_STATE_STALL )
  if state == 1 then
			StartTalkTask(mapId)
    	TalkAppendString( mapId, "处于摆摊状态,不能进入庄园" );
    	StopTalkTask(mapId)
    	DeliverTalkTips(mapId,playerId)	   
      return 1
  end

  state = IsPlayerMutexState(mapId,playerId,PLAYER_STATE_DIE )
  if state == 1 then
		StartTalkTask(mapId)
  	TalkAppendString( mapId, "处于死亡状态,不能进入庄园" );
  	StopTalkTask(mapId)
  	DeliverTalkTips(mapId,playerId)
  	 return 1
  end

  state = IsPlayerMutexState(mapId,playerId,PLAYER_STATE_CRASHBOX )
  if state == 1 then
		StartTalkTask(mapId)
  	TalkAppendString( mapId, "处于运镖状态,不能进入庄园" );
  	StopTalkTask(mapId)
  	DeliverTalkTips(mapId,playerId)  
    return 1
  end

  state = IsPlayerMutexState(mapId,playerId,PLAYER_STATE_AUTOPLAY )
  if state == 1 then
		StartTalkTask(mapId)
  	TalkAppendString( mapId, "处于挂机状态,不能进入庄园" );
  	StopTalkTask(mapId)
  	DeliverTalkTips(mapId,playerId) 
    return 1
  end

  state = IsPlayerMutexState(mapId,playerId,PLAYER_STATE_SUBTRAIN )
  if state == 1 then
		StartTalkTask(mapId)
  	TalkAppendString( mapId, "处于代练状态,不能进入庄园" );
  	StopTalkTask(mapId)
  	DeliverTalkTips(mapId,playerId)   
    return 1
  end

  state = IsPlayerMutexState(mapId,playerId,PLAYER_STATE_BUS )
  if state == 1 then
		StartTalkTask(mapId)
  	TalkAppendString( mapId, "处于BUS状态,不能进入庄园" );
  	StopTalkTask(mapId)
  	DeliverTalkTips(mapId,playerId)   
    return 1
  end

  state = IsPlayerMutexState(mapId,playerId,PLAYER_STATE_PKMODE )
  if state == 1 then
		StartTalkTask(mapId)
  	TalkAppendString( mapId, "PK值过高或处于入魔状态,不能进入庄园" );
  	StopTalkTask(mapId)
  	DeliverTalkTips(mapId,playerId)   
    return 1
  end
 
  state = IsPlayerMutexState(mapId,playerId,PLAYER_STATE_TONGQUBUFF )
  if state == 1 then
		StartTalkTask(mapId)
  	TalkAppendString( mapId, "处于童趣状态,不能进入庄园" );
  	StopTalkTask(mapId)
  	DeliverTalkTips(mapId,playerId)   
    return 1
  end
 
  if IsHideName(mapId, playerId) > 0 then
  	StartTalkTask(mapId)
  	TalkAppendString( mapId, "匿名状态下,不能进入庄园" );
  	StopTalkTask(mapId)
  	DeliverTalkTips(mapId,playerId)  
  	return 1
  end
  
  if mapId == PK_PUNISH_PRISON_SCENE_ID then
    StartTalkTask(mapId)
  	TalkAppendString( mapId, "在监狱里,不能进入庄园" );
  	StopTalkTask(mapId)
  	DeliverTalkTips(mapId,playerId)  
  	return 1
  end
  
  	if IsHaveSpecificImpact( mapId,playerId, 7610) == 1 or IsHaveSpecificImpact( mapId,playerId, 7607) == 1 or IsHaveSpecificImpact( mapId,playerId, 7608) == 1 or IsHaveSpecificImpact( mapId,playerId, 7605) == 1 or IsHaveSpecificImpact( mapId,playerId, 7616) == 1 or IsHaveSpecificImpact( mapId,playerId, 7613) == 1 or IsHaveSpecificImpact( mapId,playerId, 7614) == 1 or IsHaveSpecificImpact( mapId,playerId, 7611) == 1 or IsHaveSpecificImpact( mapId,playerId, 7622) == 1 or IsHaveSpecificImpact( mapId,playerId, 7619) == 1 or IsHaveSpecificImpact( mapId,playerId, 7620) == 1 or IsHaveSpecificImpact( mapId,playerId, 7617) == 1 or IsHaveSpecificImpact( mapId,playerId, 7628) == 1 or IsHaveSpecificImpact( mapId,playerId, 7625) == 1 or IsHaveSpecificImpact( mapId,playerId, 7626) == 1 or IsHaveSpecificImpact( mapId,playerId, 7623) == 1 then
		Msg2Player(mapId,playerId,"很抱歉，未完成铁人三项任务时无法进入庄园",8,3)
		return 1
	end
	
	if IsHaveSpecificImpact( mapId,playerId, 32584) == 1 then
		Msg2Player(mapId,playerId,"很抱歉，那达慕赛马大赛中无法进入庄园",8,3)
		return 1
	end
	
  	if IsHaveSpecificImpact( mapId,playerId, 7702 ) > 0 then
		StartTalkTask(mapId);
		TalkAppendString(mapId, "很抱歉，您扛着旗子不能进入庄园");
		StopTalkTask(mapId);
		DeliverTalkTips(mapId,playerId);
		Msg2Player(mapId,playerId,"很抱歉，您扛着旗子不能进入庄园",8,3)
		return 1
	end
	
  	local IsHaveFlag = IsHaveSpecificImpact(mapId,playerId, 7536  )
    if IsHaveFlag ~= 0 then
    	varMsg = "在暴龙大作战期间，不能进入庄园"
    	Msg2Player(mapId,playerId,varMsg,8,3)
    	return 1
    end
    
    IsHaveFlag = IsHaveSpecificImpact(mapId,playerId, 7537 )
    if IsHaveFlag ~= 0 then
    	varMsg = "在暴龙大作战期间，不能进入庄园"
    	Msg2Player(mapId,playerId,varMsg,8,3)
    	return 1
    end
	return 0	
end
