


x300919_var_FileId              			= 300919
x300919_var_Leader_Index          			= 5
x300919_var_QuestName           			="【国家】领地争夺战报名"
x300919_var_QuestName1          			="【国家】领地争夺战查询"
x300919_var_NeedMoney             			= 50*1000
x300919_var_GuildLevel            			= 1
x300919_var_GuildMemberNum       				= 1
x300919_var_Laird_Signup                  	= 300     
x300919_var_Laird_WaitBattle              	= 301     
x300919_var_Laird_BeginBattle             	= 302     
x300919_var_Laird_EndBattle               	= 303     
x300919_var_Leader_Index                      =  5





function x300919_GetLairdSceneCount(varMap)
	return LuaCallNoclosure(300918,"GetLairdSceneCount",varMap)
end

function x300919_GetLairdSceneInfo(varMap,varIndex)
	return LuaCallNoclosure(300918,"GetLairdSceneInfo",varMap,varIndex)
end

function x300919_GetLairdMapNameByID(varMap,MapSignuped)

	if MapSignuped == nil then
		return "其他"
	end
	
	local nLairdSceneCount = x300919_GetLairdSceneCount(varMap)
	for varI=1,nLairdSceneCount do
		local nRetNpcGUID,nRetLairdScene,strRetLairdSceneName,nRetLevel,nRetFlag0,nRetFlag1 = x300919_GetLairdSceneInfo(varMap,varI)
		if nRetLairdScene == MapSignuped then
			return strRetLairdSceneName
		end
	end
	
	return "其他"	
end
											   



function x300919_GetLastLevelFromLevelTopList(varMap, varPlayer)
	
	local nWorldID = GetWorldID(varMap,varPlayer)
	local nLevelTopListType = LEVEL_TOP_LIST_BK - 1
	local nLevelCount = GetToplistCount(nWorldID,nLevelTopListType)
	if nLevelCount <= 0 then
		return 0
	else
		local _,nLastLevel = GetToplistInfo(nWorldID,nLevelTopListType,nLevelCount-1) 
		return nLastLevel
	end
end




function x300919_CheckLairdSceneLevel(varMap, varPlayer, nLevel )

	local nLastLevel = x300919_GetLastLevelFromLevelTopList(varMap, varPlayer)
	if nLastLevel >= nLevel then
		return 1
	end
	
	return 0
	
end
											   



function x300919_IsNpcEntrance( varMap,nNpcGUID )

	local nLairdSceneCount = x300919_GetLairdSceneCount(varMap)
	for varI=1,nLairdSceneCount do
		local nRetNpcGUID,nRetLairdScene,strRetLairdSceneName,nRetLevel,nRetFlag0,nRetFlag1 = x300919_GetLairdSceneInfo(varMap,varI)
		if nRetNpcGUID == nNpcGUID then
			return 1
		end
	end
	
	
	return 0	
end





function x300919_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	
    if GetMergeDBToggle() == 1 then
        return
    end
    
  
	local UpdateDBflag = GetUpdateDBBeforeToggle()
	if UpdateDBflag==1 then
		return
	end
    
    
    
    
    

    
    if GetBattleSceneToggle( BATTLESCENE_TYPE_LAIRDGBATTLELITE ) == 0 then
        return
    end

    
    local nGuildId = GetGuildID(varMap,varPlayer )
    if nGuildId < 0 then
        return
    end
    
    
    
	
		
			TalkAppendButton(varMap,x300919_var_FileId,x300919_var_QuestName1,3,x300919_var_FileId);
		
	

    

    
    local nHumanGUID = GetPlayerGUID( varMap,varPlayer )
    local nCountryId,nKingGUID,szKingName,nCountryGold = GetCountrySimpleData( varMap,varPlayer )
    if nKingGUID <= 0 or nHumanGUID == nKingGUID then
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
    
    
	
	
		
    		TalkAppendButton(varMap,x300919_var_FileId,x300919_var_QuestName,3);
    	
   
    
