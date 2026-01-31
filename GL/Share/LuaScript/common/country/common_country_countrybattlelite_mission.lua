

x310155_var_FileId = 310155
x310155_var_BonusScriptId = 310151
x310155_var_QuestId = 7559
x310155_var_LevelLess	= 	40 
x310155_var_QuestName="【国家】屠城战"
x310155_var_TickBuf	= 8727
x310155_var_BufID = {8719,8720,8721,8722,8723,8724,8725,8726,8727}





function x310155_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

		
    if GetMergeDBToggle() == 1 then
        return
    end
    
    
		local UpdateDBflag = GetUpdateDBBeforeToggle()
		if UpdateDBflag==1 then
			return
		end
    
    
    
    
    

    
    if GetBattleSceneToggle( BATTLESCENE_TYPE_COUNTRYBATTLELITE ) == 0 then
        return
    end
    
    
    
    if GetLevel(varMap,varPlayer) < x310155_var_LevelLess then
    	return
    end
    
    local varStr = "【国家】参加屠城战"
    
    
	if IsHaveQuest(varMap,varPlayer, x310155_var_QuestId) > 0 then
		
		
		local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x310155_var_QuestId)
		local nDay = GetQuestParam( varMap,varPlayer,varQuestIdx,4 ) - 100
		local nCurDayTime = GetDayOfYear()
		
		if nDay == nCurDayTime then
			varStr = "【国家】屠城战奖励领取"
		end 
	end    
    
    
    local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x310155_var_QuestId)
    TalkAppendButton( varMap, x310155_var_QuestId, varStr, varState );  
end




function x310155_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
end




