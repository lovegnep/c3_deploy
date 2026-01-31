x310159_var_FileId                      = 310159

x310159_var_Time					= { min = 1600,max = 1659 }	

x310159_const_Camp_Attack = 0
x310159_const_Camp_Defend = 1
x310159_const_Camp_Defend_Ass = 2


function x310159_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
    
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
	
    local hour,minute,sec =GetHourMinSec(); 
	local now = hour *100 + minute
	if now < x310159_var_Time.min or now > x310159_var_Time.max then
		return
	end
	
    
    local camp = LuaCallNoclosure( COUNTRY_BATTLE_LITE_SCRIPT, "GetCountryBattleLite_CountryCamp", varMap, varPlayer)
    if  camp < 0 then
        return
    end
    
    
    
    local varCountry = -1
    
    
	if camp == x310159_const_Camp_Attack then  --必须是攻方
	
	    --必须有匹配国家
	    local c1,c2,c3,cnt = LuaCallNoclosure( COUNTRY_BATTLE_LITE_SCRIPT, "GetCountryBattleLite_MatchCountry", varMap, varPlayer)
	    if cnt <= 0 then
	        return
	    end
	
		local varCountry = GetCurCountry(varMap, varPlayer)
    	local nTargetSceneId = varCountry*100 + 104
    	if nTargetSceneId ~= varMap then      --当前必须在自己国家地宫1层
    		return    	
    	end
    else
    	return
    end
  
    
    TalkAppendButton(varMap,x310159_var_FileId,"【屠城战】攻方国王召集令",3);
    
    
    local CountryID = GetCurCountry(varMap,varPlayer)
		
	local varName = GetName(varMap,varPlayer)
	if varName == nil then
		varName = "ErrorName"
	end
	
    local strMsg = format("CBL:<Info>x310159_ProcEnumEvent [kingissue] varMap = %d, varName=%s, nCountryId=%d", varMap, varName, CountryID  )
    WriteLog( 1, strMsg )
end

function x310159_ProcReturn(varMap, varPlayer,QuestData,varQuest)

		
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
    
    
    if LuaCallNoclosure( COUNTRY_BATTLE_LITE_SCRIPT, "GetCountryBattleLite_CountryCamp", varMap, varPlayer) < 0 then
        return
    end
    
     
    if IsKing(varMap, varPlayer) <= 0  then
    	StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【屠城战】国王召集令#W#r\t只有国王才能使用【屠城战】国王召集令!");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varPlayer)
		return
    end
    
    
    if QuestData == nil or QuestData > 3 or QuestData <= 0 then
    	
		
		local CountryID = GetCurCountry(varMap,varPlayer)
		
		local strName = GetName( varMap,varPlayer )
		if strName == nil then
			strName = " "
		end
		
		StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【屠城战】国王召集令#W#r\t很抱歉，【屠城战】国王召集令只能使用3次!");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varPlayer)
		
		LuaScenceM2Player( varMap,varPlayer,"很抱歉，【屠城战】国王召集令只能使用3次!",strName,3,1 )
		LuaScenceM2Player( varMap,varPlayer,"很抱歉，【屠城战】国王召集令只能使用3次!",strName,2,1 )
		
		local varName = GetName(varMap,varPlayer)
		if varName == nil then
			varName = "ErrorName"
		end
		
		local strMsg = format("CBL:<Error>x310159_ProcReturn [kingissue] varMap = %d, varName=%s, varCount=%d, nCountryId=%d", varMap, varName, QuestData, CountryID  )
        WriteLog( 1, strMsg )
        
    	return
    end
    
    local CountryID = GetCurCountry(varMap,varPlayer)
	CountryBattleLiteKingIssue(varMap, varPlayer)
	
	StartTalkTask(varMap)
	TalkAppendString(varMap, format("#Y【屠城战】国王召集令#W#r\t您使用了【屠城战】国王召集令，还剩%d次！",QuestData-1));
	StopTalkTask(varMap)
	DeliverTalkMenu(varMap,varPlayer,varPlayer)
	
	local varTalkNpcGUID = GetPlayerRuntimeData(varMap,varPlayer,RD_COUNTRYBATTLELITE_KINGISSUE_NPC)
    local nCountryId = GetCurCountry( varMap,varPlayer )
    SetCountryQuestData(varMap, nCountryId, CD_INDEX_COUNTRYBATTLELITE_KINGISUE_NPC,varTalkNpcGUID)
	
	
	local varMsg = "国王发布了【屠城战】召集令";
	local countryid = GetCurCountry(varMap,varPlayer)
	LuaAllScenceM2Country(varMap,varMsg,CountryID,5,1)
	
	local varName = GetName(varMap,varPlayer)
	if varName == nil then
		varName = "ErrorName"
	end
	
	local strMsg = format("CBL:<Info>x310159_ProcReturn [kingissue] varMap = %d, varName=%s, leftcount=%d, nCountryId=%d", varMap, varName, 2, CountryID  )
    WriteLog( 1, strMsg )	
	
end




function x310159_ProcEventEntry( varMap ,varPlayer, varTalknpc,idScript,idExt )

    
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
    
    if LuaCallNoclosure( COUNTRY_BATTLE_LITE_SCRIPT, "GetCountryBattleLite_CountryCamp", varMap, varPlayer) < 0 then
        return
    end
    
    
    if IsKing(varMap, varPlayer) <= 0  then
    	StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【屠城战】国王召集令#W#r\t只有国王才能使用【屠城战】国王召集令!");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varPlayer)
		
		return
    end
    
    
    local varTalkNpcGUID = GetMonsterGUID( varMap, varTalknpc)
    SetPlayerRuntimeData(varMap,varPlayer,RD_COUNTRYBATTLELITE_KINGISSUE_NPC,varTalkNpcGUID)
    
    local nCountryId = GetCurCountry( varMap,varPlayer )
    SetCountryQuestData(varMap, nCountryId, CD_INDEX_COUNTRYBATTLELITE_KINGISUE_NPC,varTalkNpcGUID)
    
    
    GetCountryQuestData(varMap,varPlayer,CD_INDEX_COUNTRYBATTLELITE_KINGISUSE, x310159_var_FileId,-1,"ProcReturn")
    
end


function x310159_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end




function x310159_ProcAccept( varMap, varPlayer )
end




function x310159_ProcQuestAbandon( varMap, varPlayer, varQuest )
end




function x310159_ProcContinue( varMap, varPlayer, varTalknpc )
end




function x310159_CheckSubmit( varMap, varPlayer )
end




function x310159_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end




function x310159_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end




function x310159_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x310159_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