end




function x300919_ProcEventEntry( varMap, varPlayer, varTalknpc,varScript,idExt )

	 local pos = GetGuildOfficial(varMap, varPlayer)
	if pos ~= x300919_var_Leader_Index then
		StartTalkTask(varMap)
		TalkAppendString(varMap, "申请失败，很抱歉，只有帮主才有权查询或申请。");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
        return
    end

	local nNpcGUID = GetMonsterGUID(varMap,varTalknpc)

    if idExt == 0 then
    
    
    	
    	local nBattleStatus = LuaCallNoclosure(300918,"GetBattleState",varMap)
    	if nBattleStatus ~= x300919_var_Laird_Signup then
    		
    		StartTalkTask(varMap)
			TalkAppendString(varMap, "申请失败，很抱歉，请在每周六的13：00~15：00之间申请领地争夺战。");
			StopTalkTask(varMap)
			DeliverTalkMenu(varMap,varPlayer,varTalknpc)
    		return
    	end
    	
    	
    	if x300919_IsNpcEntrance(varMap, nNpcGUID ) == 0 then
    		return
    	end
		
    	
    	local nLairdSceneCount = x300919_GetLairdSceneCount(varMap)
    	StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】领地争夺战报名#W#r \n#G您可以发起对以下领地的争夺:#W");
    	for varI=1,nLairdSceneCount do
			local nRetNpcGUID,nRetLairdScene,strRetLairdSceneName,nRetLevel,nRetFlag0,nRetFlag1 = x300919_GetLairdSceneInfo(varMap,varI)
			if nRetNpcGUID == nNpcGUID and x300919_CheckLairdSceneLevel( varMap, varPlayer,nRetLevel ) == 1 then	
				TalkAppendButton(varMap,x300919_var_FileId,"【领地】"..strRetLairdSceneName,3,nRetFlag0);
			end
		end
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)

    elseif idExt == x300919_var_FileId then
    
    
    	
    	if x300919_IsNpcEntrance( varMap,nNpcGUID ) == 0 then
    		return
    	end
    	
    	
    	local nLairdSceneCount = x300919_GetLairdSceneCount(varMap)
    	StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】领地争夺战查询#W#r#G请选择下列按钮查询相应领地报名情况:#W");
    	for varI=1,nLairdSceneCount do
			local nRetNpcGUID,nRetLairdScene,strRetLairdSceneName,nRetLevel,nRetFlag0,nRetFlag1 = x300919_GetLairdSceneInfo(varMap,varI)
			if nRetNpcGUID == nNpcGUID and x300919_CheckLairdSceneLevel(varMap, varPlayer, nRetLevel ) == 1 then	
				TalkAppendButton(varMap,x300919_var_FileId,"【领地】"..strRetLairdSceneName,3,nRetFlag1);
	
			end
		end
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
    	
    else
    	
    	
    	local nLairdSceneCount = x300919_GetLairdSceneCount(varMap)
    	for varI=1,nLairdSceneCount do
    	
			local nRetNpcGUID,nRetLairdScene,strRetLairdSceneName,nRetLevel,nRetFlag0,nRetFlag1 = x300919_GetLairdSceneInfo(varMap,varI)
    		
    		if nRetFlag0 == idExt then
    		
    			 
		        if x300919_CheckLairdSceneLevel(varMap, varPlayer, nRetLevel ) ~= 1 then
		        	
		        	StartTalkTask(varMap)
		            TalkAppendString(varMap, "#Y【国家】领地争夺战报名#W#r\t申请失败，领地争夺战目前没有开放！");
		            StopTalkTask(varMap)
		            DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		            return
		        	
		        end
    			
    			
		        GameBattleQuerySignupState( varMap,varPlayer,2,nRetLairdScene )
		        SetPlayerRuntimeData(varMap,varPlayer,RD_COMMON_NPCID,varTalknpc)   
		        
		        break	
    			
    		elseif nRetFlag1 == idExt then
    		
    			 
		        if x300919_CheckLairdSceneLevel(varMap, varPlayer, nRetLevel ) ~= 1 then
		        	
		        	StartTalkTask(varMap)
		            TalkAppendString(varMap, "#Y【国家】领地争夺战报名#W#r\t申请失败，领地争夺战目前没有开放！");
		            StopTalkTask(varMap)
		            DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		            return
		        	
		        end
    			
    			
    			GameBattleQueryMatchState(varMap,varPlayer,2,nRetLairdScene)
    			SetPlayerRuntimeData(varMap,varPlayer,RD_COMMON_NPCID,varTalknpc)
    			break
    			
    		elseif nRetLairdScene == idExt then
    			
    			
		        local pos = GetGuildOfficial(varMap, varPlayer)
		        if pos ~= x300919_var_Leader_Index then
		            StartTalkTask(varMap)
		            TalkAppendString(varMap, "#Y【国家】领地争夺战报名#W#r\t申请失败，很抱歉，您还不是帮主无法申请成为领地之主。");
		            StopTalkTask(varMap)
		            DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		            return
		        end
		
		        local nGuildId = GetGuildID(varMap,varPlayer )
		        local nLevel,nMemberNum,nExp = GetGuildSimpleData( nGuildId )
		
		        
		        if nLevel < x300919_var_GuildLevel then
		            StartTalkTask(varMap)
		            TalkAppendString(varMap, "#Y【国家】领地争夺战报名#W#r\t申请失败，帮会等级不足２级！");
		            StopTalkTask(varMap)
		            DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		            return
		        end
		
		        
		        if nMemberNum < x300919_var_GuildMemberNum then
		            StartTalkTask(varMap)
		            TalkAppendString(varMap, "#Y【国家】领地争夺战报名#W#r\t申请失败，帮会成员不足30人！");
		            StopTalkTask(varMap)
		            DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		            return
		        end
		        
		        
		        if x300919_CheckLairdSceneLevel(varMap, varPlayer, nRetLevel ) ~= 1 then
		        	
		        	StartTalkTask(varMap)
		            TalkAppendString(varMap, "#Y【国家】领地争夺战报名#W#r\t申请失败，领地争夺战目前没有开放！");
		            StopTalkTask(varMap)
		            DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		            return
		        	
		        end
		        
		        
		        local nLairdMap1,nLairdMap2,nLairdMap3,nLairdMap4 = GetGuildLairdSceneId(nGuildId)
		        if nLairdMap1 > 0 then
		        	
		        	StartTalkTask(varMap)
		            TalkAppendString(varMap, "#Y【国家】领地争夺战报名#W#r\t申请失败，已经是领主了，无法再次申请！");
		            StopTalkTask(varMap)
		            DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		            return
		        	
		        end
		
		        
		        GameBattleExecuteSignup( varMap,varPlayer, 2, idExt )
		        SetPlayerRuntimeData(varMap,varPlayer,RD_COMMON_NPCID,varTalknpc)
		        break
    		end
    	end
    	
    end

    return 1

