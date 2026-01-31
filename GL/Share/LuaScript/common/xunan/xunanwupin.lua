x300752_var_FileId  = 300752
x300752_var_Buf1   = -1 
x300752_var_Buf2   = -1 

x300752_var_QuestId 	= -1			
x300752_var_ItemId 		= 12030107		
x300752_var_FileId 		= 300752		

x300752_var_UseSceneID1	= 50			
x300752_var_UseSceneID2	= 150			
x300752_var_UseSceneID3	= 250			
x300752_var_UseSceneID4	= 350			
x300752_var_UsePosX		= 198			
x300752_var_UsePosZ		= 46


x300752_var_CreateMonsterID	= 9560;		
x300752_var_MonsterPos	= {{varX = 185, z = 49},
						   {varX = 184, z = 57},
						   {varX = 190, z = 63},
						   {varX = 198, z = 64},
						   {varX = 205, z = 63},
						   {varX = 214, z = 49},
						   {varX = 214, z = 36},
						   {varX = 201, z = 30},
						   {varX = 190, z = 31},
						   {varX = 187, z = 41}}
						   
x300752_var_GiveItemID	= 12110206;		
x300752_var_GiveExp		= 1000;			
x300752_var_GiveScriptID	= 300330;		
x300752_var_GiveQuestID	= 8050;			
x300752_var_GiveScriptID1	= 300336;		
x300752_var_GiveQuestID1	= 8051;			




function x300752_ProcEventEntry( varMap, varPlayer, varBagIdx )

    local playerLevel = GetLevel( varMap, varPlayer)
    if playerLevel < 20 then
        StartTalkTask( varMap)
        TalkAppendString( varMap,"你的等级太低，还无法领悟藏宝图的奥秘" )
        StopTalkTask( varMap)
        DeliverTalkTips( varMap, varPlayer)
        Msg2Player( varMap, varPlayer, "你的等级太低，还无法领悟藏宝图的奥秘！", 8, 2)
        return 0;
    end

    
	local varX,z = GetWorldPos( varMap, varPlayer)
    local varHaveQuest	= IsHaveQuestNM( varMap, varPlayer, x300752_var_GiveQuestID)
    local bHaveQuest1	= IsHaveQuestNM( varMap, varPlayer, x300752_var_GiveQuestID1)
    if( varHaveQuest > 0) or ( bHaveQuest1 > 0) then
        StartTalkTask( varMap)
        TalkAppendString( varMap,"你已经有藏宝图任务了，无法重复领取！" )
        StopTalkTask( varMap)
        DeliverTalkTips( varMap, varPlayer)
        Msg2Player( varMap, varPlayer, "你已经有藏宝图任务了，无法重复领取！", 8, 2)
        return 0;
    end

    if IsQuestFullNM( varMap, varPlayer) == 1 then
        Msg2Player( varMap, varPlayer, "任务已满，任务接受失败", 8, 3)
        return 0
    end
                                                                                   
		if IsItemBind(varMap,varPlayer,varBagIdx) == 0 then	
    	if DelItemByIndexInBag( varMap, varPlayer, varBagIdx, 1) == 0 then
    	    Msg2Player( varMap, varPlayer, "打开藏宝图发生异常，无法查看其奥秘", 8, 3)
    	    return 0
    	end    	
    	
    	if LuaCallNoclosure( x300752_var_GiveScriptID, "ProcForceAddQuest", varMap, varPlayer, -1, x300752_var_GiveQuestID ) > 0 then		
			x300752_UpdateTopList(varMap, varPlayer)
    	end
		else 
    	if DelItemByIndexInBag( varMap, varPlayer, varBagIdx, 1) == 0 then
    	    Msg2Player( varMap, varPlayer, "打开藏宝图发生异常，无法查看其奥秘", 8, 3)
    	    return 0
    	end    	
    	
    	if LuaCallNoclosure( x300752_var_GiveScriptID1, "ProcForceAddQuest", varMap, varPlayer, -1, x300752_var_GiveQuestID1 ) > 0 then		
			x300752_UpdateTopList(varMap, varPlayer)
    	end
    		   
    end
    	
    return 1;
end

function x300752_UpdateTopList(varMap,varPlayer)

	local varLastday = GetPlayerGameData( varMap, varPlayer, MD_BAOZANG_DAY[1], MD_BAOZANG_DAY[2], MD_BAOZANG_DAY[3] )
	local curCount = GetPlayerGameData( varMap, varPlayer, MD_BAOZANG_COUNT[1], MD_BAOZANG_COUNT[2], MD_BAOZANG_COUNT[3] )
	local curday = GetWeekFirstDay()
	if varLastday ~= curday then
		curCount = 0
	end
	curCount = curCount + 1
	SetPlayerGameData( varMap, varPlayer, MD_BAOZANG_COUNT[1], MD_BAOZANG_COUNT[2], MD_BAOZANG_COUNT[3], curCount )
	SetPlayerGameData( varMap, varPlayer, MD_BAOZANG_DAY[1], MD_BAOZANG_DAY[2], MD_BAOZANG_DAY[3], curday )
	
	SendToplistKeyValue2GL(varMap, varPlayer, BAOZANG_TOPLIST, curCount)
	
end

function x300752_ProcIsSpellLikeScript( varMap, varPlayer)
 
	return 0; 
	
	
end

function x300752_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x300752_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x300752_ProcDeplete( varMap, varPlayer )
	if DepletingUsedItem(varMap, varPlayer) == 1 then
		return 1;
	end
	return 0
end

function x300752_ProcActivateOnce( varMap, varPlayer )
end

function x300752_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end

