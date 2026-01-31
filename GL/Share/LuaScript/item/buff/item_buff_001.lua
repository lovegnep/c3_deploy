






function x417001_ProcEventEntry( varMap, varPlayer, bufIndex,varOpType )
	
	if IsBusMember(varMap, varPlayer) == 1 and varOpType == 0 then
		local varMsg = "运镖、乘坐公交车或者护送状态时不能使用回城卷轴！"
		StartTalkTask(varMap)
			TalkAppendString(varMap, varMsg);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,varMsg,8,2)
		return
	end
	
	if IsQuestHaveDone(varMap, varPlayer, 3202) <= 0 and (varMap == 87 or varMap == 187 or varMap == 287 or varMap == 387) then
		Msg2Player(varMap, varPlayer,"无法在圣山之巅进行传送",0,3)
		return
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

	if varOpType == 0 then
	
		
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
	    
		local selfcountry =GetCurCountry( varMap, varPlayer)
		local nLevel = GetLevel(varMap, varPlayer)

				if selfcountry ==0 then
					if nLevel < 10 then
						if varMap == 87 then
								SetPos(varMap,varPlayer,302,244)
						else
							TimerCommand( varMap, varPlayer, 1, 7010, 3, -1, -1, -1 )
							NewWorld(varMap,varPlayer,87,302,244, 417001)
						end
					elseif nLevel >=10 then
						if varMap ==50 then
							SetPos(varMap,varPlayer,255,112)
						else
							TimerCommand( varMap, varPlayer, 1, 7010, 3, -1, -1, -1 )
							NewWorld(varMap,varPlayer,50,255,112, 417001)
						end							
					end	
				
				elseif selfcountry ==1 then
					if nLevel < 10 then
						if varMap == 187 then

							SetPos(varMap,varPlayer,302,244)
						else
							TimerCommand( varMap, varPlayer, 1, 7010, 3, -1, -1, -1 )
							NewWorld(varMap,varPlayer,187,302,244, 417001)
						end
					elseif nLevel >=10 then
						if varMap ==150 then
							SetPos(varMap,varPlayer,255,112)
						else
							TimerCommand( varMap, varPlayer, 1, 7010, 3, -1, -1, -1 )
							NewWorld(varMap,varPlayer,150,255,112, 417001)
						end							
					end					

				elseif selfcountry ==2 then
					if nLevel < 10 then
						if varMap == 287 then
							SetPos(varMap,varPlayer,302,244)
						else
							TimerCommand( varMap, varPlayer, 1, 7010, 3, -1, -1, -1 )
							NewWorld(varMap,varPlayer,287,302,244, 417001)
						end
					elseif nLevel >=10 then
						if varMap ==250 then
							SetPos(varMap,varPlayer,255,112)
						else
							TimerCommand( varMap, varPlayer, 1, 7010, 3, -1, -1, -1 )
							NewWorld(varMap,varPlayer,250,255,112, 417001)
						end							
					end						

				elseif selfcountry ==3 then
					if nLevel < 10 then
						if varMap == 387 then
							SetPos(varMap,varPlayer,302,244)
						else
							TimerCommand( varMap, varPlayer, 1, 7010, 3, -1, -1, -1 )
							NewWorld(varMap,varPlayer,387,302,244, 417001)
						end
					elseif nLevel >=10 then
						if varMap ==350 then
							SetPos(varMap,varPlayer,255,112)
						else
							TimerCommand( varMap, varPlayer, 1, 7010, 3, -1, -1, -1 )
							NewWorld(varMap,varPlayer,350,255,112, 417001)
						end							
					end
		end
	end
end