end




function x300919_ProcQueryLairdBattleSignupState( varMap,varPlayer,nResult,nLairdMapId,nGuildA,nGuildB,nHasLaird,nMapSignuped )
    
    local varTalknpc = GetPlayerRuntimeData(varMap,varPlayer,RD_COMMON_NPCID)
    if nResult == 0 then
    	
    	
    elseif nResult == 300 then
    	
    	
    	StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】领地争夺战报名#W#r\t申请失败，很抱歉，请在每周六的13：00~15：00之间申请领地争夺战。");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		
    elseif nResult == 301 then
    
    	
        x300919_LairdBattleSignup( varMap,varPlayer,varTalknpc,nLairdMapId,nGuildA,nGuildB,nHasLaird )
        
    elseif nResult == 302 then
    	
    	
    	StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】领地争夺战报名#W#r\t很抱歉，您已经完成申请了一块领地的争夺，目前正在受理中，无法再次申请对其它领地的争夺。");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		
    elseif nResult == 303 then
    	
    	
    	StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】领地争夺战报名#W#r\t申请失败，必须有帮会才能申请挑战！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
    	
    elseif nResult == 304 then
    
    	
    	StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】领地争夺战报名#W#r\t申请失败，帮会等级不足2级！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
    	
    elseif nResult == 305 then
    
    	
    	StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】领地争夺战报名#W#r\t申请失败，必须是帮主才可以申请！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
    	
    elseif nResult == 306 then
    	
    	
    	StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】领地争夺战报名#W#r\t申请失败，帮会成员不足30人！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
    	
    elseif nResult == 307 then
    
    	
    	StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】领地争夺战报名#W#r\t申请失败，朱雀不能申请占领领地！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
    	
    elseif nResult == 308 then
    
    	
    	StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】领地争夺战报名#W#r\t申请失败，青龙不能申请占领领地！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
    	
    elseif nResult == 309 then
    	
    	
    	StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】领地争夺战报名#W#r\t申请失败，国王不能申请占领领地！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		
	elseif nResult == 310 then
    	
    	
    	StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】领地争夺战报名#W#r\t申请失败，帮会实力不足！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
	
	elseif nResult == 311 then
		
		
    	StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】领地争夺战报名#W#r\t申请失败，报名已经结束！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		
	elseif nResult == 312 then
	
		
    	StartTalkTask(varMap)
		local strMapSignedup = x300919_GetLairdMapNameByID(varMap,nMapSignuped)
		TalkAppendString(varMap, format("#Y【国家】领地争夺战报名#W#r\t申请失败，已经报名了%s领地的争夺",strMapSignedup));
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		
	elseif nResult == 313 then
	
		
		local nGuidID = GetGuildID(varMap,varPlayer)
		if nGuidID < 0 then
			return
		end
		
		

		local nGuildLairdMapId = GetGuildLairdSceneId(nGuidID)
		
		local nLairdSceneCount = x300919_GetLairdSceneCount(varMap)
    	StartTalkTask(varMap)
    	for varI=1,nLairdSceneCount do
			local nRetNpcGUID,nRetLairdScene,strRetLairdSceneName,nRetLevel,nRetFlag0,nRetFlag1 = x300919_GetLairdSceneInfo(varMap,varI)
			if nGuildLairdMapId == nRetLairdScene then	
				
				StartTalkTask(varMap)
				TalkAppendString(varMap, format("#Y【国家】领地争夺战报名#W#r\t已是%s领主，无法报名参加领地争夺战",strRetLairdSceneName));
				StopTalkTask(varMap)
				DeliverTalkMenu(varMap,varPlayer,varTalknpc)
				break
			end
		end

	elseif nResult == 314 then
    	StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】领地争夺战报名#W#r\t申请失败，据点所在国和报名者所属国家是盟国！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
    else
    
    	
    	StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】领地争夺战报名#W#r\t申请失败，未知原因，可能领地争夺战申请数已达上限！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
    end

    return 1

