--皇城回城卷





x310273_var_FileId = 310273 








function x310273_ProcEventEntry( varMap, varPlayer, varBagIdx,varOpType )

end






function x310273_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x310273_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x310273_ProcConditionCheck( varMap, varPlayer, varBagIdx)
	
	if GetEmpireCountry() ~= GetCurCountry( varMap, varPlayer ) then
			
			local varMsg = "您的国家没有占领沙城，无法使用此物品！"
			StartTalkTask(varMap)
			TalkAppendString(varMap, varMsg);
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			Msg2Player(varMap,varPlayer,varMsg,8,2)
			return
	
	end
	
	
	local varLevel = GetLevel(varMap, varPlayer)
	if varLevel < 40 then
		local varMsg = "40级以上才能使用回城卷轴！"
		StartTalkTask(varMap)
		TalkAppendString(varMap, varMsg);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,varMsg,8,2)
		return
	end
	if IsBusMember(varMap, varPlayer) == 1 then
		local varMsg = "运镖、乘坐公车或者护送状态时不能使用此回城卷轴！"
		StartTalkTask(varMap)
		TalkAppendString(varMap, varMsg);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,varMsg,8,2)
		return 
	end
	
	if varMap == 12 then
		local varMsg = "监狱中不能使用此回城卷轴！"
		StartTalkTask(varMap)
		TalkAppendString(varMap, varMsg);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,varMsg,8,2)
		return 0
	end

	if IsHaveSpecificImpact( varMap, varPlayer, 7702 ) > 0 then
		StartTalkTask(varMap);
		TalkAppendString(varMap, "扛着旗子不能使用此回城卷轴！");
		StopTalkTask(varMap);
		DeliverTalkTips(varMap,varPlayer);
		Msg2Player(varMap,varPlayer,"扛着旗子不能使用此回城卷轴！",8,2)
		return 0
	end
	if IsHaveSpecificImpact( varMap, varPlayer, 7062 ) > 0 
		or IsHaveSpecificImpact( varMap, varPlayer, 7063 ) >0 
		or IsHaveSpecificImpact( varMap, varPlayer, 7064 ) >0
		or IsHaveSpecificImpact( varMap, varPlayer, 7065 ) >0 then
		StartTalkTask(varMap);
		TalkAppendString(varMap, "携带龙魂状态不能使用此回城卷轴");
		StopTalkTask(varMap);
		DeliverTalkTips(varMap,varPlayer);
		Msg2Player(varMap,varPlayer,"携带龙魂状态不能使用此回城卷轴",8,2)
		return 0
	end
	
	local IsHaveFlag = IsHaveSpecificImpact(varMap, varPlayer, 7536  )
    if IsHaveFlag ~= 0 then
    	local varMsg = "在暴龙大作战期间，不能传送"
    	StartTalkTask(varMap)
			TalkAppendString(varMap, varMsg);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,varMsg,8,2)
		return 0
    end
    
    IsHaveFlag = IsHaveSpecificImpact(varMap, varPlayer, 7537 )
    if IsHaveFlag ~= 0 then
    	local varMsg = "在暴龙大作战期间，不能传送"
    	StartTalkTask(varMap)
			TalkAppendString(varMap, varMsg);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,varMsg,8,2)
		return 0
    end
	
	local varCount = GetItemCountInBag( varMap, varPlayer, 13080024)
    if varCount > 0 then
        if DelItem( varMap, varPlayer, 13080024, varCount) ~= 1 then return 0 end
    end
	
	local selfType = GetObjType(varMap, varPlayer)
	
	if selfType == 1 then 
		
		if IsHaveQuestNM( varMap, varPlayer, 7537) ~= 0 or  IsHaveQuestNM( varMap, varPlayer, 7538) ~= 0 or IsHaveQuestNM( varMap, varPlayer, 7539) ~= 0 then
			Msg2Player(varMap,varPlayer,"很抱歉，未完成铁人三项任务时无法通往其他场景！",8,2)
			return
		end
		
		
	end
	
	if GetSceneType(varMap) == 2 then
		local varMsg = "战场内，不能传送"
    	StartTalkTask(varMap)
		TalkAppendString(varMap, varMsg);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,varMsg,8,2)
		return -1
	end
	
	if GetSceneType(varMap) == 1 then
		local varMsg = "副本内，不能传送"
    	StartTalkTask(varMap)
		TalkAppendString(varMap, varMsg);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,varMsg,8,2)
		return -1
	end
	
	if varMap == 14 then
        	SetPlayerMutexState( varMap, varPlayer, PLAYER_STATE_DANCERY, 0)
            
            if IsHaveSpecificImpact( varMap, varPlayer, 7651) == 1 then
                CancelSpecificImpact( varMap, varPlayer, 7651)
            elseif IsHaveSpecificImpact( varMap, varPlayer, 7652) == 1 then
                CancelSpecificImpact( varMap, varPlayer, 7652)
            elseif IsHaveSpecificImpact( varMap, varPlayer, 7653) == 1 then
                CancelSpecificImpact( varMap, varPlayer, 7653)
            elseif IsHaveSpecificImpact( varMap, varPlayer, 7654) == 1 then
                CancelSpecificImpact( varMap, varPlayer, 7654)
            elseif IsHaveSpecificImpact( varMap, varPlayer, 7655) == 1 then
                CancelSpecificImpact( varMap, varPlayer, 7655)
            elseif IsHaveSpecificImpact( varMap, varPlayer, 7656) == 1 then
                CancelSpecificImpact( varMap, varPlayer, 7656)
            end
	end
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end


function x310273_ProcAddItem(varMap, varPlayer, varItem)
end






function x310273_ProcDeplete( varMap, varPlayer,varBagIdx )
	local varCountry = GetCurCountry( varMap, varPlayer)
	if  varCountry == 0 then 
		if varMap == 472 then
			SetPos(varMap,varPlayer,251,120)
		else
			NewWorld(varMap,varPlayer,472,251,120, 310273)
		end
    elseif  varCountry == 1 then 
		if varMap == 472 then
			SetPos(varMap,varPlayer,251,120)
		else
			NewWorld(varMap,varPlayer,472,251,120, 310273)
		end
	elseif  varCountry == 2 then 
		if varMap == 472 then
			SetPos(varMap,varPlayer,251,120)
		else
			NewWorld(varMap,varPlayer,472,251,120, 310273)
		end
	elseif  varCountry == 3 then 
		if varMap == 472 then
			SetPos(varMap,varPlayer,251,120)
		else
			NewWorld(varMap,varPlayer,472,251,120, 310273)
		end
	end
	if varImpact ~= -1 then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, 7719, 0);
	end
	DepletingUsedItem(varMap, varPlayer)
 return 1
end

function x310273_ProcAddMoney(varMap, varPlayer)
end

function x310273_ProcAddItemByLevel(varMap, varPlayer)	
end








function x310273_ProcActivateOnce( varMap, varPlayer, varImpact )	
end







function x310273_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
