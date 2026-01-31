






x300341_var_FileId = 300341




x300341_var_Buf1 = 7210
x300341_var_Buf2 = -1 


x300341_var_QuestId = 8051

x300341_var_MP_PosX               = 2

x300341_var_MP_PosZ               = 3

x300341_var_MP_UseTime            = 4

x300341_var_MP_TargetScene        = 5




function x300341_ProcEventEntry( varMap, varPlayer, varBagIdx)

end






function x300341_ProcIsSpellLikeScript( varMap, varPlayer)
    
	return 1; 
end






function x300341_ProcCancelImpacts( varMap, varPlayer)
    
	return 0; 
end






function x300341_ProcConditionCheck( varMap, varPlayer)
	
	if( 1 ~= VerifyUsedItem( varMap, varPlayer) ) then
		return 0
	end

	
    if IsHaveQuestNM( varMap, varPlayer, x300341_var_QuestId) == 0 then	
		StartTalkTask( varMap)
		TalkAppendString( varMap, "你没有接受“草原三宝”任务，不能使用此道具" )
		StopTalkTask()
		DeliverTalkTips( varMap, varPlayer)
        return 0
    end

	
    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300341_var_QuestId)
    local questScene = GetQuestParam( varMap, varPlayer, varQuestIdx, x300341_var_MP_TargetScene)
    if varMap ~= questScene then
        local baseScene = ( GetCurCountry( varMap, varPlayer) ) * 100 + 50
        questScene = questScene - baseScene
        local varStr = "在这里使用也没有效果，还是留到迷宫里面用吧"
        if questScene == 36 then
            varStr = "在这里使用也没有效果，还是留到@npcsp_温泉谷_82004用吧"
        elseif questScene == 37 then
            varStr = "在这里使用也没有效果，还是留到@npcsp_风陵山_82005用吧"
        elseif questScene == 39 then
            varStr = "在这里使用也没有效果，还是留到@npcsp_黄叶林_82006用吧"
        end

		StartTalkTask( varMap)
		TalkAppendString( varMap, varStr)
		StopTalkTask()
		DeliverTalkTips( varMap, varPlayer)
		return 0
    end

	return 1
end







function x300341_ProcDeplete( varMap, varPlayer)
	if DepletingUsedItem( varMap, varPlayer) == 1 then
		return 1;
	end
	return 0;
end








function x300341_ProcActivateOnce( varMap, varPlayer)
    
	
		
	

    
    local varX, z = GetWorldPos( varMap, varPlayer)
    local varObj = CreateMonster( varMap, 3120, varX, z, 0, 0, -1, -1, 20, 180000)

    
    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300341_var_QuestId)
    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300341_var_MP_PosX, varX)
    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300341_var_MP_PosZ, z)
    
    local curTime = GetCurrentTime()
    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300341_var_MP_UseTime, curTime)

    
    StartTalkTask( varMap)
    TalkAppendString( varMap, "附近的生物都受了炉香引诱，看来从他们身上更容易获得珍宝吧" )
    StopTalkTask( varMap)
    DeliverTalkTips( varMap, varPlayer)

	return 1;
end







function x300341_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
