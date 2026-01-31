x310151_var_FileId                      = 310151
x310151_var_QuestId						= 7559
x310151_var_TickBuf						= 8727
x310151_var_BufID 						= {8719,8720,8721,8722,8723,8724,8725,8726,8727}

x310150_const_Camp_Attack = 0
x310150_const_Camp_Defend = 1
x310150_const_Camp_Defend_Ass = 2


function x310151_CheckValid( varMap, varPlayer  )
    
    
    local nWeek = GetWeek()
    if nWeek ~= 6 then
       return 0
    end
    if IsPlayerStateNormal(varMap,varPlayer ) ~= 1 then
		return 0
	end
    
    
    if LuaCallNoclosure(COUNTRY_BATTLE_LITE_SCRIPT,"IsNewFlow",varMap,varPlayer) == 1 then
    	
    	
    	if LuaCallNoclosure(COUNTRY_BATTLE_LITE_SCRIPT,"IsCanReciveBonus",varMap,varPlayer) ~= 1 then
    		return 0
    	end
    	
    	
    	return 1
    end
    
    
    local varToday = GetDayOfYear()
    local mdtoday = x310151_GetQuestDay( varMap,varPlayer)
    if varToday ~= mdtoday then
        return -1
    end
    
    local minTime = GetMinOfDay()
    
    
    local nFrom = 17*60 + 1
    local nTo   = 17*60 + 20

    if minTime < nFrom then
        return -2
    end
    
    if minTime > nTo then
        return -3
    end
    
    return 1
end





function x310151_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

		
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

    if x310151_CheckValid( varMap, varPlayer  ) <= 0 then
        return
    end
    
    TalkAppendButton(varMap,x310151_var_FileId,"【国战】奖励领取",3);
end




function x310151_ProcEventEntry( varMap ,varPlayer, varTalknpc,idScript,idExt )

		
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

    if x310151_CheckValid( varMap, varPlayer  ) <= 0 then
        return
    end
    
    
    SetPlayerRuntimeData(varMap,varPlayer,RD_COMMON_NPCID,varTalknpc)
    
    
    GetCountryQuestData(varMap,varPlayer,CD_INDEX_COUNTRYBATTLELITE_KILLCOUNT,x310151_var_FileId,-1,"ProcGiveBonus")
    
end





function x310151_CancelBufId( varMap,varPlayer )

		for varI,item in x310151_var_BufID do
		if IsHaveSpecificImpact(varMap,varPlayer,item) == 1 then
			CancelSpecificImpact(varMap,varPlayer,item)
		end
	end

end