end




function x300919_LairdBattleSignup( varMap,varPlayer,varTalknpc ,nLairdMapId,nGuildA, nGuildB,nHasLaird,nMapSignuped)

	
	SetPlayerRuntimeData(varMap,varPlayer,RD_COMMON_NPCID,varTalknpc)
    
    
    local pos = GetGuildOfficial(varMap, varPlayer)
	if pos ~= x300919_var_Leader_Index then
        StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】领地争夺战报名#W#r\t很抱歉，您还不是帮主无法申请挑战领地之主。");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		return 0
	end

    local nGuildId = GetGuildID(varMap,varPlayer )
    local nLevel,nMemberNum,nExp = GetGuildSimpleData( nGuildId )

    
    if nLevel < x300919_var_GuildLevel then
        StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】领地争夺战报名#W#r\t申请失败，帮会等级不足2级！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		return 0
    end

    
    if nMemberNum < x300919_var_GuildMemberNum then
        StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】领地争夺战报名#W#r\t申请失败，帮会成员不足30人！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		return 0
    end

    
    local nBattleStatus = LuaCallNoclosure(300918,"GetBattleState",varMap)
	if nBattleStatus ~= x300919_var_Laird_Signup then
 		StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】领地争夺战报名#W#r\t申请失败，很抱歉，请在每周六的13：00~15：00之间申请领地争夺战。");
		StopTalkTask(varMap)
        DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		return 0
	end
	
	
	local varMsg = ""
	local nCountryGuildId = CountryGetOfficerGUID(GetCurCountry(varMap,varPlayer),1)
	if nHasLaird ~= 1 then

		
		
		if nGuildA >= 0 and nGuildB >= 0 then
			
			
			local strGuildA = GetGuildName( nGuildA )
			local strGuildB = GetGuildName( nGuildB )
			varMsg = format("#Y【国家】领地争夺战报名#W#r#R\t已经有帮会对该领地发起了争夺申请，您确定对该帮会进行挑战吗？\n\t#G当前已发起对该领地的争夺申请并且实力最强帮会分别为:#r#c0000FF%s#r%s",strGuildA,strGuildB)
			
		elseif nGuildA >= 0 and nGuildB < 0 then
			
			local strGuildA = GetGuildName( nGuildA )
			varMsg = format("#Y【国家】领地争夺战报名#W#r#R\t已经有帮会对该领地发起了争夺申请，您确定对该帮会进行挑战吗？\n\t#G当前已发起对该领地的争夺并且实力最强帮会为:#r#c0000FF%s",strGuildA)
		else
			
			varMsg = "#Y【国家】领地争夺战报名#W#r\t#G当前没有其他帮会发起对该领地的争夺!"
		end
		
	else
		
		if nGuildB >= 0 then
			
			
			local strGuildA = GetGuildName( nGuildA )
			local strGuildB = GetGuildName( nGuildB )
			varMsg = format("#Y【国家】领地争夺战报名#W#r#R\t目前占据该领地的帮会是:%s，您确定对其进行挑战吗？\n\t#G当前已发起对该领地的争夺并且实力最强帮会为:#r#c0000FF%s",strGuildA,strGuildB)
			
		else
			
			varMsg = "#Y【国家】领地争夺战报名#W#r#R\t已经有帮会拥有对该领地的占领，您确定要发起对该领地的挑战吗？\n\t#G当前没有任何帮会发起对该领地的挑战!"
		end
	end

    StartTalkTask(varMap)
    TalkAppendString(varMap, varMsg);
    TalkAppendButton(varMap,x300919_var_FileId,"确定..",3,nLairdMapId);
    StopTalkTask(varMap)
    DeliverTalkMenu(varMap,varPlayer,varTalknpc)

    return 1
