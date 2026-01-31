


x310111_var_FileId              			= 310111
x310111_var_Leader_Index          			= 5
x310111_var_QuestName           			="【国家】挑战青龙之主"
x310111_var_QuestName1          			="【国家】青龙战场查询"
x310111_var_NeedMoney             			= 50*1000
x310111_var_GuildLevel            			= 1
x310111_var_GuildMemberNum       				= 1


x310111_var_QingLong_Signup                  	= 200     
x310111_var_QingLong_WaitBattle              	= 201     
x310111_var_QingLong_BeginBattle             	= 202     
x310111_var_QingLong_EndBattle               	= 203     

x310111_var_Leader_Index                      =  5





function x310111_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )


	
    if GetMergeDBToggle() == 1 then
        return
    end
    
  
	local UpdateDBflag = GetUpdateDBBeforeToggle()
	if UpdateDBflag==1 then
		return
	end
    
    
    
    
    

    
    if GetBattleSceneToggle( BATTLESCENE_TYPE_ZHUQUEBATTLELITE ) == 0 then
        return
    end

    
    local nGuildId = GetGuildID(varMap,varPlayer )
    if nGuildId < 0 then
        return
    end
    
    
    local nHumanGUID = GetPlayerGUID( varMap,varPlayer )
    local nCountryId,nKingGUID,szKingName,nCountryGold = GetCountrySimpleData( varMap,varPlayer )
    if nKingGUID <= 0 or nHumanGUID == nKingGUID then
    	return    	
    end
    
    
    local nBattleStatus = LuaCallNoclosure(310110,"GetBattleState",varMap)
	if nBattleStatus == x310111_var_QingLong_Signup then
		TalkAppendButton(varMap,x310111_var_FileId,x310111_var_QuestName1,3,x310111_var_FileId);
	end

    
    local pos = GetGuildOfficial(varMap, varPlayer)
	if pos ~= x310111_var_Leader_Index then
        return
    end
    
    
    if IsSpecialCountryOffical(varMap,varPlayer,COUNTRY_POSITION_QINGLONG_LEADER) == 1 then
    	return
    end
    
    
    if IsSpecialCountryOffical(varMap,varPlayer,COUNTRY_POSITION_ZHUQUE_LEADER) == 1 then
    	return
    end
    
    
    if IsSpecialCountryOffical(varMap,varPlayer,COUNTRY_POSITION_KING) == 1 then
    	return
    end
    
    
	
	
    	TalkAppendButton(varMap,x310111_var_FileId,x310111_var_QuestName,3);
    
    
end




