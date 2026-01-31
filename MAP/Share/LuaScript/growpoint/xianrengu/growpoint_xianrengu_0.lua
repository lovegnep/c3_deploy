
--DECLARE_QUEST_INFO_START--
x300825_var_GatherPointTypeId = 900 
x300825_var_ItemId = 13810412 
x300825_var_BufIndex = 7600
x300825_var_GroupPoint	=	{ {type=10,varId =900,target = "丹木"}}
--DECLARE_QUEST_INFO_STOP--

x300825_var_GrowpointPos = {
							{posx1=69, posz1=88,posx2=10, posz2=16,posx3=84, posz3=61,posx4 = 84, posz4 = 61,posx5 = 84, posz5 = 61,},
							{posx1=88, posz1=31,posx2=14, posz2=97,posx3=72, posz3=106,posx4 = 84, posz4 = 61,posx5 = 84, posz5 = 61,},
							{posx1=84, posz1=61,posx2=21, posz2=24,posx3=29, posz3=107,posx4 = 44, posz4 = 68,posx5 = 45, posz5 = 40,},							
		}


function 	x300825_ProcGpCreate(varMap,varGpType,varX,varY)
	
	local varBoxId = ItemBoxEnterScene(varX, varY, x300825_var_GatherPointTypeId, varMap, 0, x300825_var_ItemId)
	SetGrowPointObjID(varMap,x300825_var_GatherPointTypeId,varX, varY,varBoxId)
end




function	 x300825_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return x300825_ProcGpOpenItemBox(varMap, varPlayer, varTalknpc, x300825_var_GatherPointTypeId, x300825_var_ItemId)
	
end




function	 x300825_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return   x300825_ProcGuildRecycle( varMap, varPlayer, varTalknpc, x300825_var_GatherPointTypeId, x300825_var_ItemId )
	
end





function	x300825_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end




function	x300825_OpenCheck(varMap,varPlayer,AbilityId,AblityLevel)
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, -1 )
end





function x300825_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )

	local varQuest, varNeedItemCount, varCollNum = GetItemIdInItemBoxNM( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	
	if varQuest == -1 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"您没有任务收集丹木,无法采集")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 1 
	end

	
	if IsQuestHaveDoneNM( varMap, varPlayer, varQuest ) > 0 then 
		return 1
	end

	if IsHaveQuestNM( varMap, varPlayer, varQuest ) == 0 then	
		StartTalkTask(varMap)
		TalkAppendString(varMap,"您没有这个任务")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 1
	end
	
	local varLevel = GetLevel(varMap,varPlayer)
	if varLevel < 96 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"您的等级过低")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,"很抱歉，您的等级高于本地图，请去更高等级的地图完成任务。",8,2)
	return 1
	end

	local varItemCountNow = GetItemCount( varMap, varPlayer, varNeedItem )
	if varItemCountNow >= varNeedItemCount then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"物品已经收集齐全")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 1
	end

	return 0
end


function x300825_ProcGuildRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )

	local varQuest, varNeedItemCount, varCollNum = GetItemIdInItemBoxNM( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	if varQuest == -1 then
		return 0 
	end

	
	if IsQuestHaveDoneNM( varMap, varPlayer, varQuest ) > 0 then 
		return 0
	end

	if IsHaveQuestNM( varMap, varPlayer, varQuest ) == 0 then	
		return 0
	end

	local varItemCountNow = GetItemCount( varMap, varPlayer, varNeedItem )
	if varItemCountNow >= varNeedItemCount then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"物品已经收集齐全")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 0
	end

	
--	local varRet = random(115,1160)   
--
--	if varRet <= 10 then
--		 
--		local varX = GetItemBoxWorldPosX(varMap,varTalknpc)
--		local z = GetItemBoxWorldPosZ(varMap,varTalknpc)
--   		CreateMonster(varMap,9562, varX, z, 16,50, -1,13079463,21,1000 * 60 *3 )
--		StartTalkTask(varMap);TalkAppendString( varMap, "丹木变成怪物对你进行攻击");StopTalkTask( varMap );DeliverTalkTips( varMap, varPlayer )
--		return 1
--	
--	    
--		
--	    
--		
--	    
--	elseif varRet <= 65 then
--  		
--        AddExp(varMap, varPlayer,10000)
--		StartTalkTask(varMap);TalkAppendString( varMap, "丹木逃走，得到10000点经验");StopTalkTask( varMap );DeliverTalkTips( varMap, varPlayer )
--	    return 1
-- 	elseif varRet <= 115 then
--        
--		local varRet = SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x300825_var_BufIndex, 0);
--        SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x300825_var_BufIndex, 0);
--		StartTalkTask(varMap);TalkAppendString( varMap, "丹木逃走，给你留下了点好处");StopTalkTask( varMap );DeliverTalkTips( varMap, varPlayer )
-- 	    return 1
--   	
-- 	    
--		
--	    
--	    
--			
--				
--				
--			
--				
--				
--				
--			
--				
--				
--				
--				
--				
--			
-- 	    
--	end

	
	local varItemAdd = varNeedItemCount - varItemCountNow
	if varCollNum == -1 then
		varItemAdd = 1
	else
		if varItemAdd > varCollNum then
			varItemAdd = varCollNum
		end
	end
	if varItemAdd > 1 then
		varItemAdd = random(varItemAdd)
		if varItemAdd == 0 then
			varItemAdd = 1
		end
	end

	StartItemTask( varMap )
	ItemAppend( varMap, varNeedItem, varItemAdd )
	local varRet = StopItemTask( varMap, varPlayer )
	if varRet > 0 then
		DeliverItemListSendToPlayer(varMap,varPlayer)
		return 1
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"无法得到采集物品，请整理道具栏！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 0
	end

end