end

function x300919_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end




function x300919_ProcAccept( varMap, varPlayer )
end




function x300919_ProcLairdBattleSignupResult( varMap,varPlayer,nResult,nLiardMapId,nGuildA, nGuildB,nSignupCount,nHasLaird,nMapSignuped)

	local varTalknpc = GetPlayerRuntimeData(varMap,varPlayer,RD_COMMON_NPCID)
	
	if nResult == 0 then

		local strMsg = ""
		if nSignupCount > 0 then
        	strMsg = format("#Y【国家】领地争夺战报名#W#r\t恭喜本帮会完成报名【国家】领地争夺战，目前为止已有%d个帮会报名参加。",nSignupCount)
        	strMsg1= format("恭喜本帮会完成报名领地争夺战，目前为止已有%d个帮会报名参加。",nSignupCount)
        else
        	strMsg = "#Y【国家】领地争夺战报名#W#r\t恭喜本帮会完成报名【国家】领地争夺战，目前除了本帮会还没有其他帮会报名参加。"
        	strMsg1= "恭喜本帮会完成报名领地争夺战，目前除了本帮会还没有其他帮会报名参加。"
        end
	
    	local nGuildId = GetGuildID(varMap,varPlayer )        
       
        LuaAllScenceM2Guild(varMap,strMsg1,nGuildId,3,1)
        LuaAllScenceM2Guild(varMap,strMsg1,nGuildId,2,1)
		LuaAllScenceM2Guild(varMap,strMsg1,nGuildId,6,1)

        StartTalkTask(varMap)
		TalkAppendString(varMap, strMsg);
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
    	
    elseif nResult == 300 then
    	
    	
    	StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】领地争夺战报名#W#r\t申请失败，很抱歉，请在每周六的13：00~15：00之间申请领地争夺战。");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		
    elseif nResult == 301 then
    
    	
        
        
    elseif nResult == 302 then
    	
    	
    	StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】领地争夺战报名#W#r\t很抱歉，您已经完成申请了一块领地的争夺，目前正在受理中，无法再次申请对其它领地的争夺。");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		
    elseif nResult == 303 then
    	
    	
    	StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】领地争夺战报名#W#r\t申请失败，必须有帮会才能申请挑战领地之主！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
    	
    elseif nResult == 304 then
    
    	
    	StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】领地争夺战报名#W#r\t申请失败，帮会等级不足2级！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
    	
    elseif nResult == 305 then
    
    	
    	StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】领地争夺战报名#W#r\t申请失败，必须是帮主才可以申请！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
    	
    elseif nResult == 306 then
    	
    	
    	StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】领地争夺战报名#W#r\t申请失败，帮会成员不足30人！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
    	
    elseif nResult == 307 then
    
    	
    	StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】领地争夺战报名#W#r\t申请失败，不能是朱雀帮！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
    	
    elseif nResult == 308 then
    
    	
    	StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】领地争夺战报名#W#r\t申请失败，不能是青龙帮！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
    	
    elseif nResult == 309 then
    	
    	
    	StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】领地争夺战报名#W#r\t申请失败，不能是国王帮！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		
	elseif nResult == 310 then
	
		
		local nCountryId = GetSceneLairdCountryId(nLiardMapId)
		local nSelfCountryId = GetCurCountry(varMap,varPlayer)
		if nCountryId >= 0 and nCountryId <= 3 then
			if nCountryId == nSelfCountryId then
				
		    	StartTalkTask(varMap)
				TalkAppendString(varMap, "#Y【国家】领地争夺战报名#W#r\t申请失败，您报名的领地已经被本国占领！");
				StopTalkTask(varMap)
				DeliverTalkMenu(varMap,varPlayer,varTalknpc)
				return
			end
		end

		
    	StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】领地争夺战报名#W#r\t申请失败，帮会实力不足！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
			
	
	elseif nResult == 311 then
		
		
    	StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】领地争夺战报名#W#r\t申请失败，报名已经结束！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		
	elseif nResult == 312 then
	
		
    	StartTalkTask(varMap)
    	local strMapSignedup = x300919_GetLairdMapNameByID(varMap,nMapSignuped)
		TalkAppendString(varMap, format("#Y【国家】领地争夺战报名#W#r\t申请失败，已经报名了%s领地的争夺",strMapSignedup));
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		
	elseif nResult == 313 then
	
		
		local nGuidID = GetGuildID(varMap,varPlayer)
		if nGuidID < 0 then
			return
		end
		
		
		local nGuildLairdMapId = GetGuildLairdSceneId(nGuidID)		
		local nLairdSceneCount = x300919_GetLairdSceneCount(varMap)
    	StartTalkTask(varMap)
    	for varI=1,nLairdSceneCount do
			local nRetNpcGUID,nRetLairdScene,strRetLairdSceneName,nRetLevel,nRetFlag0,nRetFlag1 = x300919_GetLairdSceneInfo(varMap,varI)
			if nGuildLairdMapId == nRetLairdScene then	
				
				StartTalkTask(varMap)
				TalkAppendString(varMap, format("#Y【国家】领地争夺战报名#W#r\t已是%s领主，无法报名参加领地争夺战",strRetLairdSceneName));
				StopTalkTask(varMap)
				DeliverTalkMenu(varMap,varPlayer,varTalknpc)
				break
			end
		end
	elseif  nResult == 314  then
    	StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】领地争夺战报名#W#r\t申请失败，据点所在国和报名者所属国家是盟国！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
    else
    
    	
    	StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】领地争夺战报名#W#r\t申请失败，未知原因，可能领地争夺战申请数已达上限！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
    end

    return 1