function x310155_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,idExt)	
    
    
    if GetLevel(varMap,varPlayer) < x310155_var_LevelLess then
    	return
    end
    
    if IsHaveQuest(varMap,varPlayer, x310155_var_QuestId) > 0 then
		
		
		local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x310155_var_QuestId)
		local nDay = GetQuestParam( varMap,varPlayer,varQuestIdx,4 ) - 100
		local nCurDayTime = GetDayOfYear()
		
		if nDay == nCurDayTime then
			
			if LuaCallNoclosure(COUNTRY_BATTLE_LITE_SCRIPT,"IsNewFlow",varMap,varPlayer) ~= 1 then
				if LuaCallNoclosure( COUNTRY_BATTLE_LITE_SCRIPT, "GetCountryBattleLite_CountryCamp", varMap, varPlayer)  >= 0 then
					StartTalkTask(varMap)
					TalkAppendString(varMap,"#Y【国家】屠城战奖励领取#W#r\t只能在当天【屠城战】结束之后的17：00-17：20或者屠城战提前结束10分钟内领取奖励！")
					StopTalkTask(varMap)
					DeliverTalkMenu(varMap,varPlayer,varTalknpc)
					return
				end
			else
				
				if LuaCallNoclosure(COUNTRY_BATTLE_LITE_SCRIPT,"IsCanReciveBonus",varMap,varPlayer) ~= 1 then
					StartTalkTask(varMap)
					TalkAppendString(varMap,"#Y【国家】屠城战奖励领取#W#r\t由于您的国家提前结束【屠城战】，只能在结束之后的10分钟内领取奖励！")
					StopTalkTask(varMap)
					DeliverTalkMenu(varMap,varPlayer,varTalknpc)
					return
				end
				
			end
			
			local nCheckResult = LuaCallNoclosure(x310155_var_BonusScriptId,"CheckValid",varMap,varPlayer)
			if nCheckResult ~= 1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y【国家】屠城战奖励领取#W#r\t只能在当天【屠城战】结束之后的17：00-17：20领取奖励！")
				StopTalkTask(varMap)
				DeliverTalkMenu(varMap,varPlayer,varTalknpc)
				return	
			end
	
	    	
		    
	    	
	    	LuaCallNoclosure(x310155_var_BonusScriptId,"ProcEventEntry",varMap,varPlayer,varTalknpc,x310155_var_BonusScriptId,-1 )	    
		    
		    return
		else
			
				
		    if GetMergeDBToggle() == 1 then
		        return
		    end
		    
		    
				local UpdateDBflag = GetUpdateDBBeforeToggle()
				if UpdateDBflag==1 then
					return
				end
		    
		    
		    
		    
		    
		
		    
		    if GetBattleSceneToggle( BATTLESCENE_TYPE_COUNTRYBATTLELITE ) == 0 then
		        return
		    end
		    
		    
		    if LuaCallNoclosure(COUNTRY_BATTLE_LITE_SCRIPT,"GetCountryBattleLite_CountryCamp",varMap,varPlayer) < 0 then
		    	StartTalkTask(varMap)
				TalkAppendString(varMap,"您现在还不能参加【国家】屠城战！")
				StopTalkTask(varMap)
				DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		    	return
		    end
		    
		    
			if IsHaveQuest(varMap,varPlayer, x310155_var_QuestId) > 0 then
				
				
				local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x310155_var_QuestId)
				local nDay = GetQuestParam( varMap,varPlayer,varQuestIdx,4 ) - 100
				local nCurDayTime = GetDayOfYear()
				if nDay == nCurDayTime then 
					StartTalkTask(varMap)
					TalkAppendString(varMap,"你已经参加过【国家】屠城战了！")
					StopTalkTask(varMap)
					DeliverTalkMenu(varMap,varPlayer,varTalknpc)
					return
				end
			end
	    	
	    	
	    	StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y【国家】参加屠城战#W#r\t【国家】屠城战已经开启了，要参加吗？您只能在屠城战开启当天的#G16：00-16：20#W之间参加屠城战，参加屠城战后，如果您想要离开#G中兴府，四国的王城，边境#W，您必须先#R放弃屠城战任务#W，才可以进行传送。")
			StopTalkTask(varMap)
			DeliverTalkInfoNM(varMap,varPlayer,varTalknpc,x310155_var_FileId,x310155_var_QuestId)
			
		end 
	end    
	
	
	
		
    if GetMergeDBToggle() == 1 then
        return
    end
    
    
		local UpdateDBflag = GetUpdateDBBeforeToggle()
		if UpdateDBflag==1 then
			return
		end
    
    
    
    
    

    
    if GetBattleSceneToggle( BATTLESCENE_TYPE_COUNTRYBATTLELITE ) == 0 then
        return
    end
    
    
    if LuaCallNoclosure(COUNTRY_BATTLE_LITE_SCRIPT,"GetCountryBattleLite_CountryCamp",varMap,varPlayer) < 0 then
    	StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y【国家】参加屠城战#W#r\t您现在还不能参加【国家】屠城战！")
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
    	return
    end
    
    
	if IsHaveQuest(varMap,varPlayer, x310155_var_QuestId) > 0 then
		
		
		local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x310155_var_QuestId)
		local nDay = GetQuestParam( varMap,varPlayer,varQuestIdx,4 ) - 100
		local nCurDayTime = GetDayOfYear()
		if nDay == nCurDayTime then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y【国家】参加屠城战#W#r\t你已经参加过【国家】屠城战了！")
			StopTalkTask(varMap)
			DeliverTalkMenu(varMap,varPlayer,varTalknpc)
			return
		end
	end
	
	
	StartTalkTask(varMap)
	TalkAppendString(varMap,"#Y【国家】参加屠城战#W#r\t【国家】屠城战已经开启了，要参加吗？您只能在屠城战开启当天的#G16：00-16：20#W之间参加屠城战，参加屠城战后，如果您离开#G中兴府，四国的王城，边境#W，您必须先#R放弃屠城战任务#W，才可以进行传送。")
	StopTalkTask(varMap)
	DeliverTalkInfoNM(varMap,varPlayer,varTalknpc,x310155_var_FileId,x310155_var_QuestId)
end





function x310155_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	return 1
end




function x310155_CheckSubmit( varMap, varPlayer, varTalknpc)
	return 1
end