function x310111_ProcEventEntry( varMap, varPlayer, varTalknpc,varScript,idExt )

    if idExt == 0 then
    
    	local nBattleStatus = LuaCallNoclosure(310110,"GetBattleState",varMap)
    	if nBattleStatus ~= x310111_var_QingLong_Signup then
    		
    		StartTalkTask(varMap)
			TalkAppendString(varMap, "#Y【国家】挑战青龙之主#W#r\t申请失败，很抱歉，请在每周日的20：25~20：40之间申请青龙战场。");
			StopTalkTask(varMap)
			DeliverTalkMenu(varMap,varPlayer,varTalknpc)
    		return
    	end

        
        local nGuildId = GetGuildID( varMap,varPlayer )
        GameBattleQuerySignupState( varMap,varPlayer,1 )
        SetPlayerRuntimeData(varMap,varPlayer,RD_COMMON_NPCID,varTalknpc)

    elseif idExt == 1 then

        
        local pos = GetGuildOfficial(varMap, varPlayer)
        if pos ~= x310111_var_Leader_Index then
            StartTalkTask(varMap)
            TalkAppendString(varMap, "#Y【国家】挑战青龙之主#W#r\t申请失败，很抱歉，您还不是帮主无法申请成为青龙之主。");
            StopTalkTask(varMap)
            DeliverTalkMenu(varMap,varPlayer,varTalknpc)
            return
        end

        local nGuildId = GetGuildID(varMap,varPlayer )
        local nLevel,nMemberNum,nExp = GetGuildSimpleData( nGuildId )

        
        if nLevel < x310111_var_GuildLevel then
            StartTalkTask(varMap)
            TalkAppendString(varMap, "#Y【国家】挑战青龙之主#W#r\t申请失败，帮会等级不足２级！");
            StopTalkTask(varMap)
            DeliverTalkMenu(varMap,varPlayer,varTalknpc)
            return
        end

        
        if nMemberNum < x310111_var_GuildMemberNum then
            StartTalkTask(varMap)
            TalkAppendString(varMap, "#Y【国家】挑战青龙之主#W#r\t申请失败，帮会成员不足30人！");
            StopTalkTask(varMap)
            DeliverTalkMenu(varMap,varPlayer,varTalknpc)
            return
        end
        
        
        
	    if IsSpecialCountryOffical(varMap,varPlayer,COUNTRY_POSITION_QINGLONG_LEADER) == 1 then
	    	return
	    end
	    
	    
	    if IsSpecialCountryOffical(varMap,varPlayer,COUNTRY_POSITION_ZHUQUE_LEADER) == 1 then
	    	return
	    end
	    
	    
	    if IsSpecialCountryOffical(varMap,varPlayer,COUNTRY_POSITION_KING) == 1 then
	    	return
	    end
        
        
	    local nLairdM1,_,_,nLairdDate = GetGuildLairdSceneId(nGuildId) 
	    if nLairdM1 > 0 then
	    	StartTalkTask(varMap)
            TalkAppendString(varMap, "#Y【国家】挑战青龙之主#W#r\t申请失败，必须放弃领地才能申请！");
            StopTalkTask(varMap)
            DeliverTalkMenu(varMap,varPlayer,varTalknpc)
	    	return 
	    end

        
        GameBattleExecuteSignup( varMap,varPlayer, 1 )
        SetPlayerRuntimeData(varMap,varPlayer,RD_COMMON_NPCID,varTalknpc)

    elseif idExt == x310111_var_FileId then    	
    	
    	
    	GameBattleQueryMatchState(varMap,varPlayer,1)
    	SetPlayerRuntimeData(varMap,varPlayer,RD_COMMON_NPCID,varTalknpc)
    	
    end

    return 1

end




function x310111_ProcQueryQingLongBattleSignupState( varMap,varPlayer,nResult,nGuildA,nGuildB )
    
    local varTalknpc = GetPlayerRuntimeData(varMap,varPlayer,RD_COMMON_NPCID)
    if nResult == 0 then
    	
    	
    elseif nResult == 200 then
    	
    	
    	StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】挑战青龙之主#W#r\t申请失败，很抱歉，请在每周日的20：25~20：40之间申请青龙战场。");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		
    elseif nResult == 201 then
    
    	
        x310111_QingLongBattleSignup( varMap,varPlayer,varTalknpc,nGuildA,nGuildB )
        
    elseif nResult == 202 then
    	
    	
    	StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】挑战青龙之主#W#r\t很抱歉，已经受理了您挑战青龙之主的请求，无法再次挑战青龙之主。");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		
    elseif nResult == 203 then
    	
    	
    	StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】挑战青龙之主#W#r\t申请失败，必须有帮会才能申请挑战！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
    	
    elseif nResult == 204 then
    
    	
    	StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】挑战青龙之主#W#r\t申请失败，帮会等级不足2级！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
    	
    elseif nResult == 205 then
    
    	
    	StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】挑战青龙之主#W#r\t申请失败，必须是帮主才可以申请！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
    	
    elseif nResult == 206 then
    	
    	
    	StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】挑战青龙之主#W#r\t申请失败，帮会成员不足30人！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
    	
    elseif nResult == 207 then
    
    	
    	StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】挑战青龙之主#W#r\t申请失败，不能是朱雀帮！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
    	
    elseif nResult == 208 then
    
    	
    	StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】挑战青龙之主#W#r\t申请失败，不能是国王帮！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
    	
    elseif nResult == 209 then
    	
    	
    	StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】挑战青龙之主#W#r\t申请失败，帮会实力必须大于已经审请的帮会实力！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		
	elseif nResult == 210 then
    	
    	
    	StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】挑战青龙之主#W#r\t申请失败，报名已经结束");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		
	elseif nResult == 211 then
		
		
    	StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】挑战青龙之主#W#r\t申请失败，报过朱雀守护了");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		
    else
    
    	
    	StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】挑战青龙之主#W#r\t申请失败，未知原因，可能青龙战场申请数已达上线！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
    end

    return 1