end





function x300919_ProcQueryCurrentGuild(varMap,varPlayer,nLairdMapId,nGuildA,nGuildB,varCount,nHasLaird,nMapSignuped)


	
	local varTalknpc = GetPlayerRuntimeData(varMap,varPlayer,RD_COMMON_NPCID)
	local nNpcGUID = GetMonsterGUID(varMap,varTalknpc)
	local strLairdSceneName = ""
	local bFind = 0
	local nLairdSceneCount = x300919_GetLairdSceneCount(varMap)
	for varI=1,nLairdSceneCount do
		local nRetNpcGUID,nRetLairdScene,strRetLairdSceneName,nRetLevel,nRetFlag0,nRetFlag1 = x300919_GetLairdSceneInfo(varMap,varI)
		if nRetNpcGUID == nNpcGUID and nRetLairdScene == nLairdMapId then
			strLairdSceneName = strRetLairdSceneName
			bFind = 1
			break
		end
	end
	
	
	if bFind == 0 then
		return
	end
	
	
	local varMsg = ""
	if nHasLaird ~= 1 then
		
		
		if nGuildA >= 0 and nGuildB >= 0 then
			
			
			local strGuildA = GetGuildName( nGuildA )
			local strGuildB = GetGuildName( nGuildB )
			varMsg = format("#Y【国家】领地争夺战查询#W#r#R\t#G当前已发起对【领地】%s的争夺并且实力最强帮会分别为:#r#c0000FF%s#r%s",strLairdSceneName,strGuildA,strGuildB)
			
		elseif nGuildA >= 0 and nGuildB < 0 then
			
			local strGuildA = GetGuildName( nGuildA )
			varMsg = format("#Y【国家】领地争夺战查询#W#r#R\t#G当前已发起对【领地】%s的争夺并且实力最强帮会为:#r#c0000FF%s",strLairdSceneName,strGuildA)
		else
			
			varMsg = format("#Y【国家】领地争夺战查询#W#r\t#G目前没有任何帮会发起对【领地】%s的争夺!",strLairdSceneName)
		end
		
	else
		
		if nGuildB >= 0 then
			
			
			local strGuildA = GetGuildName( nGuildA )
			local strGuildB = GetGuildName( nGuildB )
			varMsg = format("#Y【国家】领地争夺战查询#W#r#R\t目前占据该领地的帮会是:%s,#G当前已发起对该领地的挑战并且实力最强帮会为:#r#c0000FF%s",strGuildA,strGuildB)
			
		else
			local strGuildA = GetGuildName( nGuildA )
			
			varMsg = format("#Y【国家】领地争夺战查询#W#r#R\t目前占据该领地的帮会是:%s,没有其他帮会发起对该领地的挑战!",strGuildA)
		end
	end

    StartTalkTask(varMap)
    TalkAppendString(varMap, varMsg);
    StopTalkTask(varMap)
    DeliverTalkMenu(varMap,varPlayer,varTalknpc)

    return 1
    	