function x310155_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )

		
    if GetMergeDBToggle() == 1 then
        return
    end
    
    
		local UpdateDBflag = GetUpdateDBBeforeToggle()
		if UpdateDBflag==1 then
			return
		end
    
    
    
    
    
    
    
    
    if GetLevel(varMap,varPlayer) < x310155_var_LevelLess then
    	return
    end

    
    if GetBattleSceneToggle( BATTLESCENE_TYPE_COUNTRYBATTLELITE ) == 0 then
        return
    end

	
	local campFlag = LuaCallNoclosure(COUNTRY_BATTLE_LITE_SCRIPT,"GetCountryBattleLite_CountryCamp", varMap, varPlayer)
	local nMatchCou1,nMatchCou2,nMatchCou3,cnt = LuaCallNoclosure(COUNTRY_BATTLE_LITE_SCRIPT,"GetCountryBattleLite_MatchCountry", varMap, varPlayer)
	
	
	if campFlag < 0 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"【国家】屠城战没有开启！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	if x310155_IsQuestCanAccept( varMap,varPlayer ) == 0 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"今天您已经参加过【国家】屠城战了！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	local minTime = GetMinOfDay()
    
    
    local nFrom = 16*60 + 0
    local nTo   = 16*60 + 20

    if minTime < nFrom or minTime > nTo then
    	StartTalkTask(varMap)
		TalkAppendString(varMap,"参加【国家】屠城战时间已过！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
        return
    end
    
    
    if IsHideName(varMap,varPlayer) ~= 0 then
    	StartTalkTask(varMap)
		TalkAppendString(varMap,"蒙面状态不能参加【国家】屠城战！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
    	return
    end
	
	
	if IsHaveQuest(varMap,varPlayer, x310155_var_QuestId) == 0 then
		
		
		if IsQuestFullNM(varMap,varPlayer)==1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"您的任务已经满了，无法参加【国家】屠城战！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			return 
		end
		
		if varMap == 89 or varMap == 189 or varMap == 289 or varMap == 389 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"此场景不能接【国家】屠城战任务！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			return
		end
		
		if AddQuest(varMap,varPlayer,x310155_var_QuestId,x310155_var_FileId,0,0,0,1) ~= 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"参加【国家】屠城战失败，无法添加相关任务！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			return
		end
	end
	
	
	GamePlayScriptLog( varMap, varPlayer, 1511)
	
	local nCurDayTime = GetDayOfYear()
	
	
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x310155_var_QuestId )
	
	SetQuestParam( varMap,varPlayer,x310155_var_QuestId,3,0)					
	SetQuestParam( varMap,varPlayer,x310155_var_QuestId,4,nCurDayTime+100)		
	SetQuestParam( varMap,varPlayer,x310155_var_QuestId,5,campFlag)				
	--SetQuestParam( varMap,varPlayer,x310155_var_QuestId,6,nMatchCountry)		
	LuaCallNoclosure(COUNTRY_BATTLE_LITE_SCRIPT,"SetPlayerQuestParamMatchCountry", varMap, varPlayer, x310155_var_QuestId,nMatchCou1,nMatchCou2,nMatchCou3 )
	
	
	x310155_SetQuestAcceptDate(varMap,varPlayer)
	
	
	local varCountry = GetCurCountry(varMap,varPlayer)
	local nBufID = x310155_var_BufID[varCountry*2+1]
	if nBufID ~= -1 then
		if GetSex(varMap,varPlayer) == 0 then
			nBufID = nBufID + 1
		end
		SendSpecificImpactToUnit(varMap,varPlayer,varPlayer,varPlayer,nBufID,0)
		SendSpecificImpactToUnit(varMap,varPlayer,varPlayer,varPlayer,x310155_var_TickBuf,0)
	end
	
	
	x310155_ProcQuestLogRefresh	( varMap,varPlayer,x310155_var_QuestId)
	
	
	x310155_Msg2toplayer( varMap, varPlayer,0)
    
    local varName = GetName(varMap,varPlayer)
    if varName == nil then
        varName = "<ErrorName>"
    end

    local varCountry = GetCurCountry( varMap,varPlayer)
    local strMsg = format("CBL:<Info>CountryBattleLiteChangeScene varMap = %d,varName = %s varCountry = %d,nMatchCountry = %d,%d,%d campFlag = %d",varMap, varName,varCountry,nMatchCou1,nMatchCou2,nMatchCou3,campFlag )
    WriteLog( 1, strMsg ) 
	     
end




function x310155_CancelBufId( varMap,varPlayer )

	for varI,item in x310155_var_BufID do
		if IsHaveSpecificImpact(varMap,varPlayer,item) == 1 then
			CancelSpecificImpact(varMap,varPlayer,item)
		end
	end

end




function x310155_ProcQuestAbandon(varMap, varPlayer, varQuest)
	if IsHaveQuest(varMap,varPlayer, x310155_var_QuestId) <= 0 then
		return 
	end
	DelQuest(varMap, varPlayer, x310155_var_QuestId)
  	x310155_Msg2toplayer( varMap, varPlayer,1)
  	x310155_CancelBufId( varMap,varPlayer )
  	
  	GamePlayScriptLog( varMap, varPlayer, 1513)			
end




function x310155_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
end




function x310155_Msg2toplayer( varMap, varPlayer,type)
		
	if type == 0 then
		
		Msg2Player(varMap, varPlayer, "您参加了"..x310155_var_QuestName.."！", 0, 2)
	  	Msg2Player(varMap, varPlayer, "您参加了"..x310155_var_QuestName.."！", 0, 3)
	elseif type == 1 then
		
		Msg2Player(varMap, varPlayer, "您退出了"..x310155_var_QuestName.."！", 0, 2)
		Msg2Player(varMap, varPlayer, "您退出了"..x310155_var_QuestName.."！", 0, 3)
	elseif type == 2 then
		
	end
end




function x310155_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end




function x310155_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
end




function x310155_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
end




function x310155_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
end




function x310155_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
end




function x310155_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	



















end




function x310155_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
end




function x310155_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
end




function x310155_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
end




function x310155_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
end




function x310155_ProcGpProcOver( varMap, varPlayer, varTalknpc )
end




function x310155_OpenCheck( varMap, varPlayer, varTalknpc )
end




function x310155_ProcQuestLogRefresh( varMap,varPlayer,varQuest)

	if varMap ~= 3 and 
	   varMap ~= 50 and varMap ~= 150 and varMap ~= 250 and varMap ~= 350 and
	   varMap ~= 51 and varMap ~= 151 and varMap ~= 251 and varMap ~= 351 and
	   varMap ~= 68 and varMap ~= 168 and varMap ~= 268 and varMap ~= 368 and
	   varMap ~= 76 and varMap ~= 176 and varMap ~= 276 and varMap ~= 376 and 
	   varMap ~= 104 and varMap ~= 204 and varMap ~= 304 and varMap ~= 404 and
	   varMap ~= 105 and varMap ~= 205 and varMap ~= 305 and varMap ~= 405 and
	   varMap ~= 106 and varMap ~= 206 and varMap ~= 306 and varMap ~= 406 and
	   varMap ~= 107 and varMap ~= 207 and varMap ~= 307 and varMap ~= 407 and
	   varMap ~= 108 and varMap ~= 208 and varMap ~= 308 and varMap ~= 408 and
	   varMap ~= 109 and varMap ~= 209 and varMap ~= 309 and varMap ~= 409 and
	   varMap ~= 110 and varMap ~= 210 and varMap ~= 310 and varMap ~= 410 and
	   varMap ~= 111 and varMap ~= 211 and varMap ~= 311 and varMap ~= 411 and
	   varMap ~= 91 and varMap ~= 191 and varMap ~= 291 and varMap ~= 391 then 
	   return
	end

	local varHaveQuest = IsHaveQuestNM(varMap, varPlayer, x310155_var_QuestId );
	if varHaveQuest <= 0 then
		return
	end
		
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x310155_var_QuestId )
	local nFinished = GetQuestParam( varMap, varPlayer, varQuestIdx, 3 )
	local nDay = GetQuestParam( varMap, varPlayer, varQuestIdx, 4 ) - 100
	local nCampFlag = GetQuestParam( varMap, varPlayer, varQuestIdx, 5 )
	--local nMatchCountry = GetQuestParam( varMap, varPlayer, varQuestIdx, 6 )
	local nMatchCou1, nMatchCou2, nMatchCou3 = LuaCallNoclosure(COUNTRY_BATTLE_LITE_SCRIPT,"GetPlayerQuestParamMatchCountry", varMap, varPlayer, varQuestIdx )
	
	
		
	local nCurDayTime = GetDayOfYear()
	local varStr = ""
	local varCountryID = GetCurCountry( varMap, varPlayer)
	if varCountryID == 0 then
		varStr ="@npc_123724"
	elseif varCountryID == 1 then
		varStr ="@npc_126021"
	elseif varCountryID == 2 then
		varStr ="@npc_129021"
	elseif varCountryID == 3 then
		varStr ="@npc_132021"
	end
	if nCurDayTime ~= nDay then
		StartTalkTask(varMap)
	    AddQuestLogCustomText( varMap,
								"",							
								"",      					
								"#Y【国家】屠城战#W已经结束，很遗憾您错过了领奖时间，无法领取奖励。（领奖时间为屠城战活动当日17：00-17：20）",			
								varStr,							
								"", 	     				
								"#Y【国家】屠城战#W已经结束，很遗憾您错过了领奖时间，无法领取奖励。（领奖时间为屠城战活动当日17：00-17：20）",				
								""							
								)
		StopTalkTask(varMap)
		DeliverTalkRefreshQuest(varMap, varPlayer, x310155_var_QuestId)
		return		
	else
		
		
		if LuaCallNoclosure(COUNTRY_BATTLE_LITE_SCRIPT,"IsNewFlow",varMap,varPlayer) == 1 then
		
			
			
			if LuaCallNoclosure(COUNTRY_BATTLE_LITE_SCRIPT,"IsCanReciveBonus",varMap,varPlayer) ~= 1 then
				StartTalkTask(varMap)
				AddQuestLogCustomText( varMap,
										"",							
										"",      					
										"#Y【国家】屠城战#W已经提前结束，很遗憾您错过了领奖时间，无法领取奖励。（领奖时间为屠城战状态完成后的10分钟内或17：00-17：20之间）",			
										varStr,							
										"", 	     				
										"#Y【国家】屠城战#W已经提前结束，很遗憾您错过了领奖时间，无法领取奖励。（领奖时间为屠城战状态完成后的10分钟内或17：00-17：20之间）",				
										""							
										)
				StopTalkTask(varMap)
				DeliverTalkRefreshQuest(varMap, varPlayer, x310155_var_QuestId)
				return
			else
				
				StartTalkTask(varMap)
				AddQuestLogCustomText( varMap,
										"",							
										"",      					
										"#Y【国家】屠城战#W已经提前结束，请在10分钟内前往#R国家管理员#W处领取奖励。",			
										varStr,							
										"", 	     				
										"#Y【国家】屠城战#W已经提前结束，请在10分钟内前往#R国家管理员#W处领取奖励。",				
										""							
										)
				StopTalkTask(varMap)
				DeliverTalkRefreshQuest(varMap, varPlayer, x310155_var_QuestId)
				return 
			end
			
		else
			
			local nFrom = 17*60 + 1
			local nTo   = 17*60 + 20
			local minTime = GetMinOfDay()
		
			if minTime > nTo then
				StartTalkTask(varMap)
				AddQuestLogCustomText( varMap,
										"",							
										"",      					
										"#Y【国家】屠城战#W已经结束，很遗憾您错过了领奖时间，无法领取奖励。（领奖时间为屠城战活动当日17：00-17：20）",			
										varStr,							
										"", 	     				
										"#Y【国家】屠城战#W已经结束，很遗憾您错过了领奖时间，无法领取奖励。（领奖时间为屠城战活动当日17：00-17：20）",				
										""							
										)
				StopTalkTask(varMap)
				DeliverTalkRefreshQuest(varMap, varPlayer, x310155_var_QuestId)
				return		
			end
		end
	end
	
	
	
	if nFinished == 0 then
		
		if LuaCallNoclosure(COUNTRY_BATTLE_LITE_SCRIPT,"IsNewFlow",varMap,varPlayer) == 1 then
			
			
			if LuaCallNoclosure(COUNTRY_BATTLE_LITE_SCRIPT,"IsCanReciveBonus",varMap,varPlayer) ~= 1 then
				StartTalkTask(varMap)
				AddQuestLogCustomText( varMap,
										"",							
										"",      					
										"#Y【国家】屠城战#W已经结束，很遗憾您错过了领奖时间，无法领取奖励。（领奖时间为屠城战活动当日17：00-17：20）",			
										varStr,							
										"", 	     				
										"#Y【国家】屠城战#W已经结束，很遗憾您错过了领奖时间，无法领取奖励。（领奖时间为屠城战活动当日17：00-17：20）",				
										""							
										)
				StopTalkTask(varMap)
				DeliverTalkRefreshQuest(varMap, varPlayer, x310155_var_QuestId)
				return
			else
				
				StartTalkTask(varMap)
				AddQuestLogCustomText( varMap,
										"",							
										"",      					
										"#Y【国家】屠城战#W已经提前结束，请在10分钟内前往#R国家管理员#W处领取奖励。",			
										varStr,							
										"", 	     				
										"#Y【国家】屠城战#W已经提前结束，请在10分钟内前往#R国家管理员#W处领取奖励。",				
										""							
										)
				StopTalkTask(varMap)
				DeliverTalkRefreshQuest(varMap, varPlayer, x310155_var_QuestId)
				return 
			end
		end
		
		if LuaCallNoclosure(COUNTRY_BATTLE_LITE_SCRIPT,"GetCountryBattleLite_CountryCamp",varMap,varPlayer) ~= -1 then
	
			
			
			
			
			local nFinished = LuaCallNoclosure(COUNTRY_BATTLE_LITE_SCRIPT,"IsBattleFinished",varMap,varPlayer)
			if nFinished == 1 then
				nFinished = 0
			elseif nFinished == 0 then
				nFinished = 1
			end
			x310155_ProcQuestLogRefresh_Finished( varMap, varPlayer,nFinished,x310155_var_QuestId )
			
		else
			
			StartTalkTask(varMap)
			AddQuestLogCustomText( varMap,
									"",							
									"",      					
									"#Y【国家】屠城战#W已经结束，请在本日17：00-17：20间在#R国家管理员#W处领取奖励。",			
									varStr,							
									"", 	     				
									"#Y【国家】屠城战#W已经结束，请在本日17：00-17：20间在#R国家管理员#W处领取奖励。",				
									""							
									)
			StopTalkTask(varMap)
			DeliverTalkRefreshQuest(varMap, varPlayer, x310155_var_QuestId)
		end
				
	else
		
		
		StartTalkTask(varMap)
		AddQuestLogCustomText( varMap,
								"",							
								"",      					
								"#Y【国家】屠城战#W已经结束，请在本日16：00-17：20间在#R国家管理员#W处领取奖励。",			
								varStr,							
								"", 	     				
								"#Y【国家】屠城战#W已经结束，请在本日16：00-17：20间在#R国家管理员#W处领取奖励。",				
								""							
								)
		StopTalkTask(varMap)
		DeliverTalkRefreshQuest(varMap, varPlayer, x310155_var_QuestId)
		
	end
