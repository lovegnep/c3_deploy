x300339_var_FileId  = 300339
x300339_var_Buf1   = -1 
x300339_var_Buf2   = -1 

x300339_var_QuestId 	= -1			
x300339_var_ItemId 		= 12030107		
x300339_var_FileId 		= 300339		

x300339_var_UseSceneID1	= 50			
x300339_var_UseSceneID2	= 150			
x300339_var_UseSceneID3	= 250			
x300339_var_UseSceneID4	= 350			
x300339_var_UsePosX		= 198			
x300339_var_UsePosZ		= 46


x300339_var_CreateMonsterID	= 9560;		
x300339_var_MonsterPos	= {{varX = 185, z = 49},
						   {varX = 184, z = 57},
						   {varX = 190, z = 63},
						   {varX = 198, z = 64},
						   {varX = 205, z = 63},
						   {varX = 214, z = 49},
						   {varX = 214, z = 36},
						   {varX = 201, z = 30},
						   {varX = 190, z = 31},
						   {varX = 187, z = 41}}
						   
x300339_var_GiveItemID	= 12110206;		
x300339_var_GiveExp		= 1000;			
x300339_var_ItemID 				= 12035016    --黄金藏宝图（坐骑）
x300339_var_ItemID1 			= 12035041    --黄金藏宝图（宝石）
x300339_var_ItemID2 			= 12035042    --黄金藏宝图（洗石剂）
x300339_var_ItemID3 			= 12035043    --黄金藏宝图（外装）
x300339_var_ItemID4 			= 12035044    --黄金藏宝图（外装）

x300339_var_ItemScriptID	= 0;		
x300339_var_ItemQuestID	= 0;	

x300339_var_GiveScriptID	= 300337;		
x300339_var_GiveQuestID	= 8046;			
x300339_var_GiveScriptID1	= 300338;		
x300339_var_GiveQuestID1	= 8047;	
		
x300339_var_GiveScriptID2	= 300343;		
x300339_var_GiveQuestID2	= 8048;			
x300339_var_GiveScriptID3	= 300344;		
x300339_var_GiveQuestID13	= 8049;	
x300339_var_GiveQuesttable = {
[x300339_var_ItemID] = {
							{ScriptID =300337 ,QuestID = 8046 },
							{ScriptID =300338 ,QuestID = 8047 },
							},
[x300339_var_ItemID1] = {
							{ScriptID =300343 ,QuestID = 8048 },
							{ScriptID =300344 ,QuestID = 8049 },
							},
[x300339_var_ItemID2] = {
							{ScriptID =300345 ,QuestID = 8099 },
							{ScriptID =300346 ,QuestID = 8100 },
							},
[x300339_var_ItemID3] = {
							{ScriptID =310060 ,QuestID = 8101 },
							{ScriptID =310061 ,QuestID = 8102 },
							},	
[x300339_var_ItemID4] = {
							{ScriptID =310063 ,QuestID = 8103 },
							{ScriptID =310064 ,QuestID = 8104 },
							},															
}



function x300339_ProcEventEntry( varMap, varPlayer, varBagIdx )

		local ItemID,bind =	x300339_GetItemid( varMap , varPlayer , varBagIdx )
		
		if ItemID == nil then
			return
		end
					
    local playerLevel = GetLevel( varMap, varPlayer)
    if playerLevel < 20 then
        StartTalkTask( varMap)
        TalkAppendString( varMap,"你的等级太低，还无法领悟藏宝图的奥秘" )
        StopTalkTask( varMap)
        DeliverTalkTips( varMap, varPlayer)
        Msg2Player( varMap, varPlayer, "你的等级太低，还无法领悟藏宝图的奥秘！", 8, 2)
        return 0;
    end
    
		for i , item in x300339_var_GiveQuesttable do
  		if ItemID == i then
  			for j,k in item do 
  				if IsHaveQuestNM( varMap, varPlayer, k.QuestID) > 0 then 
  					Msg2Player( varMap, varPlayer, "你已经有这种藏宝图任务了，无法重复领取！", 8, 3)   
  					Msg2Player( varMap, varPlayer, "你已经有这种藏宝图任务了，无法重复领取！", 8, 2)    
  					return 0
  				end
  			end
  		end
  	end              