end




function x300919_ProcSignupInstead(varMap,nLairdMapId,nGuildA,nGuildB)
	
	local strGuildB = GetGuildName(nGuildB)
	local varMsg = format("#R本帮对领地争夺战的报名被%s帮会顶掉了",strGuildB)  
            	
	LuaThisScenceM2Guild(varMap,varMsg,nGuildA,3,1)
	LuaThisScenceM2Guild(varMap,varMsg,nGuildA,2,1)
end




function x300919_ProcPlayerAidSignupQuery(varMap,varPlayer,varRet)
	
	local varMsg = "未知错误,外援邀请失败"
	if varRet == 0 then
		
		varMsg = "已经发送邀请."
	elseif varRet == 1 then
		
		varMsg = "您邀请的外援不线上或不存在."
	elseif varRet == 2 then
		
		varMsg = "您邀请的外援必须是本国玩家"
	elseif varRet == 3 then
		
		varMsg = "您邀请的外援等级不够"
	elseif varRet == 4 then
		
		varMsg = "您邀请的外援没有帮会"
	elseif varRet == 5 then
		
		varMsg = "很抱歉，不能邀请本帮会成员"
	elseif varRet == 6 then
		
		varMsg = "您只能邀请国王帮或是守护帮成员参加领地争夺战"
	elseif varRet == 7 then
		
		varMsg = "您邀请的目标玩家已经顺利接受您的邀请"
	elseif varRet == 8 then
		
		varMsg = "您邀请的外援已被其它的帮会邀请"
	elseif varRet == 9 then
		
		varMsg = "外援名额已满，不能继续邀请"
	elseif varRet == 10 then
		
		varMsg = "您邀请的外援所在帮会已报名参加领地争夺战"
	elseif varRet == 11 then
		
		varMsg = "很抱歉，您没有帮会，不能进行邀请"
	elseif varRet == 12 then
		
		varMsg = "很抱歉，您不是帮主，不能进行邀请操作"
	elseif varRet == 13 then
		
		varMsg = "很抱歉，您的帮会尚未报名参加领地争夺战"
	end
	
	
	Msg2Player(varMap, varPlayer, varMsg, 8, 2)
	Msg2Player(varMap, varPlayer, varMsg, 8, 3)
	
