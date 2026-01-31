





x300930_var_FileId = 300930 
x300930_var_ItemID = 12030007







function x300930_ProcEventEntry( varMap, varPlayer, varBagIdx,varOpType )
	if IsBusMember(varMap, varPlayer) == 1 and varOpType == 0 then
		local varMsg = "运镖、乘坐公交车或者护送状态时不能使用回城卷轴！"
		StartTalkTask(varMap)
			TalkAppendString(varMap, varMsg);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,varMsg,8,2)
		return
	end

end






function x300930_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x300930_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x300930_ProcConditionCheck( varMap, varPlayer, varBagIdx)
	
--	if GetGuildID( varMap, varPlayer ) == -1 then
--		StartTalkTask(varMap)
--		TalkAppendString(varMap, "很抱歉，您没有帮会");
--		StopTalkTask(varMap)
--		DeliverTalkTips(varMap,varPlayer)
--		Msg2Player(varMap,varPlayer,"很抱歉，您没有帮会",8,2)
--		return
--	end
--	
--	if IsBusMember(varMap, varPlayer) == 1 then
--		local varMsg = "运镖、乘坐公交车或者护送状态时不能使用领地传送石！"
--		StartTalkTask(varMap)
--		TalkAppendString(varMap, varMsg);
--		StopTalkTask(varMap)
--		DeliverTalkTips(varMap,varPlayer)
--		Msg2Player(varMap,varPlayer,varMsg,8,2)
--		return 
--	end
--	
--	if varMap == 12 then
--		local varMsg = "监狱中不能使用领地传送石！"
--		StartTalkTask(varMap)
--		TalkAppendString(varMap, varMsg);
--		StopTalkTask(varMap)
--		DeliverTalkTips(varMap,varPlayer)
--		Msg2Player(varMap,varPlayer,varMsg,8,2)
--		return 0
--	end
--
--	if IsHaveSpecificImpact( varMap, varPlayer, 7702 ) > 0 then
--		StartTalkTask(varMap);
--		TalkAppendString(varMap, "扛着旗子不能使用领地传送石！");
--		StopTalkTask(varMap);
--		DeliverTalkTips(varMap,varPlayer);
--		Msg2Player(varMap,varPlayer,"扛着旗子不能使用领地传送石！",8,2)
--		return 0
--	end
--	if IsHaveSpecificImpact( varMap, varPlayer, 7062 ) > 0                
--		or IsHaveSpecificImpact( varMap, varPlayer, 7063 ) >0               
--		or IsHaveSpecificImpact( varMap, varPlayer, 7064 ) >0               
--		or IsHaveSpecificImpact( varMap, varPlayer, 7065 ) >0 then          
--		StartTalkTask(varMap);                                              
--		TalkAppendString(varMap, "携带龙魂状态不能使用领地传送石");         
--		StopTalkTask(varMap);                                               
--		DeliverTalkTips(varMap,varPlayer);                                  
--		Msg2Player(varMap,varPlayer,"携带龙魂状态不能来使用领地传送石",8,2) 
--		return 0                                                            
--	end                                                                   
--
--	
--	local IsHaveFlag = IsHaveSpecificImpact(varMap, varPlayer, 7536  )
--    if IsHaveFlag ~= 0 then
--    	local varMsg = "在暴龙大作战期间，不能传送"
--    	StartTalkTask(varMap)
--			TalkAppendString(varMap, varMsg);
--		StopTalkTask(varMap)
--		DeliverTalkTips(varMap,varPlayer)
--		Msg2Player(varMap,varPlayer,varMsg,8,2)
--		return 0
--    end
--    
--    IsHaveFlag = IsHaveSpecificImpact(varMap, varPlayer, 7537 )
--    if IsHaveFlag ~= 0 then
--    	local varMsg = "在暴龙大作战期间，不能传送"
--    	StartTalkTask(varMap)
--			TalkAppendString(varMap, varMsg);
--		StopTalkTask(varMap)
--		DeliverTalkTips(varMap,varPlayer)
--		Msg2Player(varMap,varPlayer,varMsg,8,2)
--		return 0
--    end
--	if GetSceneType(varMap) == 2 then
--		local varMsg = "战场内，不能传送"
--    	StartTalkTask(varMap)
--		TalkAppendString(varMap, varMsg);
--		StopTalkTask(varMap)
--		DeliverTalkTips(varMap,varPlayer)
--		Msg2Player(varMap,varPlayer,varMsg,8,2)
--		return -1
--	end
--	
--	if GetSceneType(varMap) == 1 then
--		local varMsg = "副本内，不能传送"
--    	StartTalkTask(varMap)
--		TalkAppendString(varMap, varMsg);
--		StopTalkTask(varMap)
--		DeliverTalkTips(varMap,varPlayer)
--		Msg2Player(varMap,varPlayer,varMsg,8,2)
--		return -1
--	end
--	
--	local varCount = GetItemCountInBag( varMap, varPlayer, 13080024)
--    if varCount > 0 then
--        if DelItem( varMap, varPlayer, 13080024, varCount) ~= 1 then return 0 end
--    end
--	
--	local selfType = GetObjType(varMap, varPlayer)
--	
--	if selfType == 1 then 
--		
--		if IsHaveQuestNM( varMap, varPlayer, 7537) ~= 0 or  IsHaveQuestNM( varMap, varPlayer, 7538) ~= 0 or IsHaveQuestNM( varMap, varPlayer, 7539) ~= 0 then
--			Msg2Player(varMap,varPlayer,"很抱歉，未完成铁人三项任务时无法通往其他场景！",8,2)
--			return
--		end
--		
--		
--	end
--	
--	if varMap == 14 then
--        	SetPlayerMutexState( varMap, varPlayer, PLAYER_STATE_DANCERY, 0)
--            
--            if IsHaveSpecificImpact( varMap, varPlayer, 7651) == 1 then
--                CancelSpecificImpact( varMap, varPlayer, 7651)
--            elseif IsHaveSpecificImpact( varMap, varPlayer, 7652) == 1 then
--                CancelSpecificImpact( varMap, varPlayer, 7652)
--            elseif IsHaveSpecificImpact( varMap, varPlayer, 7653) == 1 then
--                CancelSpecificImpact( varMap, varPlayer, 7653)
--            elseif IsHaveSpecificImpact( varMap, varPlayer, 7654) == 1 then
--                CancelSpecificImpact( varMap, varPlayer, 7654)
--            elseif IsHaveSpecificImpact( varMap, varPlayer, 7655) == 1 then
--                CancelSpecificImpact( varMap, varPlayer, 7655)
--            elseif IsHaveSpecificImpact( varMap, varPlayer, 7656) == 1 then
--                CancelSpecificImpact( varMap, varPlayer, 7656)
--            end
--	end
	