function x310151_ProcGiveBonus( varMap,varPlayer ,nKillCout,varQuest )

    if x310151_CheckValid( varMap, varPlayer  ) <= 0 then
        return
    end
    
    if nKillCout < 0 then
        return
    end
    
    local varTalknpc = GetPlayerRuntimeData(varMap,varPlayer,RD_COMMON_NPCID)
    
    local nCampFlag = -1
    if IsHaveQuest(varMap,varPlayer, x310151_var_QuestId) > 0 then
    	
    	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x310151_var_QuestId )
    	nCampFlag = GetQuestParam( varMap,varPlayer,varQuestIdx,5) 

    	if DelQuest( varMap,varPlayer,x310151_var_QuestId) <=0 then
    		StartTalkTask(varMap)
			TalkAppendString(varMap, "任务删除失败！请重试！");
			StopTalkTask(varMap)
			DeliverTalkMenu(varMap,varPlayer,varTalknpc)
			return    		
    	else
    		StartTalkTask(varMap)
			TalkAppendString(varMap, "您完成了【国家】屠城战！");
			StopTalkTask(varMap)
			DeliverTalkMenu(varMap,varPlayer,varTalknpc)	
			x310151_CancelBufId( varMap,varPlayer )
    	end
    else
    	
    	return
    end

    
    GamePlayScriptLog( varMap, varPlayer, 1512)
    
    local varLevel = GetLevel( varMap,varPlayer)
    
    
    local nExpExt = 0
    local n1 = -1
    local n2 = -1
    local n3 = -1
    local nKillCountBak = nKillCout
    
    if nCampFlag ~= x310150_const_Camp_Attack  then

    	
    	
    	n1=5
    	n2=4
    	n3=1

    	while nKillCout >= 10000 do
    		nKillCout = nKillCout - 10000
    		n1 = n1 - 1
    	end

    	while nKillCout >= 1000 do
    		nKillCout = nKillCout - 1000
    		n2 = n2 - 1
    	end

    	while nKillCout >= 100 do
    		nKillCout = nKillCout - 100
    		n3 = n3 - 1
    	end

	else

		
		
		n1 = 0
    	n2 = 0
    	n3 = 0
    	
    	while nKillCout >= 10000 do
    		nKillCout = nKillCout - 10000
    		n1 = n1 + 1
    	end
    	
    	while nKillCout >= 1000 do
    		nKillCout = nKillCout - 1000
    		n2 = n2 + 1
    	end
    	
    	while nKillCout >= 100 do
    		nKillCout = nKillCout - 100
    		n3 = n3 + 1
    	end
	end
	
	
	if n1 > 0 then
    	nExpExt = nExpExt + varLevel * 12178 * n1
    end
    
    if n2 > 0 then
    	nExpExt = nExpExt + varLevel * 12178 * n2
    end
    
    if n3 > 0 then
    	nExpExt = nExpExt + varLevel * 12178 * n3
    end
        
    
    local varExp  = varLevel * 28800
    local rong = nKillCout * 60
	
    if nKillCout == 0 then
        
        varExp = varLevel * 28800
        rong = 30
        		
    end
    
    varExp = varExp + (nExpExt*2)
    
    
    if varExp > 0 then
        AddExp( varMap,varPlayer,varExp )
		StartTalkTask(varMap)
		TalkAppendString(varMap, "恭喜您获得#R经验"..varExp.."点#o的奖励");
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)	
		Msg2Player(varMap,varPlayer,format("恭喜您获得#R经验"..varExp.."点#o的奖励"),8,2)
    end
    
    
    
    if rong > 0 then
        AddHonor( varMap,varPlayer,rong )
		StartTalkTask(varMap)
		TalkAppendString(varMap, "恭喜您获得#R荣誉"..rong.."点#o的奖励");
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)	
		Msg2Player(varMap,varPlayer,format("恭喜您获得#R荣誉"..rong.."点#o的奖励"),8,2)
    end 

    

    
    local varName = GetName(varMap,varPlayer)
    if varName == nil then
        varName = "ErrorName"
    end
    
    local varCountry  = GetCurCountry( varMap,varPlayer)
    local strMsg = format("CBL:<Info>x310151_ProcGiveBonus varMap=%d, varName=%s,varLevel=%d,varCountry=%d,killcount=%d varExp=%d, rong=%d n1=%d,n2=%d,n3=%d,nKillCout=%d nCampFlag=%d ", 
    					  varMap, varName,varLevel,varCountry,nKillCout, varExp, rong,n1,n2,n3,nKillCountBak,nCampFlag )
    WriteLog( 1, strMsg )
end




function x310151_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end




function x310151_ProcAccept( varMap, varPlayer )
end




function x310151_ProcQuestAbandon( varMap, varPlayer, varQuest )
end




function x310151_ProcContinue( varMap, varPlayer, varTalknpc )
end




function x310151_CheckSubmit( varMap, varPlayer )
end




function x310151_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end




function x310151_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end




function x310151_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x310151_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end




function x310151_GetQuestDay( varMap,varPlayer)
	
	
	if IsHaveQuest(varMap,varPlayer, x310151_var_QuestId) <= 0 then
		return -100 
	end
	
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, 7559)
	if varQuestIdx < 0 then
		return -100
	end
	
	return GetQuestParam( varMap,varPlayer,varQuestIdx,4) -100		
end