end





function x300919_ProcPlayerAidSignupExecute(varMap,varPlayer,varRet)
	
	local varMsg = "未知错误,外援邀请失败"
	if varRet == 0 then
		
		varMsg = "接受完成."
	elseif varRet == 1 then
		
		varMsg = "加入失败,邀请的外援不线上或是没找到."
	elseif varRet == 2 then
		
		varMsg = "加入失败,必须邀请同国玩家"
	elseif varRet == 3 then
		
		varMsg = "加入失败,等级不够"
	elseif varRet == 4 then
		
		varMsg = "加入失败,没有帮会"
	elseif varRet == 5 then
		
		varMsg = "加入失败,外援为本帮会成员"
	elseif varRet == 6 then
		
		varMsg = "加入失败,只有国王帮或是守护帮的成员才可以成为外援"
	elseif varRet == 7 then
		
		varMsg = "加入失败,您已经接受该帮会的邀请"
	elseif varRet == 8 then
		
		varMsg = "加入失败,您已经加入其它帮会的外援邀请，请放弃再继续接受邀请"
	elseif varRet == 9 then
		
		varMsg = "加入失败,邀请您的帮会外援邀请名额已满"
	elseif varRet == 13 then
		
		varMsg = "加入失败,邀请您的帮会没有参加领地争夺战"
	end
	
	
	Msg2Player(varMap, varPlayer, varMsg, 8, 2)
	Msg2Player(varMap, varPlayer, varMsg, 8, 3)
	
end




function x300919_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end




function x300919_ProcAccept( varMap, varPlayer )
end




function x300919_ProcQuestAbandon( varMap, varPlayer, varQuest )
end




function x300919_ProcContinue( varMap, varPlayer, varTalknpc )
end




function x300919_CheckSubmit( varMap, varPlayer )
end




function x300919_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end




function x300919_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end




function x300919_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x300919_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