end




function x310111_QingLongBattleSignup( varMap,varPlayer,varTalknpc ,nGuildA, nGuildB)

	
	SetPlayerRuntimeData(varMap,varPlayer,RD_COMMON_NPCID,varTalknpc)
    
    
    local pos = GetGuildOfficial(varMap, varPlayer)
	if pos ~= x310111_var_Leader_Index then
        StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】挑战青龙之主#W#r\t很抱歉，您还不是帮主无法申请挑战青龙之主。");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		return 0
	end

    local nGuildId = GetGuildID(varMap,varPlayer )
    local nLevel,nMemberNum,nExp = GetGuildSimpleData( nGuildId )

    
    if nLevel < x310111_var_GuildLevel then
        StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】挑战青龙之主#W#r\t申请失败，帮会等级不足2级！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		return 0
    end

    
    if nMemberNum < x310111_var_GuildMemberNum then
        StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】挑战青龙之主#W#r\t申请失败，帮会成员不足30人！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		return 0
    end
    
    
    if IsSpecialCountryOffical(varMap,varPlayer,COUNTRY_POSITION_QINGLONG_LEADER) == 1 then
    	return
    end
    
    
    if IsSpecialCountryOffical(varMap,varPlayer,COUNTRY_POSITION_ZHUQUE_LEADER) == 1 then
    	return
    end
    
    
    if IsSpecialCountryOffical(varMap,varPlayer,COUNTRY_POSITION_KING) == 1 then
    	return
    end
    
    
    local nLairdM1,_,_,nLairdDate = GetGuildLairdSceneId(nGuildId) 
    if nLairdM1 > 0 then
    	StartTalkTask(varMap)
        TalkAppendString(varMap, "#Y【国家】挑战青龙之主#W#r\t申请失败，必须放弃领地才能申请！");
        StopTalkTask(varMap)
        DeliverTalkMenu(varMap,varPlayer,varTalknpc)
    	return 
    end

    
    local nBattleStatus = LuaCallNoclosure(310110,"GetBattleState",varMap)
	if nBattleStatus ~= x310111_var_QingLong_Signup then
 		StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】挑战青龙之主#W#r\t申请失败，很抱歉，请在每周日的20：25~20：40之间申请青龙战场。");
		StopTalkTask(varMap)
        DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		return 0
	end
	
	
	local varMsg = ""
	local nCountryGuildId = CountryGetOfficerGUID(GetCurCountry(varMap,varPlayer),0)
	if nCountryGuildId <= 0 then

		
		
		if nGuildA >= 0 and nGuildB >= 0 then
			
			
			local strGuildA = GetGuildName( nGuildA )
			local strGuildB = GetGuildName( nGuildB )
			varMsg = format("#Y【国家】挑战青龙之主#W\n \n#G当前没有青龙守护帮会\n#G申请帮会：#R%s\n#G申请帮会：#R%s\n \n您确定要发起挑战吗？",strGuildA,strGuildB)
			
		elseif nGuildA >= 0 and nGuildB < 0 then
			
			local strGuildA = GetGuildName( nGuildA )
			varMsg = format("#Y【国家】挑战青龙之主#W\n \n#G当前没有青龙守护帮会\n#G申请帮会：#R%s\n#G申请帮会：#W待申请\n \n您确定要发起挑战吗？",strGuildA)
		else
			
			varMsg = "#Y【国家】挑战青龙之主#W\n \n#G当前没有青龙守护帮会\n#G申请帮会：#W待申请\n#G申请帮会：#W待申请\n \n您确定要发起挑战吗？"
		end
		
	else
		
		if nGuildB >= 0 then
			
			
			local strGuildA = GetGuildName( nGuildA )
			local strGuildB = GetGuildName( nGuildB )
			varMsg = format("#Y【国家】挑战青龙之主#W\n \n#G青龙守护帮会:#R%s\n#G申请帮会:#R%s\n \n您确定要发起挑战吗？",strGuildA,strGuildB)
			
		else
			
			local strGuildA = GetGuildName( nGuildA )
			varMsg = format("#Y【国家】挑战青龙之主#W\n \n#G青龙守护帮会:#R%s\n#G申请帮会：#W待申请\n \n您确定要发起挑战吗？",strGuildA)
		end
	end

    StartTalkTask(varMap)
    TalkAppendString(varMap, varMsg);
    TalkAppendButton(varMap,x310111_var_FileId,"确定..",3,1);
    StopTalkTask(varMap)
    DeliverTalkMenu(varMap,varPlayer,varTalknpc)

    return 1