end




function x310155_ProcQuestLogRefresh_Finished( varMap, varPlayer,QuestData,varQuest )

	local varHaveQuest = IsHaveQuestNM(varMap, varPlayer, x310155_var_QuestId );
	if varHaveQuest <= 0 then
		return
	end

	local varStr = ""	
	local varCountryID = GetCurCountry( varMap, varPlayer)
	if varCountryID == 0 then
		varStr ="@npc_123724"
	elseif varCountryID == 1 then
		varStr ="@npc_126021"
	elseif varCountryID == 2 then
		varStr ="@npc_129021"
	elseif varCountryID == 3 then
		varStr ="@npc_132021"
	end
	
	if QuestData ~= 1 then		
		local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x310155_var_QuestId )
		SetQuestParam( varMap, varPlayer, varQuestIdx, 3, 1 )
		
		StartTalkTask(varMap)
	    AddQuestLogCustomText( varMap,
								"",							
								"",      					
								"\t【国家】屠城战已经结束，请在本日17：00-17：20间在本国#R国家管理员#W处领取奖励。",			
								varStr,							
								"", 	     				
								"【国家】屠城战已经结束，请在本日17：00-17：20间在本国#R国家管理员#W处领取奖励。",				
								""							
								)
		StopTalkTask(varMap)
		DeliverTalkRefreshQuest(varMap, varPlayer, x310155_var_QuestId)
		
	else
		
		local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x310155_var_QuestId )
		local nFinished = GetQuestParam( varMap, varPlayer, varQuestIdx, 3 )
		local nDay = GetQuestParam( varMap, varPlayer, varQuestIdx, 4 ) - 100
		local nCampFlag = GetQuestParam( varMap, varPlayer, varQuestIdx, 5 )
		--local nMatchCountry = GetQuestParam( varMap, varPlayer, varQuestIdx, 6 )
		local nMatchCou1, nMatchCou2, nMatchCou3 = LuaCallNoclosure(COUNTRY_BATTLE_LITE_SCRIPT,"GetPlayerQuestParamMatchCountry", varMap, varPlayer, varQuestIdx )
		local nMatchCouArray = { nMatchCou1, nMatchCou2, nMatchCou3 }
		local bIs1v1Mode = LuaCallNoclosure( COUNTRY_BATTLE_LITE_SCRIPT, "Is1v1Mode", varMap )
		
		local strMatchCountry = ""
		for idx, cou in nMatchCouArray do
		    
		    if cou >= 0 and cou < 4 then
		    
		        strMatchCountry = strMatchCountry..x310155_GetCountryName( cou )
		    
		    end
		
		end
		
		
		local strTarg,varDesc,strTips
		
		if nCampFlag == 1 then --防守方
			
			strTarg = format("\t您的国家今天处于#G防守方#W，您需要抵御#R%s王国#W的侵略者，保护本国的#G国家军力#W。",strMatchCountry)
			varDesc = "敌人可以通过边境拓道直接进入我国边境。他们还可以通过屠城战传送石到达我国王城来进行偷袭，必须提高警惕，防止敌人偷袭。国王在#R边境#W玉门关、拓道处和#R王城#W中心广场、瀚月关、南城关隘、圣山遗迹处，可以选择#Y【屠城战】国王召集令#W按钮来对本国#G40级#W以上国民进行召唤，该功能在屠城战期间总共可以使用使用3次。"
			strTips = "#G参加屠城战后，您只能在#R中兴府及四国的王城，迷宫和边境#G几个场景内活动，如果您前往#R其它场景#G您必须将任务放弃#G才可以进行传送 #G，并且不能再次参加屠城战活动。通过#R国王召集#G功能可以迅速集结人马，给入侵者迎头痛击。（尽可能的保卫本国王城内的国家军力，您会获得更多奖励）"
		
		elseif nCampFlag == 2 then  --1v3时的辅助防守方
		    
		    local nDefendCountry = LuaCallNoclosure( COUNTRY_BATTLE_LITE_SCRIPT, "GetDefendCountryForMatch1v3", varMap )
			local strDefendCountry = x310155_GetCountryName( nDefendCountry )
					    
		    strTarg = format("\t您的国家今天处于#G防守方#W，您需要帮助#R%s王国#W抵御来自#R%s王国#W的侵略，保护#R%s#W的#G国家军力#W。",strDefendCountry,strMatchCountry,strDefendCountry)
			varDesc = "敌人可以通过边境拓道直接进入防守国边境。他们还可以通过屠城战传送石到达防守国王城来进行偷袭，必须提高警惕，防止敌人偷袭。国王在#R边境#W玉门关、拓道处和#R王城#W中心广场、瀚月关、南城关隘、圣山遗迹处，可以选择#Y【屠城战】国王召集令#W按钮来对本国#G40级#W以上国民进行召唤，该功能在屠城战期间总共可以使用使用3次。"
			strTips = "#G参加屠城战后，您只能在#R中兴府及四国的王城，迷宫和边境#G几个场景内活动，如果您前往#R其它场景#G您必须将任务放弃#G才可以进行传送 #G，并且不能再次参加屠城战活动。通过#R国王召集#G功能可以迅速集结人马，给入侵者迎头痛击。（尽可能的保卫防守国王城内的国家军力，您会获得更多奖励）"
		    
		
		else 
			
			if bIs1v1Mode == 1 then
			    strTarg = format("\t您的国家今天处于进攻方，您需要进入#R%s王国#W摧毁他们的#G国家军力#W。",strMatchCountry)
			else --1v3
			    local nDefendCountry = LuaCallNoclosure( COUNTRY_BATTLE_LITE_SCRIPT, "GetDefendCountryForMatch1v3", varMap )
			    strMatchCountry = x310155_GetCountryName( nDefendCountry )
			    strTarg = format("\t您的国家今天处于进攻方，您需要进入#R%s王国#W摧毁他们的#G国家军力#W。",strMatchCountry)
			end
			varDesc = "您可以通过边境边境拓道直接进入敌国边境。您也可以通过本国迷宫一层#R屠城战传送石#W进入敌国王城2个不同地点。国王在#R屠城战传送石#W处，可以选择#Y【屠城战】国王召集令#W按钮来对本国#G40级#W以上国民进行召唤，该功能在屠城战期间总共可以使用使用3次。"
			strTips = "#G参加屠城战后，您只能在#R中兴府及四国的王城，迷宫和边境#G几个场景内活动，如果您前往#R其它场景#G您必须将任务放弃#G才可以进行传送 #G，并且不能再次参加屠城战活动。敌国王城内有很多守卫，尽量避开它们，避免无谓的伤亡。您可以从#R本国迷宫屠城战传送石#G进入敌国王城打击敌人。（尽可能的保卫本国王城内的国家军力，您会获得更多奖励）"		
			
		end	
		
		
		if strTarg == nil then
			return
		end
		StartTalkTask(varMap)
	    AddQuestLogCustomText( varMap,
								"",							
								"",      					
								strTarg,					
								varStr,						
								"",		      				
								varDesc,					
								strTips						
								)
		StopTalkTask(varMap)
		DeliverTalkRefreshQuest(varMap, varPlayer, x310155_var_QuestId);
		
	end
	