--	local varX,z = GetWorldPos( varMap, varPlayer)
--    local varHaveQuest	= IsHaveQuestNM( varMap, varPlayer, x300339_var_GiveQuestID)
--    local bHaveQuest1	= IsHaveQuestNM( varMap, varPlayer, x300339_var_GiveQuestID1)
--    if( varHaveQuest > 0) or ( bHaveQuest1 > 0) then
--        StartTalkTask( varMap)
--        TalkAppendString( varMap,"你已经有藏宝图任务了，无法重复领取！" )
--        StopTalkTask( varMap)
--        DeliverTalkTips( varMap, varPlayer)
--        Msg2Player( varMap, varPlayer, "你已经有藏宝图任务了，无法重复领取！", 8, 2)
--        return 0;
--    end

    if IsQuestFullNM( varMap, varPlayer) == 1 then
        Msg2Player( varMap, varPlayer, "任务已满，任务接受失败", 8, 3)
        return 0
    end
                                                                                   
		--if IsItemBind(varMap,varPlayer,varBagIdx) == 0 then	
    	if DelItemByIndexInBag( varMap, varPlayer, varBagIdx, 1) == 0 then
    	    Msg2Player( varMap, varPlayer, "打开藏宝图发生异常，无法查看其奥秘", 8, 3)
    	    return 0
    	end    
    	

			for i , item in x300339_var_GiveQuesttable do 
				if ItemID == i then
					if bind == 0 then
						x300339_var_ItemScriptID = item[1].ScriptID
						x300339_var_ItemQuestID  = item[1].QuestID
					elseif bind == 1 then
						x300339_var_ItemScriptID = item[2].ScriptID
						x300339_var_ItemQuestID  = item[2].QuestID
					end
				end
			end	
    	
    	if LuaCallNoclosure( x300339_var_ItemScriptID, "ProcForceAddQuest", varMap, varPlayer, -1, x300339_var_ItemQuestID ) > 0 then		
		--	x300339_UpdateTopList(varMap, varPlayer)
    	end
--		else 
--    	if DelItemByIndexInBag( varMap, varPlayer, varBagIdx, 1) == 0 then
--    	    Msg2Player( varMap, varPlayer, "打开藏宝图发生异常，无法查看其奥秘", 8, 3)
--    	    return 0
--    	end    	
--    	
--    	if LuaCallNoclosure( x300339_var_GiveScriptID1, "ProcForceAddQuest", varMap, varPlayer, -1, x300339_var_GiveQuestID1 ) > 0 then		
--		--	x300339_UpdateTopList(varMap, varPlayer)
--    	end
--    		   
--    end
    	
    return 1;
end

--function x300339_UpdateTopList(varMap,varPlayer)
--
--	local varLastday = GetPlayerGameData( varMap, varPlayer, MD_BAOZANG_DAY[1], MD_BAOZANG_DAY[2], MD_BAOZANG_DAY[3] )
--	local curCount = GetPlayerGameData( varMap, varPlayer, MD_BAOZANG_COUNT[1], MD_BAOZANG_COUNT[2], MD_BAOZANG_COUNT[3] )
--	local curday = GetWeekFirstDay()
--	if varLastday ~= curday then
--		curCount = 0
--	end
--	curCount = curCount + 1
--	SetPlayerGameData( varMap, varPlayer, MD_BAOZANG_COUNT[1], MD_BAOZANG_COUNT[2], MD_BAOZANG_COUNT[3], curCount )
--	SetPlayerGameData( varMap, varPlayer, MD_BAOZANG_DAY[1], MD_BAOZANG_DAY[2], MD_BAOZANG_DAY[3], curday )
--	
--	SendToplistKeyValue2GL(varMap, varPlayer, BAOZANG_TOPLIST, curCount)
--	
--end

function x300339_ProcIsSpellLikeScript( varMap, varPlayer)
 
	return 0; 
	
	
end

function x300339_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x300339_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x300339_ProcDeplete( varMap, varPlayer )
	if DepletingUsedItem(varMap, varPlayer) == 1 then
		return 1;
	end
	return 0
end

function x300339_ProcActivateOnce( varMap, varPlayer )
end

function x300339_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end

function x300339_GetItemid( varMap , varPlayer , varBagIdx  )

	
	if ( varBagIdx == nil ) then
		return nil
	end
	
	local itemid = GetItemIDByIndexInBag( varMap , varPlayer , varBagIdx );
	
	local bind   = IsItemBind(varMap,varPlayer,varBagIdx)
	
	if ( itemid == nil ) then
		return nil
	end
	
	return itemid , bind
end