end

function x310111_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end




function x310111_ProcAccept( varMap, varPlayer )
end





function x310111_ProcQingLongBattleSignupResult( varMap,varPlayer,nResult,nGuildA, nGuildB,nSignupCount)

	local varTalknpc = GetPlayerRuntimeData(varMap,varPlayer,RD_COMMON_NPCID)
	
	if nResult == 0 then

		local strMsg = ""
		local strMsg1= ""
		if nSignupCount > 0 then
        	strMsg = format("#Y【国家】挑战青龙之主#W#r\t恭喜本帮会完成报名青龙战场，目前为止已有%d个帮会报名参加。",nSignupCount)
			strMsg1= format("恭喜本帮会完成报名青龙战场，目前为止已有%d个帮会报名参加。",nSignupCount)
        else
        	strMsg = "#Y【国家】挑战青龙之主#W#r\t恭喜本帮会完成报名青龙战场，目前除了本帮会还没有其他帮会报名参加。"
			strMsg1= "恭喜本帮会完成报名青龙战场，目前除了本帮会还没有其他帮会报名参加。"
        end
	
    	local nGuildId = GetGuildID(varMap,varPlayer )        
       
        LuaAllScenceM2Guild(varMap,strMsg1,nGuildId,3,1)
        LuaAllScenceM2Guild(varMap,strMsg1,nGuildId,2,1)

        StartTalkTask(varMap)
		TalkAppendString(varMap, strMsg);
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
    	
    elseif nResult == 200 then
    	
    	
    	StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】挑战青龙之主#W#r\t申请失败，很抱歉，请在每周日的20：25~20：40之间申请青龙战场。");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		
    elseif nResult == 201 then
    
    	
        x310111_QingLongBattleSignup( varMap,varPlayer,varTalknpc,nGuildA,nGuildB )
        
    elseif nResult == 202 then
    	
    	
    	StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】挑战青龙之主#W#r\t很抱歉，已经受理了您挑战青龙之主的请求，无法再次挑战青龙之主。");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		
    elseif nResult == 203 then
    	
    	
    	StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】挑战青龙之主#W#r\t申请失败，必须有帮会才能申请挑战青龙之主！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
    	
    elseif nResult == 204 then
    
    	
    	StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】挑战青龙之主#W#r\t申请失败，帮会等级不足2级！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
    	
    elseif nResult == 205 then
    
    	
    	StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】挑战青龙之主#W#r\t申请失败，必须是帮主才可以申请！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
    	
    elseif nResult == 206 then
    	
    	
    	StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】挑战青龙之主#W#r\t申请失败，帮会成员不足30人！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
    	
    elseif nResult == 207 then
    
    	
    	StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】挑战青龙之主#W#r\t申请失败，不能是青龙帮！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
    	
    elseif nResult == 208 then
    
    	
    	StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】挑战青龙之主#W#r\t申请失败，不能是国王帮！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
    	
    elseif nResult == 209 then
    	
    	
    	StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】挑战青龙之主#W#r\t申请失败，帮会实力必须大于已经申请的帮会实力！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		
	elseif nResult == 210 then
    	
    	
    	StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】挑战青龙之主#W#r\t申请失败，报名已经结束");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		
	elseif nResult == 211 then
		
		
    	StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】挑战青龙之主#W#r\t申请失败，报过朱雀守护了");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		
    elseif nResult == -1 then
    
    	
    	StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】挑战青龙之主#W#r\t申请失败，未知原因，可能青龙战场申请数已达上线！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
    end

    return 1