end




function x310155_IsQuestCanAccept( varMap, varPlayer )
	local nDate   = GetPlayerGameData(varMap,varPlayer,MD_COUNTRYBATTLELITE_DATE[1], MD_COUNTRYBATTLELITE_DATE[2], MD_COUNTRYBATTLELITE_DATE[3] )
	local nCurDay = GetDayOfYear()
	if nCurDay == nDate then
		return 0
	end

	return 1
end




function x310155_SetQuestAcceptDate( varMap, varPlayer )
	local nCurDay = GetDayOfYear()
	SetPlayerGameData(varMap,varPlayer, MD_COUNTRYBATTLELITE_DATE[1], MD_COUNTRYBATTLELITE_DATE[2], MD_COUNTRYBATTLELITE_DATE[3], nCurDay )
	SetPlayerGameData(varMap,varPlayer, MD_COUNTRYBATTLELITE_RONGYU[1], MD_COUNTRYBATTLELITE_RONGYU[2], MD_COUNTRYBATTLELITE_RONGYU[3], 0 )
end


function x310155_GetCountryName( countryId )
    
    if countryId == 0 then
        return "楼兰"
    elseif countryId == 1 then
        return "天山"
    elseif countryId == 2 then
        return "昆仑"
    elseif countryId == 3 then
        return "敦煌"
    end
    
end