--	if(1~=VerifyUsedItem(varMap, varPlayer)) then
--		return 0
--	end
			if DelItem( varMap, varPlayer, 12030007, 1) ~= 1 then 
				return 0
			end
			Msg2Player(varMap,varPlayer,"该物品已失效",8,2)
			Msg2Player(varMap,varPlayer,"该物品已失效",8,3)
	--return 1; 
end

function x300930_GuildLairdSceneIdTrans(varMap, varPlayer, nLairdMapId)
--	if nLairdMapId == 6 then
--		TimerCommand( varMap, varPlayer, 1, 7010, 3, -1, -1, -1 )
--		if varMap == nLairdMapId then
--			SetPos(varMap,varPlayer,65,94)
--		else
--			NewWorld(varMap,varPlayer,6,65,94, 300930)
--		end
--	elseif nLairdMapId == 9 then
--		TimerCommand( varMap, varPlayer, 1, 7010, 3, -1, -1, -1 )
--		if varMap == nLairdMapId then
--			SetPos(varMap,varPlayer,163,56)
--		else
--			NewWorld(varMap,varPlayer,9,163,56, 300930)
--		end
--	elseif nLairdMapId == 13 then
--		TimerCommand( varMap, varPlayer, 1, 7010, 3, -1, -1, -1 )
--		if varMap == nLairdMapId then
--			SetPos(varMap,varPlayer,75,193)
--		else
--			NewWorld(varMap,varPlayer,13,75,193, 300930)
--		end
--	elseif nLairdMapId == 18 then
--		TimerCommand( varMap, varPlayer, 1, 7010, 3, -1, -1, -1 )
--		if varMap == nLairdMapId then
--			SetPos(varMap,varPlayer,196,57)
--		else
--			NewWorld(varMap,varPlayer,18,196,57, 300930)
--		end
--	elseif nLairdMapId == 21 then
--		TimerCommand( varMap, varPlayer, 1, 7010, 3, -1, -1, -1 )
--		if varMap == nLairdMapId then
--			SetPos(varMap,varPlayer,222,130)
--		else
--			NewWorld(varMap,varPlayer,21,222,130, 300930)
--		end
--	elseif nLairdMapId == 24 then
--		TimerCommand( varMap, varPlayer, 1, 7010, 3, -1, -1, -1 )
--		if varMap == nLairdMapId then
--			SetPos(varMap,varPlayer,118,101)
--		else
--			NewWorld(varMap,varPlayer,24,118,101, 300930)
--		end
--	elseif nLairdMapId == 27 then
--		TimerCommand( varMap, varPlayer, 1, 7010, 3, -1, -1, -1 )
--		if varMap == nLairdMapId then
--			SetPos(varMap,varPlayer,204,202)
--		else
--			NewWorld(varMap,varPlayer,27,204,202, 300930)
--		end
--	elseif nLairdMapId == 31 then
--		TimerCommand( varMap, varPlayer, 1, 7010, 3, -1, -1, -1 )
--		if varMap == nLairdMapId then
--			SetPos(varMap,varPlayer,204,202)
--		else
--			NewWorld(varMap,varPlayer,31,204,202, 300930)
--		end
--	elseif nLairdMapId == 34 then
--		TimerCommand( varMap, varPlayer, 1, 7010, 3, -1, -1, -1 )
--		if varMap == nLairdMapId then
--			SetPos(varMap,varPlayer,204,202)
--		else
--			NewWorld(varMap,varPlayer,34,204,202, 300930)
--		end
--	end
--	
--	if varImpact ~= -1 then
--		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, 7720, 0);
--	end
end






function x300930_ProcDeplete( varMap, varPlayer )

--	
--	local nGuildID = GetGuildID(varMap,varPlayer)
--	if nGuildID < 0 then
--		return 0
--	end
--
--	
--	local nLairdMap0,nLairdMap1,nLairdMap2 = GetGuildLairdSceneId(nGuildID)
--	if nLairdMap0 <= 0 then
--		Msg2Player(varMap,varPlayer,"无法使用，您没有领地",8,3)
--		Msg2Player(varMap,varPlayer,"目前您的帮会尚未占领任何领地",8,2)
--		return 0
--	end
--	
--	
--	x300930_GuildLairdSceneIdTrans(varMap, varPlayer, nLairdMap0)
--	
--	DepletingUsedItem(varMap, varPlayer)
--	return 1;
end

function x300930_ProcAddMoney(varMap, varPlayer)
end

function x300930_ProcAddItemByLevel(varMap, varPlayer)	
end

function x300930_ProcAddItem(varMap, varPlayer, varItem)
end








function x300930_ProcActivateOnce( varMap, varPlayer, varImpact )	
end







function x300930_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