end





function x310111_ProcQueryCurrentGuild(varMap,varPlayer,nGuildA,nGuildB,varCount)
	
	local varTalknpc = GetPlayerRuntimeData(varMap,varPlayer,RD_COMMON_NPCID)
	
	
	local varMsg = ""
	local nCountryGuildId = CountryGetOfficerGUID(GetCurCountry(varMap,varPlayer),0)
	if nCountryGuildId <= 0 then
		
		
		if nGuildA >= 0 and nGuildB >= 0 then
			
			
			local strGuildA = GetGuildName( nGuildA )
			local strGuildB = GetGuildName( nGuildB )
			varMsg = format("#Y【国家】青龙战场查询#W\n \n#G当前没有青龙守护帮会\n#G申请帮会：#R%s\n#G申请帮会：#R%s",strGuildA,strGuildB)
			
		elseif nGuildA >= 0 and nGuildB < 0 then
			
			local strGuildA = GetGuildName( nGuildA )
			varMsg = format("#Y【国家】青龙战场查询#W\n \n#G当前没有青龙守护帮会\n#G申请帮会：#R%s\n#G申请帮会：#W待申请",strGuildA)
		else
			
			varMsg = "#Y【国家】青龙战场查询#W\n \n#G当前没有青龙守护帮会\n#G申请帮会：#W待申请\n#G申请帮会：#W待申请"
		end
		
	else
		
		if nGuildB >= 0 then
			
			
			local strGuildA = GetGuildName( nGuildA )
			local strGuildB = GetGuildName( nGuildB )
			varMsg = format("#Y【国家】青龙战场查询#W\n \n#G青龙守护帮会:#R%s\n#G申请帮会:#R%s",strGuildA,strGuildB)
			
		else
			local strGuildA = GetGuildName( nGuildA )
			
			varMsg = format("#Y【国家】青龙战场查询#W\n \n#G青龙守护帮会:#R%s\n#G申请帮会：#W待申请",strGuildA)
		end
	end

    StartTalkTask(varMap)
    TalkAppendString(varMap, varMsg);
    StopTalkTask(varMap)
    DeliverTalkMenu(varMap,varPlayer,varTalknpc)

    return 1
    	
end




function x310111_ProcSignupInstead(varMap,nCountryId,nGuildA,nGuildB)
	
	local strGuildB = GetGuildName(nGuildB)
	local varMsg = format("#R很抱歉，青龙战场的报名名额已被帮会实力更高的%s帮会顶替",strGuildB)  
	
	local varHumanCount = GetScenePlayerCount( varMap )
    local varI = 0
    for varI = 0,varHumanCount-1 do
        local varObj = GetScenePlayerObjId( varMap,varI)
        if varObj >= 0 and IsPlayerStateNormal(varMap,varObj) == 1 then
        
            local nGuildId = GetGuildID( varMap,varObj )
            if nGuildId == nGuildA then
            	
            	
            	LuaScenceM2Player(varMap,varObj,varMsg,GetName(varMap,varObj),3,1)          	
            	LuaScenceM2Player(varMap,varObj,varMsg,GetName(varMap,varObj),2,1)
            end
        end
    end
	
end





function x310111_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end




function x310111_ProcAccept( varMap, varPlayer )
end




function x310111_ProcQuestAbandon( varMap, varPlayer, varQuest )
end




function x310111_ProcContinue( varMap, varPlayer, varTalknpc )
end




function x310111_CheckSubmit( varMap, varPlayer )
end




function x310111_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end




function x310111_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end




function x310111_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x310111_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
